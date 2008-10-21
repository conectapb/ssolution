<?
require_once(dirname(__FILE__).'/libs/phpgacl/gacl.class.php');
$gacl = new gacl($gacl_options); //Use the same options as above.
/*$user = 'nerdcat';
if ( $gacl->acl_check('system','login','users',$user) ) {
	echo "$user has been granted access to login!<br>\n";	
} else {
	echo "$user has been denied access to login!<br>\n";	
}
$user = 'sergio';
if ( $gacl->acl_check('system','login','users',$user) ) {
	echo "$user has been granted access to login!<br>\n";	
} else {
	echo "$user has been denied access to login!<br>\n";	
}
*/
//acl_check  (string $aco_section_value, string $aco_value, string $aro_section_value, string $aro_value, [string $axo_section_value = NULL], [string $axo_value = NULL], [integer $root_aro_group = NULL], [integer $root_axo_group = NULL]) 

$aco_section_value = 'system';
$aco_value = 'cadastro';
$aro_section_value = 'users';
$aro_value = 'sergio';
$axo_section_value = 'sistema';
$axo_value = 'clientes';

if ( $gacl->acl_check($aco_section_value,$aco_value,$aro_section_value,$aro_value,$axo_section_value,$axo_value )  ) {
	echo "$aro_value has been granted access!<br>\n";	
} else {
	echo "$aro_value has been denied access!<br>\n";	
}

$aco_section_value = 'system';
$aco_value = 'cadastro';
$aro_section_value = 'users';
$aro_value = 'agsoliveira';
$axo_section_value = 'sistema';
$axo_value = 'clientes';

if ( $gacl->acl_check($aco_section_value,$aco_value,$aro_section_value,$aro_value,$axo_section_value,$axo_value )  ) {
	echo "$aro_value has been granted access!<br>\n";	
} else {
	echo "$aro_value has been denied access!<br>\n";	
}

$aco_section_value = 'system';
$aco_value = 'cadastro';
$aro_section_value = 'users';
$aro_value = 'nerdcat';
$axo_section_value = 'sistema';
$axo_value = 'clientes';

if ( $gacl->acl_check($aco_section_value,$aco_value,$aro_section_value,$aro_value,$axo_section_value,$axo_value )  ) {
	echo "$aro_value has been granted access!<br>\n";	
} else {
	echo "$aro_value has been denied access!<br>\n";	
}

?>