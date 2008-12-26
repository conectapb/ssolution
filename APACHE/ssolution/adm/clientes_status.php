<?
define('ROOT','../');
require(ROOT . 'configs.php');
require("logado.php");

$modo = $_REQUEST['modo'];
if($modo=="") $modo="lst";

$processa = $_REQUEST['processa'];

$id	= $_REQUEST['id'];
$tabela = "clientes_status";

$msg = $_REQUEST['msg'];
$visual->assign('msg',$msg);

if ($processa=="ok")
{
	# cada item do array campos eh um array com:
	# nome do campo no db , label do campo , tipo de dados do campo , requerido ou nao , valor obtido
	$campos = array(
        "nome" => array("nome","Nome","varchar","requerido",$_REQUEST['nome'])
	);
	
	$dados_ok	= true;
	$erros = valida_dados($campos);
			
	if(sizeof($erros)>0) $dados_ok = false;
	
	if ($dados_ok)
	{
		if($modo=="cad")
		{
			$str_campos = implode(",",array_keys($campos));
			foreach ($campos as $campo)
			{
				$str_valores[] = "'" . $campo[4] . "'";
			}
			$str_valores=implode(",",$str_valores);

			$cad = bdInsert(
				$tabela,
				$str_campos,
				$str_valores,
				$conexao
			);
		
			if($cad)
			{
				$msg = "Status cadastrado com sucesso!";
				redir($thispage . "?modo=cad&msg=" . urlencode($msg));
			}
			else
			{
				$erro[] = "Não foi possivel estabecer acesso ao banco de dados. Tente mais tarde...";
			}
		}
		else if($modo=="alt")
		{
			$chaves =  array_keys($campos);
			$str_valores="";
			
			for ($i=0; $i<sizeof($chaves); $i++)
			{
				$str_valores[] = $chaves[$i] . "='" . $campos[$chaves[$i]][4] . "'";
			}
										
			$str_valores = implode(",",$str_valores);
			$whr = "id=" . $id;

			$alt = bdUpdate(
				$tabela,
				$str_valores,
				$whr,
				$conexao
			);

			$msg = "Status alterado com sucesso!";
			redir($thispage . "?modo=lst&msg=" . urlencode($msg));
		}
	}
	else
	{
		$visual->assign('erros',$erros);
		$visual->assign('campos',$campos);
		$visual->assign('nome',$nome);
	}
}

if ($modo=="cad")
{
	$visual->assign('subtitulo','Cadastro de Status de Cliente');
	$visual->assign('botao','Cadastrar');
	$visual->assign('modo',$modo);
	$visual->display('adm/clientes_status_formulario.tpl');
}
else if ($modo=="alt")
{
	$visual->assign('subtitulo','Alteração de Status de Cliente');
	$visual->assign('botao','Alterar');
	$visual->assign('modo','alt');

	if (!is_numeric($id))
		die("ID faltando para alteração");
	
	$res = bdSelect(
		"*",
		$tabela,
		"id=" . $id,
		"",
		$conexao
	);
	
	if (!bdNumReg($res))
		die("Nenhum registro para o ID '" . $id . "'");
	
	$valores = mysql_fetch_assoc($res);
	$campos = array(
		"id" => array("id","id","int","não-requerido",$valores['id']),
		"nome" => array("nome","Nome","varchar","requerido",$valores['nome'])
	);
	$visual->assign('campos',$campos);
	$visual->display('adm/clientes_status_formulario.tpl');
}
else if ($modo=="exc")
{
	if (!is_numeric($id))
		redir($thispage . "?msg=" . urlencode("Selecione o status de cliente a ser excluído"));
	
	bdDelete($tabela,"id=" . $id,$conexao);
	redir($thispage . "?modo=lst&msg=" . urlencode("Exclusão efetuada"));
}
else if($modo=="lst")
{
    $dados = sql2array(
		"SELECT COUNT(B.id) AS n_clientes,A.*
		FROM clientes_status A
		LEFT JOIN clientes B ON B.status_id = A.id
		GROUP BY A.id
		ORDER BY A.id",
		$conexao
	);
	
	while ($tmp = mysql_fetch_assoc($res))
		$dados[] = $tmp;
	
	$visual->assign('subtitulo','Manutenção de Status de Clientes');
	$visual->assign('dados',$dados);
	$visual->display('adm/clientes_status_listagem.tpl');
}
//}

// MODO DE LISTAGEM

?>