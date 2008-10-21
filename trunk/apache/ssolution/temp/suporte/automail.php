<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

error_reporting(0); //stop moaning about the warnings and notices
set_time_limit(0); //we don't want to time out too early now...
//error_reporting(E_ALL); ini_set("display_errors", 1); //debug only

require_once('init.php');
if (isset($config['nosubject'])) { $nosubject=$config['nosubject']; }
if (!isset($nosubject)) { $nosubject='[No Subject]'; }
if (isset($config['ticket_format'])) { $ticket_format=$config['ticket_format']; }
if (!isset($ticket_format)) { $ticket_format='\[#([0-9]{6})\]'; }
if (isset($config['charset'])) { $charset=$config['charset']; }
if (!isset($charset)) { $charset='UTF-8'; }

function get_mime_type(&$structure) {
	$primary_mime_type = array('TEXT', 'MULTIPART', 'MESSAGE', 'APPLICATION', 'AUDIO', 'IMAGE', 'VIDEO', 'OTHER');
	
	if($structure->subtype) {
		return $primary_mime_type[(int) $structure->type] . '/' . $structure->subtype;
	}
	return 'TEXT/PLAIN';
}

function get_part($stream, $msg_number, $mime_type, $structure = false, $part_number = false) {
	global $charset;
	if (empty($structure)) { $structure = imap_fetchstructure($stream, $msg_number); }
	if (!empty($structure)) {
		if ($mime_type == get_mime_type($structure)) {
			if (!$part_number) { $part_number = 1; }
			$text = imap_fetchbody($stream, $msg_number, $part_number);
			if ($structure->encoding == 3) { $body = imap_base64($text); }
			elseif ($structure->encoding == 4) { $body = imap_qprint($text); }
			else { $body = $text; }
			if ($structure->ifparameters) {
				foreach ($structure->parameters as $it) {
					if (strtolower($it->attribute) == 'charset') {
						//$body = mb_convert_encoding($body, $charset, strtolower($it->value));
						$body = iconv(strtoupper($it->value), $charset, $body);
					}
				}
			}
			//if (get_mime_type($structure) == 'TEXT/PLAIN') { $body=htmlspecialchars($body); } //we don't need this as it's done via the PostMessage instead
			if (get_mime_type($structure) == 'TEXT/HTML') { $body=strip_tags($body); $body=html_entity_decode($body); }
			return $body;
		}
		if($structure->type == 1) { /* multipart */
			while (list($index, $sub_structure) = each($structure->parts)) {
				if ($part_number) { $prefix = $part_number.'.'; }
				else { $prefix=''; }
				$data = get_part($stream, $msg_number, $mime_type, $sub_structure, $prefix.($index + 1));
				if (!empty($data)) { return $data; }
			}
		}
	}
	return false;
}

function decode_mime_text($text,$charset='UTF-8') {
	$decoded = imap_mime_header_decode($text);
	$text = '';
	for ($i = 0; $i < count($decoded); $i++) {
		$str=$decoded[$i]->text;
		if ($decoded[$i]->charset != 'default') { $str=iconv($decoded[$i]->charset, $charset, $str); }
		$text .= $str;
	}
	return $text;
}

if (!function_exists('imap_open')) { $err = LANG_ERROR_IMAP; }

