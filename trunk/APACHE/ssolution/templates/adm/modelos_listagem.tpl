{include file="adm/topo.tpl"}

{literal}
<script>
function chgVal($id,$op)
{
	$formulario = document.frm;
	if($op=="exc")
	{
		$formulario.modo.value="exc";
		$formulario.id.value=$id;
		if(confirm("Confirma Exclusão?"))
			$formulario.submit();
	}
	else if($op=="pen")
	{
		$formulario.modo.value="pen";
		$formulario.id.value=$id;
		$formulario.submit();
	}
	else
	{
		$formulario.modo.value="alt";
		$formulario.id.value=$id;
		$formulario.submit();
	}
}
function ressetForm(id_form)
{
	form = document.getElementById(id_form);
	for($i=0;$i<form.length-1;$i++)
	{
		if (form[$i].type=="text" || form[$i].type=="select-one")
		{
			form[$i].value="";
		}
		else
		{
			form[$i].checked=false;
		}
	}
}
function mostracampos(campo)
{
	cmp = document.getElementById(campo + "_div");
	cmp.style.display = "block";
	cmp2 = document.getElementById("abre_busca");
	cmp2.innerHTML = "<a href=\"javascript:escondecampos('busca');\"><font size=\"-1\"><strong>[ Contrair Busca ]</strong></font></a>";
}

function escondecampos(campo)
{
	cmp = document.getElementById(campo + "_div");
	cmp.style.display = "none";
	cmp2 = document.getElementById("abre_busca");
	cmp2.innerHTML = "<a href=\"javascript:mostracampos('busca');\"><font size=\"-1\"><strong>[ Expandir Busca ]</strong></font></a>";
}

</script>
{/literal}
{if $modo!=pen}
<br />
<span id="abre_busca"><a href="javascript:mostracampos('busca');"><font size="-1"><strong>[ Expandir Busca ]</strong></font></a></span>
<br /><br />

