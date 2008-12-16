{*debug*}
<div id="visualizarBox_opcoes" style="position:absolute; right:10px; top:10px; background:#FFFFFF; border:1px solid black;"><a href="{$SCRIPT_NAME}?id={$campos.id[4]}&modo=alt"><img src="{$tpl_dir}/images/edit.png" alt="Alterar" border="0" width="16" height="16" hspace="2" vspace="2" /></a><img src="{$tpl_dir}/images/block.jpg" alt="Fechar" border="0" width="16" height="16" hspace="2" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="$('#visualizarBox').hide('slow');" /></div>

<table width="500" border="0" cellpadding="2" cellspacing="0" border="0">

	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td align="right" width="100"><label for="nome_padrao" class="rotulos">Nome Padr&atilde;o :</label></td>
		<td>{$campos.nome_padrao[4]}</td>
	</tr>

	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td align="right"><label for="codigo" class="rotulos">C&oacute;digo :</label></td>
		<td>{$campos.codigo[4]}</td>
	</tr>
{assign var="tipo" value=$campos.tipo[4]}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td align="right"><label for="tipo" class="rotulos">Tipo :</label></td>
		<td>{$tipos[$tipo].nome}</td>
	</tr>
	
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td align="right"><label for="nome" class="rotulos">Nome :</label></td>
		<td>{$campos.nome[4]}</td>
	</tr>
{if $campos.endereco[4] != ""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td align="right"><label for="endereco" class="rotulos">Endere&ccedil;o :</label></td>
		<td>
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>{$campos.endereco[4]}</td>
					<td class="rotulos" style="width:33px"><label for="numero">N&ordm; :</label></td>
					<td>{$campos.numero[4]}</td>
				</tr>
			</table>
		</td>
	</tr>
{/if}
{if $campos.bairro[4] != ""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td align="right"><label for="bairro" class="rotulos">Bairro :</label></td>
		<td>{$campos.bairro[4]}</td>
	</tr>
{/if}
{if $campos.cep[4] != ""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td align="right"><label for="cep" class="rotulos">CEP :</label></td>
		<td>{$campos.cep[4]}</td>
	</tr>
{/if}
{if $campos.cidade[4] != "" || $campos.uf[4] != ""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td align="right"><label for="cidade" class="rotulos">Cidade :</label></td>
		<td>
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>{$campos.cidade[4]}</td>
					<td>&nbsp;&nbsp;&nbsp;<span class="rotulos">UF :</span>&nbsp;</td>
					<td>{$campos.uf[4]}</td>
				</tr>
			</table>
		</td>
	</tr>
{/if}
{if $campos.observacoes[4] != ""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td align="right" valign="top"><label for="observacoes" class="rotulos">Observa&ccedil;&otilde;es :</label></td>
		<td>{$campos.observacoes[4]}</td>
	</tr>
{/if}
</table>
