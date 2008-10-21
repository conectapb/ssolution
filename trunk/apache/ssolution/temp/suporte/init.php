<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

/* 

	Do not edit this file
	
	Please see settings.php or use the installer

*/

// Emulate register_globals off
function unregister_GLOBALS()
{
  if (!ini_get('register_globals')) {
      return;
  }

  if (isset($_REQUEST['GLOBALS']) || isset($_FILES['GLOBALS'])) {
      die(); //GLOBALS overwrite attempt detected
  }

  // Variables that shouldn't be unset
  $noUnset = array('GLOBALS',  '_GET',
                     '_POST',    '_COOKIE',
                     '_REQUEST', '_SERVER',
                     '_ENV',     '_FILES',
                     '_SESSION');

	if (empty($GLOBALS)) { return; }
  foreach ($GLOBALS as $k => $v) {
     if (is_numeric($k) || !in_array($k, $noUnset)) {
         unset($GLOBALS[$k]);
     }
  }
}

unregister_GLOBALS();

require_once('lang.php'); //we need to include this first
$settings=array();
$answers=array();
require_once('settings.php'); //include the database details and other settings
if (!isset($settings['answers']) && isset($answers)) $settings['answers']=$answers;
if (!isset($settings['site_title']) && isset($site_title)) $settings['site_title']=$site_title;

$db_table['answers']=$db_table_prefix.'answers';
$db_table['attachments']=$db_table_prefix.'attachments';
$db_table['banlist']=$db_table_prefix.'banlist';
$db_table['categories']=$db_table_prefix.'categories';
$db_table['config']=$db_table_prefix.'config';
$db_table['groups']=$db_table_prefix.'groups';
$db_table['messages']=$db_table_prefix.'messages';
$db_table['privmsg']=$db_table_prefix.'privmsg';
$db_table['reps']=$db_table_prefix.'reps';
$db_table['settings']=$db_table_prefix.'settings';
$db_table['tickets']=$db_table_tickets?$db_table_tickets:'tickets';

$db_table_config=$db_table['config']; // retro

if ((!empty($rootpath_dir)) && (is_dir($rootpath_dir))) { @chdir($rootpath_dir); }

//detect which OS we're on and produce the correct slash
if ((isset($_ENV['OS'])) && ($_ENV['OS'] == 'Windows_NT')) { define('SLASH', '\\'); }
else { define('SLASH', '/'); }

/* Core variables */

//vars for product - not really used that much atm
define('VERSION','1.5.6');
$product_name='eTicket';
$product_desc='Support Ticket System';
$product_url='http://eticket.sourceforge.net/';
//This is the link to product support
$help_link='<a href="http://sourceforge.net/projects/eticket/" target="_blank">eTicket Help</a>';

//files, directories and table vars
$themes_dir='themes'; //directory of themes
$image_dir='images'; //directory of images in themes
$buttons_dir='buttons'; //directory of button images in themes
$install_script='install'; //directory of installer
$inc_dir='inc'; //directory of includes
$captcha_file='captcha.php'; //CAPTCHA MOD
$header_file='header.php'; //part of the theme
$footer_file='footer.php'; //part of the theme
$errors_file='errors.php'; //displays errors

//defines - must be loaded BEFORE INC files are included
if (substr($inc_dir, -1) != SLASH) { $inc_dir=$inc_dir.SLASH; } //just a quick fix...
define('INC_DIR',$rootpath_dir.$inc_dir); //full path of include directory
define('ADMIN', 1); //this is the numerical value of the Administrator's group as per the database
define('ISINC',TRUE); //used to check if this file has been run

require_once(INC_DIR.'class.ticket.php');

//backwards compatability
define('INCLUDE_DIR',INC_DIR);

$site_header=INC_DIR.$header_file;
$site_footer=INC_DIR.$footer_file;
$site_errors=INC_DIR.$errors_file;

$PHP_SELF=$_SERVER['PHP_SELF'];

//check the script is installed, or die.
if ($installed != TRUE) { 
	if (file_exists($install_script)) { header("Location: $install_script/"); }
	else { die(); }
}

/* More variables */

//Load the page titles for the pages, also used for the buttons
$titles = array('viewticket'=>LANG_TITLE_VIEWTICKET, 
				'admin_login'=>LANG_TITLE_ADMIN_LOGIN,
				'user_login'=>LANG_TITLE_USER_LOGIN, 
				'main'=>'', 
				'pref'=>LANG_TITLE_PREF, 
				'mail'=>LANG_TITLE_MAIL, 
				'cat'=>LANG_TITLE_CAT, 
				'rep'=>LANG_TITLE_REP, 
				'user_group'=>LANG_TITLE_GROUPS, 
				'banlist'=>LANG_TITLE_BANLIST, 
				'my'=>LANG_TITLE_MY);

