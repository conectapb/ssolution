{include file=$tpl_adm_topo}
{debug}

<script language="javascript" src="{$tpl_dir}/js/scw.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.form.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.field.js"></script>

<script>

var campos = new Array();
var inc_ano = 0;
var ultimo_codigo="{$ultimo_codigo}";
var modo="{$modo}";
var cliente_id = "{$campos.cliente_id[4]}";
var contrato_id = "{$campos.contrato_id[4]}";

{literal}

String.prototype.pad = function(l, s, t){
	return s || (s = " "), (l -= this.length) > 0 ? (s = new Array(Math.ceil(l / s.length)
		+ 1).join(s)).substr(0, t = !t ? l : t == 1 ? 0 : Math.ceil(l / 2))
		+ this + s.substr(0, l - t) : this;
};

/*
exemplo do pad
var s = "Jonas";
alert(s.pad(20, "[]", 0));
alert(s.pad(20, "[====]", 1));
alert(s.pad(20, "~", 2));
*/

$().ready(function() {
	$("select[@name=cliente_id]").change(function(){
		mudaCliente($(this).val());
	})
	.click(function(){
		$("#cliente_id_label").css("color","#000000");
		$(this).css("border-color","#000000");
		$(this).css("color","#000000");
	});
	
	$("#contrato_id")
		.change(
			function(){
				chgContrato($(this).val());
			}
		)
		.click(
			function(){
				$("#contrato_id_label").css("color","#000000");
				$(this).css("border-color","#000000");
				$(this).css("color","#000000");
			}
		)
	;
	
	$("#referencia_ano").change(function(){
		ChgAno($(this).val());
	});
	
	$("#referencia_mes").change(function(){
		ChgMes($(this).val());
	});
	
	$('#formulario').submit(
		function() {
			return validate();
		}
	);
	
	/*$('#formulario').ajaxForm(
		{
			//target: '#erro',
			//resetForm: true,
			beforeSubmit: validate,
			success: showResponse
			
		}
	);*/
	
	$("#ultcod").click(function(){$("#codigo").setValue(parseInt(ultimo_codigo)+1);});
	if(modo=="alt")
	{
		$("#ultcod").hide();
		$("#codigo").attr("readonly","true");
	}
	$("#submeter").click(function(){ajustarCamposOcultos();});
	
	if(modo=="alt")
	{
{/literal}
		$("#cliente_id").setValue(cliente_id);
		mudaCliente(cliente_id,contrato_id);
		//$("#contrato_id").val(contrato_id);
{literal}
	}
});

function mudaCliente(cliente,contrato)
{
	$('select[@name=contrato_id]').html('<option value="sda">Procurando :::::::</option>');
	$.post('cobrancas.php', 
		{ 
		modo : "obtemContratos",
		cliID : cliente }, 
		function(resposta){
			$('select[@name=contrato_id]').html(resposta);
			$("#vencimento_padrao").html("");
			$("#valor").val("");
			chgContrato(contrato);
		}
	);
}

function chgContrato(ctrID)
{
	$.post('cobrancas.php', 
		{ 
		modo : "obtemUmContrato",
		ctrID : ctrID }, 
		function(resposta){
			if(resposta!="")
			{
				$("#contrato_id").val(ctrID);
				campos=resposta.split("#");
				$("#valor_padrao").html(campos[0]);
				$("#vencimento_padrao").html(campos[1]);
				$("#periodo_padrao").html(campos[2]);
				{/literal}
				{if $modo=="cad"}
				$("#periodo_inicio_dia").val(campos[3]);
				$("#periodo_fim_dia").val(campos[4]);
				$("#vencimento_dia").val(campos[1]);
				$("#valor").val(campos[0]);
				{else}
				var periodo_inicio = new Array();
				periodo_inicio = "{$campos.periodo_inicio[4]}".split("/");
				$("#periodo_inicio_dia").val(periodo_inicio[0]);
				$("#periodo_inicio_mes").val(periodo_inicio[1]);
				$("#periodo_inicio_ano").val(periodo_inicio[2]);
				var periodo_fim = new Array();
				periodo_fim = "{$campos.periodo_fim[4]}".split("/");
				$("#periodo_fim_dia").val(periodo_fim[0]);
				$("#periodo_fim_mes").val(periodo_fim[1]);
				$("#periodo_fim_ano").val(periodo_fim[2]);
				var vencimento = new Array();
				vencimento = "{$campos.vencimento[4]}".split("/");
				$("#vencimento_dia").val(vencimento[0]);
				$("#vencimento_mes").val(vencimento[1]);
				$("#vencimento_ano").val(vencimento[2]);
				$("#referencia_mes").val("{$campos.referencia_mes[4]}");
				$("#referencia_ano").val("{$campos.referencia_ano[4]}");
				$("#valor").val("{$campos.valor[4]}");
				$("#status_id").val("{$campos.status_id[4]}");
				{/if}
				{literal}
			}
			else
			{
				$("#valor").val("");
				$("#valor_padrao").html("");
				$("#periodo_padrao").html("");
				$("#vencimento_padrao").html("");
				$("#periodo_inicio_dia").val("");
				$("#periodo_fim_dia").val("");
				$("#vencimento_dia").val("");
				$("#valor").val("");
			}
		}
		
	);
}

