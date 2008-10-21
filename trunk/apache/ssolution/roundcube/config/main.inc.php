<?php

/*
 +-----------------------------------------------------------------------+
 | Main configuration file                                               |
 |                                                                       |
 | This file is part of the RoundCube Webmail client                     |
 | Copyright (C) 2005-2008, RoundCube Dev. - Switzerland                 |
 | Licensed under the GNU GPL                                            |
 |                                                                       |
 +-----------------------------------------------------------------------+

*/

$rcmail_config = array();


// system error reporting: 1 = log; 2 = report (not implemented yet), 4 = show, 8 = trace
$rcmail_config['debug_level'] = 1;

// enable caching of messages and mailbox data in the local database.
// this is recommended if the IMAP server does not run on the same machine
$rcmail_config['enable_caching'] = TRUE;

// lifetime of message cache
// possible units: s, m, h, d, w
$rcmail_config['message_cache_lifetime'] = '10d';

// automatically create a new RoundCube user when log-in the first time.
// a new user will be created once the IMAP login succeeds.
// set to false if only registered users can use this service
$rcmail_config['auto_create_user'] = TRUE;

// the mail host chosen to perform the log-in
// leave blank to show a textbox at login, give a list of hosts
// to display a pulldown menu or set one host as string.
// To use SSL connection, enter ssl://hostname:993
$rcmail_config['default_host'] = 'mail.smartsolution.com.br';

// TCP port used for IMAP connections
$rcmail_config['default_port'] = 143;

// IMAP auth type. Can be "auth" (CRAM-MD5), "plain" (PLAIN) or "check" to auto detect.
// Optional, defaults to "check"
$rcmail_config['imap_auth_type'] = null;

// Automatically add this domain to user names for login
// Only for IMAP servers that require full e-mail addresses for login
// Specify an array with 'host' => 'domain' values to support multiple hosts
$rcmail_config['username_domain'] = 'smartsolution.com.br';

// This domain will be used to form e-mail addresses of new users
// Specify an array with 'host' => 'domain' values to support multiple hosts
$rcmail_config['mail_domain'] = '';

// Path to a virtuser table file to resolve user names and e-mail addresses
$rcmail_config['virtuser_file'] = '';

// Query to resolve user names and e-mail addresses from the database
// %u will be replaced with the current username for login.
// The query should select the user's e-mail address as first col
$rcmail_config['virtuser_query'] = '';

// use this host for sending mails.
// to use SSL connection, set ssl://smtp.host.com
// if left blank, the PHP mail() function is used
$rcmail_config['smtp_server'] = 'mail.smartsolution.com.br';

// SMTP port (default is 25; 465 for SSL)
$rcmail_config['smtp_port'] = 25;

// SMTP username (if required) if you use %u as the username RoundCube
// will use the current username for login
$rcmail_config['smtp_user'] = '';

// SMTP password (if required) if you use %p as the password RoundCube
// will use the current user's password for login
$rcmail_config['smtp_pass'] = '';

// SMTP AUTH type (DIGEST-MD5, CRAM-MD5, LOGIN, PLAIN or empty to use
// best server supported one)
$rcmail_config['smtp_auth_type'] = '';

// SMTP HELO host 
// Hostname to give to the remote server for SMTP 'HELO' or 'EHLO' messages 
// Leave this blank and you will get the server variable 'server_name' or 
// localhost if that isn't defined. 
$rcmail_config['smtp_helo_host'] = '';

// Log sent messages
$rcmail_config['smtp_log'] = TRUE;

// these cols are shown in the message list
// available cols are: subject, from, to, cc, replyto, date, size, encoding
$rcmail_config['list_cols'] = array('subject', 'from', 'date', 'size');

// relative path to the skin folder
$rcmail_config['skin_path'] = 'skins/default/';

// includes should be interpreted as PHP files
$rcmail_config['skin_include_php'] = FALSE;

// use this folder to store temp files (must be writebale for apache user)
$rcmail_config['temp_dir'] = 'temp/';

// use this folder to store log files (must be writebale for apache user)
$rcmail_config['log_dir'] = 'logs/';

// session lifetime in minutes
$rcmail_config['session_lifetime'] = 10;

// check client IP in session athorization
$rcmail_config['ip_check'] = false;

// Use an additional frequently changing cookie to athenticate user sessions.
// There have been problems reported with this feature.
$rcmail_config['double_auth'] = false;

// this key is used to encrypt the users imap password which is stored
// in the session record (and the client cookie if remember password is enabled).
// please provide a string of exactly 24 chars.
$rcmail_config['des_key'] = '7U$huTT?ga2OhaZ%cvmHhDTc';

