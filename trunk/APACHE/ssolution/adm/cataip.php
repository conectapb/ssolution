<?
$ip=$_GET['ip'];

if ($ip != "" && $handle = fopen('ips.txt', 'a'))
{
	fwrite($handle, date("c") . " => " . $ip . "\n");
}

echo date();
$file = file("ips.txt");
print_r($file);
?>