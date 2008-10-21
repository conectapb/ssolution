<?php /* Smarty version 2.6.18, created on 2008-08-02 18:37:57
         compiled from adm/planos_formulario.tpl */ ?>
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
		<td class="rotulos">C&oacute;digo :</td>
		<td><input type="text" class="text_normal" name="codigo" value="<?php echo $this->_tpl_vars['campos']['codigo'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Nome do Plano :</td>
		<td><input type="text" class="text_normal" name="nome" value="<?php echo $this->_tpl_vars['campos']['nome'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">Descri&ccedil;&atilde;o :</td>
		<td><textarea class="text_normal" name="descricao" style="width:450px; height:100px;" /><?php echo $this->_tpl_vars['campos']['descricao'][4]; ?>
</textarea></td>
	</tr>
	
	<tr>
		<td class="rotulos">Vel. Download :</td>
		<td><input type="text" class="text_normal" name="vel_download" value="<?php echo $this->_tpl_vars['campos']['vel_download'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Vel. Upload :</td>
		<td><input type="text" class="text_normal" name="vel_upload" value="<?php echo $this->_tpl_vars['campos']['vel_upload'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Valor base :</td>
		<td><input type="text" class="text_normal" name="valor_base" value="<?php echo $this->_tpl_vars['campos']['valor_base'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Valor Ponto Adicional :</td>
		<td><input type="text" class="text_normal" name="valor_pontoadicional" value="<?php echo $this->_tpl_vars['campos']['valor_pontoadicional'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td>&nbsp;</td>
		<td><input type="checkbox" name="fidelidade" id="fidelidade" value="1" /><label for="fidelidade">Fidelidade</label></td>
	</tr>
	
	<script>
		$val = "<?php echo $this->_tpl_vars['campos']['fidelidade'][4]; ?>
";
		if($val==1)	document.frm.fidelidade.checked=true;
	</script>
	
	<tr>
		<td class="rotulos" valign="top">Observa&ccedil;&otilde;es :</td>
		<td><textarea class="text_normal" name="observacoes" style="width:450px; height:100px;" /><?php echo $this->_tpl_vars['campos']['observacoes'][4]; ?>
</textarea></td>
	</tr>

	<tr>
		<td>&nbsp;</td>
		<td align="center">
			<?php if ($this->_tpl_vars['modo'] == 'alt'): ?><input type="button" class="botao" value="Voltar" onClick="document.location='<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
?modo=lst'" />&nbsp;<?php endif; ?>
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