function ChgAno($ano)
{
	$("#periodo_inicio_ano").val($ano);
	if(inc_ano && parseInt($ano)==$ano)
		$("#periodo_fim_ano").val(parseInt($ano)+1);
	else
		$("#periodo_fim_ano").val($ano);
	
	$("#vencimento_ano").val($("#periodo_fim_ano").val());
}

function ChgMes($mes)
{
	if(campos[5]==0)
	{
		tmp = (parseInt($mes) + 1);
		if(tmp>12)
		{
			tmp = 1;
			inc_ano = 1;
		}
		else
		{
			inc_ano = 0;
		}
	}
	else
	{
		tmp = $mes;
	}
	
	tmp = String(tmp);
	
	ChgAno($("#periodo_inicio_ano").val());
	$("#periodo_inicio_mes").val($mes.pad(2,"0",0));
	$("#periodo_fim_mes").val(tmp.pad(2,"0",0));
	$("#vencimento_mes").val($("#periodo_fim_mes").val());
}

function showResponse(responseText, statusText)
{
	$("#mensagem").hide();
	$("#erro").hide();
	// nao se engane!!! aqui eu soh consegui enviar o form pro servidor!!!
	if(statusText=="success")
	{
		$("#vencimento_padrao").html("");
		$("#periodo_padrao").html("");
		$("#valor_padrao").html("");
		$("#mensagem").html(responseText);
		$("#mensagem").show();
	}
	else
	{
		$("#erro").html(responseText);
		$("#erro").show();
	}
	chgContrato($("#contrato_id").val());
}

function validate_erro(msg,field)
{
		$("#erro").append("<li>" + msg + "</li>");
		$("#erro li").css("list-style","square");
		$("#" + field + "_label").css("color","#FF0000");
		$("#" + field).css("border-color","#FF0000");
		$("#" + field).css("color","#FF0000");
		$("#erro").show();
}

function validate()
{
	$("#mensagem").hide();
	$("#erro").hide();
	
	$("#erro").html("");

	var status = true;

    if (!$("#cliente_id").val()) {
		validate_erro("Selecione o cliente","cliente_id");
		status = false;
    }
	
	if (!$("#contrato_id").val()) {
		validate_erro("Selecione o contrato","contrato_id");
        status = false; 
    }
	
	if (!$("#referencia_mes").val()) { 
        validate_erro("Selecione o m�s de refer�ncia","referencia");
		status = false;
    }
	
	if (!$("#referencia_ano").val()) { 
        validate_erro("Selecione o ano de refer�ncia","referencia");
		status = false;
    }

	if (!$("#periodo_inicio_dia").val()) { 
        validate_erro("Preencha Per�odo In�cio - Dia","periodo_inicio");
		status = false;
    }
	if (!$("#periodo_inicio_mes").val()) { 
        validate_erro("Preencha Per�odo In�cio - M�s","periodo_inicio");
		status = false;
    }
	
	if (!$("#periodo_inicio_ano").val()) { 
        validate_erro("Preencha Per�odo In�cio - Ano","periodo_inicio");
		status = false;
    }
	if (!$("#periodo_fim_dia").val()) { 
        validate_erro("Preencha Per�odo Fim - Dia","periodo_fim");
		status = false; 
    }
	if (!$("#periodo_fim_mes").val()) { 
        validate_erro("Preencha Per�odo Fim - M�s","periodo_fim");
		status = false;
    }
	if (!$("#periodo_fim_ano").val()) { 
        validate_erro("Preencha Per�odo Fim - Ano","periodo_fim");
		status = false; 
    }

	if(!status)
	{
		$("#erro").show();
		window.scroll(0,0);
	}
	return status;
}