// the default locale setting
$rcmail_config['language'] = 'en';

// use this format for short date display
$rcmail_config['date_short'] = 'D H:i';

// use this format for detailed date/time formatting
$rcmail_config['date_long'] = 'd.m.Y H:i';

// use this format for today's date display
$rcmail_config['date_today'] = 'H:i';

// add this user-agent to message headers when sending
$rcmail_config['useragent'] = 'RoundCube Webmail/0.2a';

// use this name to compose page titles
$rcmail_config['product_name'] = 'Webmail Smart Solution';

// only list folders within this path
$rcmail_config['imap_root'] = '';

// store draft message is this mailbox
// leave blank if draft messages should not be stored
$rcmail_config['drafts_mbox'] = 'Rascunhos';

// store spam messages in this mailbox
$rcmail_config['junk_mbox'] = 'Junk';

// store sent message is this mailbox
// leave blank if sent messages should not be stored
$rcmail_config['sent_mbox'] = 'Enviados';

// move messages to this folder when deleting them
// leave blank if they should be deleted directly
$rcmail_config['trash_mbox'] = 'Lixeira';

// display these folders separately in the mailbox list.
// these folders will also be displayed with localized names
$rcmail_config['default_imap_folders'] = array('INBOX', 'Drafts', 'Sent', 'Junk', 'Trash');

// automatically create the above listed default folders on login
$rcmail_config['create_default_folders'] = FALSE;

// protect the default folders from renames, deletes, and subscription changes
$rcmail_config['protect_default_folders'] = TRUE;

// Set TRUE if deleted messages should not be displayed
// This will make the application run slower
$rcmail_config['skip_deleted'] = FALSE;

// Set true to Mark deleted messages as read as well as deleted
// False means that a message's read status is not affected by marking it as deleted
$rcmail_config['read_when_deleted'] = TRUE;

// When a Trash folder is not present and a message is deleted, flag 
// the message for deletion rather than deleting it immediately.  Setting this to 
// false causes deleted messages to be permanantly removed if there is no Trash folder
$rcmail_config['flag_for_deletion'] = TRUE;

// Behavior if a received message requests a message delivery notification (read receipt)
// 0 = ask the user, 1 = send automatically, 2 = ignore (never send or ask)
$rcmail_config['mdn_requests'] = 0;

// Use this charset as fallback for message decoding
$rcmail_config['default_charset'] = 'ISO-8859-1';

// Make use of the built-in spell checker. It is based on GoogieSpell.
// Since Google only accepts connections over https your PHP installatation
// requires to be compiled with Open SSL support
$rcmail_config['enable_spellcheck'] = TRUE;

// For a locally installed Nox Spell Server, please specify the URI to call it.
// Get Nox Spell Server from http://orangoo.com/labs/?page_id=72
// Leave empty to use the Google spell checking service, what means
// that the message content will be sent to Google in order to check spelling
$rcmail_config['spellcheck_uri'] = '';

// These languages can be selected for spell checking.
// Configure as a PHP style hash array: array('en'=>'English', 'de'=>'Deutsch');
// Leave empty for default set of Google spell check languages
$rcmail_config['spellcheck_languages'] = NULL;

// path to a text file which will be added to each sent message
// paths are relative to the RoundCube root folder
$rcmail_config['generic_message_footer'] = '';

// add a received header to outgoing mails containing the creators IP and hostname
$rcmail_config['http_received_header'] = false;

// this string is used as a delimiter for message headers when sending
// leave empty for auto-detection
$rcmail_config['mail_header_delimiter'] = NULL;

// session domain: .example.org
$rcmail_config['session_domain'] = '';

// This indicates which type of address book to use. Possible choises:
// 'sql' (default) and 'ldap'.
// If set to 'ldap' then it will look at using the first writable LDAP
// address book as the primary address book and it will not display the
// SQL address book in the 'Address Book' view.
$rcmail_config['address_book_type'] = 'sql';

