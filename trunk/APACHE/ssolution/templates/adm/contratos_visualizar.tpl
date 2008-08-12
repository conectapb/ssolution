<div id="visualizarBox_opcoes" style="position:absolute; right:10px; top:10px; background:#FFFFFF; border:1px solid black;"><a href="{$SCRIPT_NAME}?id={$campos.id[4]}&modo=alt"><img src="{$tpl_dir}/images/edit.png" alt="Alterar" border="0" width="16" height="16" hspace="2" vspace="2" /></a><img src="{$tpl_dir}/images/block.jpg" alt="Fechar" border="0" width="16" height="16" hspace="2" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="$('#visualizarBox').hide('slow');" /></div>

<table id="visualizarTbl" width="800" border="0" cellpadding="2" cellspacing="0">

	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Código :</td>
		<td>{$campos.codigo[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Provedor :</td>
		<td>{$campos.provedor_id[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Plano :</td>
		<td>{$campos.plano_id[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Cliente :</td>
		<td>{$campos.cliente_id[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Grupo :</td>
		<td>{$campos.grupo_id[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos" valign="top">Descrição :</td>
		<td>{$campos.descricao[4]|replace:"\n":"<br />"}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos" valign="top">&nbsp;</td>
		<td>{$campos.ativo[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Data Início :</td>
		<td>{$campos.data_inicio[4]|date_format:"%d/%m/%Y"}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Data Término :</td>
		<td>{if $campos.data_termino[4]!="00/00/0000"}{$campos.data_termino[4]|date_format:"%d/%m/%Y"}{/if}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulo"><label class="rotulos" for="periodo_id">Período Padrão :</label></td>
		<td>{$plano.id}#{$periodo.nome}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Vencimento padrão :</td>
		<td>{$campos.vencimento_padrao[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos" valign="top">Observações :</td>
		<td>{$campos.observacoes[4]|replace:"\n":"<br />"}</td>
	</tr>
    
    <tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos" valign="top">Data cadastro :</td>
		<td>{$campos.datacadastro[4]|date_format:"%d/%m/%Y %H:%M"}</td>
	</tr>

</table>
