<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

if(!defined('ISINC')) die('serious error');

require_once('functions.php'); // This file got too big, so I moved general functions into this file

class ticket {
	var $id;
	var $subject;
	var $name;
	var $email;
	var $phone;
	var $status;
	var $rep;
	var $cat;
	var $priority;
	var $unanswered;
	var $age;
	var $short_time;
	var $ip;

	function Ticket ($row) {
	  global $config;

		$this->id = $row['ID'];
		$this->subject = $row['subject'];
		$this->name = $row['name'];
		$this->email = $row['email'];
		$this->phone = $row['phone'];
		$this->status = $row['status'];
		$this->rep = $row['rep'];
		$this->cat = $row['cat'];
		$this->priority = $row['priority'];
		$this->ip = $row['ip'];
		$this->timestamp = $row['timestamp'];
		$this->short_time = format_time($config['short_date_format'], time_convert($this->timestamp));
		$this->datetime = format_time($config['time_format'], time_convert($this->timestamp));
		$this->unanswered = $row['unanswered']?$row['unanswered']:get_un_tickets($this->id);
    if (!$this->unanswered && $this->status !== 'closed') { $this->status = 'answered'; }
	}
}

function get_un_tickets($id) {
	global $db_table;
        $qs = mysql_query("SELECT * FROM ".$db_table['messages']." WHERE ticket=$id ORDER BY timestamp");
        $in = mysql_num_rows($qs);
        $un=0;
        while ($q = mysql_fetch_array($qs)) {
        	$answer = mysql_fetch_array(mysql_query("SELECT message FROM ".$db_table['answers']." WHERE reference=".$q['ID']));
        	if ($answer['message']) { --$in; }
        	else { ++$un; }
        	if ($un && $answer['message']) {
                $in -= $un;
                $un = 0;
        	}
        }
        return $in;
}

function has_priv_msg($id) {
	global $db_table;
	if ($_SESSION['user']['type'] == 'admin') {
		$priv_res = mysql_query("SELECT * FROM ".$db_table['privmsg']." WHERE ticket='$id'");
		$count = mysql_num_rows($priv_res);
		if ($count) return '*';
	}
}

function email_alert($tid, $msgid=false, $subject=false, $message=false) { //alerts the alert_user (in mail) and cat reps
	global $config, $db_table;

	$tid=preg_replace('/\D+/', '', $tid); //sanitise
	$msgid=preg_replace('/\D+/', '', $msgid); //sanitise
	
	if (empty($tid)) { return; }

	$t = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['tickets']." WHERE ID=".$tid));
	$cat = get_category($t['cat']);
	if (!empty($msgid)) {
		$m = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['messages']." WHERE ID=".$msgid));
	}

	$from = $config['alert_email'];
	$alert_subj = $config['alert_subj'];
	$alert_msg = $config['alert_msg'];
	
	$vars=array();
	$vars['ticket']=$t['ID'];
	$vars['subject']=$subject? $subject: htmlspecialchars_decode($t['subject']);
	$vars['category']=$cat['name'];
	$vars['cat_name']=$cat['name'];
	$vars['name']=$t['name'];
	$vars['email']=$t['email'];
	$vars['datetime']=(empty($m))?'': format_time('r', time_convert($m['timestamp']));
	$vars['message']=$message ? $message : htmlspecialchars_decode($m['message']);
	
	$alert_subj=Keywords($alert_subj,$vars);
	$text=Keywords($alert_msg,$vars);
	if ($html=GetHTML($alert_msg,$vars,'email.html')) {
		$body=array();
		$body['text']=$text;
		$body['html']=$html;
	}
	else { $body=$text; }
	
	$pri=$t['priority'] == 3?1:'';

	foreach (get_emails($t['cat']) as $to) {
		if (!empty($to)) { send_mail($to, $alert_subj, $body, $from, false, $pri); }
	}

}

