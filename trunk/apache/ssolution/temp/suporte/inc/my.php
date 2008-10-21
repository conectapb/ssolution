<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

if(!defined('ISINC')) die('serious error');
if ($_SESSION['user']['type'] !== 'admin') { die(LANG_ERROR_DENIED); }
load_buttons();
$rep = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['reps']." WHERE username='".$_SESSION['user']['id']."'"));
?>

<form action="<?=htmlspecialchars($_SERVER['REQUEST_URI'])?>" method="post">
	<input type="hidden" name="a" value="my">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td>
	
	<table width="100%" border="0" cellspacing="1" cellpadding="2" class="TableMsg">
	<tr>
		<td class="TableHeaderText" width="120"><?=LANG_TITLE_MY?></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="mainTable"><b><?=LANG_USER; ?>:</b></td>
		<td class="mainTableAlt"><input type="text" name="username" value="<?=$rep['username']?>"></td>
	</tr>
	<tr>
		<td class="mainTable"><b><?=LANG_NAME; ?>:</b></td>
		<td class="mainTableAlt"><input type="text" name="name" value="<?=$rep['name']?>"></td>
	</tr>
	<tr>
		<td class="mainTable"><b><?=LANG_EMAIL; ?>:</b></td>
		<td class="mainTableAlt"><input type="text" name="email" value="<?=$rep['email']?>"></td>
	</tr>
	<tr>
		<td class="mainTable"><b><?=LANG_PASS; ?>:</b></td>
		<td class="mainTableAlt"><input type="password" name="password"></td>
	</tr>
	<tr>
		<td class="mainTable">&nbsp;<?=LANG_NPASS; ?>:</td>
		<td class="mainTableAlt"><input type="password" name="npassword"></td>
	</tr>
	<tr>
		<td class="mainTable">&nbsp;<?=LANG_VPASS; ?>:</td>
		<td class="mainTableAlt"><input type="password" name="vpassword"></td>
	</tr>
	<tr>
		<td class="mainTable">&nbsp;<?=LANG_SIGNATURE; ?>:</td>
		<td class="mainTableAlt"><textarea name="sig" cols="30" rows="5"><?=$rep['signature']?></textarea></td>
	</tr>
	</table>

			<br>
			<input class="inputsubmit" type="submit" name="submit" value="<?=LANG_SAVE_CHANGES?>">
			</td>
		</tr>
	</table>
</form>
