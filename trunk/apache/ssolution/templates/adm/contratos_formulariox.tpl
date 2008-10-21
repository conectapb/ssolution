{include file=$tpl_adm_topo}

<!-- Calendario Javascript -->
<script language="javascript" src="{$tpl_dir}/js/scw.js"></script>

<script language="javascript" src="{$tpl_dir}/js/scw.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery-1.2.2.pack.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.form.js"></script>

{literal}
<script>
$().ready(function() {
	$("select[@name=plano_id]").change(function(){
		//alert($(this).val());
		$.post('contratos.php', 
			{ modo : "obtemPlano", planoID : $(this).val() }, 
			function(resposta){
				document.frm.valor_padrao.value=resposta;
				//$('input[@name=valor_padrao]').html(resposta);
			}
			
		);
	});
});
</script>
{/literal}

<form name="frm" action="{$SCRIPT_NAME}" method="post" enctype="multipart/form-data" id="formulario">
<fieldset>
	<input type="hidden" name="processa" value="ok" />
	<input type="hidden" name="modo" value="{$modo}" />
	<input type="hidden" name="id" value="{$campos.id[4]}" />
	
	<label for="codigo">C&oacute;digo:</label>
	<input type="text" class="text_normal" name="codigo" id="codigo" value="{$campos.codigo[4]}" style="width:450px;" />
	
	<br />
	
	<label for="provedor_id">Provedor:</label>
	<select name="provedor_id" id="provedor_id">
		<option value=""></option>
{foreach from=$provedores item=provedor}
		<option value="{$provedor.id}">{if $provedor.codigo != ""}{$provedor.codigo} - {/if}{$provedor.razaosocial}</option>
{/foreach}
	</select>
	<script>document.frm.provedor_id.value="{$campos.provedor_id[4]}";</script>
	
	<br />
	
	<label>Plano:</label>
	<select name="plano_id" style="width:454px;">
		<option value=""></option>
{foreach from=$planos item=plano}
		<option value="{$plano.id}">{if $plano.codigo != ""}{$plano.codigo} - {/if}{$plano.nome}</option>
{/foreach}
	</select>
	<script>document.frm.plano_id.value="{$campos.plano_id[4]}";</script>
	
	<br />

	<label>Cliente:</label>
	<select name="cliente_id" style="width:454px;">
		<option value=""></option>
{foreach from=$clientes item=cliente}
{assign var="grupo_id_atual" value=$cliente.grupo_id}
{if $grupo_id_atual != $grupo_id_anterior}{if $grupo_id_anterior != ""}
		</optgroup>
{/if}
		<optgroup label="{$cliente.grupo_codigo} - {$cliente.grupo_nome_padrao} - {$cliente.grupo_nome}">
{/if}
		<option value="{$cliente.id}">{if $cliente.codigo != ""}{$cliente.codigo} - {/if}{$cliente.nome}</option>
{assign var="grupo_id_anterior" value=$cliente.grupo_id}
{/foreach}
	</select>
	<script>document.frm.cliente_id.value="{$campos.cliente_id[4]}";</script>
	
	<br />
	
	<label>Grupo:</label>
	<select name="grupo_id" style="width:454px;">
		<option value=""></option>
{foreach from=$grupos item=grupo}
		<option value="{$grupo.id}">{if $grupo.codigo != ""}{$grupo.codigo} - {/if}{$grupo.nome_padrao} - {$grupo.nome}</option>
{/foreach}
	</select>
	<script>document.frm.grupo_id.value="{$campos.grupo_id[4]}";</script>
	
	<br />
	
	<label>Descri&ccedil;&atilde;o:</label>
	<textarea name="descricao" />{$campos.descricao[4]}</textarea>
	
	<br />
	
	<label for="ativo">Contrato ativo:</label>
	<input type="checkbox" name="ativo" id="ativo" value="1" class="" style="" />
	<script>if("{$campos.ativo[4]}"=="1") document.frm.ativo.checked=true;</script>
	
	<br />
	
	<label>Data In&iacute;cio:</label>
	<input type="text" name="data_inicio" value="{$campos.data_inicio[4]}" style="width:80px;" onClick="scwShow(this,event);" />

	<br />
	
	<label>Data T&eacute;rmino:</label>
	<input type="text" class="text_normal" name="data_termino" value="{if $campos.data_termino[4]!="00/00/0000"}{$campos.data_termino[4]}{/if}" style="width:80px;" onClick="scwShow(this,event);" />	
	
	<br />
	
	<label for="periodo_id">Per&iacute;odo Padr&atilde;o :</label>
	<select name="periodo_id" style="width:454px;">
		<option value=""></option>
{foreach from=$periodos item=periodo}
		<option value="{$periodo.id}">{$periodo.nome}</option>
{/foreach}
	</select>
	<script>document.frm.periodo_id.value="{$campos.periodo_id[4]}";</script>
	
	<br />
	
	<label for="valor_padrao">Valor Padr&atilde;o :</label>
	<input type="text" class="text_normal" name="valor_padrao" id="valor_padrao" value="{$campos.valor_padrao[4]|replace:".":","}" style="width:60px;" />
	
	<br />

	<label>Vencimento padr&atilde;o:</label>
	<select name="vencimento_padrao" id="vencimento_padrao" class="text_normal" style="width:60px;">
		<option value=""></option>
{section name=vencimento_padrao start=1 loop=32}
		<option value="{$smarty.section.vencimento_padrao.index}">{$smarty.section.vencimento_padrao.index}</option>
{/section}
	</select>
	<script>document.frm.vencimento_padrao.value="{$campos.vencimento_padrao[4]}";</script>
	
	<br />
	
	<label>Observa&ccedil;&otilde;es :</label>
	<textarea name="observacoes" />{$campos.observacoes[4]}</textarea>
	
	<br />
	
{if $modo=="alt"}<center><input type="button" class="botao" value="Voltar" onClick="document.location='{$SCRIPT_NAME}?modo=lst'" />&nbsp;{/if}<input type="submit" class="botao" value="{$botao}" /></center>
	
</fieldset>
</form>

{include file=$tpl_adm_rodape}