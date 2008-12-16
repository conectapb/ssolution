{include file=$tpl_adm_topo}
{*debug*}

<script language="javascript" src="{$tpl_dir}/js/jquery.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.maskedinput-1.1.2.pack.js"></script>

{literal}
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAUAecZaIhJ9pt2EiErpgo1BRoevPfaekpj5ExUy4Pkbymj8J2mhRS9iuKesMyF9Iaric0Lc-nHHpjQg" type="text/javascript"></script>

{/literal}
<script>
status_id = "{$campos.status_id[4]}";
tipo = "{$campos.tipo[4]}";
codigo_atual="{$campos.codigo[4]}";
grupo=grupo_atual="{$campos.grupo_id[4]}";
modo = "{$modo}";
{literal}
$(document).ready(function() {
	//GRUPOS
    $.post('clientes.php', 
		{ modo : "obtemGrupos" }, 
		function(resposta){
            //alert(resposta);
			$('#grupo_id').html(resposta).attr("value",grupo);
		}
	);

    $.post('clientes.php',
		{ modo : "obtemStatus" },
		function(resposta){
            //alert(resposta);
			$('#status_id').html(resposta).attr("value",status_id);
		}
	);

	// MASCARAS
	$("#cpf").mask("999.999.999-99");
	$("#cnpj").mask("99.999.999/9999-99");
	$("#nascimento").mask("99/99/9999");
	
	
	$(".field_pj").hide();
	$(".field_pf").hide();
	if(tipo=="Pessoa física" || tipo=="")
	{
		$(".field_pf").toggle();
		$("#tipo_pf").attr("checked","true");
	}
	else
	{
		$(".field_pj").toggle();
		$("#tipo_pj").attr("checked","true");
	}
	
	$("#tipo_pf").click(function() {
		$(".field_pf").show();
		$(".field_pj").hide();
	});
	$("#tipo_pj").click(function() {
		$(".field_pj").show();
		$(".field_pf").hide();
	});

    //$("#map_frame").hide();

    if(modo=="alt")
        {
            $('#atualizaAddress').show().click(
                function(){
                    chgAddress($('#grupo_id').val());
                }
            );
            load($('#endereco').val() + "," + $('#numero').val() + "," + $('#cidade').val() + "," + $('#uf').val());

        }
        else
        {
             $('#atualizaAddress').hide();
             $('#grupo_id').change(
                function(){
                     chgAddress($('#grupo_id').val());
                }
             );
        }

});

function chgAddress(grupoID) {
	a=document.frm;
	
	if(grupoID!="")
	{
		$.post('clientes.php', 
			{ modo : "obtemUmGrupo" , grpID: grupoID }, 
			function(resposta){
				var tmp = resposta.split("#");
				a.endereco.value=tmp[0];
				a.numero.value=tmp[1];
				a.bairro.value=tmp[2];
				a.cep.value=tmp[3];
				a.cidade.value=tmp[4];
				a.uf.value=tmp[5];
				if(grupoID!=grupo_atual)
					a.codigo.value=tmp[6];
				else
					a.codigo.value=codigo_atual;
				//$('#grupo_id').html(resposta);
			}
		);
	}
	else
	{
		a.endereco.value="";
		a.numero.value="";
		a.bairro.value="";
		a.cep.value="";
		a.cidade.value="";
		a.uf.value="";
		a.codigo.value="";
	}
}

function load(address) {
    alert(address);
    if (GBrowserIsCompatible()) {
        var map = new GMap2(document.getElementById("map"));
        var geocoder = new GClientGeocoder();

        geocoder.getLatLng(
            address,
            function(point) {
                if (!point) {
                    alert("argh!");
                }
                else {
                    alert("yay!");
                    $('#map_frame').show();
                    map.setCenter(point, 15);
                    var marker = new GMarker(point);
                    map.addOverlay(marker);
                    marker.openInfoWindowHtml(address);
                }
            }
        );
    }
}
</script>
{/literal}
<br />

