<?php /* Smarty version 2.6.19, created on 2008-10-16 11:37:49
         compiled from adm/cobrancas_titulos_formulario.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'debug', 'adm/cobrancas_titulos_formulario.tpl', 2, false),)), $this); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_topo'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php echo smarty_function_debug(array(), $this);?>


<script language="javascript" src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/js/scw.js"></script>
<script language="javascript" src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/js/jquery-1.2.2.pack.js"></script>
<script language="javascript" src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/js/jquery.form.js"></script>
<script language="javascript" src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/js/jquery.field.js"></script>

<script>

var campos = new Array();
var inc_ano = 0;
var ultimo_codigo="<?php echo $this->_tpl_vars['ultimo_codigo']; ?>
";
var modo="<?php echo $this->_tpl_vars['modo']; ?>
";

<?php echo '

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
	
	$(\'#formulario\').submit(
		function() {
			return validate();
		}
	);
	
	/*$(\'#formulario\').ajaxForm(
		{
			//target: \'#erro\',
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
'; ?>

		$("#cliente_id").setValue("<?php echo $this->_tpl_vars['campos']['cliente_id'][4]; ?>
");
		mudaCliente("<?php echo $this->_tpl_vars['campos']['cliente_id'][4]; ?>
","<?php echo $this->_tpl_vars['campos']['contrato_id'][4]; ?>
");
		//$("#contrato_id").val("<?php echo $this->_tpl_vars['campos']['contrato_id'][4]; ?>
");
<?php echo '
	}
});

function mudaCliente(cliente,contrato)
{
	$(\'select[@name=contrato_id]\').html(\'<option value="sda">Procurando :::::::</option>\');
	$.post(\'cobrancas.php\', 
		{ 
		modo : "obtemContratos",
		cliID : cliente }, 
		function(resposta){
			$(\'select[@name=contrato_id]\').html(resposta);
			$("#vencimento_padrao").html("");
			$("#valor").val("");
			chgContrato(contrato);
		}
	);
}

function chgContrato(ctrID)
{
	$.post(\'cobrancas.php\', 
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
				'; ?>

				<?php if ($this->_tpl_vars['modo'] == 'cad'): ?>
				$("#periodo_inicio_dia").val(campos[3]);
				$("#periodo_fim_dia").val(campos[4]);
				$("#vencimento_dia").val(campos[1]);
				$("#valor").val(campos[0]);
				<?php else: ?>
				var periodo_inicio = new Array();
				periodo_inicio = "<?php echo $this->_tpl_vars['campos']['periodo_inicio'][4]; ?>
".split("/");
				$("#periodo_inicio_dia").val(periodo_inicio[0]);
				$("#periodo_inicio_mes").val(periodo_inicio[1]);
				$("#periodo_inicio_ano").val(periodo_inicio[2]);
				var periodo_fim = new Array();
				periodo_fim = "<?php echo $this->_tpl_vars['campos']['periodo_fim'][4]; ?>
".split("/");
				$("#periodo_fim_dia").val(periodo_fim[0]);
				$("#periodo_fim_mes").val(periodo_fim[1]);
				$("#periodo_fim_ano").val(periodo_fim[2]);
				var vencimento = new Array();
				vencimento = "<?php echo $this->_tpl_vars['campos']['vencimento'][4]; ?>
".split("/");
				$("#vencimento_dia").val(vencimento[0]);
				$("#vencimento_mes").val(vencimento[1]);
				$("#vencimento_ano").val(vencimento[2]);
				$("#referencia_mes").val("<?php echo $this->_tpl_vars['campos']['referencia_mes'][4]; ?>
");
				$("#referencia_ano").val("<?php echo $this->_tpl_vars['campos']['referencia_ano'][4]; ?>
");
				$("#valor").val("<?php echo $this->_tpl_vars['campos']['valor'][4]; ?>
");
				$("#status_id").val("<?php echo $this->_tpl_vars['campos']['status_id'][4]; ?>
");
				<?php endif; ?>
				<?php echo '
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
	// nao se engane!!! aqui eu só consegui enviar o form pro servidor!!!
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
        validate_erro("Selecione o mês de referência","referencia");
		status = false;
    }
	
	if (!$("#referencia_ano").val()) { 
        validate_erro("Selecione o ano de referência","referencia");
		status = false;
    }

	if (!$("#periodo_inicio_dia").val()) { 
        validate_erro("Preencha Período Início - Dia","periodo_inicio");
		status = false;
    }
	if (!$("#periodo_inicio_mes").val()) { 
        validate_erro("Preencha Período Início - Mês","periodo_inicio");
		status = false;
    }
	
	if (!$("#periodo_inicio_ano").val()) { 
        validate_erro("Preencha Período Início - Ano","periodo_inicio");
		status = false;
    }
	if (!$("#periodo_fim_dia").val()) { 
        validate_erro("Preencha Período Fim - Dia","periodo_fim");
		status = false; 
    }
	if (!$("#periodo_fim_mes").val()) { 
        validate_erro("Preencha Período Fim - Mês","periodo_fim");
		status = false;
    }
	if (!$("#periodo_fim_ano").val()) { 
        validate_erro("Preencha Período Fim - Ano","periodo_fim");
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

'; ?>

</script>


<br />
<table width="100%" border="0" cellpadding="2" cellspacing="0" border="0">
	<form name="formulario" id="formulario" action="<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
" method="post">
	<input type="hidden" name="processa" value="ok" />
	<input type="hidden" name="modo" value="<?php echo $this->_tpl_vars['modo']; ?>
" />
	<input type="hidden" name="id" value="<?php echo $this->_tpl_vars['campos']['id'][4]; ?>
" />
	<input type="hidden" name="periodo_inicio" id="periodo_inicio" value="" />
	<input type="hidden" name="periodo_fim" id="periodo_fim" value="" />
	<input type="hidden" name="vencimento" id="vencimento" value="" />
	
	<tr>
		<td align="right"><label for="cliente_id" id="cliente_id_label" class="rotulos">Cliente :</label></td>
		<td>
			<select name="cliente_id" id="cliente_id" class="text_normal">
				<option value=""></option>
<?php $_from = $this->_tpl_vars['clientes']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['cliente']):
?>
<?php $this->assign('grupo_id_atual', $this->_tpl_vars['cliente']['grupo_id']); ?>
<?php if ($this->_tpl_vars['grupo_id_atual'] != $this->_tpl_vars['grupo_id_anterior']): ?>
				</optgroup>
				<optgroup label="<?php echo $this->_tpl_vars['cliente']['grupo_codigo']; ?>
 - <?php echo $this->_tpl_vars['cliente']['grupo_nome']; ?>
">
<?php endif; ?>
				<option value="<?php echo $this->_tpl_vars['cliente']['id']; ?>
"><?php if ($this->_tpl_vars['cliente']['codigo'] != ""): ?><?php echo $this->_tpl_vars['cliente']['codigo']; ?>
 - <?php endif; ?><?php echo $this->_tpl_vars['cliente']['nome']; ?>
</option>
<?php $this->assign('grupo_id_anterior', $this->_tpl_vars['cliente']['grupo_id']); ?>
<?php endforeach; endif; unset($_from); ?>
			</select>
			<script>//document.formulario.cliente_id.value="<?php echo $this->_tpl_vars['campos']['cliente_id'][4]; ?>
";</script>
		</td>
	</tr>
	
	<tr>
		<td align="right"><label for="contrato_id" id="contrato_id_label" class="rotulos">Contrato :</label></td>
		<td>
			<select name="contrato_id" id="contrato_id" style="width:454px;">
				<option value="">.:: Selecione um cliente ::.</option>
			</select>
			<script>//document.frm.contrato_id.value="<?php echo $this->_tpl_vars['campos']['contrato_id'][4]; ?>
";</script>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Per&iacute;odo padr&atilde;o:</td>
		<td><small id="periodo_padrao">&nbsp;</small></td>
	</tr>

	<tr>
		<td class="rotulos">Vencimento padr&atilde;o:</td>
		<td><small id="vencimento_padrao">&nbsp;</small><!-- <input type="text" class="text_normal" name="dia_vencimento" id="dia_vencimento" value="<?php echo $this->_tpl_vars['campos']['dia_vencimento'][4]; ?>
" style="width:40px;" onClick="scwShow(this,event);" />--></td>
	</tr>
	
	<tr>
		<td class="rotulos">Valor padr&atilde;o: <small>R$</small></td>
		<td><small id="valor_padrao">&nbsp;</small></td>
	</tr>
	
	<tr>
		<td class="rotulos">Referência:</td>
		<td>
			<select name="referencia_mes" id="referencia_mes" class="text_normal" style="width:120px;">
				<option value=""></option>
<?php $_from = $this->_tpl_vars['meses']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['mes']):
?>
				<option value="<?php echo $this->_tpl_vars['k']; ?>
"><?php echo $this->_tpl_vars['mes']; ?>
</option>
<?php endforeach; endif; unset($_from); ?>
			</select>
			<select name="referencia_ano" id="referencia_ano" class="text_normal" style="width:60px;">
				<option value=""></option>
<?php unset($this->_sections['ano']);
$this->_sections['ano']['name'] = 'ano';
$this->_sections['ano']['start'] = (int)1990;
$this->_sections['ano']['loop'] = is_array($_loop="2021*") ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['ano']['show'] = true;
$this->_sections['ano']['max'] = $this->_sections['ano']['loop'];
$this->_sections['ano']['step'] = 1;
if ($this->_sections['ano']['start'] < 0)
    $this->_sections['ano']['start'] = max($this->_sections['ano']['step'] > 0 ? 0 : -1, $this->_sections['ano']['loop'] + $this->_sections['ano']['start']);
else
    $this->_sections['ano']['start'] = min($this->_sections['ano']['start'], $this->_sections['ano']['step'] > 0 ? $this->_sections['ano']['loop'] : $this->_sections['ano']['loop']-1);
if ($this->_sections['ano']['show']) {
    $this->_sections['ano']['total'] = min(ceil(($this->_sections['ano']['step'] > 0 ? $this->_sections['ano']['loop'] - $this->_sections['ano']['start'] : $this->_sections['ano']['start']+1)/abs($this->_sections['ano']['step'])), $this->_sections['ano']['max']);
    if ($this->_sections['ano']['total'] == 0)
        $this->_sections['ano']['show'] = false;
} else
    $this->_sections['ano']['total'] = 0;
if ($this->_sections['ano']['show']):

            for ($this->_sections['ano']['index'] = $this->_sections['ano']['start'], $this->_sections['ano']['iteration'] = 1;
                 $this->_sections['ano']['iteration'] <= $this->_sections['ano']['total'];
                 $this->_sections['ano']['index'] += $this->_sections['ano']['step'], $this->_sections['ano']['iteration']++):
$this->_sections['ano']['rownum'] = $this->_sections['ano']['iteration'];
$this->_sections['ano']['index_prev'] = $this->_sections['ano']['index'] - $this->_sections['ano']['step'];
$this->_sections['ano']['index_next'] = $this->_sections['ano']['index'] + $this->_sections['ano']['step'];
$this->_sections['ano']['first']      = ($this->_sections['ano']['iteration'] == 1);
$this->_sections['ano']['last']       = ($this->_sections['ano']['iteration'] == $this->_sections['ano']['total']);
?>
				<option value="<?php echo $this->_sections['ano']['index']; ?>
"><?php echo $this->_sections['ano']['index']; ?>
</option>
<?php endfor; endif; ?>
			</select>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Per&iacute;odo in&iacute;cio : </td>
		<td>
			<input type="text" class="text_normal" name="periodo_inicio_dia" id="periodo_inicio_dia" value="<?php echo $this->_tpl_vars['campos']['periodo_inicio_dia'][4]; ?>
" style="width:30px;" /><!-- onClick="scwShow(this,event);" -->
			&nbsp;/&nbsp;
			<input type="text" class="text_normal" name="periodo_inicio_mes" id="periodo_inicio_mes" value="<?php echo $this->_tpl_vars['campos']['periodo_inicio_mes'][4]; ?>
" style="width:30px;" /><!-- onClick="scwShow(this,event);" -->
			&nbsp;/&nbsp;
			<input type="text" class="text_normal" name="periodo_inicio_ano" id="periodo_inicio_ano" value="<?php echo $this->_tpl_vars['campos']['periodo_inicio_ano'][4]; ?>
" style="width:50px;" /><!-- onClick="scwShow(this,event);" -->
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Per&iacute;odo fim : </td>
		<td>
			<input type="text" class="text_normal" name="periodo_fim_dia" id="periodo_fim_dia" value="<?php echo $this->_tpl_vars['campos']['periodo_fim_dia'][4]; ?>
" style="width:30px;" /><!-- onClick="scwShow(this,event);" -->
			&nbsp;/&nbsp;
			<input type="text" class="text_normal" name="periodo_fim_mes" id="periodo_fim_mes" value="<?php echo $this->_tpl_vars['campos']['periodo_fim_mes'][4]; ?>
" style="width:30px;" /><!-- onClick="scwShow(this,event);" -->
			&nbsp;/&nbsp;
			<input type="text" class="text_normal" name="periodo_fim_ano" id="periodo_fim_ano" value="<?php echo $this->_tpl_vars['campos']['periodo_fim_ano'][4]; ?>
" style="width:50px;" /><!-- onClick="scwShow(this,event);" -->
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Vencimento :</td>
		<td>
			<input type="text" class="text_normal" name="vencimento_dia" id="vencimento_dia" value="<?php echo $this->_tpl_vars['campos']['vencimento_dia'][4]; ?>
" style="width:30px;" /><!-- onClick="scwShow(this,event);" -->
			&nbsp;/&nbsp;
			<input type="text" class="text_normal" name="vencimento_mes" id="vencimento_mes" value="<?php echo $this->_tpl_vars['campos']['vencimento_mes'][4]; ?>
" style="width:30px;" /><!-- onClick="scwShow(this,event);" -->
			&nbsp;/&nbsp;
			<input type="text" class="text_normal" name="vencimento_ano" id="vencimento_ano" value="<?php echo $this->_tpl_vars['campos']['vencimento_ano'][4]; ?>
" style="width:50px;" /><!-- onClick="scwShow(this,event);" -->
	</tr>
	
	<tr>
		<td class="rotulos">C&oacute;digo :</td>
		<td><input type="text" class="text_normal" name="codigo" id="codigo" value="<?php echo $this->_tpl_vars['campos']['codigo'][4]; ?>
" style="width:120px;" />&nbsp;<input type="button" value="Próx. Código Livre" id="ultcod" /></td>
	</tr>
	
	<tr>
		<td align="right"><label for="status_id" id="status_id_label" class="rotulos">Status :</label></td>
		<td>
			<select name="status_id" id="status_id" style="width:454px;">
				<option value="">.:: Selecione um status ::.</option>
			<?php $_from = $this->_tpl_vars['lista_status']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['status']):
?>
				<option value="<?php echo $this->_tpl_vars['status']['id']; ?>
"><?php echo $this->_tpl_vars['status']['nome']; ?>
</option>
			<?php endforeach; endif; unset($_from); ?>
			</select>
			<script>//document.frm.contrato_id.value="<?php echo $this->_tpl_vars['campos']['contrato_id'][4]; ?>
";</script>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Valor: <small>R$</small></td>
		<td><input type="text" class="text_normal" name="valor" id="valor" value="<?php echo $this->_tpl_vars['campos']['valor'][4]; ?>
" style="width:120px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">Observa&ccedil;&otilde;es :</td>
		<td><textarea class="text_normal" name="observacoes" style="width:450px; height:100px;" /><?php echo $this->_tpl_vars['campos']['observacoes'][4]; ?>
</textarea></td>
	</tr>

	<tr>
		<td align="center" colspan="2">
			<input type="reset" class="botao_normal" value="Limpar" /><?php if ($this->_tpl_vars['modo'] == 'alt'): ?><input type="button" class="botao_normal" value="Voltar" onClick="document.location='administradores.php'" />&nbsp;<?php endif; ?><input type="submit" id="submeter" class="botao_normal" value="<?php echo $this->_tpl_vars['botao']; ?>
" />
		</td>
	</tr>
</form>
</table>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_rodape'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>