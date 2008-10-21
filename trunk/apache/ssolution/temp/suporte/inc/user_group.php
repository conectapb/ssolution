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
$vars['g_id']=preg_replace('/\D+/','',$_POST['g_id']);
$vars['form_action']=htmlspecialchars($_SERVER['REQUEST_URI']);
$submit=array();
$submit[]=array('add',LANG_CREATE_USER_GROUP);
$submit[]=array('submit',LANG_SAVE_CHANGES);
$vars['submit_new']=isset($_POST['submit_new'])?1:0;

  $groups_res = mysql_query("SELECT * FROM ".$db_table['groups']);
  $group_options='';
  while ($group = mysql_fetch_array($groups_res)) {
  	$selected = ($group['ID'] == $vars['g_id']) ? ' SELECTED': '';
  	$group_options.='<option value="'.$group['ID'].'"'.$selected.'>'.$group['name']."</option>\n";
  }
  
  $vars['access_cats']=array();
  
  if ((!empty($vars['g_id'])) && ($vars['submit_new'] == 0)) {
	  $group = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['groups']." WHERE ID=".$vars['g_id']));
	  $vars['access_cats'] = explode(':', $group['cat_access']);
	}
	
$vars['submit_type']=$group?1:0;
	
$cats_res = mysql_query("SELECT * FROM ".$db_table['categories']);
$cats=array();
$selected=($vars['g_id'] == 1 || $vars['access_cats'][0] == 'all') ? ' CHECKED': '';
$cats[] ='<input type="checkbox" name="cat_access[all]"'.$selected.'>'.LANG_ALL;
while ($cat = mysql_fetch_array($cats_res)) {
	$selected=(in_array($cat['ID'], $vars['access_cats']) || $vars['g_id'] == 1 || $access_cats[0] == 'all') ? ' CHECKED': '';
	$cats[] ='<input type="checkbox" name="cat_access['.$cat['ID'].']"'.$selected.'>'.$cat['name'];
}
$cats=implode("<br>\n",$cats);

?>

<form action="<?=$vars['form_action']?>" method="post">
	<input type="hidden" name="a" value="user_group">
	<input type="hidden" name="g_id" value="<?=$vars['g_id']?>">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>

<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<select name="g_id">
				<?=$group_options?>
			</select>
		</td>
		<td>&nbsp;</td>
		<td>
			<input type="submit" name="select" value="<?=LANG_SELECT?>" class="inputsubmit"> 
			<input type="submit" name="delete" value="<?=LANG_DELETE?>" class="inputsubmit">
			<input type="submit" name="submit_new" value="<?=LANG_ADD_NEW?>" class="inputsubmit">
		</td>
	</tr>
</table>
<br>
<table width="100%" border="0" cellspacing="1" cellpadding="2" class="TableMsg">
	<tr>
		<td width="120" class="TableHeaderText"><?=LANG_GROUP_ACCESS?></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="mainTable"><b><?=LANG_NAME?>:</b></td>
		<td class="mainTableAlt">
			<input type="hidden" name="old_name" value="<?=$group['name']?>">
			<input type="text" name="name" value="<?=$group['name']?>">
		</td>
	</tr>
	<tr>
		<td class="mainTable"><?=LANG_TITLE_GROUPS?>:</td>
		<td class="mainTableAlt"><input type="checkbox" name="group"<?=$group['user_group'] ? ' CHECKED': ''?>></td>
	</tr>
	<tr>
		<td class="mainTable"><?=LANG_TITLE_REP?>:</td>
		<td class="mainTableAlt"><input type="checkbox" name="rep"<?=$group['rep'] ? ' CHECKED': ''?>></td>
	</tr>
	<tr>
		<td class="mainTable"><?=LANG_TITLE_CAT?>:</td>
		<td class="mainTableAlt"><input type="checkbox" name="cat"<?=$group['cat'] ? ' CHECKED': ''?>></td>
	</tr>
	<tr>
		<td class="mainTable"><?=LANG_TITLE_PREF?>:</td>
		<td class="mainTableAlt"><input type="checkbox" name="pref"<?=$group['pref'] ? ' CHECKED': ''?>></td>
	</tr>
	<tr>
		<td class="mainTable"><?=LANG_TITLE_MAIL?>:</td>
		<td class="mainTableAlt"><input type="checkbox" name="mail"<?=$group['mail'] ? ' CHECKED': ''?>></td>
	</tr>
	<tr>
		<td class="mainTable"><?=LANG_TITLE_BANLIST?>:</td>
		<td class="mainTableAlt"><input type="checkbox" name="banlist"<?=$group['banlist'] ? ' CHECKED': ''?>></td>
	</tr>
	<tr>
		<td class="mainTable"><?=LANG_CAT?>:</td>
		<td class="mainTableAlt">
			<?=$cats?>
		</td>
	</tr>
</table>
<br>
<input class="inputsubmit" type="submit" name="<?=$submit[$vars['submit_type']][0]?>" value="<?=$submit[$vars['submit_type']][1]?>">

			</td>
		</tr>
	</table>
</form>
