<?
session_start();

define('ROOT','../');
require(ROOT . 'configs.php');

$processa = $_REQUEST['processa'];

if ($processa=="ok")
{
	$campos = array(
		"login" => array("login","Usuário","login","requerido",$_REQUEST['login']),
		"senha" => array("senha","Senha","senha","requerido",$_REQUEST['senha'])
	);
	
	$dados_ok = true;
	$erros = valida_dados($campos);
	
	if(sizeof($erros)>0) $dados_ok = false;
	
	if ($dados_ok)
	{
		$res = bdSelect(
			"*",
			"admins",
			"ativo=1 AND login='" . $campos['login'][4] . "' AND senha='" . md5($campos['senha'][4]) . "' LIMIT 1",
			"",
			$conexao
		);
		
		if(!bdNumReg($res))
			$msg = "Usuário/Senha inválidos";
		else
		{
			$arr = mysql_fetch_assoc($res);
			$_SESSION['admin_id'] = $arr['id'];
			$_SESSION['admin_nome'] = $arr['nome'];
			$_SESSION['admin_login'] = $arr['login'];
				
			// RECUPERA ULTIMO ACESSO, CASO NAO SEJA O PRIMEIRO
			if ($arr['ultacesso']!="0000-00-00 00:00:00")
			{
				$_SESSION['admin_ultacesso'] = $arr['ultacesso'];
				$_SESSION['admin_ultacesso_ip'] = $arr['ultacesso_ip'];
			}
			else
			{
				$_SESSION['admin_ultacesso'] = "";
				$_SESSION['admin_ultacesso_ip'] = "";
			}
			// ATUALIZA ULTIMO ACESSO
			bdUpdate("admins","ultacesso_ip='" . $_SERVER['REMOTE_ADDR'] . "',ultacesso=NOW()","id=" . $arr['id'] , $conexao);
			
			// LOGA ACESSO EM LOGS_ADMIN
			logAdm($conexao,$_SESSION['admin_login'],"Login");
			
			// ENVIA PARA O INICIO, DESTA VEZ, DEVIDAMENTE LOGADO
			if($_SESSION['url']!="")
				redir($_SESSION['url']);
			else
				redir("index.php");
		}
	}
}
$visual->assign('tit_pagina','Acesso Restrito');
$visual->assign('msg',$msg);
$visual->assign('login',$login);

$visual->display('adm/login_formulario.tpl');
?>