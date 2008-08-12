{include file="adm/topo.tpl"}

{literal}

<script>
function confirma(modelo,foto)
{
	if(confirm("Confirma exclusao da imagem?"))
	{
		teste = "{/literal}{$SCRIPT_NAME}{literal}?modo=exc&id=" + modelo + "&foto=" + foto;
		//alert(teste);
		document.location = teste;
	}
}
</script>

{/literal}

<table>
<form name="frm" method="post" enctype="multipart/form-data">
<input type="hidden" name="processa" value="ok">
	
	<tr>
		<td class="rotulos">Imagem 1:</td>
		<td class="campos"><input type="file" name="arquivo0"></td>
	</tr>
	<tr>
		<td class="rotulos">Imagem 2:</td>
		<td class="campos"><input type="file" name="arquivo1"></td>
	</tr>
	<tr>
		<td class="rotulos">Imagem 3:</td>
		<td class="campos"><input type="file" name="arquivo2"></td>
	</tr>
	<tr>
		<td class="rotulos">Imagem 4:</td>
		<td class="campos"><input type="file" name="arquivo3"></td>
	</tr>
	<tr>
		<td class="rotulos">Imagem 5:</td>
		<td class="campos"><input type="file" name="arquivo4"></td>
	</tr>
	<tr>
		<td class="rotulos">&nbsp;</td>
		<td class="campos"><input type="submit" value="Enviar"></td>
	</tr>
</form>
</table>

<table border="0" cellspacing="0" cellpadding="5" bgcolor="#f0f0f0">
	<tr>
{section name=i loop=$dados}

{if ($smarty.section.i.iteration-1)%4 == 0 && ($smarty.section.i.iteration-1) > 0}
	</tr>
	<tr> 
{/if}
		<td valign="top" align="center">
			<table align="center" cellpadding="0" cellspacing="0" border="0">
				<TR>
					<TD><font size="1"><font size="1"><b>Cadastrada em:</b>{$dados[i].data|date_format:"%d/%m/%Y"}</font></TD>
				</TR>
				<TR>
					<TD align="center"><img src="miniatura.php?imagem=../uploads/modelos/{$id}/{$dados[i].arquivo}" width="150" height="200" border="0" alt="$dados[i].legenda"/></TD>
				</TR>
				{if $dados[i].descricao != ""}
				<TR>
					<TD>{$dados[i].descricao}</TD>
				</TR>
				{/if}
				<TR>
					<TD align="right"><font size="1"><a href="javascript:confirma({$id},{$dados[i].id});">excluir</a></font></TD>
				</TR>
			</table>
		</td>
{/section}
	</tr>
</table>

{include file="adm/rodape.tpl"}