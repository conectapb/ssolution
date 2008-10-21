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
			"codigo" => array("codigo","C�digo","varchar","n�o-requerido",$_REQUEST['codigo']),
			"razaosocial" => array("razaosocial","Raz�o Social","varchar","requerido",$_REQUEST['razaosocial']),
			"nomefantasia" => array("nomefantasia","Nome Fantasia","varchar","requerido",$_REQUEST['nomefantasia']),
			"cnpj" => array("cnpj","CNPJ","varchar","requerido",$_REQUEST['cnpj']),
			"inscestadual" => array("inscestadual","Inscri��o Estadual","varchar","requerido",$_REQUEST['inscestadual']),
			"inscmunicipal" => array("inscmunicipal","Inscri��o Municipal","varchar","requerido",$_REQUEST['inscmunicipal']),
			"responsavel" => array("responsavel","Respons�vel","varchar","requerido",$_REQUEST['responsavel']),
			"endereco" => array("endereco","Endere�o","varchar","requerido",$_REQUEST['endereco']),
			"numero" => array("numero","N�mero","varchar","requerido",$_REQUEST['numero']),
			"complemento" => array("complemento","Complemento","varchar","n�o-requerido",$_REQUEST['complemento']),
			"bairro" => array("bairro","Bairro","varchar","requerido",$_REQUEST['bairro']),
			"cep" => array("cep","CEP","varchar","requerido",$_REQUEST['cep']),
			"cidade" => array("cidade","Cidade","varchar","requerido",$_REQUEST['cidade']),
			"uf" => array("uf","UF","varchar","requerido",$_REQUEST['uf']),
			"tel_principal" => array("tel_principal","Telefone Principal","varchar","requerido",$_REQUEST['tel_principal']),
			"tel_comercial" => array("tel_comercial","Telefone Comercial","varchar","n�o-requerido",$_REQUEST['tel_comercial']),
			"tel_financeiro" => array("tel_financeiro","Telefone Financeiro","varchar","n�o-requerido",$_REQUEST['tel_financeiro']),
			"tel_suporte" => array("tel_suporte","Telefone Suporte","varchar","n�o-requerido",$_REQUEST['tel_suporte']),
			"celular1" => array("celular1","Celular 1","varchar","n�o-requerido",$_REQUEST['celular1']),
			"celular2" => array("celular2","Celular 2","varchar","n�o-requerido",$_REQUEST['celular2']),
			"celular3" => array("celular3","Celular 3","varchar","n�o-requerido",$_REQUEST['celular3']),
			"fax" => array("fax","FAX","varchar","n�o-requerido",$_REQUEST['fax']),
			"email_principal" => array("email_principal","E-mail Principal","email","requerido",$_REQUEST['email_principal']),
			"email_comercial" => array("email_comercial","E-mail Comercial","email","n�o-requerido",$_REQUEST['email_comercial']),
			"email_financeiro" => array("email_financeiro","E-mail Financeiro","email","n�o-requerido",$_REQUEST['email_financeiro']),
			"email_suporte" => array("email_suporte","E-mail Suporte","email","n�o-requerido",$_REQUEST['email_suporte']),
			"observacoes" => array("observacoes","Observa��es","varchar","n�o-requerido",$_REQUEST['observacoes'])
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
				$erro[] = "N�o foi possivel estabecer acesso ao banco de dados. Tente mais tarde...";
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
		die("ID faltando para altera��o");
	
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
		"id" => array("id","id","int","n�o-requerido",$valores['id']),
		"codigo" => array("codigo","C�digo","varchar","n�o-requerido",$valores['codigo']),
		"razaosocial" => array("razaosocial","Raz�o Social","varchar","requerido",$valores['razaosocial']),
		"nomefantasia" => array("nomefantasia","Nome Fantasia","varchar","requerido",$valores['nomefantasia']),
		"cnpj" => array("cnpj","CNPJ","varchar","requerido",$valores['cnpj']),
		"inscestadual" => array("inscestadual","Inscri��o Estadual","varchar","n�o-requerido",$valores['inscestadual']),
		"inscmunicipal" => array("inscmunicipal","Inscri��o Municipal","varchar","n�o-requerido",$valores['inscmunicipal']),
		"responsavel" => array("responsavel","Respons�vel","varchar","requerido",$valores['responsavel']),
		"endereco" => array("endereco","Endere�o","varchar","requerido",$valores['endereco']),
		"numero" => array("numero","N�mero","varchar","requerido",$valores['numero']),
		"complemento" => array("complemento","Complemento","varchar","n�o-requerido",$valores['complemento']),
		"bairro" => array("bairro","Bairro","varchar","n�o-requerido",$valores['bairro']),
		"cep" => array("cep","CEP","varchar","n�o-requerido",$valores['cep']),
		"cidade" => array("cidade","Cidade","varchar","requerido",$valores['cidade']),
		"uf" => array("uf","UF","varchar","requerido",$valores['uf']),
		"tel_principal" => array("tel_principal","Telefone Principal","varchar","requerido",$valores['tel_principal']),
		"tel_comercial" => array("tel_comercial","Telefone Comercial","varchar","n�o-requerido",$valores['tel_comercial']),
		"tel_financeiro" => array("tel_financeiro","Telefone Financeiro","varchar","n�o-requerido",$valores['tel_financeiro']),
		"tel_suporte" => array("tel_suporte","Telefone Suporte","varchar","n�o-requerido",$valores['tel_suporte']),
		"celular1" => array("celular1","Celular 1","varchar","requerido",$valores['celular1']),
		"celular2" => array("celular2","Celular 2","varchar","n�o-requerido",$valores['celular2']),
		"celular3" => array("celular3","Celular 3","varchar","n�o-requerido",$valores['celular3']),
		"fax" => array("fax","FAX","varchar","n�o-requerido",$valores['fax']),
		"email_principal" => array("email_principal","E-mail Principal","email","requerido",$valores['email_principal']),
		"email_comercial" => array("email_comercial","E-mail Comercial","email","n�o-requerido",$valores['email_comercial']),
		"email_financeiro" => array("email_financeiro","E-mail Financeiro","email","n�o-requerido",$valores['email_financeiro']),
		"email_suporte" => array("email_suporte","E-mail Suporte","email","n�o-requerido",$valores['email_suporte']),
		"observacoes" => array("observacoes","Observa��es","varchar","n�o-requerido",$valores['observacoes'])
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
		redir($thispage . "?msg=" . urlencode("Selecione o provedor a ser exclu�do"));
	
	bdDelete($tabela,"id=" . $id,$conexao);
	redir($thispage . "?modo=lst&msg=" . urlencode("Exclus�o efetuada"));
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
	
	$visual->assign('subtitulo','Manuten��o de Provedores');
	$visual->assign('dados',$dados);
	$visual->display('adm/provedores_listagem.tpl');
}
//}

// MODO DE LISTAGEM

?>