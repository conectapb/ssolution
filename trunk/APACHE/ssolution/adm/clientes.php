<?
define('ROOT','../');
define('AREA','clientes');
require(ROOT . 'configs.php');

$modo = $_REQUEST['modo'];
if($modo=="") $modo="lst";
require("logado.php");

function pegaUltimoCodigo($conn){
	$res = bdSelect("*","grupos","","",$conn);
	while($tmp=mysql_fetch_assoc($res))
	{
		$res2 = bdSelect("codigo","clientes","grupo_id=" . $tmp['id'],"codigo DESC",$conn);
		if (bdNumReg($res2))
			$tmp['ultimo_codigo']=pad(mysql_result($res2,0)+1,5);
		else
			$tmp['ultimo_codigo']=pad($tmp['codigo']."001",5);

		$grupos[]=$tmp;
	}
	return $grupos;
}

$processa = $_REQUEST['processa'];

$id	= $_REQUEST['id'];
$tabela = "clientes";

$gru	= $_REQUEST['gru'];
$visual->assign("gru",$gru);

$msg = $_REQUEST['msg'];
$visual->assign('msg',$msg);

if ($processa=="ok")
{
	if($_REQUEST['tipo']==CLIENTE_TIPO_PF)
	{
		$obrigatorio_pf = "requerido";
		$importante_pf = "importante";
		$obrigatorio_pj = "não-requerido";
		$importante_pj = "não-requerido";
	}
	else if($_REQUEST['tipo']==CLIENTE_TIPO_PJ)
	{
		$obrigatorio_pf = "não-requerido";
		$importante_pf = "não-requerido";
		$obrigatorio_pj = "requerido";
		$importante_pj = "importante";
	}
	
	$campos = array(
		"status_id" => array("codigo","Status","varchar","requerido",$_REQUEST['status_id']),
        "tipo" => array("tipo","Tipo","selecao","requerido",$_REQUEST['tipo']),
        "codigo" => array("codigo","Código","varchar","não-requerido",$_REQUEST['codigo']),
		"nome" => array("nome","Nome","varchar",$obrigatorio_pf,$_REQUEST['nome']),
		"nascimento" => array("nascimento","Nascimento","data",$importante_pf,data_server($_REQUEST['nascimento'])),
		"rg" => array("rg","RG","varchar",$importante_pf,$_REQUEST['rg']),
		"cpf" => array("cpf","CPF","cpf",$importante_pf,$_REQUEST['cpf']),
		"sexo" => array("sexo","Sexo","varchar",$obrigatorio_pf,$_REQUEST['sexo']),
		"razao_social" => array("razao_social","Razão Social",$importante_pj,"requerido",$_REQUEST['razao_social']),
		"nome_fantasia" => array("nome_fantasia","Nome Fantasia","varchar",$obrigatorio_pj,$_REQUEST['nome_fantasia']),
		"cnpj" => array("cnpj","CNPJ","varchar",$importante_pj,$_REQUEST['cnpj']),
		"inscr_municipal" => array("inscr_municipal","Inscr. Municipal","varchar","não-requerido",$_REQUEST['inscr_municipal']),
		"inscr_estadual" => array("inscr_estadual","Inscr. Estadual","varchar","não-requerido",$_REQUEST['inscr_estadual']),
		"grupo_id" => array("grupo_id","Grupo","selecao","não-requerido",$_REQUEST['grupo_id']),
		"endereco" => array("endereco","Endereço","varchar","não-requerido",$_REQUEST['endereco']),
		"numero" => array("numero","Nº","varchar","nao-requerido",$_REQUEST['numero']),
		"complemento_tipo" => array("complemento_tipo","Tipo do complemento","varchar","nao-requerido",$_REQUEST['complemento_tipo']),
		"bloco" => array("bloco","Bloco","varchar","nao-requerido",$_REQUEST['bloco']),
		"complemento" => array("complemento","Complemento","varchar","nao-requerido",$_REQUEST['complemento']),
		"bairro" => array("bairro","Bairro","varchar","nao-requerido",$_REQUEST['bairro']),
		"cep" => array("cep","CEP","varchar","nao-requerido",$_REQUEST['cep']),
		"cidade" => array("cidade","Cidade","varchar","não-requerido",$_REQUEST['cidade']),
		"uf" => array("uf","UF","varchar","não-requerido",$_REQUEST['uf']),
		"tel_residencial" => array("tel_residencial","Tel. Residencial","varchar","não-requerido",$_REQUEST['tel_residencial']),
		"tel_comercial" => array("tel_comercial","Tel. Comercial","varchar","nao-requerido",$_REQUEST['tel_comercial']),
		"fax" => array("fax","Fax ","varchar","nao-requerido",$_REQUEST['fax']),
		"tel_celular1" => array("tel_celular1","Celular 1","varchar","nao-requerido",$_REQUEST['tel_celular1']),
		"tel_celular2" => array("tel_celular2","Celular 2","varchar","nao-requerido",$_REQUEST['tel_celular2']),
		"site" => array("site","Site","varchar","nao-requerido",$_REQUEST['site']),
		"email1" => array("email1","E-mail 1","varchar","nao-requerido",$_REQUEST['email1']),
		"email2" => array("email2","E-mail 2","varchar","nao-requerido",$_REQUEST['email2']),
		"email3" => array("email3","E-mail 3","varchar","nao-requerido",$_REQUEST['email3']),
		"msn_messenger" => array("msn_messenger","MSN Messenger","varchar","nao-requerido",$_REQUEST['msn_messenger']),
		"yahoo_messenger" => array("yahoo_messenger","Yahoo Messenger","varchar","nao-requerido",$_REQUEST['yahoo_messenger']),
		"skype" => array("skype","Skype","varchar","nao-requerido",$_REQUEST['skype']),
		"observacoes" => array("observacoes","Observações","varchar","não-requerido",$_REQUEST['observacoes'])
		// "" => array("","","varchar","requerido",$_REQUEST['']),
	);
	
	$dados_ok	= true;
	$erros = valida_dados($campos);
			
	if(sizeof($erros['fatal'])>0) $dados_ok = false;
	
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
				logAdm($conexao,$_SESSION['admin_login'],"Cadastro Cliente ID=$cad Nome=" . $campos['nome'][4]);
				$msg = "Cliente cadastrado com sucesso!";
				redir($thispage . "?modo=cad&gru=". $gru . "&msg=" . urlencode($msg));
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

			if($alt)
			{
				logAdm($conexao,$_SESSION['admin_login'],"Alterado Cliente ID=" . $id . " Nome=" . $campos['nome'][4]);
				$msg = "Cliente alterado com sucesso!";
				
				if(sizeof($erros['alerta'])>0)
				{
					$visual->assign('msg',$msg);
					$visual->assign('erros',$erros);
				}
				else
				{
					redir($thispage . "?modo=lst&gru=". $gru . "&msg=" . urlencode($msg));
				}
			}
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
	inicializaEstados();
	$grupos = pegaUltimoCodigo($conexao);
	$visual->assign('grupos',$grupos);
	$visual->assign('subtitulo','Cadastro de Cliente');
	$visual->assign('botao','Cadastrar');
	$visual->assign('modo',$modo);
	$visual->display('adm/clientes_formulario.tpl');
}
else if ($modo=="alt" || $modo=="vis")
{
	inicializaEstados();
	$grupos = pegaUltimoCodigo($conexao);
	$visual->assign('grupos',$grupos);
	$visual->assign('subtitulo','Altera&ccedil;&atilde;o de Cliente');
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
	if($valores['tipo']==CLIENTE_TIPO_PF)
	{
		$obrigatorio_pf = "requerido";
		$obrigatorio_pj = "não-requerido";
	}
	else if($_REQUEST['tipo']==CLIENTE_TIPO_PJ)
	{
		$obrigatorio_pj = "requerido";
		$obrigatorio_pf = "não-requerido";
	}
	$campos = array(
		"id" => array("id","id","int","requerido",$valores['id']),
		"status_id" => array("codigo","Status","varchar","requerido",$valores['status_id']),
        "tipo" => array("tipo","Tipo","selecao","requerido",$valores['tipo']),
		"codigo" => array("codigo","Código","varchar","não-requerido",pad($valores['codigo'],5)),
		"nome" => array("nome","Nome","varchar",$obrigatorio_pf,$valores['nome']),
		"nascimento" => array("nascimento","Nascimento","data",$importante_pf,$valores['nascimento']),
		"rg" => array("rg","RG","varchar",$importante_pf,$valores['rg']),
		"cpf" => array("cpf","CPF","cpf",$importante_pf,$valores['cpf']),
		"sexo" => array("sexo","Sexo","varchar",$importante_pf,$valores['sexo']),
		"razao_social" => array("razao_social","Razão Social",$importante_pj,"requerido",$valores['razao_social']),
		"nome_fantasia" => array("nome_fantasia","Nome Fantasia","varchar",$importante_pj,$valores['nome_fantasia']),
		"cnpj" => array("cnpj","CNPJ","varchar",$importante_pj,$valores['cnpj']),
		"inscr_municipal" => array("inscr_municipal","Inscr. Municipal","varchar","não-requerido",$valores['inscr_municipal']),
		"inscr_estadual" => array("inscr_estadual","Inscr. Estadual","varchar","não-requerido",$valores['inscr_estadual']),
		"grupo_id" => array("grupo_id","Grupo","selecao","não-requerido",$valores['grupo_id']),
		"endereco" => array("endereco","Endereço","varchar","não-requerido",$valores['endereco']),
		"numero" => array("numero","Nº","varchar","nao-requerido",$valores['numero']),
		"complemento_tipo" => array("complemento_tipo","Tipo do complemento","varchar","nao-requerido",$valores['complemento_tipo']),
		"complemento" => array("complemento","Complemento","varchar","nao-requerido",$valores['complemento']),
		"bloco" => array("bloco","Bloco","varchar","nao-requerido",$valores['bloco']),
		"bairro" => array("bairro","Bairro","varchar","nao-requerido",$valores['bairro']),
		"cep" => array("cep","CEP","varchar","nao-requerido",$valores['cep']),
		"cidade" => array("cidade","Cidade","varchar","não-requerido",$valores['cidade']),
		"uf" => array("uf","UF","selecao","não-requerido",$valores['uf']),
		"tel_residencial" => array("tel_residencial","Tel. Residencial","varchar","não-requerido",$valores['tel_residencial']),
		"tel_comercial" => array("tel_comercial","Tel. Comercial","varchar","nao-requerido",$valores['tel_comercial']),
		"fax" => array("fax","Fax ","varchar","nao-requerido",$valores['fax']),
		"tel_celular1" => array("tel_celular1","Celular 1","varchar","nao-requerido",$valores['tel_celular1']),
		"tel_celular2" => array("tel_celular2","Celular 2","varchar","nao-requerido",$valores['tel_celular2']),
		"site" => array("site","Site","varchar","nao-requerido",$valores['site']),
		"email1" => array("email1","E-mail 1","varchar","nao-requerido",$valores['email1']),
		"email2" => array("email2","E-mail 2","varchar","nao-requerido",$valores['email2']),
		"email3" => array("email3","E-mail 3","varchar","nao-requerido",$valores['email3']),
		"msn_messenger" => array("msn_messenger","MSN Messenger","varchar","nao-requerido",$valores['msn_messenger']),
		"yahoo_messenger" => array("yahoo_messenger","Yahoo Messenger","varchar","nao-requerido",$valores['yahoo_messenger']),
		"skype" => array("skype","Skype","varchar","nao-requerido",$valores['skype']),
		"observacoes" => array("observacoes","Observações","varchar","não-requerido",$valores['observacoes']),
		"datacadastro" => array("datacadastro","Data Cadastro","data","não-requerido",$valores['datacadastro'])
	);
	$visual->assign('campos',$campos);
	
	if($modo=="alt")
		$visual->display('adm/clientes_formulario.tpl');
	else if($modo=="vis")
		echo utf8_encode($visual->fetch('adm/clientes_visualizar.tpl'));
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
	unset($whr);

	if(is_numeric($_REQUEST['gru']) && $_REQUEST['gru'] > 0)
	{
		$whr[] = "CLI.grupo_id=" . $_REQUEST['gru'];
		$visual->assign('gru',$_REQUEST['gru']);
	}

	if(sizeof($whr)>0)
	{
		$whr = implode(" AND ", $whr);
		$whr = " WHERE " . $whr;
	}
	
	/*$res = bdSelect(
		"id,codigo,nome,tel_residencial,tel_comercial,datacadastro",
		$tabela,
		$whr,
		"codigo,grupo_id,nome",
		$conexao
	);*/
	
	$res = bdQuery("
		SELECT CLI.*,(IF(CLI.tipo=1,CLI.nome,CLI.razao_social)) AS nome,GRU.nome_padrao AS grupo
		FROM clientes CLI
		INNER JOIN grupos GRU ON CLI.grupo_id = GRU.id
		INNER JOIN clientes_status STA ON CLI.status_id = STA.id
		" . $whr . "
		ORDER BY GRU.codigo,grupo,CLI.nome
		",
		$conexao,0
	);
	
	while ($tmp = mysql_fetch_assoc($res))
	{
		$tmp['codigo'] = pad($tmp['codigo'],5);
		$dados[] = $tmp;
	}
	
	$visual->assign('grupos',table2array("grupos",$conexao," ORDER BY nome_padrao"));
	$visual->assign('subtitulo','Manutenção de Clientes');
	$visual->assign('dados',$dados);
	$visual->display('adm/clientes_listagem.tpl');
}
else if($modo=="obtemGrupos")
{
	echo "<option value=\"\"></option>";
	$res = bdSelect("*","grupos","","nome_padrao",$conexao);
	while($tmp = mysql_fetch_array($res))
		echo "<option value=\"" . $tmp['id'] . "\">" . $tmp['codigo'] . " - " . $tmp['nome_padrao'] . "</option>\n";
}
else if($modo=="obtemUmGrupo")
{
	$grpID = $_REQUEST['grpID'];
	$res = bdSelect("*","grupos","id=" . $grpID,"",$conexao);
	$tmp = mysql_fetch_assoc($res);
	
	$res = bdSelect("codigo","clientes","grupo_id=" . $tmp['id'],"codigo DESC",$conexao);
	if (bdNumReg($res))
	{
		$tmp['ultimo_codigo']=pad(mysql_result($res,0)+1,5);
	}
	else
	{
		$tmp['ultimo_codigo']=pad($tmp['codigo']."001",5);
	}
		
	echo utf8_encode(
		$tmp['endereco'] . "#" .
		$tmp['numero'] . "#" .
		$tmp['bairro'] . "#" .
		$tmp['cep'] . "#" .
		$tmp['cidade'] . "#" .
		$tmp['uf'] . "#" .
		$tmp['ultimo_codigo']
	);
}
else if($modo=="obtemStatus")
{
	echo "<option value=\"\"></option>";
	$res = bdSelect("*","clientes_status","","",$conexao);
	while($tmp = mysql_fetch_array($res))
		echo utf8_encode("<option value=\"" . $tmp['id'] . "\">" . $tmp['nome'] . "</option>\n");
}
?>