function get_emails($catid) {
	global $config, $db_table;

		$cat_reps=array();
		$query=mysql_query("SELECT * FROM ".$db_table['reps']);
		while ($rep = mysql_fetch_array($query)) { $reps[]=$rep; }

		foreach ($reps as $rep) {
			$sql="SELECT cat_access FROM ".$db_table['groups']." WHERE ID=".$rep['user_group'];
			$query=mysql_query($sql);
			$user_group = mysql_fetch_array($query);
			$cat_access = explode(':',$user_group['cat_access']);
			if (in_array($catid,$cat_access) || in_array('all',$cat_access)) {
					$cat_reps[]=$rep;
			}
		}
	$emails=array();
	if (!empty($config['alert_user'])) { $emails=explode(';',$config['alert_user']); }

	foreach ($cat_reps as $cat_rep) {
		$add_email=1;
		if (preg_match('/\*LOCKED\*/',$cat_rep['password'])) { $add_email=0; }
		if (in_array($cat_rep['email'],$emails)) { $add_email=0; }
		if ($add_email) { $emails[]=$cat_rep['email']; }
	}
	$emails=array_unique($emails);
	
	return $emails;
}

function login($type, $id, $pass) {
	global $db_table;
	if ($_REQUEST['a'] == 'logout') { return; }
	$id=strtolower(escape_string($id));
	$pass=escape_string($pass);
	if ($type == 'admin') {
		$sql="SELECT password FROM ".$db_table['reps']." WHERE username=$id AND password=$pass";
		if ($query=mysql_query($sql)) { $row = mysql_fetch_array($query); }
	}
	else {
		$sql="SELECT ID FROM ".$db_table['tickets']." WHERE email=$id AND ID=$pass";
		if ($query=mysql_query($sql)) { $row = mysql_fetch_array($query); }
	}
	if ($row['password']) {
		$permis = mysql_fetch_array(mysql_query("SELECT user_group FROM ".$db_table['reps']." WHERE username=".$id));
		$permis = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['groups']." WHERE ID=".$permis['user_group']));
		if (isset($permis['cat_access'])) { $permis['cat_access']=explode(':',$permis['cat_access']); }
	}
	elseif ($row['ID']) { $permis = 1; }
	else { $permis = 0; }
	return $permis;
}

function logout($page='index.php') {
	session_destroy();
	header('Location: '.$page); die();
}

function ValidID($id) {
	global $db_table;
	$id=preg_replace('/\D+/', '', $id); //sanitise
	if (!empty($id)) {
		$res=mysql_query("SELECT ID FROM ".$db_table['tickets']." WHERE ID=".$id);
		if ($res) {
			if ($array=mysql_fetch_assoc($res)) { return $array['ID']; }
		}
	}
}

//Ticket Functions
function CreateTicket($subject, $name, $email, $cat, $phone, $pri=2, $ip='', $message='', $sendmail=TRUE) {
  global $config, $db_table;

	if (($ip != '') && ($_SERVER['REMOTE_ADDR'] != '')) { $ip=$_SERVER['REMOTE_ADDR']; }
	if (($pri == '') || ($pri < 0 || $pri > 3)) $pri = 2;
	$pri=preg_replace('/\D+/', '', $pri); //sanitise
	$cat=preg_replace('/\D+/', '', $cat); //sanitise
	$cat=get_category($cat);

	do {
		mt_srand ((double) microtime() * 1000000);
		$id = mt_rand(100000, 999999);
	} while(ValidID($id));
	
	//prep vars for inclusion time
	$sql_subject=escape_string($subject);
	$sql_name=escape_string($name);
	$sql_email=escape_string(strtolower($email));
	$sql_phone=escape_string($phone);
	$sql_ip=escape_string($ip);

  $sql="SELECT UNIX_TIMESTAMP(timestamp) AS timestamp FROM ".$db_table['tickets']." WHERE email=$sql_email ORDER BY timestamp DESC";
  $t=mysql_fetch_array(mysql_query($sql));

	$sql ="INSERT INTO ".$db_table['tickets']." (subject, name, email, cat, phone, status, ID, priority, ip, timestamp) ";
	$sql.="VALUES ($sql_subject, $sql_name, $sql_email, '$cat[ID]', $sql_phone, 'open', $id, $pri, $sql_ip, UTC_TIMESTAMP())";
	mysql_query($sql);
	$id = mysql_error() ? $sql.mysql_error(): $id;
    
    if ($sendmail) { //should we send?
			
			$ticket_subj = $config['ticket_subj'];
			$ticket_msg = $config['ticket_msg'];

			$vars=array();
	    $vars['ticket']=$id;
	    $vars['subject']=$subject;
	    $vars['message']=$message;
	    $vars['name']=$name;
	    $vars['email']=$email;
	    $ticket_msg = add_remove_tag($ticket_msg);
	    $ticket_msg = add_sig($cat['signature'],$ticket_msg);

			$ticket_subj=Keywords($ticket_subj,$vars);
			$text=Keywords($ticket_msg,$vars);
			if ($html=GetHTML($ticket_msg,$vars,'email.html')) {
				$body=array();
				$body['text']=$text;
				$body['html']=$html;
			}
			else { $body=$text; }
			
			//$gmtime = gmmktime();
			//$interval = $gmtime - $t['timestamp'];
			//if ($interval >= $config['min_interval']) {
		    if ($config['ticket_response']) {
		        //mail($email, $ticket_subj, $ticket_msg, 'From: '.$cat['email'],'-f'.$cat['email']);
		        send_mail($email, $ticket_subj, $body, $cat['email']);
		    }
	  	//}
  	}

	return $id;
}

