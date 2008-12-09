{include file=$tpl_adm_topo}
{*debug*}

<script language="javascript" src="{$tpl_dir}/js/scw.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.form.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.field.js"></script>

<script>

var campos = new Array();
var inc_ano = 0;
var ultimo_codigo="{$ultimo_codigo}";
var modo="{$modo}";

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
	$("select[@name=plano_id]").change(function(){
		mudaPlano($(this).val());
	})
	
	$('#formulario').submit(
		function() {
			return validate();
		}
	);
	
});

function mudaPlano(plano)
{
	$.post('contratos.php', 
		{ 
		modo : "obtemValorPadrao",
		planoID : plano }, 
		function(resposta){
			$("#valor_padrao").val(resposta);
		}
	);
	
}

{/literal}
</script>

<table border="0" cellpadding="2" cellspacing="0" id="formulario">
	<form name="formulario" action="{$SCRIPT_NAME}" method="post" enctype="multipart/form-data">
	<input type="hidden" name="processa" value="ok" />
	<input type="hidden" name="modo" value="{$modo}" />
	<input type="hidden" name="id" value="{$campos.id[4]}" />
    <input type="hidden" name="gru" value="{$gru}" />
	
	<tr>
		<td class="rotulos">C�digo :</td>
		<td><input type="text" class="text_normal" name="codigo" value="{$campos.codigo[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Provedor :</td>
		<td>
			<select name="provedor_id" style="width:454px;">
				<option value=""></option>
{foreach from=$provedores item=provedor}
				<option value="{$provedor.id}">{if $provedor.codigo != ""}{$provedor.codigo} - {/if}{$provedor.razaosocial}</option>
{/foreach}
			</select>
			<script>document.formulario.provedor_id.value="{$campos.provedor_id[4]}";</script>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Plano :</td>
		<td>
			<select name="plano_id" style="width:454px;">
				<option value=""></option>
{foreach from=$planos item=plano}
				<option value="{$plano.id}">{if $plano.codigo != ""}{$plano.codigo} - {/if}{$plano.nome}</option>
{/foreach}
			</select>
			<script>document.formulario.plano_id.value="{$campos.plano_id[4]}";</script>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Cliente :</td>
		<td>
			<select name="cliente_id" style="width:454px;">
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
			<script>document.formulario.cliente_id.value="{$campos.cliente_id[4]}";</script>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Grupo :</td>
		<td>
			<select name="grupo_id" style="width:454px;">
				<option value=""></option>
{foreach from=$grupos item=grupo}
				<option value="{$grupo.id}">{if $grupo.codigo != ""}{$grupo.codigo} - {/if}{$grupo.nome}</option>
{/foreach}
			</select>
			<script>document.formulario.grupo_id.value="{$campos.grupo_id[4]}";</script>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">Descri��o :</td>
		<td><textarea class="text_normal" name="descricao" style="width:450px; height:100px;" />{$campos.descricao[4]}</textarea></td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">&nbsp;</td>
		<td>
			<input type="checkbox" name="ativo" id="ativo" value="1" class="" style="" />
			<label for="ativo" class="rotulos">Contrato ativo</label>
		</td>
		<script>if("{$campos.ativo[4]}"=="1") document.formulario.ativo.checked=true;</script>
	</tr>
	
	<tr>
		<td class="rotulos">Data In�cio :</td>
		<td><input type="text" class="text_normal" name="data_inicio" value="{$campos.data_inicio[4]}" style="width:80px;" onClick="scwShow(this,event);" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Data T�rmino :</td>
		<td><input type="text" class="text_normal" name="data_termino" value="{$campos.data_termino[4]}" style="width:80px;" onClick="scwShow(this,event);" /></td>
	</tr>
	
	<tr>
		<td class="rotulos"><label class="rotulos" for="periodo_id">Per�odo Padr�o :</label></td>
		<td>
			<select name="periodo_id" style="width:454px;">
				<option value=""></option>
{foreach from=$periodos item=periodo}
				<option value="{$periodo.id}">{$periodo.nome}</option>
{/foreach}
			</select>
			<script>document.formulario.periodo_id.value="{$campos.periodo_id[4]}";</script>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Vencimento padr�o :</td>
		<td>
			<select name="vencimento_padrao" id="vencimento_padrao" class="text_normal" style="width:60px;">
			<option value=""></option>
			{section name=vencimento_padrao start=1 loop=32}
			<option value="{$smarty.section.vencimento_padrao.index}">{$smarty.section.vencimento_padrao.index}</option>
			{/section}
			</select>
			<script>document.formulario.vencimento_padrao.value="{$campos.vencimento_padrao[4]}";</script>
		</td>
	</tr>
    
    <tr>
		<td class="rotulos">Valor Padr�o: <small>R$</small></td>
		<td><input type="text" class="text_normal" name="valor_padrao" id="valor_padrao" value="{$campos.valor_padrao[4]}" style="width:80px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">Observa��es :</td>
		<td><textarea class="text_normal" name="observacoes" style="width:450px; height:100px;" />{$campos.observacoes[4]}</textarea></td>
	</tr>

	<tr>
		<td>&nbsp;</td>
		<td align="center">
			{if $modo=="alt"}<input type="button" class="botao" value="Voltar" onClick="document.location='{$SCRIPT_NAME}?modo=lst'" />&nbsp;{/if}
		<input type="submit" class="botao" value="{$botao}" /></td>
	</tr>
</table>


</form>
</table>

{include file=$tpl_adm_rodape}