<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

if(!defined('ISINC')) die('serious error');
if ($_SESSION['user']['type'] !== 'admin') { die(LANG_ERROR_DENIED); }

                  if ($login[$a] || $login['ID'] === ADMIN) {
                      if ($_POST['submit']) {
                          $mysql_post['hidden'] = isset($_POST['hidden'])?1:0;
                          $namecheck = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['categories']." WHERE name=$mysql_post[name]"));
                          $err = '';
                          if (!$_POST['name'] or !$_POST['email']) {
                              $err .= LANG_ERROR_MISSING_FIELDS . '<br>';
                          }
                          //if (($namecheck['name']) && ($_POST['name'] !== $_POST['old_name'])) { $err .= LANG_ERROR_CAT_EXISTS.'<br>'; }
                          if (!$err) {
                              mysql_query("UPDATE ".$db_table['categories']." SET name=$mysql_post[name],
                                                                  pophost=$mysql_post[pophost],
                                                                  popuser=$mysql_post[popuser],
                                                                  poppass=$mysql_post[poppass],
                                                                  email=$mysql_post[email],
                                                                  signature=$mysql_post[sig],
                                                                  hidden=$mysql_post[hidden]
                                                               WHERE ID=$mysql_post[c_id]");
                          }
                      } elseif ($_POST['delete']) {
                          $rnum = mysql_num_rows(mysql_query("SELECT * FROM ".$db_table['categories']));
                          $err = '';
                          if ($rnum === 1) {
                              $err = LANG_ERROR_ONE_REP;
                          }
                          if (!$err) {
                              mysql_query("DELETE FROM ".$db_table['categories']." WHERE ID=" . $mysql_post['c_id']);
                          }
                      } elseif ($_POST['add']) {
                          $namecheck = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['categories']." WHERE name=$mysql_post[name]"));
                          $err = '';
                          if (!$_POST['name'] || !$_POST['email']) {
                              $err .= LANG_ERROR_MISSING_FIELDS . '<br>';
                          }
                          if (strtolower($_POST['name']) === strtolower($namecheck['name'])) {
                              $err .= LANG_ERROR_CAT_EXISTS . '<br>';
                          }
                          if (!$err) {
                              $mysql_post['hidden'] = isset($_POST['hidden'])?1:0;
                              mysql_query("INSERT INTO ".$db_table['categories']." (name, pophost, popuser, poppass, email, signature, hidden)
                                     VALUES
                                   ($mysql_post[name], $mysql_post[pophost], $mysql_post[popuser], $mysql_post[poppass], $mysql_post[email], $mysql_post[sig], $mysql_post[hidden])");
                              $_POST['c_id'] = mysql_insert_id(); // select category created
                          }
                      }
                      $inc = 'cat';
                      }
?>