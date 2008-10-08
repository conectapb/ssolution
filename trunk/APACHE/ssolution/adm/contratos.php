<?
define('ROOT','../');
require(ROOT . 'configs.php');
require("logado.php");

function pegaListaClientes($conn)
{
	$res = bdQuery(
		"SELECT CLI.*,(IF(CLI.tipo=1,CLI.nome,CLI.razao_social)) AS nome,GRU.codigo AS grupo_codigo,GRU.nome AS grupo_nome,GRU.nome_padrao AS grupo_nome_padrao
		FROM clientes CLI
		INNER JOIN grupos GRU ON CLI.grupo_id = GRU.id
		ORDER BY GRU.nome_padrao,CLI.nome",
		$conn
	);
	while ($cliente = mysql_fetch_assoc($res))
		$clientes[$cliente['id']] = $cliente;
	
	return $clientes;
}

$modo = $_REQUEST['modo'];
if($modo=="") $modo="lst";

$gru = $_REQUEST['gru'];
$visual->assign("gru",$gru);

$processa = $_REQUEST['processa'];

$id	= $_REQUEST['id'];
$tabela = "contratos";

$msg = $_REQUEST['msg'];
$visual->assign('msg',$msg);

$res = bdSelect("id,codigo,nome_padrao,nome","grupos","","nome_padrao",$conexao);
while ($grupo = mysql_fetch_assoc($res))
	$grupos[$grupo['id']] = $grupo;
$visual->assign('grupos',$grupos);

