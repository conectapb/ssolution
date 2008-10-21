<?php /* Smarty version 2.6.19, created on 2008-09-19 10:24:41
         compiled from adm/chamados_formulario.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'replace', 'adm/chamados_formulario.tpl', 126, false),)), $this); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_topo'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<script language="javascript" src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/js/jquery-1.2.2.pack.js"></script>
<?php echo '
<script>
$(document).ready(function() 
    { 
        //$("#dadosCliente").css("display" , "none");
	}
);
function mostraDetalhesCliente(){
	if($("#dadosCliente").css("display")=="none")
	{
		$("#dadosCliente").css("display" , "block");
		$("#detalhes_container").html("Ocultar detalhes do cliente");
	}
	else
	{
		$("#dadosCliente").css("display" , "none");
		$("#detalhes_container").html("Mostrar detalhes do cliente");
	}
}
var modo = "{$modo}";
function chgCliente(cliID) {
	a=document.frm;
	if(cliID == parseInt(cliID))
	{
		a.cli_endereco.value=cliente[cliID][0];
		a.cli_numero.value=cliente[cliID][1];
		a.cli_bairro.value=cliente[cliID][2];
		a.cli_cep.value=cliente[cliID][3];
		a.cli_cidade.value=cliente[cliID][4];
		document.getElementById("uf_container").innerHTML=cliente[cliID][5];
		a.cli_codigo.value=cliente[cliID][6];
		a.cli_nome.value=cliente[cliID][7];
		if (cliente[cliID][8]!="0000-00-00 00:00:00")
			a.cli_nascimento.value=cliente[cliID][8];
		a.cli_rg.value=cliente[cliID][9];
		a.cli_cpf.value=cliente[cliID][10];
		document.getElementById("sexo_container").innerHTML=cliente[cliID][11];
		a.cli_complemento.value=cliente[cliID][13];
		a.cli_tel_residencial.value=cliente[cliID][14];
		a.cli_tel_comercial.value=cliente[cliID][15];
		a.cli_fax.value=cliente[cliID][16];
		a.cli_tel_celular1.value=cliente[cliID][17];
		a.cli_tel_celular2.value=cliente[cliID][18];
		a.cli_email1.value=cliente[cliID][19];
		a.cli_email2.value=cliente[cliID][20];
		a.cli_email3.value=cliente[cliID][21];
		a.cli_observacoes.value=cliente[cliID][22];
	}
	else
	{
		a.cli_endereco.value="";
		a.cli_numero.value="";
		a.cli_bairro.value="";
		a.cli_cep.value="";
		a.cli_cidade.value="";
		document.getElementById("uf_container").innerHTML="";
		a.cli_codigo.value="";
		a.cli_nome.value="";
		a.cli_nascimento.value="";
		a.cli_rg.value="";
		a.cli_cpf.value="";
		document.getElementById("sexo_container").innerHTML="";
		a.cli_complemento.value="";
		a.cli_tel_residencial.value="";
		a.cli_tel_comercial.value="";
		a.cli_fax.value="";
		a.cli_tel_celular1.value="";
		a.cli_tel_celular2.value="";
		a.cli_email1.value="";
		a.cli_email2.value="";
		a.cli_email3.value="";
		a.cli_observacoes.value="";
	}
}
</script>
'; ?>

<br />

<table width="100%" border="0" cellpadding="2" cellspacing="0" border="0">
	<form name="frm" action="<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
" method="post" enctype="multipart/form-data">
	<input type="hidden" name="processa" value="ok" />
	<input type="hidden" name="modo" value="<?php echo $this->_tpl_vars['modo']; ?>
" />
	<input type="hidden" name="id" value="<?php echo $this->_tpl_vars['campos']['id'][4]; ?>
" />
	
	<tr>
		<td class="rotulos">Clientes :</td>
		<td>
			<script>var cliente=new Array();</script>
			<select name="cliente_id" class="text_normal" style="width:450px;" onchange="chgCliente(this.value);" />
				<option value=""></option>
			<?php $_from = $this->_tpl_vars['clientes']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['cliente']):
?>
				<?php $this->assign('grupo_id_atual', $this->_tpl_vars['cliente']['grupo_id']); ?>
				<?php if ($this->_tpl_vars['grupo_id_atual'] != $this->_tpl_vars['grupo_id_anterior']): ?>
				</optgroup>
				<optgroup label="<?php echo $this->_tpl_vars['cliente']['grupo_codigo']; ?>
 - <?php echo $this->_tpl_vars['cliente']['grupo_nome']; ?>
">
				<?php endif; ?>
				<option value="<?php echo $this->_tpl_vars['cliente']['id']; ?>
"><?php echo $this->_tpl_vars['cliente']['codigo']; ?>
 - <?php echo $this->_tpl_vars['cliente']['nome']; ?>
</option>
				
				<script>
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
] = new Array();
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][0] = "<?php echo $this->_tpl_vars['cliente']['endereco']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][1] = "<?php echo $this->_tpl_vars['cliente']['numero']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][2] = "<?php echo $this->_tpl_vars['cliente']['bairro']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][3] = "<?php echo $this->_tpl_vars['cliente']['cep']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][4] = "<?php echo $this->_tpl_vars['cliente']['cidade']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][5] = "<?php echo $this->_tpl_vars['cliente']['uf']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][6] = "<?php echo $this->_tpl_vars['cliente']['codigo']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][7] = "<?php echo $this->_tpl_vars['cliente']['nome']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][8] = "<?php echo $this->_tpl_vars['cliente']['nascimento']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][9] = "<?php echo $this->_tpl_vars['cliente']['rg']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][10] = "<?php echo $this->_tpl_vars['cliente']['cpf']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][11] = "<?php echo $this->_tpl_vars['cliente']['sexo']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][12] = "<?php echo $this->_tpl_vars['cliente']['grupo']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][13] = "<?php echo $this->_tpl_vars['cliente']['complemento']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][14] = "<?php echo $this->_tpl_vars['cliente']['tel_residencial']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][15] = "<?php echo $this->_tpl_vars['cliente']['tel_comercial']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][16] = "<?php echo $this->_tpl_vars['cliente']['fax']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][17] = "<?php echo $this->_tpl_vars['cliente']['tel_celular1']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][18] = "<?php echo $this->_tpl_vars['cliente']['tel_celular2']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][19] = "<?php echo $this->_tpl_vars['cliente']['email1']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][20] = "<?php echo $this->_tpl_vars['cliente']['email2']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][21] = "<?php echo $this->_tpl_vars['cliente']['email3']; ?>
";
					cliente[<?php echo $this->_tpl_vars['cliente']['id']; ?>
][22] = "<?php echo ((is_array($_tmp=$this->_tpl_vars['cliente']['observacoes'])) ? $this->_run_mod_handler('replace', true, $_tmp, "\r\n", "<br>") : smarty_modifier_replace($_tmp, "\r\n", "<br>")); ?>
";
				</script>
				<?php $this->assign('grupo_id_anterior', $this->_tpl_vars['cliente']['grupo_id']); ?>
			<?php endforeach; endif; unset($_from); ?>
			</select>
			<script>document.frm.cliente_id.value="<?php echo $this->_tpl_vars['campos']['cliente_id'][4]; ?>
";</script>
			<br /><small><a href="#" onclick="javascript: mostraDetalhesCliente();"><span id="detalhes_container">Mostrar detalhes do cliente</span></a></small>
			</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<table id="dadosCliente" style="display:none;">
				<tr>
					<td class="rotulos">Codigo :</td>
					<td><input readonly type="text" class="text_normal" name="cli_codigo" value="" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos">Nome :</td>
					<td><input readonly type="text" class="text_normal" name="cli_nome" value="" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos">Nascimento :</td>
					<td><input readonly type="text" class="text_normal" name="cli_nascimento" value="" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos">RG :</td>
					<td><input readonly type="text" class="text_normal" name="cli_rg" value="" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos">CPF :</td>
					<td><input readonly type="text" class="text_normal" name="cli_cpf" value="" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos">Sexo :</td>
					<td><span id=sexo_container></span></td>
				</tr>
				
				<tr>
					<td class="rotulos">Endere&ccedil;o :</td>
					<td>
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td><input readonly type="text" class="text_normal" name="cli_endereco" value="" style="width:363px;" /></td>
								<td class="rotulos" style="width:33px">N&ordm;:&nbsp;</td>
								<td><input readonly type="text" class="text_normal" name="cli_numero" value="" style="width:50px;" /></td>
							</tr>
						</table>
					</td>
				</tr>
				
				<tr>
					<td class="rotulos">Complemento :</td>
					<td><input readonly type="text" class="text_normal" name="cli_complemento" value="" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos">Bairro :</td>
					<td><input readonly type="text" class="text_normal" name="cli_bairro" value="" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos">CEP :</td>
					<td><input readonly type="text" class="text_normal" name="cli_cep" value="" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos">Cidade :</td>
					<td>
						<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td><input readonly type="text" class="text_normal" name="cli_cidade" value="" style="width:363px;" /></td>
								<td style="width:26px" class="rotulos">UF :&nbsp;</td>
								<td><span id="uf_container"></span></td>
							</tr>
						</table>
					</td>
				</tr>
			
				<tr>
					<td class="rotulos">Tel. Residencial :</td>
					<td>
						<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td><input readonly type="text" class="text_normal" name="cli_tel_residencial" value="" style="width:97px;" /></td>
								<td class="rotulos" style="width:105px">Tel. Comercial :&nbsp;</td>
								<td><input readonly type="text" class="text_normal" name="cli_tel_comercial" value="" style="width:97px;" /></td>
								<td class="rotulos" style="width:45px">Fax :&nbsp;</td>
								<td><input readonly type="text" class="text_normal" name="cli_fax" value="" style="width:97px;" /></td>
							</tr>
						</table>
					</td>
				</tr>
				
				<tr>
					<td class="rotulos">Celular 1:</td>
					<td>
						<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td><input readonly type="text" class="text_normal" name="cli_tel_celular1" value="<?php echo $this->_tpl_vars['campos']['tel_celular1'][4]; ?>
" style="width:187px;" /></td>
								<td class="rotulos" style="width:73px;">Celular 2 :&nbsp;</td>
								<td><input readonly type="text" class="text_normal" name="cli_tel_celular2" value="<?php echo $this->_tpl_vars['campos']['tel_celular2'][4]; ?>
" style="width:186px;" /></td>
							</tr>
						</table>
					</td>
				</tr>
				
				<tr>
					<td class="rotulos">E-mail 1:</td>
					<td><input readonly type="text" class="text_normal" name="cli_email1" value="<?php echo $this->_tpl_vars['campos']['email1'][4]; ?>
" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos">E-mail 2:</td>
					<td><input readonly type="text" class="text_normal" name="cli_email2" value="<?php echo $this->_tpl_vars['campos']['email2'][4]; ?>
" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos">E-mail 3:</td>
					<td><input readonly type="text" class="text_normal" name="cli_email3" value="<?php echo $this->_tpl_vars['campos']['email3'][4]; ?>
" style="width:450px;" /></td>
				</tr>
				
				<tr>
					<td class="rotulos" valign="top">Observa&ccedil;&otilde;es :</td>
					<td><textarea readonly class="text_normal" name="cli_observacoes" style="width:450px; height:100px;" /></textarea></td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Atendente :</td>
		<td>
		<select name="admin_id" class="text_normal" style="width:450px;" />
		<option value=""></option>
		<?php $_from = $this->_tpl_vars['admins']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['admin']):
?>
			<option value="<?php echo $this->_tpl_vars['admin']['id']; ?>
"><?php echo $this->_tpl_vars['admin']['nome']; ?>
</option>
		<?php endforeach; endif; unset($_from); ?>
		</select>
		<script>document.frm.admin_id.value="<?php echo $this->_tpl_vars['campos']['admin_id'][4]; ?>
";</script>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Tipo de chamado :</td>
		<td>
		<select name="tipo_id" class="text_normal" style="width:450px;" />
		<option value=""></option>
		<?php $_from = $this->_tpl_vars['tipos']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tipo']):
?>
			<option value="<?php echo $this->_tpl_vars['tipo']['id']; ?>
"><?php echo $this->_tpl_vars['tipo']['nome']; ?>
</option>
		<?php endforeach; endif; unset($_from); ?>
		</select>
		<script>document.frm.tipo_id.value="<?php echo $this->_tpl_vars['campos']['tipo_id'][4]; ?>
";</script>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">Problema :</td>
		<td><textarea class="text_normal" name="problema" style="width:450px; height:100px;" /><?php echo $this->_tpl_vars['campos']['problema'][4]; ?>
</textarea></td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">Solu&ccedil;&atilde;o :</td>
		<td><textarea class="text_normal" name="solucao" style="width:450px; height:100px;" /><?php echo $this->_tpl_vars['campos']['solucao'][4]; ?>
</textarea></td>
	</tr>
	
	<tr>
		<td class="rotulos">Status :</td>
		<td>
			<select name="status_id" class="text_normal" style="width:450px;" />
				<option value=""></option>
				<?php $_from = $this->_tpl_vars['chamados_status']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['status']):
?>
					<option value="<?php echo $this->_tpl_vars['status']['id']; ?>
"><?php echo $this->_tpl_vars['status']['nome']; ?>
</option>
				<?php endforeach; endif; unset($_from); ?>
			</select>
			<script>document.frm.status_id.value="<?php echo $this->_tpl_vars['campos']['status_id'][4]; ?>
";</script>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Data abertura :</td>
		<td><input type="text" class="text_normal" name="data_abertura" value="<?php echo $this->_tpl_vars['campos']['data_abertura'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Data fechamento :</td>
		<td><input type="text" class="text_normal" name="data_fechamento" value="<?php echo $this->_tpl_vars['campos']['data_fechamento'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">Observa&ccedil;&otilde;es :</td>
		<td><textarea class="text_normal" name="observacoes" style="width:450px; height:100px;" /><?php echo $this->_tpl_vars['campos']['observacoes'][4]; ?>
</textarea></td>
	</tr>
	
	<tr>
		<td>&nbsp;</td>
		<td align="center">
			<?php if ($this->_tpl_vars['modo'] == 'alt'): ?><input type="button" class="botao" value="Voltar" onClick="document.location='<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
'" />&nbsp;<?php endif; ?>
			<input type="submit" class="botao" value="<?php echo $this->_tpl_vars['botao']; ?>
" />
		</td>
	</tr>
	
</form>
</table>

<script>
if("<?php echo $this->_tpl_vars['campos']['id'][4]; ?>
"!="") chgCliente(<?php echo $this->_tpl_vars['campos']['id'][4]; ?>
);
</script>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_rodape'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>