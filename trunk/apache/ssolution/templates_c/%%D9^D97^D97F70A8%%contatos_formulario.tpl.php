<?php /* Smarty version 2.6.18, created on 2008-08-07 18:13:08
         compiled from adm/contatos_formulario.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'html_options', 'adm/contatos_formulario.tpl', 62, false),)), $this); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_topo'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<br />

<table width="100%" border="0" cellpadding="2" cellspacing="0" border="0">
<form name="frm" action="<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
" method="post" enctype="multipart/form-data">
	<input type="hidden" name="processa" value="ok" />
	<input type="hidden" name="modo" value="<?php echo $this->_tpl_vars['modo']; ?>
" />
	<input type="hidden" name="id" value="<?php echo $this->_tpl_vars['campos']['id'][4]; ?>
" />

	<tr>
		<td class="rotulos">Nome:</td>
		<td><input type="text" class="text_normal" name="nome" value="<?php echo $this->_tpl_vars['campos']['nome'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Empresa:</td>
		<td><input type="text" class="text_normal" name="empresa" value="<?php echo $this->_tpl_vars['campos']['empresa'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Tipo: <small>(cliente, s&iacute;ndico)</small></td>
		<td><input type="text" class="text_normal" name="tipo" value="<?php echo $this->_tpl_vars['campos']['tipo'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Edif&iacute;cio/Condom&iacute;nio:</td>
		<td><input type="text" class="text_normal" name="edificio" value="<?php echo $this->_tpl_vars['campos']['edificio'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Endere&ccedil;o :</td>
		<td>
			<input type="text" class="text_normal" name="endereco" value="<?php echo $this->_tpl_vars['campos']['endereco'][4]; ?>
" style="width:363px;" />
			N&ordm; :
			<input type="text" class="text_normal" name="numero" value="<?php echo $this->_tpl_vars['campos']['numero'][4]; ?>
" style="width:50px;" />
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Complemento :</td>
		<td><input type="text" class="text_normal" name="complemento" value="<?php echo $this->_tpl_vars['campos']['complemento'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Bairro :</td>
		<td><input type="text" class="text_normal" name="bairro" value="<?php echo $this->_tpl_vars['campos']['bairro'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">CEP :</td>
		<td><input type="text" class="text_normal" name="cep" value="<?php echo $this->_tpl_vars['campos']['cep'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Cidade :</td>
		<td>
			<input type="text" class="text_normal" name="cidade" value="<?php echo $this->_tpl_vars['campos']['cidade'][4]; ?>
" style="width:363px;" />
			<?php if ($this->_tpl_vars['campos']['uf'][4] != ""): ?><?php $this->assign('sel_estado', $this->_tpl_vars['campos']['uf'][4]); ?><?php else: ?><?php $this->assign('sel_estado', 'PR'); ?><?php endif; ?>
			UF :
			<select class="text_normal" name="uf" style="width:50px;">
				<?php echo smarty_function_html_options(array('values' => $this->_tpl_vars['estados'],'selected' => $this->_tpl_vars['sel_estado'],'output' => $this->_tpl_vars['estados']), $this);?>

			</select>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Telefone 1:</td>
		<td><input type="text" class="text_normal" name="telefone1" value="<?php echo $this->_tpl_vars['campos']['telefone1'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Telefone 2:</td>
		<td><input type="text" class="text_normal" name="telefone2" value="<?php echo $this->_tpl_vars['campos']['telefone2'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Celular 1:</td>
		<td><input type="text" class="text_normal" name="celular1" value="<?php echo $this->_tpl_vars['campos']['celular1'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Celular 2:</td>
		<td><input type="text" class="text_normal" name="celular2" value="<?php echo $this->_tpl_vars['campos']['celular2'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">E-mail 1:</td>
		<td><input type="text" class="text_normal" name="email1" value="<?php echo $this->_tpl_vars['campos']['email1'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">E-mail 2:</td>
		<td><input type="text" class="text_normal" name="email2" value="<?php echo $this->_tpl_vars['campos']['email2'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">Observa&ccedil;&otilde;es:</td>
		<td><textarea name="observacoes" style="width:450px; height:150px"><?php echo $this->_tpl_vars['campos']['observacoes'][4]; ?>
</textarea></td>
	</tr>
	
	<tr>
		<td>&nbsp;</td>
		<td align="center">
			<?php if ($this->_tpl_vars['modo'] == 'alt'): ?><input type="button" class="botao" value="Voltar" onClick="document.location='contatos.php'" />&nbsp;<?php endif; ?>
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