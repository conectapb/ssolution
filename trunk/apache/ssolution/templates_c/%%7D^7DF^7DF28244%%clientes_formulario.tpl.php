<?php /* Smarty version 2.6.18, created on 2008-08-02 18:58:38
         compiled from adm/clientes_formulario.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'date_format', 'adm/clientes_formulario.tpl', 133, false),array('function', 'html_options', 'adm/clientes_formulario.tpl', 231, false),)), $this); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_topo'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<script language="javascript" src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/js/jquery-1.2.2.pack.js"></script>
<script language="javascript" src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/js/jquery.maskedinput-1.1.2.pack.js"></script>

<script>
tipo = "<?php echo $this->_tpl_vars['campos']['tipo'][4]; ?>
";
codigo_atual="<?php echo $this->_tpl_vars['campos']['codigo'][4]; ?>
";
modo = "<?php echo $this->_tpl_vars['modo']; ?>
";
<?php echo '
$(document).ready(function() {
	//GRUPOS
	$.post(\'clientes.php\', 
		{ modo : "obtemGrupos" }, 
		function(resposta){
			$(\'#grupo_id\').html(resposta);
		}
	);

	// MASCARAS
	$("#cpf").mask("999.999.999-99");
	$("#cnpj").mask("99.999.999/9999-99");
	$("#nascimento").mask("99/99/9999");
	
	
	$(".field_pj").hide();
	$(".field_pf").hide();
	if(tipo=="Pessoa física" || tipo=="")
	{
		$(".field_pf").toggle();
		$("#tipo_pf").attr("checked","true");
	}
	else
	{
		$(".field_pj").toggle();
		$("#tipo_pj").attr("checked","true");
	}
	
	$("#tipo_pf").click(function() {
		$(".field_pf").show();
		$(".field_pj").hide();
	});
	$("#tipo_pj").click(function() {
		$(".field_pj").show();
		$(".field_pf").hide();
	});
});

function chgAddress(grupoID) {
	a=document.frm;
	
	if(grupoID!="")
	{
		$.post(\'clientes.php\', 
			{ modo : "obtemUmGrupo" , grpID: grupoID }, 
			function(resposta){
				var tmp = resposta.split("#");
				a.endereco.value=tmp[0];
				a.numero.value=tmp[1];
				a.bairro.value=tmp[2];
				a.cep.value=tmp[3];
				a.cidade.value=tmp[4];
				a.uf.value=tmp[5];
				if(grupoID!=grupo_atual)
					a.codigo.value=tmp[6];
				else
					a.codigo.value=codigo_atual;
				//$(\'#grupo_id\').html(resposta);
			}
		);
	}
	else
	{
		a.endereco.value="";
		a.numero.value="";
		a.bairro.value="";
		a.cep.value="";
		a.cidade.value="";
		a.uf.value="";
		a.codigo.value="";
	}
}
</script>
'; ?>

<br />

<table border="0" cellpadding="2" cellspacing="0" border="0">
	<form name="frm" action="<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
" method="post">
	<input type="hidden" name="processa" value="ok" />
	<input type="hidden" name="modo" value="<?php echo $this->_tpl_vars['modo']; ?>
" />
	<input type="hidden" name="id" value="<?php echo $this->_tpl_vars['campos']['id'][4]; ?>
" />
	<input type="hidden" name="gru" value="<?php echo $this->_tpl_vars['gru']; ?>
" />
	
	<tr>
		<td class="rotulos">Grupo :</td>
		<td>
			<script>var grupo=new Array();</script>
			<select name="grupo_id" class="text_normal" onchange="chgAddress(this.value);" />
				<option value=""></option>
			<?php $_from = $this->_tpl_vars['grupos']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['grupo']):
?>
				<option value="<?php echo $this->_tpl_vars['grupo']['id']; ?>
"><?php echo $this->_tpl_vars['grupo']['codigo']; ?>
 - <?php echo $this->_tpl_vars['grupo']['nome_padrao']; ?>
 - <?php echo $this->_tpl_vars['grupo']['nome']; ?>
</option>
			<?php endforeach; endif; unset($_from); ?>
			</select>
			<script>
				document.frm.grupo_id.value="<?php echo $this->_tpl_vars['campos']['grupo_id'][4]; ?>
";
				grupo_atual="<?php echo $this->_tpl_vars['campos']['grupo_id'][4]; ?>
";
			</script>
			</td>
	</tr>
	
	<tr>
		<td class="rotulos">C&oacute;digo :</td>
		<td><input type="text" class="text_normal" name="codigo" value="<?php echo $this->_tpl_vars['campos']['codigo'][4]; ?>
" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Tipo :</td>
		<td>
			<input type="radio" name="tipo" id="tipo_pf" class="radio_normal" value="1" /><label for="tipo_pf">Pessoa f&iacute;sica</label>
			&nbsp;
			<input type="radio" name="tipo" id="tipo_pj" class="radio_normal" value="2" /><label for="tipo_pj">Pessoa jur&iacute;dica</label>
		</td>
	</tr>
	
	<tr class="field_pf">
		<td class="rotulos">Nome :</td>
		<td><input type="text" class="text_normal" name="nome" id="nome" value="<?php echo $this->_tpl_vars['campos']['nome'][4]; ?>
" /></td>
	</tr>
	
	<tr class="field_pf">
		<td class="rotulos">Nascimento :</td>
		<td><input type="text" class="text_medio" name="nascimento" id="nascimento" value="<?php if ($this->_tpl_vars['campos']['nascimento'][4] != "0000-00-00"): ?><?php echo ((is_array($_tmp=$this->_tpl_vars['campos']['nascimento'][4])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d/%m/%Y") : smarty_modifier_date_format($_tmp, "%d/%m/%Y")); ?>
<?php endif; ?>" /></td>
	</tr>
	
	<tr class="field_pf">
		<td class="rotulos">RG :</td>
		<td><input type="text" class="text_medio" name="rg" id="rg" value="<?php echo $this->_tpl_vars['campos']['rg'][4]; ?>
" /></td>
	</tr>
	
	<tr class="field_pf">
		<td class="rotulos">CPF :</td>
		<td><input type="text" class="text_medio" name="cpf" id="cpf" value="<?php echo $this->_tpl_vars['campos']['cpf'][4]; ?>
" /></td>
	</tr>
	
	<tr class="field_pf">
		<td class="rotulos">Sexo :</td>
		<td>
			<input type="radio" name="sexo" id="Masculino" class="radio_normal" value="1" />
			<label for="Masculino">M</label>
			<input type="radio" name="sexo" id="Feminino" class="radio_normal" value="2" />
			<label for="Feminino">F</label>
		</td>
	</tr>
	
	<tr class="field_pj">
		<td class="rotulos">Raz&atilde;o Social :</td>
		<td><input type="text" class="text_normal" name="razao_social" id="razao_social" value="<?php echo $this->_tpl_vars['campos']['razao_social'][4]; ?>
" /></td>
	</tr>
	
	<tr class="field_pj">
		<td class="rotulos">Nome Fantasia :</td>
		<td><input type="text" class="text_normal" name="nome_fantasia" id="nome_fantasia" value="<?php echo $this->_tpl_vars['campos']['nome_fantasia'][4]; ?>
" /></td>
	</tr>
	
	<tr class="field_pj">
		<td class="rotulos">CNPJ :</td>
		<td><input type="text" class="text_medio" name="cnpj" id="cnpj" value="<?php echo $this->_tpl_vars['campos']['cnpj'][4]; ?>
" /></td>
	</tr>
	
	<tr class="field_pj">
		<td class="rotulos">Inscr. Municipal :</td>
		<td><input type="text" class="text_medio" name="inscr_municipal" id="inscr_municipal" value="<?php echo $this->_tpl_vars['campos']['inscr_municipal'][4]; ?>
" /></td>
	</tr>
	
	<tr class="field_pj">
		<td class="rotulos">Ins. Estadual :</td>
		<td><input type="text" class="text_medio" name="inscr_estadual" id="inscr_estadual" value="<?php echo $this->_tpl_vars['campos']['inscr_estadual'][4]; ?>
" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Endere&ccedil;o :</td>
		<td>
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>
					<input type="text" class="text_normal" name="endereco" id="endereco" value="<?php echo $this->_tpl_vars['campos']['endereco'][4]; ?>
" style="width:363px;" />
					</td>
					<td class="rotulos" style="width:33px">N&ordm;:&nbsp;</td>
					<td>
					<input type="text" class="text_pequeno" name="numero" id="numero" value="<?php echo $this->_tpl_vars['campos']['numero'][4]; ?>
" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Complemento :</td>
		<td>
		<input type="radio" name="complemento_tipo" id="complemento_tipo_Ap" class="radio_normal" value="Ap." /><label for="complemento_tipo_Ap">Ap.</label>
		<input type="radio" name="complemento_tipo" id="complemento_tipo_Cj" class="radio_normal" value="Cj." /><label for="complemento_tipo_Cj">Cj.</label>
		<input type="radio" name="complemento_tipo" id="complemento_tipo_Sl" class="radio_normal" value="Sl." /><label for="complemento_tipo_Sl">Sl.</label>
		<input type="radio" name="complemento_tipo" id="complemento_tipo_Lj" class="radio_normal" value="Lj." /><label for="complemento_tipo_Lj">Lj.</label>
		<input type="text" class="text_normal" name="complemento" value="<?php echo $this->_tpl_vars['campos']['complemento'][4]; ?>
" style="width:110px;" />
		<label for="bloco" class="rotulos">
		Bloco&nbsp;:&nbsp;</label><input type="text" class="text_normal" name="bloco" value="<?php echo $this->_tpl_vars['campos']['bloco'][4]; ?>
" style="width:106px;" />
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Bairro :</td>
		<td><input type="text" class="text_normal" name="bairro" id="bairro" value="<?php echo $this->_tpl_vars['campos']['bairro'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">CEP :</td>
		<td><input type="text" class="text_normal" name="cep" id="cep" value="<?php echo $this->_tpl_vars['campos']['cep'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Cidade :</td>
		<td>
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td><input type="text" class="text_normal" name="cidade" id="cidade" value="<?php echo $this->_tpl_vars['campos']['cidade'][4]; ?>
" style="width:363px;" /></td>
					<?php if ($this->_tpl_vars['campos']['uf'][4] != ""): ?><?php $this->assign('sel_estado', $this->_tpl_vars['campos']['uf'][4]); ?><?php else: ?><?php $this->assign('sel_estado', 'PR'); ?><?php endif; ?>
					<td>&nbsp;&nbsp;&nbsp;<span class="rotulos">UF :</span>&nbsp;</td>
					<td>
						<select class="text_pequeno" name="uf" id="uf">
						<?php echo smarty_function_html_options(array('values' => $this->_tpl_vars['estados'],'selected' => $this->_tpl_vars['sel_estado'],'output' => $this->_tpl_vars['estados']), $this);?>

						</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td class="rotulos">Tel. Residencial :</td>
		<td>
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td><input type="text" class="text_normal" name="tel_residencial" id="tel_residencial" value="<?php echo $this->_tpl_vars['campos']['tel_residencial'][4]; ?>
" style="width:97px;" /></td>
					<td class="rotulos" style="width:104px">Tel. Comercial :&nbsp;</td>
					<td><input type="text" class="text_normal" name="tel_comercial" id="tel_comercial" value="<?php echo $this->_tpl_vars['campos']['tel_comercial'][4]; ?>
" style="width:97px;" /></td>
					<td class="rotulos" style="width:40px">Fax :&nbsp;</td>
					<td><input type="text" class="text_normal" name="fax" id="fax" value="<?php echo $this->_tpl_vars['campos']['fax'][4]; ?>
" style="width:97px;" /></td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Celular 1:</td>
		<td>
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td><input type="text" class="text_normal" name="tel_celular1" id="tel_celular1" value="<?php echo $this->_tpl_vars['campos']['tel_celular1'][4]; ?>
" style="width:187px;" /></td>
					<td class="rotulos" style="width:70px;">Celular 2 :&nbsp;</td>
					<td><input type="text" class="text_normal" name="tel_celular2" id="tel_celular2" value="<?php echo $this->_tpl_vars['campos']['tel_celular2'][4]; ?>
" style="width:186px;" /></td>
				</tr>
			</table>
			
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Site:</td>
		<td><input type="text" class="text_normal" name="site" id="site" value="<?php echo $this->_tpl_vars['campos']['site'][4]; ?>
" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">E-mail 1:</td>
		<td><input type="text" class="text_normal" name="email1" id="email1" value="<?php echo $this->_tpl_vars['campos']['email1'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">E-mail 2:</td>
		<td><input type="text" class="text_normal" name="email2" id="email2" value="<?php echo $this->_tpl_vars['campos']['email2'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">E-mail 3:</td>
		<td><input type="text" class="text_normal" name="email3" id="email3" value="<?php echo $this->_tpl_vars['campos']['email3'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">Observa&ccedil;&otilde;es :</td>
		<td><textarea class="text_normal" name="observacoes" id="observacoes" /><?php echo $this->_tpl_vars['campos']['observacoes'][4]; ?>
</textarea></td>
	</tr>

	<tr>
		<td>&nbsp;</td>
		<td align="center">
			<?php if ($this->_tpl_vars['modo'] == 'alt'): ?><input type="button" class="botao_normal" value="Voltar" onClick="document.location='clientes.php'" />&nbsp;<?php endif; ?>
		<input type="submit" class="botao_normal" value="<?php echo $this->_tpl_vars['botao']; ?>
" /></td>
	</tr>
</form>
</table>

<script>
if("<?php echo $this->_tpl_vars['campos']['sexo'][4]; ?>
"!="")
	document.getElementById("<?php echo $this->_tpl_vars['campos']['sexo'][4]; ?>
").checked=true;
	
if("<?php echo $this->_tpl_vars['campos']['complemento_tipo'][4]; ?>
"=="Ap.")
	document.getElementById("complemento_tipo_Ap").checked=true;
if("<?php echo $this->_tpl_vars['campos']['complemento_tipo'][4]; ?>
"=="Cj.")
	document.getElementById("complemento_tipo_Cj").checked=true;
if("<?php echo $this->_tpl_vars['campos']['complemento_tipo'][4]; ?>
"=="Sl.")
	document.getElementById("complemento_tipo_Sl").checked=true;
if("<?php echo $this->_tpl_vars['campos']['complemento_tipo'][4]; ?>
"=="Lj.")
	document.getElementById("complemento_tipo_Lj").checked=true;

</script>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_rodape'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>