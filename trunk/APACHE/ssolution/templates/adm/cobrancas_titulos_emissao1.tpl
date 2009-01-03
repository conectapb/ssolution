{include file=$tpl_adm_topo}
{debug}

<script language="javascript" src="{$tpl_dir}/js/jquery.js"></script>

<script>
    gru="{$gru}";
    {literal}
    $(document).ready(function() {

        $.post('clientes.php',
            { modo : "obtemGrupos" },
            function(resposta){
                //alert(resposta);
                $('#grupo_id').html(resposta);
            }
        );

        data = new Date();
        ano = data.getFullYear();
        mes = data.getMonth();
        
        $('.grupo_id').attr('checked','checked');
        $('#checkAll').change(function(){
            if(!$('.grupo_id').attr('checked'))
                $('.grupo_id').attr('checked','checked');
            else
                 $('.grupo_id').attr('checked','');
        }).attr('checked','checked');

        $('#referencia_mes').val(mes);
        $('#referencia_ano').val(ano);
        
    });
    {/literal}
</script>

<table width="100%">
    <form name="formulario" id="formulario" action="{$SCRIPT_NAME}" method="post">
	<input type="hidden" name="processa" value="ok" />
	<input type="hidden" name="modo" value="{$modo}" />
    <input type="hidden" name="etapa" value="1" />
    <tr>
		<td class="rotulos">Referência :</td>
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
    {literal}<style>.gruposCol1{width: 50%; float:left; border:0px solid red;}</style>{/literal}
    {literal}<style>.gruposCol2{width: 50%; float:right; border:0px solid blue;}</style>{/literal}
    <tr>
		<td class="rotulos" valign="top">Grupos :</td>
		<td>
            <label><input type="checkbox" id="checkAll">Marcar/desmarcar todos</label>
            <br><br>
            <div class=gruposCol1>
                {foreach from=$grupos_even item=i}
                <label><input type="checkbox" name="grupo_id[]" class="grupo_id" value="{$i.id}">{$i.nome_padrao}</label><br>
                {/foreach}
            </div>
            <div class=gruposCol2>
                {foreach from=$grupos_odd item=i}
                <label><input type="checkbox" name="grupo_id[]" class="grupo_id" value="{$i.id}">{$i.nome_padrao}</label><br>
                {/foreach}
            </div>
		</td>
	</tr>
    <tr>
        <td colspan="2"><input type="submit"></td>
    </tr>
    </form>
</table>

{include file=$tpl_adm_rodape}