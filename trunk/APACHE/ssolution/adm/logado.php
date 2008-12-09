<?
// SE AS VARIAVEIS DE SESSAO NAO ESTAO HABILITADAS, MANDA PRA TELA DE LOGIN
if ($_SESSION['admin_id']=="" || !isset($_SESSION['admin_id']))
{
	$_SESSION['url'] = $_SERVER['SCRIPT_NAME'] . "?" . $querystring;
	redir("login.php?msg=" . urlencode("Informe seu login e senha para acessar o painel."));
}
// SENAO...
else
{
	// USANDO phpGACL para fazer permissionamento de acesso
	$axo_section_value = 'sistema';
	$axo_value = AREA;
	$aco_section_value = 'system';
	$aco_value = $modo;
	$aro_section_value = 'users';
	$aro_value = $_SESSION['admin_login'];
	/*
	if($gacl->acl_check($aco_section_value,$aco_value,$aro_section_value,$aro_value,$axo_section_value,$axo_value))
	{
		echo "<!-- $aro_value has been granted access to $axo_value - $aco_value -->";	
	}
	else
	{
		echo "$aro_value has been denied access to $axo_value - $aco_value";
		exit();
	}*/
	
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
	
	// BUSCA AS FUNCOES
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