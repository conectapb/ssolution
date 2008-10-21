<?
define('ROOT','../');
require(ROOT . 'configs.php');
require("logado.php");

inicializaEstados();

$modo = $_REQUEST['modo'];
if($modo=="") $modo="lst";

$processa = $_REQUEST['processa'];

$id	= $_REQUEST['id'];
$tabela = "contatos";

$msg = $_REQUEST['msg'];
$visual->assign('msg',$msg);

if ($processa=="ok")
{
	# cada item do array campos eh um array com:
	# nome do campo no db , label do campo , tipo de dados do campo , requerido ou nao , valor obtido
	$campos = array(
			"nome" => array("nome","Nome","varchar","requerido",$_REQUEST['nome']),
			"empresa" => array("empresa","Empresa","varchar","não-requerido",$_REQUEST['empresa']),
			"tipo" => array("tipo","Tipo","varchar","requerido",$_REQUEST['tipo']),
			"edificio" => array("edificio","Edifício/Condomínio","varchar","não-requerido",$_REQUEST['edificio']),
			"endereco" => array("endereco","Endereço","varchar","não-requerido",$_REQUEST['endereco']),
			"numero" => array("numero","Nº","varchar","nao-requerido",$_REQUEST['numero']),
			"complemento" => array("complemento","Complemento","varchar","nao-requerido",$_REQUEST['complemento']),
			"bairro" => array("bairro","Bairro","varchar","nao-requerido",$_REQUEST['bairro']),
			"cep" => array("cep","CEP","varchar","nao-requerido",$_REQUEST['cep']),
			"cidade" => array("cidade","Cidade","varchar","não-requerido",$_REQUEST['cidade']),
			"uf" => array("uf","UF","varchar","não-requerido",$_REQUEST['uf']),
			"telefone1" => array("telefone1","Telefone 1","varchar","não-requerido",$_REQUEST['telefone1']),
			"telefone2" => array("telefone2","Telefone 2","varchar","não-requerido",$_REQUEST['telefone2']),
			"celular1" => array("celular1","Celular 1","varchar","nao-requerido",$_REQUEST['celular1']),
			"celular2" => array("celular2","Celular 2","varchar","nao-requerido",$_REQUEST['celular2']),
			"email1" => array("email1","E-mail 1","varchar","nao-requerido",$_REQUEST['email1']),
			"email2" => array("email2","E-mail 2","varchar","nao-requerido",$_REQUEST['email2']),
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
				$msg = "Contato cadastrado com sucesso!";
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

			$msg = "Contato alterado com sucesso!";
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
	$visual->assign('subtitulo','Cadastro de Contato');
	$visual->assign('botao','Cadastrar');
	$visual->assign('modo',$modo);
	$visual->display('adm/contatos_formulario.tpl');
}
else if ($modo=="alt")
{
	$visual->assign('subtitulo','Altera&ccedil;&atilde;o de Contato');
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
		"nome" => array("nome","Nome","varchar","não-requerido",$valores['nome']),
		"empresa" => array("empresa","Empresa","varchar","não-requerido",$valores['empresa']),
		"tipo" => array("tipo","Tipo","varchar","requerido",$valores['tipo']),
		"edificio" => array("edificio","Edifício/Condomínio","varchar","nao-requerido",$valores['edificio']),
		"endereco" => array("endereco","Endereço","varchar","não-requerido",$valores['endereco']),
		"numero" => array("numero","Nº","varchar","nao-requerido",$valores['numero']),
		"complemento" => array("complemento","Complemento","varchar","nao-requerido",$valores['complemento']),
		"bairro" => array("bairro","Bairro","varchar","nao-requerido",$valores['bairro']),
		"cep" => array("cep","CEP","varchar","nao-requerido",$valores['cep']),
		"cidade" => array("cidade","Cidade","varchar","não-requerido",$valores['cidade']),
		"uf" => array("uf","UF","selecao","não-requerido",$valores['uf']),
		"telefone1" => array("telefone1","Telefone 1","varchar","não-requerido",$valores['telefone1']),
		"telefone2" => array("telefone2","Telefone 2","varchar","não-requerido",$valores['telefone2']),
		"celular1" => array("celular1","Celular 1","varchar","nao-requerido",$valores['celular1']),
		"celular2" => array("celular2","Celular 2","varchar","nao-requerido",$valores['celular2']),
		"email1" => array("email1","E-mail 1","varchar","nao-requerido",$valores['email1']),
		"email2" => array("email2","E-mail 2","varchar","nao-requerido",$valores['email2']),
		"observacoes" => array("observacoes","Observações","varchar","não-requerido",$valores['observacoes'])
	);
	$visual->assign('campos',$campos);
	$visual->display('adm/contatos_formulario.tpl');
}
else if ($modo=="exc")
{
	if (!is_numeric($id))
		redir($thispage . "?msg=" . urlencode("Selecione o contato a ser excluído"));
	
	bdDelete($tabela,"id=" . $id,$conexao);
	redir($thispage . "?modo=lst&msg=" . urlencode("Exclusão efetuada"));
}
else if($modo=="lst")
{
	$whr = "";
	$res = bdSelect(
		"*",
		$tabela,
		$whr,
		"nome",
		$conexao
	);
	
	while ($tmp = mysql_fetch_assoc($res))
		$dados[] = $tmp;
	
	$visual->assign('subtitulo','Manutenção de Contatos');
	$visual->assign('dados',$dados);
	$visual->display('adm/contatos_listagem.tpl');
}
?>
