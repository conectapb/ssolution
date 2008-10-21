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

  if ($_SESSION['user']['type'] == 'client') {
      if ($login) {
          switch ($a) {
              case "view":
                  $id = preg_replace('/\D+/', '', $_REQUEST['id']);
                  $titles['viewticket'] = "$id: ".$titles['viewticket'];
                  $inc = 'viewticket';
                  break;
              case "close":
                  if (count($_POST['t'])) {
                      foreach ($_POST['t'] as $id => $val) {
                          CloseTicket($id);
                      }
                  }
                  break;
              case "reopen":
                  if (count($_POST['t'])) {
                      foreach ($_POST['t'] as $id => $val) {
                          ReopenTicket($id);
                      }
                  }
                  break;
              case "post":
              include_once(INC_DIR.'post.php');
              break;
              case "logout":
              		$page=$page?$page:$_SERVER['PHP_SELF'];
                  logout($page);
                  break;
          }
      } else {
          if ($_POST) {
              $err = LANG_ERROR_LOGIN;
              session_destroy();
          }
          $inc = 'user_login';
      }
  }
  else { $inc = 'user_login'; }
  if (!isset($inc)) $inc='main';
  
  $include = $site_header; if (file_exists($include)) { include_once($include); }
  $include=$site_errors; if (file_exists($include)) { include_once($include); }
  if ($login && file_exists('core.js')) { echo '<script language="JavaScript" type="text/javascript" src="core.js"></script>'; }
  include_once(INC_DIR."$inc.php");
  echo '<a name="end"></a>';
  $include = $site_footer; if (file_exists($include)) { include_once($include); }
?>
