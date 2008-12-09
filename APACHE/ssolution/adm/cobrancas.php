<?
define('ROOT','../');
require(ROOT . 'configs.php');
require("logado.php");

function pegaUltimoCodigo($conn){
	$res = bdSelect("MAX(codigo) as maxcod","titulos","","",$conn);
	$tmp = mysql_fetch_assoc($res);
	if(!is_null($tmp['maxcod']))
		return $tmp['maxcod'];
	else
		return 0;
}

function pegaListaClientes($conn)
{
	$res = bdQuery(
		"SELECT CLI.id,(IF(CLI.tipo=1,CLI.nome,CLI.razao_social)) AS nome,CLI.grupo_id,GRU.codigo AS grupo_codigo,GRU.nome AS grupo_nome
		FROM clientes CLI
		INNER JOIN grupos GRU ON CLI.grupo_id = GRU.id
		ORDER BY CLI.grupo_id,CLI.nome",
		$conn
	);
	
	while ($tmp = mysql_fetch_assoc($res))
	{
		$retornar[$tmp['id']] = $tmp;
	}
	
	return $retornar;
}

$id	= $_REQUEST['id'];
$modo = $_REQUEST['modo'];
$processa = $_REQUEST['processa'];

$msg = $_REQUEST['msg'];
$visual->assign('msg',$msg);

$tabela="titulos";

$visual->assign('lista_status',table2array("titulos_status",$conexao));

if ($processa=="ok")
{
	$campos = array(
		"cliente_id" => array("cliente_id","Cliente","selecao","requerido",$_REQUEST['cliente_id']),
		"contrato_id" => array("contrato_id","Contrato","selecao","requerido",$_REQUEST['contrato_id']),
		"referencia_mes" => array("referencia_mes","Refência - Mês","numero","requerido",$_REQUEST['referencia_mes']),
		"referencia_ano" => array("referencia_ano","Referência - Ano","numero","requerido",$_REQUEST['referencia_ano']),
		"periodo_inicio" => array("periodo_inicio","Período Início","varchar","requerido",data_server($_REQUEST['periodo_inicio'])),
		"periodo_fim" => array("periodo_fim","Período Fim","varchar","requerido",data_server($_REQUEST['periodo_fim'])),
		"vencimento" => array("vencimento","Vencimento","varchar","requerido",data_server($_REQUEST['vencimento'])),
		"codigo" => array("codigo","Código","numero","requerido",$_REQUEST['codigo']),
		"status_id" => array("status_id","Staus","selecao","requerido",$_REQUEST['status_id']),
		"valor" => array("valor","Valor","varchar","requerido",$_REQUEST['valor']),
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
				logAdm($conexao,$_SESSION['admin_login'],"Cadastro Titulo ID=$cad Codigo=" . $campos['codigo'][4]);
				$msg = "Título cadastrado com sucesso!";
				redir($thispage . "?modo=cad&msg=" . urlencode($msg));
				exit();
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
}

if($modo=="cad")
{
	// pegue todos os contratos ordenados por grupo e cliente
	/*$res = bdQuery("
		SELECT CTR.*, GRU.nome_padrao  AS grupo, CLI.nome AS cliente,PLA.nome AS plano,PLA.valor_base
		FROM contratos CTR
		INNER JOIN clientes CLI ON CTR.cliente_id=CLI.id
		INNER JOIN grupos GRU ON CTR.grupo_id=GRU.id
		INNER JOIN planos PLA ON CTR.plano_id=PLA.id
		ORDER BY GRU.nome,CLI.nome",
		$conexao
	);
	$res = bdSelect("*","contratos","","",$conexao);
	
	while($tmp=mysql_fetch_assoc($res))
		$contratos[]=$tmp;
	$visual->assign('contratos',$contratos);
	*/
	
	$visual->assign('clientes',pegaListaClientes($conexao));
	$visual->assign('ultimo_codigo',pegaUltimoCodigo($conexao));
	$visual->assign('subtitulo','Cadastro de Títulos');
	$visual->assign('botao','Cadastrar');
	$visual->assign('modo',$modo);
	$visual->assign('meses',$meses);
	
	$visual->display('adm/cobrancas_titulos_formulario.tpl');
}
else if ($modo=="alt" || $modo=="vis")
{
	$visual->assign('meses',$meses);
	$visual->assign('clientes',pegaListaClientes($conexao));
	$visual->assign('subtitulo','Altera&ccedil;&atilde;o de Título');
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
		"id" => array("id","ID","numero","requerido",$valores['id']),
		"cliente_id" => array("cliente_id","Cliente","selecao","requerido",$valores['cliente_id']),
		"contrato_id" => array("contrato_id","Contrato","selecao","requerido",$valores['contrato_id']),
		"referencia_mes" => array("referencia_mes","Refência - Mês","numero","requerido",$valores['referencia_mes']),
		"referencia_ano" => array("referencia_ano","Referência - Ano","numero","requerido",$valores['referencia_ano']),
		"periodo_inicio" => array("periodo_inicio","Período Início","varchar","requerido",data($valores['periodo_inicio'])),
		"periodo_fim" => array("periodo_fim","Período Fim","varchar","requerido",data($valores['periodo_fim'])),
		"vencimento" => array("vencimento","Vencimento","varchar","requerido",data($valores['vencimento'])),
		"codigo" => array("codigo","Código","numero","requerido",$valores['codigo']),
		"status_id" => array("status_id","Staus","selecao","requerido",$valores['status_id']),
		"valor" => array("valor","Valor","varchar","requerido",$valores['valor']),
		"observacoes" => array("observacoes","Observações","varchar","não-requerido",$valores['observacoes'])
		// "" => array("","","varchar","requerido",$_REQUEST['']),
	);
	$visual->assign('campos',$campos);
	
	if($modo=="alt")
		$visual->display('adm/cobrancas_titulos_formulario.tpl');
	else if($modo=="vis")
	{
		echo utf8_encode($visual->fetch('adm/cobrancas_titulos_visualizar.tpl'));
		//
	}	
}
else if($modo=="lst")
{
	$res = bdQuery("
		SELECT CLI.*,(IF(CLI.tipo=1,CLI.nome,CLI.razao_social)) AS nome,GRU.nome_padrao AS grupo
		FROM clientes CLI
		INNER JOIN grupos GRU ON CLI.grupo_id = GRU.id
		" . $whr . "
		ORDER BY GRU.codigo,grupo,CLI.nome
		",
		$conexao,0
	);
	
	$res = bdQuery("
		SELECT TIT.*,FORMAT(TIT.valor,3) AS valor_format,(IF(CLI.tipo=1,CLI.nome,CLI.razao_social)) AS nome,PLA.nome AS plano_nome,GRU.nome_padrao AS grupo
		FROM titulos TIT
		INNER JOIN clientes CLI ON TIT.cliente_id = CLI.id
		INNER JOIN contratos CTR ON TIT.contrato_id = CTR.id
		INNER JOIN grupos GRU ON CTR.grupo_id = GRU.id
		INNER JOIN planos PLA ON CTR.plano_id = PLA.id
		ORDER BY TIT.codigo,CLI.nome
		",
		$conexao,0
	);
	
	while ($tmp = mysql_fetch_assoc($res))
	{
		$tmp['codigo'] = pad($tmp['codigo'],8);
		$dados[] = $tmp;
	}
	$visual->assign('dados',$dados);
	
	//$visual->assign('grupos',table2array("grupos",$conexao," ORDER BY nome_padrao"));
	$visual->assign('subtitulo','Manutenção de Títulos');
	$visual->assign('meses',$meses);
	$visual->display('adm/cobrancas_titulos_listagem.tpl');
}