if (empty($err)) {

	$cat_res = mysql_query("SELECT * FROM ".$db_table['categories']);

	// banlist MOD - START(part 1 - load banlist)
    $banlist = array();
    $ban_res = mysql_query("SELECT * FROM ".$db_table['banlist']);
    while ($ban_row = mysql_fetch_array($ban_res)) {
        $banlist[]=$ban_row['value'];
    }
	// banlist MOD - END

	while ($cat_row = mysql_fetch_array($cat_res)) {
		if ($cat_row['pophost']) {
		
	  $mbox = @imap_open('{'.$cat_row['pophost'].'/pop3}INBOX',$cat_row['popuser'],$cat_row['poppass']);
	  if (!$mbox) { $mbox = @imap_open('{'.$cat_row['pophost'].'/pop3/notls}INBOX',$cat_row['popuser'],$cat_row['poppass']); }
	  if (!$mbox) { $err = LANG_ERROR_UNABLE_TO_OPEN_MAILBOX.' '.$cat_row['name'].': '.imap_last_error(); }
		else {
			$curmsg = 1;
		
			while ($curmsg <= @imap_num_msg($mbox)) {
				$body = get_part($mbox, $curmsg, 'TEXT/PLAIN');
				if (!$body) { $body = get_part($mbox, $curmsg, 'TEXT/HTML'); }
				if (!$body) { $curmsg++; continue; }
				$head = imap_headerinfo($mbox, $curmsg, 800, 800);
		
				$email = $head->reply_toaddress;
				$name='';
				if (strpos($email, '<')) { $email = eregi_replace('.*<(.*)>.*', '\\1', $email); }
				if (preg_match("/^(?:(.*?)[ ]?)?<(.*?)>|(.*?)$/", $head->fromaddress,$matches)) {
					if ($email == '') $email = $matches[2].$matches[3];
					$name=decode_mime_text($matches[1],$charset);
					if (preg_match("/^\".+\"$/i", $name)) $name = substr($name, 1, -1);
				}
				if ($name == '') { $name = $email; }
		        
		        // banlist MOD - START (part 2 - check banlist)
		      $banned=0;
		      foreach ($banlist as $banline) {
		      	if (!empty($banline)) {
							if (stristr($head->fromaddress, $banline)) { $banned=1; }
							if (stristr($head->subject, $banline)) { $banned=1; }
							if (stristr($body, $banline)) { $banned=1; }
						}
		      }
				// If banned, delete message and skip the rest
				if ($banned) {
					@imap_delete($mbox, $curmsg);
					$curmsg++;
					continue;
				}
				// banlist MOD - END
				$subject=decode_mime_text($head->fetchsubject,$charset);
				$subject = !$subject ? $nosubject: $subject;
		
		        $eml_headers = imap_fetchheader($mbox, $curmsg, FT_PREFETCHTEXT);
		        $x_pri = split("\n", $eml_headers);
		        $pri=''; $ip=''; $is_spam=false;
		        foreach ($x_pri as $item) {
		            $arr = split(": ", $item);
		            if (eregi('x-priority', $arr[0])) {
		                if (strstr($arr[1], 1) or strstr($arr[1], 2)) { $pri = 3; }
		                elseif (strstr($arr[1], 4) or strstr($arr[1], 5)) { $pri = 1; }
		            }
		            elseif (eregi('X-Originating-IP', $arr[0])) {
		                $ip = $arr[1];
		                $ip = eregi_replace('\[(.*)\]', '\\1', $ip);
		            }
		            elseif (eregi('X-Spam-Status', $arr[0])) {
		                 if(eregi('^Yes', $arr[1])) { $is_spam = true; }
		            }
		        }
		        if (!$pri) { $pri = 2; }
		        
		        if ($is_spam) {
		            @imap_delete($mbox, $curmsg);
		            $curmsg++;
		            continue;
		        }

		        if ($config['remove_original'] && $config['remove_tag'] && strpos($body, $config['remove_tag'])) {
		            //$lines = split($config['remove_tag'], $body);
		            //$body = $lines[0];
		            preg_match('/(.+?)>? ?'.$config['remove_tag'].'.+/s',$body,$matches);
		            if (!empty($matches[1])) $body=$matches[1];
		        }

					$body = trim($body);
					
		      $c = mysql_fetch_array(mysql_query("SELECT COUNT(*) AS cnt FROM tickets WHERE email='$email' AND status='open'"));
		      if ($c['cnt'] > $config['ticket_max']) {
		
					/*$limit_msg = str_replace('%url', $config['root_url'], $config['limit_msg']);
					$limit_msg = str_replace('%local_email', $cat_row['email'], $limit_msg);
					$limit_msg = str_replace('%user_email', $email, $limit_msg);
					$limit_msg = str_replace('%ticket_max', $config['ticket_max'], $limit_msg);
		            
		      if ($config['limit_response']) { //don't need to send the email AND display the error.
		          mail($email, $config['limit_subj'], $limit_msg, 'From: '.$config['limit_email'],'-f'.$config['limit_email']);
		      }*/
		
					@imap_delete($mbox, $curmsg);
		            $curmsg++;
		            continue;
		      }
					unset($ticket_id); unset($send_notice);
					if (preg_match("/$ticket_format/",$subject,$matches)) {
						$id=trim($matches[1]);
						if (ValidID($id)) { $ticket_id=$id; }
						$send_notice=TRUE;
		    	}
		    	if (empty($ticket_id)) {
		    		$ticket_id=CreateTicket($subject, $name, $email, $cat_row['ID'], '', $pri, $ip, $body);
						$send_notice=FALSE; //a notice is already sent by CreateTicket
					}
		    	
		    	$iid=PostMessage($ticket_id, $body, $eml_headers, $send_notice);
		    	
		    	if (is_dir($config['attachment_dir']) && $config['accept_attachments']) {
		    	$struct = imap_fetchstructure($mbox, $curmsg);
		        for ($i = 0; $q < count($struct->parts); ++$q) {
		            $filename='';
		            $section = $struct->parts[$q];
		
		            $param = $section->dparameters;
		            for ($x = 0; $x <= count($param); ++$x) {
		                if (eregi('filename', $param[$x]->attribute)) {
		                      $filename=decode_mime_text($param[$x]->value,$charset);
		                }
		            }
		            if (!empty($filename)) {
			            $part=imap_fetchbody($mbox, $curmsg, $q+1);
			            $ext=get_ext($filename);
			            $filetypes=explode(';',$config['filetypes']);
			            if (in_array($ext,$filetypes)) {
			                if ($section->encoding == '3') { $part = base64_decode($part); }
			                if ($section->encoding == '4') { $part = quoted_printable_decode($part); }
			                if (!$config['attachment_size'] || ($section->bytes <= $config['attachment_size'])) {
			                	mt_srand(time());
			                	$rand=mt_rand(100000, 999999); //six chars.
			                	$destfile=$rand.'_'.$filename;
			                	$dest=$config['attachment_dir'].$destfile;
			                	$file = fopen($dest, 'w+');
			                	fputs($file, $part);
			                	fclose($file);
			                	$sql ="INSERT INTO ".$db_table['attachments']." (ticket, ref, filename, type) ";
			                	$sql.="VALUES ($ticket_id, $iid, '$rand"."_$filename', 'q')";
			                	mysql_query($sql);
			                }
			            }
		          	}
		        }
		        }
		        
		    	@imap_delete($mbox, $curmsg);
				$curmsg++;
				}
				@imap_expunge($mbox);
				@imap_close($mbox);
			}
		}
	}
}

$is_included=(count(get_included_files()) > 1)?true:false;
if (($is_included === false) && (!empty($err))) {
	die(strip_tags($err));
}

?>
