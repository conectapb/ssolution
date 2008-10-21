<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

if(!defined('ISINC')) die('serious error');
if ($_SESSION['user']['type'] !== 'admin') { die(LANG_ERROR_DENIED); }
?>

<form action="<?=htmlspecialchars($_SERVER['REQUEST_URI'])?>" method="post">
<input type="hidden" name="a" value="<?=$a?$a:'banlist'?>">
<input type="hidden" name="e" value="<?=$e?$e:'delete'?>">
<p>
<input type="hidden" name="ab" value="D">
<?php
foreach ($key as $reckey) {
?>
	<input type="hidden" name="key[]" value="<?=$reckey?>">
<?php
}
?>
<table border="0" cellspacing="1" cellpadding="4" class="TableMsg">
<tr>
<td class="TableHeaderText"><?=LANG_DELETE_BANNED?></td>
</tr>
<?php
$recCount = 0;
while ($row = mysql_fetch_array($rs)) {
	$recCount = $recCount++;	

	$x_value = @$row["value"];
	$x_value_id = @$row["value_id"];
?>
	<tr class="mainTableAlt">
	<td><?=$x_value?></td>
	</tr>
	<?php
}
mysql_free_result($rs);
?>
</table>
<br>
<input class="inputsubmit" type="submit" name="Action" value="<?=LANG_CONFIRM_DELETE?>">
</form>
<a href="admin.php?a=banlist"><?=LANG_BACK_TO_LIST?></a>
