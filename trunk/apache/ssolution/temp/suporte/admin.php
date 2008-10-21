<?php
/*
  eTicket, Open Source Support Ticket System
  http://eticket.sourceforge.net/
  
  Released under the GNU General Public License
*/

	//ensure no caching by browser - START
	@header('Expires: '.gmdate('D, d M Y H:i:s T',0)); //A Date in the past
	@header('Last-Modified: '.gmdate('D, d M Y H:i:s T')); // always modified
	@header('Cache-Control: private'); // make private
	@header("Cache-Control: no-store, no-cache, must-revalidate"); // no cache for HTTP/1.1
	@header("Cache-Control: post-check=0, pre-check=0", false); // no cache for HTTP/1.1
	@header("Pragma: no-cache"); // no cache for HTTP/1.0
	//ensure no caching by browser - END

  require_once('init.php');

      if (($_SESSION['user']['type'] == 'admin') && ($login['name'])) {
      		if (($config['answer_method'] == 'pop3') && file_exists($config['pop3_automail'])) { @include_once($config['pop3_automail']); }
          switch ($a) {
              case "logout":
                  logout($page);
                  break;
              case "view":
                  $id = preg_replace('/\D+/', '', $_GET['id']);
                  $titles['viewticket'] = "$id: ".$titles['viewticket'];
                  $inc = 'viewticket';
                  break;
              case "delete":
              	if ($login[$a] || $login['ID'] == ADMIN) {
                  if (count($_POST['t'])) {
                      foreach ($_POST['t'] as $id => $val) {
                      	$id=preg_replace('/\D+/', '', $id);
                        $delete=DeleteTicket($id);
                        if (!empty($delete)) { $err[]=LANG_DELETE.' '.LANG_ERROR." $id: $delete"; }
                      }
                  }
                 }
                  break;
              case "close":
                  if (count($_POST['t'])) {
                      foreach ($_POST['t'] as $tid => $val) {
                          CloseTicket($tid);
                      }
                  }
                  break;
              case "reopen":
                  if (count($_POST['t'])) {
                      foreach ($_POST['t'] as $tid => $val) {
                          ReopenTicket($tid);
                      }
                  }
                  break;
              case "transfer":
              		$tid=preg_replace('/\D+/', '', $_POST['tid']);
              		$cid=preg_replace('/\D+/', '', $_POST['cid']);
              		$add_msg=$_POST['add_msg'];
              		$alert=isset($_POST['trans_alert'])?true:false;
									TransCatTicket($tid,$cid,$add_msg,$alert);
                  header('Location: '.$_SERVER['REQUEST_URI']); die();
                  break;
             case "transfer_rep":
              		$tid=preg_replace('/\D+/', '', $_POST['tid']);
              		$rid=$_POST['rid']?preg_replace('/\D+/', '', $_POST['rid']):$_SESSION['user']['id'];
              		$alert=isset($_POST['trans_alert'])?true:false;
									TransRepTicket($tid,$rid,$alert);
                  header('Location: '.$_SERVER['REQUEST_URI']); die();
                   break;
              case "priority":
                  $pri = preg_replace('/\D+/', '', $_POST['pri']);
                  $tid = preg_replace('/\D+/', '', $_POST['tid']);
                  $query = mysql_query("UPDATE ".$db_table['tickets']." SET priority='".$pri."' WHERE ID=".$tid);
                  if ($query) { header('Location: '.$_SERVER['REQUEST_URI']); die(); }
                  else { $err = LANG_FAILED.': '.mysql_error(); }
                  break;
              case "post":
							include_once(INC_DIR.'post.php');
							break;
              case "headers":
                  header('Content-type: text/plain;');
                  $msgid=(int) $_GET['msg'];
                  $message = mysql_fetch_array(mysql_query("SELECT headers FROM ".$db_table['messages']." WHERE ID='".$msgid."'"));
                  echo $message['headers']; die();
                  break;
              case "my":
              include_once(INC_DIR.'mod_'.$a.'.php');
              break;
              
              case "pref":
              include_once(INC_DIR.'mod_'.$a.'.php');
              break;
              
              case "mail":
              include_once(INC_DIR.'mod_'.$a.'.php');
              break;
              
              case "cat":
              include_once(INC_DIR.'mod_'.$a.'.php');
              break;
              
              case "rep":
              include_once(INC_DIR.'mod_'.$a.'.php');
              break;
              
              case "user_group":
              include_once(INC_DIR.'mod_'.$a.'.php');
              break;
              
              case "banlist":
							include_once(INC_DIR.'mod_'.$a.'.php');
              break;
          }
      }
      else {
          if ($_POST) {
              $err = LANG_ERROR_LOGIN;
              session_destroy();
          }
          $inc = 'admin_login';
      }
  if (!isset($inc)) $inc = 'main';

  $include=$site_header; if (file_exists($include)) { include_once($include); }
  $include=$site_errors; if (file_exists($include)) { include_once($include); }
  if ($login && file_exists('core.js')) { echo '<script language="JavaScript" type="text/javascript" src="core.js"></script>'; }
  include_once(INC_DIR."$inc.php");
  echo '<a name="end"></a>';
  $include=$site_footer; if (file_exists($include)) { include_once($include); }
?>