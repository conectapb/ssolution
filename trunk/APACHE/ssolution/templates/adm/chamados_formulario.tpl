{include file=$tpl_adm_topo}
{*debug*}
<script language="javascript" src="{$tpl_dir}/js/jquery.js"></script>

<script>

    var modo = "{$modo}";

    {literal}
$(document).ready(function() 
    { 
        $('#detalhesClienteToggle').click(function()
        {
            visualizar($('#cliente_id').val());
        });
	}
);

    function visualizar($id)
    {
        if($id == parseInt($id))
        {
            $.post('clientes.php',
                {
                modo : "vis",
                id : $id },
                function(resposta){
                   $("#visualizarTr").hide("slow");
                   $("#visualizarBox").html(resposta);
                   $("#visualizarTr").show("slow");
               }
            );
        }
        else
        {
            alert("visualizar: id NaN!")
        }
    }

{/literal}
</script>

<br />

<table width="100%" border="0" cellpadding="2" cellspacing="0" border="0">
	<form name="frm" action="{$SCRIPT_NAME}" method="post" enctype="multipart/form-data">
	<input type="hidden" name="processa" value="ok" />
	<input type="hidden" name="modo" value="{$modo}" />
	<input type="hidden" name="id" value="{$campos.id[4]}" />
	
	<tr>
		<td class="rotulos">Clientes :</td>
		<td>
			<select id="cliente_id" name="cliente_id" class="text_normal" style="width:450px;">
				<option value=""></option>
    			{foreach from=$clientes item=cliente}
				{assign var="grupo_id_atual" value=$cliente.grupo_id}
				{if $grupo_id_atual != $grupo_id_anterior}
				</optgroup>
				<optgroup label="{$cliente.grupo_codigo} - {$cliente.grupo_nome}">
				{/if}
				<option value="{$cliente.id}">{$cliente.codigo} - {$cliente.nome}</option>
				{assign var="grupo_id_anterior" value=$cliente.grupo_id}
			{/foreach}
			</select>
            <input type="button" id="detalhesClienteToggle" value="Mostrar detalhes do cliente">
			<script>document.frm.cliente_id.value="{$campos.cliente_id[4]}";</script>
			</td>
	</tr>

    <tr id="visualizarTr">
        <td>
            &nbsp;
        </td>
        <td>
           <div id="visualizarBox" style="width:456px;height:300px"></div>
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
		<td class="rotulos">Área do chamado :</td>
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
		<td class="rotulos" valign="top">Problema :</td>
		<td><textarea class="text_normal" name="problema" style="width:450px; height:100px;" />{$campos.problema[4]}</textarea></td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">Solu&ccedil;&atilde;o :</td>
		<td><textarea class="text_normal" name="solucao" style="width:450px; height:100px;" />{$campos.solucao[4]}</textarea></td>
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
		<td class="rotulos" valign="top">Observações :</td>
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
