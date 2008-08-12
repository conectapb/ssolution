<?
// SE AS VARIAVEIS DE SESSAO NAO ESTAO HABILITADAS, MANDA PRA TELA DE LOGIN
if ($_SESSION['admin_id']=="" || !isset($_SESSION['admin_id']))
{
	$_SESSION['url'] = $_SERVER['SCRIPT_NAME'] . "?" . $querystring;
	redir("login.php?msg=" . urlencode("Informe seu login e senha para acessar o painel."));
}
// SENAO, BUSCA AS FUNCOES
else
{
	if ($_SESSION['admin_id']==1)
		$whr = "ativo=1 AND pai=0";
	else
		$whr = "ativo=1 AND pai=0 AND restrito=0";

	$res = bdSelect(
		"id,nome,link",
		"funcoes",
		$whr,
		"posicao,nome",
		$conexao
	);
	
	// O PRIMEIRO LOOP CRIA AS CATEGORIAS PAI
	while($arr=mysql_fetch_array($res,MYSQL_ASSOC))
	{
		if ($_SESSION['admin_id']==1)
			$whr = "ativo=1 AND pai=" . $arr['id'];
		else
			$whr = "ativo=1 AND pai=" . $arr['id'] . " AND restrito=0";
		
		
		$res2 = bdSelect(
			"nome,link",
			"funcoes",
			$whr,
			"posicao,nome",
			$conexao
		);
		$funcoes[] = $arr;
		
		// O SEGUNDO LOOP COLOCA OS FILHOS DENTRO DOS PAIS
		while($arr2=mysql_fetch_array($res2,MYSQL_ASSOC))
			$funcoes[sizeof($funcoes)-1]['filhos'][] = $arr2;
	}
	//print_a($funcoes);
	
	$visual->assign('funcoes',$funcoes);
	$funcoes="";
}
?>