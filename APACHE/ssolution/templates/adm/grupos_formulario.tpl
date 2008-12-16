{include file=$tpl_adm_topo}
{*debug*}
<br />

<table width="100%" border="0" cellpadding="2" cellspacing="0" border="0">
<form name="frm" action="{$SCRIPT_NAME}" method="post" enctype="multipart/form-data" id="formulario">
<input type="hidden" name="processa" value="ok" />
<input type="hidden" name="modo" value="{$modo}" />
<input type="hidden" name="id" value="{$campos.id[4]}" />

	<tr>
		<td align="right"><label for="nome_padrao" class="rotulos">Nome Padr&atilde;o :</label></td>
		<td><input type="text" class="text_normal" name="nome_padrao" value="{$campos.nome_padrao[4]}" style="width:450px;" /></td>
	</tr>

	<tr>
		<td align="right"><label for="codigo" class="rotulos">C&oacute;digo :</label></td>
		<td><input type="text" class="text_normal" name="codigo" value="{$campos.codigo[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td align="right"><label for="tipo" class="rotulos">Tipo :</label></td>
		<td>
			<select name="tipo" style="width:450px;">
			{foreach from=$tipos item=tipo}
			<option value="{$tipo.id}">{$tipo.nome}</option>
			{/foreach}
			</select>
		</td>
	</tr>
	<script>document.frm.tipo.value="{$campos.tipo[4]}";</script>
	
	<tr>
		<td align="right"><label for="nome" class="rotulos">Nome :</label></td>
		<td><input type="text" class="text_normal" name="nome" value="{$campos.nome[4]}" style="width:450px;" /></td>
	</tr>

	<tr>
		<td align="right"><label for="endereco" class="rotulos">Endere&ccedil;o :</label></td>
		<td>
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td><input type="text" class="text_normal" name="endereco" value="{$campos.endereco[4]}" style="width:363px;" /></td>
					<td class="rotulos" style="width:33px"><label for="numero">N&ordm; :</label></td>
					<td><input type="text" class="text_pequeno" name="numero" value="{$campos.numero[4]}" /></td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td align="right"><label for="bairro" class="rotulos">Bairro :</label></td>
		<td><input type="text" class="text_normal" name="bairro" value="{$campos.bairro[4]}" style="width:450px;" /></td>
	</tr>

	<tr>
		<td align="right"><label for="cep" class="rotulos">CEP :</label></td>
		<td><input type="text" class="text_normal" name="cep" value="{$campos.cep[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td align="right"><label for="cidade" class="rotulos">Cidade :</label></td>
		<td>
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td><input type="text" class="text_normal" name="cidade" value="{$campos.cidade[4]}" style="width:363px;" /></td>
{if $campos.uf[4]!=""}{assign var="sel_estado" value=$campos.uf[4]}{else}{assign var="sel_estado" value="PR"}{/if}
					<td>&nbsp;&nbsp;&nbsp;<span class="rotulos">UF :</span>&nbsp;</td>
					<td>
						<select class="mini" name="uf">
						{html_options values=$estados selected=$sel_estado output=$estados}
						</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td align="right"><label for="observacoes" class="rotulos">Observa&ccedil;&otilde;es :</label></td>
		<td><textarea class="text_normal" name="observacoes" style="width:450px; height:100px;" />{$campos.observacoes[4]}</textarea></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">{if $modo=="alt"}<input type="button" class="botao_normal" value="Voltar" onClick="document.location='grupos.php?modo=lst'" />{/if}	<input type="submit" class="botao_normal" value="{$botao}" /></td>
	</tr>
	
</form>
</table>

{include file=$tpl_adm_rodape}