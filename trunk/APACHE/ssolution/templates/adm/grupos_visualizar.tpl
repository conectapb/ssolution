{*debug*}
<div id="visualizarBox_opcoes" style="position:absolute; right:10px; top:10px; background:#FFFFFF; border:1px solid black;"><a href="{$SCRIPT_NAME}?id={$campos.id}&modo=alt"><img src="{$tpl_dir}/images/edit.png" alt="Alterar" border="0" width="16" height="16" hspace="2" vspace="2" /></a><img src="{$tpl_dir}/images/block.jpg" alt="Fechar" border="0" width="16" height="16" hspace="2" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="$('#visualizarBox').hide('slow');" /></div>

<table width="100%" border="0" cellpadding="2" cellspacing="0" border="0">
<form name="frm" action="{$SCRIPT_NAME}" method="post" enctype="multipart/form-data" id="formulario">
<input type="hidden" name="processa" value="ok" />
<input type="hidden" name="modo" value="{$modo}" />
<input type="hidden" name="id" value="{$campos.id[4]}" />

	<tr>
		<td align="right"><label for="nome_padrao" class="rotulos">Nome Padr&atilde;o :</label></td>
		<td>{$campos.nome_padrao[4]}</td>
	</tr>

	<tr>
		<td align="right"><label for="codigo" class="rotulos">C&oacute;digo :</label></td>
		<td>{$campos.codigo[4]}</td>
	</tr>
	
	<tr>
		<td align="right"><label for="tipo" class="rotulos">Tipo :</label></td>
		<td>2
			<select name="tipo" style="width:450px;">
			{foreach from=$tipos item=tipo}
			<option value="{$tipo.id}">{$tipo.tipo}</option>
			{/foreach}
			</select>
		</td>
	</tr>
	<script>document.frm.tipo.value="{$campos.tipo[4]}";</script>
	
	<tr>
		<td align="right"><label for="nome" class="rotulos">Nome :</label></td>
		<td>{$campos.nome[4]}</td>
	</tr>

	<tr>
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

	<tr>
		<td align="right"><label for="bairro" class="rotulos">Bairro :</label></td>
		<td>{$campos.bairro[4]}</td>
	</tr>

	<tr>
		<td align="right"><label for="cep" class="rotulos">CEP :</label></td>
		<td>{$campos.cep[4]}</td>
	</tr>
	
	<tr>
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
	
	<tr>
		<td align="right"><label for="observacoes" class="rotulos">Observa&ccedil;&otilde;es :</label></td>
		<td>{$campos.observacoes[4]}</td>
	</tr>

</table>
