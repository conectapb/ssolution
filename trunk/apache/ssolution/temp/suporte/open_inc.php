<?php

/*

	Use this to include the "open form" into your site
	
	eg: 
		$include='/home/user/public_html/eticket/open_inc.php';
		if (file_exists($include)) { include_once($include); }

*/

define('NO_REDIRECT',1); //override redirect
define('NO_THEME',1); //override theme
define('NO_JS',1); //override javascript
require_once('init.php');
require_once('open.php');
?>