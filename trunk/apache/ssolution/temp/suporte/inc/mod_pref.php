<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

if(!defined('ISINC')) die('serious error');
if ($_SESSION['user']['type'] !== 'admin') { die(LANG_ERROR_DENIED); }

if ($login[$a] || $login['ID'] == ADMIN) {
    if ($_POST['submitpref']) {
    	$sqls=array();
        if ($_POST['accept_attachments']) {
            if (!(is_writable($config['attachment_dir'])) && (file_exists($config['attachment_dir']))) {
                unset($config['accept_attachments']);
                $inc = 'pref';
            }
        }
        $_POST['accept_attachments']=isset($_POST['accept_attachments'])?1:0;
        $_POST['remove_original']=isset($_POST['remove_original'])?1:0;
        $_POST['search_disp']=isset($_POST['search_disp'])?1:0;
        $_POST['save_headers']=isset($_POST['save_headers'])?1:0;
        //keys for config table
        $query=mysql_query("SHOW COLUMNS FROM ".$db_table['config']);
        $keys=array();
        while ($fields=mysql_fetch_array($query)) {
        	$keys[]=$fields['Field'];
        }
        foreach ($keys as $key) {
	        if (isset($_POST[$key])) $sqls[]="UPDATE ".$db_table['config']." SET ".$key." = ".escape_string($_POST[$key]).";";
      	}
	    if (!empty($sqls)) {
				if (mysql_error()) { $err[] = LANG_FAILED.': '.mysql_error(); }
	      foreach ($sqls as $sql) {
	      	if (!mysql_query($sql)) { $err[] = LANG_FAILED.': '.mysql_error()." :<br>\n $sql"; }
	      }
	    }
	    if (empty($err)) { header('Location: '.$_SERVER['REQUEST_URI']); die(); }
    }
    elseif ($_POST['submitset']) {
    	$sqls=array();
    	$_POST['spamassassin_enable']=isset($_POST['spamassassin_enable'])?1:0;
        //normal keys for settings
        $query=@mysql_query("SELECT `key` FROM `".$db_table['settings']."` WHERE `group`='' OR `group` IS NULL");
        if ($query) {
	        while ($keys=mysql_fetch_array($query)) {
	        	$key=$keys['key'];
		        if (isset($_POST[$key])) $sqls[]="UPDATE ".$db_table['settings']." SET VALUE = ".escape_string($_POST[$key])." WHERE `key` = '".$key."' LIMIT 1;";
	      	}
      	}
	    if (!empty($sqls)) {
				if (mysql_error()) { $err[] = LANG_FAILED.': '.mysql_error(); }
	      foreach ($sqls as $sql) {
	      	if (!mysql_query($sql)) { $err[] = LANG_FAILED.': '.mysql_error()." :<br>\n $sql"; }
	      }
	    }
	    if (empty($err)) { header('Location: '.$_SERVER['REQUEST_URI']); die(); }
    }
    elseif ($_POST['remove_filetype'] && $_POST['filetypes']) {
        $sql="UPDATE ".$db_table['config']." SET filetypes = REPLACE(filetypes, '$mysql_post[filetypes];', '')";
        if (!mysql_query($sql)) { $err[] = LANG_FAILED.': '.mysql_error()." :<br>\n $sql"; }
        if (empty($err)) { header('Location: '.$_SERVER['REQUEST_URI']); die(); }
    }
    elseif ($_POST['add_filetype'] && $_POST['ext']) {
    		$ext=$_POST['ext'];
    		if ($ext{0} != '.') { $ext='.'.$ext; }
        $sql="UPDATE ".$db_table['config']." SET filetypes = CONCAT(filetypes, '$ext;')";
        if (!mysql_query($sql)) { $err[] = LANG_FAILED.': '.mysql_error()." :<br>\n $sql"; }
        if (empty($err)) { header('Location: '.$_SERVER['REQUEST_URI']); die(); }
    }
    elseif ($_POST['answer_add']) {//button submit
    	$group='answers';
    	$value=$mysql_post['answer_value'];
    	$key=$mysql_post['answer_key'];
    	$sql = "INSERT INTO ".$db_table['settings']." (`group`,`key`,`value`) VALUES ('".$group."',".$key.",".$value.");";
    	if (!mysql_query($sql)) { $err[] = LANG_FAILED.': '.mysql_error()." :<br>\n $sql"; }
    	$config['answers'][$key]=$value;
    	$_POST['answer']=$key;
    }
    elseif ($_POST['answer_save']) {//button submit
    	$group='answers';
    	$value=$mysql_post['answer_value'];
    	$key=$mysql_post['answer'];
    	$sql = "UPDATE `".$db_table['settings']."` SET `value` = ".$value." WHERE `key` = ".$key." AND `group` = '".$group."' LIMIT 1;";
    	if (!mysql_query($sql)) { $err[] = LANG_FAILED.': '.mysql_error()." :<br>\n $sql"; }
    	$config['answers'][$_POST['answer']]=$_POST['answer_value'];
    }
    elseif ($_POST['answer_remove']) {//button submit
    	$group='answers';
    	$key=$mysql_post['answer'];
    	$sql="DELETE FROM `".$db_table['settings']."` WHERE `key` = '".$key."' AND `group` = '".$group."' LIMIT 1";
    	if (!mysql_query($sql)) { $err[] = LANG_FAILED.': '.mysql_error()." :<br>\n $sql"; }
    	if (empty($err)) { header('Location: '.$_SERVER['REQUEST_URI']); die(); }
    }
    elseif ($_POST['pri_save']) {//button submit
    	$key=(string) $mysql_post['pri'];
    	$group='pri_text';
    	$value=$mysql_post[$group];
    	$sql = "UPDATE `".$db_table['settings']."` SET `value` = ".$value." WHERE `key` = ".$key." AND `group` = '".$group."' LIMIT 1;";
    	if (!mysql_query($sql)) { $err[] = LANG_FAILED.': '.mysql_error()." :<br>\n $sql"; }
    	$config['pri_text'][(string) $config['pri'][$_POST['pri']]]=stripslashes($_POST['pri_text']);
    	$group='pri_style';
    	$value=$mysql_post[$group];
    	$sql = "UPDATE `".$db_table['settings']."` SET `value` = ".$value." WHERE `key` = ".$key." AND `group` = '".$group."' LIMIT 1;";
    	if (!mysql_query($sql)) { $err[] = LANG_FAILED.': '.mysql_error()." :<br>\n $sql"; }
    	$config['pri_style'][(string) $config['pri'][$_POST['pri']]]=stripslashes($_POST['pri_style']);
    }
    $inc = 'pref';
}
?>