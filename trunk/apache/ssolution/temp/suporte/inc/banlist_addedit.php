<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

if(!defined('ISINC')) die('serious error');
if ($_SESSION['user']['type'] !== 'admin') { die(LANG_ERROR_DENIED); }
?>

<script language="JavaScript" type="text/javascript">
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

<form name="form" action="<?=htmlspecialchars($_SERVER['REQUEST_URI'])?>" method="post" onsubmit="return validateForm(this);">
<input type="hidden" name="a" value="<?=$a?$a:'banlist'?>">
<input type="hidden" name="e" value="<?=$e?$e:'add'?>">
<input type="hidden" name="ab" value="<? if ($e == 'edit') { echo 'U'; } if ($e == 'add') { echo 'A'; } ?>">
<?php if (($e == 'edit') && ($key)) { echo '<input type="hidden" name="key" value="'.$key.'">'; } ?>
  <table border="0" cellspacing="0" cellpadding="4">
    <tr> 
      <td><b><? if ($e == 'edit') { echo LANG_EDIT_BANNED; } else { echo LANG_ADD_COPY_BANNED; }?>:</b></td>
      <td><input type="text" name="x_value" size="30" maxlength="255" value="<?=htmlspecialchars(@$x_value)?>"></td>
		<td><input class="inputsubmit" type="submit" name="Action" value="<?=LANG_SUBMIT?>"></td>
    </tr>
  </table>
</form>
<a href="admin.php?a=banlist"><?=LANG_BACK_TO_LIST?></a>
