<?
define('ROOT','../');
require(ROOT . 'configs.php');
require("logado.php");

$modo		= $_REQUEST['modo'];
$processa	= $_REQUEST['processa'];
$id			= $_REQUEST['id'];
$msg		= $_REQUEST['msg'];

$tabela = "admins";

// MODO DE CADASTRO
if ($modo=="cad")
{
	if ($processa=="ok")
	{
		$nome	= $_REQUEST['nome'];
		$login_form	= $_REQUEST['login_form'];
		$senha_form	= $_REQUEST['senha_form'];
		
		$dados_ok	= true;
		
		if ($dados_ok)
		{
			$campos		= "nome,login,senha,data";
			$valores	= "'" . $nome .  "','" . $login_form . "',MD5('" . $senha_form . "'),NOW()";
			bdInsert(
				$tabela,
				$campos,
				$valores,
				$conexao
			);
			
			$msg = "Administrador cadastrado com sucesso!";
			redir($thispage . "?modo=cad&msg=" . urlencode($msg));
		}
		else
		{
			$visual->assign('nome',$nome_form);
			$visual->assign('login_form',$login_form);
			$visual->assign('senha_form',$senha_form);
		}
	}
	
	$visual->assign('subtitulo','Cadastrar Administrador');
	$visual->assign('botao','Cadastrar');
	$visual->assign('msg',$msg);
	$visual->assign('modo',$modo);

	$visual->display('adm/administradores_formulario.tpl');
}

// MODO DE ALTERACAO
else if ($modo=="alt")
{
	if (!is_numeric($id))
		redir("administradores.php?modo=alt_lst&msg=" . urlencode("Selecione o administrador a ser alterado"));
	
	if ($_SESSION['admin_id']!=1 && $id!=$_SESSION['admin_id'])
		redir("index.php?msg=" . urlencode("Você não tem permissão para acessar esta área!"));
	
	$subtitulo		= "Alterar Administrador";
	$botao			= "Alterar";
	
	if ($processa=="ok")
	{
		$nome	= $_REQUEST['nome'];
		$login_form	= $_REQUEST['login_form'];
		$senha_form	= $_REQUEST['senha_form'];
		
		$dados_ok	= true;
		
		if ($dados_ok)
		{
			$val	= "nome='" . $nome . "',login='" . $login_form . "',senha=MD5('" . $senha_form . "')";
			$whr 	= "id=" . $id;
			
			bdUpdate(
				$tabela,
				$val,
				$whr,
				$conexao
			);
			
			$msg = "Administrador alterado com sucesso!";
			redir ("administradores.php?modo=alt_lst&msg=" . urlencode($msg));
		}
		
		redir($thispage . "?modo=alt&id=". $id. "&msg=" . urlencode($msg));
	}
	
	$res = bdSelect("*",$tabela,"id=" . $id,"",$conexao);
	if (!bdNumReg($res))
		redir ("administradores.php?modo=alt_lst&msg=" . urlencode("Selecione um administrador válido para alterar"));
	$arr = mysql_fetch_array($res);
	
	$visual->assign('subtitulo','Alterar Administrador');
	$visual->assign('botao','Alterar');
	$visual->assign('msg',$msg);
	$visual->assign('modo',$modo);
	
	$visual->assign('id',$arr['id']);
	$visual->assign('nome',$arr['nome']);
	$visual->assign('login_form',$arr['login']);
	$visual->assign('senha_form',$arr['senha']);
	
	$visual->display('adm/administradores_formulario.tpl');
}

// MODO DE EXCLUSAO
else if ($modo=="exc")
{
	if ($_SESSION['admin_id']!=1)
		redir("index.php?msg=" . urlencode("Você não tem permissão para acessar esta área!"));
	if (!is_numeric($id))
		redir("administradores.php?msg=" . urlencode("Selecione o administrador a ser excluído"));
	
	bdDelete($tabela,"id=" . $id,$conexao);
	redir("administradores.php?modo=exc_lst&msg=" . urlencode("Exclusão efetuada"));
}

// MODO DE LISTAGEM
else
{
	if ($_SESSION['admin_id']==1)
		$whr = "";
	else
		$whr = "id=" . $_SESSION['admin_id'];

	$res=bdSelect(
		"id,nome,login,ultacesso,ultacesso_ip",
		"admins",
		$whr,
		"id",
		$conexao
	);
	
	while ($tmp=mysql_fetch_assoc($res))
		$dados[] = $tmp;
	
	$visual->assign('subtitulo','Gerenciar administradores');
	$visual->assign('dados',$dados);
	$visual->display('adm/administradores_listagem.tpl');
}
?>