<div id="busca_div" style="border: 1px solid black; padding:5px; display:none;">
<table border="0" cellspacing="0" cellpadding="5">
<form name="busca" id="busca" method="post" action="{$SCRIPT_NAME}?modo={$modo}">
<script>frmbusca = document.busca;</script>
<tr>
	<td class="rotulos">Nome:</td>
		<td class="td_content">
			<input type="text" name="nome" value="{$values.nome}" class="" style="width:100%" />
		</td>
		
		<td rowspan="6" width="1" style=" border-right: 1px solid #000000;">&nbsp;</td>
		<td class="rotulos">&nbsp;</td>
		<td class="td_content">&nbsp;
			
		</td>
	</tr>
	<tr>
		<td class="rotulos">Sexo:</td>
		<td class="campos">
		<input type="radio" name="sexo" id="sexo_m" value="0" class="" style="" />
		<label for="sexo_m">Masculino</label>
		<input type="radio" name="sexo" id="sexo_f" value="1" class="" style="" />
		<label for="sexo_f">Feminino</label>		</td>
	</tr>
		<script>
		val="{$values.sexo}";
		if (val!="") frmbusca.sexo[val].checked=true;
		</script>
	<tr>
		<td class="rotulos">Idade</td>
		<td class="td_content">
			&nbsp;m&iacute;nima: <input type="text" name="idade_min" value="{$values.idade_min}" class="numeric" />
			&nbsp;m&aacute;xima: <input type="text" name="idade_max" value="{$values.idade_max}" class="numeric" />
		</td>
 
		<td class="rotulos">Cabelos</td>
		<td class="td_content">
			Tipo&nbsp;:
			<select name="cabelos_tipo" class="" style="" />
				<option value=""></option>
				<option value="0">Calvo</option>
				<option value="1">Lisos</option>
				<option value="2">Crespos</option>
				<option value="3">Ondulados</option>
				<option value="4">Cacheados</option>
			</select>
			<script>frmbusca.cabelos_tipo.value="{$values.cabelos_tipo}";</script>
			Cor&nbsp;:
			<select name="cabelos_cor" class="" style="" />
				<option value=""></option>
				<option value="0">Calvo</option>
				<option value="1">Castanho Claro</option>
				<option value="2">Castanho Escuro</option>
				<option value="3">Loiro Claro</option>
				<option value="4">Loiro Escuro</option>
				<option value="5">Ruivo</option>
				<option value="6">Preto</option>
				<option value="7">Branco</option>
			</select>
			<script>frmbusca.cabelos_cor.value="{$values.cabelos_cor}";</script>
		</td>
	</tr>
	<tr>
		<td class="rotulos">Altura</td>
		<td class="td_content">
			&nbsp;m&iacute;nima: <input type="text" name="altura_min" value="{$values.altura_min}" class="numeric" />
			&nbsp;m&aacute;xima: <input type="text" name="altura_max" value="{$values.altura_max}" class="numeric" />
		</td>
		<td class="rotulos">Olhos</td>
		<td>
			<select name="olhos" class="" style="" />
				<option value=""></option>
				<option value="0">Azuis</option>
				<option value="1">Verdes</option>
				<option value="2">Pretos</option>
				<option value="3">Castanhos</option>
				<option value="4">Mel</option>
			</select>
			<script>frmbusca.olhos.value="{$values.olhos}";</script>
		</td>
	</tr>
	<tr>
		<td class="rotulos">Peso</td>
		<td class="td_content">
			&nbsp;m&iacute;nimo: <input type="text" name="peso_min" value="{$values.peso_min}" class="numeric" />
			&nbsp;m&aacute;ximo: <input type="text" name="peso_max" value="{$values.peso_max}" class="numeric" />
		</td>
		<td class="rotulos">Cor da pele</td>
		<td>
			<select name="pele" class="" style="" />
				<option value=""></option>
				<option value="0">Branca/Caucasiana</option>
				<option value="1">Morena</option>
				<option value="2">Negra</option>
				<option value="3">Parda</option>
			</select>
			<script>frmbusca.pele.value="{$values.pele}";</script>
		</td>
	</tr>
	<tr>
		<td class="rotulos">Busto/T&oacute;rax</td>
		<td class="td_content">
			&nbsp;m&iacute;nimo: <input type="text" name="busto_min" value="{$values.busto_min}" class="numeric" />
			&nbsp;m&aacute;ximo: <input type="text" name="busto_max" value="{$values.busto_max}" class="numeric" />
		</td>
	</tr>
	<tr>
		<td class="rotulos">Cintura</td>
		<td class="td_content">
			&nbsp;m&iacute;nimo: <input type="text" name="cintura_min" value="{$values.cintura_min}" class="numeric" />
			&nbsp;m&aacute;ximo: <input type="text" name="cintura_max" value="{$values.cintura_max}" class="numeric" />
		</td>
	</tr>
	<tr>
		<td class="rotulos">Quadril</td>
		<td class="td_content">
			&nbsp;m&iacute;nimo: <input type="text" name="quadril_min" value="{$values.quadril_min}" class="numeric" />
			&nbsp;m&aacute;ximo: <input type="text" name="quadril_max" value="{$values.quadril_max}" class="numeric" />
		</td>
	</tr>
	<tr>
		<td colspan="5">
			<table>
				<tr>
					<td class="td_content"><input type="checkbox" name="semcache" value="1" id="semcache" /> <label for="semcache">Trabalha sem cache</td>
					<td class="td_content"><input type="checkbox" name="cachebaixo" value="1" id="cachebaixo" /> <label for="cachebaixo">Aceita cache baixo</td>
					<td class="td_content"><input type="checkbox" name="esporte" value="1" id="esporte" /> <label for="esporte">Pratica algum esporte</td>
					<script>
						frmbusca.semcache.checked="{$values.semcache}";
						frmbusca.cachebaixo.checked="{$values.cachebaixo}";
						frmbusca.esporte.checked="{$values.esporte}";
					</script>
				</tr>
				<tr>
					<td class="td_content"><input type="checkbox" name="cavalo" value="1" id="cavalo" /> <label for="cavalo">Monta a cavalo</td>
					<td class="td_content"><input type="checkbox" name="skate" value="1" id="skate" /> <label for="skate">Skate</td>
					<td class="td_content"><input type="checkbox" name="patins" value="1" id="patins" /> <label for="patins">Patins</td>
					<script>
						frmbusca.cavalo.checked="{$values.cavalo}";
						frmbusca.skate.checked="{$values.skate}";
						frmbusca.patins.checked="{$values.patins}";
					</script>
				</tr>
				<tr>
					<td class="td_content"><input type="checkbox" name="canta" value="1" id="canta" /> <label for="canta">Canta</td>
					<td class="td_content"><input type="checkbox" name="danca" value="1" id="danca" /> <label for="danca">Dan&ccedil;a</td>
					<td class="td_content"><input type="checkbox" name="atua" value="1" id="atua" /> <label for="atua">Atua</td>
					<script>
						frmbusca.canta.checked="{$values.canta}";
						frmbusca.danca.checked="{$values.danca}";
						frmbusca.atua.checked="{$values.atua}";
					</script>
				</tr>
				<tr>
					<td class="td_content"><input type="checkbox" name="drt" value="1" id="drt" /> <label for="drt">DRT</td>
					<td class="td_content"><input type="checkbox" name="fotos" value="1" id="fotos" /> <label for="fotos">Fotos</td>
					<td class="td_content"><input type="checkbox" name="comerciais" value="1" id="comerciais" /> <label for="comerciais">Comerciais</td>
					<script>
						frmbusca.drt.checked="{$values.drt}";
						frmbusca.fotos.checked="{$values.fotos}";
						frmbusca.comerciais.checked="{$values.comerciais}";
					</script>
				</tr>
				<tr>
					<td class="td_content"><input type="checkbox" name="figuracao" value="1" id="figuracao" /> <label for="figuracao">Figura&ccedil;&atilde;o</td>
					<td class="td_content"><input type="checkbox" name="biquini" value="1" id="biquini" /> <label for="biquini">Biquini/Sunga</td>
					<td class="td_content"><input type="checkbox" name="lingerie" value="1" id="lingerie" /> <label for="lingerie">Lingerie/Cueca</td>
					<script>
						frmbusca.figuracao.checked="{$values.figuracao}";
						frmbusca.biquini.checked="{$values.biquini}";
						frmbusca.lingerie.checked="{$values.lingerie}";
					</script>
				</tr>
				<tr>
					<td class="td_content"><input type="checkbox" name="seminu" value="1" id="seminu" /> <label for="seminu">Semi-n&uacute;</td>
					<td class="td_content"><input type="checkbox" name="nu" value="1" id="nu" /> <label for="nu">N&uacute;</td>
					<td class="td_content"><input type="checkbox" name="makingoff" value="1" id="makingoff" /> <label for="makingoff">Making-off</td>
					<script>
						frmbusca.seminu.checked="{$values.seminu}";
						frmbusca.nu.checked="{$values.nu}";
						frmbusca.makingoff.checked="{$values.makingoff}";
					</script>
				</tr>
				<tr>
					<td class="td_content"><input type="checkbox" name="jingles" value="1" id="jingles" /> <label for="jingles">Jingles</td>
					<td class="td_content"><input type="checkbox" name="videoclip" value="1" id="videoclip" /> <label for="videoclip">Video-clips</td>
					<td class="td_content"><input type="checkbox" name="promocao" value="1" id="promocao" /> <label for="promocao">Promo&ccedil;&atilde;o</td>
					<script>
						frmbusca.jingles.checked="{$values.jingles}";
						frmbusca.videoclip.checked="{$values.videoclip}";
						frmbusca.promocao.checked="{$values.promocao}";
					</script>
				</tr>
				<tr>
					<td class="td_content"><input type="checkbox" name="feiras" value="1" id="feiras" /> <label for="feiras">Feiras</td>
					<td class="td_content"><input type="checkbox" name="viagens_brasil" value="1" id="viagens_brasil" /> <label for="viagens_brasil">Viagens Nacional</td>
					<td class="td_content"><input type="checkbox" name="viagens_exterior" value="1" id="viagens_exterior" /> <label for="viagens_exterior">Viagens Internacional</td>
					<script>
						frmbusca.feiras.checked="{$values.feiras}";
						frmbusca.viagens_brasil.checked="{$values.viagens_brasil}";
						frmbusca.viagens_exterior.checked="{$values.viagens_exterior}";
					</script>
				</tr>
				<tr>
					<td class="td_content"><input type="checkbox" name="piercing" value="1" id="piercing" /> <label for="piercing">Piercing</td>
					<td class="td_content"><input type="checkbox" name="tatuagem" value="1" id="tatuagem" /> <label for="tatuagem">Tatuagem</td>
					<td class="td_content"><input type="checkbox" name="imagem" value="1" id="imagem" /> <label for="imagem">Possui imagem cadastrada</td>
					<script>
						frmbusca.piercing.checked="{$values.piercing}";
						frmbusca.tatuagem.checked="{$values.tatuagem}";
						frmbusca.imagem.checked="{$values.imagem}";
					</script>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="5" align="center">
			<input type="submit" value="Buscar" class="botao" />
			<input type="button" value="Limpar" class="botao" onclick="ressetForm('busca');" /></td>
	</tr>
