<?php /* Smarty version 2.6.19, created on 2008-10-10 10:57:58
         compiled from adm/contratos_formulario.tpl */ ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_topo'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<script language="javascript" src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/js/scw.js"></script>
<script language="javascript" src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/js/jquery-1.2.2.pack.js"></script>
<script language="javascript" src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/js/jquery.form.js"></script>
<script language="javascript" src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/js/jquery.field.js"></script>

<script>

var campos = new Array();
var inc_ano = 0;
var ultimo_codigo="<?php echo $this->_tpl_vars['ultimo_codigo']; ?>
";
var modo="<?php echo $this->_tpl_vars['modo']; ?>
";

<?php echo '

String.prototype.pad = function(l, s, t){
	return s || (s = " "), (l -= this.length) > 0 ? (s = new Array(Math.ceil(l / s.length)
		+ 1).join(s)).substr(0, t = !t ? l : t == 1 ? 0 : Math.ceil(l / 2))
		+ this + s.substr(0, l - t) : this;
};

/*
exemplo do pad
var s = "Jonas";
alert(s.pad(20, "[]", 0));
alert(s.pad(20, "[====]", 1));
alert(s.pad(20, "~", 2));
*/

$().ready(function() {
	$("select[@name=plano_id]").change(function(){
		mudaPlano($(this).val());
	})
	
	$(\'#formulario\').submit(
		function() {
			return validate();
		}
	);
	
});

function mudaPlano(plano)
{
	$.post(\'contratos.php\', 
		{ 
		modo : "obtemValorPadrao",
		planoID : plano }, 
		function(resposta){
			$("#valor_padrao").val(resposta);
		}
	);
	
}

'; ?>

</script>

<table border="0" cellpadding="2" cellspacing="0" id="formulario">
	<form name="formulario" action="<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
" method="post" enctype="multipart/form-data">
	<input type="hidden" name="processa" value="ok" />
	<input type="hidden" name="modo" value="<?php echo $this->_tpl_vars['modo']; ?>
" />
	<input type="hidden" name="id" value="<?php echo $this->_tpl_vars['campos']['id'][4]; ?>
" />
    <input type="hidden" name="gru" value="<?php echo $this->_tpl_vars['gru']; ?>
" />
	
	<tr>
		<td class="rotulos">Código :</td>
		<td><input type="text" class="text_normal" name="codigo" value="<?php echo $this->_tpl_vars['campos']['codigo'][4]; ?>
" style="width:450px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Provedor :</td>
		<td>
			<select name="provedor_id" style="width:454px;">
				<option value=""></option>
<?php $_from = $this->_tpl_vars['provedores']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['provedor']):
?>
				<option value="<?php echo $this->_tpl_vars['provedor']['id']; ?>
"><?php if ($this->_tpl_vars['provedor']['codigo'] != ""): ?><?php echo $this->_tpl_vars['provedor']['codigo']; ?>
 - <?php endif; ?><?php echo $this->_tpl_vars['provedor']['razaosocial']; ?>
</option>
<?php endforeach; endif; unset($_from); ?>
			</select>
			<script>document.formulario.provedor_id.value="<?php echo $this->_tpl_vars['campos']['provedor_id'][4]; ?>
";</script>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Plano :</td>
		<td>
			<select name="plano_id" style="width:454px;">
				<option value=""></option>
<?php $_from = $this->_tpl_vars['planos']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['plano']):
?>
				<option value="<?php echo $this->_tpl_vars['plano']['id']; ?>
"><?php if ($this->_tpl_vars['plano']['codigo'] != ""): ?><?php echo $this->_tpl_vars['plano']['codigo']; ?>
 - <?php endif; ?><?php echo $this->_tpl_vars['plano']['nome']; ?>
</option>
<?php endforeach; endif; unset($_from); ?>
			</select>
			<script>document.formulario.plano_id.value="<?php echo $this->_tpl_vars['campos']['plano_id'][4]; ?>
