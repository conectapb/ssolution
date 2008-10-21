<?php /* Smarty version 2.6.19, created on 2008-08-26 10:58:45
         compiled from adm/administradores_formulario.tpl */ ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_topo'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<br />

<table>
<form name="frm" action="<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
" method="post" enctype="multipart/form-data">
<input type="hidden" name="processa" value="ok" />
<input type="hidden" name="modo" value="<?php echo $this->_tpl_vars['modo']; ?>
" />
<input type="hidden" name="id" value="<?php echo $this->_tpl_vars['id']; ?>
" />
	
	<tr>
		<td class="rotulos">Login :</td>
		<td><input type="text" name="login_form" value="<?php echo $this->_tpl_vars['login_form']; ?>
" style="width:330px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Senha :</td>
		<td><input type="password" class="text_normal" name="senha_form" value="" style="width:330px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Nome :</td>
		<td><input type="text" class="text_normal" name="nome" value="<?php echo $this->_tpl_vars['nome']; ?>
" style="width:330px;" /></td>
	</tr>
	
	<tr>
		<td>&nbsp;</td>
		<td align="center">
		<?php if ($this->_tpl_vars['modo'] == 'alt'): ?><input type="button" class="botao" value="Voltar" onClick="document.location='administradores.php'" />&nbsp;<?php endif; ?>
		<input type="submit" class="botao" value="<?php echo $this->_tpl_vars['botao']; ?>
" /></td>
	</tr>
</form>
</table>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_rodape'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>