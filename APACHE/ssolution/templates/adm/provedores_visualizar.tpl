{*debug*}
<div id="visualizarBox_opcoes" style="position:absolute; right:10px; top:10px; background:#FFFFFF; border:1px solid black;"><a href="{$SCRIPT_NAME}?id={$campos.id}&modo=alt"><img src="{$tpl_dir}/images/edit.png" alt="Alterar" border="0" width="16" height="16" hspace="2" vspace="2" /></a><img src="{$tpl_dir}/images/block.jpg" alt="Fechar" border="0" width="16" height="16" hspace="2" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="$('#visualizarBox').hide('slow');" /></div>

<table id="visualizarTbl" width="600" border="0" cellpadding="2" cellspacing="0">

	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">C&oacute;digo :</td>
		<td>{$campos.codigo[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Raz&atilde;o Social :</td>
		<td>{$campos.razaosocial[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Nome Fantasia :</td>
		<td>{$campos.nomefantasia[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">CNPJ :</td>
		<td>{$campos.cnpj[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Inscri&ccedil;&atilde;o Estadual :</td>
		<td>{$campos.inscestadual[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Inscri&ccedil;&atilde;o Municipal :</td>
		<td>{$campos.inscmunicipal[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Respons&aacute;vel :</td>
		<td>{$campos.responsavel[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Endere&ccedil;o :</td>
		<td>{$campos.endereco[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">N&uacute;mero :</td>
		<td>{$campos.numero[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Complemento :</td>
		<td>{$campos.complemento[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Bairro :</td>
		<td>{$campos.bairro[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">CEP :</td>
		<td>{$campos.cep[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Cidade :</td>
		<td>{$campos.cidade[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">UF :</td>
		<td>{$campos.uf[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Telefone Principal :</td>
		<td>{$campos.tel_principal[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Telefone Comercial :</td>
		<td>{$campos.tel_comercial[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Telefone Financeiro :</td>
		<td>{$campos.tel_financeiro[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Telefone Suporte :</td>
		<td>{$campos.tel_suporte[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Celular 1 :</td>
		<td>{$campos.celular1[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Celular 2 :</td>
		<td>{$campos.celular2[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">Celular 3 :</td>
		<td>{$campos.celular3[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">FAX :</td>
		<td>{$campos.fax[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">E-mail Principal :</td>
		<td>{$campos.email_principal[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">E-mail Comercial :</td>
		<td>{$campos.email_comercial[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">E-mail Financeiro :</td>
		<td>{$campos.email_financeiro[4]}</td>
	</tr>
	
	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">E-mail Suporte :</td>
		<td>{$campos.email_suporte[4]}</td>
	</tr>

	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos" valign="top">Observa&ccedil;&otilde;es :</td>
		<td>{$campos.observacoes[4]}</td>
	</tr>
</table>
