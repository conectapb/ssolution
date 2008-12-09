
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

<table border="0" cellpadding="0" cellspacing="1" id="tablesorter">
<thead>
<tr>
	<th width="80" align="center">Código</td>
	<th width="300" align="center">Nome Padrão</td>
	<th width="400" align="center">Nome Completo</td>
	<th width="150" align="center">Tipo</td>
	<th width="100" align="center">Cadastro</td>
	<th nowrap="nowrap" width="65">Ações</th>
</tr>
</thead>
<form name="frm" method="post" action="{$SCRIPT_NAME}">
<input type="hidden" name="modo" value="" />
<input type="hidden" name="id" value="" />
{section name=i loop=$dados}
{assign var="tipo" value=$dados[i].tipo}

	<tr bgcolor="{cycle values="#FAFAFA,#FFFFFF"}">
		<td class="td_content">{if $dados[i].codigo != ""}{$dados[i].codigo}{else}-{/if}</td>
		<td class="td_content">{$dados[i].nome_padrao}</td>
		<td class="td_content">{$dados[i].nome}</td>
		<td class="td_content" align="center">{$dados[i].tipo}</td>
		<td class="td_content" align="center">{$dados[i].datacadastro|date_format:"%d/%m/%Y"}</td>
		<td nowrap>
        	&nbsp;
			<img src="{$tpl_dir}/images/edit.png" alt="Alterar" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'alt');" />
			<img src="{$tpl_dir}/images/exclude.png" alt="Excluir" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'exc');"s />
            &nbsp;
	  </td>
	</tr>
{sectionelse}
	<tr>
		<td colspan="4" align="center">Nenhum registro encontrado</td>
	</tr>
{/section}
</form>
</table>

{include file=$tpl_adm_rodape}