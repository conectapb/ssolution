<?
// Report all errors except E_NOTICE
error_reporting(E_ALL ^ E_NOTICE);

session_start();
// VARIAVEIS GERAIS
define('PROJECTNAME','ssolution');

include("libs/debuglib.php");

$thispage = $_SERVER['SCRIPT_NAME'];
$querystring = $_SERVER['QUERY_STRING'];

$rede_smart = "10.10.11";
$rede_atual = explode(".",$_SERVER['HTTP_HOST']);
$rede_atual = $rede_atual[0].".".$rede_atual[1].".".$rede_atual[2];

if ($_SERVER['HTTP_HOST']=="localhost" || $rede_atual == $rede_smart ){
	/* LOCAL*/
	$host = "localhost";
	$database = "ssolution";
	$user = "root";
	$pass = "";
	$uppdir = $_SERVER['DOCUMENT_ROOT'] . "/" . PROJECTNAME . "/uploads/";
	$smartydir = $_SERVER['DOCUMENT_ROOT'] . "/" . PROJECTNAME . '/libs/smarty/libs/';
	$phpgacldir = $_SERVER['DOCUMENT_ROOT'] . "/" . PROJECTNAME . '/libs/phpgacl/';
	$logdir = $_SERVER['DOCUMENT_ROOT'] . "/" . PROJECTNAME . '/logs/';
	$sqllogfile = $logdir . "sql_%date%.log";
}
else
{
	/* ONLINE */
	$host = "localhost";
	$database = "smartsol_sistema";
	$user = "smartsol_sistema";
	$pass = "iguarassu";
	$uppdir = $_SERVER['DOCUMENT_ROOT'] . '/uploads/';
	$smartydir = $_SERVER['DOCUMENT_ROOT'] . '/libs/smarty/libs/';
	$phpgacldir = $_SERVER['DOCUMENT_ROOT'] . '/libs/phpgacl/';
	$logdir = $_SERVER['DOCUMENT_ROOT'] . '/logs/';
	$sqllogfile = $logdir . "sql_%date%.log";
}

// Tentando criar o hábito de usar constantes =)
define('CLIENTE_TIPO_PF',1);
define('CLIENTE_TIPO_PJ',2);

// INICIALIZACAO DO BANCO DE DADOS
$conexao	= mysql_connect($host,$user,$pass) or die("Erro ao efetuar conexão<br />" . mysql_error());
$db_conexao	= mysql_select_db($database,$conexao) or die("Erro ao selecionar database<br />" . mysql_error());

/*require_once 'DB.php';

$dsn = array(
    'phptype'  => 'mysql',
    'username' => $user,
    'password' => $pass,
    'hostspec' => $host,
    'database' => $database,
);

$options = array(
    'debug'       => 2,
    'portability' => DB_PORTABILITY_ALL,
);

$db =& DB::connect($dsn, $options);
if (PEAR::isError($db))
{
    die($db->getMessage());
}

$db->setFetchMode(DB_FETCHMODE_ASSOC);*/

// INICIALIZACAO DO TEMPLATE
define('SMARTY_DIR',$smartydir); 
require(SMARTY_DIR . 'Smarty.class.php');
$visual = new Smarty;
$visual->template_dir	= ROOT . 'templates';
$visual->compile_dir	= ROOT . 'templates_c';
$visual->config_dir	= ROOT . 'configs';

$visual->assign('tpl_dir',$visual->template_dir);
$visual->assign('tpl_dir_adm',$visual->template_dir."/adm/");

if($_REQUEST['tpl_adm']!="")
	$_SESSION['tpl_adm'] = $_REQUEST['tpl_adm'];
else if($_SESSION['tpl_adm']=="")
	$_SESSION['tpl_adm']=2;

$visual->assign('tpl_adm',$_SESSION['tpl_adm']);
$visual->assign('tpl_adm_topo',$visual->template_dir."/adm/topo" . $_SESSION['tpl_adm'] . ".tpl");
$visual->assign('tpl_adm_rodape',$visual->template_dir."/adm/rodape" . $_SESSION['tpl_adm'] . ".tpl");
$visual->assign('tpl_adm_style',$visual->template_dir."/adm/style" . $_SESSION['tpl_adm'] . ".css");

