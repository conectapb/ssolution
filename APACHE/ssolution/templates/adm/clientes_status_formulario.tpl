{include file=$tpl_adm_topo}
{*debug*}
<br />

<table width="100%" border="0" cellpadding="2" cellspacing="0" border="0">
	<form name="frm" action="{$SCRIPT_NAME}" method="post" enctype="multipart/form-data">
	<input type="hidden" name="processa" value="ok" />
	<input type="hidden" name="modo" value="{$modo}" />
	<input type="hidden" name="id" value="{$campos.id[4]}" />
	
	<tr>
		<td class="rotulos">Nome :</td>
		<td><input type="text" class="text_normal" name="nome" value="{$campos.nome[4]}" style="width:450px;" /></td>
	</tr>

	<tr>
		<td>&nbsp;</td>
		<td align="center">
			{if $modo=="alt"}<input type="button" class="botao" value="Voltar" onClick="window.back()'" />&nbsp;{/if}
		<input type="submit" class="botao" value="{$botao}" /></td>
	</tr>
</form>
</table>

{include file=$tpl_adm_rodape}