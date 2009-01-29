<?
define('ROOT','../');
require(ROOT . 'configs.php');
require("logado.php");

function pegaClientes($conn)
{
	$res = bdQuery(
		"SELECT CLI.*,GRU.codigo AS grupo_codigo,GRU.nome AS grupo_nome
		FROM clientes CLI
		INNER JOIN grupos GRU ON CLI.grupo_id = GRU.id
		ORDER BY CLI.grupo_id,CLI.nome",
		$conn
	);
	while($tmp=mysql_fetch_assoc($res))
	{
		$tmp['codigo']=pad($tmp['codigo'],5);
		$clientes[]=$tmp;
	}
	return $clientes;
}

$modo = $_REQUEST['modo'];
if($modo=="") $modo="lst";

$processa = $_REQUEST['processa'];

$id	= $_REQUEST['id'];
$tabela = "chamados";

$msg = $_REQUEST['msg'];
$visual->assign('msg',$msg);

if ($processa=="ok")
{
	$campos = array(
			"cliente_id" => array("cliente_id","Cliente","selecao","requerido",$_REQUEST['cliente_id']),
			"admin_id" => array("admin_id","Atendente","varchar","requerido",$_REQUEST['admin_id']),
			"tipo_id" => array("tipo_id","Tipo de chamado","varchar","requerido",$_REQUEST['tipo_id']),
			"problema" => array("problema","Problema","varchar","requerido",$_REQUEST['problema']),
			"solucao" => array("solucao","Solução","varchar","não-requerido",$_REQUEST['solucao']),
			"status_id" => array("status_id","Status","selecao","requerido",$_REQUEST['status_id']),
			"data_abertura" => array("data_abertura","Data Abertura","datatempo","requerido",data_server($_REQUEST['data_abertura'])),
			"data_fechamento" => array("data_fechamento","Data Fechamento","datatempo","requerido",data_server($_REQUEST['data_fechamento'])),
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
				$msg = "Cliente cadastrado com sucesso!";
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

			$msg = "Chamado alterado com sucesso!";
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
	$visual->assign('clientes',pegaClientes($conexao));
	$visual->assign('admins',table2array("admins",$conexao));
	$visual->assign('chamados_status',table2array("chamados_status",$conexao));
	$visual->assign('tipos',table2array("chamados_areas",$conexao));
	$visual->assign('subtitulo','Abertura de Chamado');
	$visual->assign('botao','Cadastrar');
	$visual->assign('modo',$modo);
	$visual->display('adm/chamados_formulario.tpl');
}
else if ($modo=="alt")
{
	$visual->assign('clientes',pegaClientes($conexao));
	$visual->assign('admins',table2array("admins",$conexao));
	$visual->assign('chamados_status',table2array("chamados_status",$conexao));
	$visual->assign('tipos',table2array("chamados_areas",$conexao));
	$visual->assign('subtitulo','Altera&ccedil;&atilde;o de Chamados');
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
		"cliente_id" => array("cliente_id","Cliente","selecao","requerido",$valores['cliente_id']),
		"admin_id" => array("admin_id","Atendente","varchar","requerido",$valores['admin_id']),
		"tipo_id" => array("tipo_id","Tipo de chamado","varchar","requerido",$valores['tipo_id']),
		"atendente" => array("atendente","Atendente","varchar","requerido",$valores['admin_id']),
		"problema" => array("problema","Problema","varchar","requerido",$valores['problema']),
		"solucao" => array("solucao","Solução","varchar","requerido",$valores['solucao']),
		"status_id" => array("status_id","Status","selecao","requerido",$valores['status_id']),
		"data_abertura" => array("data_abertura","Data Abertura","datatempo","requerido",data($valores['data_abertura'])),
		"data_fechamento" => array("data_fechamento","Data Fechamento","datatempo","requerido",data($valores['data_fechamento'])),
		"observacoes" => array("observacoes","Observações","varchar","não-requerido",$valores['observacoes'])
	);
	$visual->assign('campos',$campos);
	$visual->display('adm/chamados_formulario.tpl');
}
else if ($modo=="exc")
{
	if (!is_numeric($id))
		redir($thispage . "?msg=" . urlencode("Selecione o chamado a ser excluído"));
	
	bdDelete($tabela,"id=" . $id,$conexao);
	redir($thispage . "?modo=lst&msg=" . urlencode("Exclusão efetuada"));
}
else if($modo=="lst")
{
	$whr = "";
	$res = bdQuery(
		"SELECT CHA.id, CLI.nome AS cliente, ADM.nome AS atendente, STA.nome AS	status , TIP.nome AS tipo
		FROM chamados CHA
		INNER JOIN clientes CLI ON CLI.id = CHA.cliente_id
		INNER JOIN admins ADM ON ADM.id = CHA.admin_id
		INNER JOIN chamados_status STA ON STA.id = CHA.status_id
		INNER JOIN chamados_areas TIP ON TIP.id = CHA.tipo_id
		ORDER BY cliente,tipo,status",
		$conexao
	);
	
	while ($tmp = mysql_fetch_assoc($res))
	{
		$tmp['codigo'] = pad($tmp['codigo'],5);
		$dados[] = $tmp;
	}
	
	$visual->assign('subtitulo','Manutenção de Chamados');
	$visual->assign('dados',$dados);
	$visual->display('adm/chamados_listagem.tpl');
}

?>