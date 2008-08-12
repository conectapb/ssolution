{include file=$tpl_adm_topo}
{*debug*}
<script language="javascript" src="{$tpl_dir}/js/jquery-1.2.2.pack.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.tablesorter.pack.js"></script>
<!--<script language="javascript" src="{$tpl_dir}/js/jquery.tablesorter.pager.js"></script>-->
<script language="javascript" src="{$tpl_dir}/js/jquery.quicksearch.js"></script>	
{literal}
<script>
$(document).ready(function() 
    { 
        //$("#listaClientes").tablesorter();//.tablesorterPager({container: $("#pager")});
		$('table#listaClientes tbody tr').quicksearch({
			stripeRowClass: ['odd', 'even'],
			position: 'after',
			attached: '#searchBox',
			labelText: 'Procurar por: '
		});	
		$("#listaClientes tr").filter(".doStrip").mouseover(function() {$(this).addClass("over");}).mouseout(function() {$(this).removeClass("over");});
		$(".doStrip:even").addClass("alt");
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
	<th class="td_header" width="80" align="center">Provedor</th>
	<th class="td_header" width="400" align="center">Nome</th>
	<th class="td_header" width="150" align="center">Tel. Residencial</th>
	<th class="td_header" width="150" align="center">Tel. Comercial</th>
	<th class="td_header" width="100" align="center">Cadastro</th>
	<th class="td_header">A&ccedil;&otilde;es</th>
</tr>
</thead>
<form name="frm" method="post" action="{$SCRIPT_NAME}">
<input type="hidden" name="modo" value="" />
<input type="hidden" name="id" value="" />
<tbody>
{foreach from=$nao_emitidos item=titulo}
	<tr class="doStrip">
		<td class="td_content">{$titulo.provedor_codigo}</td>
		<td class="td_content" align="center">{if $dados[i].tel_residencial != ""}{$dados[i].tel_residencial}{else}-{/if}</td>
		<td class="td_content" align="center">{if $dados[i].tel_comercial != ""}{$dados[i].tel_comercial}{else}-{/if}</td>
		<td class="td_content" align="center">{$dados[i].datacadastro|date_format:"%d/%m/%Y"}</td>
		<td nowrap>
			&nbsp;
			<img src="{$tpl_dir}/images/edit.png" alt="Alterar" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'alt');" />
			<img src="{$tpl_dir}/images/exclude.png" alt="Excluir" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'exc');"s />
			&nbsp;
	  </td>
	</tr>
{foreachelse}
	<tr>
		<td colspan="4" align="center">Nenhum t&iacute;tulo encontrado</td>
	</tr>
{/foreach}
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