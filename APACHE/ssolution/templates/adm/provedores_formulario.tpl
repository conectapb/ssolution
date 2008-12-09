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
		<td class="rotulos">Raz&atilde;o Social :</td>
		<td><input type="text" class="text_normal" name="razaosocial" value="{$campos.razaosocial[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Nome Fantasia :</td>
		<td><input type="text" class="text_normal" name="nomefantasia" value="{$campos.nomefantasia[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">CNPJ :</td>
		<td><input type="text" class="text_normal" name="cnpj" value="{$campos.cnpj[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Inscri&ccedil;&atilde;o Estadual :</td>
		<td><input type="text" class="text_normal" name="inscestadual" value="{$campos.inscestadual[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Inscri&ccedil;&atilde;o Municipal :</td>
		<td><input type="text" class="text_normal" name="inscmunicipal" value="{$campos.inscmunicipal[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Respons&aacute;vel :</td>
		<td><input type="text" class="text_normal" name="responsavel" value="{$campos.responsavel[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Endere&ccedil;o :</td>
		<td><input type="text" class="text_normal" name="endereco" value="{$campos.endereco[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">N&uacute;mero :</td>
		<td><input type="text" class="text_normal" name="numero" value="{$campos.numero[4]}" style="width:450px;" /></td>
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
		<td><input type="text" class="text_normal" name="cidade" value="{$campos.cidade[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">UF :</td>
		<td><input type="text" class="text_normal" name="uf" value="{$campos.uf[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Telefone Principal :</td>
		<td><input type="text" class="text_normal" name="tel_principal" value="{$campos.tel_principal[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Telefone Comercial :</td>
		<td><input type="text" class="text_normal" name="tel_comercial" value="{$campos.tel_comercial[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Telefone Financeiro :</td>
		<td><input type="text" class="text_normal" name="tel_financeiro" value="{$campos.tel_financeiro[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Telefone Suporte :</td>
		<td><input type="text" class="text_normal" name="tel_suporte" value="{$campos.tel_suporte[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Celular 1 :</td>
		<td><input type="text" class="text_normal" name="celular1" value="{$campos.celular1[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Celular 2 :</td>
		<td><input type="text" class="text_normal" name="celular2" value="{$campos.celular2[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Celular 3 :</td>
		<td><input type="text" class="text_normal" name="celular3" value="{$campos.celular3[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">FAX :</td>
		<td><input type="text" class="text_normal" name="fax" value="{$campos.fax[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">E-mail Principal :</td>
		<td><input type="text" class="text_normal" name="email_principal" value="{$campos.email_principal[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">E-mail Comercial :</td>
		<td><input type="text" class="text_normal" name="email_comercial" value="{$campos.email_comercial[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">E-mail Financeiro :</td>
		<td><input type="text" class="text_normal" name="email_financeiro" value="{$campos.email_financeiro[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">E-mail Suporte :</td>
		<td><input type="text" class="text_normal" name="email_suporte" value="{$campos.email_suporte[4]}" style="width:450px;" /></td>
	</tr>

	<tr>
		<td class="rotulos" valign="top">Observa&ccedil;&otilde;es :</td>
		<td><textarea class="text_normal" name="observacoes" style="width:450px; height:100px;" />{$campos.observacoes[4]}</textarea></td>
	</tr>

	<tr>
		<td>&nbsp;</td>
		<td align="center">
			{if $modo=="alt"}<input type="button" class="botao" value="Voltar" onClick="document.location='administradores.php'" />&nbsp;{/if}
		<input type="submit" class="botao" value="{$botao}" /></td>
	</tr>
</form>
</table>

{include file=$tpl_adm_rodape}