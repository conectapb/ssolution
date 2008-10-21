<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

if(!defined('ISINC')) die('serious error');
if ($_SESSION['user']['type'] !== 'admin') { die(LANG_ERROR_DENIED); }

if ($login[$a] || $login['ID'] == ADMIN) {
    if ($_POST['submitmail']) {
        $_POST['alert_new'] = isset($_POST['alert_new'])?1:0;
        $_POST['ticket_response'] = isset($_POST['ticket_response'])?1:0;
        $_POST['message_response'] = isset($_POST['message_response'])?1:0;
        $_POST['limit_response'] = isset($_POST['limit_response'])?1:0;
        $_POST['trans_response'] = isset($_POST['trans_response'])?1:0;

        //keys for config table
        $query=mysql_query("SHOW COLUMNS FROM ".$db_table['config']);
        $keys=array();
        while ($fields=mysql_fetch_array($query)) {
        	$keys[]=$fields['Field'];
        }
        $sqls=array();
        foreach ($keys as $key) {
	        if (isset($_POST[$key])) $sqls[]="UPDATE ".$db_table['config']." SET ".$key." = '".$_POST[$key]."';";
      	}
        //normal keys for settings
        $query=@mysql_query("SELECT `key` FROM `".$db_table['settings']."`  WHERE `group`='' OR `group` IS NULL");
        if ($query) {
	        while ($keys=mysql_fetch_array($query)) {
	        	$key=$keys['key'];
		        if (isset($_POST[$key])) $sqls[]="UPDATE ".$db_table['settings']." SET VALUE = '".$_POST[$key]."' WHERE `key` = '".$key."' LIMIT 1;";
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
    else {
    	$inc = 'mail';
    }
}
?>