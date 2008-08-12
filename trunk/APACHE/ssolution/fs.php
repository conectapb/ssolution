<?
function imprime($str)
{
	echo $str . "<br>\n";
}

function imprimePasta($str)
{
	echo "<br><b>" . $str . "</b>\n<hr>\n";
	ob_flush();
}

function fsize($size) {
       $a = array("B", "KB", "MB", "GB", "TB", "PB");
       $pos = 0;
       while ($size >= 1024) {
               $size /= 1024;
               $pos++;
       }
       return round($size,2)." ".$a[$pos];
}

$geral = 0;

function varreDir($diretorio,$nivel)
{
	global $geral;
	$indentador = "->";
	
	// coloca / no fim da string do diretorio caso nao tenha
	$diretorio=substr($diretorio,-1)!="/"?$diretorio."/":$diretorio;
	
	//abre o diretorio
	$ponteiro  = opendir($diretorio) or die("fudeu");
	
	// itera pelos itens do diretorio, separando pastas e arquivos
	while ($item = readdir($ponteiro))
	{
		// ignora diretorio corrente (.) e diretorio anterior (..)
		if ($item=="." || $item=="..") continue;
		
		// separa arquivos de diretorios
		if (is_file($diretorio.$item)||!is_dir($diretorio.$item))
		{
			$arquivos[] = $item;
		}
		else
		{
			$diretorios[] = $item;
		}
	}
	
	// exibe string com a pasta corrente
	echo("<div style='border: 1px solid black; margin-left:" . $nivel * 20 . "px'>\n");
	imprimePasta($diretorio);
	
	// ordena pastas e arquivos e itera sobre eles
	if (!empty($diretorios))
	{
		sort($diretorios);
		foreach ($diretorios as $item)
		{
			//imprime($nivel . " dir> " . $item);
			varreDir($diretorio.$item,$nivel+1);
		}
	}
	else
	{
		imprime("## sem subdiretorios ##");
	}
	
	if (!empty($arquivos))
	{
		sort($arquivos);
		foreach ($arquivos as $item)
		{
			$total += filesize($diretorio.$item);
			// imprime($nivel . " arq> " . $item);
		}
		$geral += $total;
		imprime("total: " . fsize($total));
		imprime("<hr>");
	}
	else
	{
		imprime("## sem arquivos ##");
	}
	echo "</div>\n";
}
ob_start();
$oque = $_REQUEST['oque'] != "" ? $_REQUEST['oque'] : "\\\\micro";
//varreDir($oque , 0);
opendir("J:/");
fopen("I:/cam01/0517/Event20080517194124001.avi","+r");
imprime ("<b>TOTAL GERAL:</b> ". fsize($geral));
?>