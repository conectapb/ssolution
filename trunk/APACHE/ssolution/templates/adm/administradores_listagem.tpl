{include file=$tpl_adm_topo}

{literal}
<script>
function chgVal($id,$op)
{
	$formulario = document.frm;
	if($op=="exc")
	{
		$formulario.modo.value="exc";
		$formulario.id.value=$id;
		if(confirm("Confirma Exclus??"))
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

<tr>
	<td class="td_header" width="300" align="center">Nome</td>
	<td class="td_header" width="150" align="center">Login</td>
	<td class="td_header" width="150" align="center">&Uacute;ltimo Acesso</td>
	<td class="td_header" width="150" align="center">IP acesso</td>
	<td>&nbsp;</td>
</tr>
<form name="frm" method="post" action="{$SCRIPT_NAME}">
<input type="hidden" name="modo" value="" />
<input type="hidden" name="id" value="" />
{section name=i loop=$dados}
	<tr bgcolor="{if $dados[i].id == 1}#DADDFE{else}{cycle values="#FAFAFA,#FFFFFF"}{/if}">
		<td class="td_content">{$dados[i].nome}</td>
		<td class="td_content">{$dados[i].login}</td>
		<td class="td_content" align="center">{if $dados[i].ultacesso != "0000-00-00 00:00:00"}{$dados[i].ultacesso|date_format:"%d/%m/%Y %H:%M"}{/if}</td>
		<td class="td_content" align="center">{$dados[i].ultacesso_ip}</td>
		<td>
			<img src="{$tpl_dir}/images/edit.png" alt="Alterar" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'alt');" />
			{if $smarty.session.admin_id==1 && $dados[i].id!=1}
			<img src="{$tpl_dir}/images/exclude.png" alt="Excluir" border="0" width="16" height="16" hspace="0" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'exc');"s />
			{/if}
	  </td>
	</tr>
{sectionelse}
	<tr>
		<td colspan="4" align="center">Nenhum administrador encontrado</td>
	</tr>
{/section}
</form>
</table>

{include file=$tpl_adm_rodape}