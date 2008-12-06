{include file=$tpl_adm_topo}
{*debug*}
<script language="javascript" src="{$tpl_dir}/js/jquery.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.tablesorter.pack.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.tablesorter.pager.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.quicksearch.js"></script>	
{literal}
<script>
$(document).ready(function() 
    { 
        $("#listaClientes").tablesorter();//.tablesorterPager({container: $("#pager")});
		$('table#listaClientes tbody tr').quicksearch({
			stripeRowClass: ['odd', 'even'],
			position: 'before',
			attached: '#listaClientes',
			labelText: 'Procurar por: '
		});	
		$("#listaClientes tr").mouseover(function() {$(this).addClass("over");}).mouseout(function() {$(this).removeClass("over");});
		$("#listaClientes tr:even").addClass("alt");
    }
	
);
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
</script>
{/literal}

<table border="0" cellpadding="0" cellspacing="1" id="listaClientes">
<thead>
<tr>
	<th class="td_header" width="300" align="center">Cliente</th>
	<th class="td_header" width="150" align="center">Tipo</th>
	<th class="td_header" width="300" align="center">Atendente</th>
	<th class="td_header" width="100" align="center">Status</th>
	<th>&nbsp;</th>
</tr>
</thead>
<form name="frm" method="post" action="{$SCRIPT_NAME}">
<input type="hidden" name="modo" value="" />
<input type="hidden" name="id" value="" />
<tbody>
{section name=i loop=$dados}
	<tr>
		<td class="td_content">{$dados[i].cliente}</td>
		<td class="td_content">{$dados[i].tipo}</td>
		<td class="td_content">{$dados[i].atendente}</td>
		<td class="td_content">{$dados[i].status}</td>
		<td nowrap>
			<img src="{$tpl_dir}/images/edit.png" alt="Alterar" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'alt');" />
			<img src="{$tpl_dir}/images/exclude.png" alt="Excluir" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'exc');"s />
	  </td>
	</tr>
{sectionelse}
	<tr>
		<td colspan="4" align="center">Nenhum usu&aacute;rio encontrado</td>
	</tr>
{/section}
</tbody>
</form>
</table>

<div id="pager" class="pager" align="center" style="display:none">
<br />
	<form>
		<img src="{$tpl_dir}/images/first.png" class="first"/>
		<img src="{$tpl_dir}/images/prev.png" class="prev"/>
		<input type="text" class="pagedisplay" readonly/>
		<img src="{$tpl_dir}/images/next.png" class="next"/>
		<img src="{$tpl_dir}/images/last.png" class="last"/>
		<select class="pagesize">
			<option selected="selected"  value="10">10</option>
			<option value="20">20</option>
			<option value="30">30</option>
			<option  value="40">40</option>
		</select>
	</form>
</div>

{include file=$tpl_adm_rodape}