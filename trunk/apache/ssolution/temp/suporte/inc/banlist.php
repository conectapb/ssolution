<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

if(!defined('ISINC')) die('serious error');
if ($_SESSION['user']['type'] !== 'admin') { die(LANG_ERROR_DENIED); }
load_buttons();
?>

<script type="text/javascript">
function validateForm(form) {
	var isValid = true;
	// Check each field individually
	if(form.x_value.value.length == 0) {
		msg = "<?=LANG_ERROR_VALUE_EMPTY?>";
		isValid = false;
	}
	// Show the error message to the user
	if(!isValid) alert(msg);
	return isValid;
}
</script>


<form action="<?=htmlspecialchars($_SERVER['REQUEST_URI'])?>" name="banlist">
<input type="hidden" name="a" value="banlist">
<table border="0" cellspacing="0" cellpadding="4" align="center">
	<tr>
		<td><?=LANG_QUICK_SEARCH?>:</td>		
		<td><input type="text" name="psearch" size="20" value="<?=$_SESSION['banlist']['pSearch']?>"></td>
			<td><input class="inputsubmit" type="submit" name="submit" value="<?=LANG_SUBMIT?>">
		&nbsp;&nbsp;<a href="admin.php?a=banlist&amp;cmd=reset"><?=LANG_SHOW_ALL?></a>
		</td>
	</tr>
		<tr><td>
		&nbsp;</td><td colspan="2"><input type="radio" name="psearchtype" value=""<?= ($_SESSION['banlist']['pSearchType'] == '') ? ' checked': ''?>><?=LANG_EXACT_PHRASE?>&nbsp;
		&nbsp;<input type="radio" name="psearchtype" value="AND"<?= ($_SESSION['banlist']['pSearchType'] == 'AND') ? ' checked': ''?>><?=LANG_ALL_WORDS?>&nbsp;
		&nbsp;<input type="radio" name="psearchtype" value="OR"<?= ($_SESSION['banlist']['pSearchType'] == 'OR') ? ' checked': ''?>><?=LANG_ANY_WORD?>
		</td></tr>
</table>
</form>
<br>
<form name="banlist_add" action="admin.php" method="post" onsubmit="return validateForm(this);">
<input type="hidden" name="a" value="banlist">
<input type="hidden" name="e" value="add">
<input type="hidden" name="ab" value="A">
<table width="100%" border="0" cellspacing="1" cellpadding="2" class="TableMsg">
  <tr> 
    <td class="TableHeaderText"><?=LANG_ADD_TO_BANLIST?></td>
	</tr>
	<tr>
		<td class="mainTable">
		<table border="0" cellspacing="0" cellpadding="3">
		<tr> 
		<td><input type="text" id="x_value" name="x_value" size="100%" maxlength="255" value=""></td>
		</tr>
		<tr>
		<td><input class="inputsubmit" type="submit" name="Action" value="<?=LANG_ADD?>"></td>
		</tr>
		</table>
		</td>
	</tr>
</table>
</form>
<br>
<form name="form" action="admin.php" method="post">
<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center">
<tr><td width="100%" valign="top">
  <table width="100%" border="0" cellspacing="1" cellpadding="2" class="TableMsg">
    <tr> 
      <td class="TableHeaderText" colspan="4">&nbsp;<?=LANG_TITLE_BANLIST?><a href="admin.php?a=banlist&amp;order=<?=urlencode("value")?>">
        <?if ($OrderBy == 'value') {?>
        <? echo (@$_SESSION['banlist']['OT'] == 'ASC') ? 5 : ((@$_SESSION['banlist']['OT'] == 'DESC') ? 6 : '') ?>
        <?}?>
        </a></td>
    </tr>
 <?
// avoid starting record > total records
if ($startRec > $totalRecs) { $startRec = $totalRecs; }

// set the last record to display
$stopRec = $startRec + $displayRecs - 1;
$recCount = $startRec - 1;

// move to the first record
@mysql_data_seek($rs, $recCount);
$recActual = 0;
while (($row = @mysql_fetch_array($rs)) && ($recCount < $stopRec)) {
	$recCount++;	
	if ($recCount >= $startRec)	{
		$recActual++;

		// load key for record
		$key = @$row["value_id"];
		$x_value = @$row["value"];
		$x_value_id = @$row["value_id"];
?>
    <tr class="mainTableAlt"> 
      <td width="20" align="center"><input type="checkbox" name="key[]" value="<?=$key?>"></td>
      <td width="30" align="center"><a href="<? echo (!is_null(@$row["value_id"])) ? "admin.php?a=banlist&amp;e=edit&key=".urlencode($row["value_id"]) : "javascript:alert('".LANG_INVALID_RECORD."');"; ?>"><?=LANG_EDIT?></a></td>
      <td width="30" align="center"><a href="<? echo (!is_null(@$row["value_id"])) ? "admin.php?a=banlist&amp;e=add&key=".urlencode($row["value_id"]) : "javascript:alert('".LANG_INVALID_RECORD."');"; ?>"><?=LANG_COPY?></a></td>
      <td><?=$x_value?></td>
    </tr>
    <?}
		}?>
  </table>
