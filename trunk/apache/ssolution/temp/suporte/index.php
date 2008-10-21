<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

require_once('init.php');
$include=$site_header; if (file_exists($include)) { include_once($include); }
$include=$site_errors; if (file_exists($include)) { include_once($include); }

?>
<div class="welcome">
<h2><?=LANG_WELCOME?></h2>
<p><?=LANG_LOGIN_TIP?></p>
</div>
<div class="openBox">
<hr>
<h2><?=LANG_OPEN_TICKET?></h2>
<?php include_once('open_inc.php'); ?>
</div>
<div class="loginBox">
<hr>
<h2><?=LANG_VIEW_STATUS?></h2>
<form action="view.php" method="post">
<table cellspacing="0" cellpadding="3" border="0" class="loginBox">
    <tr> 
      <td><b><?=LANG_YOUR_EMAIL?>:</b></td>
      <td><input class="inputform" type="text" name="login_email" size="25" value="<?=$e?>"></td>
      <td><b><?=LANG_TICKET_ID?>:</b></td>
      <td><input class="inputform" type="text" name="login_ticket" size="10" value="<?=$t?>"></td>
      <td><input class="inputsubmit" type="submit" value="<?=LANG_VIEW_STATUS?>"></td>
    </tr>
</table>
</form>
</div>
<?php $include=$site_footer; if (file_exists($include)) { include_once($include); } ?>