</form>
</table>
</div>
<br />
{/if}
<table>
	{if $modo==pen}
	<tr>
		<td class="td_header" width="300" align="center"><a class="td_header" href="{$SCRIPT_NAME}?modo=lst&o=nome">Nome</a></td>
		<td class="td_header" width="100" align="center"><a class="td_header" href="{$SCRIPT_NAME}?modo=lst&o=nascimento">Nascimento</a></td>
		<td class="td_header" width="100" align="center"><a class="td_header" href="{$SCRIPT_NAME}?modo=lst&o=cadastro">Cadastro</a></td>
		<td class="td_header" width="60" align="center">Foto</td>
		<td>&nbsp;</td>
	</tr>
	{/if}
	{if $modo==lst}
	<tr>
		<td class="td_header" width="300" align="center"><a class="td_header" href="{$SCRIPT_NAME}?modo=lst&o=nome">Nome</a></td>
		<td class="td_header" width="100" align="center"><a class="td_header" href="{$SCRIPT_NAME}?modo=lst&o=nascimento">Nascimento</a></td>
		<td class="td_header" width="100" align="center"><a class="td_header" href="{$SCRIPT_NAME}?modo=lst&o=cadastro">Cadastro</a></td>
		<td class="td_header" width="60" align="center">Foto</td>
		<td class="td_header" width="60" align="center">Exibir</td>
		<td>&nbsp;</td>
	</tr>
	{/if}
	{if $modo==ens}
	<tr>
		<td class="td_header" width="300" align="center"><a class="td_header" href="{$SCRIPT_NAME}?modo=lst&o=nome">Nome</a></td>
		<td class="td_header" width="100" align="center"><a class="td_header" href="{$SCRIPT_NAME}?modo=lst&o=nascimento">Nascimento</a></td>
		<td class="td_header" width="100" align="center"><a class="td_header" href="{$SCRIPT_NAME}?modo=lst&o=cadastro">Cadastro</a></td>
		<td class="td_header" width="60" align="center">Foto</td>
		<td class="td_header" width="60" align="center">Exibir</td>
		<td>&nbsp;</td>
	</tr>
	{/if}
	<form name="frm" method="post" action="{$SCRIPT_NAME}">
	<input type="hidden" name="modo" value="" />
	<input type="hidden" name="id" value="" />
	{section name=i loop=$dados}
		{if $modo==lst}
	<tr bgcolor="{cycle values="#FFFFFF,#FAFAFA"}">
		<td class="td_content">{$dados[i].nome}</td>
		<td class="td_content" align="center">{$dados[i].nascimento|date_format:"%d/%m/%Y"}</td>
		<td class="td_content" align="center">{$dados[i].cadastro|date_format:"%d/%m/%Y"}</td>
		<td class="td_content" align="center">{if $dados[i].imagem!=""}Sim{else}N&atilde;o{/if}</td>
		<td class="td_content" align="center">{if $dados[i].exibir==1}Sim{else}N&atilde;o{/if}</td>
		<td>
			<img src="{$tpl_dir}/images/edit.png" alt="Alterar" border="0" width="16" height="16" align="absmiddle" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'alt');" />
			<img src="{$tpl_dir}/images/exclude.png" alt="Excluir" border="0" width="16" height="16" align="absmiddle" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'exc');" />
		</td>
	</tr>
		{/if}
	{if $modo==ens}
	<tr bgcolor="{cycle values="#FFFFFF,#FAFAFA"}">
		<td class="td_content">{$dados[i].nome}</td>
		<td class="td_content" align="center">{$dados[i].nascimento|date_format:"%d/%m/%Y"}</td>
		<td class="td_content" align="center">{$dados[i].cadastro|date_format:"%d/%m/%Y"}</td>
		<td class="td_content" align="center">{if $dados[i].imagem!=""}Sim{else}N&atilde;o{/if}</td>
		<td class="td_content" align="center">{if $dados[i].exibir==1}Sim{else}N&atilde;o{/if}</td>
		<td>
			<img src="{$tpl_dir}/images/addfotos.png" alt="Adicionar Fotos" border="0" width="16" height="16" align="absmiddle" onmouseover="this.style.cursor='pointer';" onclick="document.location='ensaios.php?modo=cad&id={$dados[i].id}';" />
		</td>
	</tr>
		{/if}
		{if $modo==pen}
	<tr bgcolor="{cycle values="#FFFFFF,#FAFAFA"}">
		<td class="td_content">{$dados[i].nome}</td>
		<td class="td_content" align="center">{$dados[i].nascimento|date_format:"%d/%m/%Y"}</td>
		<td class="td_content" align="center">{$dados[i].cadastro|date_format:"%d/%m/%Y"}</td>
		<td class="td_content" align="center">{if $dados[i].imagem!=""}Sim{else}N&atilde;o{/if}</td>
		<td>
			<img src="{$tpl_dir}/images/addfotos.png" alt="Detalhes" border="0" width="16" height="16" align="absmiddle" onmouseover="this.style.cursor='pointer';" onclick="chgVal({$dados[i].id},'pen');" />
		</td>
	</tr>
		{/if}
	{sectionelse}
	<tr>
		<td colspan="5" align="center" class="td_content">Nenhum registro encontrado</td>
	</tr>
	{/section}
	{if $paginacao!=""}
	<tr>
		<TD colspan="5" align="center">
			<table align="center" cellpadding="0" cellspacing="5">
				<TR>
					<TD align="center">P&#225;ginas: </TD>
				{section name=j loop=$paginacao}
					<TD align="center">
					
					{if $smarty.get.pag==$paginacao[j]}
						<strong>{$paginacao[j]}</strong>
					{else}
						<a href="modelos.php?modo=lst&pag={$paginacao[j]}{$build_geturl}">{$paginacao[j]}</a>
					{/if}
					</TD>
				{/section}
				</TR>
			</table>
		</TD>
	</tr>
	{/if}
	</form>
</table>

{include file="adm/rodape.tpl"}