if ($processa=="ok")
{

	$campos = array(
		"codigo" => array("codigo","Código","varchar","não-requerido",$_REQUEST['codigo']),
		"descricao" => array("descricao","Descrição","varchar","não-requerido",$_REQUEST['descricao']),
		"provedor_id" => array("provedor_id","Provedor","selecao","requerido",$_REQUEST['provedor_id']),
		"plano_id" => array("plano_id","Plano","selecao","requerido",$_REQUEST['plano_id']),
		"cliente_id" => array("cliente_id","Cliente","selecao","requerido",$_REQUEST['cliente_id']),
		"grupo_id" => array("grupo_id","Grupo","selecao","requerido",$_REQUEST['grupo_id']),
		"descricao" => array("descricao","Descrição","varchar","não-requerido",$_REQUEST['descricao']),
		"data_inicio" => array("data_inicio","Data Início","data","nao-requerido",data_server($_REQUEST['data_inicio'])),
		"data_termino" => array("data_termino","Data Término","data","não-requerido",data_server($_REQUEST['data_termino'],TRUE)),
		"periodo_id" => array("periodo_id","Período padrão","selecao","requerido",$_REQUEST['periodo_id']),
		"vencimento_padrao" => array("vencimento_padrao","Vencimento Padrao","numero","não-requerido",$_REQUEST['vencimento_padrao']),
		"valor_padrao" => array("valor_padrao","Valor Padrao","numero","não-requerido",double_server($_REQUEST['valor_padrao'])),
		"ativo" => array("ativo","Contrato Ativo","checkbox","requerido",$_REQUEST['ativo']),
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
				$msg = "Contrato cadastrado com sucesso!";
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

			$msg = "Contrato alterado com sucesso!";
			redir($thispage . "?gru=" . $gru . "&modo=lst&msg=" . urlencode($msg));
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
	$visual->assign('clientes',pegaListaClientes($conexao));
	$visual->assign('planos',table2array("planos",$conexao));
	$visual->assign('provedores',table2array("provedores",$conexao));
	$visual->assign('periodos',table2array("periodos",$conexao));
	$visual->assign('subtitulo','Cadastro de Contrato');
	$visual->assign('botao','Cadastrar');
	$visual->assign('modo',$modo);
	$visual->display('adm/contratos_formulario.tpl');
}
else if ($modo=="alt")
{
	$visual->assign('clientes',pegaListaClientes($conexao));
	$visual->assign('planos',table2array("planos",$conexao));
	$visual->assign('provedores',table2array("provedores",$conexao));
	$visual->assign('periodos',table2array("periodos",$conexao));
	$visual->assign('subtitulo','Alteração de Contrato');
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
		"id" =>					array("id","id","int","não-requerido",$valores['id']),
		"codigo" =>				array("codigo","Código","varchar","não-requerido",$valores['codigo']),
		"provedor_id" =>		array("provedor_id","Provedor","selecao","requerido",$valores['provedor_id']),
		"plano_id" =>			array("plano_id","Plano","selecao","requerido",$valores['plano_id']),
		"cliente_id" =>			array("cliente_id","Cliente","selecao","requerido",$valores['cliente_id']),
		"grupo_id" =>			array("grupo_id","Grupo","selecao","requerido",$valores['grupo_id']),
		"descricao" =>			array("descricao","Descrição","varchar","não-requerido",$valores['descricao']),
		"data_inicio" =>		array("data_inicio","Data Início","data","requerido",$valores['data_inicio']),
		"data_termino" =>		array("data_termino","Data Término","data","não-requerido",$valores['data_termino']),
		"periodo_id" =>			array("periodo_id","Período padrão","selecao","requerido",$valores['periodo_id']),
		"vencimento_padrao" =>	array("vencimento_padrao","Vencimento Padrao","numero","não-requerido",$valores['vencimento_padrao']),
		"valor_padrao" =>		array("valor_padrao","Valor Padrao","numero","não-requerido",double($valores['valor_padrao'])),
		"ativo" =>				array("ativo","Contrato Ativo","checkbox","requerido",$valores['ativo']),
		"observacoes" =>		array("observacoes","Observações","varchar","não-requerido",$valores['observacoes'])
	);
	$visual->assign('campos',$campos);
	$visual->display('adm/contratos_formulario.tpl');
}
else if($modo=="vis")
{
	$visual->assign('clientes',pegaListaClientes($conexao));
	$visual->assign('planos',table2array("planos",$conexao));
	$visual->assign('provedores',table2array("provedores",$conexao));
	$visual->assign('periodos',table2array("periodos",$conexao));

	if (!is_numeric($id))
		die("ID faltando para visualização");
	
	$res = bdSelect(
		"*",
		$tabela,
		"id=" . $id,
		"",
		$conexao
	);
	
	$res = bdQuery("
		SELECT
			(IF(CLI.tipo=1,CLI.nome,CLI.razao_social)) AS cliente,
			PRO.razaosocial AS provedor,
			CLI.complemento,
			PLA.nome AS plano,
			GRU.nome_padrao AS grupo,
			PLA.nome AS plano,
			PER.nome AS periodo,
			CON.*
		FROM contratos CON
			INNER JOIN provedores PRO ON CON.provedor_id = PRO.id
			INNER JOIN clientes CLI ON CON.cliente_id = CLI.id
			INNER JOIN planos PLA ON CON.plano_id = PLA.id
			INNER JOIN grupos GRU ON CON.grupo_id = GRU.id
			INNER JOIN periodos PER ON CON.periodo_id = PER.id
		WHERE CON.id=" . $id . "
		ORDER BY grupo,cliente",
		$conexao
	);
	
	if (!bdNumReg($res))
		die("Nenhum registro para o ID '" . $id . "'");
	
	$visual->assign('campos',mysql_fetch_assoc($res));
	echo utf8_encode($visual->fetch('adm/contratos_visualizar.tpl'));
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
	
	$res = bdQuery("
		SELECT CON.vencimento_padrao,CON.ativo,CON.codigo,CON.id,PRO.razaosocial AS razaosocial,(IF(CLI.tipo=1,CLI.nome,CLI.razao_social)) AS cliente,CLI.complemento,CLI.complemento_tipo,PLA.nome AS plano,GRU.nome_padrao AS grupo
		FROM contratos CON
		INNER JOIN provedores PRO ON CON.provedor_id = PRO.id
		INNER JOIN clientes CLI ON CON.cliente_id = CLI.id
		INNER JOIN planos PLA ON CON.plano_id = PLA.id
		INNER JOIN grupos GRU ON CON.grupo_id = GRU.id
		" . $whr . "
		ORDER BY grupo,cliente",
		$conexao
	);
	
	while ($tmp = mysql_fetch_assoc($res))
		$dados[] = $tmp;
	
	$visual->assign('subtitulo','Manutenção de Contratos');
	$visual->assign('dados',$dados);
	$visual->display('adm/contratos_listagem.tpl');
}
else if($modo=="obtemPlano")
{
	$planoID=$_REQUEST['planoID'];
	if(is_numeric($planoID) && $planoID>0)
	{
		$res = bdQuery("SELECT REPLACE(valor_base,'.',',') FROM planos WHERE id=" . $planoID,$conexao);
		if(!bdNumReg($res)){ echo ""; return; }
		echo mysql_result($res,0);
	}
	else echo "";
}

?>