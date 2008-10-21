{include file=$tpl_adm_topo}
{*debug*}
{literal}
<script>
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

</script>
{/literal}

<table border="0" cellpadding="0" cellspacing="1">
	<form name="frm" method="post" action="{$SCRIPT_NAME}">
	<input type="hidden" name="modo" value="" />
	<input type="hidden" name="id" value="" />
	<tr>
		<td class="td_header" width="80" align="center">Codigo</td>
		<td class="td_header" width="350" align="center">Nome do Plano</td>
		<td class="td_header" width="70" align="center">Down.</td>
		<td class="td_header" width="70" align="center">Upl.</td>
		<td class="td_header" width="90" align="center">Valor Base</td>
		<td class="td_header" width="90" align="center">Contratos</td>
		<td>&nbsp;</td>
	</tr>
	{section name=i loop=$dados}
	<tr bgcolor="{cycle values="#FFFFFF,#FAFAFA"}">
		<td class="td_content">{if $dados[i].codigo != ""}{$dados[i].codigo}{else}-{/if}</td>
		<td class="td_content">{$dados[i].nome}</td>
		<td class="td_content" align="center">{$dados[i].vel_download}</td>
		<td class="td_content" align="center">{$dados[i].vel_upload}</td>
		<td class="td_content">{$dados[i].valor_base|replace:".":","}</td>
		<td class="td_content">{$dados[i].contratos}</td>
		<td nowrap>
			<img src="{$tpl_dir}/images/edit.png" alt="Alterar" border="0" width="16" height="16" align="absmiddle" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'alt');" />
			<img src="{$tpl_dir}/images/exclude.png" alt="Excluir" border="0" width="16" height="16" align="absmiddle" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'exc');" />
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
	</form>
</table>

{include file=$tpl_adm_rodape}