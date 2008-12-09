{include file=$tpl_adm_topo}
{*debug*}
<script language="javascript" src="{$tpl_dir}/js/jquery.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.tablesorter.pack.js"></script>
<!--<script language="javascript" src="{$tpl_dir}/js/jquery.tablesorter.pager.js"></script>-->
<script language="javascript" src="{$tpl_dir}/js/jquery.quicksearch.js"></script>

{literal}
<script>
$(document).ready(function() 
    {

        $("#tablesorter").tablesorter({
			headers: {
				6: {
					sorter: false
				}
			},
			//sortList: [[1,0],[2,0],[3,0]],
			cancelSelection: true,
			widgets: ['zebra']});
		$('table#tablesorter tbody tr').quicksearch({
			position: 'after',
			attached: '#searchBox',
			labelText: 'Procurar por: '
		});	
		$("#tablesorter tr").mouseover(function() {$(this).addClass("over");}).mouseout(function() {$(this).removeClass("over");});
	}
);
</script>
{/literal}

<br />

<table width="100%" border="0" cellpadding="2" cellspacing="0" border="0">
	<form name="frm" action="{$SCRIPT_NAME}" method="post" enctype="multipart/form-data">
	<input type="hidden" name="processa" value="ok" />
	<input type="hidden" name="modo" value="{$modo}" />
	<input type="hidden" name="id" value="{$campos.id[4]}" />
	
	<tr>
		<td class="rotulos">Nome :</td>
		<td><input type="text" class="text_normal" name="nome" value="{$campos.nome[4]}" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Dia In&iacute;cio :</td>
		<td><input type="text" class="text_normal" name="dia_inicio" value="{$campos.dia_inicio[4]}" style="width:50px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Dia T&eacute;rmino :</td>
		<td>
			<input type="text" class="text_normal" name="dia_termino" value="{$campos.dia_termino[4]}" style="width:50px;" />
			&nbsp;
			<input type="checkbox" name="dia_termino_mescorrente" id="dia_termino_mescorrente" value="1" />
			<label for="dia_termino_mescorrente">Dia de t&eacute;rmino pertence ao m&ecirc;s corrente</label>
			<script>if("{$campos.dia_termino_mescorrente[4]}"=="1") document.frm.dia_termino_mescorrente.checked=true;</script>
		</td>
	</tr>

	<tr>
		<td>&nbsp;</td>
		<td align="center">
			{if $modo=="alt"}<input type="button" class="botao" value="Voltar" onClick="document.location='periodos.php'" />&nbsp;{/if}
		<input type="submit" class="botao" value="{$botao}" /></td>
	</tr>
</form>
</table>
<br />
<br />
<small>
Exemplos:
<ul>
<li>Para cadastrar um per&iacute;odo de 10 do m&ecirc;s corrente a 09 do m&ecirc;s seguinte, preencher os campos:
<ul>
<li>Nome: "10 m&ecirc;s corrente a 09 m&ecirc;s seguinte" (pode ser qualquer nome que descreva o per&iacute;odo)</li>
<li>Dia In&iacute;cio: "10"</li>
<li>Dia T&eacute;rmino: "09"</li>
<li>Dia de t&eacute;rmino pertence ao m&ecirc;s corrente: desmarcado</li>
</ul>
</li>
<br />
<li>Para cadastrar um per&iacute;odo de 01 do m&ecirc;s corrente ao &uacute;ltimo dia do m&ecirc;s corrente, preencher os campos:
<ul>
<li>Nome: "01 m&ecirc;s corrente a 31 m&ecirc;s corrente" (pode ser qualquer nome que descreva o per&iacute;odo)</li>
<li>Dia In&iacute;cio: "01"</li>
<li>Dia T&eacute;rmino: "31"</li>
<li>Dia de t&eacute;rmino pertence ao m&ecirc;s corrente: marcado</li>
</ul>
</li>
</ul>
</small>

{include file=$tpl_adm_rodape}