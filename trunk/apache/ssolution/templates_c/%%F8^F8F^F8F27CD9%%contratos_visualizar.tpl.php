<?php /* Smarty version 2.6.19, created on 2008-09-30 11:30:51
         compiled from adm/contratos_visualizar.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'cycle', 'adm/contratos_visualizar.tpl', 5, false),array('modifier', 'replace', 'adm/contratos_visualizar.tpl', 37, false),array('modifier', 'date_format', 'adm/contratos_visualizar.tpl', 42, false),)), $this); ?>
<div id="visualizarBox_opcoes" style="position:absolute; right:10px; top:10px; background:#FFFFFF; border:1px solid black;"><a href="<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
?id=<?php echo $this->_tpl_vars['campos']['id']; ?>
&modo=alt"><img src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/images/edit.png" alt="Alterar" border="0" width="16" height="16" hspace="2" vspace="2" /></a><img src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/images/block.jpg" alt="Fechar" border="0" width="16" height="16" hspace="2" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="$('#visualizarBox').hide('slow');" /></div>

<table id="visualizarTbl" width="800" border="0" cellpadding="2" cellspacing="0">

	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos" valign="top">Contrato ativo ?</td>
		<td><?php if ($this->_tpl_vars['campos']['ativo'] == 1): ?><img alt="Sim" src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/images/check.jpg" width="14" height="14" /><?php else: ?><img alt="Não" src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/images/block.jpg" width="14" height="14" /><?php endif; ?></td>
	</tr>

	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Código :</td>
		<td><?php echo $this->_tpl_vars['campos']['codigo']; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Provedor :</td>
		<td><?php echo $this->_tpl_vars['campos']['provedor']; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Plano :</td>
		<td><?php echo $this->_tpl_vars['campos']['plano']; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Cliente :</td>
		<td><?php echo $this->_tpl_vars['campos']['cliente']; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Grupo :</td>
		<td><?php echo $this->_tpl_vars['campos']['grupo']; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos" valign="top">Descrição :</td>
		<td><?php echo ((is_array($_tmp=$this->_tpl_vars['campos']['descricao'])) ? $this->_run_mod_handler('replace', true, $_tmp, "\n", "<br />") : smarty_modifier_replace($_tmp, "\n", "<br />")); ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Data Início :</td>
		<td><?php echo ((is_array($_tmp=$this->_tpl_vars['campos']['data_inicio'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d/%m/%Y") : smarty_modifier_date_format($_tmp, "%d/%m/%Y")); ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Data Término :</td>
		<td><?php if ($this->_tpl_vars['campos']['data_termino'] != "00/00/0000"): ?><?php echo ((is_array($_tmp=$this->_tpl_vars['campos']['data_termino'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d/%m/%Y") : smarty_modifier_date_format($_tmp, "%d/%m/%Y")); ?>
<?php endif; ?></td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Período Padrão :</td>
		<td><?php echo $this->_tpl_vars['campos']['periodo']; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos">Vencimento padrão :</td>
		<td><?php echo $this->_tpl_vars['campos']['vencimento_padrao']; ?>
</td>
	</tr>
	
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#eeeeee,#d0d0d0"), $this);?>
">
		<td class="rotulos" valign="top">Observações :</td>
		<td><?php echo ((is_array($_tmp=$this->_tpl_vars['campos']['observacoes'])) ? $this->_run_mod_handler('replace', true, $_tmp, "\n", "<br />") : smarty_modifier_replace($_tmp, "\n", "<br />")); ?>
</td>
	</tr>
    
    <tr bgcolor="<?php echo smarty_function_cycle(array('values' => '#eeeeee,#d0d0d0'), $this);?>
">
		<td class="rotulos" valign="top">Data cadastro :</td>
		<td><?php echo ((is_array($_tmp=$this->_tpl_vars['campos']['datacadastro'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d/%m/%Y %H:%M") : smarty_modifier_date_format($_tmp, "%d/%m/%Y %H:%M")); ?>
</td>
	</tr>

</table>