//This is the timezone data, used in inc/pref.php
$gmoffset = date('O');
$timezones = array(''=>LANG_SYSTEM_TIMEZONE." (GMT $gmoffset)",
                               -12=>"GMT -12:00 (Eniwetok, Kwajalein)",
                               -11=>"GMT -11:00 (Midway Island, Samoa)",
                               -10=>"GMT -10:00 (Hawaii)",
                               -9=>"GMT -09:00 (Alaska)",
                               -8=>"GMT -08:00 (Pacific Time)",
                               -7=>"GMT -07:00 (Mountain Time)",
                               -6=>"GMT -06:00 (Central Time)",
                               -5=>"GMT -05:00 (Eastern Time)",
                               -4=>"GMT -04:00 (Atlantic Time)",
                               -3=>"GMT -03:00 (Greenland)",
                               -2=>"GMT -02:00 (Mid-Atlantic)",
                               -1=>"GMT -01:00 (Azores)",
                               0=>"GMT (Greenwich Mean Time)",
                               1=>"GMT +01:00 (West Central Africa)",
                               2=>"GMT +02:00 (Jerusalem)",
                               3=>"GMT +03:00 (Baghdad)",
                               4=>"GMT +04:00 (Kabul)",
                               5=>"GMT +05:00 (New Delhi)",
                               6=>"GMT +06:00 (Kathmandu)",
                               7=>"GMT +07:00 (Bangkok)",
                               8=>"GMT +08:00 (Hong Kong)",
                               9=>"GMT +09:00 (Tokyo)",
                               10=>"GMT +10:00 (Sydney)",
                               11=>"GMT +11:00 (Solomon Islands)",
                               12=>"GMT +12:00 (Fiji)",
                               13=>"GMT +13:00 (Nuku'alofa)");

//check if install script exists
if (file_exists($install_script)) { die('<div align="center"><b>'.LANG_FATAL_ERROR.':</b> '.$install_script.' '.LANG_REMOVE_FOR_SECURITY_REASONS.'</div>'); }

//does include dir exist?
if (!file_exists(INC_DIR)) { die('<b>'.LANG_FATAL_ERROR.':</b>'.LANG_INC_DIR_NOT_EXIST.'<br>'.$help_link); }

//connect to database
if ($db_con = @mysql_connect($db_host, $db_user, $db_pass)) { $db_sel = mysql_select_db($db_name, $db_con); }

//check for errors
if (mysql_error()) { die('<b>'.LANG_FATAL_ERROR.':</b> '.LANG_DB_COULD_NOT_CONNECT.'<br>'.mysql_error().'<br>'.$help_link); }

//Disable strict mode in MySQL 5... Bug #1793730
mysql_query("SET @@session.sql_mode='MYSQL40'");

/* Load config from database and merge settings */

//get configuration from database
$config=@mysql_fetch_array(mysql_query('SELECT * FROM '.$db_table['config']));
if (empty($config)) { die('<b>'.LANG_FATAL_ERROR.':</b> '.LANG_COULD_NOT_GET_CONF.'<br>'.mysql_error().'<br>'.$help_link); }

//merge $settings from settings.php with $config from the database
if (!empty($settings)) { $config=array_merge($config,$settings); unset($settings); }

$sql=@mysql_fetch_array(mysql_query("SHOW TABLES LIKE '".$db_table['settings']."'"));
if ($sql) {
$query=mysql_query("SELECT * FROM ".$db_table['settings']);
		$db_settings=array();
		while ($setting=mysql_fetch_array($query)) {
			if (!empty($setting['group'])) {
				$db_settings[$setting['group']][$setting['key']]=$setting['value'];
			}
			else {
				$db_settings[$setting['key']]=$setting['value'];
			}
		}
if (!empty($db_settings)) { $config=array_merge($config,$db_settings); unset($db_settings); } //db_settings is greater
}

if ($config['site_title']) { $site_title=$config['site_title']; }

//set attachment dir to ensure it has a trailing slash
$config['attachment_dir']=add_trailing_slash($config['attachment_dir'],SLASH);

//set timezone to server time if not defined
$config['timezone'] = ($config['timezone'] == '') ? date('Z')/3600:$config['timezone'];

