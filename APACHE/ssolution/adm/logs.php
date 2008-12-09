<?
define('ROOT','../');
require(ROOT . 'configs.php');
require("logado.php");

function varreDir($diretorio)
{
	
}

function logSQL_read()
{
	global $logdir;
	$tmp = array();
	$arr_dir = scandir($logdir);
	foreach($arr_dir as $item)
	{
		if($item==".."||$item==".") continue;
		$arq = $logdir . $item;
		if(is_file($arq))
			if(preg_match("/^sql_[0-9]{4}-[0-9]{2}-[0-9]{2}\.log$/", $item))
				if(sizeof($tmp)==0)
					$tmp = file($arq);
				else
					$tmp = array_merge($tmp,file($arq));
	}
	if (sizeof($tmp)>0)
	{
		foreach($tmp as $linha)
		{
			$tmp = explode("\t",$linha);
			$tipo = explode(" ",$tmp[1]);
			$tipo = $tipo[0];
			$geshi =& new GeSHi($tmp[1], 'sql');
			$geshi->set_header_type(GESHI_HEADER_NONE);
			$log_arr[] = array(
				'data' => $tmp[0],
				'tipo' => $tipo,
				'sql' => $tmp[1],
				'highlight' => $geshi->parse_code()
			);
		}
		return $log_arr;
	}
}

$modo = $_REQUEST['modo'];

if($modo=="sql")
{
	include(ROOT . "libs/geshi/geshi.php");
	$visual->assign("subtitulo","Logs: SQL`s executadas");
	$visual->assign("dados",logSQL_read());
	$visual->display('adm/logs_sql_listagem.tpl');
}
?>