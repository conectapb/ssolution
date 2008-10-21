<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

/*===================================================================
	Settings in this section are editable manually.
	
	$settings will get merged into $config in init.php
	
	These settings will eventually be added into the database
===================================================================*/

//additional config/settings
$settings['theme']='eticket'; //this is the name of the folder of the "theme" you are using
$settings['charset']='UTF-8'; //Languages charset, this changes the theme META tag (optional)
$settings['presig']="\n\n--\n"; //the pre-signature, the string that appears before each signature is attached
$settings['short_date_format'] = 'd/m/Y'; //Set the date format that is used to display on ticket lookup
$settings['default_search_days'] = '30'; //set the default number of days the default search should search
$settings['pop3_automail']='automail.php';

//Configure the default answer mail response, in most cases you will not need to edit this.
$settings['answer_subj'] = "[#%ticket] %subject";
$settings['answer_msg'] = "%answer";
//Note: this works in the same way as the mail responses, so you can use the same vars: %ticket, %subject, %name, %email, %url, %answer

//settings for priorities - 1 to 3 by default, you may add more, but this is still beta
$settings['pri']=array(1,2,3);
$settings['pri_text']=array(LANG_LOW,LANG_NORMAL,LANG_HIGH);
$settings['pri_style']=array('class="priLow"','class="priNormal"','class="priHigh"');

//transfer rep mod
$settings['rep_trans_response']=1;
$settings['rep_trans_subj']='[#%ticket] Representative Transfer';
$settings['rep_trans_msg']='Ticket %ticket was transferred to representative %rep_name.';

/*===================================================================
	Predefined answer responses (canned answers)
	
	These will be added into the database eventually
===================================================================*/
$answers=array();
$answers['Intro']="Hi there,\n\n Thanks for your email.\n";
$answers['Sponsorship']="Hi there,\n\nWe are not offering sponsorship right now, please try again at a later date.\n";
$answers['Festive']="Hi there,\n\nWe apologise for the delay over the festive period.\n\nService has now been restored to normal, and we hope to complete any over-due issues asap.\n\nThanks for understanding.\n";
$answers['MoreDetails']="Thanks for your email,\n\nSo we can take this further, please can you provide us with further details such as your order id, username, domain name, and any other appropriate details.\n\nThanks.";
//Note: to disable predefined answers, just remove all of the "$answers" variables above.
$settings['answers']=$answers;

/*===================================================================
	Settings in this section will be updated by using the installer.
	
	Avoid changing settings manually unless you know what you're doing.
====================================================================*/

$installed=TRUE;

//database settings
$db_type = 'mysql'; //Database Type (eg: mysql)
$db_host = 'localhost'; //Database Host (eg: localhost)
$db_name = 'eticket'; //Database Name (eg: eticket)
$db_user = 'eticket'; //Database User (eg: username)
$db_pass = '98q9ShAn3yhPTPSG'; //Database Password

$db_table_prefix = 'ticket_'; //database table prefix
$db_table_tickets = 'tickets'; //tickets table

//core settings
$site_title='Smart Solution - Painel de Suporte'; //site wide title (eg: Your Company - Helpdesk)
$rootpath_dir='F:\sistema\APACHE\ssolution\suporte\\'; //the rootpath directory, where eTicket is installed

$settings['site_title']=$site_title;

?>