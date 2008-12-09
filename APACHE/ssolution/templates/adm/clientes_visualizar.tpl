<div id="visualizarBox_opcoes" style="position:absolute; right:10px; top:10px; background:#FFFFFF; border:1px solid black;"><a href="{$SCRIPT_NAME}?id={$campos.id[4]}&modo=alt"><img src="{$tpl_dir}/images/edit.png" alt="Alterar" border="0" width="16" height="16" hspace="2" vspace="2" /></a><img src="{$tpl_dir}/images/block.jpg" alt="Fechar" border="0" width="16" height="16" hspace="2" vspace="2" onmouseover="this.style.cursor='pointer';" onclick="$('#visualizarBox').hide('slow');" /></div>

<script>
{literal}

{/literal}
</script>

<table id="visualizarTbl" width="800" border="0" cellpadding="2" cellspacing="0">

	<tr bgcolor="{cycle values="#eeeeee,#d0d0d0"}">
		<td class="rotulos">C&oacute;digo :</td>
		<td>{$campos.codigo[4]}</td>
	</tr>
	
	{if $campos.tipo[4]=="Pessoa física"}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">Nome :</td>
		<td>{$campos.nome[4]}</td>
	</tr>
	
	{if $campos.nascimento[4] != "0000-00-00"}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">Nascimento :</td>
		<td>{$campos.nascimento[4]|date_format:"%d/%m/%Y"}</td>
	</tr>
	{/if}
	
	{if $campos.rg[4]!=""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">RG :</td>
		<td>{$campos.rg[4]}</td>
	</tr>
	{/if}
	
	{if $campos.cpf[4]!=""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">CPF :</td>
		<td>{$campos.cpf[4]}</td>
	</tr>
	{/if}
	
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">Sexo :</td>
		<td>{$campos.sexo[4]}</td>
	</tr>
	
	{else}
	
	{if $campos.razao_social[4] != ""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">Raz&atilde;o Social :</td>
		<td>{$campos.razao_social[4]}</td>
	</tr>
	{/if}
	
	{if $campos.nome_fantasia[4] != ""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">Nome Fantasia :</td>
		<td>{$campos.nome_fantasia[4]}</td>
	</tr>
	{/if}
	
	{if $campos.cnpj[4]!=""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">CNPJ :</td>
		<td>{$campos.cnpj[4]}</td>
	</tr>
	{/if}
	
	{if $campos.inscr_municipal[4] != ""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">Inscr. Municipal :</td>
		<td>{$campos.inscr_municipal[4]}</td>
	</tr>
	{/if}
	
	{if $campos.inscr_estadual[4] != ""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">Ins. Estadual :</td>
		<td>{$campos.inscr_estadual[4]}</td>
	</tr>
	{/if}
	
	{/if}
	
	{if $campos.endereco[4]!="" || $campos.numero[4]!=""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">Endere&ccedil;o :</td>
		<td>
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>{$campos.endereco[4]}</td>
					<td class="rotulos">N&ordm;:&nbsp;</td>
					<td>{$campos.numero[4]}</td>
				</tr>
			</table>
		</td>
	</tr>
	{/if}
	
	{if $campos.complemento_tipo[4]!="" || $campos.bloco[4]!=""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">Complemento :</td>
		<td>
			<table class="tblinterna" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="100" nowrap>{$campos.complemento_tipo[4]} - {$campos.complemento[4]}</td>
					<td class="rotulos">Bloco:&nbsp;</td>
					<td>{$campos.bloco[4]}</td>
				</tr>
			</table>
		</td>
	</tr>
	{/if}
	
	{if $campos.bairro[4] != ""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">Bairro :</td>
		<td>{$campos.bairro[4]}</td>
	</tr>
	{/if}
	
	{if $campos.cep[4] != ""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">CEP :</td>
		<td>{$campos.cep[4]}</td>
	</tr>
	{/if}
	
	{if $campos.cidade[4] != "" || $campos.uf[4]}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">Cidade :</td>
		<td>
			<table class="tblinterna" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="100" nowrap>{$campos.cidade[4]}</td>
					<td style="width:26px" class="rotulos">UF :&nbsp;</td>
					<td width="100" nowrap>{$campos.uf[4]}</td>
				</tr>
			</table>
		</td>
	</tr>
	{/if}

	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">Tel. Residencial :</td>
		<td>
			<table class="tblinterna" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="100" nowrap>{$campos.tel_residencial[4]}</td>
					<td class="rotulos" style="width:105px">Tel. Comercial :&nbsp;</td>
					<td width="100" nowrap>{$campos.tel_comercial[4]}</td>
					<td class="rotulos" style="width:45px">Fax :&nbsp;</td>
					<td width="100" nowrap>{$campos.fax[4]}</td>
				</tr>
			</table>
		</td>
	</tr>
	
	{if $campos.tel_celular1[4] != "" || $campos.tel_celular2[4] != ""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">Celular 1:</td>
		<td>
			<table class="tblinterna" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="100" nowrap>{$campos.tel_celular1[4]}</td>
					<td class="rotulos" style="width:73px;">Celular 2 :&nbsp;</td>
					<td width="100" nowrap>{$campos.tel_celular2[4]}</td>
				</tr>
			</table>
			
		</td>
	</tr>
	{/if}
	
	{if $campos.site[4] != ""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">Site:</td>
		<td>{$campos.site[4]}</td>
	</tr>
	{/if}
	
	{if $campos.email1[4] != ""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">E-mail 1:</td>
		<td>{$campos.email1[4]}</td>
	</tr>
	{/if}
	
	{if $campos.email2[4] != ""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">E-mail 2:</td>
		<td>{$campos.email2[4]}</td>
	</tr>
	{/if}
	
	{if $campos.email3[4] != ""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">E-mail 3:</td>
		<td>{$campos.email3[4]}</td>
	</tr>
	{/if}
    
    {if $campos.msn_messenger[4] != ""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">MSN Messenger:</td>
		<td>{$campos.msn_messenger[4]}</td>
	</tr>
	{/if}
    
    {if $campos.yahoo_messenger[4] != ""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">Yahoo Messenger:</td>
		<td>{$campos.yahoo_messenger[4]}</td>
	</tr>
	{/if}
    
    {if $campos.skype[4] != ""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos">Skype:</td>
		<td>{$campos.skype[4]}</td>
	</tr>
	{/if}
	
	{if $campos.observacoes[4] != ""}
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos" valign="top">Observa&ccedil;&otilde;es :</td>
		<td>{$campos.observacoes[4]|replace:"\n":"<br>"}</td>
	</tr>
	{/if}
	
	<tr bgcolor="{cycle values='#eeeeee,#d0d0d0'}">
		<td class="rotulos" valign="top">Data cadastro :</td>
		<td>{$campos.datacadastro[4]|date_format:"%d/%m/%Y %H:%M"}</td>
	</tr>

</table>