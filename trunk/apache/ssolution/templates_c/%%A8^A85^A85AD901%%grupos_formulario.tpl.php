<?php /* Smarty version 2.6.18, created on 2008-08-07 18:13:18
         compiled from adm/grupos_formulario.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'html_options', 'adm/grupos_formulario.tpl', 71, false),)), $this); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_topo'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<br />

<table width="100%" border="0" cellpadding="2" cellspacing="0" border="0">
<form name="frm" action="<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
" method="post" enctype="multipart/form-data" id="formulario">
<input type="hidden" name="processa" value="ok" />
<input type="hidden" name="modo" value="<?php echo $this->_tpl_vars['modo']; ?>
" />
<input type="hidden" name="id" value="<?php echo $this->_tpl_vars['campos']['id'][4]; ?>
" />

	<tr>
		<td align="right"><label for="nome_padrao" class="rotulos">Nome Padr&atilde;o :</label></td>
		<td><input type="text" class="text_normal" name="nome_padrao" value="<?php echo $this->_tpl_vars['campos']['nome_padrao'][4]; ?>
" style="width:450px;" /></td>
	</tr>

	<tr>
		<td align="right"><label for="codigo" class="rotulos">C&oacute;digo :</label></td>
		<td><input type="text" class="text_normal" name="codigo" value="<?php echo $this->_tpl_vars['campos']['codigo'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td align="right"><label for="tipo" class="rotulos">Tipo :</label></td>
		<td>
			<select name="tipo" style="width:450px;">
			<?php $_from = $this->_tpl_vars['tipos']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tipo']):
?>
			<option value="<?php echo $this->_tpl_vars['tipo']['id']; ?>
"><?php echo $this->_tpl_vars['tipo']['tipo']; ?>
</option>
			<?php endforeach; endif; unset($_from); ?>
			</select>
		</td>
	</tr>
	<script>document.frm.tipo.value="<?php echo $this->_tpl_vars['campos']['tipo'][4]; ?>
";</script>
	
	<tr>
		<td align="right"><label for="nome" class="rotulos">Nome :</label></td>
		<td><input type="text" class="text_normal" name="nome" value="<?php echo $this->_tpl_vars['campos']['nome'][4]; ?>
" style="width:450px;" /></td>
	</tr>

	<tr>
		<td align="right"><label for="endereco" class="rotulos">Endere&ccedil;o :</label></td>
		<td>
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td><input type="text" class="text_normal" name="endereco" value="<?php echo $this->_tpl_vars['campos']['endereco'][4]; ?>
" style="width:363px;" /></td>
					<td class="rotulos" style="width:33px"><label for="numero">N&ordm; :</label></td>
					<td><input type="text" class="text_pequeno" name="numero" value="<?php echo $this->_tpl_vars['campos']['numero'][4]; ?>
" /></td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td align="right"><label for="bairro" class="rotulos">Bairro :</label></td>
		<td><input type="text" class="text_normal" name="bairro" value="<?php echo $this->_tpl_vars['campos']['bairro'][4]; ?>
" style="width:450px;" /></td>
	</tr>

	<tr>
		<td align="right"><label for="cep" class="rotulos">CEP :</label></td>
		<td><input type="text" class="text_normal" name="cep" value="<?php echo $this->_tpl_vars['campos']['cep'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td align="right"><label for="cidade" class="rotulos">Cidade :</label></td>
		<td>
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td><input type="text" class="text_normal" name="cidade" value="<?php echo $this->_tpl_vars['campos']['cidade'][4]; ?>
" style="width:363px;" /></td>
<?php if ($this->_tpl_vars['campos']['uf'][4] != ""): ?><?php $this->assign('sel_estado', $this->_tpl_vars['campos']['uf'][4]); ?><?php else: ?><?php $this->assign('sel_estado', 'PR'); ?><?php endif; ?>
					<td>&nbsp;&nbsp;&nbsp;<span class="rotulos">UF :</span>&nbsp;</td>
					<td>
						<select class="mini" name="uf">
						<?php echo smarty_function_html_options(array('values' => $this->_tpl_vars['estados'],'selected' => $this->_tpl_vars['sel_estado'],'output' => $this->_tpl_vars['estados']), $this);?>

						</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td align="right"><label for="observacoes" class="rotulos">Observa&ccedil;&otilde;es :</label></td>
		<td><textarea class="text_normal" name="observacoes" style="width:450px; height:100px;" /><?php echo $this->_tpl_vars['campos']['observacoes'][4]; ?>
</textarea></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center"><?php if ($this->_tpl_vars['modo'] == 'alt'): ?><input type="button" class="botao_normal" value="Voltar" onClick="document.location='grupos.php?modo=lst'" /><?php endif; ?>	<input type="submit" class="botao_normal" value="<?php echo $this->_tpl_vars['botao']; ?>
" /></td>
	</tr>
	
</form>
</table>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_rodape'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>