$visual->assign('querystring',$querystring);

// INICIALIZACAO DO phpGACL
/*require_once($phpgacldir . 'gacl.class.php');
require_once($phpgacldir . 'gacl_api.class.php');
require_once($phpgacldir . 'admin/gacl_admin.inc.php');

$gacl = new gacl($gacl_options);*/

/* #################################
   ### FUNCOES DE BANCO DE DADOS ###
   ################################# */
   
function bdQuery($sql,$conn,$debug=0)
{
	if($debug) echo "$sql<br>";
	return mysql_query($sql,$conn);
}

function table2array($table,$conn,$sqladicional="")
{
	$resource_id = bdQuery("SELECT * FROM $table" . $sqladicional , $conn);
	while($tmp = mysql_fetch_assoc($resource_id))
		$retorno[] = $tmp;
	return $retorno;
}

function sql2array($sql,$conn)
{
	$resource_id = bdQuery($sql , $conn);
	while($tmp = mysql_fetch_assoc($resource_id))
		$retorno[] = $tmp;
	return $retorno;
}

function bdSelect($select,$from,$where,$orderby,$conn,$debug=0)
{
	if ($select == "") die("bdSelect: selecionar o que ?");
	$sql = "SELECT " . $select ;
	if ($from != "")
	{
		$sql .= " FROM " . $from ;
		if ($where!="")
			$sql .= " WHERE " . $where;
		if ($orderby!="")
			$sql .= " ORDER BY " . $orderby;
	}
	
	if($debug) echo "$sql<br>";
	
	$resultado = mysql_query($sql,$conn) or die("bdSelect: erro na sql: $sql<br>".mysql_error($conn)."<br>");
	//if($from != "funcoes") logSQL_write($sql);
	return $resultado;
}

// retorna mysql_num_rows($resultados)>0
function bdNumReg($resultados)
{
	return mysql_num_rows($resultados);
}

// INSERT INTO $tabela($campos) VALUES($valores) usando $conn
function bdInsert($tabela,$campos,$valores,$conn)
{
	if ($campos=="") die("bdInsert: campos?");
	if ($valores=="") die("bdInsert: valores?");
	$sql = "INSERT INTO " . $tabela . "(" . $campos . ") VALUES(" . $valores . ")";
	
	mysql_query($sql,$conn) or die("bdInsert: erro na sql: $sql<br />" . mysql_error());
	logSQL_write($sql);
	return mysql_insert_id();
}

// UPDATE $tabela SET $valores WHERE $condicao usando $conn
function bdUpdate($tabela,$valores,$condicao,$conn)
{
	if ($tabela=="") die("bdUpdate: tabela?");
	if ($valores=="") die("bdUpdate: valores?");
	$sql = "UPDATE " . $tabela . " SET " . $valores;
	if ($condicao!="") $sql .= " WHERE " . $condicao;
	$ret = mysql_query($sql,$conn); //or die("bdUpdate: erro na sql: $sql<br />" . mysql_error());
	logSQL_write($sql);
	return ret;
}

// DELETE FROM $tabela WHERE $condicao usando $conn
function bdDelete($tabela,$condicao,$conn)
{
	if ($tabela=="") die("bdUpdate: tabela?"); 
	//if ($condicao=="") die("bdUpdate: condicao?");
	$sql = "DELETE FROM " . $tabela;
	if ($condicao!="") $sql .= " WHERE " . $condicao;
	mysql_query($sql,$conn) or die("bdDelete: erro na sql: $sql<br />" . mysql_error());
	logSQL_write($sql);
	return mysql_affected_rows();
}

