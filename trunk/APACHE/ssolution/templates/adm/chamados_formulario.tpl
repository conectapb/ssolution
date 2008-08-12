{include file=$tpl_adm_topo}
{*debug*}
<script language="javascript" src="{$tpl_dir}/js/jquery-1.2.2.pack.js"></script>
{literal}
<script>
$(document).ready(function() 
    { 
        //$("#dadosCliente").css("display" , "none");
	}
);
function mostraDetalhesCliente(){
	if($("#dadosCliente").css("display")=="none")
	{
		$("#dadosCliente").css("display" , "block");
		$("#detalhes_container").html("Ocultar detalhes do cliente");
	}
	else
	{
		$("#dadosCliente").css("display" , "none");
		$("#detalhes_container").html("Mostrar detalhes do cliente");
	}
}
var modo = "{$modo}";
function chgCliente(cliID) {
	a=document.frm;
	if(cliID == parseInt(cliID))
	{
		a.cli_endereco.value=cliente[cliID][0];
		a.cli_numero.value=cliente[cliID][1];
		a.cli_bairro.value=cliente[cliID][2];
		a.cli_cep.value=cliente[cliID][3];
		a.cli_cidade.value=cliente[cliID][4];
		document.getElementById("uf_container").innerHTML=cliente[cliID][5];
		a.cli_codigo.value=cliente[cliID][6];
		a.cli_nome.value=cliente[cliID][7];
		if (cliente[cliID][8]!="0000-00-00 00:00:00")
			a.cli_nascimento.value=cliente[cliID][8];
		a.cli_rg.value=cliente[cliID][9];
		a.cli_cpf.value=cliente[cliID][10];
		document.getElementById("sexo_container").innerHTML=cliente[cliID][11];
		a.cli_complemento.value=cliente[cliID][13];
		a.cli_tel_residencial.value=cliente[cliID][14];
		a.cli_tel_comercial.value=cliente[cliID][15];
		a.cli_fax.value=cliente[cliID][16];
		a.cli_tel_celular1.value=cliente[cliID][17];
		a.cli_tel_celular2.value=cliente[cliID][18];
		a.cli_email1.value=cliente[cliID][19];
		a.cli_email2.value=cliente[cliID][20];
		a.cli_email3.value=cliente[cliID][21];
		a.cli_observacoes.value=cliente[cliID][22];
	}
	else
	{
		a.cli_endereco.value="";
		a.cli_numero.value="";
		a.cli_bairro.value="";
		a.cli_cep.value="";
		a.cli_cidade.value="";
		document.getElementById("uf_container").innerHTML="";
		a.cli_codigo.value="";
		a.cli_nome.value="";
		a.cli_nascimento.value="";
		a.cli_rg.value="";
		a.cli_cpf.value="";
		document.getElementById("sexo_container").innerHTML="";
		a.cli_complemento.value="";
		a.cli_tel_residencial.value="";
		a.cli_tel_comercial.value="";
		a.cli_fax.value="";
		a.cli_tel_celular1.value="";
		a.cli_tel_celular2.value="";
		a.cli_email1.value="";
		a.cli_email2.value="";
		a.cli_email3.value="";
		a.cli_observacoes.value="";
	}
}
</script>
{/literal}
<br />