function CloseTicket($ticket) {
	global $db_table;
	$ticket=preg_replace('/\D+/', '', $ticket); //sanitise
	$query="UPDATE ".$db_table['tickets']." SET status = 'closed' WHERE ID=".$ticket;
	if (mysql_query($query)) { return TRUE; }
	else { return FALSE; }
}

function ReopenTicket($ticket) {
	global $db_table;
	$ticket=preg_replace('/\D+/', '', $ticket); //sanitise
	$query="UPDATE ".$db_table['tickets']." SET status='open' WHERE ID=".$ticket;
	if (mysql_query($query)) { return TRUE; }
	else { return FALSE; }
}

function DeleteTicket($id) {
	global $config, $db_table;

	$id=preg_replace('/\D+/', '', $id); //sanitise

	mysql_query("DELETE FROM ".$db_table['answers']." WHERE ticket=".$id);
	mysql_query("DELETE FROM ".$db_table['messages']." WHERE ticket=".$id);
	mysql_query("DELETE FROM ".$db_table['tickets']." WHERE id=".$id);

	$files = mysql_query("SELECT filename FROM ".$db_table['attachments']." WHERE ticket=".$id);
	while ($file=mysql_fetch_array($files)) {
		if (file_exists($config['attachment_dir'].$file['filename'])) {
			@unlink($config['attachment_dir'].$file['filename']);
		}
	}
	mysql_query("DELETE FROM ".$db_table['attachments']." WHERE ticket=".$id);
	mysql_query("DELETE FROM ".$db_table['privmsg']." WHERE ticket=".$id);
	
	if (mysql_error()) { return mysql_error(); }
}

function PostMessage ($ticket, $message, $header='', $notifyuser=true, $attachments=false) {
	global $config, $db_table;
	
	if (empty($ticket)) { return LANG_TICKET_ID; }
	if (empty($message)) { return LANG_MSG; }
	
	$ticket=preg_replace('/\D+/', '', $ticket); //sanitise
	$errors=array();
	@ReopenTicket($ticket);

	$header=$config['save_headers']? $header:'';
	$sql_header=escape_string($header);
	$sql_message=escape_string($message);

	$sql ="INSERT INTO ".$db_table['messages']." (ticket, message, headers, timestamp) ";
	$sql.="VALUES($ticket,$sql_message,$sql_header, UTC_TIMESTAMP())";
	if (mysql_query($sql)) { $id=mysql_insert_id(); }
	else { return; }

		if ($attachments) {
			$files=PostAttach($ticket,$id,$attachments,'q');
			$attachments=array();
			if (!empty($files)) {
				foreach ($files as $file) {
					if (file_exists($file['tmp_name'])) { $attachments[]=$file; }
					if (!empty($file['errormsg'])) {
						$file_errormsg=htmlspecialchars($file['name']).' : '.$file['errormsg'];
						$errors[]=$file_errormsg;
						//$sql_message=escape_string($message."\n".LANG_ERROR.": ".$file_errormsg);
						//$query = mysql_query("UPDATE ".$db_table['messages']." SET message=".$sql_message." WHERE ID=".$id);
					}
				}
			}
		}

		if ($config['alert_new']) { email_alert($ticket,$id); }
		
		if ($config['message_response'] && $notifyuser) {
			$t = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['tickets']." WHERE ID=".$ticket));
			$c = mysql_fetch_array(mysql_query("SELECT email,signature FROM ".$db_table['categories']." WHERE ID=".$t['cat']));
		
		 	$mailsubj = $config['message_subj'];
		 	$mailmsg = $config['message_msg'];
		 	
		 	$vars=array();
			$vars['ticket']=$ticket;
			$vars['subject']=htmlspecialchars_decode($t['subject']);
			$vars['email']=$t['email'];
			$vars['name']=$t['name'];
			$mailmsg = add_remove_tag($mailmsg);
			$mailmsg = add_sig($c['signature'],$mailmsg);
		
			$mailsubj=Keywords($mailsubj,$vars);
			$text=Keywords($mailmsg,$vars);
			if ($html=GetHTML($mailmsg,$vars,'email.html')) {
				$body=array();
				$body['text']=$text;
				$body['html']=$html;
			}
			else { $body=$text; }
		
			send_mail($t['email'], $mailsubj, $body, $c['email']);
	  }
	 if (!empty($errors)) { return $errors; }
	 else { return $id; }
}

