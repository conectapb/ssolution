<?php if(!defined('ISINC')) die('serious error'); ?>
<table width="100%" cellspacing="0" cellpadding="5" border="0" class="loginBox">
<?php if (isset($err)) {?><tr><td class="error"><?=$err?></td></tr><?php }?>
  <tr><td><?=LANG_LOGIN_PLEASE; ?>:</td></tr>
  <tr> 
    <td align="center"> 
     <form action="<?=htmlspecialchars($_SERVER['REQUEST_URI'])?>" method="post" name="user_login">
      <table cellspacing="1" cellpadding="5" border="0" bgcolor="#000000">
          <tr> 
            <td bgcolor="#EEEEEE"><?=LANG_EMAIL?>:</td>
            <td bgcolor="#EEEEEE"><input class="inputform" type="text" name="login_email" size="20" value="<?=$e?>"></td>
            <td bgcolor="#EEEEEE"><?=LANG_TICKET_ID?>:</td>
            <td bgcolor="#EEEEEE"><input class="inputform" type="text" name="login_ticket" size="10" value="<?=$t?>"></td>
            <td bgcolor="#EEEEEE"><input class="inputsubmit" type="submit" name="login" value="<?=LANG_VIEW_STATUS; ?>"></td>
          </tr>
      </table>
     </form>
    </td>
  </tr>
</table>