function ajustarCamposOcultos()
{
	var x = $("#vencimento_dia").val()+"/"+$("#vencimento_mes").val()+"/"+$("#vencimento_ano").val();
	var y = $("#periodo_inicio_dia").val()+"/"+$("#periodo_inicio_mes").val()+"/"+$("#periodo_inicio_ano").val();
	var z = $("#periodo_fim_dia").val()+"/"+$("#periodo_fim_mes").val()+"/"+$("#periodo_fim_ano").val();
	if(x!="//") $("#vencimento").setValue(x);
	if(y!="//") $("#periodo_inicio").setValue(y);
	if(z!="//") $("#periodo_fim").setValue(z);
}

{/literal}
</script>


<br />
<table width="100%" border="0" cellpadding="2" cellspacing="0" border="0">
	<form name="formulario" id="formulario" action="{$SCRIPT_NAME}" method="post">
	<input type="hidden" name="processa" value="ok" />
	<input type="hidden" name="modo" value="{$modo}" />
	<input type="hidden" name="id" value="{$campos.id[4]}" />
	<input type="hidden" name="periodo_inicio" id="periodo_inicio" value="" />
	<input type="hidden" name="periodo_fim" id="periodo_fim" value="" />
	<input type="hidden" name="vencimento" id="vencimento" value="" />
	
	<tr>
		<td align="right"><label for="cliente_id" id="cliente_id_label" class="rotulos">Cliente :</label></td>
		<td>
			<select name="cliente_id" id="cliente_id" class="text_normal">
				<option value=""></option>
{foreach from=$clientes item=cliente}
{assign var="grupo_id_atual" value=$cliente.grupo_id}
{if $grupo_id_atual != $grupo_id_anterior}
				</optgroup>
				<optgroup label="{$cliente.grupo_codigo} - {$cliente.grupo_nome}">
{/if}
				<option value="{$cliente.id}">{if $cliente.codigo != ""}{$cliente.codigo} - {/if}{$cliente.nome}</option>
{assign var="grupo_id_anterior" value=$cliente.grupo_id}
{/foreach}
			</select>
			<script>//document.formulario.cliente_id.value="{$campos.cliente_id[4]}";</script>
		</td>
	</tr>
	
	<tr>
		<td align="right"><label for="contrato_id" id="contrato_id_label" class="rotulos">Contrato :</label></td>
		<td>
			<select name="contrato_id" id="contrato_id" style="width:454px;">
				<option value="">.:: Selecione um cliente ::.</option>
			</select>
			<script>//document.frm.contrato_id.value="{$campos.contrato_id[4]}";</script>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Per&iacute;odo padr&atilde;o:</td>
		<td><small id="periodo_padrao">&nbsp;</small></td>
	</tr>

	<tr>
		<td class="rotulos">Vencimento padr&atilde;o:</td>
		<td><small id="vencimento_padrao">&nbsp;</small><!-- <input type="text" class="text_normal" name="dia_vencimento" id="dia_vencimento" value="{$campos.dia_vencimento[4]}" style="width:40px;" onClick="scwShow(this,event);" />--></td>
	</tr>
	
	<tr>
		<td class="rotulos">Valor padr&atilde;o: <small>R$</small></td>
		<td><small id="valor_padrao">&nbsp;</small></td>
	</tr>
	
	<tr>
		<td class="rotulos">Refer�ncia:</td>
		<td>
			<select name="referencia_mes" id="referencia_mes" class="text_normal" style="width:120px;">
				<option value=""></option>
{foreach from=$meses item=mes key=k}
				<option value="{$k}">{$mes}</option>
{/foreach}
			</select>
			<select name="referencia_ano" id="referencia_ano" class="text_normal" style="width:60px;">
				<option value=""></option>
{section name=ano start=1990 loop=2021*}
				<option value="{$smarty.section.ano.index}">{$smarty.section.ano.index}</option>
{/section}
			</select>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Per&iacute;odo in&iacute;cio : </td>
		<td>
			<input type="text" class="text_normal" name="periodo_inicio_dia" id="periodo_inicio_dia" value="{$campos.periodo_inicio_dia[4]}" style="width:30px;" /><!-- onClick="scwShow(this,event);" -->
			&nbsp;/&nbsp;
			<input type="text" class="text_normal" name="periodo_inicio_mes" id="periodo_inicio_mes" value="{$campos.periodo_inicio_mes[4]}" style="width:30px;" /><!-- onClick="scwShow(this,event);" -->
			&nbsp;/&nbsp;
			<input type="text" class="text_normal" name="periodo_inicio_ano" id="periodo_inicio_ano" value="{$campos.periodo_inicio_ano[4]}" style="width:50px;" /><!-- onClick="scwShow(this,event);" -->
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Per&iacute;odo fim : </td>
		<td>
			<input type="text" class="text_normal" name="periodo_fim_dia" id="periodo_fim_dia" value="{$campos.periodo_fim_dia[4]}" style="width:30px;" /><!-- onClick="scwShow(this,event);" -->
			&nbsp;/&nbsp;
			<input type="text" class="text_normal" name="periodo_fim_mes" id="periodo_fim_mes" value="{$campos.periodo_fim_mes[4]}" style="width:30px;" /><!-- onClick="scwShow(this,event);" -->
			&nbsp;/&nbsp;
			<input type="text" class="text_normal" name="periodo_fim_ano" id="periodo_fim_ano" value="{$campos.periodo_fim_ano[4]}" style="width:50px;" /><!-- onClick="scwShow(this,event);" -->
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Vencimento :</td>
		<td>
			<input type="text" class="text_normal" name="vencimento_dia" id="vencimento_dia" value="{$campos.vencimento_dia[4]}" style="width:30px;" /><!-- onClick="scwShow(this,event);" -->
			&nbsp;/&nbsp;
			<input type="text" class="text_normal" name="vencimento_mes" id="vencimento_mes" value="{$campos.vencimento_mes[4]}" style="width:30px;" /><!-- onClick="scwShow(this,event);" -->
			&nbsp;/&nbsp;
			<input type="text" class="text_normal" name="vencimento_ano" id="vencimento_ano" value="{$campos.vencimento_ano[4]}" style="width:50px;" /><!-- onClick="scwShow(this,event);" -->
	</tr>
	
	<tr>
		<td class="rotulos">C&oacute;digo :</td>
		<td><input type="text" class="text_normal" name="codigo" id="codigo" value="{$campos.codigo[4]}" style="width:120px;" />&nbsp;<input type="button" value="Pr�x. C�digo Livre" id="ultcod" /></td>
	</tr>
	
	<tr>
		<td align="right"><label for="status_id" id="status_id_label" class="rotulos">Status :</label></td>
		<td>
			<select name="status_id" id="status_id" style="width:454px;">
				<option value="">.:: Selecione um status ::.</option>
			{foreach from=$lista_status item=status}
				<option value="{$status.id}">{$status.nome}</option>
			{/foreach}
			</select>
			<script>//document.frm.contrato_id.value="{$campos.contrato_id[4]}";</script>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Valor: <small>R$</small></td>
		<td><input type="text" class="text_normal" name="valor" id="valor" value="{$campos.valor[4]}" style="width:120px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">Observa&ccedil;&otilde;es :</td>
		<td><textarea class="text_normal" name="observacoes" style="width:450px; height:100px;" />{$campos.observacoes[4]}</textarea></td>
	</tr>

	<tr>
		<td align="center" colspan="2">
			<input type="reset" class="botao_normal" value="Limpar" />{if $modo=="alt"}<input type="button" class="botao_normal" value="Voltar" onClick="document.location='administradores.php'" />&nbsp;{/if}<input type="submit" id="submeter" class="botao_normal" value="{$botao}" />
		</td>
	</tr>
</form>
</table>

{include file=$tpl_adm_rodape}