{include file=$tpl_adm_topo}
{*debug*}
<br />

<table width="100%" border="0" cellpadding="2" cellspacing="0" border="0">
<form name="frm" action="{$SCRIPT_NAME}" method="post" enctype="multipart/form-data">
	<input type="hidden" name="processa" value="ok" />
	<input type="hidden" name="modo" value="{$modo}" />
	<input type="hidden" name="id" value="{$campos.id[4]}" />

	<tr>
		<td class="rotulos">Nome:</td>
		<td><input type="text" class="text_normal" name="nome" value="{$campos.nome[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Empresa:</td>
		<td><input type="text" class="text_normal" name="empresa" value="{$campos.empresa[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Tipo: <small>(cliente, s&iacute;ndico)</small></td>
		<td><input type="text" class="text_normal" name="tipo" value="{$campos.tipo[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Edif&iacute;cio/Condom&iacute;nio:</td>
		<td><input type="text" class="text_normal" name="edificio" value="{$campos.edificio[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Endere&ccedil;o :</td>
		<td>
			<input type="text" class="text_normal" name="endereco" value="{$campos.endereco[4]}" style="width:363px;" />
			N&ordm; :
			<input type="text" class="text_normal" name="numero" value="{$campos.numero[4]}" style="width:50px;" />
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Complemento :</td>
		<td><input type="text" class="text_normal" name="complemento" value="{$campos.complemento[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Bairro :</td>
		<td><input type="text" class="text_normal" name="bairro" value="{$campos.bairro[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">CEP :</td>
		<td><input type="text" class="text_normal" name="cep" value="{$campos.cep[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Cidade :</td>
		<td>
			<input type="text" class="text_normal" name="cidade" value="{$campos.cidade[4]}" style="width:363px;" />
			{if $campos.uf[4]!=""}{assign var="sel_estado" value=$campos.uf[4]}{else}{assign var="sel_estado" value="PR"}{/if}
			UF :
			<select class="text_normal" name="uf" style="width:50px;">
				{html_options values=$estados selected=$sel_estado output=$estados}
			</select>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Telefone 1:</td>
		<td><input type="text" class="text_normal" name="telefone1" value="{$campos.telefone1[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Telefone 2:</td>
		<td><input type="text" class="text_normal" name="telefone2" value="{$campos.telefone2[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Celular 1:</td>
		<td><input type="text" class="text_normal" name="celular1" value="{$campos.celular1[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Celular 2:</td>
		<td><input type="text" class="text_normal" name="celular2" value="{$campos.celular2[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">E-mail 1:</td>
		<td><input type="text" class="text_normal" name="email1" value="{$campos.email1[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">E-mail 2:</td>
		<td><input type="text" class="text_normal" name="email2" value="{$campos.email2[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">Observa&ccedil;&otilde;es:</td>
		<td><textarea name="observacoes" style="width:450px; height:150px">{$campos.observacoes[4]}</textarea></td>
	</tr>
	
	<tr>
		<td>&nbsp;</td>
		<td align="center">
			{if $modo=="alt"}<input type="button" class="botao" value="Voltar" onClick="document.location='contatos.php'" />&nbsp;{/if}
		<input type="submit" class="botao" value="{$botao}" /></td>
	</tr>

</form>
</table>

{include file=$tpl_adm_rodape}
