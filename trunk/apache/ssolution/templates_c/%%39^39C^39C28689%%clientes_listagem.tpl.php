<?php /* Smarty version 2.6.19, created on 2008-08-13 10:22:54
         compiled from adm/clientes_listagem.tpl */ ?>
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

<script>
gru="<?php echo $this->_tpl_vars['gru']; ?>
";
script_name="<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
";
<?php echo '
$(document).ready(function() {
	$("#tablesorter").tablesorter({
		headers: { 5: { sorter: false } },
		cancelSelection: true,
		widgets: [\'zebra\']
	});
	$(\'table#tablesorter tbody tr\').quicksearch({
		position: \'after\',
		attached: \'#searchBox\',
		labelText: \'Procurar por: \'
	});
	
	/*
	$("#tablesorter tbody tr:even").mouseover( function() {$(this).addClass("over"); } ).mouseout( function() { $(this).removeClass("over"); } );
	$("#tablesorter tbody tr:odd").mouseover( function() { $(this).removeClass("odd"); $(this).addClass("over"); } ).mouseout( function() { $(this).removeClass("over"); $(this).addClass("odd"); } );
	*/
	$("#visualizarBox_fechar").click(function(){$("#visualizarBox").toogle();});
	
	$("#gru").change(function(){
		document.location = script_name + \'?modo=lst&gru=\' + $(this).val();
	});
	
	$("#gru").val(gru);
});

function visualizar($id,$posY)
{
	if($id == parseInt($id))
	{
		$.post(\'clientes.php\', 
			{ 
			modo : "vis",
			id : $id }, 
			function(resposta){
				$("#visualizarBox").hide();
				$("#visualizarBox").html(resposta);
				$("#visualizarBox").css("top", self.pageYOffset+10);
				$("#visualizarBox").show("slow");
			}
		);
	}
	else
	{
		alert("visualizar: id NaN!")
	}
}


function findPosY(obj) {
	var curleft = curtop = 0;
	if (obj.offsetParent) {
		do {
			curleft += obj.offsetLeft;
			curtop += obj.offsetTop;
		} while (obj = obj.offsetParent);
		//return [curleft,curtop];
		return curtop;
	}
}

function chgVal($id,$op)
{
	$formulario = document.frm;
	if($op=="exc")
	{
		$formulario.modo.value="exc";
		$formulario.id.value=$id;
		if(confirm("Confirma Exclusao?"))
			$formulario.submit();
	}
	else if ($op=="alt")
	{
		$formulario.modo.value="alt";
		$formulario.id.value=$id;
		$formulario.submit();
	}
}
'; ?>

</script>

<div id="visualizarBox" style="position:absolute; top:10px; left:10px; border:1px solid black; background:#FFFFFF"></div>

<div id="searchBox" style="float:right">
<label for="gru">Filtrar por grupo:&nbsp;</label>
<select id="gru" name="gru" style="vertical-align:top">
<option value="">Todos</option>
<?php $_from = $this->_tpl_vars['grupos']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['grupo']):
?>
	<option value="<?php echo $this->_tpl_vars['grupo']['id']; ?>
"><?php echo $this->_tpl_vars['grupo']['nome_padrao']; ?>
</option>
<?php endforeach; endif; unset($_from); ?>
</select>

</div>
<table border="0" cellpadding="0" cellspacing="1" id="tablesorter">
<thead>
<tr>
	<th width="70" align="center">C&oacute;digo</th>
	<th width="100" align="center">Grupo</th>
	<th width="60" align="center">Bloco</th>
	<th width="70" colspan="2" align="center">Compl.</th>
	<th align="center">Nome&nbsp;/&nbsp;Raz�o Social</th>
	<th width="65" align="center">A&ccedil;&otilde;es</th>
</tr>
</thead>
<form name="frm" method="post" action="<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
">
<input type="hidden" name="modo" value="" />
<input type="hidden" name="id" value="" />
<input type="hidden" name="gru" value="<?php echo $_REQUEST['gru']; ?>
" />
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
<?php $this->assign('grupo_atual', $this->_tpl_vars['dados'][$this->_sections['i']['index']]['grupo']); ?>
<?php if ($this->_tpl_vars['dados'][$this->_sections['i']['index']]['status_id'] == 1): ?><?php $this->assign('cor_status', "#009966"); ?><?php endif; ?>
<?php if ($this->_tpl_vars['dados'][$this->_sections['i']['index']]['status_id'] == 2): ?><?php $this->assign('cor_status', "#FF0000"); ?><?php endif; ?>
<?php if ($this->_tpl_vars['dados'][$this->_sections['i']['index']]['status_id'] == 2): ?><?php $this->assign('cor_status', "#FF9900"); ?><?php endif; ?>
<?php if ($this->_tpl_vars['grupo_atual'] != $this->_tpl_vars['grupo_anterior'] && false): ?>
	<tr>
		<td class="td_agrupador" colspan="10"><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['grupo']; ?>
</td>
	</tr>
<?php endif; ?>
	<tr class="doStrip" style="color:<?php echo $this->_tpl_vars['cor_status']; ?>
;">
		<td class="td_content"><?php if ($this->_tpl_vars['dados'][$this->_sections['i']['index']]['codigo'] != ""): ?><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['codigo']; ?>
<?php else: ?>-<?php endif; ?></td>
		<td class="td_content"><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['grupo']; ?>
</td>
		<td class="td_content"><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['bloco']; ?>
</td>
		<td class="td_content"><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['complemento']; ?>
</td>
		<td class="td_content"><?php if ($this->_tpl_vars['dados'][$this->_sections['i']['index']]['complemento_tipo'] != ""): ?><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['complemento_tipo']; ?>
<?php endif; ?></td>
		<td class="td_content" nowrap="nowrap"><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['nome']; ?>
</td>
		<td nowrap>
			&nbsp;
			<a href="<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
?id=<?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['id']; ?>
&modo=alt"><img src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/images/edit.png" alt="Alterar" border="0" width="16" height="16" hspace="0" vspace="2" /></a>
			<img src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/images/exclude.png" alt="Excluir" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="chgVal(<?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['id']; ?>
,'exc');" />
			<img src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/images/lupa.png" alt="Alterar" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="visualizar(<?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['id']; ?>
,findPosY(this));" />
			&nbsp;
	  </td>
	</tr>
	<?php $this->assign('grupo_anterior', $this->_tpl_vars['dados'][$this->_sections['i']['index']]['grupo']); ?>
<?php endfor; else: ?>
	<tr>
		<td colspan="20" align="center">Nenhum cliente encontrado</td>
	</tr>
<?php endif; ?>
</tbody>
</form>
</table>
<br />
Total: <?php echo $this->_sections['i']['max']; ?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_rodape'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>