";</script>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Cliente :</td>
		<td>
			<select name="cliente_id" style="width:454px;">
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
"><?php if ($this->_tpl_vars['cliente']['codigo'] != ""): ?><?php echo $this->_tpl_vars['cliente']['codigo']; ?>
 - <?php endif; ?><?php echo $this->_tpl_vars['cliente']['nome']; ?>
</option>
<?php $this->assign('grupo_id_anterior', $this->_tpl_vars['cliente']['grupo_id']); ?>
<?php endforeach; endif; unset($_from); ?>
			</select>
			<script>document.formulario.cliente_id.value="<?php echo $this->_tpl_vars['campos']['cliente_id'][4]; ?>
";</script>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Grupo :</td>
		<td>
			<select name="grupo_id" style="width:454px;">
				<option value=""></option>
<?php $_from = $this->_tpl_vars['grupos']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['grupo']):
?>
				<option value="<?php echo $this->_tpl_vars['grupo']['id']; ?>
"><?php if ($this->_tpl_vars['grupo']['codigo'] != ""): ?><?php echo $this->_tpl_vars['grupo']['codigo']; ?>
 - <?php endif; ?><?php echo $this->_tpl_vars['grupo']['nome']; ?>
</option>
<?php endforeach; endif; unset($_from); ?>
			</select>
			<script>document.formulario.grupo_id.value="<?php echo $this->_tpl_vars['campos']['grupo_id'][4]; ?>
";</script>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">Descrição :</td>
		<td><textarea class="text_normal" name="descricao" style="width:450px; height:100px;" /><?php echo $this->_tpl_vars['campos']['descricao'][4]; ?>
</textarea></td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">&nbsp;</td>
		<td>
			<input type="checkbox" name="ativo" id="ativo" value="1" class="" style="" />
			<label for="ativo" class="rotulos">Contrato ativo</label>
		</td>
		<script>if("<?php echo $this->_tpl_vars['campos']['ativo'][4]; ?>
"=="1") document.formulario.ativo.checked=true;</script>
	</tr>
	
	<tr>
		<td class="rotulos">Data Início :</td>
		<td><input type="text" class="text_normal" name="data_inicio" value="<?php echo $this->_tpl_vars['campos']['data_inicio'][4]; ?>
" style="width:80px;" onClick="scwShow(this,event);" /></td>
	</tr>
	
	<tr>
		<td class="rotulos">Data Término :</td>
		<td><input type="text" class="text_normal" name="data_termino" value="<?php echo $this->_tpl_vars['campos']['data_termino'][4]; ?>
" style="width:80px;" onClick="scwShow(this,event);" /></td>
	</tr>
	
	<tr>
		<td class="rotulos"><label class="rotulos" for="periodo_id">Período Padrão :</label></td>
		<td>
			<select name="periodo_id" style="width:454px;">
				<option value=""></option>
<?php $_from = $this->_tpl_vars['periodos']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['periodo']):
?>
				<option value="<?php echo $this->_tpl_vars['periodo']['id']; ?>
"><?php echo $this->_tpl_vars['periodo']['nome']; ?>
</option>
<?php endforeach; endif; unset($_from); ?>
			</select>
			<script>document.formulario.periodo_id.value="<?php echo $this->_tpl_vars['campos']['periodo_id'][4]; ?>
";</script>
		</td>
	</tr>
	
	<tr>
		<td class="rotulos">Vencimento padrão :</td>
		<td>
			<select name="vencimento_padrao" id="vencimento_padrao" class="text_normal" style="width:60px;">
			<option value=""></option>
			<?php unset($this->_sections['vencimento_padrao']);
$this->_sections['vencimento_padrao']['name'] = 'vencimento_padrao';
$this->_sections['vencimento_padrao']['start'] = (int)1;
$this->_sections['vencimento_padrao']['loop'] = is_array($_loop=32) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['vencimento_padrao']['show'] = true;
$this->_sections['vencimento_padrao']['max'] = $this->_sections['vencimento_padrao']['loop'];
$this->_sections['vencimento_padrao']['step'] = 1;
if ($this->_sections['vencimento_padrao']['start'] < 0)
    $this->_sections['vencimento_padrao']['start'] = max($this->_sections['vencimento_padrao']['step'] > 0 ? 0 : -1, $this->_sections['vencimento_padrao']['loop'] + $this->_sections['vencimento_padrao']['start']);
