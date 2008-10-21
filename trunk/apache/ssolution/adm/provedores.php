<?
define('ROOT','../');
require(ROOT . 'configs.php');
require("logado.php");

$modo = $_REQUEST['modo'];
if($modo=="") $modo="lst";

$processa = $_REQUEST['processa'];

$id	= $_REQUEST['id'];
$tabela = "provedores";

$msg = $_REQUEST['msg'];
$visual->assign('msg',$msg);

if ($processa=="ok")
{
	# cada item do array campos eh um array com:
	# nome do campo no db , label do campo , tipo de dados do campo , requerido ou nao , valor obtido
	$campos = array(
			"codigo" => array("codigo","Código","varchar","não-requerido",$_REQUEST['codigo']),
			"razaosocial" => array("razaosocial","Razão Social","varchar","requerido",$_REQUEST['razaosocial']),
			"nomefantasia" => array("nomefantasia","Nome Fantasia","varchar","requerido",$_REQUEST['nomefantasia']),
			"cnpj" => array("cnpj","CNPJ","varchar","requerido",$_REQUEST['cnpj']),
			"inscestadual" => array("inscestadual","Inscrição Estadual","varchar","requerido",$_REQUEST['inscestadual']),
			"inscmunicipal" => array("inscmunicipal","Inscrição Municipal","varchar","requerido",$_REQUEST['inscmunicipal']),
			"responsavel" => array("responsavel","Responsável","varchar","requerido",$_REQUEST['responsavel']),
			"endereco" => array("endereco","Endereço","varchar","requerido",$_REQUEST['endereco']),
			"numero" => array("numero","Número","varchar","requerido",$_REQUEST['numero']),
			"complemento" => array("complemento","Complemento","varchar","não-requerido",$_REQUEST['complemento']),
			"bairro" => array("bairro","Bairro","varchar","requerido",$_REQUEST['bairro']),
			"cep" => array("cep","CEP","varchar","requerido",$_REQUEST['cep']),
			"cidade" => array("cidade","Cidade","varchar","requerido",$_REQUEST['cidade']),
			"uf" => array("uf","UF","varchar","requerido",$_REQUEST['uf']),
			"tel_principal" => array("tel_principal","Telefone Principal","varchar","requerido",$_REQUEST['tel_principal']),
			"tel_comercial" => array("tel_comercial","Telefone Comercial","varchar","não-requerido",$_REQUEST['tel_comercial']),
			"tel_financeiro" => array("tel_financeiro","Telefone Financeiro","varchar","não-requerido",$_REQUEST['tel_financeiro']),
			"tel_suporte" => array("tel_suporte","Telefone Suporte","varchar","não-requerido",$_REQUEST['tel_suporte']),
			"celular1" => array("celular1","Celular 1","varchar","não-requerido",$_REQUEST['celular1']),
			"celular2" => array("celular2","Celular 2","varchar","não-requerido",$_REQUEST['celular2']),
			"celular3" => array("celular3","Celular 3","varchar","não-requerido",$_REQUEST['celular3']),
			"fax" => array("fax","FAX","varchar","não-requerido",$_REQUEST['fax']),
			"email_principal" => array("email_principal","E-mail Principal","email","requerido",$_REQUEST['email_principal']),
			"email_comercial" => array("email_comercial","E-mail Comercial","email","não-requerido",$_REQUEST['email_comercial']),
			"email_financeiro" => array("email_financeiro","E-mail Financeiro","email","não-requerido",$_REQUEST['email_financeiro']),
			"email_suporte" => array("email_suporte","E-mail Suporte","email","não-requerido",$_REQUEST['email_suporte']),
			"observacoes" => array("observacoes","Observações","varchar","não-requerido",$_REQUEST['observacoes'])
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
				$msg = "Provedor cadastrado com sucesso!";
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

			$msg = "Provedor alterado com sucesso!";
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
	$visual->assign('subtitulo','Cadastro de Provedor');
	$visual->assign('botao','Cadastrar');
	$visual->assign('modo',$modo);
	$visual->display('adm/provedores_formulario.tpl');
}
else if ($modo=="alt" || $modo=="vis")
{
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
		"razaosocial" => array("razaosocial","Razão Social","varchar","requerido",$valores['razaosocial']),
		"nomefantasia" => array("nomefantasia","Nome Fantasia","varchar","requerido",$valores['nomefantasia']),
		"cnpj" => array("cnpj","CNPJ","varchar","requerido",$valores['cnpj']),
		"inscestadual" => array("inscestadual","Inscrição Estadual","varchar","não-requerido",$valores['inscestadual']),
		"inscmunicipal" => array("inscmunicipal","Inscrição Municipal","varchar","não-requerido",$valores['inscmunicipal']),
		"responsavel" => array("responsavel","Responsável","varchar","requerido",$valores['responsavel']),
		"endereco" => array("endereco","Endereço","varchar","requerido",$valores['endereco']),
		"numero" => array("numero","Número","varchar","requerido",$valores['numero']),
		"complemento" => array("complemento","Complemento","varchar","não-requerido",$valores['complemento']),
		"bairro" => array("bairro","Bairro","varchar","não-requerido",$valores['bairro']),
		"cep" => array("cep","CEP","varchar","não-requerido",$valores['cep']),
		"cidade" => array("cidade","Cidade","varchar","requerido",$valores['cidade']),
		"uf" => array("uf","UF","varchar","requerido",$valores['uf']),
		"tel_principal" => array("tel_principal","Telefone Principal","varchar","requerido",$valores['tel_principal']),
		"tel_comercial" => array("tel_comercial","Telefone Comercial","varchar","não-requerido",$valores['tel_comercial']),
		"tel_financeiro" => array("tel_financeiro","Telefone Financeiro","varchar","não-requerido",$valores['tel_financeiro']),
		"tel_suporte" => array("tel_suporte","Telefone Suporte","varchar","não-requerido",$valores['tel_suporte']),
		"celular1" => array("celular1","Celular 1","varchar","requerido",$valores['celular1']),
		"celular2" => array("celular2","Celular 2","varchar","não-requerido",$valores['celular2']),
		"celular3" => array("celular3","Celular 3","varchar","não-requerido",$valores['celular3']),
		"fax" => array("fax","FAX","varchar","não-requerido",$valores['fax']),
		"email_principal" => array("email_principal","E-mail Principal","email","requerido",$valores['email_principal']),
		"email_comercial" => array("email_comercial","E-mail Comercial","email","não-requerido",$valores['email_comercial']),
		"email_financeiro" => array("email_financeiro","E-mail Financeiro","email","não-requerido",$valores['email_financeiro']),
		"email_suporte" => array("email_suporte","E-mail Suporte","email","não-requerido",$valores['email_suporte']),
		"observacoes" => array("observacoes","Observações","varchar","não-requerido",$valores['observacoes'])
	);
	$visual->assign('campos',$campos);
	
	if($modo=="alt")
	{
		$visual->assign('subtitulo','Altera&ccedil;&atilde;o de Provedor');
		$visual->assign('botao','Alterar');
		$visual->assign('modo','alt');
		$visual->display('adm/provedores_formulario.tpl');
	}
	else
	{
		echo utf8_encode($visual->fetch('adm/provedores_visualizar.tpl'));
	}
}
else if ($modo=="exc")
{
	if (!is_numeric($id))
		redir($thispage . "?msg=" . urlencode("Selecione o provedor a ser excluído"));
	
	bdDelete($tabela,"id=" . $id,$conexao);
	redir($thispage . "?modo=lst&msg=" . urlencode("Exclusão efetuada"));
}
else if($modo=="lst")
{
	$whr = "";
	$res = bdSelect(
		"id,codigo,razaosocial,responsavel,tel_principal,email_principal",
		$tabela,
		$whr,
		"razaosocial,responsavel",
		$conexao
	);
	
	while ($tmp = mysql_fetch_assoc($res))
		$dados[] = $tmp;
	
	$visual->assign('subtitulo','Manutenção de Provedores');
	$visual->assign('dados',$dados);
	$visual->display('adm/provedores_listagem.tpl');
}
//}

// MODO DE LISTAGEM

?>