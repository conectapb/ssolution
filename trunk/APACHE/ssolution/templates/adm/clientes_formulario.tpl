{include file=$tpl_adm_topo}
{*debug*}

<script language="javascript" src="{$tpl_dir}/js/jquery.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.maskedinput-1.1.2.pack.js"></script>
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key={$gmaps_key}" type="text/javascript"></script>

<script>
status_id = "{$campos.status_id[4]}";
tipo = "{$campos.tipo[4]}";
codigo_atual="{$campos.codigo[4]}";
grupo=grupo_atual="{$campos.grupo_id[4]}";
modo = "{$modo}";
{literal}
$(document).ready(function() {

    $('#mapTd').hide();
    $('#toggleMapDisplay').click(function(){

        if($('#toggleMapDisplay').css('display')=="none")
            $('#toggleMapDisplay').attr('value','Ocultar');
        else
            $('#toggleMapDisplay').attr('value','Visualizar');
        
        $('#mapTd').toggle();
    });
    
    $.post('clientes.php', 
		{ modo : "obtemGrupos" }, 
		function(resposta){
			$('#grupo_id').html(resposta).attr("value",grupo);
		}
	);

    $.post('clientes.php',
		{ modo : "obtemStatus" },
		function(resposta){
			$('#status_id').html(resposta).attr("value",status_id);
		}
	);

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
    
    $("#updateMapDisplay").click(function() {
		mapAddress($('#endereco').val(),$('#numero').val(),$('#cidade').val(),$('#uf').val());
	});

    if(modo=="alt")
    {
        $('#atualizaAddress').show().click(
            function(){
                chgAddress($('#grupo_id').val());
            }
        );
        mapAddress($('#endereco').val(),$('#numero').val(),$('#cidade').val(),$('#uf').val());
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
    
    var map;
    var mapControl;
    load();

    $('#updateCep').click(function(){
        consultaCep($('#cep').val() , findPosY(this) );
    });

    $('#complemento_tipo_Lj').click(function(){if(this.checked)this.checked=false;});

 });

    function chgAddress(grupoID)
    {
        
        if(grupoID!="")
        {
            //alert(grupoID);
            $.post('clientes.php',
                { modo : "obtemUmGrupo" , grpID: grupoID },
                function(resposta){
                    var tmp = resposta.split("#");
                    $('#endereco').val(tmp[0]);
                    $('#numero').val(tmp[1]);
                    $('#bairro').val(tmp[2]);
                    $('#cep').val(tmp[3]);
                    $('#cidade').val(tmp[4]);
                    $('#uf').val(tmp[5]);
                    if(grupoID!=grupo_atual)
                        $('#codigo').val(tmp[6]);
                    else
                        $('#codigo').val(codigo_atual);
                    
                    //mapAddress($('#endereco').val(),$('#numero').val(),$('#cidade').val(),$('#uf').val());
                }
            );
        }
        else
        {
            $('#endereco').val("");
            $('#numero').val("");
            $('#bairro').val("");
            $('#cep').val("");
            $('#cidade').val("");
            $('#uf').val("");
            $('#codigo').val("");
        }
    }

    function load() {
      if (GBrowserIsCompatible()) {
        map = new GMap2(document.getElementById("map"));
        mapControl = new GMapTypeControl();
        map.addControl(mapControl);
        map.addControl(new GSmallMapControl());
      }
    }

    function mapAddress(endereco,numero,cidade,uf)
    {
        var geocoder = new GClientGeocoder();
        var address = endereco + "," + numero + "," + cidade + "," + uf;
        //alert(address);
        geocoder.getLatLng(
            address,
            function(point) {
                if (!point) {
                    $('#mapTd').hide();
                } else {
                    map.setCenter(point, 15);
                    var marker = new GMarker(point);
                    map.addOverlay(marker);
                    marker.openInfoWindowHtml(address);
                }
            }
        );
    }
    
    function consultaCep(cep,posY)
    {

        //alert('consultaCep#' + cep + "#" + posY);
        $.post('clientes.php',
            { modo : "consultaCep" , str_cep : cep },
        	function(resposta){
                //alert(resposta);
                var tmp = resposta.split("#");
                /*$('#endereco').val(tmp[0] + " " + tmp[1]);
                $('#bairro').val(tmp[2]);
                $('#cidade').val(tmp[3]);
                $('#uf').val(tmp[4]);*/

                $("#visualizarBox").hide("slow");
                $("#visualizarBox").html(resposta);
                $("#visualizarBox").css("top", self.pageYOffset+10);
                $("#visualizarBox").show("slow");
                //alert(resposta);
            }
        );
    }

    function visualizar($id,$posY)
    {
        if($id == parseInt($id))
        {
            $.post('clientes.php',
                {
                modo : "vis",
                id : $id },
                function(resposta){
                   $("#visualizarBox").hide("slow");
                   $("#visualizarBox").html(resposta);
                   $("#visualizarBox").css("top", self.pageYOffset+10);
                   $("#visualizarBox").show("slow");
               }
            );
        }
        else
        {
            alert("visualizar: id NaN!")
        }
    }

    function findPosY(obj) {
        var curleft = curtop = 0;
        if (obj.offsetParent) {
            do {
                curleft += obj.offsetLeft;
                curtop += obj.offsetTop;
            } while (obj = obj.offsetParent);
            //return [curleft,curtop];
            return curtop;
        }
    }

    function check(button) {
     if (button.checked)
     button.checked=false
    }
</script>
{/literal}

<br />

<div id="visualizarBox" style="position:absolute; top:10px; left:10px; border:1px solid black; background:#FFFFFF"></div>

<table border="0" cellpadding="2" cellspacing="0" border="0">
	<form name="frm" action="{$SCRIPT_NAME}" method="post">
	<input type="hidden" name="processa" id="processa" value="ok" />
	<input type="hidden" name="modo" id="modo" value="{$modo}" />
	<input type="hidden" name="id" id="id" value="{$campos.id[4]}" />
	<input type="hidden" name="gru" id="gru" value="{$gru}" />

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
		<td class="rotulos">Código :</td>
		<td><input type="text" class="text_normal" id="codigo" name="codigo" value="{$campos.codigo[4]}" /></td>
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
        <input type="radio" name="complemento_tipo" id="complemento_tipo_Casa" class="radio_normal" value="CASA" /><label for="complemento_tipo_Casa">CASA</label>
		<input type="radio" name="complemento_tipo" id="complemento_tipo_Ap" class="radio_normal" value="AP." /><label for="complemento_tipo_Ap">AP.</label>
		<input type="radio" name="complemento_tipo" id="complemento_tipo_Cj" class="radio_normal" value="CJ." /><label for="complemento_tipo_Cj">CJ.</label>
		<input type="radio" name="complemento_tipo" id="complemento_tipo_Sl" class="radio_normal" value="SL." /><label for="complemento_tipo_Sl">SL.</label>
		<input type="radio" name="complemento_tipo" id="complemento_tipo_Lj" class="radio_normal" value="LJ." /><label for="complemento_tipo_Lj">LJ.</label>
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
		<td>
            <input type="text" class="text_normal" name="cep" id="cep" value="{$campos.cep[4]}" style="width:450px;" />
            <input type="button" id="updateCep" value="Consultar">
            </td>
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
                    <td>
                        <input type="button" id="toggleMapDisplay" name="toggleMapDisplay" value="Visualizar">
                    </td>
				</tr>
			</table>
		</td>
	</tr>

    <tr id="mapTd">
        <td>
            &nbsp;
        </td>
        <td>
            <table>
                <tr>
                    <td>
                        <div id="map" style="width:456px;height:300px"></div>
                    </td>
                    <td valign="top">
                        <input type="button" id="updateMapDisplay" name="updateMapDisplay" value="Atualiza">
                    </td>
                </tr>
            </table>
            
        </td>
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
		<td>
                <textarea class="text_normal" name="observacoes" id="observacoes" />{$campos.observacoes[4]}</textarea>
        </td>
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

if("{$campos.complemento_tipo[4]}"=="Casa" || "{$campos.complemento_tipo[4]}"=="CASA")
	document.getElementById("complemento_tipo_Casa").checked=true;
else if("{$campos.complemento_tipo[4]}"=="Ap." || "{$campos.complemento_tipo[4]}"=="AP.")
	document.getElementById("complemento_tipo_Ap").checked=true;
else if("{$campos.complemento_tipo[4]}"=="Cj." || "{$campos.complemento_tipo[4]}"=="CJ.")
	document.getElementById("complemento_tipo_Cj").checked=true;
else if("{$campos.complemento_tipo[4]}"=="Sl." || "{$campos.complemento_tipo[4]}"=="SL.")
	document.getElementById("complemento_tipo_Sl").checked=true;
else if("{$campos.complemento_tipo[4]}"=="Lj." || "{$campos.complemento_tipo[4]}"=="LJ.")
	document.getElementById("complemento_tipo_Lj").checked=true;

</script>

{include file=$tpl_adm_rodape}