function PostAnswer($message, $repid, $refid, $attachments=false) {
	global $config, $db_table;
	if (empty($message)) { return LANG_MSG; }

  if ($msg_res = mysql_query("SELECT ticket FROM ".$db_table['messages']." WHERE ID=".$refid)) {
		if ($msg_row = mysql_fetch_array($msg_res)) {
				$ticket = $msg_row['ticket'];
		}
	}

	$res = mysql_query("SELECT * FROM ".$db_table['tickets']." WHERE ID=".$ticket);
	if (mysql_error() || !mysql_num_rows($res)) { return false; }
	
	@ReopenTicket($ticket);

	$sql_message=escape_string($message);
	$sql ="INSERT INTO ".$db_table['answers']." (ticket, message, rep, reference, timestamp) ";
	$sql.="VALUES($ticket,$sql_message, $repid, $refid, UTC_TIMESTAMP())";
	if (mysql_query($sql)) { $id=mysql_insert_id(); }
		if ($attachments) {
			$files=PostAttach($ticket,$id,$attachments,'a');
			$attachments=array();
			if (!empty($files)) {
				foreach ($files as $file) {
					if (file_exists($file['tmp_name'])) { $attachments[]=$file; }
					if (!empty($file['errormsg'])) {
						$file_errormsg=htmlspecialchars($file['name']).' : '.$file['errormsg'];
						$errors[]=$file_errormsg;
						$sql_message=escape_string($message."\n".LANG_ERROR.": ".$file_errormsg);
						$sql="UPDATE ".$db_table['answers']." SET message=".$sql_message." WHERE ID=".$id;
						$query = mysql_query($sql);
					}
				}
			}
		}
	
		$ticket_row = mysql_fetch_array($res);
		$cat_res = mysql_query("SELECT * FROM ".$db_table['categories']." WHERE ID=".$ticket_row['cat']);
		$cat_row = mysql_fetch_array($cat_res);
		$rep_res = mysql_query("SELECT * FROM ".$db_table['reps']." WHERE ID=".$repid);
		$rep_row = mysql_fetch_array($rep_res);
	
		//$message = str_replace("\r", "\n", $message);
		//$message = str_replace("\n\n", "\n", $message);
		
		$answer_subj = $config['answer_subj'];
		$answer_msg = $config['answer_msg'];
		
		$vars=array();
		$vars['subject']=$ticket_row['subject'];
		$vars['ticket']=$ticket_row['ID'];
		$vars['answer']=$message;
		$vars['name']=$ticket_row['name'];
		$vars['email']=$ticket_row['email'];
		$answer_msg = add_remove_tag($answer_msg);
		$answer_msg = add_sig($rep_row['signature'],$answer_msg);
		
		$answer_subj=Keywords($answer_subj,$vars);
		$text=Keywords($answer_msg,$vars);
		if ($html=GetHTML($answer_msg,$vars,'email.html')) {
			$body=array();
			$body['text']=$text;
			$body['html']=$html;
		}
		else { $body=$text; }
		
		$attachments=$config['accept_attachments']? $attachments: false;
		
		send_mail($ticket_row['email'], $answer_subj, $body, $cat_row['email'], $attachments);
		
	return $errors?$errors:$id;
}

