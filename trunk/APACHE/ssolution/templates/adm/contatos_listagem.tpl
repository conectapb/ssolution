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
	else if ($op=="alt")
	{
		$formulario.modo.value="alt";
		$formulario.id.value=$id;
		$formulario.submit();
	}
}
</script>
{/literal}

<table border="0" cellpadding="0" cellspacing="1">
<form name="frm" method="post" target="{$SCRIPT_NAME}">
<input name="id" type="hidden" />
<input name="modo" type="hidden" />
<thead>

<tr>
	<th class="td_header" width="400" align="center">Nome</th>
	<th class="td_header" width="150" align="center">Tel. Residencial</th>
	<th class="td_header" width="150" align="center">Tel. Comercial</th>
	<th class="td_header" width="100" align="center">Cadastro</th>
	<th class="td_header">A&ccedil;&otilde;es</th>
</tr>

{section name=i loop=$dados}
	<tr bgcolor="{cycle values="#FAFAFA,#FFFFFF"}">
		<td class="td_content">{$dados[i].nome}</td>
		<td class="td_content" align="center">{if $dados[i].tel_residencial != ""}{$dados[i].tel_residencial}{else}-{/if}</td>
		<td class="td_content" align="center">{if $dados[i].tel_comercial != ""}{$dados[i].tel_comercial}{else}-{/if}</td>
		<td class="td_content" align="center">{$dados[i].datacadastro|date_format:"%d/%m/%Y"}</td>
		<td nowrap>
			<img src="{$tpl_dir}/images/edit.png" alt="Alterar" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'alt');" />
			<img src="{$tpl_dir}/images/exclude.png" alt="Excluir" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'exc');"s />
	  </td>
	</tr>
{sectionelse}
	<tr>
		<td colspan="4" align="center">Nenhum contato encontrado</td>
	</tr>
{/section}
</form>
</table>
<br />

{include file=$tpl_adm_rodape}