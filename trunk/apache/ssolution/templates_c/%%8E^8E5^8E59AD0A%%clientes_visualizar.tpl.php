<?php /* Smarty version 2.6.18, created on 2008-08-02 17:32:46
         compiled from adm/clientes_visualizar.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'cycle', 'adm/clientes_visualizar.tpl', 11, false),array('modifier', 'date_format', 'adm/clientes_visualizar.tpl', 25, false),array('modifier', 'replace', 'adm/clientes_visualizar.tpl', 208, false),)), $this); ?>
<div id="visualizarBox_opcoes" style="position:absolute; right:10px; top:10px; background:#FFFFFF; border:1px solid black;"><a href="<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
?id=<?php echo $this->_tpl_vars['campos']['id'][4]; ?>
&modo=alt"><img src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/images/edit.png" alt="Alterar" border="0" width="16" height="16" hspace="2" vspace="2" /></a><img src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/images/block.jpg" alt="Fechar" border="0" width="16" height="16" hspace="2" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="$('#visualizarBox').hide('slow');" /></div>

<script>
<?php echo '

'; ?>

</script>

<table id="visualizarTbl" width="800" border="0" cellpadding="2" cellspacing="0">

	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">C&oacute;digo :</td>
		<td><?php echo $this->_tpl_vars['campos']['codigo'][4]; ?>
</td>
	</tr>
	
	<?php if ($this->_tpl_vars['campos']['tipo'][4] == 'Pessoa física'): ?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">Nome :</td>
		<td><?php echo $this->_tpl_vars['campos']['nome'][4]; ?>
</td>
	</tr>
	
	<?php if ($this->_tpl_vars['campos']['nascimento'][4] != "0000-00-00"): ?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">Nascimento :</td>
		<td><?php echo ((is_array($_tmp=$this->_tpl_vars['campos']['nascimento'][4])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d/%m/%Y") : smarty_modifier_date_format($_tmp, "%d/%m/%Y")); ?>
</td>
	</tr>
	<?php endif; ?>
	
	<?php if ($this->_tpl_vars['campos']['rg'][4] != ""): ?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">RG :</td>
		<td><?php echo $this->_tpl_vars['campos']['rg'][4]; ?>
</td>
	</tr>
	<?php endif; ?>
	
	<?php if ($this->_tpl_vars['campos']['cpf'][4] != ""): ?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">CPF :</td>
		<td><?php echo $this->_tpl_vars['campos']['cpf'][4]; ?>
</td>
	</tr>
	<?php endif; ?>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">Sexo :</td>
		<td><?php echo $this->_tpl_vars['campos']['sexo'][4]; ?>
</td>
	</tr>
	
	<?php else: ?>
	
	<?php if ($this->_tpl_vars['campos']['razao_social'][4] != ""): ?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">Raz&atilde;o Social :</td>
		<td><?php echo $this->_tpl_vars['campos']['razao_social'][4]; ?>
</td>
	</tr>
	<?php endif; ?>
	
	<?php if ($this->_tpl_vars['campos']['nome_fantasia'][4] != ""): ?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">Nome Fantasia :</td>
		<td><?php echo $this->_tpl_vars['campos']['nome_fantasia'][4]; ?>
</td>
	</tr>
	<?php endif; ?>
	
	<?php if ($this->_tpl_vars['campos']['cnpj'][4] != ""): ?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">CNPJ :</td>
		<td><?php echo $this->_tpl_vars['campos']['cnpj'][4]; ?>
</td>
	</tr>
	<?php endif; ?>
	
	<?php if ($this->_tpl_vars['campos']['inscr_municipal'][4] != ""): ?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">Inscr. Municipal :</td>
		<td><?php echo $this->_tpl_vars['campos']['inscr_municipal'][4]; ?>
</td>
	</tr>
	<?php endif; ?>
	
	<?php if ($this->_tpl_vars['campos']['inscr_estadual'][4] != ""): ?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">Ins. Estadual :</td>
		<td><?php echo $this->_tpl_vars['campos']['inscr_estadual'][4]; ?>
</td>
	</tr>
	<?php endif; ?>
	
	<?php endif; ?>
	
	<?php if ($this->_tpl_vars['campos']['endereco'][4] != "" || $this->_tpl_vars['campos']['numero'][4] != ""): ?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">Endere&ccedil;o :</td>
		<td>
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td><?php echo $this->_tpl_vars['campos']['endereco'][4]; ?>
</td>
					<td class="rotulos">N&ordm;:&nbsp;</td>
					<td><?php echo $this->_tpl_vars['campos']['numero'][4]; ?>
</td>
				</tr>
			</table>
		</td>
	</tr>
	<?php endif; ?>
	
	<?php if ($this->_tpl_vars['campos']['complemento_tipo'][4] != "" || $this->_tpl_vars['campos']['bloco'][4] != ""): ?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">Complemento :</td>
		<td>
			<table class="tblinterna" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="100" nowrap><?php echo $this->_tpl_vars['campos']['complemento_tipo'][4]; ?>
 - <?php echo $this->_tpl_vars['campos']['complemento'][4]; ?>
</td>
					<td class="rotulos">Bloco:&nbsp;</td>
					<td><?php echo $this->_tpl_vars['campos']['bloco'][4]; ?>
</td>
				</tr>
			</table>
		</td>
	</tr>
	<?php endif; ?>
	
	<?php if ($this->_tpl_vars['campos']['bairro'][4] != ""): ?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">Bairro :</td>
		<td><?php echo $this->_tpl_vars['campos']['bairro'][4]; ?>
</td>
	</tr>
	<?php endif; ?>
	
	<?php if ($this->_tpl_vars['campos']['cep'][4] != ""): ?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">CEP :</td>
		<td><?php echo $this->_tpl_vars['campos']['cep'][4]; ?>
</td>
	</tr>
	<?php endif; ?>
	
	<?php if ($this->_tpl_vars['campos']['cidade'][4] != "" || $this->_tpl_vars['campos']['uf'][4]): ?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">Cidade :</td>
		<td>
			<table class="tblinterna" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="100" nowrap><?php echo $this->_tpl_vars['campos']['cidade'][4]; ?>
</td>
					<td style="width:26px" class="rotulos">UF :&nbsp;</td>
					<td width="100" nowrap><?php echo $this->_tpl_vars['campos']['uf'][4]; ?>
</td>
				</tr>
			</table>
		</td>
	</tr>
	<?php endif; ?>

	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">Tel. Residencial :</td>
		<td>
			<table class="tblinterna" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="100" nowrap><?php echo $this->_tpl_vars['campos']['tel_residencial'][4]; ?>
</td>
					<td class="rotulos" style="width:105px">Tel. Comercial :&nbsp;</td>
					<td width="100" nowrap><?php echo $this->_tpl_vars['campos']['tel_comercial'][4]; ?>
</td>
					<td class="rotulos" style="width:45px">Fax :&nbsp;</td>
					<td width="100" nowrap><?php echo $this->_tpl_vars['campos']['fax'][4]; ?>
</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<?php if ($this->_tpl_vars['campos']['tel_celular1'][4] != "" || $this->_tpl_vars['campos']['tel_celular2'][4] != ""): ?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">Celular 1:</td>
		<td>
			<table class="tblinterna" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="100" nowrap><?php echo $this->_tpl_vars['campos']['tel_celular1'][4]; ?>
</td>
					<td class="rotulos" style="width:73px;">Celular 2 :&nbsp;</td>
					<td width="100" nowrap><?php echo $this->_tpl_vars['campos']['tel_celular2'][4]; ?>
</td>
				</tr>
			</table>
			
		</td>
	</tr>
	<?php endif; ?>
	
	<?php if ($this->_tpl_vars['campos']['site'][4] != ""): ?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">Site:</td>
		<td><?php echo $this->_tpl_vars['campos']['site'][4]; ?>
</td>
	</tr>
	<?php endif; ?>
	
	<?php if ($this->_tpl_vars['campos']['email1'][4] != ""): ?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">E-mail 1:</td>
		<td><?php echo $this->_tpl_vars['campos']['email1'][4]; ?>
</td>
	</tr>
	<?php endif; ?>
	
	<?php if ($this->_tpl_vars['campos']['email2'][4] != ""): ?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">E-mail 2:</td>
		<td><?php echo $this->_tpl_vars['campos']['email2'][4]; ?>
</td>
	</tr>
	<?php endif; ?>
	
	<?php if ($this->_tpl_vars['campos']['email3'][4] != ""): ?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos">E-mail 3:</td>
		<td><?php echo $this->_tpl_vars['campos']['email3'][4]; ?>
</td>
	</tr>
	<?php endif; ?>
	
	<?php if ($this->_tpl_vars['campos']['observacoes'][4] != ""): ?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos" valign="top">Observa&ccedil;&otilde;es :</td>
		<td><?php echo ((is_array($_tmp=$this->_tpl_vars['campos']['observacoes'][4])) ? $this->_run_mod_handler('replace', true, $_tmp, "\n", "<br>") : smarty_modifier_replace($_tmp, "\n", "<br>")); ?>
</td>
	</tr>
	<?php endif; ?>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos" valign="top">Data cadastro :</td>
		<td><?php echo ((is_array($_tmp=$this->_tpl_vars['campos']['datacadastro'][4])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d/%m/%Y %H:%M") : smarty_modifier_date_format($_tmp, "%d/%m/%Y %H:%M")); ?>
</td>
	</tr>

</table>