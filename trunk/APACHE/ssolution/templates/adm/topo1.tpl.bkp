<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>{$titulo}</title>
<link href="{$tpl_adm_style}" rel="stylesheet" type="text/css" />
</head>

{literal}
<script type="text/javascript" src="js/overlib.js"><!-- overLIB (c) Erik Bosrup --></script>
{/literal}

<body>
<div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"><!-- //Usado pela overlib --></div>

<div id="template_sel" style="position:absolute; right:15px; top:15px;">
<form name="tpl" action="{$SCRIPT_NAME}?{$querystring}" id="tpl" method="post">
<input type="hidden" name="tpl_adm" />
<select name="tpl_sel" onchange="document.tpl.tpl_adm.value=this.value; document.tpl.submit();">
	<option value="1" >Template 1</option>
	<option value="2">Template 2</option>
</select>
</form>
<script>document.tpl.tpl_sel.value="{$tpl_adm}";</script>
</div>

<div id="corpo">
	
	<div id="cabecalho">
		<div id="titulo">Sistema Administrativo Smart Solution</div>
		<div id="login">&nbsp;</div>
	</div>
	<div id="menu">
		{if $funcoes!=""}
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				{assign var="tammenu" value="125"}
				{assign var="margemesq" value="10"}
				{section name=i loop=$funcoes}
					{assign var="iteracao" value=$smarty.section.i.iteration}
					{math assign="posicaox" equation=(($iteracao-1)*$tammenu)+$margemesq+$iteracao-1}
					{capture assign=submenu}
					<table width=\'{$tammenu}\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' bgcolor=\'#FFFFFF\'>
						{section name=j loop=$funcoes[i].filhos}
						{if $smarty.section.j.iteration!=1}
						<tr><td height=\'1\' bgcolor=\'#000000\'><img src=\'{$tpl_dir}/images/spacer.gif\' width=\'1\' height=\'1\' border=\'0\' /></td></tr>
						{/if}
						<tr>
							<td class=\'menu_subitem\'>
								<img src=\'{$tpl_dir}/images/menu.png\' alt=\'{$funcoes[i].nome}\' width=\'16\' height=\'16\' hspace=\'5\' border=\'0\' align=\'absmiddle\' /><a href={$funcoes[i].filhos[j].link}>{$funcoes[i].filhos[j].nome}</a>
							</td>
						</tr>
						{/section}
					</table>
					{/capture}

				<td class="menu_item" onmouseover="return overlib('{$submenu|strip}',  STICKY, MOUSEOFF, WIDTH, {$tammenu}, FIXY, 90, FIXX, {$posicaox}, CELLPAD, 0, 0, 0, 0);" onmouseout="return nd();">
					<a href="javascript:void(0);" onmouseover="return overlib('{$submenu|strip}',  STICKY, MOUSEOFF, WIDTH, {$tammenu}, FIXY, 90, FIXX, {$posicaox}, CELLPAD, 0, 0, 0, 0);" onmouseout="return nd();">
						<img src="{$tpl_dir}/images/menu.png" alt="{$funcoes[i].nome}" width="16" height="16" hspace="5" border="0" align="absmiddle" />
						{$funcoes[i].nome}
					</a>
				</td>
				{/section}
				</td>
				<td>&nbsp;</td>
				<td class="menu_item" align="right"><a href="sair.php"><span class="submenu_titulo">Sair</span></a>&nbsp;</td>
			</tr>
		</table>
		{/if}
	</div>
	<div id="conteudo">
		<div id="subtitulo">
			{if $subtitulo!=""}
			<img src="{$tpl_dir}/images/subtitulo.png" alt="{$funcoes[i].nome}" width="16" height="16" hspace="5" border="0" align="absmiddle" />
			{$subtitulo}
			{/if}
		</div>
		<br />
		{if $msg<>""}
			<div id="mensagem">
				{$msg}
			</div>
		{/if}

{if $erros<>""}
		<div id="erro">
		Ocorreram os seguintes erros:
		{section name=i loop=$erros}<li style="list-style:square">{$erros[i]}</li>{/section}
		</div>
{/if}