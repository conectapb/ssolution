<?
define('ROOT','../');
require(ROOT . 'configs.php');
require("logado.php");

inicializaEstados();

$modo = $_REQUEST['modo'];
if($modo=="") $modo="lst";

$processa = $_REQUEST['processa'];

$id	= $_REQUEST['id'];
$tabela = "grupos";

$msg = $_REQUEST['msg'];
$visual->assign('msg',$msg);

if ($processa=="ok")
{
	# cada item do array campos eh um array com:
	# nome do campo no db , label do campo , tipo de dados do campo , requerido ou nao , valor obtido
	$campos = array(
			"nome_padrao" => array("nome_padrao","Nome Padrão","varchar","requerido",$_REQUEST['nome_padrao']),
			"codigo" => array("codigo","Código","varchar","não-requerido",$_REQUEST['codigo']),
			"tipo" => array("tipo","Tipo","selecao","requerido",$_REQUEST['tipo']),
			"nome" => array("nome","Nome","varchar","requerido",$_REQUEST['nome']),
			"endereco" => array("endereco","Endereço","varchar","não-requerido",$_REQUEST['endereco']),
			"numero" => array("numero","Nº","varchar","nao-requerido",$_REQUEST['numero']),
			"bairro" => array("bairro","Bairro","varchar","nao-requerido",$_REQUEST['bairro']),
			"cep" => array("cep","CEP","varchar","nao-requerido",$_REQUEST['cep']),
			"cidade" => array("cidade","Cidade","varchar","não-requerido",$_REQUEST['cidade']),
			"uf" => array("uf","UF","selecao","não-requerido",$_REQUEST['uf']),
			"observacoes" => array("observacoes","Observações","varchar","não-requerido",$_REQUEST['observacoes'])
			// "" => array("","","varchar","requerido",$_REQUEST['']),
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
				$msg = "Grupo cadastrado com sucesso!";
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

			$msg = "Grupo alterado com sucesso!";
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
	$visual->assign('tipos',table2array("grupos_tipos",$conexao));
	$visual->assign('subtitulo','Cadastro de Grupo');
	$visual->assign('botao','Cadastrar');
	$visual->assign('modo',$modo);
	$visual->display('adm/grupos_formulario.tpl');
}
else if ($modo=="alt")
{
	$visual->assign('tipos',table2array("grupos_tipos",$conexao));
	$visual->assign('subtitulo','Altera&ccedil;&atilde;o de Grupo');
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
		"id" => array("id","id","int","requerido",$valores['id']),
		"nome_padrao" => array("nome_padrao","Nome Padrão","varchar","requerido",$valores['nome_padrao']),
		"codigo" => array("codigo","Código","varchar","não-requerido",$valores['codigo']),
		"tipo" => array("tipo","Tipo","numero","requerido",$valores['tipo']),
		"nome" => array("nome","Nome","varchar","requerido",$valores['nome']),
		"endereco" => array("endereco","Endereço","varchar","não-requerido",$valores['endereco']),
		"numero" => array("numero","Nº","varchar","nao-requerido",$valores['numero']),
		"bairro" => array("bairro","Bairro","varchar","nao-requerido",$valores['bairro']),
		"cep" => array("cep","CEP","varchar","nao-requerido",$valores['cep']),
		"cidade" => array("cidade","Cidade","varchar","não-requerido",$valores['cidade']),
		"uf" => array("uf","UF","selecao","não-requerido",$valores['uf']),
		"observacoes" => array("observacoes","Observações","varchar","requerido",$valores['observacoes'])
	);
	$visual->assign('campos',$campos);
	$visual->display('adm/grupos_formulario.tpl');
}
else if ($modo=="exc")
{
	if (!is_numeric($id))
		redir($thispage . "?msg=" . urlencode("Selecione o cliente a ser excluído"));
	
	bdDelete($tabela,"id=" . $id,$conexao);
	redir($thispage . "?modo=lst&msg=" . urlencode("Exclusão efetuada"));
}
else if($modo=="lst")
{
	/*$res = bdSelect(
		"id,codigo,nome_padrao,nome,tipo,datacadastro",
		$tabela,
		$whr,
		"nome",
		$conexao
	);
	while ($tmp = mysql_fetch_assoc($res))
		$dados[] = $tmp;*/
	
	$dados = sql2array(
		"SELECT A.*,B.tipo
			FROM grupos A 
			INNER JOIN grupos_tipos B
			ON A.tipo = B.id
			ORDER BY A.codigo,A.nome",
		$conexao
	);

	$visual->assign('subtitulo','Gerenciar Grupos');
	$visual->assign('dados',$dados);
	$visual->display('adm/grupos_listagem.tpl');
}

?>