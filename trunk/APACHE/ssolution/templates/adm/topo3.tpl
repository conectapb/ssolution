<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Smart Solution - {$subtitulo}</title>

<script type="text/javascript" src="{$tpl_dir_adm}drop_down.js"></script>
<script language="javascript" src="{$tpl_dir}/js/jquery.js"></script>
<script>
    {literal}
    var name = "#menu";
    var name2 = "#menu-aba";
    var menuYloc = null;

    $(document).ready(function(){
        menuYloc = parseInt($(name).css("top").substring(0,$(name).css("top").indexOf("px")));
        $(window).scroll(function () {
            var offset = menuYloc+$(document).scrollTop()+"px";
            $(name).animate({top:offset},{duration:500,queue:false});
            $(name2).animate({top:offset},{duration:500,queue:false});
        });

        $('#menu-aba-img').click(function(){$('#menu').toggle();});
    });

    {/literal}
</script>

<link href="{$tpl_adm_style}" rel="stylesheet" type="text/css" />
<link href="{$tpl_dir_adm}tablesorter.css" rel="stylesheet" type="text/css" />

</head>

<body>

<div id="template_sel" style="position:absolute; right:10px; top:10px;">
<form name="tpl" action="{$SCRIPT_NAME}?{$querystring}" id="tpl" method="post">
<input type="hidden" name="tpl_adm" />
<select name="tpl_sel" onchange="document.tpl.tpl_adm.value=this.value; document.tpl.submit();">
	<option value="1">Template 1</option>
	<option value="2">Template 2</option>
    <option value="3">Template 3</option>
</select>
</form>
<script>document.tpl.tpl_sel.value="{$tpl_adm}";</script>
</div>

<div id="menu-aba">
    <img id="menu-aba-img" src="{$tpl_dir}/images/menu-aba.png">
</div>

<div id="menu">
{if $funcoes!=""}
<ul id="nav">
{section name=i loop=$funcoes}
	<li><a href="{$funcoes[i].link}">{$funcoes[i].nome}</a>
		<ul>
		{section name=j loop=$funcoes[i].filhos}
			<li><a href="{$funcoes[i].filhos[j].link}">{$funcoes[i].filhos[j].nome}</a></li>
		{/section}
		</ul>
	</li>
{/section}
	<li><a href="sair.php">Sair</a></li>
    <li><a href="#" onclick="$('#menu').toggle();">Ocultar</a></li>
</ul>
{/if}
</div>

<div id="topo" style="border:0px red solid;">
	<div id="titulo" style="border:0px yellow solid;">Sistema Administrativo Smart Solution</div>
</div>

<div id="conteudo" style="border:0px blue solid;">

    {if $subtitulo!=""}
	<div id="subtitulo">
		<img src="{$tpl_dir}/images/subtitulo.png" alt="{$funcoes[i].nome}" width="16" height="16" hspace="5" border="0" align="absmiddle" />{$subtitulo}
	</div>
	<br />
    {/if}

   	<div id="mensagem" style="display:none;">
    {if $msg<>""}
        {$msg}
        <script>document.getElementById("mensagem").style.display="block";</script>
    {/if}
    </div>

    <div id="erro" style="display:none;">Ocorreram os seguintes erros:
    {if $erros.fatal<>""}{section name=i loop=$erros.fatal}
        <li style="list-style:square">{$erros.fatal[i]}</li>
    {/section}
		<script>document.getElementById("erro").style.display="block";</script>
    {/if}
	</div>

	<div id="alerta" style="display:none;">
    {if $erros.alerta<>""}
		<script>document.getElementById("alerta").style.display="block";</script>
		O sistema retornou os seguintes alertas:
		{section name=i loop=$erros.alerta}<li style="list-style:square">{$erros.alerta[i]}</li>{/section}
    {/if}
	</div>
    