// Evolucao da funcao bdSelect
// recebe adicionalmente a pagina a ser exibida e o tamanho da pagina
// retorna um array com 3 posicoes:
//	'total' contem o total de registros da SQL original
//	'res' contem o identificador do resultado da pagina selecionada
//	'paginas' contem um array contendo a paginacao disponivel para esta colecao de registros
function paginacao($select,$from,$where,$orderby,$conn,$pagina,$tam_pag,$debug=false)
{
	$sql  = "SELECT " . $select ;
	$sql .= " FROM " . $from ;
	if ($where!="") $sql .= " WHERE " . $where;
	if ($orderby!="") $sql .= " ORDER BY " . $orderby;
	
	$res = mysql_query($sql,$conn);
	$total_res = mysql_num_rows($res);
			
	$start_reg = ($pagina-1) * $tam_pag;
	$sql .= " LIMIT $start_reg,$tam_pag";
	
	if($debug) echo $sql;
	
	$res  = mysql_query($sql,$conn) or die("Paginação: erro na sql: $sql<br>".mysql_error($conn)."<br>");
	
	$num_pags = ceil($total_res / $tam_pag);
	for($i=0;$i<$num_pags;$i++)
	{
		$paginas[] = $i+1;
	}
	
	return array(
		'total' => $total_res,
		'res' => $res,
		'paginas' => $paginas
	);
}

/* #################################
   ##### FUNCOES DE STRING #########
   ################################# */

// completa $s com $n zeros
// pad("12345",10) retornaria "0000012345"
function pad($s, $n)
{
	$r = $s;
	while (strlen($r) < $n)
	{
		$r = "0".$r;
	}
	return $r;
}

/* #################################
   ######## FUNCOES DE DATA#########
   ################################# */

// modo gambiarra de fazer a transformacao yyyy-mm-dd => dd/mm/aaaa
function data($string)
{
	if($string!="" && $string!="0000-00-00 00:00:00")
		return substr($string,8,2) . "/" . substr($string,5,2) . "/" . substr($string,0,4);
	return "";
}

// modo gambiarra de fazer a transformacao dd/mm/yyyy => yyyy-mm-dd
function data_server($string,$vazio_null=FALSE)
{
	//dd/mm/aaaa
	//0123456789
	if($string!="" && $string!="0000-00-00 00:00:00")
		return substr($string,6,4) . "-" . substr($string,3,2) . "-" . substr($string,0,2);
	if($vazio_null)
		return NULL;
	else
		return "";
}

// retorna 0 uma data valida no formato DD/MM/AAAA, ou outro numero para informar erro
function isDate($string)
{
	if (strlen($string)!=10)
	{
		return 1;
	}
	else
	{
		$temp = explode("/",$string);
		$dia = $temp[0];
		$mes = $temp[1];
		$ano  = $temp[2];
		
		if ( strlen($ano)!=4 || strlen($mes)!=2 || strlen($dia)!=2 )
			return false;
			
		return checkdate($mes,$dia,$ano);
	}
}

/* #################################
   ######## FUNCOES DE URL #########
   ################################# */

//Redirecionamento
function redir($url) {
	if (!headers_sent($filename, $linenum)) {
		header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
	
		header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
		
		header("Cache-Control: no-store, no-cache, must-revalidate");
		header("Cache-Control: post-check=0, pre-check=0", false);
	
		header("Pragma: no-cache");
		header('Location: ' . $url);
		exit;
	}
	else
	{
		echo "Impossível redirecionar. Por favor <a " . "href=\"" . $url . "\">clique aqui</a> para continuar\n";
		exit;
	}
}

// constroi $query_string baseado em dados $_GET e $_POST
function build_geturl()
{
	global $REQUEST_URI, $REQUEST_METHOD, $HTTP_GET_VARS, $HTTP_POST_VARS;
	
	$temp = explode("?", $REQUEST_URI);
	// $temp agora tem altas coisas, na posicao 0 o nome do arquivo
	
	$cgi = $REQUEST_METHOD == 'GET' ? $HTTP_GET_VARS : $HTTP_POST_VARS;
	// $cgi Ã© um array com todas as get_vars ou todas as post_vars
	
	reset ($cgi);
	// coloca o ponteiro de array de $cgi no comeco
	
	while (list($key, $value) = each($cgi)) {
	if ($key != "pag")
		$query_string .= "&" . $key . "=" . $value;
	}
	return $query_string;
}

/* #################################
   ###### FUNCOES DE ARQUIVOS ######
   ################################# */

// UPLOAD

