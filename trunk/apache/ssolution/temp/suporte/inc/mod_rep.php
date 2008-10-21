<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

if(!defined('ISINC')) die('serious error');
if ($_SESSION['user']['type'] !== 'admin') { die(LANG_ERROR_DENIED); }
  
                if ($login[$a] || $login['ID'] == ADMIN) {
                      if (!$_POST['submit']) {
                          $inc = 'rep';
                      }
                      $err = '';
                      $r_id = preg_replace('/\D+/', '', $_POST['r_id']);
                      if ($_POST['submit']) {
                          $usercheck = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['reps']." WHERE username=$mysql_post[username]"));
                          $namecheck = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['reps']." WHERE name=$mysql_post[name]"));
                          if (empty($_POST['username'])) {
                              $err .= LANG_ERROR_MISSING_FIELDS.' (username)<br>';
                          }
                          if (empty($_POST['name'])) {
                              $err .= LANG_ERROR_MISSING_FIELDS.' (name)<br>';
                          }
                          if (empty($_POST['email'])) {
                              $err .= LANG_ERROR_MISSING_FIELDS.' (email)<br>';
                          }
                          if (empty($_POST['group'])) {
                              $err .= LANG_ERROR_MISSING_FIELDS.' (group)<br>';
                          }
                          if ($namecheck['name'] && $_POST['name'] !== $_POST['old_name']) {
                              $err .= LANG_ERROR_NAME_EXISTS.'<br>';
                          }
                          if ($usercheck['username'] && $_POST['username'] !== $_POST['old_username']) {
                              $err .= LANG_ERROR_REP_USER_EXISTS . '<br>';
                          }
                          if (!$err) {
                          	$pass=$_POST['password']?md5($_POST['password']):$_POST['password_hash'];
                          	$pass=preg_replace('/\*LOCKED\*/','',$pass);
                         		if ($_POST['locked'] == 'on') { $pass='*LOCKED*'.$pass; }

                            $sql = "UPDATE ".$db_table['reps']." SET username=$mysql_post[username],
                                                                  name=$mysql_post[name],
                                                                  email=$mysql_post[email],
                                                                  password='$pass',
                                                                  signature=$mysql_post[sig],
                                                                  user_group=$mysql_post[group]
                                                              WHERE ID='$r_id'";
                              if (!mysql_query($sql)) {
                              	$err .= LANG_FAILED.' '.mysql_error();
                              }
                          } else {
                              $err .= LANG_FIX_ABOVE_ERRORS;
                          }
                      } elseif ($_POST['delete']) {
                          $rnum = mysql_num_rows(mysql_query("SELECT * FROM ".$db_table['reps']));
                          if ($rnum == 1) {
                              $err = LANG_ERROR_ONE_REP;
                          }
                          if (!$err) {
                              mysql_query("DELETE FROM ".$db_table['reps']." WHERE ID=".$r_id);
                          }
                      }
                      elseif ($_POST['add']) {
                          $usercheck = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['reps']." WHERE username=".$mysql_post['username'].""));
                          if (!$_POST['name'] || !$_POST['email'] || !$_POST['username'] || !$_POST['password'] || !$_POST['group']) {
                              $err .= LANG_ERROR_MISSING_FIELDS . '<br>';
                          }
                          if ($usercheck['name']) {
                              $err .= LANG_ERROR_REP_USER_EXISTS . '<br>';
                          }
                          if (!$err) {
                          	$pass=$_POST['password']?md5($_POST['password']):$_POST['password_hash'];
                          	$pass=preg_replace('/\*LOCKED\*/','',$pass);
                         		if ($_POST['locked'] == 'on') { $pass='*LOCKED*'.$pass; }
                         		$sql ="INSERT INTO ".$db_table['reps']." (name, email, username, password, user_group, signature) ";
                            $sql.="VALUES ($mysql_post[name], $mysql_post[email], $mysql_post[username], '$pass', $mysql_post[group], $mysql_post[sig])";
                            mysql_query($sql);
                          }
                      }
                      $inc = 'rep';
                  }
?>