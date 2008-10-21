<?php /* Smarty version 2.6.18, created on 2008-08-05 10:55:46
         compiled from adm/provedores_formulario.tpl */ ?>
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
		<td class="rotulos">Raz&atilde;o Social :</td>
		<td><input type="text" class="text_normal" name="razaosocial" value="<?php echo $this->_tpl_vars['campos']['razaosocial'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Nome Fantasia :</td>
		<td><input type="text" class="text_normal" name="nomefantasia" value="<?php echo $this->_tpl_vars['campos']['nomefantasia'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">CNPJ :</td>
		<td><input type="text" class="text_normal" name="cnpj" value="<?php echo $this->_tpl_vars['campos']['cnpj'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Inscri&ccedil;&atilde;o Estadual :</td>
		<td><input type="text" class="text_normal" name="inscestadual" value="<?php echo $this->_tpl_vars['campos']['inscestadual'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Inscri&ccedil;&atilde;o Municipal :</td>
		<td><input type="text" class="text_normal" name="inscmunicipal" value="<?php echo $this->_tpl_vars['campos']['inscmunicipal'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Respons&aacute;vel :</td>
		<td><input type="text" class="text_normal" name="responsavel" value="<?php echo $this->_tpl_vars['campos']['responsavel'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Endere&ccedil;o :</td>
		<td><input type="text" class="text_normal" name="endereco" value="<?php echo $this->_tpl_vars['campos']['endereco'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">N&uacute;mero :</td>
		<td><input type="text" class="text_normal" name="numero" value="<?php echo $this->_tpl_vars['campos']['numero'][4]; ?>
" style="width:450px;" /></td>
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
		<td><input type="text" class="text_normal" name="cidade" value="<?php echo $this->_tpl_vars['campos']['cidade'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">UF :</td>
		<td><input type="text" class="text_normal" name="uf" value="<?php echo $this->_tpl_vars['campos']['uf'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Telefone Principal :</td>
		<td><input type="text" class="text_normal" name="tel_principal" value="<?php echo $this->_tpl_vars['campos']['tel_principal'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Telefone Comercial :</td>
		<td><input type="text" class="text_normal" name="tel_comercial" value="<?php echo $this->_tpl_vars['campos']['tel_comercial'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Telefone Financeiro :</td>
		<td><input type="text" class="text_normal" name="tel_financeiro" value="<?php echo $this->_tpl_vars['campos']['tel_financeiro'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Telefone Suporte :</td>
		<td><input type="text" class="text_normal" name="tel_suporte" value="<?php echo $this->_tpl_vars['campos']['tel_suporte'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Celular 1 :</td>
		<td><input type="text" class="text_normal" name="celular1" value="<?php echo $this->_tpl_vars['campos']['celular1'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Celular 2 :</td>
		<td><input type="text" class="text_normal" name="celular2" value="<?php echo $this->_tpl_vars['campos']['celular2'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Celular 3 :</td>
		<td><input type="text" class="text_normal" name="celular3" value="<?php echo $this->_tpl_vars['campos']['celular3'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">FAX :</td>
		<td><input type="text" class="text_normal" name="fax" value="<?php echo $this->_tpl_vars['campos']['fax'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">E-mail Principal :</td>
		<td><input type="text" class="text_normal" name="email_principal" value="<?php echo $this->_tpl_vars['campos']['email_principal'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">E-mail Comercial :</td>
		<td><input type="text" class="text_normal" name="email_comercial" value="<?php echo $this->_tpl_vars['campos']['email_comercial'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">E-mail Financeiro :</td>
		<td><input type="text" class="text_normal" name="email_financeiro" value="<?php echo $this->_tpl_vars['campos']['email_financeiro'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">E-mail Suporte :</td>
		<td><input type="text" class="text_normal" name="email_suporte" value="<?php echo $this->_tpl_vars['campos']['email_suporte'][4]; ?>
" style="width:450px;" /></td>
	</tr>

	<tr>
		<td class="rotulos" valign="top">Observa&ccedil;&otilde;es :</td>
		<td><textarea class="text_normal" name="observacoes" style="width:450px; height:100px;" /><?php echo $this->_tpl_vars['campos']['observacoes'][4]; ?>
</textarea></td>
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