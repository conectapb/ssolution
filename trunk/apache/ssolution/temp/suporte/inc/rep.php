<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

if(!defined('ISINC')) die('serious error');
if ($_SESSION['user']['type'] !== 'admin') { die(LANG_ERROR_DENIED); }
load_buttons();

#vars
$vars=array();
$vars['r_id']=preg_replace('/\D+/','',$_POST['r_id']);
$vars['form_action']=htmlspecialchars($_SERVER['REQUEST_URI']);
$submit=array();
$submit[]=array('add',LANG_CREATE_REP);
$submit[]=array('submit',LANG_SAVE_CHANGES);
$vars['submit_new']=isset($_POST['submit_new'])?1:0;

$rep=array();
if ((!empty($vars['r_id'])) && ($vars['submit_new'] == 0)) {
	$rep = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['reps']." WHERE ID=".$vars['r_id']));
	if (preg_match('/\*LOCKED\*/',$rep['password'])) { $rep['locked']=' checked'; }
}

$vars['submit_type']=$rep?1:0;

	$reps_res = mysql_query("SELECT * FROM ".$db_table['reps']);
	$rep_options='';
	while ($rep_opt = mysql_fetch_array($reps_res)) {
		$selected = ($rep_opt['ID'] == $vars['r_id']) ? ' SELECTED': '';
		$rep_options.='<option value="'.$rep_opt['ID'].'"'.$selected.'>'.$rep_opt['name']."</option>\n";
	}

  $groups = mysql_query("SELECT * FROM ".$db_table['groups']);
  $group_options='';
  while ($group = mysql_fetch_array($groups)) {
  	$selected = ($group['ID'] == $rep['user_group']) ? ' SELECTED': '';
  	$group_options.='<option value="'.$group['ID'].'"'.$selected.'>'.$group['name']."</option>\n";
  }

?>

<form action="<?=$vars['form_action']?>" method="post">
<input type="hidden" name="a" value="rep">
<input type="hidden" name="r_id" value="<?=$vars['r_id']?>">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>

<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<select name="r_id">
				<option value=""></option>
				<?=$rep_options?>
				</select>
		</td>
		<td>&nbsp;</td>
		<td>
			<input type="submit" name="select" value="<?=LANG_SELECT?>" class="inputsubmit"> 
			<input class="inputsubmit" type="submit" name="delete" value="<?=LANG_DELETE?>">
			<input type="submit" name="submit_new" value="<?=LANG_ADD_NEW?>" class="inputsubmit">
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="1" cellpadding="2" class="TableMsg">
	<tr>
		<td class="TableHeaderText" width="120"><?=LANG_TITLE_REP?></td>
		<td>&nbsp;</td>
	</tr>

	<tr>
		<td class="mainTable"><b><?=LANG_USER?>:</b></td>
		<td class="mainTableAlt">
			<input type="hidden" name="old_username" value="<?=$rep['username']?>">
			<input type="text" name="username" value="<?=$rep['username']?>">
			<?=LANG_LOCKED?>? 
			<input type="checkbox" name="locked"<?=$rep['locked']?>>
		</td>
	</tr>
	<tr>
		<td class="mainTable"><b><?=LANG_NAME?>:</b></td>
		<td class="mainTableAlt">
			<input type="hidden" name="old_name" value="<?=$rep['name']?>">
			<input type="text" name="name" value="<?=$rep['name']?>">
		</td>
	</tr>
	<tr>
		<td class="mainTable"><b><?=LANG_EMAIL?>:</b></td>
		<td class="mainTableAlt">
			<input type="hidden" name="old_email" value="<?=$rep['email']?>">
			<input type="text" name="email" value="<?=$rep['email']?>">
		</td>
	</tr>
	<tr>
		<td class="mainTable"><?=$vars['submit_type'] == 0?'<b>'.LANG_PASS.'</b>':LANG_PASS;?>:</td>
		<td class="mainTableAlt">
			<input type="hidden" name="password_hash" value="<?=$rep['password']?>">
			<input type="password" name="password">
		</td>
	</tr>
	<tr>
		<td class="mainTable"><b><?=LANG_GROUP?>:</b></td>
		<td class="mainTableAlt">
			<select name="group">
				<?=$group_options?>
			</select>
		</td>
	</tr>
	<tr>
		<td class="mainTable"><?=LANG_SIGNATURE?>:</td>
		<td class="mainTableAlt">
			<textarea name="sig" cols="30" rows="5"><?=$rep['signature']?></textarea>
		</td>
	</tr>
</table>
<br>
<input class="inputsubmit" type="submit" name="<?=$submit[$vars['submit_type']][0]?>" value="<?=$submit[$vars['submit_type']][1]?>">

		</td>
	</tr>
</table>
</form>