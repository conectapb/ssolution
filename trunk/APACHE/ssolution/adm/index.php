<?
define('ROOT','../');
require(ROOT . 'configs.php');
require("logado.php");


$visual->assign('admin_nome',$_SESSION['admin_nome']); 
$visual->assign('admin_ultacesso',$_SESSION['admin_ultacesso']); 
$visual->assign('admin_ultacesso_ip',$_SESSION['admin_ultacesso_ip']); 
$visual->assign('msg',$_REQUEST['msg']); 

$visual->display("adm/index.tpl");
?>