function PostPrivMessage ($ticket, $repid, $msg, $attachments=false) {
	global $config, $db_table;
	$id=preg_replace('/\D+/', '', $id); //sanitise
	$errors=array();
	$sql ="INSERT INTO ".$db_table['privmsg']." (ticket, rep, message, attachment, timestamp) ";
	$sql.="VALUES ($ticket, $repid, $msg, '', UTC_TIMESTAMP())";
	if (mysql_query($sql)) { $id=mysql_insert_id(); }
		if ($attachments) {
			$files=PostAttach($ticket,$id,$attachments,'p');
			$attachments=array();
			if (!empty($files)) {
				foreach ($files as $file) {
					if (file_exists($file['tmp_name'])) {
						$attachments[]=$file;
						$attach=basename($file['tmp_name']);
						$sql="UPDATE ".$db_table['privmsg']." SET attachment='$attach' WHERE ID=".$id;
						mysql_query($sql);
					}
					if (!empty($file['errormsg'])) { $errors[]=htmlspecialchars($file['name']).' : '.$file['errormsg']; }
				}
			}
		}
	return $errors?$errors:$id;
}

function TransCatTicket($tid,$cid,$add_msg=false,$alert=false) {
	global $config, $db_table;
	$tid=preg_replace('/\D+/', '', $tid); //sanitise
	$cid=preg_replace('/\D+/', '', $cid); //sanitise
	$add_msg=$add_msg ? ': '.$add_msg : '';
	$sql = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['tickets']." WHERE ID=".$tid));
	$cat = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['categories']." WHERE ID=".$sql['cat']));
	$cat2 = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['categories']." WHERE ID=".$cid));
	$trans_msg = LANG_TRANS_FROM.' '.$cat['name'].' '.LANG_CAT.' ('.format_time($config['time_format']).') '.$add_msg;
	$query = mysql_query("UPDATE ".$db_table['tickets']." SET cat=".$cid.", trans_msg='".$trans_msg."' WHERE ID=".$tid);
	if ($config['trans_response'] && !$cat2['hidden'] && $query && $alert) {
		$trans_subj = $config['trans_subj'];
		$trans_msg = $config['trans_msg'];
		
		$vars=array();
		$vars['ticket']=$tid;
		$vars['subject']=$sql['subject'];
		$vars['category']=$cat2['name'];
		$vars['cat_name']=$cat2['name'];
		$vars['name']=$sql['name'];
		$vars['email']=$sql['email'];
		$vars['trans_msg']=$add_msg;
		
		$trans_msg = add_remove_tag($trans_msg);
		$trans_msg = add_sig($cat2['signature'],$trans_msg);
		
		$trans_subj=Keywords($trans_subj,$vars);
		$text=Keywords($trans_msg,$vars);
		if ($html=GetHTML($trans_msg,$vars,'email.html')) {
			$body=array();
			$body['text']=$text;
			$body['html']=$html;
		}
		else { $body=$text; }
		
	  //notify user
	  send_mail($sql['email'], $ticket_subj, $body, $cat2['email']);
	  //notify admin
	  $from=$config['alert_email'];
		foreach (get_emails($cat2['ID']) as $to) {
			if (!empty($to)) { send_mail($to, $trans_subj, $body, $from); }
		}
	}
}

function TransRepTicket($tid,$rid,$alert=false) {
	global $config, $db_table;
	$tid=preg_replace('/\D+/', '', $tid); //sanitise
	$rid=preg_replace('/\D+/', '', $rid); //sanitise
	if (empty($tid)) { return; }
	if (empty($rid)) { return; }
	$sql = mysql_fetch_array(mysql_query("SHOW COLUMNS FROM ".$db_table['tickets']." LIKE 'rep'"));
	if ($sql) { //ensure our rep field actually exists
	 $sql = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['tickets']." WHERE ID=".$tid));
	 $rep = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['reps']." WHERE ID=".$sql['rep']));
	 $rep2 = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['reps']." WHERE ID=".$rid));
	 $query = mysql_query("UPDATE ".$db_table['tickets']." SET rep=".$rid." WHERE ID=".$tid);
	 if ($config['rep_trans_response'] && $query && $alert) {
	 	
		$trans_subj = $config['rep_trans_subj'];
		$trans_msg = $config['rep_trans_msg'];
		
		$vars=array();
		$vars['ticket']=$tid;
		$vars['subject']=$sql['subject'];
		$vars['rep_name']=$rep2['name'];
		$vars['name']=$sql['name'];
		$vars['email']=$sql['email'];
		//$trans_msg = add_remove_tag($trans_msg);
		//$trans_msg = add_sig($rep2['signature'],$trans_msg);
		
		$trans_subj=Keywords($trans_subj,$vars);
		$text=Keywords($trans_msg,$vars);
		if ($html=GetHTML($trans_msg,$vars,'email.html')) {
			$body=array();
			$body['text']=$text;
			$body['html']=$html;
		}
		else { $body=$text; }
		
	  //notify user (disabled, the user doesn't need to know)
	  //send_mail($sql['email'], $ticket_subj, $body, $rep2['email']);
	  //notify admin
	  $from=$config['alert_email'];
	  
	  $emails=array();
	  // alert_users need to be alerted
	  if (!empty($config['alert_user'])) { $emails=explode(';',$config['alert_user']); }
	  // The rep who is being transferred from needs to be alerted
	  if ($rep['email']) { $emails[]=$rep['email']; }
	  // The rep who is being transferred to needs to be alerted
	  if ($rep2['email']) { $emails[]=$rep2['email']; }
	  // Ensure we don't send to the same email address twice
	  $emails=array_unique($emails);
	  foreach ($emails as $to) {
	  	if (!empty($to)) { send_mail($to, $trans_subj, $body, $from); }
		}

	 }
	}
}

