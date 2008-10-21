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

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr><td>
	<form action="<?=htmlspecialchars($_SERVER['REQUEST_URI'])?>" method="post"> 
	<input type="hidden" name="a" value="cat"> 
	<input type="hidden" name="c_id" value="<?=$_POST['c_id']?>">
	
	<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<select name="c_id">
		<option value=""></option>
		<?php
		if ((isset($_POST['c_id'])) && ($_POST['c_id'] != '')) { $c_id=$_POST['c_id']; }
		if ((isset($_POST['submit_new'])) && ($_POST['submit_new'] != '')) { $submit_new=$_POST['submit_new']; }
		
		$cats = mysql_query("SELECT * FROM ".$db_table['categories']);
		while ($cat = mysql_fetch_array($cats)) {
			$selected = ($cat['ID'] == $c_id) ? ' SELECTED': '';
			$cat['name'] = $cat['hidden'] ? "$cat[name]*": $cat['name'];
			?>
			<option value="<?=$cat['ID']?>"<?=$selected?>><?=$cat['name']?></option> 
		<?php } ?>
		</select>
		</td>
		<td>&nbsp;</td>
		<td>
		<input type="submit" name="select" value="<?=LANG_SELECT?>" class="inputsubmit"> 
		<input class="inputsubmit" type="submit" name="delete" value="<?=LANG_DELETE; ?>">
		<input type="submit" name="submit_new" value="<?=LANG_ADD_NEW; ?>" class="inputsubmit">
		</td>
		</tr>
		</table>
		<br> 
		<table width="100%" border="0" cellspacing="1" cellpadding="2" class="TableMsg">
		<tr><td class="TableHeaderText" width="120">&nbsp;<?=LANG_TITLE_CAT; ?></td><td>&nbsp;</td></tr>
		<?php
		if ((!$submit_new) && ($c_id)) {
			$cat = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['categories']." WHERE ID=".$c_id)); ?>
			<input type="hidden" name="old_name" value="<?=$cat['name']?>"> 
			<tr><td class="mainTable">&nbsp;<b><?=LANG_NAME; ?>:</b></td>
			<td class="mainTableAlt"><input type="text" name="name" value="<?=$cat['name']?>"></td></tr> 
			<tr><td class="mainTable">&nbsp;POP3&nbsp;<?=LANG_HOST; ?>:</td>
			<td class="mainTableAlt"><input type="text" name="pophost" value="<?=$cat['pophost']?>"></td></tr> 
			<tr><td class="mainTable">&nbsp;POP3&nbsp;<?=LANG_USER; ?>:</td>
			<td class="mainTableAlt"><input type="text" name="popuser" value="<?=$cat['popuser']?>"></td></tr> 
			<tr><td class="mainTable">&nbsp;POP3&nbsp;<?=LANG_PASS; ?>:</td>
			<td class="mainTableAlt"><input type="password" name="poppass" value="<?=$cat['poppass']?>"></td></tr> 
			<tr><td class="mainTable">&nbsp;<b><?=LANG_EMAIL; ?>:</b></td>
			<td class="mainTableAlt"><input type="text" name="email" value="<?=$cat['email']?>"></td></tr> 
			<tr><td class="mainTable">&nbsp;<?=LANG_SIGNATURE; ?>:</td>
			<td class="mainTableAlt"><textarea name="sig" cols="30" rows="5"><?=$cat['signature']?></textarea></td></tr> 
			<tr><td class="mainTable">&nbsp;<?=LANG_HIDDEN; ?>:</td>
			<td class="mainTableAlt"><input type="checkbox" name="hidden" <?= $cat['hidden'] ? ' CHECKED': ''?>></td></tr>
			</table>
			<br>
			<input class="inputsubmit" type="submit" name="submit" value="<?=LANG_SAVE_CHANGES; ?>">
		<?php } else { //add new?>
			<tr><td class="mainTable">&nbsp;<b><?=LANG_NAME; ?>:</b></td>
			<td class="mainTableAlt"><input type="text" name="name"></td></tr> 
			<tr><td class="mainTable">&nbsp;POP3&nbsp;<?=LANG_HOST; ?>:</td>
			<td class="mainTableAlt"><input type="text" name="pophost"></td></tr> 
			<tr><td class="mainTable">&nbsp;POP3&nbsp;<?=LANG_USER; ?>:</td>
			<td class="mainTableAlt"><input type="text" name="popuser"></td></tr> 
			<tr><td class="mainTable">&nbsp;POP3&nbsp;<?=LANG_PASS; ?>:</td>
			<td class="mainTableAlt"><input type="password" name="poppass"></td></tr> 
			<tr><td class="mainTable">&nbsp;<b><?=LANG_EMAIL; ?>:</b></td>
			<td class="mainTableAlt"><input type="text" name="email"></td></tr> 
			<tr><td class="mainTable">&nbsp;<?=LANG_SIGNATURE; ?>:</td>
			<td class="mainTableAlt"><textarea name="sig" cols="30" rows="5"></textarea></td></tr>  
			<tr><td class="mainTable">&nbsp;<?=LANG_HIDDEN; ?>:</td>
			<td class="mainTableAlt"><input type="checkbox" name="hidden"></td></tr>
			</table>
			<br>
			<input class="inputsubmit" type="submit" name="add" value="<?=LANG_CREATE_CAT; ?>">
		<?php } ?>
	</form>
	</td>
</tr>
</table>
