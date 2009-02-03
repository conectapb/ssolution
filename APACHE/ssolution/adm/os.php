<?php
define('ROOT','../');
define('AREA','os');
require(ROOT . 'configs.php');

$modo = $_REQUEST['modo'];
if($modo=="") $modo="lst";

require("logado.php");

if ($modo=="cad")
{
	inicializaEstados();

	$visual->assign('subtitulo','Cadastro de Ordem de Serviço');
	$visual->assign('botao','Cadastrar');
	$visual->assign('modo',$modo);
	$visual->display('adm/os_formulario.tpl');
}

?>