else if($modo=="emissao")
{
	$intervalo = 10;
	$grupo = $_REQUEST['grupo'];
	$data_atual=getdate();
	
	$mes = ( (is_numeric($_REQUEST['mes'])) && ($_REQUEST['mes']>=1) && ($_REQUEST['mes']<=12) ) ? $_REQUEST['mes'] : $data_atual['mon'];
	$ano = ( (is_numeric($_REQUEST['mes'])) && ($_REQUEST['ano']>=1970) ) ? $_REQUEST['ano'] : $data_atual['year'];
	
	$periodo_ini = date("Y-m-d", mktime  (0, 0, 0, $mes,1,$ano));
	$periodo_fim = date("Y-m-d", mktime  (0, 0, 0, $mes+1,0,$ano));
	
	/*
	// pegue todos os contratos que nao tem boleto emitido no periodo designado
	$sql = "
		SELECT
			PRO.codigo AS provedor_codigo,
			PLA.nome AS plano_nome,PLA.valor_base AS plano_valor,
			CLI.nome AS cliente_nome,
			GRU.nome AS grupo_nome,
			CNT.vencimento_padrao,
			TIT.id AS titulo_id
		FROM contratos CNT
		INNER JOIN provedores PRO ON PRO.id = CNT.provedor_id
		INNER JOIN planos PLA ON PLA.id = CNT.plano_id
		INNER JOIN clientes CLI ON CLI.id = CNT.cliente_id
		INNER JOIN grupos GRU ON GRU.id = CNT.grupo_id
		LEFT OUTER JOIN titulos TIT ON CNT.id = TIT.contrato_id
		AND TIT.data_vencimento >= '$periodo_ini' AND TIT.data_vencimento <= '$periodo_fim'
		WHERE TIT.id IS null AND CNT.ativo=1
	";
	$res = mysql_query($sql,$conexao) or die("xiii");
	while($tmp=mysql_fetch_assoc($res))
		$nao_emitidos[]=$tmp;
	$visual->assign('nao_emitidos',$nao_emitidos);
	print_a($nao_emitidos);
		
	$visual->display('adm/cobrancas_listagem_periodo.tpl');
	*/
}
else if($modo=="emitidos")
{
	// pegue todos os contratos que tem boleto emitido no periodo designado
	$sql = "
		SELECT PRO.razaosocial AS provedor,PLA.nome AS plano,CLI.nome AS cliente,GRU.nome AS grupo,CNT.*,TIT.id AS titulo_id
		FROM contratos CNT
		INNER JOIN provedores PRO ON PRO.id = CNT.provedor_id
		INNER JOIN planos PLA ON PLA.id = CNT.plano_id
		INNER JOIN clientes CLI ON CLI.id = CNT.cliente_id
		INNER JOIN grupos GRU ON GRU.id = CNT.grupo_id
		INNER JOIN titulos TIT ON CNT.id = TIT.contrato_id
		AND TIT.data_vencimento >= '$periodo_ini' AND TIT.data_vencimento <= '$periodo_fim'
		WHERE TIT.id IS NOT null AND CNT.ativo=1
	";
	$res = mysql_query($sql,$conexao) or die("xiii");
	while($tmp=mysql_fetch_assoc($res))
		$emitidos[]=$tmp;
	print_a($emitidos);
	$visual->assign('emitidos',$emitidos);
}

