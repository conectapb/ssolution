<?php

/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

//Note: Moved some of the standard functions in here...

/* Clean Input (html2text,text2html) Start */

function clean_input($input,$type='text') {
	$output=$input;
	if ($type == 'html') { $output=html2text($output); }
	//$output=htmlspecialchars($output);
	$output=text2html($output);
	return $output;
}

function html2text($html) { //basic version -- borrowed in part from chuggnutt
	
	preg_match('/<\s*body\s*\/?>(.*?)<\s*\/\s*body\s*\/?\s*>/is', $html, $match);
	if (!empty($match[1])) { $text=$match[1]; }
	else { $text=$html; } // There is no body!
	
	$text=trim($text);
	
  $search = array(
        "/\r/",                                  // Non-legal carriage return
        "/[\n\t]+/",                             // Newlines and tabs
        '/[ ]{2,}/',                             // Runs of spaces, pre-handling
        '/<script[^>]*>.*?<\/script>/i',         // <script>s -- which strip_tags supposedly has problems with
        '/<style[^>]*>.*?<\/style>/i',           // <style>s -- which strip_tags supposedly has problems with
        '/<img [^>]*alt="([^"]+)"[^>]*>/ie',     // <img>s
        //'/<!-- .* -->/',                         // Comments -- which strip_tags might have problem a with
        '/<a [^>]*href="([^"]+)"[^>]*>(.*?)<\/a>/ie',
                                                 // <a href="">
        '/<h[123][^>]*>(.*?)<\/h[123]>/ie',      // H1 - H3
        '/<h[456][^>]*>(.*?)<\/h[456]>/ie',      // H4 - H6
        '/<p[^>]*>/i',                           // <P>
        '/<br\\\\s*?\\/??>/i',                          // <br>
        '/<b[^>]*>(.*?)<\/b>/ie',                // <b>
        '/<strong[^>]*>(.*?)<\/strong>/ie',      // <strong>
        '/<i[^>]*>(.*?)<\/i>/i',                 // <i>
        '/<em[^>]*>(.*?)<\/em>/i',               // <em>
        '/(<ul[^>]*>|<\/ul>)/i',                 // <ul> and </ul>
        '/(<ol[^>]*>|<\/ol>)/i',                 // <ol> and </ol>
        '/<li[^>]*>(.*?)<\/li>/i',               // <li> and </li>
        '/<li[^>]*>/i',                          // <li>
        '/<hr[^>]*>/i',                          // <hr>
        '/(<table[^>]*>|<\/table>)/i',           // <table> and </table>
        '/(<tr[^>]*>|<\/tr>)/i',                 // <tr> and </tr>
        '/<td[^>]*>(.*?)<\/td>/i',               // <td> and </td>
        '/<th[^>]*>(.*?)<\/th>/ie',              // <th> and </th>
        '/&(nbsp|#160);/i',                      // Non-breaking space
        '/&(quot|rdquo|ldquo|#8220|#8221|#147|#148);/i',
                                                 // Double quotes
        '/&(apos|rsquo|lsquo|#8216|#8217);/i',   // Single quotes
        '/&gt;/i',                               // Greater-than
        '/&lt;/i',                               // Less-than
        '/&(amp|#38);/i',                        // Ampersand
        '/&(copy|#169);/i',                      // Copyright
        '/&(trade|#8482|#153);/i',               // Trademark
        '/&(reg|#174);/i',                       // Registered
        '/&(mdash|#151|#8212);/i',               // mdash
        '/&(ndash|minus|#8211|#8722);/i',        // ndash
        '/&(bull|#149|#8226);/i',                // Bullet
        '/&(pound|#163);/i',                     // Pound sign
        '/&(euro|#8364);/i',                     // Euro sign
        '/&[^&;]+;/i',                           // Unknown/unhandled entities
        '/[ ]{2,}/'                              // Runs of spaces, post-handling
  );
  
  $replace = array(
        '',                                     // Non-legal carriage return
        ' ',                                    // Newlines and tabs
        ' ',                                    // Runs of spaces, pre-handling
        '',                                     // <script>s -- which strip_tags supposedly has problems with
        '',                                     // <style>s -- which strip_tags supposedly has problems with
        'trim("\\1")',         								 // <img>s
        //'',                                     // Comments -- which strip_tags might have problem a with
        'html2link("\\1","\\2")',
                                                // <a href=""> 1=link 2=text
        "strtoupper(\"\n\n\\1\n\n\")",          // H1 - H3
        "ucwords(\"\n\n\\1\n\n\")",             // H4 - H6
        "\n\n\t",                               // <P>
        "\n",                                   // <br>
        'strtoupper("\\1")',                    // <b>
        'strtoupper("\\1")',                    // <strong>
        '_\\1_',                                // <i>
        '_\\1_',                                // <em>
        "\n\n",                                 // <ul> and </ul>
        "\n\n",                                 // <ol> and </ol>
        "\t* \\1\n",                            // <li> and </li>
        "\n\t* ",                               // <li>
        "\n-------------------------\n",        // <hr>
        "\n\n",                                 // <table> and </table>
        "\n",                                   // <tr> and </tr>
        "\t\t\\1\n",                            // <td> and </td>
        "strtoupper(\"\t\t\\1\n\")",            // <th> and </th>
        ' ',                                    // Non-breaking space
        '"',                                    // Double quotes
        "'",                                    // Single quotes
        '>',
        '<',
        '&',
        '(c)',
        '(tm)',
        '(R)',
        '--',
        '-',
        '*',
        '£',
        'EUR',                                  // Euro sign. € ?
        '',                                     // Unknown/unhandled entities
        ' '                                     // Runs of spaces, post-handling
  );
  
  // Run search-and-replace
  $text = preg_replace($search, $replace, $text);
	
	// Strip any other HTML tags that may have been missed
	$text = strip_tags($text);

  // Bring down number of empty lines to 2 max
  $text = preg_replace("/\n\s+\n/", "\n\n", $text);
  $text = preg_replace("/[\n]{3,}/", "\n\n", $text);
		
	return $text;
}