function upload_simples($nome,$arquivo_temp,$destino,$novonome)
{
	$extensao = strtolower(strrchr($nome,'.'));
	$novonome .= $extensao;
	
	move_uploaded_file($arquivo_temp, $destino . $novo_nome);
}

// $campo: nome do campo FILE a ser enviado
// $novo_nome: nome com o qual o arquivo serï¿½armazenado,sem a extensao; deixar em branco para usar o mesmo nome
// $destino: pasta destino para o arquivo
// $extensoes_validas: array contendo as extensoes validas para o arquivo; deixar em branco para nao restringir
// $tamanho_maximo: tamanho mï¿½imo em bytes para o arquivo. Deixar em branco para assumir os limites do prï¿½rio PHP
// $sobrescrever: true ou false para sobrescrever ou nao caso o arquivo de destino ja exista
function upload_form($campo,$novo_nome,$destino,$extensoes_validas,$tamanho_maximo,$sobrescrever)
{
	$upload['status'] = true;
	$upload['msg'] = "";
	
	if ($campo=="")
	{
		$upload['status'] = false;
		$upload['msg'] = "O parâmetro CAMPO(primeiro campo) deve ser informado.";
	}
	
	if ($destino=="")
	{
		$upload['status'] = false;
		$upload['msg'] = "O parâmetro DESTINO(terceiro campo) deve ser informado";
	}
	else if (!is_dir($destino))
	{
		$upload['status'] = false;
		$upload['msg'] = "O parâmetro DESTINO(terceiro campo) deve ser um diretório valido";
	}
	else if (!is_writable($destino))
	{
		$upload['status'] = false;
		$upload['msg'] = "O parâmetro DESTINO(terceiro campo) deve ser um diretório com permissão de gravação";
	}
		
	$nome = $_FILES[$campo]['name'];
	$tamanho = $_FILES[$campo]['size'];
	$extensao = strtolower(strrchr($_FILES[$campo]['name'],'.'));
	$arquivo_temp = $_FILES[$campo]['tmp_name'];
	
	if ($novo_nome=="")
		$novo_nome = $nome . $extensao;
	else
		$novo_nome = $novo_nome . $extensao;
		
	if (($tamanho_maximo > 0) && ($tamanho > $tamanho_maximo))
	{
		$upload['status'] = false;
		$upload['msg'] = "O arquivo possui $tamanho bytes. Maximo permitido: $tamanho_maximo bytes.";
	}
	if (count($extensoes_validas) > 0 && !in_array($extensao,$extensoes_validas))
	{
		$upload['status'] = false;
		$upload['msg'] = "A extensão do arquivo é $extensao. As extensões permitidas sao: '" . implode("' , '",$extensoes_validas) . "'";
	}
	
	if (!$sobrescrever && file_exists($destino . $novo_nome))
	{
		$upload['status'] = false;
		$upload['msg'] = "O arquivo $novo_nome já existe na pasta $destino e nao pode ser sobrescrito";
	}
	
	if ($upload['status'])
	{
		if(!move_uploaded_file($arquivo_temp, $destino . $novo_nome))
		{
			$upload['status'] = false;
			$upload['msg'] = "Não foi possível gravar o arquivo $novo_nome em $destino.";
		}
		else
		{
			$upload['status'] = true;
			$upload['msg'] = $novo_nome;
		}
	}
	return($upload);
}

/**
 * remove diretorio e tudo que tiver nele.
*/
function removeDir($dirname,$only_empty=false)
{
	if (!is_dir($dirname))
		return false;
	$dscan = array(realpath($dirname));
	$darr = array();
	while (!empty($dscan))
	{
		$dcur = array_pop($dscan);
		$darr[] = $dcur;
		if ($d=opendir($dcur))
		{
			while ($f=readdir($d))
			{
				if ($f=='.' || $f=='..')
					continue;
				$f=$dcur.'/'.$f;
				if (is_dir($f))
					$dscan[] = $f;
				else
					unlink($f);
			}
			closedir($d);
		}
	}
	$i_until = ($only_empty)? 1 : 0;
	for ($i=count($darr)-1; $i>=$i_until; $i--)
		rmdir($darr[$i]);
	
	return (($only_empty)? (count(scandir)<=2) : (!is_dir($dirname)));
}