else
    $this->_sections['vencimento_padrao']['start'] = min($this->_sections['vencimento_padrao']['start'], $this->_sections['vencimento_padrao']['step'] > 0 ? $this->_sections['vencimento_padrao']['loop'] : $this->_sections['vencimento_padrao']['loop']-1);
if ($this->_sections['vencimento_padrao']['show']) {
    $this->_sections['vencimento_padrao']['total'] = min(ceil(($this->_sections['vencimento_padrao']['step'] > 0 ? $this->_sections['vencimento_padrao']['loop'] - $this->_sections['vencimento_padrao']['start'] : $this->_sections['vencimento_padrao']['start']+1)/abs($this->_sections['vencimento_padrao']['step'])), $this->_sections['vencimento_padrao']['max']);
    if ($this->_sections['vencimento_padrao']['total'] == 0)
        $this->_sections['vencimento_padrao']['show'] = false;
} else
    $this->_sections['vencimento_padrao']['total'] = 0;
if ($this->_sections['vencimento_padrao']['show']):

            for ($this->_sections['vencimento_padrao']['index'] = $this->_sections['vencimento_padrao']['start'], $this->_sections['vencimento_padrao']['iteration'] = 1;
                 $this->_sections['vencimento_padrao']['iteration'] <= $this->_sections['vencimento_padrao']['total'];
                 $this->_sections['vencimento_padrao']['index'] += $this->_sections['vencimento_padrao']['step'], $this->_sections['vencimento_padrao']['iteration']++):
$this->_sections['vencimento_padrao']['rownum'] = $this->_sections['vencimento_padrao']['iteration'];
$this->_sections['vencimento_padrao']['index_prev'] = $this->_sections['vencimento_padrao']['index'] - $this->_sections['vencimento_padrao']['step'];
$this->_sections['vencimento_padrao']['index_next'] = $this->_sections['vencimento_padrao']['index'] + $this->_sections['vencimento_padrao']['step'];
$this->_sections['vencimento_padrao']['first']      = ($this->_sections['vencimento_padrao']['iteration'] == 1);
$this->_sections['vencimento_padrao']['last']       = ($this->_sections['vencimento_padrao']['iteration'] == $this->_sections['vencimento_padrao']['total']);
?>
			<option value="<?php echo $this->_sections['vencimento_padrao']['index']; ?>
"><?php echo $this->_sections['vencimento_padrao']['index']; ?>
</option>
			<?php endfor; endif; ?>
			</select>
			<script>document.formulario.vencimento_padrao.value="<?php echo $this->_tpl_vars['campos']['vencimento_padrao'][4]; ?>
";</script>
		</td>
	</tr>
    
    <tr>
		<td class="rotulos">Valor Padrão: <small>R$</small></td>
		<td><input type="text" class="text_normal" name="valor_padrao" id="valor_padrao" value="<?php echo $this->_tpl_vars['campos']['valor_padrao'][4]; ?>
" style="width:80px;" /></td>
	</tr>
	
	<tr>
		<td class="rotulos" valign="top">Observações :</td>
		<td><textarea class="text_normal" name="observacoes" style="width:450px; height:100px;" /><?php echo $this->_tpl_vars['campos']['observacoes'][4]; ?>
</textarea></td>
	</tr>

	<tr>
		<td>&nbsp;</td>
		<td align="center">
			<?php if ($this->_tpl_vars['modo'] == 'alt'): ?><input type="button" class="botao" value="Voltar" onClick="document.location='<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
?modo=lst'" />&nbsp;<?php endif; ?>
		<input type="submit" class="botao" value="<?php echo $this->_tpl_vars['botao']; ?>
" /></td>
	</tr>
</table>


</form>
</table>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_rodape'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>