// um modo para atender o preenchimento da SELECT de contratos por cliente
else if($modo=="obtemContratos")
{
	$clienteID = $_REQUEST['cliID'];
	if(is_numeric($clienteID) && $clienteID>0)
	{
		$res = bdQuery("
			SELECT CTR.*, PLA.nome AS plano,PLA.valor_base
			FROM contratos CTR
			INNER JOIN planos PLA ON CTR.plano_id=PLA.id
			WHERE CTR.cliente_id = " . $clienteID,
			$conexao
		);
		
		if(!bdNumReg($res)){ echo "<option value=''>.:: Sem contratos para este cliente ::.</option>"; return; }
		
		echo "<option value=''>.:: Selecione um contrato ::.</option>";
		while($tmp=mysql_fetch_assoc($res))
		{
			echo "<option value='" . $tmp['id'] . "'>" . $tmp['plano'] . "</option>";
		}
	}
	else
	{
		echo "<option value=''>.:: Selecione um cliente primeiro ::.</option>";
	}
}

// um modo que retorna informacoes do contrato para preencher o formulario
else if($modo=="obtemUmContrato")
{
	$contratoID = $_REQUEST['ctrID'];
	if(is_numeric($contratoID) && $contratoID>0)
	{
		$res = bdQuery("
			SELECT CTR.*, PLA.nome AS plano,PLA.valor_base
			FROM contratos CTR
			INNER JOIN planos PLA ON CTR.plano_id=PLA.id
			WHERE CTR.cliente_id = " . $contratoID,
			$conexao
		);
		
		$res = bdSelect("REPLACE(valor_padrao,'.',',') AS valor_padrao,vencimento_padrao","contratos","id=" . $contratoID,"",$conexao);
		
		$sql="
			SELECT REPLACE(CTR.valor_padrao,'.',',') AS valor_padrao,CTR.vencimento_padrao AS vencimento_padrao,
			PER.nome AS periodo_nome,LPAD(PER.dia_inicio,2,'0') AS periodo_inicio,LPAD(PER.dia_termino,2,'0') AS periodo_termino,PER.dia_termino_mescorrente AS periodo_mescorrente
			FROM contratos CTR
			INNER JOIN periodos PER ON CTR.periodo_id=PER.id
			WHERE CTR.id = " . $contratoID;
		//echo $sql . "<br>";
		$res = bdQuery($sql,
			$conexao
		);
		
		//if(!bdNumReg($res)){ echo "semregistros"; return; }
		if(!bdNumReg($res)){ echo ""; return; }
		
		echo utf8_encode(mysql_result($res,0,'valor_padrao')
			. "#" . mysql_result($res,0,'vencimento_padrao')
			. "#" . mysql_result($res,0,'periodo_nome')
			. "#" . mysql_result($res,0,'periodo_inicio')
			. "#" . mysql_result($res,0,'periodo_termino')
			. "#" . mysql_result($res,0,'periodo_mescorrente'));
	}
	else
	{
		//echo "idinvalido";
		echo "";
	}
}
/*
To produce the set of records only in Table A, but not in Table B,
we perform the same left outer join,
then exclude the records we don't want from the right side via a where clause.
SELECT * FROM TableA
LEFT OUTER JOIN TableB
ON TableA.name = TableB.name
WHERE TableB.id IS null
http://www.codinghorror.com/blog/archives/000976.html
*/
?>