<table border="0" cellpadding="2" cellspacing="0" border="0">
	<form name="frm" action="{$SCRIPT_NAME}" method="post">
	<input type="hidden" name="processa" value="ok" />
	<input type="hidden" name="modo" value="{$modo}" />
	<input type="hidden" name="id" value="{$campos.id[4]}" />
	<input type="hidden" name="gru" value="{$gru}" />

    <tr>
		<td class="rotulos">Status :</td>
		<td>
			<select name="status_id" id="status_id" class="text_normal"></select>
		</td>
	</tr>

	<tr>
		<td class="rotulos">Grupo :</td>
		<td>
			<select name="grupo_id" id="grupo_id" class="text_normal"></select>
            <input type="button" name="atualizaAddress" id="atualizaAddress" value="Atualizar endereço">
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">C&oacute;digo :</td>
		<td><input type="text" class="text_normal" name="codigo" value="{$campos.codigo[4]}" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Tipo :</td>
		<td>
			<input type="radio" name="tipo" id="tipo_pf" class="radio_normal" value="1" /><label for="tipo_pf">Pessoa f&iacute;sica</label>
			&nbsp;
			<input type="radio" name="tipo" id="tipo_pj" class="radio_normal" value="2" /><label for="tipo_pj">Pessoa jur&iacute;dica</label>
		</td>
	</tr>
	
	<tr class="field_pf">
		<td class="rotulos">Nome :</td>
		<td><input type="text" class="text_normal" name="nome" id="nome" value="{$campos.nome[4]}" /></td>
	</tr>
	
	<tr class="field_pf">
		<td class="rotulos">Nascimento :</td>
		<td><input type="text" class="text_medio" name="nascimento" id="nascimento" value="{if $campos.nascimento[4] != "0000-00-00"}{$campos.nascimento[4]|date_format:"%d/%m/%Y"}{/if}" /></td>
	</tr>
	
	<tr class="field_pf">
		<td class="rotulos">RG :</td>
		<td><input type="text" class="text_medio" name="rg" id="rg" value="{$campos.rg[4]}" /></td>
	</tr>
	
	<tr class="field_pf">
		<td class="rotulos">CPF :</td>
		<td><input type="text" class="text_medio" name="cpf" id="cpf" value="{$campos.cpf[4]}" /></td>
	</tr>
	
	<tr class="field_pf">
		<td class="rotulos">Sexo :</td>
		<td>
			<input type="radio" name="sexo" id="Masculino" class="radio_normal" value="1" />
			<label for="Masculino">M</label>
			<input type="radio" name="sexo" id="Feminino" class="radio_normal" value="2" />
			<label for="Feminino">F</label>
		</td>
	</tr>
	
	<tr class="field_pj">
		<td class="rotulos">Raz&atilde;o Social :</td>
		<td><input type="text" class="text_normal" name="razao_social" id="razao_social" value="{$campos.razao_social[4]}" /></td>
	</tr>
	
	<tr class="field_pj">
		<td class="rotulos">Nome Fantasia :</td>
		<td><input type="text" class="text_normal" name="nome_fantasia" id="nome_fantasia" value="{$campos.nome_fantasia[4]}" /></td>
	</tr>
	
	<tr class="field_pj">
		<td class="rotulos">CNPJ :</td>
		<td><input type="text" class="text_medio" name="cnpj" id="cnpj" value="{$campos.cnpj[4]}" /></td>
	</tr>
	
	<tr class="field_pj">
		<td class="rotulos">Inscr. Municipal :</td>
		<td><input type="text" class="text_medio" name="inscr_municipal" id="inscr_municipal" value="{$campos.inscr_municipal[4]}" /></td>
	</tr>
	
	<tr class="field_pj">
		<td class="rotulos">Ins. Estadual :</td>
		<td><input type="text" class="text_medio" name="inscr_estadual" id="inscr_estadual" value="{$campos.inscr_estadual[4]}" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Endere&ccedil;o :</td>
		<td>
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>
					<input type="text" class="text_normal" name="endereco" id="endereco" value="{$campos.endereco[4]}" style="width:363px;" />
					</td>
					<td class="rotulos" style="width:33px">N&ordm;:&nbsp;</td>
					<td>
					<input type="text" class="text_pequeno" name="numero" id="numero" value="{$campos.numero[4]}" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Complemento :</td>
		<td>
		<input type="radio" name="complemento_tipo" id="complemento_tipo_Ap" class="radio_normal" value="Ap." /><label for="complemento_tipo_Ap">Ap.</label>
		<input type="radio" name="complemento_tipo" id="complemento_tipo_Cj" class="radio_normal" value="Cj." /><label for="complemento_tipo_Cj">Cj.</label>
		<input type="radio" name="complemento_tipo" id="complemento_tipo_Sl" class="radio_normal" value="Sl." /><label for="complemento_tipo_Sl">Sl.</label>
		<input type="radio" name="complemento_tipo" id="complemento_tipo_Lj" class="radio_normal" value="Lj." /><label for="complemento_tipo_Lj">Lj.</label>
		<input type="text" class="text_normal" name="complemento" value="{$campos.complemento[4]}" style="width:110px;" />
		<label for="bloco" class="rotulos">
		Bloco&nbsp;:&nbsp;</label><input type="text" class="text_normal" name="bloco" value="{$campos.bloco[4]}" style="width:106px;" />
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Bairro :</td>
		<td><input type="text" class="text_normal" name="bairro" id="bairro" value="{$campos.bairro[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">CEP :</td>
		<td><input type="text" class="text_normal" name="cep" id="cep" value="{$campos.cep[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Cidade :</td>
		<td>
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td><input type="text" class="text_normal" name="cidade" id="cidade" value="{$campos.cidade[4]}" style="width:363px;" /></td>
					{if $campos.uf[4]!=""}{assign var="sel_estado" value=$campos.uf[4]}{else}{assign var="sel_estado" value="PR"}{/if}
					<td>&nbsp;&nbsp;&nbsp;<span class="rotulos">UF :</span>&nbsp;</td>
					<td>
						<select class="text_pequeno" name="uf" id="uf">
						{html_options values=$estados selected=$sel_estado output=$estados}
						</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>

    <tr id="map_frame">
        <td>&nbsp;</td>
        <td><div id="" style="width:455px;height:300px"></div></td>
    </tr>

	<tr>
		<td class="rotulos">Tel. Residencial :</td>
		<td>
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td><input type="text" class="text_normal" name="tel_residencial" id="tel_residencial" value="{$campos.tel_residencial[4]}" style="width:97px;" /></td>
					<td class="rotulos" style="width:104px">Tel. Comercial :&nbsp;</td>
					<td><input type="text" class="text_normal" name="tel_comercial" id="tel_comercial" value="{$campos.tel_comercial[4]}" style="width:97px;" /></td>
					<td class="rotulos" style="width:40px">Fax :&nbsp;</td>
					<td><input type="text" class="text_normal" name="fax" id="fax" value="{$campos.fax[4]}" style="width:97px;" /></td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Celular 1:</td>
		<td>
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td><input type="text" class="text_normal" name="tel_celular1" id="tel_celular1" value="{$campos.tel_celular1[4]}" style="width:187px;" /></td>
					<td class="rotulos" style="width:70px;">Celular 2 :&nbsp;</td>
					<td><input type="text" class="text_normal" name="tel_celular2" id="tel_celular2" value="{$campos.tel_celular2[4]}" style="width:186px;" /></td>
				</tr>
			</table>
			
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Site:</td>
		<td><input type="text" class="text_normal" name="site" id="site" value="{$campos.site[4]}" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">E-mail 1:</td>
		<td><input type="text" class="text_normal" name="email1" id="email1" value="{$campos.email1[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">E-mail 2:</td>
		<td><input type="text" class="text_normal" name="email2" id="email2" value="{$campos.email2[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">E-mail 3:</td>
		<td><input type="text" class="text_normal" name="email3" id="email3" value="{$campos.email3[4]}" style="width:450px;" /></td>
	</tr>
    
    <tr>
		<td class="rotulos">MSN Messenger:</td>
		<td><input type="text" class="text_normal" name="msn_messenger" id="msn_messenger" value="{$campos.msn_messenger[4]}" style="width:450px;" /></td>
	</tr>
    
    <tr>
		<td class="rotulos">Yahoo Messenger:</td>
		<td><input type="text" class="text_normal" name="yahoo_messenger" id="yahoo_messenger" value="{$campos.yahoo_messenger[4]}" style="width:450px;" /></td>
	</tr>
    
    <tr>
		<td class="rotulos">Skype:</td>
		<td><input type="text" class="text_normal" name="skype" id="skype" value="{$campos.skype[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">Observa&ccedil;&otilde;es :</td>
		<td><textarea class="text_normal" name="observacoes" id="observacoes" />{$campos.observacoes[4]}</textarea></td>
	</tr>

	<tr>
		<td>&nbsp;</td>
		<td align="center">
			{if $modo=="alt"}<input type="button" class="botao_normal" value="Voltar" onClick="document.location='clientes.php'" />&nbsp;{/if}
		<input type="submit" class="botao_normal" value="{$botao}" /></td>
	</tr>
</form>
</table>

<script>
if("{$campos.sexo[4]}"!="")
	document.getElementById("{$campos.sexo[4]}").checked=true;
	
if("{$campos.complemento_tipo[4]}"=="Ap.")
	document.getElementById("complemento_tipo_Ap").checked=true;
if("{$campos.complemento_tipo[4]}"=="Cj.")
	document.getElementById("complemento_tipo_Cj").checked=true;
if("{$campos.complemento_tipo[4]}"=="Sl.")
	document.getElementById("complemento_tipo_Sl").checked=true;
if("{$campos.complemento_tipo[4]}"=="Lj.")
	document.getElementById("complemento_tipo_Lj").checked=true;

</script>

{include file=$tpl_adm_rodape}
