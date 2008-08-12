{include file=$tpl_adm_topo}
{*debug*}
<br />

<table width="100%" border="0" cellpadding="2" cellspacing="0" border="0">
	<form name="frm" action="{$SCRIPT_NAME}" method="post" enctype="multipart/form-data">
	<input type="hidden" name="processa" value="ok" />
	<input type="hidden" name="modo" value="{$modo}" />
	<input type="hidden" name="id" value="{$campos.id[4]}" />
	
	<tr>
		<td class="rotulos">C&oacute;digo :</td>
		<td><input type="text" class="text_normal" name="codigo" value="{$campos.codigo[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Nome do Plano :</td>
		<td><input type="text" class="text_normal" name="nome" value="{$campos.nome[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">Descri&ccedil;&atilde;o :</td>
		<td><textarea class="text_normal" name="descricao" style="width:450px; height:100px;" />{$campos.descricao[4]}</textarea></td>
	</tr>
	
	<tr>
		<td class="rotulos">Vel. Download :</td>
		<td><input type="text" class="text_normal" name="vel_download" value="{$campos.vel_download[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Vel. Upload :</td>
		<td><input type="text" class="text_normal" name="vel_upload" value="{$campos.vel_upload[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Valor base :</td>
		<td><input type="text" class="text_normal" name="valor_base" value="{$campos.valor_base[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Valor Ponto Adicional :</td>
		<td><input type="text" class="text_normal" name="valor_pontoadicional" value="{$campos.valor_pontoadicional[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td>&nbsp;</td>
		<td><input type="checkbox" name="fidelidade" id="fidelidade" value="1" /><label for="fidelidade">Fidelidade</label></td>
	</tr>
	
	<script>
		$val = "{$campos.fidelidade[4]}";
		if($val==1)	document.frm.fidelidade.checked=true;
	</script>
	
	<tr>
		<td class="rotulos" valign="top">Observa&ccedil;&otilde;es :</td>
		<td><textarea class="text_normal" name="observacoes" style="width:450px; height:100px;" />{$campos.observacoes[4]}</textarea></td>
	</tr>

	<tr>
		<td>&nbsp;</td>
		<td align="center">
			{if $modo=="alt"}<input type="button" class="botao" value="Voltar" onClick="document.location='{$SCRIPT_NAME}?modo=lst'" />&nbsp;{/if}
		<input type="submit" class="botao" value="{$botao}" /></td>
	</tr>
</form>
</table>

{include file=$tpl_adm_rodape}