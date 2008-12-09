{include file="adm/topo.tpl}

{literal}
<script>
function chgVal($op)
{
	$formulario = document.frm;
	if($op=="rej")
	{
		$formulario.processa.value="rej";
		if(confirm("AVISO: Este cadastro será permanentemente removido. Confirma Exclusão?"))
			$formulario.submit();
	}
	else if($op=="ace")
	{
		$formulario.processa.value="ace";
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
}

function escondecampos(campo)
{
	cmp = document.getElementById(campo + "_div");
	cmp.style.display = "none";
}
</script>

<script type='text/JavaScript' src='js/scw.js'></script>
{/literal}







<table width="800">

<form name="frm" action="{$SCRIPT_NAME}?modo={$modo}" method="post" enctype="multipart/form-data">
<input type="hidden" name="processa" value="ok">
<input type="hidden" name="id" value="{$valores.id}">

	<tr>
		<td class="rotulos">Exibir no site?</td>
		<td class="campos">
			<input type="radio" disabled="disabled" name="exibir" id="exibir_nao" value="0" class="" style="" />
			<label for="exibir_nao">N&atilde;o</label>
			<input type="radio" disabled="disabled" name="exibir" id="exibir_sim" value="1" class="" style="" />
			<label for="exibir_sim">Sim</label>&nbsp;
		</td>
	</tr>


	<tr>
		<td colspan="2" class="subtitulos">
			Dados Pessoais<br />
	    	<hr size="1" noshade="noshade" />
		</td>
	</tr>



	<tr>



		<td class="rotulos"width="50%">Nome completo:</td>



		<td class="campos" width="50%"><input name="nome" type="text" disabled="disabled" class="" style="" value="{$valores.nome}" size="45" /></td>



	</tr>



	<tr>



		<td class="rotulos">Sexo:</td>



		<td class="campos">



		<input type="radio" disabled="disabled" name="sexo" id="sexo_m" value="0" class="" style="" />



		<label for="sexo_m">Masculino</label>



		<input type="radio" disabled="disabled" name="sexo" id="sexo_f" value="1" class="" style="" />



		<label for="sexo_f">Feminino</label>		</td>



	</tr>



	<tr>



		<td class="rotulos">Data Nascimento:</td>



	  <td class="campos">

			<input type="text" disabled="disabled" name="nascimento" onclick="scwShow(this,this);" value="{$valores.nascimento|date_format:"%d/%m/%Y"}" class="" style="" />
		
		</td>



	</tr>



	<tr>



		<td class="rotulos">Filia&ccedil;&atilde;o:</td>



		<td class="campos"><input name="filiacao" type="text" disabled="disabled" class="" style="" value="{$valores.filiacao}" size="45" /></td>



	</tr>



	<tr>



		<td class="rotulos">Respons&aacute;vel:</td>



		<td class="campos"><input name="responsavel" type="text" disabled="disabled" class="" style="" value="{$valores.responsavel}" size="45" /></td>



	</tr>
	
	<tr>
		<td class="rotulos">Endere&ccedil;o:</td>
		<td class="campos"><input name="endereco" type="text" disabled="disabled" class="" style="" value="{$valores.endereco}" size="45" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Bairro / Cidade / Estado:</td>
		<td class="campos"><input name="bairro" type="text" disabled="disabled" class="" style="" value="{$valores.bairro}" size="45" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">CEP:</td>
		<td class="campos"><input name="cep" type="text" disabled="disabled" class="" style="" value="{$valores.cep}" size="45" /></td>
	</tr>

	<tr>



		<td class="rotulos">Telefone:</td>



		<td class="campos"><input type="text" disabled="disabled" name="telefone" value="{$valores.telefone}" class="" style="" /></td>



	</tr>



	<tr>



		<td class="rotulos">Celular:</td>



		<td class="campos"><input type="text" disabled="disabled" name="celular" value="{$valores.celular}" class="" style="" /></td>



	</tr>



	<tr>
		<td class="rotulos">E-mail:</td>
		<td class="campos"><input type="text" disabled="disabled" name="email" value="{$valores.email}" class="" style="" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">RG:</td>
		<td class="campos"><input type="text" disabled="disabled" name="rg" value="{$valores.rg}" class="" style="" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">CPF:</td>
		<td class="campos"><input type="text" disabled="disabled" name="cpf" value="{$valores.cpf}" class="" style="" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Telefone Recados:</td>
		<td class="campos"><input type="text" disabled="disabled" name="tel_recado" value="{$valores.tel_recado}" class="" style="" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">MSN:</td>
		<td class="campos"><input type="text" disabled="disabled" name="msn" value="{$valores.msn}" class="" style="" /></td>
	</tr>

	<tr>
		<td class="rotulos">Booker:</td>
		<td class="campos"><input name="booker" type="text" disabled="disabled" class="" style="" value="{$valores.booker}" size="45" /></td>
	</tr>
	
	<tr>



		<td class="rotulos">Data Cadastro na Ag&ecirc;ncia:</td>



	  <td class="campos">

			<input type="text" disabled="disabled" name="cadastro" onclick= "scwShow(this,this)" onfocus="scwShow(this,this)" value="{$valores.cadastro|date_format:"%d/%m/%Y"}" class="" style="" />
		
		</td>



	</tr>

	<tr>



		<td colspan="2" class="subtitulos">Perfil<br />



	    <hr size="1" noshade="noshade" /></td>



	</tr>



	<tr>



		<td class="rotulos">Estaria disposto a trabalhar sem cache?</td>



		<td class="campos">



		<input type="radio" disabled="disabled" name="semcache" id="semcache_nao" value="0" class="" style="" />



		<label for="semcache_nao">N&atilde;o</label>



		<input type="radio" disabled="disabled" name="semcache" id="semcache_sim" value="1" class="" style="" />



		<label for="semcache_sim">Sim</label>



&nbsp;		</td>



	</tr>



	<tr>
		<td class="rotulos">Estaria disposto a trabalhar com cache baixo?</td>
		<td class="campos">
		<input type="radio" disabled="disabled" name="cachebaixo" id="cachebaixo_nao" value="0" class="" style="" onClick="escondecampos('cachebaixo');" />
		<label for="cachebaixo_nao">N&atilde;o</label>
		<input type="radio" disabled="disabled" name="cachebaixo" id="cachebaixo_sim" value="1" class="" style="" onClick="mostracampos('cachebaixo');" />
		<label for="cachebaixo_sim">Sim</label>
		<div id="cachebaixo_div" style="display:none">
			<span class="rotulos">Quanto:</span>
			&nbsp;
			<input type="text" disabled="disabled" name="cachebaixo_quanto" value="{$valores.cachebaixo_quanto}" class="" style="" />
		</div>
		</td>
	</tr>



	<tr>
		<td class="rotulos" valign="top">Pratica algum esporte?</td>
		<td class="campos">
		<input type="radio" disabled="disabled" name="esporte" id="esporte_nao" value="0" class="" style="" onClick="escondecampos('esporte');" />
		<label for="esporte_nao">N&atilde;o</label>
		<input type="radio" disabled="disabled" name="esporte" id="esporte_sim" value="1" class="" style="" onClick="mostracampos('esporte');" />
		<label for="esporte_sim">Sim</label>
		<div id="esporte_div" style="display:none">
			<span class="rotulos">Qual ?</span>
			&nbsp;
			<input type="text" disabled="disabled" name="esporte_qual" value="{$valores.esporte_qual}" class="" style="" />
		</div>		</td>
	</tr>

	<tr>
		<td class="rotulos">Monta a cavalo?</td>
		<td class="campos">
		<input type="radio" disabled="disabled" name="cavalo" id="cavalo_nao" value="0" class="" style="" />
		<label for="cavalo_nao">N&atilde;o</label>
		<input type="radio" disabled="disabled" name="cavalo" id="cavalo_sim" value="1" class="" style="" />
		<label for="cavalo_sim">Sim</label>		</td>
	</tr>



	<tr>
		<td class="rotulos">Skate?</td>
		<td class="campos">
		<input type="radio" disabled="disabled" name="skate" id="skate_nao" value="skate_nao" class="0" style="" />
		<label for="skate_nao">N&atilde;o</label>
		<input type="radio" disabled="disabled" name="skate" id="skate_sim" value="1" class="" style="" />
		<label for="skate_sim">Sim</label>		</td>
	</tr>



	<tr>
		<td class="rotulos">Patins?</td>
		<td class="campos">
		<input type="radio" disabled="disabled" name="patins" id="patins_nao" value="0" class="" style="" />
		<label for="patins_nao">N&atilde;o</label>
		<input type="radio" disabled="disabled" name="patins" id="patins_sim" value="1" class="" style="" />
		<label for="patins_sim">Sim</label>		</td>
	</tr>

	<tr>
		<td class="rotulos" valign="top">Toca algum instrumento?</td>
		<td class="campos">
		<input type="radio" disabled="disabled" name="instrumento" id="instrumento_nao" value="0" class="" style="" onClick="escondecampos('instrumento');" />
		<label for="instrumento_nao">N&atilde;o</label>
		<input type="radio" disabled="disabled" name="instrumento" id="instrumento_sim" value="1" class="" style="" onClick="mostracampos('instrumento');" />
		<label for="instrumento_sim">Sim</label>
		<div id="instrumento_div" style="display:none">
			<span class="rotulos">Qual ?</span>
			&nbsp;
			<input type="text" disabled="disabled" name="instrumento_qual" value="{$valores.instrumento_qual}" class="" style="" />
		</div>		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Moda?</td>
		<td class="campos">
		<input type="radio" disabled="disabled" name="moda" id="moda_nao" value="0" class="" style="" />
		<label for="moda_nao">N&atilde;o</label>
		<input type="radio" disabled="disabled" name="moda" id="moda_sim" value="1" class="" style="" />
		<label for="moda_sim">Sim</label>		</td>
	</tr>
		
	<tr>
		<td class="rotulos">Perfil?</td>
		<td class="campos">
		<input type="radio" disabled="disabled" name="perfil" id="perfil_nao" value="0" class="" style="" />
		<label for="perfil_nao">N&atilde;o</label>
		<input type="radio" disabled="disabled" name="perfil" id="perfil_sim" value="1" class="" style="" />
		<label for="perfil_sim">Sim</label>		</td>
	</tr>

	<tr>
		<td class="rotulos">Canta?</td>
		<td class="campos">
		<input type="radio" disabled="disabled" name="canta" id="canta_nao" value="0" class="" style="" />
		<label for="canta_nao">N&atilde;o</label>
		<input type="radio" disabled="disabled" name="canta" id="canta_sim" value="1" class="" style="" />
		<label for="canta_sim">Sim</label>		</td>
	</tr>



	<tr>
		<td class="rotulos">Dan&ccedil;a?</td>
		<td class="campos">
			<input type="radio" disabled="disabled" name="danca" id="danca_nao" value="0" class="" style="" onClick="escondecampos('danca');"  />
			<label for="danca_nao">N&atilde;o</label>
			<input type="radio" disabled="disabled" name="danca" id="danca_sim" value="1" class="" style="" onClick="mostracampos('danca');" />
			<label for="danca_sim">Sim</label>
			<div id="danca_div" style="display:none;">
				<table>
				<tr>
					<td class="rotulos">O que?</td>
					<td class="campos"><input type="text" disabled="disabled" name="danca_oque" value="{$valores.danca_oque}" class="" style="" /></td>
				</tr>
				</table>
			</div>
		</td>
	</tr>



	<tr>
		<td class="rotulos">Atua?</td>
		<td class="campos">
			<input type="radio" disabled="disabled" name="atua" id="atua_nao" value="0" class="" style="" />
			<label for="atua_nao">N&atilde;o</label>
			<input type="radio" disabled="disabled" name="atua" id="atua_sim" value="1" class="" style="" />
			<label for="atua_sim">Sim</label>
		</td>
	</tr>



	<tr>
		<td class="rotulos" valign="top">Possui DRT?</td>
		<td class="campos">
			<input type="radio" disabled="disabled" name="drt" id="drt_nao" value="0" class="" style="" onClick="escondecampos('drt');" />
			<label for="drt_nao">N&atilde;o</label>
			<input type="radio" disabled="disabled" name="drt" id="drt_sim" value="1" class="" style="" onClick="mostracampos('drt');" />
			<label for="drt_sim">Sim</label>
			<div id="drt_div" style="display:none;">
				<table>
				<tr>
					<td class="rotulos">N&uacute;mero:</td>
					<td class="campos"><input type="text" disabled="disabled" name="drt_numero" value="{$valores.drt_numero}" class="" style="" /></td>
				</tr>
				</table>
			</div>
		</td>
	</tr>



	<tr>



		<td colspan="2" class="subtitulos">Disponibilidade:<br />



	    <hr size="1" noshade="noshade" /></td>



	</tr>



	<tr>



		<td class="rotulos">Fotos:</td>



		<td class="campos">



		<input type="radio" disabled="disabled" name="fotos" id="fotos_nao" value="0" class="" style="" />



		<label for="fotos_nao">N&atilde;o</label>



		<input type="radio" disabled="disabled" name="fotos" id="fotos_sim" value="1" class="" style="" />



		<label for="fotos_sim">Sim</label>		</td>



	</tr>



	<tr>



		<td class="rotulos">Comerciais:</td>



		<td class="campos">



		<input type="radio" disabled="disabled" name="comerciais" id="comerciais_nao" value="0" class="" style="" />



		<label for="comerciais_nao">N&atilde;o</label>



		<input type="radio" disabled="disabled" name="comerciais" id="comerciais_sim" value="1" class="" style="" />



		<label for="comerciais_sim">Sim</label>		</td>



	</tr>



	<tr>



		<td class="rotulos">Figura&ccedil;&atilde;o:</td>



		<td class="campos">



		<input type="radio" disabled="disabled" name="figuracao" id="figuracao_nao" value="0" class="" style="" />



		<label for="figuracao_nao">N&atilde;o</label>



		<input type="radio" disabled="disabled" name="figuracao" id="figuracao_sim" value="1" class="" style="" />



		<label for="figuracao_sim">Sim</label>		</td>



	</tr>



	<tr>



		<td class="rotulos">Biquini/Sunga:</td>



		<td class="campos">



		<input type="radio" disabled="disabled" name="biquini" id="biquini_nao" value="0" class="" style="" />



		<label for="biquini_nao">N&atilde;o</label>



		<input type="radio" disabled="disabled" name="biquini" id="biquini_sim" value="1" class="" style="" />



		<label for="biquini_sim">Sim</label>		</td>



	</tr>



	<tr>



		<td class="rotulos">Lingerie/Cueca:</td>



		<td class="campos">



		<input type="radio" disabled="disabled" name="lingerie" id="lingerie_nao" value="0" class="" style="" />



		<label for="lingerie_nao">N&atilde;o</label>



		<input type="radio" disabled="disabled" name="lingerie" id="lingerie_sim" value="1" class="" style="" />



		<label for="lingerie_sim">Sim</label>		</td>



	</tr>



	<tr>



		<td class="rotulos">Semi-n&uacute;:</td>



		<td class="campos">



		<input type="radio" disabled="disabled" name="seminu" id="seminu_nao" value="0" class="" style="" />



		<label for="seminu_nao">N&atilde;o</label>



		<input type="radio" disabled="disabled" name="seminu" id="seminu_sim" value="1" class="" style="" />



		<label for="seminu_sim">Sim</label>		</td>



	</tr>



	<tr>



		<td class="rotulos">N&uacute;:</td>



		<td class="campos">



		<input type="radio" disabled="disabled" name="nu" id="nu_nao" value="0" class="" style="" />



		<label for="nu_nao">N&atilde;o</label>



		<input type="radio" disabled="disabled" name="nu" id="nu_sim" value="1" class="" style="" />



		<label for="nu_sim">Sim</label>		</td>



	</tr>



	<tr>



		<td class="rotulos">Making-off:</td>



		<td class="campos">



		<input type="radio" disabled="disabled" name="makingoff" id="makingoff_nao" value="0" class="" style="" />



		<label for="makingoff_nao">N&atilde;o</label>



		<input type="radio" disabled="disabled" name="makingoff" id="makingoff_sim" value="1" class="" style="" />



		<label for="makingoff_sim">Sim</label>		</td>



	</tr>



	<tr>



		<td class="rotulos">Jingles:</td>



		<td class="campos">



		<input type="radio" disabled="disabled" name="jingles" id="jingles_nao" value="0" class="" style="" />



		<label for="jingles_nao">N&atilde;o</label>



		<input type="radio" disabled="disabled" name="jingles" id="jingles_sim" value="1" class="" style="" />



		<label for="jingles_sim">Sim</label>		</td>



	</tr>



	<tr>



		<td class="rotulos">Video-clips:</td>



		<td class="campos">



		<input type="radio" disabled="disabled" name="videoclip" id="videoclip_nao" value="0" class="" style="" />



		<label for="videoclip_nao">N&atilde;o</label>



		<input type="radio" disabled="disabled" name="videoclip" id="videoclip_sim" value="1" class="" style="" />



		<label for="videoclip_sim">Sim</label>		</td>



	</tr>



	<tr>



		<td class="rotulos">Promo&ccedil;&atilde;o:</td>



		<td class="campos">



		<input type="radio" disabled="disabled" name="promocao" id="promocao_nao" value="0" class="" style="" />



		<label for="promocao_nao">N&atilde;o</label>



		<input type="radio" disabled="disabled" name="promocao" id="promocao_sim" value="1" class="" style="" />



		<label for="promocao_sim">Sim</label>		</td>



	</tr>



	<tr>
		<td class="rotulos">Feiras:</td>
		<td class="campos">
		<input type="radio" disabled="disabled" name="feiras" id="feiras_nao" value="0" class="" style="" />
		<label for="feiras_nao">N&atilde;o</label>
		<input type="radio" disabled="disabled" name="feiras" id="feiras_sim" value="1" class="" style="" />
		<label for="feiras_sim">Sim</label>		</td>
	</tr>

	<tr>
		<td class="rotulos">Viagens:</td>
		<td class="campos">
		<input type="radio" disabled="disabled" name="viagens" id="viagens_nao" value="0" class="" style="" onClick="escondecampos('viagens');" />
		<label for="viagens_nao">N&atilde;o</label>
		<input type="radio" disabled="disabled" name="viagens" id="viagens_sim" value="1" class="" style="" onClick="mostracampos('viagens');" />
		<label for="viagens_sim">Sim</label>
		<div id="viagens_div" style="display:none;">
			<input type="checkbox" name="viagens_brasil" id="viagens_brasil" value="1" class="" style="" />
			<label for="viagens_brasil">Brasil</label>
			&nbsp;
			<input type="checkbox" name="viagens_exterior" id="viagens_exterior" value="1" class="" style="" />
			<label for="viagens_exterior">Exterior</label>
		</div>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Elenco de Apoio:</td>
		<td class="campos">
		<input type="radio" disabled="disabled" name="elencoapoio" id="elencoapoio_nao" value="0" class="" style="" />
		<label for="elencoapoio_nao">N&atilde;o</label>
		<input type="radio" disabled="disabled" name="elencoapoio" id="elencoapoio_sim" value="1" class="" style="" />
		<label for="elencoapoio_sim">Sim</label>		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Recep&ccedil;&atilde;o:</td>
		<td class="campos">
		<input type="radio" disabled="disabled" name="recepcao" id="recepcao_nao" value="0" class="" style="" />
		<label for="recepcao_nao">N&atilde;o</label>
		<input type="radio" disabled="disabled" name="recepcao" id="recepcao_sim" value="1" class="" style="" />
		<label for="recepcao_sim">Sim</label>		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Sampling:</td>
		<td class="campos">
		<input type="radio" disabled="disabled" name="sampling" id="sampling_nao" value="0" class="" style="" />
		<label for="sampling_nao">N&atilde;o</label>
		<input type="radio" disabled="disabled" name="sampling" id="sampling_sim" value="1" class="" style="" />
		<label for="sampling_sim">Sim</label>		</td>
	</tr>
	
	<tr>
		<td colspan="2" class="subtitulos">Idiomas<br />
	    <hr size="1" noshade="noshade" /></td>
	</tr>



	<tr>
		<td class="rotulos">Ingl&ecirc;s:</td>
		<td class="campos">
			<select disabled="disabled" name="ingles">
				<option value=""></option>
				<option value="4">Fluente</option>
				<option value="3">Intermedi&aacute;rio</option>
				<option value="2">B&aacute;sico</option>
				<option value="1">No&ccedil;&otilde;es</option>
				<option value="0">Desconhece</option>
			</select>
		</td>
	</tr>



	<tr>



		<td class="rotulos">Franc&ecirc;s:</td>



		<td class="campos">



			<select disabled="disabled" name="frances">



				<option value=""></option>



				<option value="4">Fluente</option>



				<option value="3">Intermedi&aacute;rio</option>



				<option value="2">B&aacute;sico</option>



				<option value="1">No&ccedil;&otilde;es</option>



				<option value="0">Desconhece</option>



			</select>		</td>



	</tr>



	<tr>



		<td class="rotulos">Espanhol:</td>



		<td class="campos">



			<select disabled="disabled" name="espanhol">



				<option value=""></option>



				<option value="4">Fluente</option>



				<option value="3">Intermedi&aacute;rio</option>



				<option value="2">B&aacute;sico</option>



				<option value="1">No&ccedil;&otilde;es</option>



				<option value="0">Desconhece</option>



			</select>		</td>



	</tr>



	<tr>



		<td class="rotulos">Italiano:</td>



		<td class="campos">



			<select disabled="disabled" name="italiano">



				<option value=""></option>



				<option value="4">Fluente</option>



				<option value="3">Intermedi&aacute;rio</option>



				<option value="2">B&aacute;sico</option>



				<option value="1">No&ccedil;&otilde;es</option>



				<option value="0">Desconhece</option>



			</select>		</td>



	</tr>



	<tr>



		<td class="rotulos">Alem&atilde;o:</td>



		<td class="campos">



			<select disabled="disabled" name="alemao">



				<option value=""></option>



				<option value="4">Fluente</option>



				<option value="3">Intermedi&aacute;rio</option>



				<option value="2">B&aacute;sico</option>



				<option value="1">No&ccedil;&otilde;es</option>



				<option value="0">Desconhece</option>



			</select>		</td>



	</tr>



	<tr>
		<td colspan="2" class="subtitulos">Dados F&iacute;sicos e Dados Complementares<br />
	    <hr size="1" noshade="noshade" /></td>
	</tr>



	<tr>



		<td class="rotulos">Altura:</td>



		<td class="campos"><input size="5" type="text" disabled="disabled" name="altura" value="{$valores.altura|replace:".":","}" class="" style="" /></td>



	</tr>



	<tr>



		<td class="rotulos">Peso:</td>



		<td class="campos"><input size="5" type="text" disabled="disabled" name="peso" value="{$valores.peso|replace:".":","}" class="" style="" /></td>



	</tr>



	<tr>



		<td class="rotulos">Busto/Torax:</td>



		<td class="campos"><input size="5" type="text" disabled="disabled" name="busto" value="{$valores.busto|replace:".":","}" class="" style="" /></td>



	</tr>



	<tr>



		<td class="rotulos">Cintura:</td>



		<td class="campos"><input size="5" type="text" disabled="disabled" name="cintura" value="{$valores.cintura|replace:".":","}" class="" style="" /></td>



	</tr>



	<tr>



		<td class="rotulos">Quadril:</td>



		<td class="campos"><input size="5" type="text" disabled="disabled" name="quadril" value="{$valores.quadril|replace:".":","}" class="" style="" /></td>



	</tr>



	<tr>



		<td class="rotulos">M&atilde;os:</td>



		<td class="campos"><input type="text" disabled="disabled" name="maos" value="{$valores.maos}" class="" style="" /></td>



	</tr>



	<tr>



		<td class="rotulos" valign="middle">Cabelos:</td>



		<td class="campos">



			<table width="100%" border="0" cellspacing="1" cellpadding="1">



              <tr>



                <td width="8%" class="rotulos">Tipo: </td>



                <td width="92%">



					<select disabled="disabled" name="cabelos_tipo" class="" style="" />



					<option value=""></option>



					<option value="0">Calvo</option>



					<option value="1">Lisos</option>



					<option value="2">Crespos</option>



					<option value="3">Ondulados</option>



					<option value="4">Cacheados</option>



					</select>



				</td>



              </tr>



              <tr>



                <td class="rotulos">Cor: </td>



                <td>



				<select disabled="disabled" name="cabelos_cor" class="" style="" />



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



				</td>



              </tr>



          </table>



			<span class="rotulos"></span>



			



			<span></span>



	  </td>



	</tr>



	<tr>
		<td class="rotulos">Olhos:</td>
		<td class="campos">
			<select disabled="disabled" name="olhos" class="" style="" />
				<option value=""></option>
				<option value="0">Azuis</option>
				<option value="1">Verdes</option>
				<option value="2">Pretos</option>
				<option value="3">Castanhos</option>
				<option value="4">Mel</option>
			</select>
		</td>
	</tr>

	<tr>



		<td class="rotulos">Cor da pele:</td>



		<td class="campos">



			<select disabled="disabled" name="pele" class="" style="" />



				<option value=""></option>



				<option value="0">Branca/Caucasiana</option>



				<option value="1">Morena</option>



				<option value="2">Negra</option>



				<option value="3">Parda</option>



			</select>		</td>



	</tr>



	<tr>



		<td class="rotulos">Sapato:</td>



		<td class="campos"><input size="5" type="text" disabled="disabled" name="sapato" value="{$valores.sapato}" class="" style="" /></td>



	</tr>



	<tr>



		<td class="rotulos">P&eacute;s:</td>



		<td class="campos"><input type="text" disabled="disabled" name="pes" value="{$valores.pes}" class="" style="" /></td>



	</tr>



	<tr>



		<td class="rotulos">Manequim:</td>



		<td class="campos"><input size="5" type="text" disabled="disabled" name="manequim" value="{$valores.manequim}" class="" style="" /></td>



	</tr>



	<tr>



		<td class="rotulos" valign="top">Piercing?</td>



		<td class="campos">



		<input type="radio" disabled="disabled" name="piercing" id="piercing_nao" value="0" class="" style="" onClick="escondecampos('piercing');" />



		<label for="piercing_nao">N&atilde;o</label>



		<input type="radio" disabled="disabled" name="piercing" id="piercing_sim" value="1" class="" style="" onClick="mostracampos('piercing');" />



		<label for="piercing_sim">Sim</label>



		<div id="piercing_div" style="display:none;">



			<table>



				<tr>



					<td class="rotulos">Quantos ?</td>



					<td class="campos"><input type="text" disabled="disabled" name="piercing_quantos" value="{$valores.piercing_quantos}" class="" style="" /></td>



				</tr>



				<tr>



					<td class="rotulos">Onde ?</td>



					<td class="campos"><input type="text" disabled="disabled" name="piercing_onde" value="{$valores.piercing_onde}" class="" style="" /></td>



				</tr>



			</table>



		</div>		</td>



	</tr>



	<tr>



		<td class="rotulos" valign="top">Tatuagem?</td>



		<td class="campos">



		<input type="radio" disabled="disabled" name="tatuagem" id="tatuagem_nao" value="0" class="" style="" onClick="escondecampos('tatuagem');" />



		<label for="tatuagem_nao">N&atilde;o</label>



		<input type="radio" disabled="disabled" name="tatuagem" id="tatuagem_sim" value="1" class="" style="" onClick="mostracampos('tatuagem');" />



		<label for="tatuagem_sim">Sim</label>



		<div id="tatuagem_div" style="display:none;">



			<table>



				<tr>



					<td class="rotulos">Quantas ?</td>



					<td class="campos"><input type="text" disabled="disabled" name="tatuagem_quantas" value="{$valores.tatuagem_quantas}" class="" style="" /></td>



				</tr>



				<tr>



					<td class="rotulos">Onde ?</td>



					<td class="campos"><input type="text" disabled="disabled" name="tatuagem_onde" value="{$valores.tatuagem_onde}" class="" style="" /></td>



				</tr>



			</table>



		</div>		</td>



	</tr>
	
	<tr>
		<td class="rotulos">Possui material fotogr&aacute;fico?</td>
		<td class="campos">
		<input type="radio" disabled="disabled" name="mat_fotog" id="mat_fotog_nao" value="0" class="" style="" onClick="escondecampos('mat_fotog');" />
		<label for="mat_fotog_nao">N&atilde;o</label>
		<input type="radio" disabled="disabled" name="mat_fotog" id="mat_fotog_sim" value="1" class="" style="" onClick="mostracampos('mat_fotog');" />
		<label for="mat_fotog_sim">Sim</label>
		<div id="mat_fotog_div" style="display:none;">
			<table border="0" cellpadding="0" cellspacing="2">
			<tr>
				<td>
			<input type="checkbox" name="mat_fotog_book" value="1" class="" style="" />
			<label for="mat_fotog_book">Book</label>
				</td>
				<td>
			<input type="checkbox" name="mat_fotog_ensaio" value="1" class="" style="" />
			<label for="mat_fotog_ensaio">Ensaio</label>
				</td>
				<td>
			<input type="checkbox" name="mat_fotog_fotocad" value="1" class="" style="" />
			<label for="mat_fotog_fotocad">Foto Cadastro</label>
				</td>
			</tr>
			<tr>
				<td>
			<input type="checkbox" name="mat_fotog_composite" value="1" class="" style="" />
			<label for="mat_fotog_composite">Composite</label>
				</td>
				<td>
			<input type="checkbox" name="mat_fotog_videobook" value="1" class="" style="" />
			<label for="mat_fotog_videobook">Videobook</label>
				</td>
				<td>
			<input type="checkbox" name="mat_fotog_outros" value="1" class="" style="" />
			<label for="mat_fotog_outros">Outros</label>
				</td>
			</tr>
			</table>
		</div>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Fez curso na ag&ecirc;ncia?</td>
		<td class="campos">
		<input type="radio" disabled="disabled" name="fezcursoagencia" id="fezcursoagencia_nao" value="0" class="" style="" />
		<label for="fezcursoagencia_nao">N&atilde;o</label>
		<input type="radio" disabled="disabled" name="fezcursoagencia" id="fezcursoagencia_sim" value="1" class="" style="" />
		<label for="fezcursoagencia_sim">Sim</label>		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Fez Workshop?</td>
		<td class="campos">
		<input type="radio" disabled="disabled" name="fezworkshop" id="fezworkshop_nao" value="0" class="" style="" />
		<label for="fezworkshop_nao">N&atilde;o</label>
		<input type="radio" disabled="disabled" name="fezworkshop" id="fezworkshop_sim" value="1" class="" style="" />
		<label for="fezworkshop_sim">Sim</label>		</td>
	</tr>

	<tr>
		<td class="rotulos" valign="top">Observa&ccedil;&otilde;es:</td>
		<td>
			<textarea disabled="disabled" name="observacoes" class="" style="">{$valores.observacoes}</textarea>
		</td>
	</tr>

	{if $valores.imagem!=""}
	<tr>
		<td class="rotulos" valign="top">Imagem (opcional):</td>
		<td>&nbsp;</td>
	</tr>

	<tr>
	  <td colspan="2" class="rotulos">
		<table width="768" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>
					<img src="../uploads/modelos/{$valores.imagem}" />
				</td>
			</tr>
			<tr>
				<td>
					<input disabled="disabled" name="imagem_action" id="imagem_action_0" type="radio" value="0" checked="checked" onclick="document.frm.imagem.disabled=true;" />
					<label for="imagem_action_0">N&atilde;o alterar</label>
					<input disabled="disabled" name="imagem_action" id="imagem_action_1" type="radio" value="1" onclick="document.frm.imagem.disabled=false;" />
					<label for="imagem_action_1">Alterar</label>
					<input disabled="disabled" name="imagem_action" id="imagem_action_2" type="radio" value="2" onclick="document.frm.imagem.disabled=true;" />
					<label for="imagem_action_2">Excluir</label>
					<br />
					<input type="file" name="imagem" disabled="disabled" />          
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
	  </td>
    </tr>
	
	<tr>
		<td class="rotulos">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	{else}
	<input type="hidden" name="imagem_action" value="1" />
	<tr>
		<td class="rotulos">Imagem (opcional):</td>
		<td><input type="file" name="imagem" /></td>
	</tr>
	{/if}
	</tr>
	
	<tr>
		<td colspan="2">
		  <div align="center">
		    <input type="button" value="Aceitar" onclick="chgVal('ace');">
			<input type="button" value="Rejeitar" onclick="chgVal('rej');">
          </div>
		</td>
	</tr>



</form>



</table>







<script>



	a = document.frm;



	// REMARCAR AS CHECKBOXES


	val="{$valores.exibir}";
	if (val!="") a.exibir[val].checked=true;
	else a.exibir[0].checked=true;

	val="{$valores.sexo}";
	if (val!="") a.sexo[val].checked=true;
	
	val="{$valores.semcache}";
	if (val!="") a.semcache[val].checked=true;

	val="{$valores.cachebaixo}";
	if (val!="") a.cachebaixo[val].checked=true;
	if (a.cachebaixo[1].checked) mostracampos("cachebaixo");

	val="{$valores.esporte}";
	if (val!="") a.esporte[val].checked=true;
	if (a.esporte[1].checked) mostracampos("esporte");

	val="{$valores.cavalo}";
	if (val!="") a.cavalo[val].checked=true;

	val="{$valores.skate}";
	if (val!="") a.skate[val].checked=true;

	val="{$valores.patins}";
	if (val!="") a.patins[val].checked=true;
	
	val="{$valores.instrumento}";
	if (val!="") a.instrumento[val].checked=true;
	if (a.instrumento[1].checked) mostracampos("instrumento");
	
	val="{$valores.moda}";
	if (val!="") a.moda[val].checked=true;
	
	val="{$valores.perfil}";
	if (val!="") a.perfil[val].checked=true;

	val="{$valores.canta}";
	if (val!="") a.canta[val].checked=true;

	val="{$valores.danca}";
	if (val!="") a.danca[val].checked=true;
	if (a.danca[1].checked) mostracampos("danca");

	val="{$valores.atua}";
	if (val!="") a.atua[val].checked=true;

	val="{$valores.drt}";
	if (val!="") a.drt[val].checked=true;
	if (a.drt[1].checked) mostracampos("drt");

	val="{$valores.fotos}";
	if (val!="") a.fotos[val].checked=true;

	val="{$valores.comerciais}";
	if (val!="") a.comerciais[val].checked=true;

	val="{$valores.figuracao}";
	if (val!="") a.figuracao[val].checked=true;

	val="{$valores.biquini}";
	if (val!="") a.biquini[val].checked=true;

	val="{$valores.lingerie}";
	if (val!="") a.lingerie[val].checked=true;
	
	val="{$valores.seminu}";
	if (val!="") a.seminu[val].checked=true;

	val="{$valores.nu}";
	if (val!="") a.nu[val].checked=true;

	val="{$valores.makingoff}";
	if (val!="") a.makingoff[val].checked=true;

	val="{$valores.jingles}";
	if (val!="") a.jingles[val].checked=true;

	val="{$valores.videoclip}";
	if (val!="") a.videoclip[val].checked=true;

	val="{$valores.promocao}";
	if (val!="") a.promocao[val].checked=true;

	val="{$valores.feiras}";
	if (val!="") a.feiras[val].checked=true;

	val="{$valores.viagens}";
	if (val!="") a.viagens[val].checked=true;
	if (a.viagens[1].checked) mostracampos("viagens");
	
	{if $valores.viagens_brasil == 1}
	a.viagens_brasil.checked=true;
	{/if}
	
	{if $valores.viagens_exterior == 1}
	a.viagens_exterior.checked=true;
	{/if}
	
	val="{$valores.elencoapoio}";
	if (val!="") a.elencoapoio[val].checked=true;
	
	val="{$valores.recepcao}";
	if (val!="") a.recepcao[val].checked=true;
	
	val="{$valores.sampling}";
	if (val!="") a.sampling[val].checked=true;

	val="{$valores.piercing}";
	if (val!="") a.piercing[val].checked=true;
	if (a.piercing[1].checked) mostracampos("piercing");

	val="{$valores.tatuagem}";
	if (val!="") a.tatuagem[val].checked=true;
	if (a.tatuagem[1].checked) mostracampos("tatuagem");

	val="{$valores.mat_fotog}";
	if (val!="") a.mat_fotog[val].checked=true;
	if (a.mat_fotog[1].checked) mostracampos("mat_fotog");
	
	{if $valores.mat_fotog_book == 1}
	a.mat_fotog_book.checked=true;
	{/if}
	
	{if $valores.mat_fotog_ensaio == 1}
	a.mat_fotog_ensaio.checked=true;
	{/if}
	
	{if $valores.mat_fotog_fotocad == 1}
	a.mat_fotog_fotocad.checked=true;
	{/if}
	
	{if $valores.mat_fotog_composite == 1}
	a.mat_fotog_composite.checked=true;
	{/if}
	
	{if $valores.mat_fotog_outros == 1}
	a.mat_fotog_outros.checked=true;
	{/if}

	val="{$valores.fezcursoagencia}";
	if (val!="") a.fezcursoagencia[val].checked=true;
	
	val="{$valores.fezworkshop}";
	if (val!="") a.fezworkshop[val].checked=true;
	
	//val="{$valores.tatuagem}";
	//if (val!="") a.tatuagem[val].checked=true;


	//REMARCAR AS SELECTS
	a.ingles.value = "{$valores.ingles}";
	a.frances.value = "{$valores.frances}";
	a.espanhol.value = "{$valores.espanhol}";
	a.italiano.value = "{$valores.italiano}";
	a.alemao.value = "{$valores.alemao}";

	a.pele.value = "{$valores.pele}";
	a.olhos.value = "{$valores.olhos}";
	a.cabelos_tipo.value = "{$valores.cabelos_tipo}";
	a.cabelos_cor.value = "{$valores.cabelos_cor}";
</script>







{include file="adm/rodape.tpl}