function validaEmail($email,$requerido)
{
	if (!$requerido)
	{
		# O campo e-mail NAO é requerido...
		if (strlen($email)==0)
		{
			# ... e estah¡ vazio. Aceitando
			return 1;
		}
		else
		{
			# ... Mas NAO esta vazio... testando...
			if (ereg("^([0-9,a-z,A-Z]+)([.,_]([0-9,a-z,A-Z]+))*[@]([0-9,a-z,A-Z]+)([.,_,-]([0-9,a-z,A-Z]+))*[.]([0-9,a-z,A-Z]){2}([0-9,a-z,A-Z])?$", $email))
			{
				# E-mail valido. Aceitando
	    		return 1;
			}
			else
			{
				# E-mail invalido. Rejeitando
				return 0;
			}
		}
	}
	else
	{
		# O campo e-mail EH requerido...
		if (strlen($email)==0)
		{
			# ... mas esta¡ vazio. Rejeitando
			return 0;
		}
		else
		{
			# .. e contem dados. testando...
			if (ereg("^([0-9,a-z,A-Z]+)([.,_]([0-9,a-z,A-Z]+))*[@]([0-9,a-z,A-Z]+)([.,_,-]([0-9,a-z,A-Z]+))*[.]([0-9,a-z,A-Z]){2}([0-9,a-z,A-Z])?$", $email))
			{
				# E-mail válido. Aceitando
	    		return 1;
			}
			else
			{
				# E-mail invalido. Rejeitando
				return 0;
			}
		}
	}
}

function validaCPF($cpf)
{
	if( ($cpf == '11111111111') || ($cpf == '22222222222') || ($cpf == '33333333333') || ($cpf == '44444444444') || ($cpf == '55555555555') || ($cpf == '66666666666') || ($cpf == '77777777777') || ($cpf == '88888888888') || ($cpf == '99999999999') )
	{
		$status = false;
	}
	else
	{
		//PEGA O DIGITO VERIFIACADOR
		$dv_informado = substr($cpf, 9,2);
	
		for($i=0; $i<=8; $i++) { $digito[$i] = substr($cpf, $i,1); }
	
		//CALCULA O VALOR DO 10º DIGITO DE VERIFICAÇÂO
		$posicao = 10;
		$soma = 0;
	
		for($i=0; $i<=8; $i++)
		{
			$soma = $soma + $digito[$i] * $posicao;
			$posicao = $posicao - 1;
		}
	
		$digito[9] = $soma % 11;
	
		if($digito[9] < 2) $digito[9] = 0;
		else $digito[9] = 11 - $digito[9];
		
		//CALCULA O VALOR DO 11º DIGITO DE VERIFICAÇÃO
		$posicao = 11;
		$soma = 0;
	
		for ($i=0; $i<=9; $i++)
		{
			$soma = $soma + $digito[$i] * $posicao;
			$posicao = $posicao - 1;
		}
	
	   $digito[10] = $soma % 11;
	
		if ($digito[10] < 2) $digito[10] = 0;
		else $digito[10] = 11 - $digito[10];
	
	  //VERIFICA SE O DV CALCULADO É IGUAL AO INFORMADO
		$dv = $digito[9] * 10 + $digito[10];
	  if ($dv != $dv_informado) { $status = false; }
	  else $status = true;
	}
	return $status;
}