function html2link ($link,$text) {
	$text=trim(htmlspecialchars($text));
	$link=trim(htmlentities($link));
	if (!empty($text)) { $link=trim("$link $text"); }
	return "[$link]";
}

function text2html($text) {
	$html = $text; //first step to converting text to html
	$html = htmlspecialchars_decode($html);
	$html = htmlspecialchars($html);
	$html = nl2br($html); //turn new lines to <br>s
	$html = link2html($html); //create html links
	return $html;
}

function link2html($text) { //borrowed in part from wordpress
	$text = preg_replace("/\[\[(.*?)[ ]{1}(.*?)\]\]/i",'<a href="\\1">\\2</a>', $text);
	$text = preg_replace("/\[(.*?)[ ]{1}(.*?)\]/i",'<a href="\\1">\\2</a>', $text);
	$text = preg_replace(
		array(
			'#([\s>])([\w]+?://[\w\#$%&~/.\-;:=,?@\[\]+]*)#is',
			'#([\s>])((www|ftp)\.[\w\#$%&~/.\-;:=,?@\[\]+]*)#is',
			'#([\s>])([a-z0-9\-_.]+)@([^,< \n\r]+)#i'),
		array(
			'$1<a href="$2" rel="nofollow">$2</a>',
			'$1<a href="http://$2" rel="nofollow">$2</a>',
			'$1<a href="mailto:$2@$3">$2@$3</a>'),$text);
	$text = preg_replace("#(<a( [^>]+?>|>))<a [^>]+?>([^>]+?)</a></a>#i", "$1$3</a>", $text);
	$text = trim($text);
	return $text;
}

/* Clean Input (html2text,text2html) End */

if (!function_exists('remove_trailing_slash')) {
	function remove_trailing_slash($dir,$slash='/') {
		if (substr($dir, -1) == $slash) { $dir=substr($dir, 0, -1); }
		return $dir;
	}
}

if (!function_exists('add_trailing_slash')) {
	function add_trailing_slash($dir,$slash='/') {
		if (substr($dir, -1) != $slash) { $dir=$dir.$slash; }
		return $dir;
	}
}

function escape_string($value,$quotes=true) {
    $value=trim($value);
    $value=get_magic_quotes_gpc()?stripslashes($value):$value;
    if (!(is_numeric($value) && intval($value) == $value)) {
			if (function_exists('mysql_real_escape_string')) {
				$value=mysql_real_escape_string($value);
			}
			else {
				$value=addslashes($value);
			}
    }
    if ($quotes == true) { $value="'$value'"; }
    return $value;
}

function escape_array($array) {
	$new=array();
	foreach ($array as $key => $val) {
		$new[$key]=escape_string($val);
	}
	return $new;
}