<?if ($recActual > 1) {?>
<input class="inputsubmit2" type="button" onClick="checkAll(this.form['key[]'])" value="<?=LANG_SELECT_ALL?>"> 
<input class="inputsubmit2" type="button" onClick="uncheckAll(this.form['key[]'])" value="<?=LANG_UNSELECT?>">
<?}?>
<?if ($recActual > 0) {?>
<br><input class="inputsubmit" type="button" name="btndelete" value="<?=LANG_DEL_SEL?>" onClick="this.form.action='admin.php?a=banlist&amp;e=delete&amp;';this.form.submit();"></p>
<?}?>
</form>
<?
// close connection
@mysql_free_result($rs);

// display page numbers
if ($totalRecs > 0) {
	$rsEof = ($totalRecs < ($startRec + $displayRecs));

	// find out if there should be backward or forward Buttons on the table
	if ($startRec == 1)	{
		$isPrev = False;
	} else	{
		$isPrev = True;
		$PrevStart = $startRec - $displayRecs;
		if ($PrevStart < 1) {
			$PrevStart = 1;
		}
?>	
	<a href="admin.php?a=banlist&amp;start=<?=$PrevStart?>"><b><?=LANG_PREV?></b></a>
<?
	}
	if ($isPrev || $totalRecs != 0) {
		$x = 1;
		$y = 1;	
		$dx1 = intval(($startRec-1)/($displayRecs*$recRange))*$displayRecs*$recRange+1;
		$dy1 = intval(($startRec-1)/($displayRecs*$recRange))*$recRange+1;
		if (($dx1+$displayRecs*$recRange-1) > $totalRecs ) {
			$dx2 = intval($totalRecs/$displayRecs)*$displayRecs+1;
			$dy2 = intval($totalRecs/$displayRecs)+1;
		} else {
			$dx2 = $dx1+$displayRecs*$recRange-1;
			$dy2 = $dy1+$recRange-1;
		}
		while ($x <= $totalRecs) {
			if ($x >= $dx1 && $x <= $dx2) {
				if ($startRec == $x) {
?>
	<b><?=$y?></b>
<?} else {?>
	<a href="admin.php?a=banlist&amp;start=<?=$x?>"><b><?=$y?></b></A>
<?
				}
				$x = $x + $displayRecs;
				$y = $y + 1;
			} elseif ($x >= ($dx1-$displayRecs*$recRange) && $x <= ($dx2+$displayRecs*$recRange)) {
				if ($x+$recRange*$displayRecs < $totalRecs) {
?>
	<a href="admin.php?a=banlist&amp;start=<?=$x;?>"><b><?=$y; ?>-<?=$y+$recRange-1; ?></b></a>
<?} else {
					$ny = intval(($totalRecs-1)/$displayRecs) + 1;
					if ($ny == $y) {
?>
	<a href="admin.php?a=banlist&amp;start=<?=$x; ?>"><b><?=$y; ?></b></a>
<?} else {?>
	<a href="admin.php?a=banlist&amp;start=<?=$x; ?>"><b><?=$y; ?>-<?=$ny; ?></b></a>
<?}
				}
				$x = $x + $recRange*$displayRecs;
				$y = $y + $recRange;
			} else {
				$x = $x + $recRange*$displayRecs;
				$y = $y + $recRange;
			}
		}
	}

	// next link
  if ($totalRecs >= $startRec + $displayRecs) {
		$NextStart = $startRec + $displayRecs;
		$isMore = True

?>
<a href="admin.php?a=banlist&amp;start=<?=$NextStart?>"><b><?=LANG_NEXT?></b></a>
<?} else { $isMore = FALSE; }

	if ($startRec > $totalRecs) { $startRec = $totalRecs; }
	$stopRec = $startRec + $displayRecs - 1;
	$recCount = $totalRecs - 1;
	if ($rsEof) { $recCount = $totalRecs; }
	if ($stopRec > $recCount) { $stopRec = $recCount; }

	$RecText=LANG_BANLIST_RECORD_TOTAL;
	$RecText=str_replace('%start',$startRec,$RecText);
	$RecText=str_replace('%stop',$stopRec,$RecText);
	$RecText=str_replace('%total',$totalRecs,$RecText);
	echo "($RecText)";
} else { echo LANG_NO_RECORDS_FOUND; }
?>
</td></tr>
</table>