function valida_dados()
{
	define("db",0);
	define("label",1);
	define("tipo",2);
	define("req",3);
	define("valor",4);
	
	global $campos;
	
	foreach($campos as $campo)
	{
		switch($campo[tipo])
		{
			case "varchar":
				if($campo[req]=="requerido")
				{
					if(strlen($campo[valor])==0)
					{
						$erro['fatal'][] = $campo[label] . " é um campo requerido.";
					}
				}
				else if($campo[req]=="importante")
				{
					if(strlen($campo[valor])==0)
					{
						$erro['alerta'][] = "O campo \"" . $campo[label] . "\" é uma informação relevante e deveria ter sido preenchido.";
					}
				}
				break;
			case "email":
				if($campo[req]=="requerido")
				{
					if(!validaEmail($campo[valor],1))
					{
						$erro['fatal'][] = $campo[label] . " deve ser um e-mail válido.";
					}
				}
				else
				{
					if(!validaEmail($campo[valor],0))
					{
						$erro['fatal'][] = $campo[label] . " deve ser um e-mail válido.";
					}
				}
				break;
			case "data":
				if($campo[req]=="requerido")
				{
					if(strlen($campo[valor])==0)
					{
						$erro['fatal'][] = $campo[label] . " deve ser uma data válida.";
					}
					else
					{
						$data = explode("-",$campo[valor]);
						if(!checkdate($data[1],$data[2],$data[0]))
						{
							$erro['fatal'][] = $campo[label] . " deve ser uma data válida.";
						}
					}
				}
				else if($campo[req]=="nao-requerido")
				{
					if(strlen($campo[valor])>0)
					{
						$data = explode("-",$campo[valor]);
						if(!checkdate($data[1],$data[2],$data[0]))
						{
							$erro['fatal'][] = $campo[label] . " deve ser uma data valida.";
						}
					}
				}
				else if($campo[req]=="importante")
				{
					if(strlen($campo[valor])==0)
					{
						$erro['alerta'][] = "A data de nascimento não foi preenchida ou está errada. Confirme a informação.";
					}
					else
					{
						$data = explode("-",$campo[valor]);
						if(!checkdate($data[1],$data[2],$data[0]))
						{
							$erro['fatal'][] = $campo[label] . " deve ser uma data válida.";
						}
					}
				}
				break;
			case "datetime":
				if (preg_match("/^(\d{4})-(\d{2})-(\d{2}) ([01][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])$/", $campo[valor], $matches))
				{
					if (!checkdate($matches[2], $matches[3], $matches[1])) {
						$erro['fatal'][] = $campo[label] . " deve ser uma data com horÃ¡rio válidos.";
					}
				}
				break;
			case "numero":
				if($campo[req]=="requerido")
				{
					if(strlen($campo[valor])==0)
					{
						$erro['fatal'][] = $campo[label] . " deve ser um numero.";
					}
					else
					{
						if(!is_numeric($campo[valor]))
						{
							$erro['fatal'][] = $campo[label] . " deve ser um numero.";
						}
					}
				}
				else
				{
					if(strlen($campo[valor])>0)
					{
						if(!is_numeric($campo[valor]))
						{
							$erro['fatal'][] = $campo[label] . " deve ser um numero.";
						}
					}
				}
				break;
			case "checkbox":
				if($campo[valor]=="")
				{
					$campo[valor]=0;
				}
				else
				{
					$campo[valor]=1;
				}
				break;
			case "login":
				if($campo[req]=="requerido")
				{
					if(strlen($campo[valor])==0)
					{
						$erro['fatal'][] = $campo[label] . " inválido.";
					}
					else
					{
						if(!preg_match("/^\w{4,20}$/", $campo[valor]))
						{
							$erro['fatal'][] = $campo[label] . " inválido.";
						}
					}
				}
				else
				{
					if(strlen($campo[valor])>0)
					{
						if(!preg_match("/^\w{4,20}$/", $campo[valor]))
						{
							$erro['fatal'][] = $campo[label] . " inválido.";
						}
					}
				}
				break;
			case "senha":
				if($campo[req]=="requerido")
				{
					if(strlen($campo[valor])==0)
					{
						$erro['fatal'][] = $campo[label] . " inválida.";
					}
					else
					{
						if(!preg_match("/^\w{4,20}$/", $campo[valor]))
						{
							$erro['fatal'][] = $campo[label] . " inválida.";
						}
					}
				}
				else
				{
					if(strlen($campo[valor])>0)
					{
						if(!preg_match("/^\w{4,20}$/", $campo[valor]))
						{
							$erro['fatal'][] = $campo[label] . " inválida.";
						}
					}
				}
				break;
			case "cpf":
				$campo[valor] = str_replace("-","",str_replace(".","",$campo[valor]));
				if($campo[req]=="requerido")
				{
					if(strlen($campo[valor])==0)
					{
						$erro['fatal'][] = $campo[label] . " inválido.";
					}
					else
					{
						if(!validaCPF($campo[valor]))
						{
							$erro['fatal'][] = $campo[label] . " inválido.";
						}
					}
				}
				else if($campo[req]=="nao-requerido")
				{
					if(strlen($campo[valor])>0)
					{
						if(!validaCPF($campo[valor]))
						{
							$erro['fatal'][] = $campo[label] . " inválido.";
						}
					}
				}
				else if($campo[req]=="importante")
				{
					if(strlen($campo[valor])==0)
					{
						$erro['alerta'][] = "O CPF não foi preenchido ou está errado. Confirme a informação.";
					}
					else if(!validaCPF($campo[valor]))
					{
						$erro['fatal'][] = $campo[label] . " inválido.";
					} 
				}
				break;
			case "":
				if($campo[req]=="requerido" && strlen($campo[valor])==0)
				{
					echo $campo[label];
					$erro['fatal'][] = "Selecione uma opção para " . $campo[label];
				}
				break;
		}
	}
	return $erro;
}

