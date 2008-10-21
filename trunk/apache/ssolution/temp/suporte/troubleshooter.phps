<?php

/*

eTicket Troubleshooter by HM2K v0.2 - Updated 11/10/07

Description: Helps troubleshoot possible problems with eTicket

Install: Place in your eTicket root directory and visit the appropreate URL

*/

error_reporting(0);

$include='init.php'; if (file_exists($include)) { require_once($include); }

echo '<p><b>Troubleshooter:</b></p>';

$msgs[]='PHP version: '.phpversion().' (Should be PHP 4.0.5 or above)';
if (!ini_get('short_open_tag')) { $msgs[]='PHP <a href="http://www.php.net/ini.core#ini.short-open-tag">Short Open Tags</a> Off (Should be On)'; }
if (ini_get('safe_mode')) { $msgs[]='PHP <a href="http://www.php.net/features.safe-mode">Safe Mode</a> is On (Should be Off)'; }
if (VERSION) { $msgs[]='eTicket version: '.VERSION; }
if ($_SERVER['SERVER_SOFTWARE']) { $msgs[]='Webserver: '.$_SERVER['SERVER_SOFTWARE']; }
if (mysql_get_server_info()) { $msgs[]='Database: MySQL '.mysql_get_server_info().' (Should be MySQL 4.1 or above)'; }
if (function_exists('gd_info')) { $gd=gd_info(); $msgs[]='GD version: '.$gd['GD Version']; }
else { $msgs[]='GD is not installed, CAPTCHA will not work, remove "captcha.php".'; }
if (isset($_ENV['OS'])) { $msgs[]='Operating System: '.$_ENV['OS']; }
if ($_SERVER['HTTP_USER_AGENT']) { $msgs[]='User Agent: '.$_SERVER['HTTP_USER_AGENT']; }

$url[]=substr($_SERVER['SERVER_PROTOCOL'],0,strrpos($_SERVER['SERVER_PROTOCOL'],'/'))=='HTTPS'?'https://':'http://';
$url[]=$_SERVER['HTTP_HOST'];
$url[]=$_SERVER['REQUEST_URI'];
$url=htmlspecialchars(implode('',$url));
$msgs[]='Link: '.$url;

$out='';

foreach ($msgs as $msg) { $out.="<li>$msg</li>\n"; }
$out="\n<ul>$out</ul>\n";
	
echo $out;

?>