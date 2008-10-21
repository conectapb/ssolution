<?php

/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

require_once('init.php');
$err=array(); $warn=array();
if ((empty($_POST['message'])) && ($_SESSION['user']['type'] == 'admin')) { $_POST['message']=LANG_NEWTICKET; }

if (isset($_POST['submit_x'])) {
  	
  		/* Input Error Checking */
  		$email_confirm=$login?$_POST['email']:$_POST['email_confirm'];
      if (!$_POST['subject']) {
          $err[] = LANG_ERROR_NO_SUBJECT;
      }
      if (!is_email($_POST['email'])) {
          $err[] = LANG_ERROR_INVALID_EMAIL;
      }
      if ($_POST['email'] != $email_confirm) {
          $err[] = LANG_ERROR_EMAIL_NOMATCH;
      }
      if (!$_POST['name']) {
          $err[] = LANG_ERROR_NO_NAME;
      }
      if (!$_POST['message']) {
          $err[] = LANG_ERROR_NO_MSG;
      }

      //CAPTCHA MOD - START
      if ((file_exists($rootpath_dir.$captcha_file)) && ($_SESSION['user']['type'] != 'admin')) {
      	if (md5($_POST['captcha_input']) != $_SESSION['captcha_hash']) { $err[] = LANG_ERROR_CAPTCHA; }
    	}
      //CAPTCHA MOD - END

			if ($_SESSION['user']['type'] == 'client') {
	      $sql_email = escape_string($_POST['email']);
	      $c = mysql_fetch_array(mysql_query("SELECT COUNT(*) AS cnt FROM tickets WHERE email=".$sql_email." AND status='open'"));
	      if ($c['cnt'] > $config['ticket_max']) {
	      		$limit_msg = $config['limit_msg'];
	          $limit_msg = str_replace('%url', $config['root_url'], $limit_msg);
	          $limit_msg = str_replace('%local_email', $cat_row['email'], $limit_msg);
	          $limit_msg = str_replace('%user_email', $_POST['email'], $limit_msg);
	          $limit_msg = str_replace('%ticket_max', $config['ticket_max'], $limit_msg);
	
	          $err[] = $limit_msg;
	          unset($limit_msg);
	      }
    	}
      if (empty($err)) {
      	$message=$_POST['message'];
      	if (isset($_POST['e'])) {
      		foreach ($_POST['e'] as $key => $val) { $message.="\n$key: $val"; }
      	}
      	if ((!empty($_POST['answer'])) && ($_SESSION['user']['type'] == 'admin')) { $answer=$_POST['answer']; }
        $ticket = CreateTicket($_POST['subject'], $_POST['name'], $_POST['email'], $_POST['cat'], $_POST['phone'], $_POST['pri'], $_SERVER['REMOTE_ADDR'], $message,!$answer);
        if (!is_numeric($ticket)) { $err[] = LANG_FAILED.': '.LANG_OPEN_TICKET.' '.$ticket; }
        
        $files=$answer? false : $_FILES; //if an answer, don't include files in the PostMessage, else do.
				$msgid = PostMessage($ticket, $message, '', false, $files);
		    if (mysql_error()) { $err[]=LANG_FAILED.': '.LANG_MSG.' '.mysql_error(); }
		    if (!is_numeric($msgid)) { $err[]=LANG_FAILED.' '.LANG_MSG.' '.$msgid; }
		    if (is_array($msgid)) { $warn=$msgid; }
		    if (empty($msgid)) { $err[] = LANG_ERROR_NOT_POSTED; }

        if (!empty($answer)) {
					$userid=$_SESSION['user']['id'];
					$reps_row=mysql_fetch_array(mysql_query("SELECT ID,signature FROM ".$db_table['reps']." WHERE username='$userid'"));
					$repid=$reps_row['ID'];

		    	$ansid = PostAnswer($answer, $repid, $msgid, $_FILES);
		    	if (mysql_error()) { $err[]=LANG_FAILED.' '.LANG_ANSWER.' '.mysql_error(); }
		    	if (!is_numeric($ansid)) { $err[]=LANG_FAILED.' '.LANG_ANSWER.' '.$ansid; }
		    	if (is_array($ansid)) { $warn=$ansid; }
		    	if (empty($ansid)) { $err[] = LANG_ERROR_NOT_POSTED; }
        }
    	}
    	if (empty($err)) {
    		if ($login) {
	    		$_SESSION['view']['status'] = 'open';

      	}
        $submitmsg  = '<h3>'.LANG_OPENED_TICKET_SUBJECT.'</h3>';
        $submitmsg .= '<p>'.nl2br(LANG_OPENED_TICKET_MSG).'</p>';
    		if ($login) {
	    		$_SESSION['view']['status'] = 'open';
	    		if (defined('NO_REDIRECT')) {
		    		if ($_SESSION['user']['type'] == 'admin') { $submitmsg .= '<p><a href="'."$page?a=view&id=$ticket".'">'.LANG_TITLE_VIEWTICKET.'</a></p>'; }
		        else { $submitmsg .= '<p><a href="'.$page.'>'.LANG_VIEW_OPEN.'</a></p>'; }
		      }
		      else {
		    		if ($_SESSION['user']['type'] == 'admin') { header("Location: $page?a=view&id=$ticket"); die(); }
		        else { header('Location: '.$page); die(); }
	      	}
      	}
    	}
			elseif (mysql_error()) { $err[] = LANG_FAILED.': '.mysql_error(); }
	    if (!empty($warn)) { $_SESSION['user']['warn'] = $warn; }
	    if (!empty($err)) { $_SESSION['user']['err'] = $err; }
}

$include=$site_header; if (file_exists($include) && !defined('NO_THEME')) { include_once($include); }
$include=$site_errors; if (file_exists($include)) { include_once($include); }
	if (file_exists('core.js') && !defined('NO_JS')) { echo '<script language="JavaScript" type="text/javascript" src="core.js"></script>'; }
  if (isset($submitmsg)) { echo $submitmsg; }
  else { include_once(INC_DIR.'open_form.php'); }
$include=$site_footer; if (file_exists($include) && !defined('NO_THEME')) { include_once($include); }
?>