function PostAttach($ticket,$refid,$files,$type='q') {
	global $config, $db_table;
	
	if (empty($config['accept_attachments'])) { return; }

	$outfiles=array();
	foreach ($files as $file) {
		if (!empty($file['name'])) {
	 		//generate details
	 		mt_srand(time()); $rand=mt_rand(100000,999999); //6 random numbers
	 		$destfile=$rand.'_'.$file['name'];
	 		$dest=$config['attachment_dir'].$destfile;
	 		$maxsize=$config['attachment_size'];
	 		$types=explode(';',$config['filetypes']);
	
	 		//attempt to upload file
	 		$upload=upload_file($file,$dest,$maxsize,$types);
	
	 		if (!$upload) {
	 			$sql = "INSERT INTO ".$db_table['attachments']." (ticket,ref,filename,type) ";
	 			$sql.= "VALUES ($ticket, $refid, '$destfile', '$type')";
	 			if (!mysql_query($sql)) {
	 				@unlink($dest);
	 				unset($dest);
	 				$upload=LANG_ERROR.': '.mysql_error()."\n<br>".$sql;
	 			}
	 		}
	 		if (file_exists($file['tmp_name'])) { @unlink($file['tmp_name']); }
	 		if ($upload) { $file['errormsg']=$upload; }
	 		if (!empty($dest)) { $file['tmp_name']=$dest; }
	 		$outfiles[]=$file;
		}
	}
	return $outfiles;
}

function Keywords ($input,$vars=array()) {
	global $config;
	$vars['url']=$config['root_url'];
	foreach ($vars as $key => $val) {
		$input=str_replace("%$key", $val, $input);
	}
	return $input;
}

function GetHTML ($message,$vars,$template='email.html') {
	global $config, $theme_dir;
	if (file_exists($theme_dir.$template)) {
		$html=file_get_contents($theme_dir.$template);
		$message=Keywords($message,$vars);
		$message=text2html($message);
		$html=str_replace('%%MSG%%', $message, $html);
		foreach ($vars as $key => $val) { $vars[$key]=htmlspecialchars($val); }
		$html=Keywords($html,$vars);
		return $html;
	}
}

function time_convert($time) { //Converts mysql timestamp the right timezone in unixtime
    global $config;
    if (empty($time)) { $t = mysql_fetch_array(mysql_query("SELECT UNIX_TIMESTAMP() AS timestamp")); }
    else { $t = mysql_fetch_array(mysql_query("SELECT UNIX_TIMESTAMP('$time') AS timestamp")); }  
    $t['timestamp'] += ($config['timezone'] * 3600);
    return $t['timestamp'];
}

function load_buttons() { //These are the admin buttons that appear in the admin area
	global $login,$titles,$image_dir;

    if ($_SESSION['user']['type'] == 'admin') {
        $access = array();
        foreach ($titles as $item => $val) {
        	if (($login[$item]) || ($item == 'my')) {
         		//$html='<a href="admin.php?a='.$item.'" title="'.$val.'"><img src="'.$image_dir.'buttons/'.$item.'.gif" alt="'.$val.'" border="0"></a>';
         		$html='
         		<form action="admin.php?a='.$item.'" method="POST" style="display: inline;">
         			<input class="inputsubmit" type="submit" id="'.$item.'" name="'.$item.'" value="'.$val.'">
         		</form>';
          	array_push($access, $html);
         	}
        }
        $access = join(" \n", $access);
        if (!empty($access)) { echo '<div class="buttons">'."\n$access\n</div>\n"; }
    }
}

