<?php /* Smarty version 2.6.19, created on 2008-08-13 11:48:49
         compiled from ../templates/adm/topo1.tpl */ ?>
<?php $this->assign('tammenu', '140'); ?>
<?php $this->assign('margemesq', '10'); ?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><?php echo $this->_tpl_vars['titulo']; ?>
</title>

</head>

<html>

<head>
	<link href="<?php echo $this->_tpl_vars['tpl_adm_style']; ?>
" rel="stylesheet" type="text/css" />
    <link href="<?php echo $this->_tpl_vars['tpl_dir_adm']; ?>
tablesorter.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<?php echo $this->_tpl_vars['tpl_dir_adm']; ?>
drop_down.js"></script>
    
    <?php echo '
    <style>
#nav, #nav ul { /* all lists */
	padding: 0;
	margin: 0;
	list-style: none;
	line-height: 1;
	border: 1px solid #ccc;
}

#nav a {
	display: block;
	width: 10em;
}

#nav li { /* all list items */
	float: left;
	width: 85px; /* width needed or else Opera goes nuts */
	text-decoration: none;
	color: #777;
	background: #fff;
	padding: 5px;
	border-left: 1px solid #ccc;
	border-bottom: 0;
}

#nav li ul { /* second-level lists */
	z-index:1000;
	position: absolute;
	width: 10em;
	left: -999em; /* using left instead of display to hide menus because display: none isn\'t read by screen readers */
}

#nav li ul li { /* second-level lists */
	background-color:#FFFFFF;
}

#nav li:hover ul, #nav li.sfhover ul { /* lists nested under hovered list items */
	left: auto;
}

    </style>
    '; ?>

</head>

<body>

<div id="template_sel" style="position:absolute; right:10px; top:10px;">
<form name="tpl" action="<?php echo $this->_tpl_vars['SCRIPT_NAME']; ?>
?<?php echo $this->_tpl_vars['querystring']; ?>
" id="tpl" method="post">
<input type="hidden" name="tpl_adm" />
<select name="tpl_sel" onchange="document.tpl.tpl_adm.value=this.value; document.tpl.submit();">
	<option value="1" >Template 1</option>
	<option value="2">Template 2</option>
</select>
</form>
<script>document.tpl.tpl_sel.value="<?php echo $this->_tpl_vars['tpl_adm']; ?>
";</script>
</div>

<div id="titulo">Sistema Administrativo Smart Solution</div>

