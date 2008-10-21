<?php

if(!defined('ISINC')) die('serious error');

if (!empty($site_title)) $title=$site_title;
if (!empty($titles[$inc])) $title=$title.": $titles[$inc]";

$themepage=$theme_dir.'theme.php';
$bodytag='%%BODY%%';

if (file_exists($themepage)) {
	
	ob_start(); include_once $themepage; $temp = ob_get_contents(); ob_end_clean();

	if (isset($image_dir)) { 
		$temp=preg_replace('/(<img src=")(images\/)/is','$1'.$image_dir,$temp);
		$temp=preg_replace('/(background=")(images\/)/is','$1'.$image_dir,$temp);
	}
	if (isset($theme_dir)) $temp=preg_replace('/( href=")([^>]*?\.css")/is','$1'.$theme_dir.'$2',$temp);
	if (isset($title)) $temp=preg_replace('/(<title>)(.*)(<\/title>)/is','${1}'.$title.'$3',$temp);
	if (isset($page)) $temp=str_replace('admin.php',$page,$temp);
	if (isset($page)) $temp=str_replace('index.php',$page,$temp);
	if (isset($config['charset'])) {
		$charset=str_replace('charset=','',$config['charset']);
		$temp=str_replace('charset=UTF-8','charset='.$charset,$temp);
		$temp=str_replace('charset=ISO-8859-1','charset='.$charset,$temp);
	}

	$header=eregi_replace($bodytag.'.*', '', $temp);
	$footer=eregi_replace('.*'.$bodytag, '', $temp);
}

if (!empty($header)) { echo $header; unset($header); }

?>