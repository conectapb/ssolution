<?php /* Smarty version 2.6.18, created on 2008-08-01 09:20:22
         compiled from adm/index.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'date_format', 'adm/index.tpl', 7, false),)), $this); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_topo'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<br />
<strong>Bem-vindo(a), <?php echo $this->_tpl_vars['admin_nome']; ?>
</strong>
<br />
<?php if ($this->_tpl_vars['admin_ultacesso'] != ""): ?>
Seu &uacute;ltimo acesso foi em <?php echo ((is_array($_tmp=$this->_tpl_vars['admin_ultacesso'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d/%m/%Y &agrave;s %H:%M") : smarty_modifier_date_format($_tmp, "%d/%m/%Y &agrave;s %H:%M")); ?>
 pelo IP <?php echo $this->_tpl_vars['admin_ultacesso_ip']; ?>

<?php endif; ?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['tpl_adm_rodape'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>