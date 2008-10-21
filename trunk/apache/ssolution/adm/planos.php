<?
define('ROOT','../');
require(ROOT . 'configs.php');
require("logado.php");

$modo = $_REQUEST['modo'];
if($modo=="") $modo="lst";

$processa = $_REQUEST['processa'];

$id	= $_REQUEST['id'];
$tabela = "planos";

$msg = $_REQUEST['msg'];
$visual->assign('msg',$msg);

if ($processa=="ok")
{

	$campos = array(
			"codigo" => array("codigo","Código","varchar","não-requerido",$_REQUEST['codigo']),
			"nome" => array("nome","Nome do Plano","varchar","requerido",$_REQUEST['nome']),
			"descricao" => array("descricao","Descrição","varchar","não-requerido",$_REQUEST['descricao']),
			"vel_download" => array("vel_download","Vel. Download","numero","requerido",$_REQUEST['vel_download']),
			"vel_upload" => array("vel_upload","Vel. Upload","numero","requerido",$_REQUEST['vel_upload']),
			"valor_base" => array("valor_base","Valor Base","varchar","requerido",double_server($_REQUEST['valor_base'])),
			"valor_pontoadicional" => array("valor_pontoadicional","Valor Ponto Adicional","varchar","não-requerido",double_server($_REQUEST['valor_pontoadicional'])),
			"fidelidade" => array("fidelidade","Fidelidade","checkbox","requerido",$_REQUEST['fidelidade']),
			"observacoes" => array("observacoes","Observações","varchar","não-requerido",$_REQUEST['observacoes'])
			//"" => array("","","varchar","requerido",$_REQUEST['']),
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
				$msg = "Plano cadastrado com sucesso!";
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

			$msg = "Plano alterado com sucesso!";
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
	$visual->assign('subtitulo','Cadastro de Plano');
	$visual->assign('botao','Cadastrar');
	$visual->assign('modo',$modo);
	$visual->display('adm/planos_formulario.tpl');
}
else if ($modo=="alt")
{
	$visual->assign('subtitulo','Altera&ccedil;&atilde;o de Plano');
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
		"codigo" => array("codigo","Código","varchar","não-requerido",$valores['codigo']),
		"nome" => array("nome","Nome do Plano","varchar","requerido",$valores['nome']),
		"descricao" => array("descricao","Descrição","varchar","não-requerido",$valores['descricao']),
		"vel_download" => array("vel_download","numero","varchar","requerido",$valores['vel_download']),
		"vel_upload" => array("vel_upload","numero","varchar","requerido",$valores['vel_upload']),
		"valor_base" => array("valor_base","Valor Base","varchar","requerido",double($valores['valor_base'])),
		"valor_pontoadicional" => array("valor_pontoadicional","Valor Ponto Adicional","varchar","não-requerido",double($valores['valor_pontoadicional'])),
		"fidelidade" => array("fidelidade","Fidelidade","checkbox","requerido",$valores['fidelidade']),
		"observacoes" => array("observacoes","Observações","varchar","não-requerido",$valores['observacoes'])
	);
	
	$visual->assign('campos',$campos);
	$visual->display('adm/planos_formulario.tpl');
}
else if ($modo=="exc")
{
	if (!is_numeric($id))
		redir($thispage . "?msg=" . urlencode("Selecione o provedor a ser excluído"));
		
	$res = bdSelect(
		"id",
		"contratos",
		"plano_id=" . $id,
		"",
		$conexao
	);
	if(!bdNumReg($res))
	{
		bdDelete($tabela,"id=" . $id,$conexao);
		$msg = "Exclusão efetuada";
	}
	else
	{
		$msg = "Ainda há contratos associados a este plano.<br />A exclusão não pôde ser efetuada";
	}
	redir($thispage . "?modo=lst&msg=" . urlencode($msg));
}
else if($modo=="lst")
{
	$whr = "";
	$res = bdSelect(
		"id,codigo,nome,vel_download,vel_upload,valor_base,valor_pontoadicional,fidelidade,datacadastro",
		$tabela,
		$whr,
		"codigo,nome",
		$conexao
	);
	
	while ($tmp = mysql_fetch_assoc($res))
	{
		$res2 = bdSelect(
			"COUNT(id) AS total",
			"contratos",
			"plano_id=" . $tmp['id'],
			"",
			$conexao
		);
		$tmp['contratos'] = mysql_result($res2,0);
		$dados[] = $tmp;
	}
	$visual->assign('subtitulo','Manutenção de Planos');
	$visual->assign('dados',$dados);
	$visual->display('adm/planos_listagem.tpl');
}

?>
