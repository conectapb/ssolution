<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

require_once('init.php');

if (($_SESSION['user']['type']) && ($login)) { $inc='search_form'; }
else { header('Location: '.$page); die(); }

$include=$site_header; if (file_exists($include)) { include_once($include); }
$include=$site_errors; if (file_exists($include)) { include_once($include); }
if ($login && file_exists('core.js')) { echo '<script language="JavaScript" type="text/javascript" src="core.js"></script>'; }
if (isset($inc)) { include_once(INC_DIR."$inc.php"); }
if (isset($_REQUEST['s'])) { include_once(INC_DIR."main.php"); }
$include=$site_footer; if (file_exists($include)) { include_once($include); }
?>
