<?php /* Smarty version 2.6.18, created on 2008-08-02 18:39:22
         compiled from adm/planos_listagem.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'cycle', 'adm/planos_listagem.tpl', 70, false),array('modifier', 'replace', 'adm/planos_listagem.tpl', 75, false),)), $this); ?>
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
		if(confirm("Confirma Exclusão?"))
			$formulario.submit();
	}
	else
	{
		$formulario.modo.value="alt"
		$formulario.id.value=$id;
		$formulario.submit();
	}
}
function ressetForm(id_form)
{
	form = document.getElementById(id_form);
	for($i=0;$i<form.length-1;$i++)
	{
		if (form[$i].type=="text" || form[$i].type=="select-one")
		{
			form[$i].value="";
		}
		else
		{
			form[$i].checked=false;
		}
	}
}
function mostracampos(campo)
{
	cmp = document.getElementById(campo + "_div");
	cmp.style.display = "block";
	cmp2 = document.getElementById("abre_busca");
	cmp2.innerHTML = "<a href=\\"javascript:escondecampos(\'busca\');\\"><font size=\\"-1\\"><strong>[ Contrair Busca ]</strong></font></a>";
}

function escondecampos(campo)
{
	cmp = document.getElementById(campo + "_div");
	cmp.style.display = "none";
	cmp2 = document.getElementById("abre_busca");
	cmp2.innerHTML = "<a href=\\"javascript:mostracampos(\'busca\');\\"><font size=\\"-1\\"><strong>[ Expandir Busca ]</strong></font></a>";
}

</script>
'; ?>


<table border="0" cellpadding="0" cellspacing="1">
	<form name="frm" method="post" action="<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
">
	<input type="hidden" name="modo" value="" />
	<input type="hidden" name="id" value="" />
	<tr>
		<td class="td_header" width="80" align="center">Codigo</td>
		<td class="td_header" width="350" align="center">Nome do Plano</td>
		<td class="td_header" width="70" align="center">Down.</td>
		<td class="td_header" width="70" align="center">Upl.</td>
		<td class="td_header" width="90" align="center">Valor Base</td>
		<td class="td_header" width="90" align="center">Contratos</td>
		<td>&nbsp;</td>
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
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#FFFFFF,#FAFAFA"), $this);?>
">
		<td class="td_content"><?php if ($this->_tpl_vars['dados'][$this->_sections['i']['index']]['codigo'] != ""): ?><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['codigo']; ?>
<?php else: ?>-<?php endif; ?></td>
		<td class="td_content"><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['nome']; ?>
</td>
		<td class="td_content" align="center"><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['vel_download']; ?>
</td>
		<td class="td_content" align="center"><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['vel_upload']; ?>
</td>
		<td class="td_content"><?php echo ((is_array($_tmp=$this->_tpl_vars['dados'][$this->_sections['i']['index']]['valor_base'])) ? $this->_run_mod_handler('replace', true, $_tmp, ".", ",") : smarty_modifier_replace($_tmp, ".", ",")); ?>
</td>
		<td class="td_content"><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['contratos']; ?>
</td>
		<td nowrap>
			<img src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/images/edit.png" alt="Alterar" border="0" width="16" height="16" align="absmiddle" onmouseover="this.style.cursor='pointer';" onclick="chgVal(<?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['id']; ?>
,'alt');" />
			<img src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/images/exclude.png" alt="Excluir" border="0" width="16" height="16" align="absmiddle" onmouseover="this.style.cursor='pointer';" onclick="chgVal(<?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['id']; ?>
,'exc');" />
		</td>
	</tr>
	<?php endfor; else: ?>
	<tr>
		<td colspan="5" align="center" class="td_content">Nenhum registro encontrado</td>
	</tr>
	<?php endif; ?>
	<?php if ($this->_tpl_vars['paginacao'] != ""): ?>
	<tr>
		<td colspan="5" align="center">
			<table align="center" cellpadding="0" cellspacing="5">
				<tr>
					<td align="center">P&#225;ginas: </TD>
				<?php unset($this->_sections['j']);
$this->_sections['j']['name'] = 'j';
$this->_sections['j']['loop'] = is_array($_loop=$this->_tpl_vars['paginacao']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['j']['show'] = true;
$this->_sections['j']['max'] = $this->_sections['j']['loop'];
$this->_sections['j']['step'] = 1;
$this->_sections['j']['start'] = $this->_sections['j']['step'] > 0 ? 0 : $this->_sections['j']['loop']-1;
if ($this->_sections['j']['show']) {
    $this->_sections['j']['total'] = $this->_sections['j']['loop'];
    if ($this->_sections['j']['total'] == 0)
        $this->_sections['j']['show'] = false;
} else
    $this->_sections['j']['total'] = 0;
if ($this->_sections['j']['show']):

            for ($this->_sections['j']['index'] = $this->_sections['j']['start'], $this->_sections['j']['iteration'] = 1;
                 $this->_sections['j']['iteration'] <= $this->_sections['j']['total'];
                 $this->_sections['j']['index'] += $this->_sections['j']['step'], $this->_sections['j']['iteration']++):
$this->_sections['j']['rownum'] = $this->_sections['j']['iteration'];
$this->_sections['j']['index_prev'] = $this->_sections['j']['index'] - $this->_sections['j']['step'];
$this->_sections['j']['index_next'] = $this->_sections['j']['index'] + $this->_sections['j']['step'];
$this->_sections['j']['first']      = ($this->_sections['j']['iteration'] == 1);
$this->_sections['j']['last']       = ($this->_sections['j']['iteration'] == $this->_sections['j']['total']);
?>
					<td align="center">
					
					<?php if ($_GET['pag'] == $this->_tpl_vars['paginacao'][$this->_sections['j']['index']]): ?>
						<strong><?php echo $this->_tpl_vars['paginacao'][$this->_sections['j']['index']]; ?>
</strong>
					<?php else: ?>
						<a href="provedores.php?modo=lst&pag=<?php echo $this->_tpl_vars['paginacao'][$this->_sections['j']['index']]; ?>
<?php echo $this->_tpl_vars['build_geturl']; ?>
"><?php echo $this->_tpl_vars['paginacao'][$this->_sections['j']['index']]; ?>
</a>
					<?php endif; ?>
					</td>
				<?php endfor; endif; ?>
				</td>
			</table>
		</td>
	</tr>
	<?php endif; ?>
	</form>
</table>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_rodape'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>