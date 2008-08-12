{include file=$tpl_adm_topo}
{*debug*}
<script language="javascript" src="{$tpl_dir}/js/jquery-1.2.2.pack.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.tablesorter.pack.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.quicksearch.js"></script>

{literal}
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
			widgets: ['zebra']});
		$('table#tablesorter tbody tr').quicksearch({
			position: 'after',
			attached: '#searchBox',
			labelText: 'Procurar por: '
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
{/literal}

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
<form name="frm" method="post" action="{$SCRIPT_NAME}">
<input type="hidden" name="modo" value="" />
<input type="hidden" name="id" value="" />
<tbody>
{section name=i loop=$dados}
{assign var="tipo" value=$dados[i].tipo}
	<tr>
		<td>{$dados[i].nome}</td>
		<td align="center">{$dados[i].dia_inicio}</td>
		<td align="center">{$dados[i].dia_termino}</td>
		<td nowrap align="center">
			<img src="{$tpl_dir}/images/edit.png" alt="Alterar" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'alt');" />
			<img src="{$tpl_dir}/images/exclude.png" alt="Excluir" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'exc');"s />
	  </td>
	</tr>
{sectionelse}
	<tr>
		<td colspan="4" align="center">Nenhum registro encontrado</td>
	</tr>
{/section}
<tbody>
</form>
</table>

{include file=$tpl_adm_rodape}