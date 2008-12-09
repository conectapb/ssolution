<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="application/xhtml+xml; charset=ISO-8859-1" />
<title>{$titulo}</title>
<link href="{$tpl_dir}/adm/style.css" rel="stylesheet" type="text/css" />
</head>

{literal}
<script type="text/javascript" src="js/overlib.js"><!-- overLIB (c) Erik Bosrup --></script>
{/literal}

<body>
<div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"><!-- //Usado pela overlib --></div>
<div id="corpo">
	<div id="cabecalho">
		<div id="titulo">Sistema Administrativo Smart Solution</div>
		<div id="login">&nbsp;</div>
	</div>
	<div id="menu">
		{if $funcoes!=""}
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				{section name=i loop=$funcoes}
				<td class="menu_item">
					{capture assign=submenu}
					<table width=\'100%\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' bgcolor=\'#FFFFFF\'>
						{section name=j loop=$funcoes[i].filhos}
						<tr>
							<td class=\'menu_subitem\'>
								<a href={$funcoes[i].filhos[j].link}>{$funcoes[i].filhos[j].nome}</a>
							</td>
						</tr>
						{/section}
					</table>
					{/capture}
					<a href="javascript:void(0);" onmouseover="return overlib('{$submenu|strip}',  STICKY, MOUSEOFF);" onmouseout="return nd();">
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
				{section name=i loop=$erros}
				{assign var="temp" value=$erros[i]}
					<li style="list-style:square">{$frase_erro[$temp]}</li>
				{/section}
			</div>
		{/if}