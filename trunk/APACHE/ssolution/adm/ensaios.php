<?
define('ROOT','../');
include(ROOT . 'configs.php');
include('logado.php');

$modo = $_REQUEST['modo'];
$id = $_REQUEST['id'];
$processa = $_REQUEST['processa'];
$msg = $_REQUEST['msg'];
$pag = $_REQUEST['pag'];
if(!is_numeric($pag)) $pag = 1;

if($modo=="")
	redir("modelos.php?modo=ens&msg=Selecione a operacao");
else if(!is_numeric($id))
	redir("modelos.php?modo=ens&msg=Selecione o registro");
else if($modo=="cad")
{
	$res = bdSelect("nome","modelos","id=" . $id,"",$conexao);
	$nome = mysql_result($res,0);
	
	$res = bdSelect("MAX(id) AS max","ensaios","modelo_id=" . $id,"",$conexao);
	$lastid = mysql_result($res,0);

	if($processa=="ok")
	{
		# pega descricao e legenda
		$descricao = $_REQUEST['descricao'];
		$legenda = $_REQUEST['legenda'];
		
		# trata os uploads
		$raiz = $uppdir . 'modelos/';
		if(!file_exists($raiz . $id))
		{
			mkdir($raiz . $id);
		}
		$pasta = $raiz . $id . "/";
				
		for($i=0;$i<5;$i++)
		{
			$lastid++;
			$upload = upload_form(
				'arquivo' . $i,
				$id . '_' . $lastid,
				$pasta,
				array('.jpg','.gif','.jpeg','.png'),
				1536000,
				true
			);
			
			if($upload['status'])
				bdInsert(
					"ensaios",
					"modelo_id,arquivo,legenda,descricao",
					$id . ",'" . $upload['msg'] . "','" . $legenda . "','" . $descricao . "'",
					$conexao
				);
		}
		
		$msg = "Imagens adicionadas com sucesso";
			redir("ensaios.php?modo=cad&id=$id&msg=" . urlencode($msg));
		
	}
	
	$pgn = paginacao(
		"*",
		"ensaios",
		"modelo_id=" . $id,
		"",
		$conexao,
		$pag,
		30
	);
	
	while ($tmp = mysql_fetch_assoc($pgn['res']))
	{
		$dados[] = $tmp;
	}
	$visual->assign('modo',$modo);
	$visual->assign('id',$id);
	$visual->assign('nome',$nome);
	$visual->assign('paginacao',$pgn['paginas']);
	$visual->assign('pag',$pag);
	$visual->assign('build_geturl',build_geturl());
	$visual->assign('subtitulo','Adicionar fotos - ' . $nome);
	$visual->assign('dados',$dados);
	$visual->assign('values',$values);
	$visual->assign('msg',$msg);
	$visual->display('adm/ensaios_form.tpl');
}
else if($modo=="exc")
{
	$foto_id = $_REQUEST['foto'];
	$res = bdSelect(
		"id,arquivo",
		"ensaios",
		"id=" . $foto_id,
		"",
		$conexao
	);
	$arquivo = $uppdir . 'modelos/' . $id . "/" . mysql_result($res,0,arquivo);
	if(file_exists($arquivo))
		unlink($arquivo);
	bdDelete("ensaios","id=" . $foto_id , $conexao);
	redir("ensaios.php?modo=cad&id=" . $id . "&msg=Imagem excluida com sucesso");
}

?>