function trim_post($array) { //$array is for array of post keys
	foreach ($array as $key) {
		if (isset($_POST[$key])) {
			$_POST[$key]=trim($_POST[$key]);
		}
	}
}

if (!function_exists('array_combine')) {
	function array_combine( $keys, $vals ) {
	 $keys = array_values( (array) $keys );
	 $vals = array_values( (array) $vals );
	 $n = max( count( $keys ), count( $vals ) );
	 $r = array();
	 for( $i=0; $i<$n; $i++ ) {
	  $r[ $keys[ $i ] ] = $vals[ $i ];
	 }
	 return $r;
	}
}

//upload function: name of form file field,destination filename,max file size,file types(.ext or mi/me)
function upload_file($file,$dest='',$maxsize='99999',$types=array(),$errors=array(
		'nodata' => 'No uploaded file data',
		'empty'=> 'Empty uploaded file data',
		'toolong' => 'Filename is too long',
		'invalidpath' => 'Upload path is invalid',
		'pathwrite' => 'Upload path is NOT writable',
		'nofile' => 'Not an uploaded file',
		'invalidtype' => 'Invalid file type',
		'toosmall' => 'File is too small',
		'toobig' => 'File is too big',
		'exists' => 'File already exists',
		'failed' => 'Upload failed'
	)) {
	if (empty($dest)) { $dest='./'.$file['name']; }
	
	if (!isset($file)) { return $errors['nodata']; } // No uploaded file data
	if (empty($file)) { return $errors['empty']; } // Empty upload file data
	if (strlen($file['name']) > 60) { return $errors['toolong']; } // Filename is too long
	if ($file['error'] != 0) { return $file['error']; } // General error
	if (!is_dir(dirname($dest))) { return $errors['invalidpath']; } // Upload path is invalid
	if (!is_writeable(dirname($dest))) { return $errors['pathwrite']; } // Upload path is NOT writable
	if (!is_uploaded_file($file['tmp_name'])) { return $errors['nofile']; } // Not and uploaded file
	if (!check_file_types($file['name'],$types)) { return $errors['invalidtype']; } // Invalid file type
	if ($file['size'] == 0) { return $errors['toosmall']; } // File is too small
	if ($file['size'] > $maxsize) { return $errors['toobig']; } // File is too big
	if (file_exists($dest)) { return $errors['exists']; } // File already exists
	if (!@copy($file['tmp_name'],$dest)) { return $errors['failed']; } //Upload failed
	@unlink($file['tmp_name']); //we'll delete the temp file quietly.

	return 0; //nothing failed
}

function check_file_types($file,$types=array()) {
	if (!empty($types)) {
		foreach ($types as $type) {
			if (strstr($type, '/')) {
				if (strtolower(mime_content_type($file)) == strtolower($type)) { return TRUE; }
			}
			else {
				if (strtolower(get_ext($file)) == strtolower($type)) { return TRUE; }
			}
		}
	}
}

if (!function_exists('mime_content_type')) {
    function mime_content_type($filename) {
        $finfo    = finfo_open(FILEINFO_MIME);
        $mimetype = finfo_file($finfo, $filename);
        finfo_close($finfo);
        return $mimetype;
    }
}

function get_ext($file) { //returns .ext, ie: .jpg
	if (strstr($file, '.')) {
		//$ext=substr($file, strrpos($file,'.'), strlen($file) - strrpos($file,'.'));
		//$ext=preg_replace("/.*\.(.{3,8})$/", "$1", $file);
		//$ext=substr(strrchr($file, '.'), 1);
		$ext=substr($file,strrpos($file,'.'));
		return $ext;
	}
}

function is_email($email) { //returns email address if it's valid
	$pattern='/^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$/';
	if (preg_match($pattern, $email)) {
	  if (getmx_from_email($email)) { return $email; }
 	}
}
// support windows platforms
if (!function_exists ('getmxrr') ) {
	if ((isset($_ENV['OS'])) && ($_ENV['OS'] == 'Windows_NT')) {
	  function getmxrr($hostname, &$mxhosts, &$mxweight) {
	    if (!is_array ($mxhosts) ) {
	      $mxhosts = array ();
	    }
	    if (!empty ($hostname)) {
	      $output = '';
	      $exec='nslookup.exe -q=mx '.escapeshellarg($hostname);
	      @exec($exec, $output);
	      $imx=-1;
	
	      foreach ($output as $line) {
	        $imx++;
	        $parts = "";
	        if (preg_match ("/^$hostname\tMX preference = ([0-9]+), mail exchanger = (.*)$/", $line, $parts) ) {
	          $mxweight[$imx] = trim($parts[1]);
	          $mxhosts[$imx] = trim($parts[2]);
	        }
	        if (preg_match ("/responsible mail addr = (.*)/", $line, $parts)) {
	          $mxweight[$imx] = $imx;
	          $mxhosts[$imx] = trim($parts[1]);
	        }
	      }
	      return ($imx!=-1);
	    }
	    return false;
	  }
	}
	else { // just incase...
		function getmxrr ($hostname, $mxhosts, $mxweight=false) {
			return false;
		}
	}
}

