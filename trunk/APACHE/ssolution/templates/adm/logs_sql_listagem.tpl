{include file=$tpl_adm_topo}
{*debug*}

<script language="javascript" src="{$tpl_dir}/js/jquery-1.2.2.pack.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.tablesorter.pack.js"></script>

{literal}
<script>
$(document).ready(function() 
    {

        $("#tablesorter").tablesorter({
			cancelSelection: true,
			widgets: ['zebra']});
	}
);
</script>
{/literal}

<table border="0" cellpadding="0" cellspacing="1" id="tablesorter">
<thead>
<tr>
	<th width="100" align="center">Data</th>
	<th width="100" align="center">Tipo</th>
	<th width="700" align="center">SQL</th>
</tr>
</thead>

<tbody>
{foreach from=$dados item=logline}
	<tr>
		<td align="center">{$logline.data|date_format:"%d/%m/%Y"}<br />{$logline.data|date_format:"%H:%M:%S"}</td>
		<td>{$logline.tipo}</td>
		<td>{$logline.highlight}</td>
	</tr>
{/foreach}
</tbody>

{include file=$tpl_adm_rodape}