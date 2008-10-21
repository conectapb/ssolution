<?php if(!defined('ISINC')) die('serious error'); ?>
<table width="100%" cellspacing="0" cellpadding="5" border="0" class="loginBox">
<?php if (isset($err)) {?><tr><td class="error"><?=$err?></td></tr><?php }?>
	<tr><td><?=LANG_LOGIN_PLEASE?>:</td></tr>
	<tr>
    <td align="center">
		 <form action="<?=htmlspecialchars($_SERVER['REQUEST_URI'])?>" method="post" name="admin_login">
			<table cellspacing="1" cellpadding="5" border="0" bgcolor="#000000">
					<tr>
			      <td bgcolor="#EEEEEE"><?=LANG_USER?>:</td>
			      <td bgcolor="#EEEEEE"><input class="inputform" type="text" name="login_user" size="20" value="<?=$em?>"></td>
			      <td bgcolor="#EEEEEE"><?=LANG_PASS?>:</td>
			      <td bgcolor="#EEEEEE"><input class="inputform" type="password" name="login_pass" size="10" value="<?=$tt?>"></td>
			      <td bgcolor="#EEEEEE"><input class="inputsubmit" type="submit" name="login" value="<?=LANG_LOGIN?>"></td>
					</tr>
			</table>
		 </form>
		</td>
	</tr>
</table>
