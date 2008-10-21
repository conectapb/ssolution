<?php /* Smarty version 2.6.18, created on 2008-08-02 18:06:44
         compiled from adm/periodos_listagem.tpl */ ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_topo'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<script language="javascript" src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/js/jquery-1.2.2.pack.js"></script>
<script language="javascript" src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/js/jquery.tablesorter.pack.js"></script>
<script language="javascript" src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/js/jquery.quicksearch.js"></script>

<?php echo '
<script>
$(document).ready(function() 
    {

        $("#tablesorter").tablesorter({
			headers: {
				3: {
					sorter: false
				}
			},
			//sortList: [[1,0],[2,0],[3,0]],
			cancelSelection: true,
			widgets: [\'zebra\']});
		$(\'table#tablesorter tbody tr\').quicksearch({
			position: \'after\',
			attached: \'#searchBox\',
			labelText: \'Procurar por: \'
		});	
		$("#tablesorter tbody tr:even").mouseover( function() {$(this).addClass("over"); } ).mouseout( function() { $(this).removeClass("over"); } );
		$("#tablesorter tbody tr:odd").mouseover( function() { $(this).removeClass("odd"); $(this).addClass("over"); } ).mouseout( function() { $(this).removeClass("over"); $(this).addClass("odd"); } );
	}
);
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
	else if ($op=="alt")
	{
		$formulario.modo.value="alt";
		$formulario.id.value=$id;
		$formulario.submit();
	}
}
</script>
'; ?>


<div id="searchBox"></div>
<table border="0" cellpadding="0" cellspacing="1" id="tablesorter">
<thead>
<tr>
	<th width="350" align="center">Nome</th>
	<th width="120" align="center">Dia In&iacute;cio</th>
	<th width="120" align="center">Dia T&eacute;rmino</th>
	<th width="80" align="center">A&ccedil;&otilde;es</th>
</tr>
</thead>
<form name="frm" method="post" action="<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
">
<input type="hidden" name="modo" value="" />
<input type="hidden" name="id" value="" />
<tbody>
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
<?php $this->assign('tipo', $this->_tpl_vars['dados'][$this->_sections['i']['index']]['tipo']); ?>
	<tr>
		<td><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['nome']; ?>
</td>
		<td align="center"><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['dia_inicio']; ?>
</td>
		<td align="center"><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['dia_termino']; ?>
</td>
		<td nowrap align="center">
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
		<td colspan="4" align="center">Nenhum registro encontrado</td>
	</tr>
<?php endif; ?>
<tbody>
</form>
</table>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_rodape'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>