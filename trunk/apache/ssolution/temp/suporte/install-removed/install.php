<?php

if (!isset($type)) $type='install';

//error_reporting(0);

if ((isset($_ENV['OS'])) && ($_ENV['OS'] == 'Windows_NT')) { define('SLASH', '\\'); }
else { define('SLASH', '/'); }

$include='header.php'; if (file_exists($include)) { include_once($include); }
require_once('functions.php');

echo '<h2>'.ucwords($type).'</h2>';

$files=array('settings.php','automail-settings.pl','automail.pl');
foreach ($files as $file) {
	$file='..'.SLASH.$file;
	if (!file_exists($file)) { $errors[]="'$file' was not found! Ensure you have uploaded it."; }
	elseif (filesize($file) <= 0) { $errors[]="'$file' is 0 bytes! Ensure you have uploaded it correctly."; }
	elseif (!is_writable($file)) {	$errors[]="'$file' is not writable! chmod this file to 666 during installation."; }
}

$include='..'.SLASH.'lang.php'; if (file_exists($include)) { include_once($include); }
$include='..'.SLASH.'settings.php'; if (file_exists($include)) { include_once($include); }

if (isset($_POST['step'])) { $step=$_POST['step']; }

//check for no steps, start on step1
if ((!isset($step)) || (empty($step))) { $step=1; }

echo "\n<h3>Step $step:</h3>\n";

//step1, error checking and enter database settings
if ($step == 1) { include_once('step1.php'); }

//step2, check database settings, store to file
if ($step == 2) { include_once('step2.php'); }

//step3, update config settings file, 
if ($step == 3) { include_once('step3.php'); }

$include='footer.php'; if (file_exists($include)) { include_once($include); }

?>