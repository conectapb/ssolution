<?
define('ROOT','../');
define('AREA','relatorios');
require(ROOT . 'configs.php');

$modo = $_REQUEST['modo'];
if($modo=="") $modo="lst";

if ($modo=="clienteslst")
{

    unset($whr);

    if(isset($_REQUEST['gru']))
    {
        $_SESSION['cliente_gru'] = $_REQUEST['gru'];
    }
    $visual->assign('gru',$_SESSION['cliente_gru']);

    if(isset($_REQUEST['sta']))
    {
        $_SESSION['cliente_sta'] = $_REQUEST['sta'];
    }
    $visual->assign('sta',$_SESSION['cliente_sta']);

    if(is_numeric($_SESSION['cliente_gru']) && $_SESSION['cliente_gru'] > 0)
	{
		$whr[] = "CLI.grupo_id=" . $_SESSION['cliente_gru'];
	}

    if(is_numeric($_SESSION['cliente_sta']) && $_SESSION['cliente_sta'] > 0)
	{
		$whr[] = "CLI.status_id=" . $_SESSION['cliente_sta'];
	}

	if(sizeof($whr)>0)
	{
		$whr = implode(" AND ", $whr);
		$whr = " WHERE " . $whr;
	

        $res = bdQuery("
            SELECT CLI.*,(IF(CLI.tipo='Pessoa física',CLI.nome,CLI.razao_social)) AS nome,GRU.nome_padrao AS grupo
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
	}
        
    echo "ate aqui tudo bem";
    $visual->assign('dados',$dados);

	$visual->assign('grupos',table2array("grupos",$conexao," ORDER BY nome_padrao"));
    $visual->assign('status',table2array("clientes_status",$conexao," ORDER BY id"));

	$visual->assign('subtitulo','Relatório de Clientes');
    
	$visual->display('adm/relatorios_clientes_listagem.tpl');
}

?>