//set root_url from database config table (backward compat)
$root_url=$config['root_url'];

//backwards compat for theme
if ((!isset($theme)) && (isset($config['theme']))) { $theme=$config['theme']; }

//if the attachment dir isn't writable, we'll just disable attachments by removing the variable
if (!(is_writable($config['attachment_dir'])) && (file_exists($config['attachment_dir']))) { unset($config['accept_attachments']); }

//sort the ordering of the priorities
$config['pri_text']=array_combine($config['pri'],$config['pri_text']);
$config['pri_style']=array_combine($config['pri'],$config['pri_style']);

// var processing
$themes_dir=add_trailing_slash($themes_dir,'/');
$theme_dir=add_trailing_slash($themes_dir.$theme,'/');
$image_dir=add_trailing_slash($theme_dir.$image_dir,'/');
$buttons_dir=add_trailing_slash($image_dir.$buttons_dir,'/');
$site_title=stripslashes($site_title);

//XSS fix for logins
if (isset($_GET['e'])) { $e=htmlspecialchars(trim($_GET['e'])); }
if (isset($_GET['t'])) { $t=htmlspecialchars(trim($_GET['t'])); }
if (isset($_GET['em'])) { $em=htmlspecialchars(trim($_GET['em'])); }
if (isset($_GET['tt'])) { $tt=htmlspecialchars(trim($_GET['tt'])); }

//set the action
if (isset($_GET['a'])) { $a=$_GET['a']; }
//trim posts
trim_post(array('login_user','login_pass','login_email','login_ticket'));

if (!isset($_SESSION)) { //a hack to fix the session problem where its already been started
 @session_start();
}

//fixes the logout, to login bug, and the additional admin pages
if (strstr($_SERVER['PHP_SELF'], 'view')) { $type='client'; }
elseif (isset($_SESSION['user']['type'])) { $type=$_SESSION['user']['type']; }
else { $type=(strstr($_SERVER['PHP_SELF'], 'admin'))?'admin':'client'; }

if ($type == 'admin') {
	$id=$_POST['login_user'] ? $_POST['login_user']: $_SESSION['user']['id'];
	$pass=$_POST['login_pass'] ? md5($_POST['login_pass']):$_SESSION['user']['pass'];
}
else {
	$id=$_POST['login_email'] ? strtolower($_POST['login_email']):$_SESSION['user']['id'];
  $pass=$_POST['login_ticket'] ? $_POST['login_ticket']:$_SESSION['user']['pass'];
}
$login=login($type, $id, $pass);
if ($login) {
	$_SESSION['user']['id']=$id;
	$_SESSION['user']['pass']=$pass;
	$_SESSION['user']['type']=$type;
}
elseif (($_POST) && (preg_match('/[view|admin].php/',$_SERVER['PHP_SELF']))) { $err=LANG_ERROR_LOGIN; }

if (($type == 'client') && ($_POST['login'])) {
	header('Location: view.php?a=view&id='.$pass); die();
}

//determine what page to display for the type of user
if ($_SESSION['user']['type'] == 'admin') { $page='admin.php'; }
else { $page='view.php'; }

//start login session
if ((isset($a)) && ($a == 'logout')) { logout($page); }

if ($_SESSION['view']['qs'] != $_SERVER['QUERY_STRING']) {
	if ((!isset($_REQUEST['a'])) && (preg_match("/$page/",$_SERVER['PHP_SELF']))) { 
		$_SESSION['view']['qs']=$_SERVER['QUERY_STRING'];
	}
}

//get $a correct
$actions = array(
   'delete',
   'close',
   'reopen',
   'view_open',
   'view_closed',
   'view_answered',
   'refresh'
);

if ((!$_REQUEST['a']) && ($_POST)) {
	foreach ($actions as $action) {
		if ((isset($_POST[$action])) || (isset($_POST[$action.'_x']))) {
			$_REQUEST['a'] = $action;
		}
	}
}

//used for switching in admin.php and view.php
$a=strtolower($_REQUEST['a']);

//better language support
if (function_exists('mb_language')) { //see http://uk2.php.net/manual/en/function.mb-language.php
	if ($config['charset'] == 'ISO-2022-JP') { mb_language('ja'); }
	elseif ($config['charset'] == 'ISO-8859-1') { mb_language('en'); }
	else { mb_language('uni'); }
}
if (function_exists('mb_internal_encoding')) { mb_internal_encoding($config['charset']); }

$mysql_post=escape_array($_POST);

?>