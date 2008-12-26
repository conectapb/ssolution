{include file=$tpl_adm_topo}

{*debug*}

<script language="javascript" src="{$tpl_dir}/js/jquery.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.tablesorter.pack.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.quicksearch.js"></script>

<script>
{literal}
$(document).ready(function() {
	$("#tablesorter").tablesorter({
		headers: { 2: { sorter: false } },
		cancelSelection: true,
		widgets: ['zebra']
	});
	$('table#tablesorter tbody tr').quicksearch({
		position: 'after',
		attached: '#searchBox',
		labelText: 'Procurar por: '
	});

	$("#visualizarBox_fechar").click(function(){$("#visualizarBox").toogle();});

	$("#gru").change(function(){
		document.location = script_name + '?modo=lst&gru=' + $(this).val();
	});

	$("#gru").val(gru);
});

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
	cmp2.innerHTML = "<a href=\"javascript:escondecampos('busca');\"><font size=\"-1\"><strong>[ Contrair Busca ]</strong></font></a>";
}

function escondecampos(campo)
{
	cmp = document.getElementById(campo + "_div");
	cmp.style.display = "none";
	cmp2 = document.getElementById("abre_busca");
	cmp2.innerHTML = "<a href=\"javascript:mostracampos('busca');\"><font size=\"-1\"><strong>[ Expandir Busca ]</strong></font></a>";
}
{/literal}
</script>

<div id="visualizarBox" style="position:absolute; top:10px; left:10px; border:1px solid black; background:#FFFFFF"></div>

<div id="searchBox" style="float:right"></div>

<table width="365" border="0" cellpadding="0" cellspacing="1" id="tablesorter">
	<form name="frm" method="post" action="{$SCRIPT_NAME}">
	<input type="hidden" name="modo" value="" />
	<input type="hidden" name="id" value="" />
    <thead>
	<tr>
		<th width="300" align="center">Nome</td>
        <th width="85" align="center">Clientes</td>
		<th width="65" align="center">Ações</td>
	</tr>
    </thead>
    <tbody>
	{section name=i loop=$dados}
	<tr bgcolor="{cycle values="#FFFFFF,#FAFAFA"}">
		<td class="td_content">{$dados[i].nome}</td>
        <td class="td_content">{$dados[i].n_clientes}</td>
		<td nowrap align="center">
			{if $dados[i].id > 3}<img src="{$tpl_dir}/images/edit.png" alt="Alterar" border="0" width="16" height="16" align="absmiddle" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'alt');" />
			<img src="{$tpl_dir}/images/exclude.png" alt="Excluir" border="0" width="16" height="16" align="absmiddle" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'exc');" />{else}Status fixo{/if}
		</td>
	</tr>
	{sectionelse}
	<tr>
		<td colspan="5" align="center" class="td_content">Nenhum registro encontrado</td>
	</tr>
	{/section}
    </tbody>
	{if $paginacao!=""}
	<tr>
		<TD colspan="5" align="center">
			<table align="center" cellpadding="0" cellspacing="5">
				<TR>
					<TD align="center">P&#225;ginas: </TD>
				{section name=j loop=$paginacao}
					<TD align="center">
					
					{if $smarty.get.pag==$paginacao[j]}
						<strong>{$paginacao[j]}</strong>
					{else}
						<a href="{$SCRIPT_NAME}?modo=lst&pag={$paginacao[j]}{$build_geturl}">{$paginacao[j]}</a>
					{/if}
					</TD>
				{/section}
				</TR>
			</table>
		</TD>
	</tr>
	{/if}
	</form>
</table>

{include file=$tpl_adm_rodape}