<table width="100%" border="0" cellpadding="2" cellspacing="0" border="0">
	<form name="frm" action="{$SCRIPT_NAME}" method="post" enctype="multipart/form-data">
	<input type="hidden" name="processa" value="ok" />
	<input type="hidden" name="modo" value="{$modo}" />
	<input type="hidden" name="id" value="{$campos.id[4]}" />
	
	<tr>
		<td class="rotulos">Clientes :</td>
		<td>
			<script>var cliente=new Array();</script>
			<select name="cliente_id" class="text_normal" style="width:450px;" onchange="chgCliente(this.value);" />
				<option value=""></option>
			{foreach from=$clientes item=cliente}
				{assign var="grupo_id_atual" value=$cliente.grupo_id}
				{if $grupo_id_atual != $grupo_id_anterior}
				</optgroup>
				<optgroup label="{$cliente.grupo_codigo} - {$cliente.grupo_nome}">
				{/if}
				<option value="{$cliente.id}">{$cliente.codigo} - {$cliente.nome}</option>
				
				<script>
					cliente[{$cliente.id}] = new Array();
					cliente[{$cliente.id}][0] = "{$cliente.endereco}";
					cliente[{$cliente.id}][1] = "{$cliente.numero}";
					cliente[{$cliente.id}][2] = "{$cliente.bairro}";
					cliente[{$cliente.id}][3] = "{$cliente.cep}";
					cliente[{$cliente.id}][4] = "{$cliente.cidade}";
					cliente[{$cliente.id}][5] = "{$cliente.uf}";
					cliente[{$cliente.id}][6] = "{$cliente.codigo}";
					cliente[{$cliente.id}][7] = "{$cliente.nome}";
					cliente[{$cliente.id}][8] = "{$cliente.nascimento}";
					cliente[{$cliente.id}][9] = "{$cliente.rg}";
					cliente[{$cliente.id}][10] = "{$cliente.cpf}";
					cliente[{$cliente.id}][11] = "{$cliente.sexo}";
					cliente[{$cliente.id}][12] = "{$cliente.grupo}";
					cliente[{$cliente.id}][13] = "{$cliente.complemento}";
					cliente[{$cliente.id}][14] = "{$cliente.tel_residencial}";
					cliente[{$cliente.id}][15] = "{$cliente.tel_comercial}";
					cliente[{$cliente.id}][16] = "{$cliente.fax}";
					cliente[{$cliente.id}][17] = "{$cliente.tel_celular1}";
					cliente[{$cliente.id}][18] = "{$cliente.tel_celular2}";
					cliente[{$cliente.id}][19] = "{$cliente.email1}";
					cliente[{$cliente.id}][20] = "{$cliente.email2}";
					cliente[{$cliente.id}][21] = "{$cliente.email3}";
					cliente[{$cliente.id}][22] = "{$cliente.observacoes|replace:"\r\n":"<br>"}";
				</script>
				{assign var="grupo_id_anterior" value=$cliente.grupo_id}
			{/foreach}
			</select>
			<script>document.frm.cliente_id.value="{$campos.cliente_id[4]}";</script>
			<br /><small><a href="#" onclick="javascript: mostraDetalhesCliente();"><span id="detalhes_container">Mostrar detalhes do cliente</span></a></small>
			</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<table id="dadosCliente" style="display:none;">
				<tr>
					<td class="rotulos">Codigo :</td>
					<td><input readonly type="text" class="text_normal" name="cli_codigo" value="" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos">Nome :</td>
					<td><input readonly type="text" class="text_normal" name="cli_nome" value="" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos">Nascimento :</td>
					<td><input readonly type="text" class="text_normal" name="cli_nascimento" value="" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos">RG :</td>
					<td><input readonly type="text" class="text_normal" name="cli_rg" value="" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos">CPF :</td>
					<td><input readonly type="text" class="text_normal" name="cli_cpf" value="" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos">Sexo :</td>
					<td><span id=sexo_container></span></td>
				</tr>
				
				<tr>
					<td class="rotulos">Endere&ccedil;o :</td>
					<td>
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td><input readonly type="text" class="text_normal" name="cli_endereco" value="" style="width:363px;" /></td>
								<td class="rotulos" style="width:33px">N&ordm;:&nbsp;</td>
								<td><input readonly type="text" class="text_normal" name="cli_numero" value="" style="width:50px;" /></td>
							</tr>
						</table>
					</td>
				</tr>
				
				<tr>
					<td class="rotulos">Complemento :</td>
					<td><input readonly type="text" class="text_normal" name="cli_complemento" value="" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos">Bairro :</td>
					<td><input readonly type="text" class="text_normal" name="cli_bairro" value="" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos">CEP :</td>
					<td><input readonly type="text" class="text_normal" name="cli_cep" value="" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos">Cidade :</td>
					<td>
						<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td><input readonly type="text" class="text_normal" name="cli_cidade" value="" style="width:363px;" /></td>
								<td style="width:26px" class="rotulos">UF :&nbsp;</td>
								<td><span id="uf_container"></span></td>
							</tr>
						</table>
					</td>
				</tr>
			
				<tr>
					<td class="rotulos">Tel. Residencial :</td>
					<td>
						<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td><input readonly type="text" class="text_normal" name="cli_tel_residencial" value="" style="width:97px;" /></td>
								<td class="rotulos" style="width:105px">Tel. Comercial :&nbsp;</td>
								<td><input readonly type="text" class="text_normal" name="cli_tel_comercial" value="" style="width:97px;" /></td>
								<td class="rotulos" style="width:45px">Fax :&nbsp;</td>
								<td><input readonly type="text" class="text_normal" name="cli_fax" value="" style="width:97px;" /></td>
							</tr>
						</table>
					</td>
				</tr>
				
				<tr>
					<td class="rotulos">Celular 1:</td>
					<td>
						<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td><input readonly type="text" class="text_normal" name="cli_tel_celular1" value="{$campos.tel_celular1[4]}" style="width:187px;" /></td>
								<td class="rotulos" style="width:73px;">Celular 2 :&nbsp;</td>
								<td><input readonly type="text" class="text_normal" name="cli_tel_celular2" value="{$campos.tel_celular2[4]}" style="width:186px;" /></td>
							</tr>
						</table>
					</td>
				</tr>
				
				<tr>
					<td class="rotulos">E-mail 1:</td>
					<td><input readonly type="text" class="text_normal" name="cli_email1" value="{$campos.email1[4]}" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos">E-mail 2:</td>
					<td><input readonly type="text" class="text_normal" name="cli_email2" value="{$campos.email2[4]}" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos">E-mail 3:</td>
					<td><input readonly type="text" class="text_normal" name="cli_email3" value="{$campos.email3[4]}" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos" valign="top">Observa&ccedil;&otilde;es :</td>
					<td><textarea readonly class="text_normal" name="cli_observacoes" style="width:450px; height:100px;" /></textarea></td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Atendente :</td>
		<td>
		<select name="admin_id" class="text_normal" style="width:450px;" />
		<option value=""></option>
		{foreach from=$admins item=admin}
			<option value="{$admin.id}">{$admin.nome}</option>
		{/foreach}
		</select>
		<script>document.frm.admin_id.value="{$campos.admin_id[4]}";</script>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Tipo de chamado :</td>
		<td>
		<select name="tipo_id" class="text_normal" style="width:450px;" />
		<option value=""></option>
		{foreach from=$tipos item=tipo}
			<option value="{$tipo.id}">{$tipo.nome}</option>
		{/foreach}
		</select>
		<script>document.frm.tipo_id.value="{$campos.tipo_id[4]}";</script>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">Problema :</td>
		<td><textarea class="text_normal" name="problema" style="width:450px; height:100px;" />{$campos.problema[4]}</textarea></td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">Solu&ccedil;&atilde;o :</td>
		<td><textarea class="text_normal" name="solucao" style="width:450px; height:100px;" />{$campos.solucao[4]}</textarea></td>
	</tr>
	
	<tr>
		<td class="rotulos">Status :</td>
		<td>
			<select name="status_id" class="text_normal" style="width:450px;" />
				<option value=""></option>
				{foreach from=$chamados_status item=status}
					<option value="{$status.id}">{$status.nome}</option>
				{/foreach}
			</select>
			<script>document.frm.status_id.value="{$campos.status_id[4]}";</script>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Data abertura :</td>
		<td><input type="text" class="text_normal" name="data_abertura" value="{$campos.data_abertura[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Data fechamento :</td>
		<td><input type="text" class="text_normal" name="data_fechamento" value="{$campos.data_fechamento[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">Observa&ccedil;&otilde;es :</td>
		<td><textarea class="text_normal" name="observacoes" style="width:450px; height:100px;" />{$campos.observacoes[4]}</textarea></td>
	</tr>
	
	<tr>
		<td>&nbsp;</td>
		<td align="center">
			{if $modo=="alt"}<input type="button" class="botao" value="Voltar" onClick="document.location='{$SCRIPT_NAME}'" />&nbsp;{/if}
			<input type="submit" class="botao" value="{$botao}" />
		</td>
	</tr>
	
</form>
</table>

<script>
if("{$campos.id[4]}"!="") chgCliente({$campos.id[4]});
</script>

{include file=$tpl_adm_rodape}