// In order to enable public ldap search, configure an array like the Verisign
// example further below. if you would like to test, simply uncomment the example.
//
// If you are going to use LDAP for individual address books, you will need to 
// set 'user_specific' to true and use the variables to generate the appropriate DNs to access it.
//
// The recommended directory structure for LDAP is to store all the address book entries
// under the users main entry, e.g.:
//
//  o=root
//   ou=people
//    uid=user@domain
//	mail=contact@contactdomain
//	
// So the base_dn would be uid=%fu,ou=people,o=root
// The bind_dn would be the same as based_dn or some super user login.
/** 
 * example config for Verisign directory
 *
 * $rcmail_config['ldap_public']['Verisign'] = array(
 *  'name'          => 'Verisign.com',
 *  'hosts'         => array('directory.verisign.com'),
 *  'port'          => 389,
 *  'use_tls'	    => false,
 *  'user_specific' => false,   // If true the base_dn, bind_dn and bind_pass default to the user's IMAP login.
 *  // %fu - The full username provided, assumes the username is an email
 *  //       address, uses the username_domain value if not an email address.
 *  // %u  - The username prior to the '@'.
 *  // %d  - The domain name after the '@'.
 *  'base_dn'       => '',
 *  'bind_dn'       => '',
 *  'bind_pass'     => '',
 *  'writable'      => false,   // Indicates if we can write to the LDAP directory or not.
 *  // If writable is true then these fields need to be populated:
 *  // LDAP_Object_Classes, required_fields, LDAP_rdn
 *  'LDAP_Object_Classes' => array("top", "inetOrgPerson"), // To create a new contact these are the object classes to specify (or any other classes you wish to use).
 *  'required_fields'     => array("cn", "sn", "mail"),     // The required fields needed to build a new contact as required by the object classes (can include additional fields not required by the object classes).
 *  'LDAP_rdn'      => 'mail', // The RDN field that is used for new entries, this field needs to be one of the search_fields, the base of base_dn is appended to the RDN to insert into the LDAP directory.
 *  'ldap_version'  => 3,       // using LDAPv3
 *  'search_fields' => array('mail', 'cn'),  // fields to search in
 *  'name_field'    => 'cn',    // this field represents the contact's name
 *  'email_field'   => 'mail',  // this field represents the contact's e-mail
 *  'surname_field' => 'sn',    // this field represents the contact's last name
 *  'firstname_field' => 'gn',  // this field represents the contact's first name
 *  'sort'          => 'cn',    // The field to sort the listing by.
 *  'scope'         => 'sub',   // search mode: sub|base|list
 *  'filter'        => '',      // used for basic listing (if not empty) and will be &'d with search queries. example: status=act
 *  'global_search' => true,    // perform a global search for address auto-completion on compose
 *  'fuzzy_search'  => true);   // server allows wildcard search
 */

// don't allow these settings to be overriden by the user
$rcmail_config['dont_override'] = array();

// try to load host-specific configuration
// see http://trac.roundcube.net/wiki/Howto_Config for more details
$rcmail_config['include_host_config'] = false;

// don't let users set pagesize to more than this value if set
$rcmail_config['max_pagesize'] = 200;

// mime magic database
$rcmail_config['mime_magic'] = '/usr/share/misc/magic';

// default sort col
$rcmail_config['message_sort_col'] = 'date';

// default sort order
$rcmail_config['message_sort_order'] = 'DESC';

// THIS OPTION WILL ALLOW THE INSTALLER TO RUN AND CAN EXPOSE SENSITIVE CONFIG DATA.
// ONLY ENABLE IT IF YOU'RE REALLY SURE WHAT YOU'RE DOING!
$rcmail_config['enable_installer'] = false;

/***** these settings can be overwritten by user's preferences *****/

// show up to X items in list view
$rcmail_config['pagesize'] = 40;

// use this timezone to display date/time
$rcmail_config['timezone'] = intval(date('O'))/100 - date('I');

// is daylight saving On?
$rcmail_config['dst_active'] = (bool)date('I');

// prefer displaying HTML messages
$rcmail_config['prefer_html'] = TRUE;

// compose html formatted messages by default
$rcmail_config['htmleditor'] = FALSE;

// show pretty dates as standard
$rcmail_config['prettydate'] = TRUE;

// save compose message every 300 seconds (5min)
$rcmail_config['draft_autosave'] = 300;

// default setting if preview pane is enabled
$rcmail_config['preview_pane'] = FALSE;

// Clear Trash on logout
$rcmail_config['logout_purge'] = FALSE;

// Compact INBOX on logout
$rcmail_config['logout_expunge'] = FALSE;

/**
 * 'Delete always'
 * This setting reflects if mail should be always marked as deleted,
 * even if moving to "Trash" fails. This is necessary in some setups
 * because a) people may not have a Trash folder or b) they are over
 * quota (and Trash is included in the quota).
 *
 * This is a failover setting for iil_C_Move when a message is moved
 * to the Trash, and not the same as "delete_right_away".
 */
$rcmail_config['delete_always'] = false;

// Log successful logins
$rcmail_config['log_logins'] = false;

// end of config file
?>