function get_category($cat=0) { // Used above to check the category input
	global $db_table;
	if ($cat != 0) { $where=" WHERE ID=".$cat; }
	else { $where=''; }
	$query=mysql_query("SELECT * FROM ".$db_table['categories'].$where);
	$array=mysql_fetch_array($query);
	return $array;
}

function get_real_status($status) {
	if ($status == LANG_CLOSED) $return='closed';
	if ($status == LANG_ANSWERED) $return='answered';
	if ($status == LANG_OPEN) $return='open';
	return $return;
}

function get_real_status_names($status) {
	if ($status == 'closed') $return=LANG_CLOSED_TICKETS;
	if ($status == 'answered') $return=LANG_ANSWERED_TICKETS;
	if ($status == 'open') $return=LANG_OPEN_TICKETS;
	if ($status == LANG_CLOSED) $return=LANG_CLOSED_TICKETS;
	if ($status == LANG_ANSWERED) $return=LANG_ANSWERED_TICKETS;
	if ($status == LANG_OPEN) $return=LANG_OPEN_TICKETS;
	return $return;
}

function get_real_status_name($status) {
	if ($status == 'closed') $return=LANG_CLOSED;
	if ($status == 'answered') $return=LANG_ANSWERED;
	if ($status == 'open') $return=LANG_OPEN;
	return $return;
}

function add_remove_tag($msg) {
	global $config;
	if ((isset($config['remove_original'])) && (!empty($config['remove_tag']))) {
		$msg = $config['remove_tag']."\n\n".$msg;
	}
	return $msg;
}

function add_sig($sig,$msg) {
	global $config;
	if (!empty($sig)) {
		$sig = "\n".$config['presig'].$sig;
		$sig = str_replace("\r", "\n", $sig);
		$sig = str_replace("\n\n", "\n", $sig);
		$msg.=$sig;
	}
	return $msg;
}

function lang_upload_file_errors() {
	$errors=array();
	$errors['nodata']=LANG_UP_ERR_NODATA;
	$errors['empty']=LANG_UP_ERR_EMPTY;
	$errors['invalidpath']=LANG_UP_ERR_INVALIDPATH;
	$errors['toolong']=LANG_UP_ERR_TOOLONG;
	$errors['pathwrite']=LANG_UP_ERR_WRITEPATH;
	$errors['nofile']=LANG_UP_ERR_NOFILE;
	$errors['invalidtype']=LANG_UP_ERR_INVALIDTYPE;
	$errors['toobig']=LANG_UP_ERR_TOOBIG;
	$errors['toosmall']=LANG_UP_ERR_TOOSMALL;
	$errors['exists']=LANG_UP_ERR_EXISTS;
	$errors['failed']=LANG_UP_ERR_FAILED;
	return $errors;
}

function mp3_player($file) {
	global $config;
	$vars['filetypes']='.mp3';
	$vars['flashfile']='musicplayer_f6.swf';
	$vars['noflash']='noflash.gif';
	$vars['file']=$file;
	$vars['fileurl']=urlencode($file);
	$vars['url']=$config['root_url'];
	$vars['attachdir']=$config['attachment_dir'];
	$vars['attachurl']=$config['attachment_url'];

	if (!file_exists($vars['attachdir'].$vars['file'])) { return; }
	if (!in_array(get_ext($vars['file']),explode(';',$vars['filetypes']))) { return; }
	
	$html='
	<object type="application/x-shockwave-flash"
	data="%flashfile?&song_url=%attachurl?file=%fileurl" 
	width="17" height="17">
	<param name="movie" 
	value="%flashfile?&song_url=%attachurl?file=%fileurl" />
	<img src="%noflash" 
	width="17" height="17" alt="no flash" />
	</object>';

	if (!file_exists($vars['flashfile'])) { $html='<img src="%noflash" width="17" height="17" alt="no flash" />'; }
	
	foreach ($vars as $key => $val) {
		$html=preg_replace("/%$key/i",$val,$html);
	}
	
	return $html;

}

?>