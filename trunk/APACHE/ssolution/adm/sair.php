<?
define('ROOT','../');
require(ROOT . 'configs.php');

session_start();

// LOGA SAIDA EM LOGS_ADMIN
logAdm($conexao,$_SESSION['admin_login'],"Logout");

$_SESSION['admin_id']			= "";
$_SESSION['admin_nome']			= "";
$_SESSION['admin_login']		= "";
$_SESSION['adm_ultacesso']		= "";
$_SESSION['adm_ultacesso_ip']	= "";
$_SESSION['url']	= "";
$_SESSION['tpl_adm']			= "";

redir("login.php?msg=" . urlencode("Sessão encerrada com sucesso"));
?>