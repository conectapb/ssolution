<?php /* Smarty version 2.6.19, created on 2008-10-16 11:34:42
         compiled from adm/provedores_listagem.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'cycle', 'adm/provedores_listagem.tpl', 108, false),)), $this); ?>
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
		headers: { 3: { sorter: false } },
		cancelSelection: true,
		widgets: [\'zebra\']
	});
	$(\'table#tablesorter tbody tr\').quicksearch({
		position: \'after\',
		attached: \'#searchBox\',
		labelText: \'Procurar por: \'
	});
	
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
		$.post(\'provedores.php\', 
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

</script>
'; ?>


<div id="visualizarBox" style="position:absolute; top:10px; left:10px; border:1px solid black; background:#FFFFFF"></div>

<div id="searchBox" style="float:right"></div>

<table border="0" cellpadding="0" cellspacing="1" id="tablesorter">
	<form name="frm" method="post" action="<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
">
	<input type="hidden" name="modo" value="" />
	<input type="hidden" name="id" value="" />
	<thead>
    <tr>
		<!--<th width="80" align="center">Código</th>-->
		<th width="300" align="center">Raz&atilde;o Social</th>
		<th width="300" align="center">Respons&aacute;vel</th>
		<th width="100" align="center">Tel. Principal</th>
		<th width="65" align="center">Ações</td>
	</tr>
    </thead>
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
	<tr bgcolor="<?php echo smarty_function_cycle(array('values' => "#FFFFFF,#FAFAFA"), $this);?>
">
		<!--<td class="td_content"><?php if ($this->_tpl_vars['dados'][$this->_sections['i']['index']]['codigo'] != ""): ?><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['codigo']; ?>
<?php else: ?>-<?php endif; ?></td>-->
		<td class="td_content"><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['razaosocial']; ?>
</td>
		<td class="td_content"><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['responsavel']; ?>
</td>
		<td class="td_content" align="center"><?php if ($this->_tpl_vars['dados'][$this->_sections['i']['index']]['tel_principal'] != ""): ?><?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['tel_principal']; ?>
<?php else: ?>-<?php endif; ?></td>
		<td nowrap>
        	&nbsp;
			<img src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/images/edit.png" alt="Alterar" border="0" width="16" height="16" onmouseover="this.style.cursor='pointer';" onclick="chgVal(<?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['id']; ?>
,'alt');" />
			<img src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/images/exclude.png" alt="Excluir" border="0" width="16" height="16" onmouseover="this.style.cursor='pointer';" onclick="chgVal(<?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['id']; ?>
,'exc');" />
            <img src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/images/lupa.png" alt="Alterar" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="visualizar(<?php echo $this->_tpl_vars['dados'][$this->_sections['i']['index']]['id']; ?>
,findPosY(this));" />
            &nbsp;
		</td>
	</tr>
	<?php endfor; else: ?>
	<tr>
		<td colspan="5" align="center" class="td_content">Nenhum registro encontrado</td>
	</tr>
	<?php endif; ?>
	<?php if ($this->_tpl_vars['paginacao'] != ""): ?>
	<tr>
		<TD colspan="5" align="center">
			<table align="center" cellpadding="0" cellspacing="5">
				<TR>
					<TD align="center">P&#225;ginas: </TD>
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
					<TD align="center">
					
					<?php if ($_GET['pag'] == $this->_tpl_vars['paginacao'][$this->_sections['j']['index']]): ?>
						<strong><?php echo $this->_tpl_vars['paginacao'][$this->_sections['j']['index']]; ?>
</strong>
					<?php else: ?>
						<a href="provedores.php?modo=lst&pag=<?php echo $this->_tpl_vars['paginacao'][$this->_sections['j']['index']]; ?>
<?php echo $this->_tpl_vars['build_geturl']; ?>
"><?php echo $this->_tpl_vars['paginacao'][$this->_sections['j']['index']]; ?>
</a>
					<?php endif; ?>
					</TD>
				<?php endfor; endif; ?>
				</TR>
			</table>
		</TD>
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