<?php if ($this->_tpl_vars['funcoes'] != ""): ?>
<ul id="nav"> 
<?php unset($this->_sections['i']);
$this->_sections['i']['name'] = 'i';
$this->_sections['i']['loop'] = is_array($_loop=$this->_tpl_vars['funcoes']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['i']['show'] = true;
$this->_sections['i']['max'] = $this->_sections['i']['loop'];
$this->_sections['i']['step'] = 1;
$this->_sections['i']['start'] = $this->_sections['i']['step'] > 0 ? 0 : $this->_sections['i']['loop']-1;
if ($this->_sections['i']['show']) {
    $this->_sections['i']['total'] = $this->_sections['i']['loop'];
    if ($this->_sections['i']['total'] == 0)
        $this->_sections['i']['show'] = false;
} else
    $this->_sections['i']['total'] = 0;
if ($this->_sections['i']['show']):

            for ($this->_sections['i']['index'] = $this->_sections['i']['start'], $this->_sections['i']['iteration'] = 1;
                 $this->_sections['i']['iteration'] <= $this->_sections['i']['total'];
                 $this->_sections['i']['index'] += $this->_sections['i']['step'], $this->_sections['i']['iteration']++):
$this->_sections['i']['rownum'] = $this->_sections['i']['iteration'];
$this->_sections['i']['index_prev'] = $this->_sections['i']['index'] - $this->_sections['i']['step'];
$this->_sections['i']['index_next'] = $this->_sections['i']['index'] + $this->_sections['i']['step'];
$this->_sections['i']['first']      = ($this->_sections['i']['iteration'] == 1);
$this->_sections['i']['last']       = ($this->_sections['i']['iteration'] == $this->_sections['i']['total']);
?>
	<li><a href="<?php echo $this->_tpl_vars['funcoes'][$this->_sections['i']['index']]['link']; ?>
"><?php echo $this->_tpl_vars['funcoes'][$this->_sections['i']['index']]['nome']; ?>
</a>
		<ul>
		<?php unset($this->_sections['j']);
$this->_sections['j']['name'] = 'j';
$this->_sections['j']['loop'] = is_array($_loop=$this->_tpl_vars['funcoes'][$this->_sections['i']['index']]['filhos']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['j']['show'] = true;
$this->_sections['j']['max'] = $this->_sections['j']['loop'];
$this->_sections['j']['step'] = 1;
$this->_sections['j']['start'] = $this->_sections['j']['step'] > 0 ? 0 : $this->_sections['j']['loop']-1;
if ($this->_sections['j']['show']) {
    $this->_sections['j']['total'] = $this->_sections['j']['loop'];
    if ($this->_sections['j']['total'] == 0)
        $this->_sections['j']['show'] = false;
} else
    $this->_sections['j']['total'] = 0;
if ($this->_sections['j']['show']):

            for ($this->_sections['j']['index'] = $this->_sections['j']['start'], $this->_sections['j']['iteration'] = 1;
                 $this->_sections['j']['iteration'] <= $this->_sections['j']['total'];
                 $this->_sections['j']['index'] += $this->_sections['j']['step'], $this->_sections['j']['iteration']++):
$this->_sections['j']['rownum'] = $this->_sections['j']['iteration'];
$this->_sections['j']['index_prev'] = $this->_sections['j']['index'] - $this->_sections['j']['step'];
$this->_sections['j']['index_next'] = $this->_sections['j']['index'] + $this->_sections['j']['step'];
$this->_sections['j']['first']      = ($this->_sections['j']['iteration'] == 1);
$this->_sections['j']['last']       = ($this->_sections['j']['iteration'] == $this->_sections['j']['total']);
?>
			<li><a href="<?php echo $this->_tpl_vars['funcoes'][$this->_sections['i']['index']]['filhos'][$this->_sections['j']['index']]['link']; ?>
"><?php echo $this->_tpl_vars['funcoes'][$this->_sections['i']['index']]['filhos'][$this->_sections['j']['index']]['nome']; ?>
</a></li>
		<?php endfor; endif; ?>
		</ul>
	</li>
<?php endfor; endif; ?>
	<li><a href="sair.php">Sair</a></li>
</ul>
<?php endif; ?>
</div>

<br />
<br />

<?php if ($this->_tpl_vars['subtitulo'] != ""): ?>
	<div id="subtitulo" style="border:1px solid red;">
		<img src="<?php echo $this->_tpl_vars['tpl_dir']; ?>
/images/subtitulo.png" alt="<?php echo $this->_tpl_vars['funcoes'][$this->_sections['i']['index']]['nome']; ?>
" width="16" height="16" hspace="5" border="0" align="absmiddle" /><?php echo $this->_tpl_vars['subtitulo']; ?>

	</div>
	<br />
<?php endif; ?>

	<div id="mensagem" style="display:none;">
<?php if ($this->_tpl_vars['msg'] <> ""): ?>
	<?php echo $this->_tpl_vars['msg']; ?>

	<script>document.getElementById("mensagem").style.display="block";</script>
<?php endif; ?>
	</div>

		<div id="erro" style="display:none;">
		Ocorreram os seguintes erros:
<?php if ($this->_tpl_vars['erros']['fatal'] <> ""): ?>
		<?php unset($this->_sections['i']);
$this->_sections['i']['name'] = 'i';
$this->_sections['i']['loop'] = is_array($_loop=$this->_tpl_vars['erros']['fatal']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['i']['show'] = true;
$this->_sections['i']['max'] = $this->_sections['i']['loop'];
$this->_sections['i']['step'] = 1;
$this->_sections['i']['start'] = $this->_sections['i']['step'] > 0 ? 0 : $this->_sections['i']['loop']-1;
if ($this->_sections['i']['show']) {
    $this->_sections['i']['total'] = $this->_sections['i']['loop'];
    if ($this->_sections['i']['total'] == 0)
        $this->_sections['i']['show'] = false;
} else
    $this->_sections['i']['total'] = 0;
if ($this->_sections['i']['show']):

            for ($this->_sections['i']['index'] = $this->_sections['i']['start'], $this->_sections['i']['iteration'] = 1;
                 $this->_sections['i']['iteration'] <= $this->_sections['i']['total'];
                 $this->_sections['i']['index'] += $this->_sections['i']['step'], $this->_sections['i']['iteration']++):
$this->_sections['i']['rownum'] = $this->_sections['i']['iteration'];
$this->_sections['i']['index_prev'] = $this->_sections['i']['index'] - $this->_sections['i']['step'];
$this->_sections['i']['index_next'] = $this->_sections['i']['index'] + $this->_sections['i']['step'];
$this->_sections['i']['first']      = ($this->_sections['i']['iteration'] == 1);
$this->_sections['i']['last']       = ($this->_sections['i']['iteration'] == $this->_sections['i']['total']);
?><li style="list-style:square"><?php echo $this->_tpl_vars['erros']['fatal'][$this->_sections['i']['index']]; ?>
</li><?php endfor; endif; ?>
		<script>document.getElementById("erro").style.display="block";</script>
<?php endif; ?>
		</div>
		<div id="alerta" style="display:none;">
<?php if ($this->_tpl_vars['erros']['alerta'] <> ""): ?>
		<script>document.getElementById("alerta").style.display="block";</script>
		O sistema retornou os seguintes alertas:
		<?php unset($this->_sections['i']);
$this->_sections['i']['name'] = 'i';
$this->_sections['i']['loop'] = is_array($_loop=$this->_tpl_vars['erros']['alerta']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['i']['show'] = true;
$this->_sections['i']['max'] = $this->_sections['i']['loop'];
$this->_sections['i']['step'] = 1;
$this->_sections['i']['start'] = $this->_sections['i']['step'] > 0 ? 0 : $this->_sections['i']['loop']-1;
if ($this->_sections['i']['show']) {
    $this->_sections['i']['total'] = $this->_sections['i']['loop'];
    if ($this->_sections['i']['total'] == 0)
        $this->_sections['i']['show'] = false;
} else
    $this->_sections['i']['total'] = 0;
if ($this->_sections['i']['show']):

            for ($this->_sections['i']['index'] = $this->_sections['i']['start'], $this->_sections['i']['iteration'] = 1;
                 $this->_sections['i']['iteration'] <= $this->_sections['i']['total'];
                 $this->_sections['i']['index'] += $this->_sections['i']['step'], $this->_sections['i']['iteration']++):
$this->_sections['i']['rownum'] = $this->_sections['i']['iteration'];
$this->_sections['i']['index_prev'] = $this->_sections['i']['index'] - $this->_sections['i']['step'];
$this->_sections['i']['index_next'] = $this->_sections['i']['index'] + $this->_sections['i']['step'];
$this->_sections['i']['first']      = ($this->_sections['i']['iteration'] == 1);
$this->_sections['i']['last']       = ($this->_sections['i']['iteration'] == $this->_sections['i']['total']);
?><li style="list-style:square"><?php echo $this->_tpl_vars['erros']['alerta'][$this->_sections['i']['index']]; ?>
</li><?php endfor; endif; ?>
<?php endif; ?>
		</div>
		