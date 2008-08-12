{include file=$tpl_adm_topo}
{*debug*}

<script language="javascript" src="{$tpl_dir}/js/jquery-1.2.2.pack.js"></script>
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
		$.post('contratos.php', 
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
	<form name="frm" method="post" action="{$SCRIPT_NAME}">
	<input type="hidden" name="modo" value="" />
	<input type="hidden" name="id" value="" />
<thead>
	<tr>
		<th width="50" align="center">Ativo</th>
		<th width="300" align="center">Cliente</th>
		<th width="250" align="center">Grupo</th>
        <th width="70" colspan="2" align="center">Compl.</th>
		<th width="200" align="center">Plano</th>
		<th width="50" align="center">Vcto</th>
		<th>A&ccedil;&otilde;es</th>
	</tr>
</thead>
<tbody>
{section name=i loop=$dados}

	<tr bgcolor="{cycle values=#FFFFFF,#FAFAFA}">
		<td class="td_content" align="center">{if $dados[i].ativo == 1}<img alt="Sim" src="{$tpl_dir}/images/check.jpg" width="14" height="14" />{else}<img alt="Não" src="{$tpl_dir}/images/block.jpg" width="14" height="14" />{/if}</td>
		<td nowrap class="td_content">{$dados[i].cliente}</td>
		<td nowrap class="td_content">{$dados[i].grupo}</td>
        <td class="td_content">{$dados[i].complemento}</td>
		<td class="td_content">{if $dados[i].complemento_tipo!=""}{$dados[i].complemento_tipo}{/if}</td>
		<td nowrap class="td_content">{$dados[i].plano}</td>
		<td nowrap class="td_content" align="center">{$dados[i].vencimento_padrao}</td>
		<td nowrap>
        	&nbsp;
			<a href="{$SCRIPT_NAME}?gru={$gru}&id={$dados[i].id}&modo=alt"><img src="{$tpl_dir}/images/edit.png" alt="Alterar" border="0" width="16" height="16" hspace="0" vspace="2" /></a>
			<img src="{$tpl_dir}/images/exclude.png" alt="Excluir" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'exc');" />
			<img src="{$tpl_dir}/images/lupa.png" alt="Alterar" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="visualizar({$dados[i].id},findPosY(this));" />
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
		<TD colspan="5" align="center">
			<table align="center" cellpadding="0" cellspacing="5">
				<TR>
					<TD align="center">P&#225;ginas: </TD>
{section name=j loop=$paginacao}
					<TD align="center">
					
{if $smarty.get.pag==$paginacao[j]}
						<strong>{$paginacao[j]}</strong>
{else}
						<a href="provedores.php?modo=lst&pag={$paginacao[j]}{$build_geturl}">{$paginacao[j]}</a>
{/if}
					</td>
{/section}
				</tr>
			</table>
		</TD>
	</tr>
{/if}
</tbody>
	</form>
</table>

{include file=$tpl_adm_rodape}