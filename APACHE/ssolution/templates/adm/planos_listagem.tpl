{include file=$tpl_adm_topo}
{*debug*}

<script language="javascript" src="{$tpl_dir}/js/jquery-1.2.2.pack.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.tablesorter.pack.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.quicksearch.js"></script>

<script>
{literal}

$(document).ready(function() {
	$("#tablesorter").tablesorter({
		headers: { 6: { sorter: false } },
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
		$.post('provedores.php', 
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

{/literal}
</script>

<div id="visualizarBox" style="position:absolute; top:10px; left:10px; border:1px solid black; background:#FFFFFF"></div>

<div id="searchBox" style="float:right"></div>

<table border="0" cellpadding="0" cellspacing="1" id="tablesorter">
	<form name="frm" method="post" action="{$SCRIPT_NAME}">
	<input type="hidden" name="modo" value="" />
	<input type="hidden" name="id" value="" />
    <thead>
	<tr>
		<th width="80" align="center">Codigo</th>
		<th width="350" align="center">Nome do Plano</th>
		<th width="70" align="center">Down.</th>
		<th width="70" align="center">Upl.</th>
		<th width="90" align="center">Valor Base</th>
		<th width="90" align="center">Contratos</th>
		<th width="65" align="center">Ações</th>
	</tr>
    </thead>
    <tbody>
	{section name=i loop=$dados}
	<tr bgcolor="{cycle values="#FFFFFF,#FAFAFA"}">
		<td class="td_content">{if $dados[i].codigo != ""}{$dados[i].codigo}{else}-{/if}</td>
		<td class="td_content">{$dados[i].nome}</td>
		<td class="td_content" align="center">{$dados[i].vel_download}</td>
		<td class="td_content" align="center">{$dados[i].vel_upload}</td>
		<td class="td_content">{$dados[i].valor_base|replace:".":","}</td>
		<td class="td_content">{$dados[i].contratos}</td>
		<td nowrap>
        	&nbsp;
			<img src="{$tpl_dir}/images/edit.png" alt="Alterar" border="0" width="16" height="16" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'alt');" />
			<img src="{$tpl_dir}/images/exclude.png" alt="Excluir" border="0" width="16" height="16" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'exc');" />
            <img src="{$tpl_dir}/images/lupa.png" alt="Visualizar" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="visualizar({$dados[i].id},findPosY(this));" />
            &nbsp;
		</td>
	</tr>
	{sectionelse}
	<tr>
		<td colspan="5" align="center" class="td_content">Nenhum registro encontrado</td>
	</tr>
	{/section}
	{if $paginacao!=""}
	<tr>
		<td colspan="5" align="center">
			<table align="center" cellpadding="0" cellspacing="5">
				<tr>
					<td align="center">P&#225;ginas: </TD>
				{section name=j loop=$paginacao}
					<td align="center">
					
					{if $smarty.get.pag==$paginacao[j]}
						<strong>{$paginacao[j]}</strong>
					{else}
						<a href="provedores.php?modo=lst&pag={$paginacao[j]}{$build_geturl}">{$paginacao[j]}</a>
					{/if}
					</td>
				{/section}
				</td>
			</table>
		</td>
	</tr>
	{/if}
    </tbody
	</form>
</table>

{include file=$tpl_adm_rodape}