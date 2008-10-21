<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

if(!defined('ISINC')) die('serious error');
if ($_SESSION['user']['type'] !== 'admin') { die(LANG_ERROR_DENIED); }

                  if ($_POST['submit']) {
                      $err = '';
                      $password=escape_string($_POST['password']);
                      if (!$_POST['name'] || !$_POST['email'] || !$_POST['password'] || !$_POST['username']) {
                          $err .= LANG_ERROR_MISSING_FIELDS.'<br>';
                      }
                      $passcheck = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['reps']." WHERE username='".$_SESSION['user']['id']."' AND password=MD5($password)"));
                      if (!$passcheck['ID']) {
                          $err .= LANG_ERROR_INVALID_PASS.'<br>';
                      }
                      $usercheck = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['reps']." WHERE username='".$_SESSION['user']['id']."'"));
                      if ($usercheck['ID'] && $_POST['username'] !== $_SESSION['user']['id']) {
                          $err .= LANG_ERROR_USER_EXISTS.'<br>';
                      }
                      if ($_POST['npassword'] !== $_POST['vpassword']) {
                          $err .= LANG_ERROR_PASSWORD_NOMATCH.'<br>';
                      }
                      if (!$err) {
                          if ($_POST['npassword']) {
                          	$_POST['current_password'] = $_POST['npassword'];
                          	$password=escape_string($_POST['npassword']);
                          } else {
                          	$_POST['current_password'] = $_POST['password'];
                          	$password=escape_string($_POST['password']);
                          }
                          $__name=escape_string($_POST['name']);
                          $__email=escape_string($_POST['email']);
                          $__user=escape_string($_POST['username']);
                          $__sig=escape_string($_POST['sig']);
                          mysql_query("UPDATE ".$db_table['reps']." SET username=$__user,
                                                 name=$__name,
                                                 email=$__email,
                                                 password=MD5($password),
                                                 signature=$__sig
                                           WHERE username='".$_SESSION['user']['id']."'");
                          $_SESSION['user']['pass'] = md5($_POST['current_password']);
                          $_SESSION['user']['id'] = $_POST['username'];
                      }
                      //reload configs
                      if (!$err) {
                          $config = @mysql_fetch_array(mysql_query('SELECT * FROM '.$db_table_config));
                      }
                  }
                  $inc = 'my';
                  
?>