function getmx_from_email($email) {
	list($user,$hostname)=split('@',$email);
	return getmx($hostname);
}

function getmx($hostname) {
	getmxrr($hostname,$mxhosts,$mxweight); //check for a true MX record
	$mx=array_shift($mxhosts); // get the first MX record
	if (!empty($mx)) { return $mx; }
	else { // RFC says use the A line if there is no MX
		$ip=gethostbyname($hostname); // get the ip from hostname
		if ($ip != $hostname) { // continue if returned ip not hostname
			$hostname=gethostbyaddr($ip); // get the rdns (real) hostname
			$ip=gethostbyname($hostname); // check the (real) hostname has an A record
			if ($ip != $hostname) { // continue if returned ip not hostname
				return $hostname;
			}
		}
	}
}

//This function was introduced to provide better handling of emails
//The $body is on the understanding that it's plain text and will be converted to HTML
function send_mail($to, $subject, $body, $from, $attachments=false, $priority=false) { //v0.2
  $eol="\n"; //end of line return
  $mime_boundary=md5(uniqid(rand().'-'.$to, true)); //creates a unique hash using the time and to address
  $mailcharset='UTF-8'; // Or ISO-8859-1
  
  if (preg_match('/(.+)<(.+)>/i',$from,$matches)) {
  	if (!empty($matches[1])) { $from_name=trim($matches[1]); }
  	if (!empty($matches[2])) { $from_email=trim($matches[2]); }
  }
  if (!empty($from_name)) { 
  	if (function_exists('mb_encode_mimeheader')) $from_name=mb_encode_mimeheader($from_name, $mailcharset, 'B');
  	if (!empty($from_email)) { $from="$from_name <$from_email>"; }
  }
  if (empty($from_email)) { $from_email=$from; }

  if (preg_match('/(.+)<(.+)>/i',$to,$matches)) {
  	if (!empty($matches[1])) { $to_name=trim($matches[1]); }
  	if (!empty($matches[2])) { $to_email=trim($matches[2]); }
  }
  if (!empty($to_name)) { 
  	if (function_exists('mb_encode_mimeheader')) $to_name=mb_encode_mimeheader($to_name, $mailcharset, 'B');
  	if (!empty($to_email)) { $to="$to_name <$to_email>"; }
  }

  if (!empty($subject) && (function_exists('mb_encode_mimeheader'))) { $subject=mb_encode_mimeheader($subject, $mailcharset, 'B'); }
  
  if (is_array($body)) { 
		if (!empty($body['html'])) { $htmlbody=$body['html']; }
		if (!empty($body['text'])) { $body=$body['text']; }
  }
  
  if (function_exists('getmx_from_email')) { $mx=getmx_from_email($from_email); }
  else { list($user,$mx)=split('@',$email); }

  # Common Headers
  $headers  = '';
  $headers .= 'From: '.$from.$eol;
  $headers .= 'Reply-To: '.$from.$eol;
  $headers .= 'Return-Path: '.$from.$eol;    // This sets the reply address
  $headers .= 'Message-ID: <'.md5(uniqid(rand())).'@'.$mx.'>'.$eol; // Generate Message-ID
  $headers .= 'Precedence: bulk'.$eol; // Added this assuming we're sending automated emails
  $headers .= 'X-Mailer: PHP/'.phpversion().$eol;          // This helps against spam-filters
  
  # Priority?
  if ($priority == 1) { 
	  $headers .= 'X-Priority: 1 (Highest)'.$eol;
	  $headers .= 'X-MSMail-Priority: High'.$eol;
	  $headers .= 'Importance: High'.$eol;
  }

  # Boundry for marking the split & Multitype Headers
  $headers .= 'Content-Type: multipart/mixed; boundary="'.$mime_boundary.'"'.$eol;
  $headers .= 'MIME-Version: 1.0'.$eol;
  
  $headers .= $eol; // End of headers

  # Open the first part of the mail
  $msg = '--'.$mime_boundary.$eol;
 
  $htmlalt_mime_boundary = $mime_boundary.'_htmlalt'; //we must define a different MIME boundary for this section
  # Setup for text and html -
  $msg .= 'Content-Type: multipart/alternative; boundary="'.$htmlalt_mime_boundary.'"'.$eol.$eol;

  # Text Version
  $msg .= '--'.$htmlalt_mime_boundary.$eol;
  $msg .= 'Content-Type: text/plain; charset='.$mailcharset.$eol;
  $msg .= 'Content-Transfer-Encoding: 8bit'.$eol.$eol;
  $msg .= $body.$eol.$eol;

	if (isset($htmlbody)) {
  # HTML Version
	  $msg .= '--'.$htmlalt_mime_boundary.$eol;
	  $msg .= 'Content-Type: text/html; charset='.$mailcharset.$eol;
	  $msg .= 'Content-Transfer-Encoding: 8bit'.$eol.$eol;
	  $msg .= $htmlbody.$eol.$eol;
	}

  //close the html/plain text alternate portion
  $msg .= '--'.$htmlalt_mime_boundary.'--'.$eol.$eol;

  if ($attachments !== false) {
    foreach($attachments as $attach) {
    	$file=$attach['tmp_name']; //we're assuming attachments are coming from $_FILES

      if (is_file($file)) {
      
        # File name of Attachment
        $filename = $attach['name'];
        if (!empty($filename) && (function_exists('mb_encode_mimeheader'))) { $filename=mb_encode_mimeheader($filename, $mailcharset, 'B'); }
       
        $handle=fopen($file, 'rb');
        $contents=fread($handle, filesize($file));
        $contents=chunk_split(base64_encode($contents));    //Encode The Data For Transition using base64_encode();
        fclose($handle);
        
        if (empty($attach['type'])) {
        	if (function_exists('mime_content_type')) { $attach['type']=mime_content_type($file); }
        }
        $filetype = $attach['type'];
       
        # Attachment
        $msg .= '--'.$mime_boundary.$eol;
        $msg .= 'Content-Type: '.$filetype.'; name="'.$filename.'"'.$eol;  // sometimes i have to send MS Word, use 'msword' instead of 'pdf'
        $msg .= 'Content-Transfer-Encoding: base64'.$eol;
        $msg .= 'Content-Description: '.$filename.$eol;
        $msg .= 'Content-Disposition: attachment; filename="'.$filename.'"'.$eol.$eol; // !! This line needs TWO end of lines !! IMPORTANT !!
        $msg .= $contents.$eol.$eol;
      }
    }
  }

  # Finished
  $msg .= '--'.$mime_boundary.'--'.$eol.$eol;  // finish with two eol's for better security. see Injection.
  
  # SEND THE EMAIL
  $params=ini_get('safe_mode')?'-f'.$from_email:null;
  $mail_sent = mail($to, $subject, $msg, $headers, $params);

  return $mail_sent;
}

