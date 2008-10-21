<?
include('debuglib.php');
# Gm2qk|d*<Ng!

$arq = "testepipe.txt";
$data = date("d/m/Y H:i:s");
if ($handle = fopen($arq, 'a'))
{
	$str = time() . "\t" . $sql . "\n";
	return fwrite($handle, $data . "\r\n");
}
	
//echo $teste;
?>