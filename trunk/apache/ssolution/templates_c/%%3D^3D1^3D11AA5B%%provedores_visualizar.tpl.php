<?php /* Smarty version 2.6.19, created on 2008-10-16 11:24:20
         compiled from adm/provedores_visualizar.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'cycle', 'adm/provedores_visualizar.tpl', 6, false),)), $this); ?>
<div id="visualizarBox_opcoes" style="position:absolute; right:10px; top:10px; background:#FFFFFF; border:1px solid black;"><a href="<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
?id=<?php echo $this->_tpl_vars['campos']['id']; ?>
&modo=alt"><img src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/images/edit.png" alt="Alterar" border="0" width="16" height="16" hspace="2" vspace="2" /></a><img src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/images/block.jpg" alt="Fechar" border="0" width="16" height="16" hspace="2" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="$('#visualizarBox').hide('slow');" /></div>

<table id="visualizarTbl" width="600" border="0" cellpadding="2" cellspacing="0">

	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">C&oacute;digo :</td>
		<td><?php echo $this->_tpl_vars['campos']['codigo'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Raz&atilde;o Social :</td>
		<td><?php echo $this->_tpl_vars['campos']['razaosocial'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Nome Fantasia :</td>
		<td><?php echo $this->_tpl_vars['campos']['nomefantasia'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">CNPJ :</td>
		<td><?php echo $this->_tpl_vars['campos']['cnpj'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Inscri&ccedil;&atilde;o Estadual :</td>
		<td><?php echo $this->_tpl_vars['campos']['inscestadual'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Inscri&ccedil;&atilde;o Municipal :</td>
		<td><?php echo $this->_tpl_vars['campos']['inscmunicipal'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Respons&aacute;vel :</td>
		<td><?php echo $this->_tpl_vars['campos']['responsavel'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Endere&ccedil;o :</td>
		<td><?php echo $this->_tpl_vars['campos']['endereco'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">N&uacute;mero :</td>
		<td><?php echo $this->_tpl_vars['campos']['numero'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Complemento :</td>
		<td><?php echo $this->_tpl_vars['campos']['complemento'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Bairro :</td>
		<td><?php echo $this->_tpl_vars['campos']['bairro'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">CEP :</td>
		<td><?php echo $this->_tpl_vars['campos']['cep'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Cidade :</td>
		<td><?php echo $this->_tpl_vars['campos']['cidade'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">UF :</td>
		<td><?php echo $this->_tpl_vars['campos']['uf'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Telefone Principal :</td>
		<td><?php echo $this->_tpl_vars['campos']['tel_principal'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Telefone Comercial :</td>
		<td><?php echo $this->_tpl_vars['campos']['tel_comercial'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Telefone Financeiro :</td>
		<td><?php echo $this->_tpl_vars['campos']['tel_financeiro'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Telefone Suporte :</td>
		<td><?php echo $this->_tpl_vars['campos']['tel_suporte'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Celular 1 :</td>
		<td><?php echo $this->_tpl_vars['campos']['celular1'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Celular 2 :</td>
		<td><?php echo $this->_tpl_vars['campos']['celular2'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Celular 3 :</td>
		<td><?php echo $this->_tpl_vars['campos']['celular3'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">FAX :</td>
		<td><?php echo $this->_tpl_vars['campos']['fax'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">E-mail Principal :</td>
		<td><?php echo $this->_tpl_vars['campos']['email_principal'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">E-mail Comercial :</td>
		<td><?php echo $this->_tpl_vars['campos']['email_comercial'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">E-mail Financeiro :</td>
		<td><?php echo $this->_tpl_vars['campos']['email_financeiro'][4]; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">E-mail Suporte :</td>
		<td><?php echo $this->_tpl_vars['campos']['email_suporte'][4]; ?>
</td>
	</tr>

	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos" valign="top">Observa&ccedil;&otilde;es :</td>
		<td><?php echo $this->_tpl_vars['campos']['observacoes'][4]; ?>
</td>
	</tr>
</table>