function size_readable ($size, $retstring = null) { //returns a human readable filesize
				if ((!is_numeric($size)) && (file_exists($size))) { $size=filesize($size); }
        $sizes = array('B', 'kB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB');
        if ($retstring === null) { $retstring = '%01.2f %s'; }
        $lastsizestring = end($sizes);
        foreach ($sizes as $sizestring) {
                if ($size < 1024) { break; }
                if ($sizestring != $lastsizestring) { $size /= 1024; }
        }
        if ($sizestring == $sizes[0]) { $retstring = '%01d %s'; } // Bytes aren't normally fractional
        return sprintf($retstring, $size, $sizestring);
}

function format_time ($format,$time=false) {
	
	if (preg_match('/%/',$format)) {
		if ($time) { return strftime($format,$time); }
		else { return strftime($format); }
	}
	if ($time) { return date($format,$time); }
	else { return date($format); }
}

function getfiles($dir) {
	$ignore=array('.','..','index.php');
	$files=array();
	if ($handle = opendir($dir)) {
	    while (false !== ($file = readdir($handle))) {
	        if (!in_array($file,$ignore)) {
	            $files[]=$file;
	        }
	    }
	    closedir($handle);
	}
	return $files;
}

if (!function_exists('htmlspecialchars_decode')) {
    function htmlspecialchars_decode($text) {
        return strtr($text, array_flip(get_html_translation_table(HTML_SPECIALCHARS)));
    }
}

?>