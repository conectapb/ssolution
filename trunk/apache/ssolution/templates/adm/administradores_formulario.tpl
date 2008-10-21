{include file=$tpl_adm_topo}

<br />

<table>
<form name="frm" action="{$SCRIPT_NAME}" method="post" enctype="multipart/form-data">
<input type="hidden" name="processa" value="ok" />
<input type="hidden" name="modo" value="{$modo}" />
<input type="hidden" name="id" value="{$id}" />
	
	<tr>
		<td class="rotulos">Login :</td>
		<td><input type="text" name="login_form" value="{$login_form}" style="width:330px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Senha :</td>
		<td><input type="password" class="text_normal" name="senha_form" value="" style="width:330px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Nome :</td>
		<td><input type="text" class="text_normal" name="nome" value="{$nome}" style="width:330px;" /></td>
	</tr>
	
	<tr>
		<td>&nbsp;</td>
		<td align="center">
		{if $modo=="alt"}<input type="button" class="botao" value="Voltar" onClick="document.location='administradores.php'" />&nbsp;{/if}
		<input type="submit" class="botao" value="{$botao}" /></td>
	</tr>
</form>
</table>

{include file=$tpl_adm_rodape}