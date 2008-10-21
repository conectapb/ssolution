<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

if(!defined('ISINC')) die('serious error');
if ($_SESSION['user']['type'] !== 'admin') { die(LANG_ERROR_DENIED); }

                  if ($login[$a] || $login['ID'] == ADMIN) {
                      if ($_POST['submit']) {
                          $mysql_post['rep'] = isset($mysql_post['rep'])?1:0;
                          $mysql_post['cat'] = isset($mysql_post['cat'])?1:0;
                          $mysql_post['group'] = isset($mysql_post['group'])?1:0;
                          $mysql_post['pref'] = isset($mysql_post['pref'])?1:0;
                          $mysql_post['mail'] = isset($mysql_post['mail'])?1:0;
                          $mysql_post['banlist'] = isset($mysql_post['banlist'])?1:0;
                          if ($_POST['cat_access']['all']) { $ca = 'all'; }
                          else {
                          	foreach ($_POST['cat_access'] as $id => $val) {
                          		$id=escape_string($id,false);
	                            if ($val == 'on') { $ca[] = $id; }
                            }
                            $ca = implode(':',$ca);
                          }
                          $namecheck = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['groups']." WHERE name=$mysql_post[name]"));
                          $err = '';
                          if ($_POST['g_id'] == ADMIN) {
                              $err .= LANG_ERROR_ADMIN_GROUP_NOMOD.'<br>';
                          }
                          if (!$_POST['name']) {
                              $err .= LANG_ERROR_MISSING_FIELDS.'<br>';
                          }
                          if ($namecheck['name'] && ($_POST['name'] !== $_POST['old_name'])) {
                              $err .= LANG_ERROR_GROUP_EXISTS.'<br>';
                          }
                          if (!$err) {
                              mysql_query("UPDATE ".$db_table['groups']." SET name=$mysql_post[name],
                                                              rep=$mysql_post[rep],
                                                              cat=$mysql_post[cat],
                                                              user_group=$mysql_post[group],
                                                              pref=$mysql_post[pref],
                                                              mail=$mysql_post[mail],
                                                              banlist=$mysql_post[banlist],
                                                              cat_access='$ca'
                                                           WHERE ID=$mysql_post[g_id]");
                          }
                      }
                      elseif ($_POST['delete']) {
                          $err = '';
                          if ($_POST['g_id'] == ADMIN) {
                              $err .= LANG_ERROR_ADMIN_GROUP_NODEL.'<br>';
                          }
                          if ($login['ID'] == $_POST['g_id']) {
                              $err .= LANG_ERROR_GROUP_INUSE.'<br>';
                          }
                          if (!$err) {
                              mysql_query("DELETE FROM ".$db_table['groups']." WHERE ID=".$mysql_post['g_id']);
                          }
                      }
                      elseif ($_POST['add']) {
                          $mysql_post['rep'] = isset($mysql_post['rep'])?1:0;
                          $mysql_post['cat'] = isset($mysql_post['cat'])?1:0;
                          $mysql_post['group'] = isset($mysql_post['group'])?1:0;
                          $mysql_post['pref'] = isset($mysql_post['pref'])?1:0;
                          $mysql_post['mail'] = isset($mysql_post['mail'])?1:0;
                          $mysql_post['banlist'] = isset($mysql_post['banlist'])?1:0;
                          if ($_POST['cat_access']['all']) { $ca = 'all'; }
                          else {
                          	foreach ($_POST['cat_access'] as $id => $val) {
	                            if ($val == 'on') { $ca[] = $id; }
                            }
                            $ca = implode(':',$ca);
                          }
                          $namecheck = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['groups']." WHERE name=$mysql_post[name]"));
                          $err = '';
                          if (!$_POST['name']) {
                              $err .= LANG_ERROR_MISSING_FIELDS . '<br>';
                          }
                          if ($namecheck['name']) {
                              $err .= LANG_ERROR_GROUP_EXISTS . '<br>';
                          }
                          if (!$err) {
                              mysql_query("INSERT INTO ".$db_table['groups']." (name, rep, cat, user_group, pref, mail, banlist, cat_access)
                                                    VALUES
                                ($mysql_post[name], $mysql_post[rep], $mysql_post[cat], $mysql_post[group], $mysql_post[pref], $mysql_post[mail], $mysql_post[banlist], '$ca')");
                          }
                      }
                      $inc = 'user_group';
                  }
?>