function double($val)
{
	return str_replace(".",",",$val);
}

function double_server($val)
{
	return str_replace(",",".",$val);
}

function echobr($str)
{
	echo "<hr>" . $str . "<hr><br>";
}

function alert($str)
{
	echo "<script>alert(\"$str\");</script>";
}

function inicializaEstados()
{
	global $visual;
	$estados_siglas = array('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO');
	$estados_nomes = array(
		'AC'=>'Acre',
		'AL'=>'Alagoas',
		'AP'=>'Amapá¡',
		'AM'=>'Amazonas',
		'BA'=>'Bahia',
		'CE'=>'Ceará¡',
		'DF'=>'Distrito Federal',
		'ES'=>'Espírito Santo',
		'GO'=>'Goias',
		'MA'=>'Maranhão',
		'MT'=>'Mato Grosso',
		'MS'=>'Mato Grosso do Sul',
		'MG'=>'Minas Gerais',
		'PA'=>'Pará¡',
		'PB'=>'Paraíba',
		'PR'=>'Paraná¡',
		'PE'=>'Pernambuco',
		'PI'=>'Piaí',
		'RJ'=>'Rio de Janeiro',
		'RN'=>'Rio Grande do Norte',
		'RS'=>'Rio Grande do Sul',
		'RO'=>'Rondônia',
		'RR'=>'Roraima',
		'SC'=>'Santa Catarina',
		'SP'=>'São Paulo',
		'SE'=>'Sergipe',
		'TO'=>'Tocantins'
	);
	$visual->assign("estados",$estados_siglas);
}

/* Dias da Semana. */
$semana = array(
	"Sun" => "Domingo",
	"Mon" => "Segunda",
	"Tue" => "Terça",
	"Wed" => "Quarta",
	"Thu" => "Quinta",
	"Fri" => "Sexta",
	"Sat" => "Sábado"
); 

/* Meses */
$meses = array(
	 1 =>"Janeiro",
	 2 =>"Fevereiro",
	 3 =>"Março",
	 4 =>"Abril",
	 5 =>"Maio",
	 6 =>"Junho",
	 7 =>"Julho",
	 8 =>"Agosto",
	 9 =>"Setembro",
	10 =>"Outubro",
	11 =>"Novembro",
	12 =>"Dezembro"
); 

function logAdm($conn,$login,$mensagem,$sql="")
{
	$str_valores[] = "'" . $login . "'";
	$str_valores[] = "'" . $mensagem . "'";
	$str_valores[] = "'" . $sql . "'";
	$str_valores=implode(",",$str_valores);
	
	bdInsert(
		"logs_admin",
		"login,mensagem,query",
		$str_valores,
		$conn
	);
}

function logSQL_write($sql)
{
	global $sqllogfile;
	$sqllogfile = str_replace("%date%",date("Y-m-d"),$sqllogfile);
	
	if ($handle = fopen($sqllogfile, 'a'))
	{
		$str = time() . "\t" . $sql . "\n";
		return fwrite($handle, $str);
	}
}

?>