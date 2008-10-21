<?php /* Smarty version 2.6.18, created on 2008-08-04 12:19:04
         compiled from adm/contatos_listagem.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'cycle', 'adm/contatos_listagem.tpl', 40, false),array('modifier', 'date_format', 'adm/contatos_listagem.tpl', 44, false),)), $this); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_topo'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php echo '
<script>
function chgVal($id,$op)
{
	$formulario = document.frm;
	if($op=="exc")
	{
		$formulario.modo.value="exc";
		$formulario.id.value=$id;
		if(confirm("Confirma Exclus�o?"))
			$formulario.submit();
	}
	else if ($op=="alt")
	{
		$formulario.modo.value="alt";
		$formulario.id.value=$id;
		$formulario.submit();
	}
}
</script>
'; ?>


<table border="0" cellpadding="0" cellspacing="1">
<form name="frm" method="post" target="<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
">
<input name="id" type="hidden" />
<input name="modo" type="hidden" />
<thead>

<tr>
	<th class="td_header" width="400" align="center">Nome</th>
	<th class="td_header" width="150" align="center">Tel. Residencial</th>
	<th class="td_header" width="150" align="center">Tel. Comercial</th>
	<th class="td_header" width="100" align="center">Cadastro</th>
	<th class="td_header">A&ccedil;&otilde;es</th>
</tr>

<?php unset($this->_sections['i']);
$this->_sections['i']['name'] = 'i';
$this->_sections['i']['loop'] = is_array($_loop=$this->_tpl_vars['dados']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['i']['show'] = true;
$this->_sections['i']['max'] = $this->_sections['i']['loop'];
$this->_sections['i']['step'] = 1;
$this->_sections['i']['start'] = $this->_sections['i']['step'] > 0 ? 0 : $this->_sections['i']['loop']-1;
if ($this->_sections['i']['show']) {
    $this->_sections['i']['total'] = $this->_sections['i']['loop'];
    if ($this->_sections['i']['total'] == 0)
        $this->_sections['i']['show'] = false;
} else
    $this->_sections['i']['total'] = 0;
if ($this->_sections['i']['show']):

            for ($this->_sections['i']['index'] = $this->_sections['i']['start'], $this->_sections['i']['iteration'] = 1;
                 $this->_sections['i']['iteration'] <= $this->_sections['i']['total'];
                 $this->_sections['i']['index'] += $this->_sections['i']['step'], $this->_sections['i']['iteration']++):
$this->_sections['i']['rownum'] = $this->_sections['i']['iteration'];
$this->_sections['i']['index_prev'] = $this->_sections['i']['index'] - $this->_sections['i']['step'];
$this->_sections['i']['index_next'] = $this->_sections['i']['index'] + $this->_sections['i']['step'];
$this->_sections['i']['first']      = ($this->_sections['i']['iteration'] == 1);
$this->_sections['i']['last']       = ($this->_sections['i']['iteration'] == $this->_sections['i']['total']);
?>
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#FAFAFA,#FFFFFF"), $this);?>
">
		<td class="td_content"><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['nome']; ?>
</td>
		<td class="td_content" align="center"><?php if ($this->_tpl_vars['dados'][$this->_sections['i']['index']]['tel_residencial'] != ""): ?><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['tel_residencial']; ?>
<?php else: ?>-<?php endif; ?></td>
		<td class="td_content" align="center"><?php if ($this->_tpl_vars['dados'][$this->_sections['i']['index']]['tel_comercial'] != ""): ?><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['tel_comercial']; ?>
<?php else: ?>-<?php endif; ?></td>
		<td class="td_content" align="center"><?php echo ((is_array($_tmp=$this->_tpl_vars['dados'][$this->_sections['i']['index']]['datacadastro'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d/%m/%Y") : smarty_modifier_date_format($_tmp, "%d/%m/%Y")); ?>
</td>
		<td nowrap>
			<img src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/images/edit.png" alt="Alterar" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="chgVal(<?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['id']; ?>
,'alt');" />
			<img src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/images/exclude.png" alt="Excluir" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="chgVal(<?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['id']; ?>
,'exc');"s />
	  </td>
	</tr>
<?php endfor; else: ?>
	<tr>
		<td colspan="4" align="center">Nenhum contato encontrado</td>
	</tr>
<?php endif; ?>
</form>
</table>
<br />

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_rodape'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>