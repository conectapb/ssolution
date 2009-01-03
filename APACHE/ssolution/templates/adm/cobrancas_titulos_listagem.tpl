{include file=$tpl_adm_topo}
{debug}
<script language="javascript" src="{$tpl_dir}/js/jquery.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.tablesorter.pack.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.quicksearch.js"></script>

<script>
gru="{$gru}";
script_name="{$SCRIPT_NAME}";
{literal}
$(document).ready(function() {
	$("#tablesorter").tablesorter({
		headers: { 5: { sorter: false } },
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

function visualizar($id,$posY)
{
	if($id == parseInt($id))
	{
		$.post('clientes.php', 
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
{/literal}
</script>

<div id="visualizarBox" style="position:absolute; top:10px; left:10px; border:1px solid black; background:#FFFFFF"></div>

<div id="searchBox" style="float:right">
<label for="gru">Filtrar por grupo:&nbsp;</label>
<select id="gru" name="gru" style="vertical-align:top">
<option value="">Todos</option>
{foreach from=$grupos item=grupo}
	<option value="{$grupo.id}">{$grupo.nome_padrao}</option>
{/foreach}
</select>

</div>
<table border="0" cellpadding="0" cellspacing="1" id="tablesorter">
<thead>
<tr>
	<th align="center">Nome&nbsp;/&nbsp;Razão Social</th>
	<th align="center">Plano</th>
	<th align="center" width="80">Ref. Mês</th>
	<th align="center" width="80">Ref. Ano</th>
	<th align="center">Valor</th>
	<th align="center">Vencimento</th>
	<th align="center" width="80">Código</th>
	<th align="center">Status</th>
	<th align="center">Ações</th>
</tr>
</thead>
<form name="frm" method="post" action="{$SCRIPT_NAME}">
<input type="hidden" name="modo" value="" />
<input type="hidden" name="id" value="" />
<input type="hidden" name="gru" value="{$smarty.request.gru}" />
<tbody>
{section name=i loop=$dados}
{assign var="referencia_mes" value=$dados[i].referencia_mes}
{assign var="status_id" value=$dados[i].status_id}
{assign var="grupo_atual" value=$dados[i].grupo}
{if $grupo_atual != $grupo_anterior && false}
	<tr>
		<td class="td_agrupador" colspan="10">{$dados[i].grupo}</td>
	</tr>
{/if}
	<tr class="doStrip">
		<td class="td_content" nowrap="nowrap">{$dados[i].nome}</td>
		<td class="td_content">{$dados[i].plano_nome}</td>
		<td class="td_content">{$meses[$referencia_mes]}</td>
		<td class="td_content">{$dados[i].referencia_ano}</td>
		<td class="td_content">{$dados[i].valor_format}</td>
		<td class="td_content">{$dados[i].vencimento|date_format:"%d/%m/%Y"}</td>
		<td class="td_content">{$dados[i].codigo}</td>
		<td nowrap="nowrap" class="td_content">{$lista_status[$status_id].nome}</td>
		<td nowrap>
			&nbsp;
			<a href="{$SCRIPT_NAME}?id={$dados[i].id}&modo=alt"><img src="{$tpl_dir}/images/edit.png" alt="Alterar" border="0" width="16" height="16" hspace="0" vspace="2" /></a>
			<img src="{$tpl_dir}/images/exclude.png" alt="Excluir" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'exc');" />
			<!--<img src="{$tpl_dir}/images/lupa.png" alt="Alterar" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="visualizar({$dados[i].id},findPosY(this));" />-->
			&nbsp;
	  </td>
	</tr>
	{assign var="grupo_anterior" value=$dados[i].grupo}
{sectionelse}
	<tr>
		<td colspan="20" align="center">Nenhum cliente encontrado</td>
	</tr>
{/section}
</tbody>
</form>
</table>
<br />
Total: {$smarty.section.i.max}
{include file=$tpl_adm_rodape}