-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.51a


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema eticket
--

CREATE DATABASE IF NOT EXISTS eticket;
USE eticket;

--
-- Definition of table `ticket_answers`
--

DROP TABLE IF EXISTS `ticket_answers`;
CREATE TABLE `ticket_answers` (
  `ID` int(7) NOT NULL auto_increment,
  `ticket` int(6) default '0',
  `message` text,
  `rep` int(5) NOT NULL default '0',
  `reference` int(7) default NULL,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID`),
  KEY `ticket` (`ticket`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_answers`
--

/*!40000 ALTER TABLE `ticket_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_answers` ENABLE KEYS */;


--
-- Definition of table `ticket_attachments`
--

DROP TABLE IF EXISTS `ticket_attachments`;
CREATE TABLE `ticket_attachments` (
  `ID` int(7) NOT NULL auto_increment,
  `ticket` int(6) NOT NULL default '0',
  `ref` int(7) NOT NULL default '0',
  `filename` varchar(100) NOT NULL default '',
  `type` varchar(15) NOT NULL default '',
  PRIMARY KEY  (`ID`),
  KEY `ticket` (`ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_attachments`
--

/*!40000 ALTER TABLE `ticket_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_attachments` ENABLE KEYS */;


--
-- Definition of table `ticket_banlist`
--

DROP TABLE IF EXISTS `ticket_banlist`;
CREATE TABLE `ticket_banlist` (
  `value_id` int(11) NOT NULL auto_increment,
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_banlist`
--

/*!40000 ALTER TABLE `ticket_banlist` DISABLE KEYS */;
INSERT INTO `ticket_banlist` (`value_id`,`value`) VALUES 
 (1,'[SPAM]');
/*!40000 ALTER TABLE `ticket_banlist` ENABLE KEYS */;


--
-- Definition of table `ticket_categories`
--

DROP TABLE IF EXISTS `ticket_categories`;
CREATE TABLE `ticket_categories` (
  `ID` int(5) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `pophost` varchar(200) NOT NULL default '',
  `popuser` varchar(200) NOT NULL default '',
  `poppass` varchar(200) NOT NULL default '',
  `email` varchar(200) NOT NULL default '',
  `signature` text NOT NULL,
  `hidden` int(1) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_categories`
--

/*!40000 ALTER TABLE `ticket_categories` DISABLE KEYS */;
INSERT INTO `ticket_categories` (`ID`,`name`,`pophost`,`popuser`,`poppass`,`email`,`signature`,`hidden`) VALUES 
 (1,'Support','','','','support@10.12.7.10','',0);
/*!40000 ALTER TABLE `ticket_categories` ENABLE KEYS */;


--
-- Definition of table `ticket_config`
--

DROP TABLE IF EXISTS `ticket_config`;
CREATE TABLE `ticket_config` (
  `accept_attachments` int(1) NOT NULL default '0',
  `answer_method` enum('pop3','automatic') NOT NULL default 'automatic',
  `attachment_size` int(10) NOT NULL default '1048576',
  `attachment_dir` varchar(255) NOT NULL default 'attachments',
  `attachment_url` varchar(255) NOT NULL default 'attachments',
  `search_disp` int(1) NOT NULL default '1',
  `umq` int(3) default '3',
  `save_headers` int(1) NOT NULL default '1',
  `time_format` varchar(255) NOT NULL default 'l, F j Y g:ia',
  `min_interval` int(20) default '0',
  `ticket_max` int(3) NOT NULL default '10',
  `remove_original` int(1) NOT NULL default '1',
  `remove_tag` varchar(255) NOT NULL default '--please do not reply below this line--',
  `ticket_response` int(1) NOT NULL default '1',
  `ticket_msg` text NOT NULL,
  `ticket_subj` varchar(255) NOT NULL default '',
  `limit_response` int(1) NOT NULL default '1',
  `limit_email` varchar(75) NOT NULL default '',
  `limit_subj` varchar(255) NOT NULL default '',
  `limit_msg` text NOT NULL,
  `alert_new` int(1) NOT NULL default '1',
  `alert_email` varchar(255) NOT NULL default '',
  `alert_user` varchar(255) NOT NULL default '',
  `alert_subj` varchar(255) NOT NULL default '',
  `alert_msg` text,
  `message_response` int(1) NOT NULL default '1',
  `message_subj` varchar(255) NOT NULL default '',
  `message_msg` text NOT NULL,
  `trans_response` int(1) NOT NULL default '1',
  `trans_subj` varchar(255) NOT NULL default '',
  `trans_msg` varchar(255) NOT NULL default '',
  `timezone` varchar(255) NOT NULL default '',
  `tickets_per_page` int(3) NOT NULL default '10',
  `root_url` varchar(255) NOT NULL default '',
  `filetypes` text NOT NULL,
  FULLTEXT KEY `message_subj` (`message_subj`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_config`
--

/*!40000 ALTER TABLE `ticket_config` DISABLE KEYS */;
INSERT INTO `ticket_config` (`accept_attachments`,`answer_method`,`attachment_size`,`attachment_dir`,`attachment_url`,`search_disp`,`umq`,`save_headers`,`time_format`,`min_interval`,`ticket_max`,`remove_original`,`remove_tag`,`ticket_response`,`ticket_msg`,`ticket_subj`,`limit_response`,`limit_email`,`limit_subj`,`limit_msg`,`alert_new`,`alert_email`,`alert_user`,`alert_subj`,`alert_msg`,`message_response`,`message_subj`,`message_msg`,`trans_response`,`trans_subj`,`trans_msg`,`timezone`,`tickets_per_page`,`root_url`,`filetypes`) VALUES 
 (0,'automatic',1048576,'F:\\sistema\\APACHE\\ssolution\\suporte\\attachments\\','attachments.php',1,5,1,'l, F j Y g:ia',60,10,1,'--please do not reply below this line--',1,'A support ticket has been created (#%ticket) and a representative will get back to you shortly.\r\n\r\nYou can view this ticket progress online here: %url/view.php?e=%email&t=%ticket\r\n\r\nNOTE: If you wish to send additional information regarding this ticket, please do not send another email. Instead, reply to this ticket.','[#%ticket] Support Ticket Opened',1,'noreply@smartsolution.com.br','Support Ticket Denied','Ticket was not created for the email sent to %local_email from %user_email because there is a limit of %ticket_max open tickets per email address at any one time.\r\n\r\nTo be able to open another ticket, you must close one of your previous tickets first here:\r\n%url/view.php',1,'noreply@smartsolution.com.br','admin@10.12.7.10','[#%ticket] New Message Alert','There is a new message for ticket %ticket\n\nFrom: %email\n\n%url/admin.php?a=view&id=%ticket',1,'[#%ticket] Message Added','Your reply to support ticket #%ticket has been noted.\r\n\r\nYou can view this ticket progress online here: %url/view.php?e=%email&t=%ticket',1,'[#%ticket] Department Transfer','Your ticket was transferred to the %cat_name department for further review.\n\n%trans_msg','0',10,'http://10.12.7.10/ssolution/suporte','.jpg;.gif;.png;.pdf;.xls;.txt;.doc;.eml;.zip;.mp3;');
/*!40000 ALTER TABLE `ticket_config` ENABLE KEYS */;


--
-- Definition of table `ticket_groups`
--

DROP TABLE IF EXISTS `ticket_groups`;
CREATE TABLE `ticket_groups` (
  `ID` int(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `pref` int(1) NOT NULL default '0',
  `mail` int(1) NOT NULL default '0',
  `cat` int(1) NOT NULL default '0',
  `rep` int(1) NOT NULL default '0',
  `user_group` int(1) NOT NULL default '0',
  `banlist` int(1) NOT NULL default '0',
  `cat_access` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_groups`
--

/*!40000 ALTER TABLE `ticket_groups` DISABLE KEYS */;
INSERT INTO `ticket_groups` (`ID`,`name`,`pref`,`mail`,`cat`,`rep`,`user_group`,`banlist`,`cat_access`) VALUES 
 (1,'Administrator',1,1,1,1,1,1,'all');
/*!40000 ALTER TABLE `ticket_groups` ENABLE KEYS */;


--
-- Definition of table `ticket_messages`
--

DROP TABLE IF EXISTS `ticket_messages`;
CREATE TABLE `ticket_messages` (
  `ID` int(7) NOT NULL auto_increment,
  `ticket` int(6) NOT NULL default '0',
  `message` text,
  `headers` text,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID`),
  KEY `ticket` (`ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_messages`
--

/*!40000 ALTER TABLE `ticket_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_messages` ENABLE KEYS */;


--
-- Definition of table `ticket_privmsg`
--

DROP TABLE IF EXISTS `ticket_privmsg`;
CREATE TABLE `ticket_privmsg` (
  `ID` int(10) NOT NULL auto_increment,
  `rep` int(10) NOT NULL default '0',
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `ticket` int(6) NOT NULL default '0',
  `attachment` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`ID`),
  KEY `ticket` (`ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_privmsg`
--

/*!40000 ALTER TABLE `ticket_privmsg` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_privmsg` ENABLE KEYS */;


--
-- Definition of table `ticket_reps`
--

DROP TABLE IF EXISTS `ticket_reps`;
CREATE TABLE `ticket_reps` (
  `ID` int(5) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `username` varchar(50) NOT NULL default '',
  `password` varchar(255) default NULL,
  `signature` text NOT NULL,
  `user_group` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_reps`
--

/*!40000 ALTER TABLE `ticket_reps` DISABLE KEYS */;
INSERT INTO `ticket_reps` (`ID`,`name`,`email`,`username`,`password`,`signature`,`user_group`) VALUES 
 (1,'admin name','admin@10.12.7.10','admin','cdde1233ebe9256e4a4d88ee17b88fc6','','1');
/*!40000 ALTER TABLE `ticket_reps` ENABLE KEYS */;


--
-- Definition of table `ticket_settings`
--

DROP TABLE IF EXISTS `ticket_settings`;
CREATE TABLE `ticket_settings` (
  `ID` int(5) NOT NULL auto_increment,
  `group` varchar(255) default NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `GROUP` (`group`),
  KEY `VALUE` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_settings`
--

/*!40000 ALTER TABLE `ticket_settings` DISABLE KEYS */;
INSERT INTO `ticket_settings` (`ID`,`group`,`key`,`value`) VALUES 
 (1,'','theme','eticket'),
 (2,'','charset','UTF-8'),
 (3,'','presig','\n\n--\n'),
 (4,'','short_date_format','d/m/Y'),
 (5,'','default_search_days','30'),
 (6,'','pop3_automail','automail.php'),
 (7,'','answer_subj','[#%ticket] %subject'),
 (8,'','answer_msg','%answer'),
 (9,'pri','0','1'),
 (10,'pri','1','2'),
 (11,'pri','2','3'),
 (12,'pri_text','0','Low'),
 (13,'pri_text','1','Normal'),
 (14,'pri_text','2','High'),
 (15,'pri_style','0','class=\"priLow\"'),
 (16,'pri_style','1','class=\"priNormal\"'),
 (17,'pri_style','2','class=\"priHigh\"'),
 (18,'','rep_trans_response','1'),
 (19,'','rep_trans_subj','[#%ticket] Representative Transfer'),
 (20,'','rep_trans_msg','Ticket %ticket was transferred to representative %rep_name.'),
 (21,'answers','Intro','Hi there,\n\n Thanks for your email.\n'),
 (22,'answers','Sponsorship','Hi there,\n\nWe are not offering sponsorship right now, please try again at a later date.\n'),
 (23,'answers','Festive','Hi there,\n\nWe apologise for the delay over the festive period.\n\nService has now been restored to normal, and we hope to complete any over-due issues asap.\n\nThanks for understanding.\n'),
 (24,'answers','MoreDetails','Thanks for your email,\n\nSo we can take this further, please can you provide us with further details such as your order id, username, domain name, and any other appropriate details.\n\nThanks.'),
 (25,'','site_title','Example Helpdesk'),
 (26,'','nosubject','[No Subject]'),
 (27,'','ticket_format','\\[#([0-9]{6})\\]'),
 (28,'','subject_re','Re|Antw'),
 (29,'','spamword','[SPAM]'),
 (30,'','flood_msg_rate','10'),
 (31,'','ANTISPAM_MAGICWORD','ANTI_SPAM_MAGICWORD'),
 (32,'','ANTISPAM_SUBJECT','Ticked Rejected: Mail detected as SPAM'),
 (33,'','ANTISPAM_MSG','Your email was detected as spam and has been rejected. If your email was not spam, please re-send your email, including the word \"{MAGICWORD}\" in the body of the email.'),
 (34,'','ANTISPAM_EMAIL','noreply@smartsolution.com.br'),
 (35,'','spamassassin_enable','1');
/*!40000 ALTER TABLE `ticket_settings` ENABLE KEYS */;


--
-- Definition of table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `subject` varchar(255) default NULL,
  `name` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `phone` varchar(20) default NULL,
  `status` enum('open','closed') NOT NULL default 'open',
  `ID` int(6) NOT NULL default '0',
  `cat` int(5) NOT NULL default '0',
  `rep` int(5) default '0',
  `priority` tinyint(1) NOT NULL default '2',
  `ip` varchar(255) NOT NULL default '',
  `trans_msg` varchar(255) NOT NULL default '',
  `timestamp` datetime NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;

--
-- Create schema osticket
--

CREATE DATABASE IF NOT EXISTS osticket;
USE osticket;

--
-- Definition of table `ost_config`
--

DROP TABLE IF EXISTS `ost_config`;
CREATE TABLE `ost_config` (
  `id` tinyint(1) unsigned NOT NULL auto_increment,
  `isonline` tinyint(1) unsigned NOT NULL default '0',
  `timezone_offset` float(3,1) NOT NULL default '0.0',
  `enable_daylight_saving` tinyint(1) unsigned NOT NULL default '0',
  `staff_session_timeout` int(10) unsigned NOT NULL default '30',
  `client_session_timeout` int(10) unsigned NOT NULL default '30',
  `max_page_size` tinyint(3) unsigned NOT NULL default '25',
  `max_open_tickets` tinyint(3) unsigned NOT NULL default '0',
  `max_file_size` int(11) unsigned NOT NULL default '1048576',
  `autolock_minutes` tinyint(3) unsigned NOT NULL default '3',
  `overdue_grace_period` int(10) unsigned NOT NULL default '0',
  `default_email` tinyint(4) unsigned NOT NULL default '0',
  `default_dept` tinyint(3) unsigned NOT NULL default '0',
  `default_priority` tinyint(2) unsigned NOT NULL default '2',
  `default_template` tinyint(4) unsigned NOT NULL default '1',
  `clickable_urls` tinyint(1) unsigned NOT NULL default '1',
  `allow_priority_change` tinyint(1) unsigned NOT NULL default '0',
  `use_email_priority` tinyint(1) unsigned NOT NULL default '0',
  `enable_auto_cron` tinyint(1) unsigned NOT NULL default '0',
  `enable_pop3_fetch` tinyint(1) unsigned NOT NULL default '0',
  `enable_email_piping` tinyint(1) unsigned NOT NULL default '0',
  `send_sql_errors` tinyint(1) unsigned NOT NULL default '1',
  `send_mailparse_errors` tinyint(1) unsigned NOT NULL default '1',
  `send_login_errors` tinyint(1) unsigned NOT NULL default '1',
  `save_email_headers` tinyint(1) unsigned NOT NULL default '1',
  `strip_quoted_reply` tinyint(1) unsigned NOT NULL default '1',
  `ticket_autoresponder` tinyint(1) unsigned NOT NULL default '0',
  `message_autoresponder` tinyint(1) unsigned NOT NULL default '0',
  `ticket_alert_active` tinyint(1) unsigned NOT NULL default '0',
  `ticket_alert_admin` tinyint(1) unsigned NOT NULL default '1',
  `ticket_alert_dept_manager` tinyint(1) unsigned NOT NULL default '1',
  `ticket_alert_dept_members` tinyint(1) unsigned NOT NULL default '0',
  `message_alert_active` tinyint(1) unsigned NOT NULL default '0',
  `message_alert_laststaff` tinyint(1) unsigned NOT NULL default '1',
  `message_alert_assigned` tinyint(1) unsigned NOT NULL default '1',
  `message_alert_dept_manager` tinyint(1) unsigned NOT NULL default '0',
  `overdue_alert_active` tinyint(1) unsigned NOT NULL default '0',
  `overdue_alert_assigned` tinyint(1) unsigned NOT NULL default '1',
  `overdue_alert_dept_manager` tinyint(1) unsigned NOT NULL default '1',
  `overdue_alert_dept_members` tinyint(1) unsigned NOT NULL default '0',
  `auto_assign_reopened_tickets` tinyint(1) unsigned NOT NULL default '0',
  `show_assigned_tickets` tinyint(1) unsigned NOT NULL default '0',
  `overlimit_notice_active` tinyint(1) unsigned NOT NULL default '0',
  `email_attachments` tinyint(1) unsigned NOT NULL default '1',
  `allow_attachments` tinyint(1) unsigned NOT NULL default '0',
  `allow_email_attachments` tinyint(1) unsigned NOT NULL default '0',
  `allow_online_attachments` tinyint(1) unsigned NOT NULL default '0',
  `allow_online_attachments_onlogin` tinyint(1) unsigned NOT NULL default '0',
  `random_ticket_ids` tinyint(1) unsigned NOT NULL default '1',
  `upload_dir` varchar(255) NOT NULL default '',
  `allowed_filetypes` varchar(255) NOT NULL default '.doc, .pdf',
  `time_format` varchar(32) NOT NULL default ' h:i A',
  `date_format` varchar(32) NOT NULL default 'm/d/Y',
  `datetime_format` varchar(60) NOT NULL default 'm/d/Y g:i a',
  `daydatetime_format` varchar(60) NOT NULL default 'D, M j Y g:ia',
  `reply_separator` varchar(60) NOT NULL default ' -- do not edit --',
  `noreply_email` varchar(125) NOT NULL default '',
  `alert_email` varchar(125) NOT NULL default '',
  `admin_email` varchar(125) NOT NULL default '',
  `helpdesk_title` varchar(255) NOT NULL default 'osTicket Support Ticket System',
  `helpdesk_url` varchar(255) NOT NULL default '',
  `api_whitelist` tinytext,
  `api_key` varchar(125) NOT NULL default '',
  `ostversion` varchar(16) NOT NULL default '',
  `updated` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `isoffline` (`isonline`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ost_config`
--

/*!40000 ALTER TABLE `ost_config` DISABLE KEYS */;
INSERT INTO `ost_config` (`id`,`isonline`,`timezone_offset`,`enable_daylight_saving`,`staff_session_timeout`,`client_session_timeout`,`max_page_size`,`max_open_tickets`,`max_file_size`,`autolock_minutes`,`overdue_grace_period`,`default_email`,`default_dept`,`default_priority`,`default_template`,`clickable_urls`,`allow_priority_change`,`use_email_priority`,`enable_auto_cron`,`enable_pop3_fetch`,`enable_email_piping`,`send_sql_errors`,`send_mailparse_errors`,`send_login_errors`,`save_email_headers`,`strip_quoted_reply`,`ticket_autoresponder`,`message_autoresponder`,`ticket_alert_active`,`ticket_alert_admin`,`ticket_alert_dept_manager`,`ticket_alert_dept_members`,`message_alert_active`,`message_alert_laststaff`,`message_alert_assigned`,`message_alert_dept_manager`,`overdue_alert_active`,`overdue_alert_assigned`,`overdue_alert_dept_manager`,`overdue_alert_dept_members`,`auto_assign_reopened_tickets`,`show_assigned_tickets`,`overlimit_notice_active`,`email_attachments`,`allow_attachments`,`allow_email_attachments`,`allow_online_attachments`,`allow_online_attachments_onlogin`,`random_ticket_ids`,`upload_dir`,`allowed_filetypes`,`time_format`,`date_format`,`datetime_format`,`daydatetime_format`,`reply_separator`,`noreply_email`,`alert_email`,`admin_email`,`helpdesk_title`,`helpdesk_url`,`api_whitelist`,`api_key`,`ostversion`,`updated`) VALUES 
 (1,1,-3.0,0,30,30,25,0,1048576,3,0,1,1,2,1,1,0,0,0,0,0,1,1,1,1,1,0,0,0,1,1,0,0,1,1,0,0,1,1,0,0,0,0,0,0,0,0,0,1,'','.doc, .pdf',' h:i A','d/m/Y','d/m/Y g:i a','D, j M Y g:ia',' -- do not edit --','noreply@smartsolution.com.br','alerts@smartsolution.com.br','smart@smartsolution.com.br','Smart Solution - Painel de Suporte','http://10.12.7.10/ssolution/osticket/',NULL,'','1.6 RC4','2008-03-21 15:24:25');
/*!40000 ALTER TABLE `ost_config` ENABLE KEYS */;


--
-- Definition of table `ost_department`
--

DROP TABLE IF EXISTS `ost_department`;
CREATE TABLE `ost_department` (
  `dept_id` int(11) unsigned NOT NULL auto_increment,
  `email_id` int(10) unsigned NOT NULL default '0',
  `manager_id` int(10) unsigned NOT NULL default '0',
  `dept_name` varchar(32) NOT NULL default '',
  `dept_signature` varchar(255) NOT NULL default '',
  `ispublic` tinyint(1) unsigned NOT NULL default '1',
  `noreply_autoresp` tinyint(1) unsigned NOT NULL default '1',
  `ticket_auto_response` tinyint(1) NOT NULL default '1',
  `message_auto_response` tinyint(1) NOT NULL default '0',
  `can_append_signature` tinyint(1) NOT NULL default '1',
  `updated` datetime NOT NULL default '0000-00-00 00:00:00',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`dept_id`),
  UNIQUE KEY `dept_name` (`dept_name`),
  KEY `manager_id` (`manager_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ost_department`
--

/*!40000 ALTER TABLE `ost_department` DISABLE KEYS */;
INSERT INTO `ost_department` (`dept_id`,`email_id`,`manager_id`,`dept_name`,`dept_signature`,`ispublic`,`noreply_autoresp`,`ticket_auto_response`,`message_auto_response`,`can_append_signature`,`updated`,`created`) VALUES 
 (1,1,1,'Suporte','Depto de Suporte',1,1,1,1,1,'2008-03-21 15:29:51','2008-03-21 15:24:25'),
 (2,2,0,'Financeiro','Smart Solution TI\r\nDepartamento Financeiro',1,0,1,1,0,'2008-03-21 15:48:37','2008-03-21 15:32:02');
/*!40000 ALTER TABLE `ost_department` ENABLE KEYS */;


--
-- Definition of table `ost_email`
--

DROP TABLE IF EXISTS `ost_email`;
CREATE TABLE `ost_email` (
  `email_id` int(11) unsigned NOT NULL auto_increment,
  `noautoresp` tinyint(1) unsigned NOT NULL default '0',
  `priority_id` tinyint(3) unsigned NOT NULL default '0',
  `dept_id` tinyint(3) unsigned NOT NULL default '0',
  `email` varchar(125) NOT NULL default '',
  `name` varchar(32) NOT NULL default '',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`email_id`),
  UNIQUE KEY `email` (`email`),
  KEY `priority_id` (`priority_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ost_email`
--

/*!40000 ALTER TABLE `ost_email` DISABLE KEYS */;
INSERT INTO `ost_email` (`email_id`,`noautoresp`,`priority_id`,`dept_id`,`email`,`name`,`created`,`updated`) VALUES 
 (1,0,2,1,'suporte@smartsolution.com.br','Smart Solution TI - Suporte','2008-03-21 15:24:26','2008-03-21 15:33:15'),
 (2,0,2,2,'financeiro@smartsolution.com.br','Smart Solution TI - Financeiro','2008-03-21 15:32:51','2008-03-21 15:32:51');
/*!40000 ALTER TABLE `ost_email` ENABLE KEYS */;


--
-- Definition of table `ost_email_banlist`
--

DROP TABLE IF EXISTS `ost_email_banlist`;
CREATE TABLE `ost_email_banlist` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(255) NOT NULL default '',
  `submitter` varchar(126) NOT NULL default '',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ost_email_banlist`
--

/*!40000 ALTER TABLE `ost_email_banlist` DISABLE KEYS */;
INSERT INTO `ost_email_banlist` (`id`,`email`,`submitter`,`added`) VALUES 
 (1,'test@example.com','System','2008-03-21 15:24:26');
/*!40000 ALTER TABLE `ost_email_banlist` ENABLE KEYS */;


--
-- Definition of table `ost_email_pop3`
--

DROP TABLE IF EXISTS `ost_email_pop3`;
CREATE TABLE `ost_email_pop3` (
  `email_id` int(10) unsigned NOT NULL default '0',
  `popenabled` tinyint(1) NOT NULL default '0',
  `pophost` varchar(125) NOT NULL default '',
  `popuser` varchar(125) NOT NULL default '',
  `poppasswd` varchar(125) NOT NULL default '',
  `delete_msgs` tinyint(1) unsigned NOT NULL default '0',
  `fetchfreq` int(3) unsigned NOT NULL default '5',
  `errors` tinyint(3) unsigned NOT NULL default '0',
  `lasterror` datetime NOT NULL default '0000-00-00 00:00:00',
  `lastfetch` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`email_id`),
  KEY `consec_errors` (`errors`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ost_email_pop3`
--

/*!40000 ALTER TABLE `ost_email_pop3` DISABLE KEYS */;
INSERT INTO `ost_email_pop3` (`email_id`,`popenabled`,`pophost`,`popuser`,`poppasswd`,`delete_msgs`,`fetchfreq`,`errors`,`lasterror`,`lastfetch`) VALUES 
 (2,0,'','','',0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
 (1,0,'','','',0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ost_email_pop3` ENABLE KEYS */;


--
-- Definition of table `ost_email_template`
--

DROP TABLE IF EXISTS `ost_email_template`;
CREATE TABLE `ost_email_template` (
  `tpl_id` int(11) NOT NULL auto_increment,
  `cfg_id` int(10) unsigned NOT NULL default '0',
  `name` varchar(32) NOT NULL default '',
  `ticket_autoresp_subj` varchar(255) NOT NULL default '',
  `ticket_autoresp_body` text NOT NULL,
  `ticket_alert_subj` varchar(255) NOT NULL default '',
  `ticket_alert_body` text NOT NULL,
  `message_autoresp_subj` varchar(255) NOT NULL default '',
  `message_autoresp_body` text NOT NULL,
  `message_alert_subj` varchar(255) NOT NULL default '',
  `message_alert_body` text NOT NULL,
  `assigned_alert_subj` varchar(255) NOT NULL default '',
  `assigned_alert_body` text NOT NULL,
  `ticket_overdue_subj` varchar(255) NOT NULL default '',
  `ticket_overdue_body` text NOT NULL,
  `ticket_overlimit_subj` varchar(255) NOT NULL default '',
  `ticket_overlimit_body` text NOT NULL,
  `ticket_reply_subj` varchar(255) NOT NULL default '',
  `ticket_reply_body` text NOT NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`tpl_id`),
  KEY `cfg_id` (`cfg_id`),
  FULLTEXT KEY `message_subj` (`ticket_reply_subj`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ost_email_template`
--

/*!40000 ALTER TABLE `ost_email_template` DISABLE KEYS */;
INSERT INTO `ost_email_template` (`tpl_id`,`cfg_id`,`name`,`ticket_autoresp_subj`,`ticket_autoresp_body`,`ticket_alert_subj`,`ticket_alert_body`,`message_autoresp_subj`,`message_autoresp_body`,`message_alert_subj`,`message_alert_body`,`assigned_alert_subj`,`assigned_alert_body`,`ticket_overdue_subj`,`ticket_overdue_body`,`ticket_overlimit_subj`,`ticket_overlimit_body`,`ticket_reply_subj`,`ticket_reply_body`,`created`,`updated`) VALUES 
 (1,1,'osTicket Default Template','Support Ticket Opened [#%ticket]','%name,\r\n\r\nA request for support has been created and assigned ticket #%ticket. A representative will follow-up with you as soon as possible.\r\n\r\nYou can view this ticket\'s progress online here: %url/view.php?e=%email&t=%ticket.\r\n\r\nIf you wish to send additional comments or information regarding this issue, please don\'t open a new ticket. Simply login using the link above and update the ticket.\r\n\r\n%signature','New Ticket Alert','%staff,\r\n\r\nNew ticket #%ticket created.\r\n-------------------\r\nName: %name\r\nEmail: %email\r\nDept: %dept\r\n\r\n%message\r\n-------------------\r\n\r\nTo view/respond to the ticket, please login to the support ticket system.\r\n\r\nYour friendly,\r\n\r\nCustomer Support  System powered by osTicket.','[#%ticket] Message Added','%name,\r\n\r\nYour reply to support request #%ticket has been noted.\r\n\r\nYou can view this support request progress online here: %url/view.php?e=%email&t=%ticket.\r\n\r\n%signature','New Message Alert','%staff,\r\n\r\nNew message appended to ticket #%ticket\r\n\r\n----------------------\r\nName: %name\r\nEmail: %email\r\nDept: %dept\r\n\r\n%message\r\n-------------------\r\n\r\nTo view/respond to the ticket, please login to the support ticket system.\r\n\r\nYour friendly,\r\n\r\nCustomer Support System - powered by osTicket.','Ticket #%ticket Assigned to you','%assignee,\r\n\r\n%assigner has assigned ticket #%ticket to you!\r\n\r\n%message\r\n\r\nTo view complete details, simply login to the support system.\r\n\r\nYour friendly,\r\n\r\nSupport Ticket System - powered by osTicket.','Stale Ticket Alert','%staff,\r\n\r\nA ticket #%ticket assigned to you or in your department is seriously overdue.\r\n\r\n%url/scp/tickets.php?id=%ticket\r\n\r\nWe should all try to guarantee that all tickets are being addressed in a timely manner. Enough baby talk...please address the issue or you will hear from me again.\r\n\r\n\r\nYour friendly,\r\n\r\nSupport Ticket System - powered by osTicket.','Support Ticket Denied','%name\r\n\r\nNo support ticket created. You\'ve exceeded maximum open tickets allowed.\r\n\r\nThis is a temporary block. To be able to open another ticket, one of your pending tickets must be closed. To update or add comments to an open ticket simply login using the link below.\r\n\r\n%url/view.php?e=%email\r\n\r\nThank you.\r\n\r\nSupport Ticket System','[#%ticket] %subject','%name,\r\n\r\nOur customer support team personnel has replied to your support request #%ticket \r\n\r\n%message\r\n\r\nWe hope this response has sufficiently answered your questions. If not, please do not send another email. Instead, reply to this email or login to your account for a complete archive of all your support request and responses.\r\n\r\n%url/view.php?e=%email&t=%ticket\r\n\r\n%signature','2008-03-21 15:24:26','2008-03-21 15:24:26');
/*!40000 ALTER TABLE `ost_email_template` ENABLE KEYS */;


--
-- Definition of table `ost_groups`
--

DROP TABLE IF EXISTS `ost_groups`;
CREATE TABLE `ost_groups` (
  `group_id` int(10) unsigned NOT NULL auto_increment,
  `group_enabled` tinyint(1) unsigned NOT NULL default '1',
  `group_name` varchar(50) NOT NULL default '',
  `dept_access` varchar(255) NOT NULL default '',
  `can_delete_tickets` tinyint(1) unsigned NOT NULL default '0',
  `can_close_tickets` tinyint(1) unsigned NOT NULL default '0',
  `can_transfer_tickets` tinyint(1) NOT NULL default '1',
  `can_ban_emails` tinyint(1) unsigned NOT NULL default '0',
  `can_manage_kb` tinyint(1) unsigned NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`group_id`),
  KEY `group_active` (`group_enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ost_groups`
--

/*!40000 ALTER TABLE `ost_groups` DISABLE KEYS */;
INSERT INTO `ost_groups` (`group_id`,`group_enabled`,`group_name`,`dept_access`,`can_delete_tickets`,`can_close_tickets`,`can_transfer_tickets`,`can_ban_emails`,`can_manage_kb`,`created`,`updated`) VALUES 
 (1,1,'Admins','1',1,1,1,1,1,'2008-03-21 15:24:26','2008-03-21 15:24:26'),
 (2,1,'Managers','1',1,1,1,1,1,'2008-03-21 15:24:26','2008-03-21 15:24:26'),
 (3,1,'Staff','1',0,0,0,0,0,'2008-03-21 15:24:26','2008-03-21 15:24:26');
/*!40000 ALTER TABLE `ost_groups` ENABLE KEYS */;


--
-- Definition of table `ost_help_topic`
--

DROP TABLE IF EXISTS `ost_help_topic`;
CREATE TABLE `ost_help_topic` (
  `topic_id` int(11) unsigned NOT NULL auto_increment,
  `isactive` tinyint(1) unsigned NOT NULL default '1',
  `noautoresp` tinyint(3) unsigned NOT NULL default '0',
  `priority_id` tinyint(3) unsigned NOT NULL default '0',
  `dept_id` tinyint(3) unsigned NOT NULL default '0',
  `topic` varchar(32) NOT NULL default '',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`topic_id`),
  UNIQUE KEY `topic` (`topic`),
  KEY `priority_id` (`priority_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ost_help_topic`
--

/*!40000 ALTER TABLE `ost_help_topic` DISABLE KEYS */;
INSERT INTO `ost_help_topic` (`topic_id`,`isactive`,`noautoresp`,`priority_id`,`dept_id`,`topic`,`created`,`updated`) VALUES 
 (1,1,0,2,1,'Support','2008-03-21 15:24:26','2008-03-21 15:24:26'),
 (2,1,0,3,1,'Billing','2008-03-21 15:24:26','2008-03-21 15:24:26');
/*!40000 ALTER TABLE `ost_help_topic` ENABLE KEYS */;


--
-- Definition of table `ost_kb_premade`
--

DROP TABLE IF EXISTS `ost_kb_premade`;
CREATE TABLE `ost_kb_premade` (
  `premade_id` int(10) unsigned NOT NULL auto_increment,
  `dept_id` int(10) unsigned NOT NULL default '0',
  `isenabled` tinyint(1) unsigned NOT NULL default '1',
  `title` varchar(125) NOT NULL default '',
  `answer` text NOT NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`premade_id`),
  UNIQUE KEY `title_2` (`title`),
  KEY `dept_id` (`dept_id`),
  KEY `active` (`isenabled`),
  FULLTEXT KEY `title` (`title`,`answer`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ost_kb_premade`
--

/*!40000 ALTER TABLE `ost_kb_premade` DISABLE KEYS */;
INSERT INTO `ost_kb_premade` (`premade_id`,`dept_id`,`isenabled`,`title`,`answer`,`created`,`updated`) VALUES 
 (1,0,1,'What is osTicket (sample)?','osTicket is a support ticket system.','2008-03-21 15:24:26','2008-03-21 15:24:26');
/*!40000 ALTER TABLE `ost_kb_premade` ENABLE KEYS */;


--
-- Definition of table `ost_staff`
--

DROP TABLE IF EXISTS `ost_staff`;
CREATE TABLE `ost_staff` (
  `staff_id` int(11) unsigned NOT NULL auto_increment,
  `group_id` int(10) unsigned NOT NULL default '0',
  `dept_id` int(10) unsigned NOT NULL default '0',
  `username` varchar(32) NOT NULL default '',
  `firstname` varchar(32) default NULL,
  `lastname` varchar(32) default NULL,
  `passwd` varchar(128) default NULL,
  `email` varchar(128) default NULL,
  `phone` varchar(24) NOT NULL default '',
  `phone_ext` varchar(6) default NULL,
  `mobile` varchar(24) NOT NULL default '',
  `signature` varchar(255) NOT NULL default '',
  `isactive` tinyint(1) NOT NULL default '1',
  `isadmin` tinyint(1) NOT NULL default '0',
  `isvisible` tinyint(1) unsigned NOT NULL default '1',
  `onvacation` tinyint(1) unsigned NOT NULL default '0',
  `daylight_saving` tinyint(1) unsigned NOT NULL default '0',
  `append_signature` tinyint(1) unsigned NOT NULL default '0',
  `change_passwd` tinyint(1) unsigned NOT NULL default '0',
  `timezone_offset` float(3,1) NOT NULL default '0.0',
  `max_page_size` int(11) NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `lastlogin` datetime default NULL,
  `updated` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`staff_id`),
  UNIQUE KEY `username` (`username`),
  KEY `dept_id` (`dept_id`),
  KEY `issuperuser` (`isadmin`),
  KEY `group_id` (`group_id`,`staff_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ost_staff`
--

/*!40000 ALTER TABLE `ost_staff` DISABLE KEYS */;
INSERT INTO `ost_staff` (`staff_id`,`group_id`,`dept_id`,`username`,`firstname`,`lastname`,`passwd`,`email`,`phone`,`phone_ext`,`mobile`,`signature`,`isactive`,`isadmin`,`isvisible`,`onvacation`,`daylight_saving`,`append_signature`,`change_passwd`,`timezone_offset`,`max_page_size`,`created`,`lastlogin`,`updated`) VALUES 
 (1,1,1,'smart',NULL,'Admin','cdde1233ebe9256e4a4d88ee17b88fc6','smart@smartsolution.com.br','',NULL,'','',1,1,1,0,0,0,0,-3.0,0,'2008-03-21 15:24:26','2008-03-21 16:33:21','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ost_staff` ENABLE KEYS */;


--
-- Definition of table `ost_ticket`
--

DROP TABLE IF EXISTS `ost_ticket`;
CREATE TABLE `ost_ticket` (
  `ticket_id` int(11) unsigned NOT NULL auto_increment,
  `ticketID` int(11) unsigned NOT NULL default '0',
  `dept_id` int(10) unsigned NOT NULL default '1',
  `priority_id` int(10) unsigned NOT NULL default '2',
  `staff_id` int(10) unsigned NOT NULL default '0',
  `email` varchar(120) NOT NULL default '',
  `name` varchar(32) NOT NULL default '',
  `subject` varchar(64) NOT NULL default '[no subject]',
  `phone` varchar(16) default NULL,
  `ip_address` varchar(16) NOT NULL default '',
  `status` enum('open','closed') NOT NULL default 'open',
  `source` enum('Web','Email','Phone') default NULL,
  `isoverdue` tinyint(1) unsigned NOT NULL default '0',
  `reopened` datetime default NULL,
  `closed` datetime default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`ticket_id`),
  UNIQUE KEY `email_extid` (`ticketID`,`email`),
  KEY `dept_id` (`dept_id`),
  KEY `staff_id` (`staff_id`),
  KEY `status` (`status`),
  KEY `priority_id` (`priority_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ost_ticket`
--

/*!40000 ALTER TABLE `ost_ticket` DISABLE KEYS */;
INSERT INTO `ost_ticket` (`ticket_id`,`ticketID`,`dept_id`,`priority_id`,`staff_id`,`email`,`name`,`subject`,`phone`,`ip_address`,`status`,`source`,`isoverdue`,`reopened`,`closed`,`created`,`updated`) VALUES 
 (1,995990,1,2,0,'support@osticket.com','osTicket Support','osTicket Installed!',NULL,'','open','Web',0,NULL,NULL,'2008-03-21 15:24:26','0000-00-00 00:00:00'),
 (2,518452,1,2,0,'sergiohcosta@gmail.com','mcxvg kfdkgdlkg j','allalaa alkja','30763419','10.12.7.13','open','Web',0,NULL,NULL,'2008-03-21 15:49:56','0000-00-00 00:00:00'),
 (3,386422,1,2,0,'sergiohcosta@gmail.com','mcxvg kfdkgdlkg j','allalaa alkja','30763419','10.12.7.13','open','Web',0,NULL,NULL,'2008-03-21 15:50:25','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ost_ticket` ENABLE KEYS */;


--
-- Definition of table `ost_ticket_attachment`
--

DROP TABLE IF EXISTS `ost_ticket_attachment`;
CREATE TABLE `ost_ticket_attachment` (
  `attach_id` int(11) unsigned NOT NULL auto_increment,
  `ticket_id` int(11) unsigned NOT NULL default '0',
  `ref_id` int(11) unsigned NOT NULL default '0',
  `ref_type` enum('M','R') NOT NULL default 'M',
  `file_size` varchar(32) NOT NULL default '',
  `file_name` varchar(128) NOT NULL default '',
  `file_key` varchar(128) NOT NULL default '',
  `deleted` tinyint(1) unsigned NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated` datetime default NULL,
  PRIMARY KEY  (`attach_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `ref_type` (`ref_type`),
  KEY `ref_id` (`ref_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ost_ticket_attachment`
--

/*!40000 ALTER TABLE `ost_ticket_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_ticket_attachment` ENABLE KEYS */;


--
-- Definition of table `ost_ticket_lock`
--

DROP TABLE IF EXISTS `ost_ticket_lock`;
CREATE TABLE `ost_ticket_lock` (
  `lock_id` int(11) unsigned NOT NULL auto_increment,
  `ticket_id` int(11) unsigned NOT NULL default '0',
  `staff_id` int(10) unsigned NOT NULL default '0',
  `expire` datetime default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`lock_id`),
  UNIQUE KEY `ticket_id` (`ticket_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ost_ticket_lock`
--

/*!40000 ALTER TABLE `ost_ticket_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_ticket_lock` ENABLE KEYS */;


--
-- Definition of table `ost_ticket_message`
--

DROP TABLE IF EXISTS `ost_ticket_message`;
CREATE TABLE `ost_ticket_message` (
  `msg_id` int(11) unsigned NOT NULL auto_increment,
  `ticket_id` int(11) unsigned NOT NULL default '0',
  `message` text NOT NULL,
  `headers` text,
  `source` varchar(16) default NULL,
  `ip_address` varchar(16) default NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated` datetime default NULL,
  PRIMARY KEY  (`msg_id`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ost_ticket_message`
--

/*!40000 ALTER TABLE `ost_ticket_message` DISABLE KEYS */;
INSERT INTO `ost_ticket_message` (`msg_id`,`ticket_id`,`message`,`headers`,`source`,`ip_address`,`created`,`updated`) VALUES 
 (1,1,'\nThank you for choosing osTicket.\n\n                            Make sure you join osTicket forums http://osticket.com/forums to stay upto date on the latest news, security alerts and updates. osTicket forums is also a great place to get assistance, guidance and help. In addition to the forums, osTicket wiki provides useful collection of educational materials, documentation, and notes from the community.\n\n If you are looking for greater level of support, we provide professional services and custom commercial support with guaranteed response times and access to the core development team. We can also customize the system to meet your unique needs.\n\n                                For more information or to discuss your needs, please contact us today. Any feedback will be appreciated!\n                                \nosTicket Team',NULL,'Web','','2008-03-21 15:24:26',NULL),
 (2,2,'lkjsçlfkdsjçlkdsfçslk','','Web','10.12.7.13','2008-03-21 15:49:56',NULL),
 (3,3,'lkjsçlfkdsjçlkdsfçslk','','Web','10.12.7.13','2008-03-21 15:50:25',NULL);
/*!40000 ALTER TABLE `ost_ticket_message` ENABLE KEYS */;


--
-- Definition of table `ost_ticket_note`
--

DROP TABLE IF EXISTS `ost_ticket_note`;
CREATE TABLE `ost_ticket_note` (
  `note_id` int(11) unsigned NOT NULL auto_increment,
  `ticket_id` int(11) unsigned NOT NULL default '0',
  `staff_id` int(10) unsigned NOT NULL default '0',
  `source` varchar(32) NOT NULL default '',
  `title` varchar(255) NOT NULL default 'Generic Intermal Notes',
  `note` text NOT NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`note_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ost_ticket_note`
--

/*!40000 ALTER TABLE `ost_ticket_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_ticket_note` ENABLE KEYS */;


--
-- Definition of table `ost_ticket_priority`
--

DROP TABLE IF EXISTS `ost_ticket_priority`;
CREATE TABLE `ost_ticket_priority` (
  `priority_id` tinyint(4) NOT NULL auto_increment,
  `priority` varchar(60) NOT NULL default '',
  `priority_desc` varchar(30) NOT NULL default '',
  `priority_color` varchar(7) NOT NULL default '',
  `priority_urgency` tinyint(1) unsigned NOT NULL default '0',
  `ispublic` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`priority_id`),
  UNIQUE KEY `priority` (`priority`),
  KEY `priority_urgency` (`priority_urgency`),
  KEY `ispublic` (`ispublic`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ost_ticket_priority`
--

/*!40000 ALTER TABLE `ost_ticket_priority` DISABLE KEYS */;
INSERT INTO `ost_ticket_priority` (`priority_id`,`priority`,`priority_desc`,`priority_color`,`priority_urgency`,`ispublic`) VALUES 
 (1,'low','Low','#DDFFDD',4,1),
 (2,'normal','Normal','#FFFFF0',3,1),
 (3,'high','High','#FEE7E7',2,1),
 (4,'emergency','Emergency','#FEE7E7',1,0);
/*!40000 ALTER TABLE `ost_ticket_priority` ENABLE KEYS */;


--
-- Definition of table `ost_ticket_response`
--

DROP TABLE IF EXISTS `ost_ticket_response`;
CREATE TABLE `ost_ticket_response` (
  `response_id` int(11) unsigned NOT NULL auto_increment,
  `msg_id` int(11) unsigned NOT NULL default '0',
  `ticket_id` int(11) unsigned NOT NULL default '0',
  `staff_id` int(11) unsigned NOT NULL default '0',
  `staff_name` varchar(32) NOT NULL default '',
  `response` text NOT NULL,
  `ip_address` varchar(16) NOT NULL default '',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`response_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `msg_id` (`msg_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ost_ticket_response`
--

/*!40000 ALTER TABLE `ost_ticket_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_ticket_response` ENABLE KEYS */;


--
-- Definition of table `ost_timezone`
--

DROP TABLE IF EXISTS `ost_timezone`;
CREATE TABLE `ost_timezone` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `offset` float(3,1) NOT NULL default '0.0',
  `timezone` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ost_timezone`
--

/*!40000 ALTER TABLE `ost_timezone` DISABLE KEYS */;
INSERT INTO `ost_timezone` (`id`,`offset`,`timezone`) VALUES 
 (1,-12.0,'Eniwetok, Kwajalein'),
 (2,-11.0,'Midway Island, Samoa'),
 (3,-10.0,'Hawaii'),
 (4,-9.0,'Alaska'),
 (5,-8.0,'Pacific Time (US & Canada)'),
 (6,-7.0,'Mountain Time (US & Canada)'),
 (7,-6.0,'Central Time (US & Canada), Mexico City'),
 (8,-5.0,'Eastern Time (US & Canada), Bogota, Lima'),
 (9,-4.0,'Atlantic Time (Canada), Caracas, La Paz'),
 (10,-3.5,'Newfoundland'),
 (11,-3.0,'Brazil, Buenos Aires, Georgetown'),
 (12,-2.0,'Mid-Atlantic'),
 (13,-1.0,'Azores, Cape Verde Islands'),
 (14,0.0,'Western Europe Time, London, Lisbon, Casablanca'),
 (15,1.0,'Brussels, Copenhagen, Madrid, Paris'),
 (16,2.0,'Kaliningrad, South Africa'),
 (17,3.0,'Baghdad, Riyadh, Moscow, St. Petersburg'),
 (18,3.5,'Tehran'),
 (19,4.0,'Abu Dhabi, Muscat, Baku, Tbilisi'),
 (20,4.5,'Kabul'),
 (21,5.0,'Ekaterinburg, Islamabad, Karachi, Tashkent'),
 (22,5.5,'Bombay, Calcutta, Madras, New Delhi'),
 (23,6.0,'Almaty, Dhaka, Colombo'),
 (24,7.0,'Bangkok, Hanoi, Jakarta'),
 (25,8.0,'Beijing, Perth, Singapore, Hong Kong'),
 (26,9.0,'Tokyo, Seoul, Osaka, Sapporo, Yakutsk'),
 (27,9.5,'Adelaide, Darwin'),
 (28,10.0,'Eastern Australia, Guam, Vladivostok'),
 (29,11.0,'Magadan, Solomon Islands, New Caledonia'),
 (30,12.0,'Auckland, Wellington, Fiji, Kamchatka');
/*!40000 ALTER TABLE `ost_timezone` ENABLE KEYS */;

--
-- Create schema ssolution
--

CREATE DATABASE IF NOT EXISTS ssolution;
USE ssolution;

--
-- Definition of table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(200) default '',
  `senha` varchar(200) NOT NULL default '',
  `nome` varchar(150) NOT NULL default '',
  `ativo` tinyint(1) NOT NULL default '1',
  `data` datetime NOT NULL default '0000-00-00 00:00:00',
  `ultacesso` datetime NOT NULL default '0000-00-00 00:00:00',
  `ultacesso_ip` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` (`id`,`login`,`senha`,`nome`,`ativo`,`data`,`ultacesso`,`ultacesso_ip`) VALUES 
 (1,'smart','550237b8fbcdf3741bb1127d0fc7f6bf','Smart Solution TI',1,'2006-06-02 23:29:00','2008-01-31 17:25:38','10.12.7.13'),
 (2,'antonio','ae0ca2c9525396001d68bb366db5b1ad','Antonio Gustavo Sampaio de Oliveira',1,'2007-11-05 11:31:34','2008-03-19 10:41:03','10.12.7.8'),
 (3,'sergio','912318713265d527f3f5f640a550feb9','Sergio Henrique Costa',1,'2008-01-29 11:01:14','2008-03-20 11:47:46','10.12.7.13'),
 (4,'rebeca','708a65c007259f302db570f607cfa897','Rebeca Schmeiske Fausto',1,'2008-01-29 11:05:54','2008-02-01 23:52:46','10.12.7.7');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;


--
-- Definition of table `chamados`
--

DROP TABLE IF EXISTS `chamados`;
CREATE TABLE `chamados` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `tipo_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `problema` text collate latin1_general_ci NOT NULL,
  `solucao` text collate latin1_general_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `data_abertura` date NOT NULL,
  `data_fechamento` date NOT NULL,
  `observacoes` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `chamados`
--

/*!40000 ALTER TABLE `chamados` DISABLE KEYS */;
INSERT INTO `chamados` (`id`,`tipo_id`,`cliente_id`,`admin_id`,`problema`,`solucao`,`status_id`,`data_abertura`,`data_fechamento`,`observacoes`) VALUES 
 (3,1,56,1,'a','b',3,'2008-02-02','2003-02-01','c1\r\n');
/*!40000 ALTER TABLE `chamados` ENABLE KEYS */;


--
-- Definition of table `chamados_status`
--

DROP TABLE IF EXISTS `chamados_status`;
CREATE TABLE `chamados_status` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nome` varchar(100) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `chamados_status`
--

/*!40000 ALTER TABLE `chamados_status` DISABLE KEYS */;
INSERT INTO `chamados_status` (`id`,`nome`) VALUES 
 (1,'Aberto'),
 (2,'Encerrado'),
 (3,'Em análise');
/*!40000 ALTER TABLE `chamados_status` ENABLE KEYS */;


--
-- Definition of table `chamados_tipos`
--

DROP TABLE IF EXISTS `chamados_tipos`;
CREATE TABLE `chamados_tipos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nome` varchar(100) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `chamados_tipos`
--

/*!40000 ALTER TABLE `chamados_tipos` DISABLE KEYS */;
INSERT INTO `chamados_tipos` (`id`,`nome`) VALUES 
 (1,'Financeiro'),
 (2,'Comercial'),
 (3,'Manutenção'),
 (4,'Outros');
/*!40000 ALTER TABLE `chamados_tipos` ENABLE KEYS */;


--
-- Definition of table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `codigo` varchar(100) NOT NULL,
  `tipo` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL default '',
  `nascimento` date NOT NULL default '0000-00-00',
  `rg` varchar(20) NOT NULL,
  `cpf` varchar(30) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `razao_social` varchar(200) NOT NULL,
  `nome_fantasia` varchar(200) NOT NULL,
  `cnpj` varchar(200) NOT NULL,
  `inscr_municipal` varchar(200) NOT NULL,
  `inscr_estadual` varchar(200) NOT NULL,
  `grupo_id` int(11) default NULL,
  `endereco` varchar(300) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `bloco` varchar(10) NOT NULL,
  `complemento_tipo` varchar(5) NOT NULL,
  `complemento` varchar(50) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `tel_residencial` varchar(50) NOT NULL,
  `tel_comercial` varchar(50) NOT NULL,
  `tel_celular1` varchar(50) NOT NULL,
  `tel_celular2` varchar(20) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `site` varchar(200) NOT NULL,
  `email1` varchar(300) NOT NULL,
  `email2` varchar(200) NOT NULL,
  `email3` varchar(200) NOT NULL,
  `observacoes` text NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clientes`
--

/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`id`,`codigo`,`tipo`,`nome`,`nascimento`,`rg`,`cpf`,`sexo`,`razao_social`,`nome_fantasia`,`cnpj`,`inscr_municipal`,`inscr_estadual`,`grupo_id`,`endereco`,`numero`,`bloco`,`complemento_tipo`,`complemento`,`cep`,`bairro`,`cidade`,`uf`,`tel_residencial`,`tel_comercial`,`tel_celular1`,`tel_celular2`,`fax`,`site`,`email1`,`email2`,`email3`,`observacoes`,`datacadastro`) VALUES 
 (7,'08001',0,'Tulio Hofmann Filho','2008-03-05','','','M','','','','','',3,'R. Alferes Poli','294','','Ap.','101','80230-090','Centro','Curitiba','PR','','','','','','','tulinho_hofmann@hotmail.com','','','','2007-11-23 12:22:09'),
 (8,'08002',0,'Daniel Hiroshi Nielsen Yabu','2008-03-05','','034.753.719-79','M','','','','','',3,'Rua Alferes Poli','294','','Ap.','1603','80.230-090','Centro','Curitiba','PR','','','','','','','','','','','2008-01-14 12:09:00'),
 (9,'08003',0,'Robson Lara Moreira','2008-03-05','','','M','','','','','',3,'Rua Alferes Poli','294','','Ap.','202','80230-090','Centro','Curitiba','PR','','','','','','','robson_lara@hotmail.com','','','','2008-01-14 12:09:37'),
 (10,'08004',0,'Felipe Augusto Kubis','2008-03-05','','054.165.369-50','M','','','','','',3,'Rua Alferes Poli','294','','Ap.','301','80230-090','Centro','Curitiba','PR','','','','','','','','','','','2008-01-14 12:10:30'),
 (11,'08005',0,'Mayara Cristina Garcia Machuca ','2008-03-05','','369.742.538-26','F','','','','','',3,'Rua Alferes Poli','294','','Ap.','303','80.230-090','Centro','Curitiba','PR','','','','','','','','','','','2008-01-14 12:11:33'),
 (12,'08006',0,'Graciele Razera','2008-03-05','','644.489.400-04','F','','','','','',3,'Rua Alferes Poli','294','','Ap.','902','80.230-090','Centro','Curitiba','PR','','','','','','','gracirazera@hotmail.com','','','','2008-01-14 12:12:41'),
 (13,'08008',0,'Lucas Nunes da Silveira','2008-03-05','','038.062.189-43','M','','','','','',3,'Rua Alferes Poli','294','','Ap.','903','80.230-090','Centro','Curitiba','PR','','','','','','','lucasn_silveira@hotmail.com','','','','2008-01-14 12:13:34'),
 (14,'08007',0,'Simone Vivan','2008-03-05','','029.500.199-27','F','','','','','',3,'Rua Alferes Poli','294','','Ap.','1001','80.230-090','Centro','Curitiba','PR','','','4199151267','','','','','','','','2008-01-14 12:14:13'),
 (15,'08009',0,'Rebeca Garcia Martins','1985-09-28','86702789 PR','046.373.099-21','F','','','','','',3,'Rua Alferes Poli','294','','Ap.','1402','80.230-090','Centro','Curitiba','PR','4132336364','','','','','','','','','','2008-01-14 12:14:47'),
 (16,'08010',0,'Juliana Horta','2008-03-05','','','F','','','','','',3,'Rua Alferes Poli','294','','Ap.','1403','80.230-090','Centro','Curitiba','PR','','4136662411','4199089783','','','','hortajuli@hotmail.com','','','','2008-01-14 12:15:20'),
 (17,'08011',0,'Robson Garcia Barbosa','1980-08-21','8021556-8 PR','032060729-13','M','','','','','',3,'R. Alferes Poli','294','','','1502','80230-090','Centro','Curitiba','PR','4132031848','','4188540611','','','','robson.cwb@gmail.com','','','','2008-01-14 12:16:12'),
 (18,'99001',0,'Oscar Ricardo Macedo Schmeiske','2008-03-15','','635.251.609-25','M','','','','','',9,'Avenida Sete de Setembro','6830','','','AP 1531','80240001','Seminário','Curitiba','PR','4132436467','4132501355','4199776984','','','','oscar@ippuc.org.br','oscarschmeiske@gmail.com','','Cliente avulso em serviços de manutenção e suporte.','2008-01-29 17:17:35'),
 (19,'99002',0,'Rinaldo da Silva Rocha','0000-00-00','','69705658900','M','','','','','',9,'Rua Maria Ludwig Muller','277','','','','83409540','Jardim Eucalipto','Colombo','PR','','','','','','','','','','Parceiro de negocios - Manutenção em monitores, impressoras e micromputadores.','2008-01-29 17:26:55'),
 (20,'03001',0,'Clelia Alice Marson','1971-03-19','60871990','96329858934','F','','','','','',6,'R. Brasílio Itiberê','2433','','Ap.','25 B','80230-050','Rebouças','Curitiba','PR','4133334941','','4184253353','','','','','','','','2008-01-29 17:31:24'),
 (21,'06001',0,'Iolanda Reis','2008-03-05','','39409538904','F','','','','','',4,'Avenida. Sete de Setembro','3293','','Ap.','1301','80230-010','Centro','Curitiba','PR','4130194881','','','','','','','','','Cunhada da Zeladora do Edificio Roma, dados para operaçõs financeiras.','2008-01-29 17:38:20'),
 (22,'00002',0,'IPPUC - Instituto de Pesquisa e Planejamento Urbano de Curitiba','2008-03-05','','76.582.337/0001-16','','','','','','',10,'Rua Bom Jesus','669','','','','80035010','Juveve','Curitiba','PR','','41 3250-1300','','','','','','','','Cliente de Vendas de equipamentos e de Serviços de suporte e manutenção em servidores.','2008-01-29 18:01:02'),
 (23,'99003',0,'Luis Sergio Rolim de Moura','0000-00-00','','64101835934','M','','','','','',9,'Rua Irmãs Paulina','5146','','','','81020230','Novo mundo','Curitiba','PR','','','4192139239','4191823402','','','','','','Luis que trabalha com o Paulo Databull.','2008-01-29 18:09:07'),
 (24,'99004',0,'Rauf Alencar de Oliveira','1986-04-09','','05889025945','M','','','','','',9,'Rua João Gomes ','100','','','Bloco J  AP 32','80020030','Novo mundo','Curitiba','PR','','4133980456','41','','','','rauf@mjtelefonia.com.br','rauf.sk8@gmail.com','','','2008-01-29 18:13:39'),
 (25,'02001',0,'Rose Mari Martins Arruda','2008-03-05','','317.955.799-00','F','','','','','',7,'Rua Lourenço Pinto','260','','Ap.','103A','80010160','Centro','Curitiba','PR','4132224102','4130146906','4194280387','','','','','','','Sindica do condominio','2008-01-30 11:49:16'),
 (26,'02002',0,'Jackson M. Nizer','0000-00-00','','032.173.759-80','M','','','','','',7,'Rua Lourenço Pinto','260','','','201','80010160','Centro','Curitiba','PR','','','','','','','','','','Irmão da Jacqueline Nizer funcionária da Huczok','2008-01-30 11:50:59'),
 (27,'02003',0,'Jorge Gonçalves dos Santos','2008-03-05','','157.097.799-20','M','','','','','',7,'Rua Lourenço Pinto','260','','Ap.','202','80010160','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 11:53:31'),
 (28,'02004',0,'Sergio Vivan','2008-03-05','','460.707.379-20','','','','','','',7,'Rua Lourenço Pinto','260','','Ap.','303','80010160','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 11:55:04'),
 (29,'02005',0,'Jhony Maciel Oliveira','0000-00-00','','064.214.299-80','M','','','','','',7,'Rua Lourenço Pinto','260','','','103B ','80010160','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 11:58:47'),
 (30,'02006',0,'Daisy Mary Reichel','0000-00-00','','008933740-91','F','','','','','',7,'Rua Lourenço Pinto','260','','','302','80010160','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 12:04:12'),
 (31,'03002',0,'Luciana Osorio Cavalli','2008-03-05','','043.933.609-07','F','','','','','',6,'Rua Brasílio Itiberê','2455','','Ap.','23 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','','2008-01-30 12:06:50'),
 (32,'03003',0,'Zenildo Costa','2008-03-05','','539.938.029-34','M','','','','','',6,'Rua Brasílio Itiberê','2455','','Ap.','25 B','80230-050','Rebouças','Curitiba','PR','4133334941','4133334941','4184122072','','4133334941','','','','','','2008-01-30 12:08:29'),
 (33,'03004',0,'Bernhard Zanker Junior','2008-03-05','','025.833.599-83','M','','','','','',6,'Rua Brasílio Itiberê','2455','','Ap.','31 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','','2008-01-30 12:12:22'),
 (34,'03005',0,'Edison Carlos dos Santos','2008-03-05','','681.977.569-53','','','','','','',6,'Rua Brasílio Itiberê','2455','','Ap.','43 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','','2008-01-30 12:13:16'),
 (35,'03006',0,'Ana Elisa Macagnan','2008-03-05','','897.755.200-10','','','','','','',6,'Rua Brasílio Itiberê','2455','','Ap.','22 B','80230-050','Rebouças','Curitiba','PR','','','','','','','ana.elisa.pm@hotmail.com','','','','2008-01-30 12:14:10'),
 (36,'03007',0,'Fernando Henrique Tremel Bueno','2008-03-05','','050.193.579-79','','','','','','',6,'Rua Brasílio Itiberê','2455','','Ap.','24 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','','2008-01-30 12:15:05'),
 (37,'03008',0,'Adriano Noedinger da Silva','2008-03-05','','030.070.919-69','M','','','','','',6,'Rua Brasílio Itiberê','2455','B','Ap.','43 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','Cunhado do Edison Pudim','2008-01-30 12:16:22'),
 (38,'03009',0,'Eugenio Antonio Guerra','2008-03-05','','553.679.686-00','','','','','','',6,'Rua Brasílio Itiberê','2455','','Ap.','44 B','80230-050','Rebouças','Curitiba','PR','4133336862','','4199754454','','','','egf.madeiras@netctba.com.br','geninhoemarias@netctba.com.br','','Contato com Maria Claudia - Esposa','2008-01-30 12:17:19'),
 (39,'03010',0,'Waldenira Pistori','2008-03-05','','205.384.649-68','F','','','','','',6,'Rua Brasílio Itiberê','2455','','Ap.','21 BII','80230-050','Rebouças','Curitiba','PR','4130158715','4130261627','','','','','','','','','2008-01-30 12:18:23'),
 (40,'03011',0,'Clayton Cezar Upitis Marloch','2008-03-05','','651.454.109-72','M','','','','','',6,'Rua Brasílio Itiberê','2455','','Ap.','42 BII','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','','2008-01-30 12:19:28'),
 (41,'04001',0,'Vanildo','2008-03-05','','','M','','','','','',5,'R. 24 de Maio','262','','Cj.','301','80230-080','Centro','Curitiba','PR','','','','','','','','','','Zelador do condominio possue uma sala comercial','2008-01-30 12:33:04'),
 (42,'04002',0,'ACC Aduditoria Contabil S/C Ltda.','2008-03-05','','01.625.401/0001-08','','','','','','',5,'R. 24 de Maio','262','','Cj.','1103','80230-080','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 12:35:17'),
 (43,'04003',0,'Francisco C. T. Costa e Silva','2008-03-05','','320.945.319-53','M','','','','','',5,'R. 24 de Maio','262','','Cj.','505 /  506','80230-080','Centro','Curitiba','PR','','4132336584','','','','','','','','','2008-01-30 12:36:52'),
 (44,'04004',0,'Sonia Maria Bressan ','2008-03-05','','237.300.300-78','F','','','','','',5,'R. 24 de Maio','262','','Cj.','803','80230-080','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 12:38:03'),
 (45,'04005',0,'Carlos Eduardo','2008-03-05','1237614 - PR','374755339-72','M','','','','','',5,'R. 24 de Maio','262','','','806','80230-080','Centro','Curitiba','PR','','41 3323-1863','8435-5587','','','','drcarloseduardo@uol.com.br','','','','2008-01-30 12:38:56'),
 (46,'04006',0,'Saulo Souza e Silva','2008-03-05','','322.416.669-04','M','','','','','',5,'R. 24 de Maio','262','','Cj.','402','80230-080','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 12:41:27'),
 (47,'04007',0,'Ursula','2008-03-05','','','','','','','','',5,'R. 24 de Maio','262','','Cj.','402','80230-080','Centro','Curitiba','PR','','','','','','','','','','Atendente do consultório do Saulo.','2008-01-30 12:42:22'),
 (48,'04008',0,'R. Huczok Consulting Ltda.','2008-03-05','','00.058.094/0001-50','','','','','','',5,'R. 24 de Maio','262','','Cj.','1001 /  1002','80230-080','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 12:44:30'),
 (49,'04009',0,'DIVALPAR Participação Societária Ltda.','2008-03-05','','76.641.265/0001-30','','','','','','',5,'Rua 24 de Maio','262','','Cj.','1104','80230-080','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 12:58:07'),
 (50,'04010',0,'Rogoski & Soares C. A. Elet. Ltda.','2008-03-05','','08.182.364/0001-41','','','','','','',5,'Rua 24 de Maio','262','','Cj.','1201','80230-080','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 13:12:50'),
 (51,'04011',0,'Olimpus Agência de Viagem e Turismo Ltda.','2008-03-05','','01.134.309/0001-37','','','','','','',5,'Rua 24 de Maio','262','','Cj.','1202','80230-080','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 13:17:03'),
 (52,'04012',0,'EPRON Serviço de Informática S/C Ltda.','2008-03-05','','01.766.736/0001-38','','','','','','',5,'Rua 24 de Maio','262','','Cj.','605','80230-080','Centro','Curitiba','PR','','','','','','','','','','Ivan desenvolvedor de software para a Huczok.','2008-01-30 14:40:51'),
 (53,'05001',0,'Marisa Helena da Costa Serafin','2008-03-05','','471.972.509-00','','','','','','',1,'Av. Sete de Setembro','3272','','Ap.','01','80230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 14:42:51'),
 (54,'05002',0,'Marisângela Pacheco Brittes','2008-03-05','','906.561.219-04','F','','','','','',1,'Av. Sete de Setembro','3272','','Ap.','03','80230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 14:46:08'),
 (55,'05003',0,'COMPOR Arquitetura e Construção Ltda.','2008-03-05','','79.110.086/0001-65','','','','','','',1,'Av. Sete de Setembro','3272','','Cj.','04','80230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 19:31:18'),
 (56,'05004',0,'Eliana Nascimento','2008-03-05','','872.560.296-91','','','','','','',1,'Av. Sete de Setembro','3272','','Ap.','06','80230-010','Centro','Curitiba','PR','','','','','','','lia_nascimento1@hotmail.com','','','','2008-01-30 19:33:38'),
 (57,'05005',0,'Djalma Jacinto da Silva Filho','2008-03-05','','738.669.389-34','M','','','','','',1,'Av. Sete de Setembro','3272','','Ap.','08','80230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 19:37:09'),
 (58,'05006',0,'Isabel Jacomel','2008-03-05','','583.674.629-04','F','','','','','',1,'Av. Sete de Setembro','3272','','Ap.','10','80230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-30 19:42:46'),
 (59,'05007',0,'Celso Amaral Poletti','2008-03-05','','008.436.739-31','M','','','','','',1,'Av. Sete de Setembro','3272','','Ap.','12','80230-010','Centro','Curitiba','PR','','','','','','','askywalker_starwars@hotmail.com','','','Beatriz > 8805-3575','2008-01-30 19:45:36'),
 (60,'05008',0,'Claiton Estacionamento','2008-03-08','','','M','','','','','',1,'Av. Sete de Setembro','3272','','','Estacionamento','80230-010','Centro','Curitiba','PR','','','','','','','claytongarcia473@hotmail.com','','','','2008-01-30 19:46:11'),
 (61,'06002',0,'Matilde Alves da Cunha Silva','2008-03-05','','153.857.058-02','F','','','','','',4,'Av. Sete de Setembro','3293','','Ap.','103','80230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 13:52:24'),
 (62,'06003',0,'Wallace Mendes Cordeiro','2008-03-05','','020.916.769-69','M','','','','','',4,'Av. Sete de Setembro','3293','','Ap.','104','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 13:54:27'),
 (63,'06004',0,'Rubia Souza Pimenta de Padua','1981-04-25','7211934-7 / PR','03703663952','F','','','','','',4,'Av. Sete de Setembro','3293','','Ap.','108','80.230-010','Centro','Curitiba','PR','','4136425555','4199570561','','','','rupimenta@gmail.com','','','','2008-01-31 13:56:28'),
 (64,'06005',0,'Robson Roberto da Silva','2008-03-05','','048.468.029-30','M','','','','','',4,'Av. Sete de Setembro','3293','','Ap.','208','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 13:57:38'),
 (65,'06006',0,'Bruna Amaral Monteiro','0000-00-00','384.625-0 / PR','048.863.769-40','F','','','','','',4,'Av. Sete de Setembro','3293','','','307','80.230-010','Centro','Curitiba','PR','','','4196654014','','','','','','','celular antigo > 4199653379','2008-01-31 13:58:30'),
 (66,'06007',0,'Luana Aparecida Dias Mota','2008-03-05','','342.496.088-83','F','','','','','',4,'Av. Sete de Setembro','3293','','Ap.','405','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 14:00:04'),
 (67,'06008',0,'Katia Cristina Zardo','0000-00-00','','','F','','','','','',4,'Av. Sete de Setembro','3293','','','602','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 14:00:52'),
 (68,'06009',0,'Rose Cristina Neves','0000-00-00','','','F','','','','','',4,'Av. Sete de Setembro','3293','','','603','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 14:03:06'),
 (69,'06010',0,'George Galli','2008-03-05','','054.504.359-08','M','','','','','',4,'Av. Sete de Setembro','3293','','Ap.','606','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 14:04:15'),
 (70,'06011',0,'Leonardo Raupp Matta','2008-03-05','','368.638.378-03','M','','','','','',4,'Av. Sete de Setembro','3293','','Ap.','904','80.230-010','Centro','Curitiba','PR','','','4191456911','','','','leonardo_raupp@hotmail.com','','','','2008-01-31 14:05:36'),
 (71,'06012',0,'Rita Helena Zimmermann','2008-03-05','','312.534.319-49','F','','','','','',4,'Av. Sete de Setembro','3293','','Ap.','905','80.230-010','Centro','Curitiba','PR','4132336720','','','','','','','','','','2008-01-31 14:06:53'),
 (72,'06013',0,'Mellina Franco Oliveira Canto','2008-03-05','','368.851.968-00','F','','','','','',4,'Av. Sete de Setembro','3293','','Ap.','908','80.230-010','Centro','Curitiba','PR','','','4196227515','','','','mel_canto@hotmail.com','','','','2008-01-31 14:09:21'),
 (73,'06014',0,'Felipe Lukacievick Barbosa','2008-03-05','','040.494.399-30','M','','','','','',4,'Av. Sete de Setembro','3293','1004','Ap.','1004','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 14:17:05'),
 (74,'06015',0,'Fernando Cesar Alves da Silva','2008-03-05','','','M','','','','','',4,'Av. Sete de Setembro','3293','','Ap.','1106','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 14:18:08'),
 (75,'06016',0,'Amanda Tieppo','0000-00-00','','055.717.089-30','F','','','','','',4,'Av. Sete de Setembro','3293','','','1108','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 14:19:24'),
 (76,'06017',0,'Thiago Carli','2008-03-05','','039.701.069-90','M','','','','','',4,'Av. Sete de Setembro','3293','','Ap.','1205','80.230-010','Centro','Curitiba','PR','','','','','','','','','','','2008-01-31 14:20:34'),
 (77,'06018',0,'Fabiana Reis','0000-00-00','','','F','','','','','',4,'Av. Sete de Setembro','3293','','','1301','80.230-010','Centro','Curitiba','PR','','','','','','','','','','Filha da D. Lourdes zeladora do predio.','2008-01-31 14:22:04'),
 (78,'09001',0,'Katia Regina Schmeiske','2008-03-05','','','F','','','','','',8,'Av. Sete de Setembro','6830','','Ap.','1531','80440000','Seminário','Curitiba','PR','','','','','','','','','','','2008-01-31 14:37:16'),
 (79,'09002',0,'Henderson Ezequiel Rudiniski','1977-05-06','64618822 / PR','022.198.909-96','M','','','','','',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','232','80.440-000','Seminário','Curitiba','PR','','4133217600','4191111860','','','','r_hender@hotmail.com','','','','2008-01-31 14:49:04'),
 (80,'09003',0,'Morgana Biron','2008-03-05','7.859.158-7 / PR','053.419.179-79','F','','','','','',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','241','80440000','Seminário','Curitiba','PR','','','','','','','','','','Ponto adicional habilitado em 19/02/08:\r\nIP: 10.1.3.2 ; MAC-ADDR: 00:C0:DF:E9:B4:88','2008-01-31 14:50:06'),
 (81,'09004',0,'Thais Cristina Sentone Mota','2008-03-05','','035.978.319-82','F','','','','','',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','522','80440000','Seminário','Curitiba','PR','','','','','','','','','','','2008-01-31 14:52:03'),
 (82,'09005',0,'João Arnaldo de Oliveira','2008-03-05','','028.053.679-87','M','','','','','',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','722','80.440-000','Seminário','Curitiba','PR','','','','','','','','','','','2008-01-31 14:53:43'),
 (83,'09006',0,'Carlos Roberto dos Santos Fernandes','2008-03-05','2088917-9 SPP/PR','402.430.1529-87','M','','','','','',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','811','80440000','Seminário','Curitiba','PR','','','4196447773','','','','carlaovs41@hotmail.com','','','','2008-01-31 15:10:05'),
 (84,'09007',0,'Sonia Aparecida Estevan Costa ','2008-03-05','','','F','','','','','',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','922','80440000','Seminário','Curitiba','PR','','','','','','','','','','','2008-01-31 15:14:16'),
 (85,'09008',0,'José Carlos de Lima','1958-03-10','2166535 / PR','337.841.169-49','M','','','','','',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','932','80440000','Seminário','Curitiba','PR','4133432571','4136768213','4196535867','','','','zekinhahsbc@hotmail.com','','','durante o dia contatos com a esposa Jucimara','2008-01-31 15:15:13'),
 (86,'09009',0,'Ivana Rubio Colin','2008-03-05','','055.924.239-50','F','','','','','',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','942','80440000','Seminário','Curitiba','PR','','','','','','','','','','','2008-01-31 15:16:29'),
 (87,'09010',0,'José Carvalho Filho','2008-03-05','','396.640.319-68','M','','','','','',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','1122','80440000','Seminário','Curitiba','PR','','','','','','','','','','','2008-01-31 15:17:36'),
 (88,'09011',0,'Anderson Augusto Fillus','2008-03-05','','049.129.829-38','M','','','','','',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','1511','80440000','Seminário','Curitiba','PR','','','','','','','','','','','2008-01-31 15:18:32'),
 (89,'09012',0,'Jefferson Olinger de Souza','2008-03-05','','040.739.369-21','M','','','','','',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','1512','80440000','Seminário','Curitiba','PR','','','','','','','','','','','2008-01-31 15:19:38'),
 (90,'09013',0,'José Carlos','2008-03-05','831045-9 / PR','183674379-34','M','','','','','',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','1512','80440000','Seminário','Curitiba','PR','4130277039','','','','','','jcsouza0709@gmail.com','jcsouza@hotmail.com','','Pai do Jefferson plano individual do próprio.','2008-01-31 15:22:00'),
 (91,'09014',0,'Adriano de Araujo Schampovski','2008-03-05','5903776-5 / PR','87389932953','M','','','','','',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','1521','80440000','Seminário','Curitiba','PR','','','4188042413','','','','adriano@hoteisesolucoes.com','','','','2008-01-31 15:22:31'),
 (93,'101001',0,'Everson Edson do Prado','1979-11-08','89821258','02692342925','M','','','','','',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','71','81150060','Pinheirinho','Curitiba','PR','32466809','','88072142','','','','eversonet@hotmail.com','','','Instalaçao 02/02/2008 - dia todo, ligar p confirmar horario.','2008-02-01 16:08:54'),
 (94,'101015',0,'Valdemir Antonio Rovares','2008-03-06','19272090','10806149825','M','','','','','',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','103','81150060','Pinheirinho','Curitiba','PR','4132461186','','','','','','alexandrarovares@hotmail.com','','','Esposo da Sindica ','2008-02-01 16:16:44'),
 (95,'101002',0,'Nilo Ravazzi','1959-09-10','19772535 / PR','40534430910','M','','','','','',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','22','81150060','Pinheirinho','Curitiba','PR','','4131248855','4199613435','','','','niloravazzi@yahoo.com','','','','2008-02-01 16:19:17'),
 (96,'101003',0,'Dievert Fernando de Campos','2008-03-06','77872906','04589454980','M','','','','','',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','63','81150060','Pinheirinho','Curitiba','PR','33272329','','','','','','cheve_tt_ee@hotmail.com','','','','2008-02-01 16:22:44'),
 (97,'101004',0,'Luiz Eduardo Lasszck','2008-03-06','62449284','87587610987','M','','','','','',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','92','81150060','Pinheirinho','Curitiba','PR','4133049098','','4199366803','','','','eduardo@prt9.mpt.gov.br','','','','2008-02-01 16:24:29'),
 (98,'101005',0,'Adenir Farias','0000-00-00','60208018','01755436904','M','','','','','',12,'R Marechal Otávio Saldanha Mazza','7777','','','101','81150060','Pinheirinho','Curitiba','PR','3567-9184 ','','8405-5327','','','','','','','','2008-02-01 16:26:51'),
 (99,'101006',0,'Valdir Modest de Oliveira','2008-03-06','41744367','55588930959','M','','','','','',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','112','81150060','Pinheirinho','Curitiba','PR','','','9682-0731','','','','valdirdeoliveira1@hotmail.com','','','','2008-02-01 16:28:36'),
 (100,'101007',0,'Antonio dos Santos Bicalho','2008-03-06','34219095','49109243968','M','','','','','',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','143','81150060','Pinheirinho','Curitiba','PR','3346-1714','','9916-3562','','','','','','','','2008-02-01 16:30:06'),
 (101,'101008',0,'Sueli Costa Luvison','2008-03-06','67199162','02171579986','F','','','','','',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','114','81150060','Pinheirinho','Curitiba','PR','3268-9163','','','','','','s_ueli_costa@hotmail.com','','','','2008-02-01 16:31:55'),
 (102,'101009',0,'Dieick Denner Gonçalves','2008-03-06','74123333','006.958.229-77','M','','','','','',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','151','81150060','Pinheirinho','Curitiba','PR','4130228903','','4188594241','4196778533','','','dieick@yahoo.com.br','','','','2008-02-01 16:33:44'),
 (103,'101010',0,'Vanderlei Souza','2008-03-06','299305661','','M','','','','','',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','153','81150060','Pinheirinho','Curitiba','PR','','','8848-2141','','','','','','','nao tem seviço.','2008-02-01 16:36:46'),
 (104,'101011',0,'Shirley Cristiane M. de Souza','2008-03-06','7.324.135-9','024425299-80','F','','','','','',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','53','81150060','Pinheirinho','Curitiba','PR','','','4188184709','','','','criskatana@hotmail.com','','','','2008-02-01 16:38:10'),
 (105,'101012',0,'Silvia Aparecida Pereira','2008-03-06','60820724','87363755949','F','','','','','',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','123','81150060','Pinheirinho','Curitiba','PR','3247-5528','','9963-7739','','','','valter.costa@cnh.com','','','Esposa do Valter','2008-02-01 16:40:03'),
 (106,'101013',0,'Rosina Helena dos Santos','2008-03-06','2098664 / PR','68846649915','F','','','','','',12,'R Marechal Otávio Saldanha Mazza','777','','Ap.','33','81150060','Pinheirinho','Curitiba','PR','4132483312','','4188039777','','','','','','','Raphaela de Oliveira\r\nRG 79419982\r\nCPF 07511603939\r\n','2008-02-01 16:42:41'),
 (107,'101014',0,'Robson Sandro Santos','2008-03-06','74006884','02842147952','M','','','','','',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','141','81150060','Pinheirinho','Curitiba','PR','','','8437-7480','','','','','','','','2008-02-01 16:44:23'),
 (125,'09016',0,'Sidnei Scaravonatti','2008-03-15','4220679-2','589.510.409-68','M','','','','','',8,'Avenida Nossa Senhora Aparecida','501','11','Ap.','1111','80440000','Seminário','Curitiba','PR','4132435937','4133145519','','4599772199','','','ssidnei@hotmail.com','','','','2008-03-07 11:33:32'),
 (109,'00003',0,'GE Money','2008-03-05','','','','','','','','',10,'Rua Monsenhor Celso','23','','','','80010-150','Centro','Curitiba','PR','','41 3224-0177','','','41 3224-7119','','','','','Contato: Ediely Bilo\r\nSite: www.gemoney.com.br','2008-02-20 10:56:20'),
 (110,'99005',0,'Ricardo - PRT','0000-00-00','','','','','','','','',9,'','','','','','','','','PR','','','','','','','','','','Dados bancários usados para pagar a SCM:\r\nBanco do Brasil\r\nAG: 1443-5\r\nCC: 19.150-7\r\nValor: R$ 1340,80','2008-02-20 11:00:31'),
 (111,'00004',1,'','0000-00-00','','045.430.730-00','M','Mercador Fomento Mercantil LTDA.','Mercador Fomento Mercantil LTDA.','x','x','x',10,'','','','','','','','','PR','','','','','','','','','','Dados Bancários:\r\nHSBC\r\nAG: 0054\r\nCC: 28487-75','2008-02-20 11:03:31'),
 (112,'00005',1,'','0000-00-00','','','','Fontoura e Silva Com. de Informática','Fontoura e Silva Com. de Informática','x','x','x',10,'','','','','','','','','PR','','','','','','','','','','Dados Bancários:\r\nItaú\r\nAG: 3761\r\nCC: 09324-8','2008-02-20 11:21:55'),
 (113,'00006',0,'Paraná Despachante','2008-03-05','','','','','','','','',10,'','','','','','','','','PR','','41 3015-5501','','','','','','','','','2008-02-20 11:25:23'),
 (114,'09015',0,'Ivan de Oliveira Mota','2008-03-05','340.196-0 / PR','111.061.589-20','M','','','','','',8,'Avenida Nossa Senhora Aparecida','501','','Ap.','522','80440000','Seminário','Curitiba','PR','4133432466','','','','','','ivan.o.mota@hotmail.com','ivan.o.mota@gmail.com','','Substituiu o titulat do contrato (Thais).\r\nRenegociado valores atrasados:\r\nde 10/03 a 10/08 parcelas de R$ 80,00\r\na partir de 10/09 normal\r\n','2008-02-20 12:13:22'),
 (115,'00007',0,'Federação Paranaense de Ginástica','2008-03-13','','00.417.081/0001-20','','','','','','',10,'Rua Profª Antonia Reginatto Viana','921','','','','','','Curitiba','PR','','','','','','','','','','','2008-02-20 12:58:41'),
 (116,'06019',0,'Jonas','0000-00-00','','','M','','','','','',4,'Av. Sete de Setembro','3293','','','206','80.230-010','Centro','Curitiba','PR','','','9944-2176','','','','','','','Não mora mais no Roma, solicitou cancelamento em 21/11/08 às 12:28, quem atendeu foi o Valteir','2008-02-20 13:13:58'),
 (117,'00008',1,'','2008-03-15','','','','BV Financeira - Daniel Moreira','BV Financeira - Daniel Moreira','x','','',10,'Avenida Mal. Deodoro','261','','','Térreo','','','','PR','','41 3596-3900','41 8808-1787','','','','daniel.moreira@cppromotora.com.br','','','','2008-02-01 13:16:27'),
 (118,'00009',1,'','2008-03-15','','','M','B2 Informática','B2 Informática','x','x','x',10,'','','','','','','','','PR','','41 3029-9404','','','','www.infob2.com.br','vendas@infob2.com.br','','','Contato: Renato','2008-02-01 13:17:54'),
 (119,'51001',0,'Antonia - Síndica','0000-00-00','','','','','','','','',11,'','','','','','','Jardim Botânico','Curitiba','PR','3013-0751','',' 9198-8823','','','','','','','','2008-02-01 13:19:33'),
 (120,'99006',0,'Elenara Beatriz Fontana','0000-00-00','','','F','','','','','',9,'','','','','','','','','PR','3324-1243','3223-7758','9971-6264','','','','elenaraf@gmail.com','elenara.fontana@pucpr.br','','Cirurgiã Dentista\r\nFinanceamento carro com BV Financeira','2008-02-01 13:25:11'),
 (121,'06020',0,'Jeane Margarete Rucinski','1973-04-13','60213070 / PR','81348053968','F','','','','','',4,'Av. Sete de Setembro','3293','','Ap.','503','80.230-010','Centro','Curitiba','PR','4141013797','','4141013797','','','','jeanemargareterucinski@bol.com.br','','','Plano smartconnect150','2008-02-28 09:01:13'),
 (123,'101017',0,'Marcelo Luiz Velter','1971-09-08','219.7845 / SC','652.603.259-15','M','','','','','',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','52','81150060','Pinheirinho','Curitiba','PR','4130130386','','4788050784','','','','','','','','2008-03-06 13:29:14'),
 (124,'101018',0,'José Carlos Cardoso Ajala','1965-08-26','036.803.893-1','419.537.030-20','M','','','','','',12,'R Marechal Otávio Saldanha Mazza','7777','','Ap.','42','81150060','Pinheirinho','Curitiba','PR','4130295633','','4184021972','','','','carlosajala@hotmail.com','','','','2008-03-06 13:31:20'),
 (126,'05009',0,'João Marcos Ferreira Damaceno','0000-00-00','6078341-1/PR','02517831971','M','','','','','',1,'Av. Sete de Setembro','3272','','Ap.','07','80230-010','Centro','Curitiba','PR','4130263584','','','','','','joaodamaceno@yahoo.com.br','','','','2008-03-11 13:55:45'),
 (127,'08012',0,'Juliana Aparecida Rosty de Anhaia Cesar','1983-11-21','8742839-7 / PR','03941557939','F','','','','','',3,'Rua Alferes Poli','294','','Ap.','1201','80.230-090','Centro','Curitiba','PR','','','4199830771','4196877877','','','jucesar@hotmail.com','alexju21@hotmail.com','','','2008-03-12 13:13:48'),
 (128,'06021',0,'Caio Ruocco de Arruda','1982-02-11','104926606 PR','31215877811','M','','','','','',4,'Av. Sete de Setembro','3293','','Ap.','603','80.230-010','Centro','Curitiba','PR','','4130214714','4191456848','','','','caioruocco_@hotmail.com','','','substitui contrato ap603 - Rose Cristina','2008-03-15 10:37:44'),
 (129,'06022',0,'Ines Eline Lopes Martins','2008-03-15','2375324 PR','050.172.588-17','F','','','','','',4,'Av. Sete de Setembro','3293','','Ap.','301','80.230-010','Centro','Curitiba','PR','4132324981','','4188523696','','','','mlmartins@yahoo.com.br','','','dois pontos por R$ 60,00\r\n1 - instalado desktop em 15/02/08\r\n2 - instalado notebook em 15/03/08 (ponto adicional sri)\r\n\r\nTatiana - 88523696','2008-03-15 13:06:53');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;


--
-- Definition of table `clientes_bkp`
--

DROP TABLE IF EXISTS `clientes_bkp`;
CREATE TABLE `clientes_bkp` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `codigo` int(20) NOT NULL,
  `nome` varchar(200) NOT NULL default '',
  `nascimento` timestamp NOT NULL default '0000-00-00 00:00:00',
  `rg` varchar(20) NOT NULL,
  `cpf` varchar(30) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `grupo_id` int(11) default NULL,
  `endereco` varchar(300) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `complemento` varchar(50) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `tel_residencial` varchar(50) NOT NULL,
  `tel_comercial` varchar(50) NOT NULL,
  `tel_celular1` varchar(50) NOT NULL,
  `tel_celular2` varchar(20) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `email1` varchar(300) NOT NULL,
  `email2` varchar(200) NOT NULL,
  `email3` varchar(200) NOT NULL,
  `observacoes` text NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clientes_bkp`
--

/*!40000 ALTER TABLE `clientes_bkp` DISABLE KEYS */;
INSERT INTO `clientes_bkp` (`id`,`codigo`,`nome`,`nascimento`,`rg`,`cpf`,`sexo`,`grupo_id`,`endereco`,`numero`,`complemento`,`cep`,`bairro`,`cidade`,`uf`,`tel_residencial`,`tel_comercial`,`tel_celular1`,`tel_celular2`,`fax`,`email1`,`email2`,`email3`,`observacoes`,`datacadastro`) VALUES 
 (7,8001,'Tulio Hofmann Filho','0000-00-00 00:00:00','','','M',3,'R. Alferes Poli','294','Ap. 101','80230-090','Centro','Curitiba','PR','','','','','','','','','','2007-11-23 12:22:09'),
 (8,8002,'Daniel Hiroshi Nielsen Yabu','0000-00-00 00:00:00','','034.753.719-79','M',3,'Rua Alferes Poli','294','AP 1603','80.230-090','Centro','Curitiba','PR','','','','','','','','','','2008-01-14 12:09:00'),
 (9,8003,'Robson Lara Moreira','0000-00-00 00:00:00','','','M',3,'Rua Alferes Poli','294','AP 202','80230-090','Centro','Curitiba','PR','','','','','','','','','','2008-01-14 12:09:37'),
 (10,8004,'Felipe Augusto Kubis','0000-00-00 00:00:00','','054.165.369-50','M',3,'Rua Alferes Poli','294','AP 301','80230-090','Centro','Curitiba','PR','','','','','','','','','','2008-01-14 12:10:30'),
 (11,8005,'Mayara Cristina Garcia Machuca ','0000-00-00 00:00:00','','369.742.538-26','F',3,'Rua Alferes Poli','294','Ap. 303','80.230-090','Centro','Curitiba','PR','','','','','','','','','','2008-01-14 12:11:33'),
 (12,8006,'Graciele Razera','0000-00-00 00:00:00','','644.489.400-04','F',3,'Rua Alferes Poli','294','AP 902','80.230-090','Centro','Curitiba','PR','','','','','','','','','','2008-01-14 12:12:41'),
 (13,8008,'Lucas Nunes da Silveira','0000-00-00 00:00:00','','038.062.189-43','M',3,'Rua Alferes Poli','294','AP 903','80.230-090','Centro','Curitiba','PR','','','','','','','','','','2008-01-14 12:13:34'),
 (14,8007,'Simone Vivan','0000-00-00 00:00:00','','029.500.199-27','F',3,'Rua Alferes Poli','294','AP 1001','80.230-090','Centro','Curitiba','PR','','','','','','','','','','2008-01-14 12:14:13'),
 (15,8009,'Rebeca Garcia Martins','0000-00-00 00:00:00','','046.373.099-21','F',3,'Rua Alferes Poli','294','AP 1402','80.230-090','Centro','Curitiba','PR','','','','','','','','','','2008-01-14 12:14:47'),
 (16,8010,'Juliana Horta','0000-00-00 00:00:00','','','F',3,'Rua Alferes Poli','294','AP 1403','80.230-090','Centro','Curitiba','PR','','','','','','','','','','2008-01-14 12:15:20'),
 (17,8011,'Robson G. Barbosa','0000-00-00 00:00:00','','','M',3,'R. Alferes Poli','294','Ap. 1502','80230-090','Centro','Curitiba','PR','','','','','','','','','','2008-01-14 12:16:12'),
 (18,99001,'Oscar Ricardo Macedo Schmeiske','0000-00-00 00:00:00','','63525160925','M',9,'Avenida Sete de Setembro','6830','AP 1531','80240001','Seminário','Curitiba','PR','4132436467','4132501355','4199776984','','','oscar@ippuc.org.br','oscarschmeiske@gmail.com','','Cliente avulso em serviços de manutenção e suporte.','2008-01-29 17:17:35'),
 (19,99002,'Rinaldo da Silva Rocha','0000-00-00 00:00:00','','69705658900','M',9,'Rua Maria Ludwig Muller','277','','83409540','Jardim Eucalipto','Colombo','PR','','','','','','','','','Parceiro de negocios - Manutenção em monitores, impressoras e micromputadores.','2008-01-29 17:26:55'),
 (20,3001,'Clelia Alice Marson','1971-03-19 00:00:00','60871990','96329858934','F',6,'R. Brasílio Itiberê','2455','AP B25','80230-050','Rebouças','Curitiba','PR','4133334941','','4184253353','','','','','','','2008-01-29 17:31:24'),
 (21,6001,'Iolanda Reis','0000-00-00 00:00:00','','39409538904','F',4,'Avenida. Sete de Setembro','3293','AP 1301','80230-010','Centro','Curitiba','PR','4130194881','','','','','','','','Cunhada da Zeladora do Edificio Roma, dados para operaçõs financeiras.','2008-01-29 17:38:20'),
 (22,2,'IPPUC - Instituto de Pesquisa e Planejamento Urbano de Curitiba','0000-00-00 00:00:00','','76.582.337/0001-16','',10,'Rua Bom Jesus','669','','80035010','Juveve','Curitiba','PR','','4132501300','','','','','','','Cliente de Vendas de equipamentos e de Serviços de suporte e manutenção em servidores.','2008-01-29 18:01:02'),
 (23,99003,'Luis Sergio Rolim de Moura','0000-00-00 00:00:00','','64101835934','M',9,'Rua Irmãs Paulina','5146','','81020230','Novo mundo','Curitiba','PR','','','4192139239','4191823402','','','','','Luis que trabalha com o Paulo Databull.','2008-01-29 18:09:07'),
 (24,99004,'Rauf Alencar de Oliveira','1986-04-09 00:00:00','','05889025945','M',9,'Rua João Gomes ','100','Bloco J  AP 32','80020030','Novo mundo','Curitiba','PR','','4133980456','41','','','rauf@mjtelefonia.com.br','rauf.sk8@gmail.com','','','2008-01-29 18:13:39'),
 (25,2001,'Rose Mari Martins Arruda','0000-00-00 00:00:00','','317.955.799-00','F',7,'Rua Lourenço Pinto','260','AP 103','80010160','Centro','Curitiba','PR','4132224102','4130146906','4194280387','','','','','','Sindica do condominio','2008-01-30 11:49:16'),
 (26,2002,'Jackson M. Nizer','0000-00-00 00:00:00','','032.173.759-80','M',7,'Rua Lourenço Pinto','260','AP 201','80010160','Centro','Curitiba','PR','','','','','','','','','Irmão da Jacqueline Nizer funcionária da Huczok','2008-01-30 11:50:59'),
 (27,2003,'Jorge Gonçalves dos Santos','0000-00-00 00:00:00','','157.097.799-20','M',7,'Rua Lourenço Pinto','260','','80010160','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 11:53:31'),
 (28,2004,'Sergio Vivan','0000-00-00 00:00:00','','460.707.379-20','',7,'Rua Lourenço Pinto','260','AP 303','80010160','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 11:55:04'),
 (29,2005,'Jhony Maciel Oliveira','0000-00-00 00:00:00','','064.214.299-80','M',7,'Rua Lourenço Pinto','260','AP 103B ','80010160','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 11:58:47'),
 (30,2006,'Daisy Mary Reichel','0000-00-00 00:00:00','','008933740-91','F',7,'Rua Lourenço Pinto','260','AP 302','80010160','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 12:04:12'),
 (31,3002,'Luciana Osorio Cavalli','0000-00-00 00:00:00','','043.933.609-07','F',6,'Rua Brasílio Itiberê','2455','AP 23B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','2008-01-30 12:06:50'),
 (32,3003,'Zenildo Costa','0000-00-00 00:00:00','','539.938.029-34','M',6,'Rua Brasílio Itiberê','2455','AP 25B','80230-050','Rebouças','Curitiba','PR','4133334941','4133334941','4184122072','','4133334941','','','','','2008-01-30 12:08:29'),
 (33,3004,'Bernhard Zanker Junior','0000-00-00 00:00:00','','025.833.599-83','M',6,'Rua Brasílio Itiberê','2455','AP 31 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','2008-01-30 12:12:22'),
 (34,3005,'Edison Carlos dos Santos','0000-00-00 00:00:00','','681.977.569-53','',6,'Rua Brasílio Itiberê','2455','AP 43 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','2008-01-30 12:13:16'),
 (35,3006,'Ana Elisa Macagnan','0000-00-00 00:00:00','','897.755.200-10','',6,'Rua Brasílio Itiberê','2455','AP 22 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','2008-01-30 12:14:10'),
 (36,3007,'Fernando Henrique Tremel Bueno','0000-00-00 00:00:00','','050.193.579-79','',6,'Rua Brasílio Itiberê','2455','AP 24 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','2008-01-30 12:15:05'),
 (37,3008,'Adriano Noedinger da Silva','0000-00-00 00:00:00','','030.070.919-69','M',6,'Rua Brasílio Itiberê','2455','AP 43 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','Cunhado do Edison Pudim','2008-01-30 12:16:22'),
 (38,3009,'Eugenio Antonio Guerra','0000-00-00 00:00:00','','553.679.686-00','',6,'Rua Brasílio Itiberê','2455','AP 44 B','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','2008-01-30 12:17:19'),
 (39,3010,'Waldenira Pistori','0000-00-00 00:00:00','','205.384.649-68','F',6,'Rua Brasílio Itiberê','2455','AP 21 BII','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','2008-01-30 12:18:23'),
 (40,3011,'Clayton Cezar Upitis Marloch','0000-00-00 00:00:00','','651.454.109-72','M',6,'Rua Brasílio Itiberê','2455','AP 42 BII','80230-050','Rebouças','Curitiba','PR','','','','','','','','','','2008-01-30 12:19:28'),
 (41,4001,'Vanildo','0000-00-00 00:00:00','','','M',5,'R. 24 de Maio','262','CJ 301','80230-080','Centro','Curitiba','PR','','','','','','','','','Zelador do condominio possue uma sala comercial','2008-01-30 12:33:04'),
 (42,4002,'ACC Aduditoria Contabil S/C Ltda.','0000-00-00 00:00:00','','01.625.401/0001-08','',5,'R. 24 de Maio','262','CJ 1103','80230-080','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 12:35:17'),
 (43,4003,'Francisco C. T. Costa e Silva','0000-00-00 00:00:00','','320.945.319-53','M',5,'R. 24 de Maio','262','CJ 505 / 506','80230-080','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 12:36:52'),
 (44,4004,'Sonia Maria Bressan ','0000-00-00 00:00:00','','237.300.300-78','F',5,'R. 24 de Maio','262','CJ 803','80230-080','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 12:38:03'),
 (45,4005,'Carlos Eduardo','0000-00-00 00:00:00','','','M',5,'R. 24 de Maio','262','CJ 806','80230-080','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 12:38:56'),
 (46,4006,'Saulo Souza e Silva','0000-00-00 00:00:00','','322.416.669-04','M',5,'R. 24 de Maio','262','CJ 402','80230-080','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 12:41:27'),
 (47,4007,'Ursula','0000-00-00 00:00:00','','','',5,'R. 24 de Maio','262','CJ 402','80230-080','Centro','Curitiba','PR','','','','','','','','','Atendente do consultório do Saulo.','2008-01-30 12:42:22'),
 (48,4008,'R. Huczok Consulting Ltda.','0000-00-00 00:00:00','','00.058.094/0001-50','',5,'R. 24 de Maio','262','CJ 1001 / 1002','80230-080','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 12:44:30'),
 (49,4009,'DIVALPAR Participação Societária Ltda.','0000-00-00 00:00:00','','76.641.265/0001-30','',5,'Rua 24 de Maio','262','CJ 1104','80230-080','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 12:58:07'),
 (50,4010,'Rogoski & Soares C. A. Elet. Ltda.','0000-00-00 00:00:00','','08.182.364/0001-41','',5,'Rua 24 de Maio','262','CJ 1201','80230-080','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 13:12:50'),
 (51,4011,'Olimpus Agência de Viagem e Turismo Ltda.','0000-00-00 00:00:00','','01.134.309/0001-37','',5,'Rua 24 de Maio','262','CJ 1202','80230-080','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 13:17:03'),
 (52,4012,'EPRON Serviço de Informática S/C Ltda.','0000-00-00 00:00:00','','01.766.736/0001-38','',5,'Rua 24 de Maio','262','CJ 605','80230-080','Centro','Curitiba','PR','','','','','','','','','Ivan desenvolvedor de software para a Huczok.','2008-01-30 14:40:51'),
 (53,5001,'Marisa Helena da Costa Serafin','0000-00-00 00:00:00','','471.972.509-00','',1,'Av. Sete de Setembro','3272','AP 01','80230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 14:42:51'),
 (54,5002,'Marisângela Pacheco Brittes','0000-00-00 00:00:00','','906.561.219-04','F',1,'Av. Sete de Setembro','3272','AP 03','80230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 14:46:08'),
 (55,5003,'COMPOR Arquitetura e Construção Ltda.','0000-00-00 00:00:00','','79.110.086/0001-65','',1,'Av. Sete de Setembro','3272','CJ 04','80230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 19:31:18'),
 (56,5004,'Eliana Nascimento','0000-00-00 00:00:00','','872.560.296-91','',1,'Av. Sete de Setembro','3272','AP 06','80230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 19:33:38'),
 (57,5005,'Djalma Jacinto da Silva Filho','0000-00-00 00:00:00','','738.669.389-34','M',1,'Av. Sete de Setembro','3272','AP 08','80230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 19:37:09'),
 (58,5006,'Isabel Jacomel','0000-00-00 00:00:00','','583.674.629-04','F',1,'Av. Sete de Setembro','3272','AP 10','80230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 19:42:46'),
 (59,5007,'Celso Amaral Poletti','0000-00-00 00:00:00','','008.436.739-31','M',1,'Av. Sete de Setembro','3272','AP 12','80230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 19:45:36'),
 (60,5008,'Claiton Estacionamento','0000-00-00 00:00:00','','','M',1,'Av. Sete de Setembro','3272','Estacionamento','80230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-30 19:46:11'),
 (61,6002,'Matilde Alves da Cunha Silva','0000-00-00 00:00:00','','153.857.058-02','F',4,'Av. Sete de Setembro','3293','AP 103','80230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-31 13:52:24'),
 (62,6003,'Wallace Mendes Cordeiro','0000-00-00 00:00:00','','020.916.769-69','M',4,'Av. Sete de Setembro','3293','AP 104','80.230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-31 13:54:27'),
 (63,6004,'Natalia','0000-00-00 00:00:00','','','F',4,'Av. Sete de Setembro','3293','AP 108','80.230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-31 13:56:28'),
 (64,6005,'Robson Roberto da Silva','0000-00-00 00:00:00','','048.468.029-30','M',4,'Av. Sete de Setembro','3293','AP 208','80.230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-31 13:57:38'),
 (65,6006,'Bruna Amaral Monteiro','0000-00-00 00:00:00','','','F',4,'Av. Sete de Setembro','3293','AP 307','80.230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-31 13:58:30'),
 (66,6007,'Luana Aparecida Dias Mota','0000-00-00 00:00:00','','342.496.088-83','F',4,'Av. Sete de Setembro','3293','AP 405','80.230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-31 14:00:04'),
 (67,6008,'Katia Cristina Zardo','0000-00-00 00:00:00','','','F',4,'Av. Sete de Setembro','3293','AP 602','80.230-010','Centro','Curitiba','PR','','','','','','','','','','2008-01-31 14:00:52');
/*!40000 ALTER TABLE `clientes_bkp` ENABLE KEYS */;


--
-- Definition of table `contatos`
--

DROP TABLE IF EXISTS `contatos`;
CREATE TABLE `contatos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nome` varchar(300) collate latin1_general_ci NOT NULL,
  `empresa` varchar(300) collate latin1_general_ci NOT NULL,
  `tipo` varchar(300) collate latin1_general_ci NOT NULL,
  `edificio` varchar(300) collate latin1_general_ci NOT NULL,
  `endereco` varchar(300) collate latin1_general_ci NOT NULL,
  `numero` varchar(300) collate latin1_general_ci NOT NULL,
  `complemento` varchar(300) collate latin1_general_ci NOT NULL,
  `bairro` varchar(300) collate latin1_general_ci NOT NULL,
  `cep` varchar(300) collate latin1_general_ci NOT NULL,
  `cidade` varchar(300) collate latin1_general_ci NOT NULL,
  `uf` varchar(300) collate latin1_general_ci NOT NULL,
  `telefone1` varchar(300) collate latin1_general_ci NOT NULL,
  `telefone2` varchar(300) collate latin1_general_ci NOT NULL,
  `celular1` varchar(300) collate latin1_general_ci NOT NULL,
  `celular2` varchar(300) collate latin1_general_ci NOT NULL,
  `email1` varchar(300) collate latin1_general_ci NOT NULL,
  `email2` varchar(300) collate latin1_general_ci NOT NULL,
  `observacoes` text collate latin1_general_ci NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `contatos`
--

/*!40000 ALTER TABLE `contatos` DISABLE KEYS */;
INSERT INTO `contatos` (`id`,`nome`,`empresa`,`tipo`,`edificio`,`endereco`,`numero`,`complemento`,`bairro`,`cep`,`cidade`,`uf`,`telefone1`,`telefone2`,`celular1`,`celular2`,`email1`,`email2`,`observacoes`,`datacadastro`) VALUES 
 (1,'Ederson','Tenda Equipamentos Wireless','Contato comercial','','','','','','','','PR','','','9987-0696','','','','28/01/2008 14:37 - Retornar ligação para agendar horário p/ reunião','0000-00-00 00:00:00'),
 (2,'Marco Henrique','','Possível cliente','','','','','Portão','','Curitiba','PR','','','8407-3966','','','','Possivel cliente no portão; Prédio com aproximadamente 100 apartamentos. Vai falar com a síndica e com vizinhos e mostrar nosso panfleto.','0000-00-00 00:00:00'),
 (3,'Paula','Nextel','Contato Comercial','','','','','','','','PR','0800 900 901','','','','','','Plano Radio Ilimitado + Telefonia Ilimitada\r\n- Radio ilimitado\r\n- R$ 0,60 por minuto\r\n- Mensalidade: R$ 82,00\r\n\r\nPlano Radio Ilimitado + Telefonia Bloqueada\r\n- Radio Ilimitado\r\n- Compra de créditos para fazer ligações\r\n- Mensalidade: R$ 92,00\r\n\r\nAparelhos:\r\n- Alugado: o mais simples, Motorola i290, custa 4x de R$ 46,00 de adesão e mensalidade de R$ 13,00\r\n- À parte: Precisa comprar o chip por R$ 39,90\r\n\r\nDá pra entrar em contato via 0800 e marcar visita de um consultor.','2008-01-29 17:44:08'),
 (4,'Liziane','','contato','Edificio Royal','Av Silva Jardim','624','','','','','PR','4130132696','','','','','','','2008-02-20 11:22:52'),
 (5,'Zanoni','','Sindico','Edificio Residencial Vera Cruz','Rua VX de Novembro','1070','AP 22','Centro','','São José dos Pinhais','PR','4132822659','','','','','','Primeira visita efetuada - reuniao com o Sr. Zanoni\r\nCliente indicado pela Rita da DIVALPAR.\r\n','2008-02-20 11:24:50'),
 (6,'Mercador Fomento Mercantil','','parceiro financeiro','','Rua NUnes Machado','','CJ 803','Centro','','','PR','','','','','','','Dados de conta bancaria:\r\nCNPJ: 04.543.073/0001-80\r\nBanco: HSBC\r\nAgencia: 0054\r\nConta Corrente: 28.487-75\r\n\r\n','2008-02-20 11:45:29'),
 (7,'Bruna','','possivel cliente','Itaperussuna','','','','','','','PR','3603-2092','','','','','','','2008-02-20 13:04:48'),
 (8,'Carlos ou Simone','','possivel cliente','Parresh','','','AP. 201','','','','PR','3222-9077','','8806-7961','8847-4266','','','','2008-02-01 13:21:40'),
 (9,'Bruno Loxaki moracani','','contato','Ed Napoli','silva jardim','','','','','','PR','4133248123','','','','','','','2008-02-01 14:13:34'),
 (10,'Andreia - ed aries ','','cliente','ed aries','','','ap 1201','','','','PR','4132436852','','','','','','','2008-03-01 17:51:12'),
 (11,'Odir Alves','','cliente','Edf Bassa','Rua Santana','590','AP 5','Jardim Botanico','','','PR','4132633856','','','','','','Sindico = AP 2 = ','2008-03-04 19:09:53');
/*!40000 ALTER TABLE `contatos` ENABLE KEYS */;


--
-- Definition of table `contratos`
--

DROP TABLE IF EXISTS `contratos`;
CREATE TABLE `contratos` (
  `id` int(11) NOT NULL auto_increment,
  `ativo` int(11) NOT NULL,
  `codigo` varchar(200) collate latin1_general_ci NOT NULL,
  `provedor_id` int(11) NOT NULL,
  `plano_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `grupo_id` int(11) NOT NULL,
  `descricao` text collate latin1_general_ci NOT NULL,
  `data_inicio` date NOT NULL,
  `data_termino` date NOT NULL,
  `periodo_id` int(11) NOT NULL,
  `vencimento_padrao` int(11) NOT NULL default '10',
  `observacoes` text collate latin1_general_ci NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `contratos`
--

/*!40000 ALTER TABLE `contratos` DISABLE KEYS */;
INSERT INTO `contratos` (`id`,`ativo`,`codigo`,`provedor_id`,`plano_id`,`cliente_id`,`grupo_id`,`descricao`,`data_inicio`,`data_termino`,`periodo_id`,`vencimento_padrao`,`observacoes`,`datacadastro`) VALUES 
 (5,1,'',5,1,7,3,'','2008-01-14','2009-01-14',0,10,'','2008-01-14 12:24:46'),
 (6,1,'',5,1,8,3,'','2008-01-14','2009-01-14',0,10,'','2008-01-14 13:31:58'),
 (7,1,'',5,1,9,3,'','2008-01-14','2009-01-14',0,10,'','2008-01-14 13:35:10'),
 (8,1,'',5,1,10,3,'','2008-01-14','2009-01-14',0,10,'','2008-01-14 13:35:36'),
 (9,1,'',5,1,11,3,'','2008-01-14','2009-01-14',0,10,'','2008-01-15 12:12:42'),
 (10,1,'',5,6,12,3,'','2008-01-14','2009-01-14',0,10,'','2008-01-15 12:14:09'),
 (11,1,'',5,1,16,3,'','2008-02-20','0000-00-00',0,10,'','2008-02-01 17:07:47'),
 (12,1,'',5,1,14,3,'','2008-02-20','0000-00-00',0,10,'','2008-02-01 17:08:20'),
 (13,1,'',5,1,17,3,'','2008-02-01','0000-00-00',0,10,'','2008-02-01 17:27:37'),
 (14,1,'',5,1,13,3,'','2008-02-01','0000-00-00',0,10,'','2008-02-01 17:28:49'),
 (15,1,'',5,1,15,3,'','2008-02-01','0000-00-00',0,10,'','2008-02-01 17:29:33');
/*!40000 ALTER TABLE `contratos` ENABLE KEYS */;


--
-- Definition of table `estacoes`
--

DROP TABLE IF EXISTS `estacoes`;
CREATE TABLE `estacoes` (
  `id` int(11) NOT NULL auto_increment,
  `contrato_id` int(11) NOT NULL,
  `hostname` varchar(200) collate latin1_general_ci NOT NULL,
  `ip` varchar(11) collate latin1_general_ci NOT NULL,
  `mac_address` varchar(17) collate latin1_general_ci NOT NULL,
  `observacoes` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `estacoes`
--

/*!40000 ALTER TABLE `estacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `estacoes` ENABLE KEYS */;


--
-- Definition of table `funcoes`
--

DROP TABLE IF EXISTS `funcoes`;
CREATE TABLE `funcoes` (
  `id` int(11) NOT NULL auto_increment,
  `pai` int(11) NOT NULL default '0',
  `posicao` int(11) NOT NULL default '0',
  `nome` varchar(100) NOT NULL default '',
  `ativo` tinyint(1) NOT NULL default '0',
  `restrito` tinyint(1) NOT NULL default '0',
  `link` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `funcoes`
--

/*!40000 ALTER TABLE `funcoes` DISABLE KEYS */;
INSERT INTO `funcoes` (`id`,`pai`,`posicao`,`nome`,`ativo`,`restrito`,`link`) VALUES 
 (1,0,-10,'Admins',1,0,'javascript:;'),
 (6,0,1,'Provedores',1,0,'javascript:;'),
 (20,0,2,'Contatos',1,0,'javascript:;'),
 (4,0,3,'Clientes',1,0,'javascript:;'),
 (10,0,4,'Grupos',1,0,'javascript:;'),
 (13,0,5,'Planos',1,0,'javascript:;'),
 (16,0,6,'Contratos',1,0,'javascript:;'),
 (19,0,7,'Estações',0,0,'javascript:;'),
 (24,0,15,'Chamados',1,0,'javascript:;'),
 (27,0,7,'Títulos',1,0,'cobrancas.php'),
 (2,1,1,'Cadastro',1,1,'administradores.php?modo=cad'),
 (3,1,2,'Manutenção',1,0,'administradores.php'),
 (5,4,1,'Cadastro',1,0,'clientes.php?modo=cad'),
 (9,4,2,'Manutenção',1,0,'clientes.php?modo=lst'),
 (7,6,1,'Cadastro',1,0,'provedores.php?modo=cad'),
 (8,6,2,'Manutenção',1,0,'provedores.php?modo=lst'),
 (11,10,1,'Cadastro',1,0,'grupos.php?modo=cad'),
 (12,10,2,'Manutenção',1,0,'grupos.php?modo=lst'),
 (14,13,1,'Cadastro',1,0,'planos.php?modo=cad'),
 (15,13,2,'Manutenção',1,0,'planos.php?modo=lst'),
 (17,16,1,'Cadastro',1,0,'contratos.php?modo=cad'),
 (18,16,2,'Manutenção',1,0,'contratos.php?modo=lst'),
 (21,20,1,'Cadastro',1,0,'contatos.php?modo=cad'),
 (22,20,2,'Manutenção',1,0,'contatos.php?modo=lst'),
 (25,24,1,'Abrir Chamado',1,0,'chamados.php?modo=cad'),
 (26,24,2,'Manutenção',0,0,'chamados.php?modo=lst'),
 (28,27,1,'Cadastrar',1,0,'cobrancas.php?modo=cad'),
 (29,27,10,'Períodos - Cadastrar',1,0,'periodos.php?modo=cad'),
 (30,27,11,'Períodos - Manutenção',1,0,'periodos.php?modo=lst'),
 (31,0,1000,'Logs',1,0,'javascript:;'),
 (32,31,1,'SQL`s',1,0,'logs.php?modo=sql'),
 (33,31,2,'Administrativo',1,0,'logs.php?modo=admin');
/*!40000 ALTER TABLE `funcoes` ENABLE KEYS */;


--
-- Definition of table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
CREATE TABLE `grupos` (
  `id` int(11) NOT NULL auto_increment,
  `nome_padrao` varchar(100) collate latin1_general_ci NOT NULL,
  `codigo` varchar(200) collate latin1_general_ci NOT NULL,
  `tipo` int(11) NOT NULL,
  `nome` varchar(200) collate latin1_general_ci NOT NULL,
  `endereco` varchar(300) collate latin1_general_ci NOT NULL,
  `numero` varchar(100) collate latin1_general_ci NOT NULL,
  `bairro` varchar(300) collate latin1_general_ci NOT NULL,
  `cep` varchar(300) collate latin1_general_ci NOT NULL,
  `cidade` varchar(300) collate latin1_general_ci NOT NULL,
  `uf` varchar(2) collate latin1_general_ci NOT NULL,
  `observacoes` text collate latin1_general_ci NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `grupos`
--

/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` (`id`,`nome_padrao`,`codigo`,`tipo`,`nome`,`endereco`,`numero`,`bairro`,`cep`,`cidade`,`uf`,`observacoes`,`datacadastro`) VALUES 
 (1,'EdOdoni','05',1,'Edifício Odoni','Av. Sete de Setembro','3272','Centro','80230-010','Curitiba','PR','','2007-11-19 10:20:51'),
 (3,'EdMarajo','08',1,'Edifício Residencial Marajó','Rua Alferes Poli','294','Centro','80.230-090','Curitiba','PR','','2007-11-19 11:26:41'),
 (4,'EdRoma','06',1,'Edifício Roma','Av. Sete de Setembro','3293','Centro','80.230-010','Curitiba','PR','','2008-01-28 19:35:15'),
 (5,'EdWashington','04',1,'Edifício Comercial Washington','R. 24 de Maio','262','Centro','80230-080','Curitiba','PR','','2008-01-29 12:12:59'),
 (6,'EdBItibere','03',1,'Condominio Residencial Brasilio Itiberê','Rua Brasílio Itiberê','2455','Rebouças','80230-050','Curitiba','PR','','2008-01-29 12:15:14'),
 (7,'EdLPinto','02',1,'Edificio Residencial Lourenço Pinto','Rua Lourenço Pinto','260','Centro','80010160','Curitiba','PR','','2008-01-29 17:06:58'),
 (8,'EdAries','09',1,'Condominio Residencial Aries','Avenida Nossa Senhora Aparecida','501','Seminário','80440000','Curitiba','PR','','2008-01-29 17:10:06'),
 (9,'Outros','99',99,'Clientes Avulsos','','','','','','PR','','2008-01-29 17:14:17'),
 (10,'Empresas','00',2,'Clientes Empresarial','','','','','','PR','Grupo de clientes empresarial.','2008-01-29 17:40:31'),
 (11,'EdBCapanema','51',1,'Condominio Residencial Barão de Capanema','','','Jardim Botânico','','Curitiba','PR','','2008-01-31 15:25:45'),
 (12,'EdOrionis','101',1,'Edifício Residencial Orionis','R Marechal Otávio Saldanha Mazza','7777','Pinheirinho','81150060','Curitiba','PR','Tel portaria 3247-0879\r\n\r\nSindica Alexandra _tel esposo _ 9187 9082_','2008-02-01 16:02:46');
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;


--
-- Definition of table `grupos_tipos`
--

DROP TABLE IF EXISTS `grupos_tipos`;
CREATE TABLE `grupos_tipos` (
  `id` int(11) NOT NULL auto_increment,
  `tipo` varchar(200) collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `grupos_tipos`
--

/*!40000 ALTER TABLE `grupos_tipos` DISABLE KEYS */;
INSERT INTO `grupos_tipos` (`id`,`tipo`) VALUES 
 (1,'Condomínio'),
 (2,'Empresa'),
 (99,'Outros');
/*!40000 ALTER TABLE `grupos_tipos` ENABLE KEYS */;


--
-- Definition of table `logs_admin`
--

DROP TABLE IF EXISTS `logs_admin`;
CREATE TABLE `logs_admin` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `login` varchar(20) collate latin1_general_ci NOT NULL,
  `mensagem` text collate latin1_general_ci NOT NULL,
  `query` text collate latin1_general_ci NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=277 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `logs_admin`
--

/*!40000 ALTER TABLE `logs_admin` DISABLE KEYS */;
INSERT INTO `logs_admin` (`id`,`login`,`mensagem`,`query`,`datacadastro`) VALUES 
 (1,'sergio','Login','','2008-02-20 09:08:25'),
 (2,'sergio','Login','','2008-02-20 10:00:43'),
 (3,'sergio','Cadastro Cliente ID=108 Nome=Marcelo','','2008-02-20 10:04:01'),
 (4,'sergio','Alterado Cliente ID=80 Nome=Morgana','','2008-02-20 10:06:39'),
 (5,'sergio','Login','','2008-02-20 10:53:50'),
 (6,'sergio','Cadastro Cliente ID=109 Nome=GE Money','','2008-02-20 10:56:20'),
 (7,'sergio','Alterado Cliente ID=14 Nome=Simone Vivan','','2008-02-20 10:56:58'),
 (8,'sergio','Cadastro Cliente ID=110 Nome=Ricardo - PRT','','2008-02-20 11:00:31'),
 (9,'sergio','Cadastro Cliente ID=111 Nome=Mercador Fomento Mercantil LTDA.','','2008-02-20 11:03:31'),
 (10,'sergio','Alterado Cliente ID=43 Nome=Francisco C. T. Costa e Silva','','2008-02-20 11:04:51'),
 (11,'antonio','Login','','2008-02-20 11:21:12'),
 (12,'sergio','Cadastro Cliente ID=112 Nome=Fontoura e Silva Com. de Informática','','2008-02-20 11:21:55'),
 (13,'sergio','Cadastro Cliente ID=113 Nome=Paraná Despachante','','2008-02-20 11:25:23'),
 (14,'antonio','Logout','','2008-02-20 12:08:47'),
 (15,'antonio','Login','','2008-02-20 12:08:58'),
 (16,'antonio','Cadastro Cliente ID=114 Nome=Ivan de Oliveira Mota','','2008-02-20 12:13:22'),
 (17,'antonio','Alterado Cliente ID=85 Nome=José Carlos de Lima','','2008-02-20 12:17:34'),
 (18,'antonio','Alterado Cliente ID=14 Nome=Simone Vivan','','2008-02-20 12:18:25'),
 (19,'sergio','Cadastro Cliente ID=115 Nome=Federação Paranaense de Ginástica','','2008-02-20 12:58:41'),
 (20,'sergio','Alterado Cliente ID=105 Nome=Silvia Aparecida Pereira','','2008-02-20 13:00:26'),
 (21,'sergio','Alterado Cliente ID=83 Nome=Carlos Roberto dos Santos Fernandes','','2008-02-20 13:08:38'),
 (22,'sergio','Alterado Cliente ID=65 Nome=Bruna Amaral Monteiro','','2008-02-20 13:09:54'),
 (23,'sergio','Alterado Cliente ID=83 Nome=Carlos Roberto dos Santos Fernandes','','2008-02-20 13:10:59'),
 (24,'sergio','Cadastro Cliente ID=116 Nome=Jonas','','2008-02-20 13:13:58'),
 (25,'sergio','Cadastro Cliente ID=117 Nome=BV Financeira - Daniel Moreira','','2008-02-01 13:16:27'),
 (26,'sergio','Cadastro Cliente ID=118 Nome=B2 Informática','','2008-02-01 13:17:54'),
 (27,'sergio','Cadastro Cliente ID=119 Nome=Antonia - Síndica','','2008-02-01 13:19:33'),
 (28,'sergio','Cadastro Cliente ID=120 Nome=Elenara Beatriz Fontana','','2008-02-01 13:25:11'),
 (29,'sergio','Login','','2008-02-01 17:25:28'),
 (30,'sergio','Login','','2008-02-23 11:47:28'),
 (31,'sergio','Login','','2008-02-27 11:16:27'),
 (32,'sergio','Login','','2008-02-27 11:40:22'),
 (33,'antonio','Login','','2008-02-27 11:59:38'),
 (34,'antonio','Alterado Cliente ID=106 Nome=Raphaela de Oliveira','','2008-02-27 15:36:09'),
 (35,'antonio','Logout','','2008-02-27 15:45:35'),
 (36,'antonio','Login','','2008-02-28 08:54:25'),
 (37,'antonio','Alterado Cliente ID=106 Nome=Rosina Helena dos Santos','','2008-02-28 08:58:13'),
 (38,'antonio','Alterado Cliente ID=106 Nome=Rosina Helena dos Santos','','2008-02-28 08:58:37'),
 (39,'antonio','Cadastro Cliente ID=121 Nome=Jeane Margarete Rucinski','','2008-02-28 09:01:13'),
 (40,'antonio','Alterado Cliente ID=106 Nome=Rosina Helena dos Santos','','2008-02-28 10:10:22'),
 (41,'antonio','Logout','','2008-02-28 10:19:59'),
 (42,'sergio','Login','','2008-03-01 17:03:31'),
 (43,'sergio','Alterado Cliente ID=93 Nome=Everson Edson do Prado','','2008-03-01 17:34:15'),
 (44,'sergio','Alterado Cliente ID=65 Nome=Bruna Amaral Monteiro','','2008-03-01 17:35:47'),
 (45,'sergio','Alterado Cliente ID=39 Nome=Waldenira Pistori','','2008-03-01 17:37:21'),
 (46,'sergio','Alterado Cliente ID=20 Nome=Clelia Alice Marson','','2008-03-01 17:41:44'),
 (47,'sergio','Alterado Cliente ID=38 Nome=Eugenio Antonio Guerra','','2008-03-01 17:43:54'),
 (48,'sergio','Alterado Cliente ID=38 Nome=Eugenio Antonio Guerra','','2008-03-01 17:44:44'),
 (49,'sergio','Alterado Cliente ID=83 Nome=Carlos Roberto dos Santos Fernandes','','2008-03-01 17:46:22'),
 (50,'sergio','Alterado Cliente ID=116 Nome=Jonas','','2008-03-01 20:33:00'),
 (51,'sergio','Alterado Cliente ID=67 Nome=Katia Cristina Zardo','','2008-03-01 20:33:17'),
 (52,'sergio','Alterado Cliente ID=98 Nome=Adenir Farias','','2008-03-01 20:37:00'),
 (53,'sergio','Alterado Cliente ID=30 Nome=Daisy Mary Reichel','','2008-03-01 20:37:10'),
 (54,'sergio','Alterado Cliente ID=26 Nome=Jackson M. Nizer','','2008-03-01 20:37:18'),
 (55,'sergio','Alterado Cliente ID=29 Nome=Jhony Maciel Oliveira','','2008-03-01 20:37:29'),
 (56,'sergio','Alterado Cliente ID=75 Nome=Amanda Tieppo','','2008-03-01 20:38:08'),
 (57,'sergio','Alterado Cliente ID=65 Nome=Bruna Amaral Monteiro','','2008-03-01 20:38:31'),
 (58,'sergio','Alterado Cliente ID=77 Nome=Fabiana Reis','','2008-03-01 20:38:39'),
 (59,'sergio','Cadastro Cliente ID=122 Nome=teste','','2008-03-01 20:45:09'),
 (60,'antonio','Login','','2008-03-03 09:50:21'),
 (61,'antonio','Login','','2008-03-04 00:34:03'),
 (62,'antonio','Logout','','2008-03-04 01:00:38'),
 (63,'antonio','Login','','2008-03-04 08:47:34'),
 (64,'sergio','Login','','2008-03-04 09:00:49'),
 (65,'antonio','Alterado Cliente ID=17 Nome=Robson Garcia Barbosa','','2008-03-04 10:43:49'),
 (66,'antonio','Alterado Cliente ID=71 Nome=Rita Helena Zimmermann','','2008-03-04 10:49:41'),
 (67,'antonio','Alterado Cliente ID=68 Nome=Rose Cristina Neves','','2008-03-04 11:10:17'),
 (68,'antonio','Alterado Cliente ID=65 Nome=Bruna Amaral Monteiro','','2008-03-04 11:58:55'),
 (69,'antonio','Alterado Cliente ID=65 Nome=Bruna Amaral Monteiro','','2008-03-04 12:13:26'),
 (70,'antonio','Alterado Cliente ID=65 Nome=Bruna Amaral Monteiro','','2008-03-04 12:13:56'),
 (71,'antonio','Logout','','2008-03-05 00:28:43'),
 (72,'sergio','Login','','2008-03-05 08:34:28'),
 (73,'sergio','Alterado Cliente ID=73 Nome=Felipe Lukacievick Barbosa','','2008-03-05 09:02:41'),
 (74,'sergio','Alterado Cliente ID=73 Nome=Felipe Lukacievick Barbosa','','2008-03-05 09:06:22'),
 (75,'sergio','Alterado Cliente ID=73 Nome=Felipe Lukacievick Barbosa','','2008-03-05 09:17:17'),
 (76,'sergio','Alterado Cliente ID=70 Nome=Leonardo Raupp Matta','','2008-03-05 09:22:19'),
 (77,'sergio','Alterado Cliente ID=59 Nome=Celso Amaral Poletti','','2008-03-05 09:37:18'),
 (78,'sergio','Alterado Cliente ID=66 Nome=Luana Aparecida Dias Mota','','2008-03-05 09:38:46'),
 (79,'sergio','Alterado Cliente ID=61 Nome=Matilde Alves da Cunha Silva','','2008-03-05 09:39:07'),
 (80,'sergio','Alterado Cliente ID=72 Nome=Mellina Franco Oliveira Canto','','2008-03-05 09:39:23'),
 (81,'sergio','Alterado Cliente ID=63 Nome=Natalia','','2008-03-05 09:39:36'),
 (82,'sergio','Alterado Cliente ID=63 Nome=Natalia','','2008-03-05 09:39:49'),
 (83,'sergio','Alterado Cliente ID=71 Nome=Rita Helena Zimmermann','','2008-03-05 09:40:20'),
 (84,'sergio','Alterado Cliente ID=64 Nome=Robson Roberto da Silva','','2008-03-05 09:40:49'),
 (85,'sergio','Alterado Cliente ID=76 Nome=Thiago Carli','','2008-03-05 09:41:05'),
 (86,'sergio','Alterado Cliente ID=62 Nome=Wallace Mendes Cordeiro','','2008-03-05 09:41:20'),
 (87,'sergio','Alterado Cliente ID=121 Nome=Jeane Margarete Rucinski','','2008-03-05 09:41:44'),
 (88,'sergio','Alterado Cliente ID=21 Nome=Iolanda Reis','','2008-03-05 09:42:07'),
 (89,'sergio','Alterado Cliente ID=69 Nome=George Galli','','2008-03-05 09:42:28'),
 (90,'sergio','Alterado Cliente ID=74 Nome=Fernando Cesar Alves da Silva','','2008-03-05 09:42:41'),
 (91,'sergio','Alterado Cliente ID=22 Nome=IPPUC - Instituto de Pesquisa e Planejamento Urbano de Curitiba','','2008-03-05 09:44:27'),
 (92,'sergio','Alterado Cliente ID=109 Nome=GE Money','','2008-03-05 09:44:53'),
 (93,'sergio','Alterado Cliente ID=113 Nome=Paraná Despachante','','2008-03-05 09:45:07'),
 (94,'sergio','Alterado Cliente ID=117 Nome=BV Financeira - Daniel Moreira','','2008-03-05 09:46:46'),
 (95,'sergio','Alterado Cliente ID=118 Nome=B2 Informática','','2008-03-05 09:51:53'),
 (96,'sergio','Alterado Cliente ID=15 Nome=Rebeca Garcia Martins','','2008-03-05 09:58:09'),
 (97,'sergio','Alterado Cliente ID=11 Nome=Mayara Cristina Garcia Machuca ','','2008-03-05 09:58:22'),
 (98,'antonio','Login','','2008-03-05 14:13:00'),
 (99,'antonio','Alterado Cliente ID=59 Nome=Celso Amaral Poletti','','2008-03-05 14:13:33'),
 (100,'antonio','Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda','','2008-03-05 14:14:30'),
 (101,'antonio','Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda','','2008-03-05 14:14:49'),
 (102,'antonio','Alterado Cliente ID=91 Nome=Adriano ','','2008-03-05 15:28:20'),
 (103,'antonio','Alterado Cliente ID=88 Nome=Anderson Augusto Fillus','','2008-03-05 15:28:30'),
 (104,'antonio','Alterado Cliente ID=83 Nome=Carlos Roberto dos Santos Fernandes','','2008-03-05 15:28:39'),
 (105,'antonio','Alterado Cliente ID=79 Nome=Henderson Ezequiel Rudiniski','','2008-03-05 15:28:48'),
 (106,'antonio','Alterado Cliente ID=79 Nome=Henderson Ezequiel Rudiniski','','2008-03-05 15:28:53'),
 (107,'antonio','Alterado Cliente ID=114 Nome=Ivan de Oliveira Mota','','2008-03-05 15:29:13'),
 (108,'antonio','Alterado Cliente ID=86 Nome=Ivana Rubio Colin','','2008-03-05 15:29:26'),
 (109,'antonio','Alterado Cliente ID=89 Nome=Jefferson Olinger de Souza','','2008-03-05 15:29:35'),
 (110,'antonio','Alterado Cliente ID=63 Nome=Rubia Souza Pimenta de Padua','','2008-03-05 15:59:16'),
 (111,'antonio','Alterado Cliente ID=55 Nome=COMPOR Arquitetura e Construção Ltda.','','2008-03-05 18:49:41'),
 (112,'antonio','Alterado Cliente ID=57 Nome=Djalma Jacinto da Silva Filho','','2008-03-05 18:49:52'),
 (113,'antonio','Alterado Cliente ID=56 Nome=Eliana Nascimento','','2008-03-05 18:50:03'),
 (114,'antonio','Alterado Cliente ID=58 Nome=Isabel Jacomel','','2008-03-05 18:50:12'),
 (115,'antonio','Alterado Cliente ID=53 Nome=Marisa Helena da Costa Serafin','','2008-03-05 18:50:20'),
 (116,'antonio','Alterado Cliente ID=54 Nome=Marisângela Pacheco Brittes','','2008-03-05 18:50:29'),
 (117,'antonio','Alterado Cliente ID=8 Nome=Daniel Hiroshi Nielsen Yabu','','2008-03-05 18:50:44'),
 (118,'antonio','Alterado Cliente ID=10 Nome=Felipe Augusto Kubis','','2008-03-05 18:50:54'),
 (119,'antonio','Alterado Cliente ID=12 Nome=Graciele Razera','','2008-03-05 18:51:02'),
 (120,'antonio','Alterado Cliente ID=16 Nome=Juliana Horta','','2008-03-05 18:51:10'),
 (121,'antonio','Alterado Cliente ID=13 Nome=Lucas Nunes da Silveira','','2008-03-05 18:51:18'),
 (122,'antonio','Alterado Cliente ID=9 Nome=Robson Lara Moreira','','2008-03-05 18:51:28'),
 (123,'antonio','Alterado Cliente ID=14 Nome=Simone Vivan','','2008-03-05 18:51:36'),
 (124,'antonio','Alterado Cliente ID=7 Nome=Tulio Hofmann Filho','','2008-03-05 18:51:44'),
 (125,'antonio','Alterado Cliente ID=63 Nome=Rubia Souza Pimenta de Padua','','2008-03-05 18:52:09'),
 (126,'antonio','Alterado Cliente ID=42 Nome=ACC Aduditoria Contabil S/C Ltda.','','2008-03-05 18:53:01'),
 (127,'antonio','Alterado Cliente ID=45 Nome=Carlos Eduardo','','2008-03-05 18:53:11'),
 (128,'antonio','Alterado Cliente ID=49 Nome=DIVALPAR Participação Societária Ltda.','','2008-03-05 18:53:20'),
 (129,'antonio','Alterado Cliente ID=52 Nome=EPRON Serviço de Informática S/C Ltda.','','2008-03-05 18:53:29'),
 (130,'antonio','Alterado Cliente ID=43 Nome=Francisco C. T. Costa e Silva','','2008-03-05 18:53:45'),
 (131,'antonio','Alterado Cliente ID=51 Nome=Olimpus Agência de Viagem e Turismo Ltda.','','2008-03-05 18:53:54'),
 (132,'antonio','Alterado Cliente ID=48 Nome=R. Huczok Consulting Ltda.','','2008-03-05 18:54:14'),
 (133,'antonio','Alterado Cliente ID=50 Nome=Rogoski & Soares C. A. Elet. Ltda.','','2008-03-05 18:54:25'),
 (134,'antonio','Alterado Cliente ID=46 Nome=Saulo Souza e Silva','','2008-03-05 18:54:32'),
 (135,'antonio','Alterado Cliente ID=44 Nome=Sonia Maria Bressan ','','2008-03-05 18:54:40'),
 (136,'antonio','Alterado Cliente ID=47 Nome=Ursula','','2008-03-05 18:54:49'),
 (137,'antonio','Alterado Cliente ID=41 Nome=Vanildo','','2008-03-05 18:54:57'),
 (138,'antonio','Alterado Cliente ID=37 Nome=Adriano Noedinger da Silva','','2008-03-05 18:55:14'),
 (139,'antonio','Alterado Cliente ID=35 Nome=Ana Elisa Macagnan','','2008-03-05 18:55:23'),
 (140,'antonio','Alterado Cliente ID=33 Nome=Bernhard Zanker Junior','','2008-03-05 18:55:32'),
 (141,'antonio','Alterado Cliente ID=40 Nome=Clayton Cezar Upitis Marloch','','2008-03-05 18:55:40'),
 (142,'antonio','Alterado Cliente ID=20 Nome=Clelia Alice Marson','','2008-03-05 18:55:53'),
 (143,'antonio','Alterado Cliente ID=37 Nome=Adriano Noedinger da Silva','','2008-03-05 18:56:29'),
 (144,'antonio','Alterado Cliente ID=34 Nome=Edison Carlos dos Santos','','2008-03-05 18:56:43'),
 (145,'antonio','Alterado Cliente ID=38 Nome=Eugenio Antonio Guerra','','2008-03-05 18:56:52'),
 (146,'antonio','Alterado Cliente ID=36 Nome=Fernando Henrique Tremel Bueno','','2008-03-05 18:57:03'),
 (147,'antonio','Alterado Cliente ID=31 Nome=Luciana Osorio Cavalli','','2008-03-05 18:57:14'),
 (148,'antonio','Alterado Cliente ID=39 Nome=Waldenira Pistori','','2008-03-05 18:57:23'),
 (149,'antonio','Alterado Cliente ID=32 Nome=Zenildo Costa','','2008-03-05 18:57:34'),
 (150,'antonio','Alterado Cliente ID=28 Nome=Sergio Vivan','','2008-03-05 18:58:02'),
 (151,'antonio','Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda','','2008-03-05 18:58:12'),
 (152,'antonio','Alterado Cliente ID=27 Nome=Jorge Gonçalves dos Santos','','2008-03-05 18:58:26'),
 (153,'antonio','Alterado Cliente ID=25 Nome=Rose Mari Martins Arruda','','2008-03-05 18:58:38'),
 (154,'antonio','Alterado Cliente ID=114 Nome=Ivan de Oliveira Mota','','2008-03-05 18:59:07'),
 (155,'antonio','Alterado Cliente ID=82 Nome=João Arnaldo de Oliveira','','2008-03-05 18:59:22'),
 (156,'antonio','Alterado Cliente ID=90 Nome=José Carlos','','2008-03-05 18:59:31'),
 (157,'antonio','Alterado Cliente ID=85 Nome=José Carlos de Lima','','2008-03-05 18:59:40'),
 (158,'antonio','Alterado Cliente ID=87 Nome=José Carvalho Filho','','2008-03-05 18:59:50'),
 (159,'antonio','Alterado Cliente ID=78 Nome=Katia Regina Schmeiske','','2008-03-05 18:59:59'),
 (160,'antonio','Alterado Cliente ID=80 Nome=Morgana','','2008-03-05 19:00:08'),
 (161,'antonio','Alterado Cliente ID=84 Nome=Sonia Aparecida Estevan Costa ','','2008-03-05 19:00:15'),
 (162,'antonio','Alterado Cliente ID=81 Nome=Thais Cristina Sentone Mota','','2008-03-05 19:00:23'),
 (163,'antonio','Alterado Cliente ID=80 Nome=Morgana','','2008-03-05 19:03:15'),
 (164,'antonio','Logout','','2008-03-05 20:56:41'),
 (165,'antonio','Login','','2008-03-06 13:13:24'),
 (166,'antonio','Alterado Cliente ID=80 Nome=Morgana Biron','','2008-03-06 13:15:07'),
 (167,'antonio','Alterado Cliente ID=100 Nome=Antonio dos Santos Bicalho','','2008-03-06 13:25:08'),
 (168,'antonio','Alterado Cliente ID=102 Nome=Dieick Denner Gonçalves','','2008-03-06 13:25:16'),
 (169,'antonio','Alterado Cliente ID=96 Nome=Dievert Fernando de Campos','','2008-03-06 13:25:24'),
 (170,'antonio','Alterado Cliente ID=93 Nome=Everson Edson do Prado','','2008-03-06 13:25:34'),
 (171,'antonio','Alterado Cliente ID=97 Nome=Luiz Eduardo Lasszck','','2008-03-06 13:25:47'),
 (172,'antonio','Alterado Cliente ID=108 Nome=Marcelo','','2008-03-06 13:25:56'),
 (173,'antonio','Alterado Cliente ID=95 Nome=Nilo Navarri','','2008-03-06 13:26:04'),
 (174,'antonio','Alterado Cliente ID=107 Nome=Robson Sandro Santos','','2008-03-06 13:26:15'),
 (175,'antonio','Alterado Cliente ID=106 Nome=Rosina Helena dos Santos','','2008-03-06 13:26:26'),
 (176,'antonio','Alterado Cliente ID=104 Nome=Shirley Cristiane M. de Souza','','2008-03-06 13:26:35'),
 (177,'antonio','Alterado Cliente ID=105 Nome=Silvia Aparecida Pereira','','2008-03-06 13:26:44'),
 (178,'antonio','Alterado Cliente ID=101 Nome=Sueli Costa Luvison','','2008-03-06 13:26:51'),
 (179,'antonio','Alterado Cliente ID=94 Nome=Valdemir Antonio Rovares','','2008-03-06 13:26:59'),
 (180,'antonio','Alterado Cliente ID=99 Nome=Valdir Modest de Oliveira','','2008-03-06 13:27:08'),
 (181,'antonio','Alterado Cliente ID=103 Nome=Vanderlei Souza','','2008-03-06 13:27:16'),
 (182,'antonio','Cadastro Cliente ID=123 Nome=Marcelo Luiz Velter','','2008-03-06 13:29:14'),
 (183,'antonio','Cadastro Cliente ID=124 Nome=José Carlos Cardoso Ajala','','2008-03-06 13:31:20'),
 (184,'antonio','Alterado Cliente ID=108 Nome=Marcelo','','2008-03-06 13:32:02'),
 (185,'antonio','Logout','','2008-03-06 17:02:58'),
 (186,'sergio','Login','','2008-03-07 09:15:42'),
 (187,'antonio','Login','','2008-03-07 11:10:03'),
 (188,'sergio','Login','','2008-03-07 11:17:47'),
 (189,'antonio','Login','','2008-03-07 11:30:12'),
 (190,'antonio','Cadastro Cliente ID=125 Nome=Sidnei Scaravonatti','','2008-03-07 11:33:32'),
 (191,'sergio','Login','','2008-03-08 10:20:55'),
 (192,'sergio','Login','','2008-03-08 15:38:25'),
 (193,'sergio','Alterado Cliente ID=60 Nome=Claiton Estacionamento','','2008-03-08 17:50:28'),
 (194,'sergio','Login','','2008-03-10 10:40:11'),
 (195,'sergio','Login','','2008-03-10 10:55:14'),
 (196,'antonio','Login','','2008-03-10 13:54:52'),
 (197,'sergio','Login','','2008-03-11 09:35:35'),
 (198,'antonio','Login','','2008-03-11 13:33:45'),
 (199,'antonio','Alterado Cliente ID=7 Nome=Tulio Hofmann Filho','','2008-03-11 13:34:31'),
 (200,'antonio','Alterado Cliente ID=56 Nome=Eliana Nascimento','','2008-03-11 13:46:53'),
 (201,'antonio','Cadastro Cliente ID=126 Nome=João Marcos Ferreira Damaceno','','2008-03-11 13:55:45'),
 (202,'antonio','Alterado Cliente ID=59 Nome=Celso Amaral Poletti','','2008-03-11 13:58:30'),
 (203,'antonio','Alterado Cliente ID=60 Nome=Claiton Estacionamento','','2008-03-11 14:00:55'),
 (204,'antonio','Alterado Cliente ID=9 Nome=Robson Lara Moreira','','2008-03-11 14:04:28'),
 (205,'antonio','Alterado Cliente ID=12 Nome=Graciele Razera','','2008-03-11 14:07:34'),
 (206,'antonio','Alterado Cliente ID=13 Nome=Lucas Nunes da Silveira','','2008-03-11 14:10:09'),
 (207,'antonio','Alterado Cliente ID=16 Nome=Juliana Horta','','2008-03-11 14:13:02'),
 (208,'antonio','Alterado Cliente ID=17 Nome=Robson Garcia Barbosa','','2008-03-11 14:21:06'),
 (209,'antonio','Alterado Cliente ID=63 Nome=Rubia Souza Pimenta de Padua','','2008-03-11 14:26:54'),
 (210,'antonio','Alterado Cliente ID=70 Nome=Leonardo Raupp Matta','','2008-03-11 14:36:02'),
 (211,'antonio','Alterado Cliente ID=72 Nome=Mellina Franco Oliveira Canto','','2008-03-11 14:39:00'),
 (212,'antonio','Alterado Cliente ID=35 Nome=Ana Elisa Macagnan','','2008-03-11 14:44:44'),
 (213,'antonio','Alterado Cliente ID=39 Nome=Waldenira Pistori','','2008-03-11 14:50:11'),
 (214,'antonio','Alterado Cliente ID=95 Nome=Nilo Navarri','','2008-03-11 15:07:46'),
 (215,'antonio','Alterado Cliente ID=94 Nome=Valdemir Antonio Rovares','','2008-03-11 15:09:06'),
 (216,'antonio','Alterado Cliente ID=79 Nome=Henderson Ezequiel Rudiniski','','2008-03-11 15:44:32'),
 (217,'antonio','Alterado Cliente ID=79 Nome=Henderson Ezequiel Rudiniski','','2008-03-11 15:45:06'),
 (218,'antonio','Alterado Cliente ID=85 Nome=José Carlos de Lima','','2008-03-11 15:50:58'),
 (219,'antonio','Alterado Cliente ID=85 Nome=José Carlos de Lima','','2008-03-11 15:51:39'),
 (220,'antonio','Alterado Cliente ID=90 Nome=José Carlos','','2008-03-11 16:03:56'),
 (221,'antonio','Alterado Cliente ID=91 Nome=Adriano de Araujo Schampovski','','2008-03-11 16:17:10'),
 (222,'antonio','Alterado Cliente ID=79 Nome=Henderson Ezequiel Rudiniski','','2008-03-11 16:29:31'),
 (223,'antonio','Alterado Cliente ID=95 Nome=Nilo Ravazzi','','2008-03-11 16:38:50'),
 (224,'antonio','Logout','','2008-03-11 23:52:21'),
 (225,'antonio','Login','','2008-03-11 23:52:29'),
 (226,'antonio','Logout','','2008-03-11 23:53:44'),
 (227,'antonio','Login','','2008-03-12 13:10:11'),
 (228,'antonio','Cadastro Cliente ID=127 Nome=Juliana Aparecida Rosty de Anhaia Cesar','','2008-03-12 13:13:48'),
 (229,'antonio','Logout','','2008-03-12 15:36:31'),
 (230,'antonio','Login','','2008-03-12 15:38:23'),
 (231,'antonio','Logout','','2008-03-12 15:52:16'),
 (232,'antonio','Login','','2008-03-12 18:30:48'),
 (233,'sergio','Login','','2008-03-13 08:40:06'),
 (234,'sergio','Login','','2008-03-13 08:56:10'),
 (235,'sergio','Alterado Cliente ID=59 Nome=Celso Amaral Poletti','','2008-03-13 10:49:43'),
 (236,'sergio','Alterado Cliente ID=115 Nome=Federação Paranaense de Ginástica','','2008-03-13 10:52:51'),
 (237,'antonio','Login','','2008-03-13 12:49:39'),
 (238,'antonio','Logout','','2008-03-13 13:34:54'),
 (239,'antonio','Login','','2008-03-13 18:01:14'),
 (240,'antonio','Logout','','2008-03-13 18:22:14'),
 (241,'antonio','Login','','2008-03-13 18:29:26'),
 (242,'antonio','Logout','','2008-03-13 18:30:54'),
 (243,'antonio','Login','','2008-03-13 19:44:17'),
 (244,'antonio','Alterado Cliente ID=15 Nome=Rebeca Garcia Martins','','2008-03-13 19:45:53'),
 (245,'antonio','Logout','','2008-03-13 23:33:59'),
 (246,'antonio','Login','','2008-03-14 08:48:38'),
 (247,'antonio','Alterado Cliente ID=102 Nome=Dieick Denner Gonçalves','','2008-03-14 09:08:42'),
 (248,'antonio','Alterado Cliente ID=104 Nome=Shirley Cristiane M. de Souza','','2008-03-14 09:17:56'),
 (249,'antonio','Alterado Cliente ID=97 Nome=Luiz Eduardo Lasszck','','2008-03-14 09:23:36'),
 (250,'sergio','Login','','2008-03-14 09:24:24'),
 (251,'sergio','Login','','2008-03-14 11:22:27'),
 (252,'sergio','Alterado Cliente ID=38 Nome=Eugenio Antonio Guerra','','2008-03-14 11:23:47'),
 (253,'sergio','Alterado Cliente ID=45 Nome=Carlos Eduardo','','2008-03-14 11:37:35'),
 (254,'antonio','Login','','2008-03-15 10:33:20'),
 (255,'sergio','Login','','2008-03-15 10:36:31'),
 (256,'antonio','Cadastro Cliente ID=128 Nome=Caio Ruocco de Arruda','','2008-03-15 10:37:44'),
 (257,'sergio','Login','','2008-03-15 10:59:08'),
 (258,'antonio','Alterado Cliente ID=128 Nome=Caio Ruocco de Arruda','','2008-03-15 11:07:33'),
 (259,'sergio','Alterado Cliente ID=18 Nome=Oscar Ricardo Macedo Schmeiske','','2008-03-15 11:43:27'),
 (260,'antonio','Login','','2008-03-15 12:55:18'),
 (261,'sergio','Login','','2008-03-15 12:59:34'),
 (262,'antonio','Cadastro Cliente ID=129 Nome=Ines Eline Lopes Martins','','2008-03-15 13:06:53'),
 (263,'antonio','Alterado Cliente ID=129 Nome=Ines Eline Lopes Martins','','2008-03-15 13:07:47'),
 (264,'antonio','Alterado Cliente ID=102 Nome=Dieick Denner Gonçalves','','2008-03-15 17:07:09'),
 (265,'antonio','Alterado Cliente ID=125 Nome=Sidnei Scaravonatti','','2008-03-15 17:40:54'),
 (266,'sergio','Alterado Cliente ID=118 Nome=','','2008-03-15 17:42:13'),
 (267,'sergio','Alterado Cliente ID=117 Nome=','','2008-03-15 17:46:35'),
 (268,'sergio','Alterado Cliente ID=111 Nome=','','2008-03-15 17:57:46'),
 (269,'sergio','Alterado Cliente ID=112 Nome=','','2008-03-15 17:58:24'),
 (270,'antonio','Login','','2008-03-17 10:36:37'),
 (271,'sergio','Login','','2008-03-17 10:38:57'),
 (272,'antonio','Login','','2008-03-18 09:08:59'),
 (273,'antonio','Logout','','2008-03-18 19:16:40'),
 (274,'antonio','Login','','2008-03-19 10:41:03'),
 (275,'antonio','Logout','','2008-03-19 17:57:24'),
 (276,'sergio','Login','','2008-03-20 11:47:46');
/*!40000 ALTER TABLE `logs_admin` ENABLE KEYS */;


--
-- Definition of table `periodos`
--

DROP TABLE IF EXISTS `periodos`;
CREATE TABLE `periodos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nome` varchar(250) collate latin1_general_ci NOT NULL,
  `dia_inicio` int(11) NOT NULL,
  `dia_termino` int(11) NOT NULL,
  `dia_termino_mescorrente` int(11) NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `periodos`
--

/*!40000 ALTER TABLE `periodos` DISABLE KEYS */;
INSERT INTO `periodos` (`id`,`nome`,`dia_inicio`,`dia_termino`,`dia_termino_mescorrente`,`datacadastro`) VALUES 
 (6,'Dia 01 mês corrente a 31 mês corrente',1,31,1,'2008-03-10 11:06:09'),
 (7,'Dia 10 mês corrente a 09 mês seguinte',10,9,0,'2008-03-10 11:10:57');
/*!40000 ALTER TABLE `periodos` ENABLE KEYS */;


--
-- Definition of table `planos`
--

DROP TABLE IF EXISTS `planos`;
CREATE TABLE `planos` (
  `id` int(11) NOT NULL auto_increment,
  `codigo` varchar(200) collate latin1_general_ci NOT NULL,
  `nome` varchar(200) collate latin1_general_ci NOT NULL,
  `descricao` text collate latin1_general_ci NOT NULL,
  `vel_download` varchar(200) collate latin1_general_ci NOT NULL,
  `vel_upload` varchar(200) collate latin1_general_ci NOT NULL,
  `valor_base` decimal(10,2) NOT NULL,
  `valor_pontoadicional` decimal(10,2) NOT NULL,
  `fidelidade` int(11) NOT NULL,
  `observacoes` text collate latin1_general_ci NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `planos`
--

/*!40000 ALTER TABLE `planos` DISABLE KEYS */;
INSERT INTO `planos` (`id`,`codigo`,`nome`,`descricao`,`vel_download`,`vel_upload`,`valor_base`,`valor_pontoadicional`,`fidelidade`,`observacoes`,`datacadastro`) VALUES 
 (1,'sc300','SmartConnect300','','300','150','45.00','10.00',1,'','2007-11-20 09:38:33'),
 (4,'sc400','SmartConnect400','Bla bla bla','400','200','80.00','10.00',0,'','2007-11-21 10:15:59'),
 (9,'sc350','SmartConnect350','Bla bla bla','350','175','70.00','10.00',0,'','2007-11-22 10:34:23'),
 (7,'sc200','SmartConnect200','','200','100','40.00','10.00',0,'','2007-11-22 09:53:17'),
 (6,'sc150','SmartConnect150','','150','75','30.00','10.00',0,'','2007-11-22 09:52:38'),
 (8,'sc250','SmartConnect250','','250','125','50.00','10.00',0,'','2007-11-22 10:31:04');
/*!40000 ALTER TABLE `planos` ENABLE KEYS */;


--
-- Definition of table `provedores`
--

DROP TABLE IF EXISTS `provedores`;
CREATE TABLE `provedores` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `codigo` varchar(200) collate latin1_general_ci NOT NULL,
  `razaosocial` varchar(200) collate latin1_general_ci NOT NULL,
  `nomefantasia` varchar(200) collate latin1_general_ci NOT NULL,
  `cnpj` varchar(50) collate latin1_general_ci NOT NULL,
  `inscestadual` varchar(30) collate latin1_general_ci NOT NULL,
  `inscmunicipal` varchar(30) collate latin1_general_ci NOT NULL,
  `responsavel` varchar(200) collate latin1_general_ci NOT NULL,
  `endereco` varchar(200) collate latin1_general_ci NOT NULL,
  `numero` varchar(200) collate latin1_general_ci NOT NULL,
  `complemento` varchar(200) collate latin1_general_ci NOT NULL,
  `bairro` varchar(200) collate latin1_general_ci NOT NULL,
  `cep` varchar(20) collate latin1_general_ci NOT NULL,
  `cidade` varchar(200) collate latin1_general_ci NOT NULL,
  `uf` varchar(2) collate latin1_general_ci NOT NULL,
  `tel_principal` varchar(20) collate latin1_general_ci NOT NULL,
  `tel_comercial` varchar(30) collate latin1_general_ci NOT NULL,
  `tel_financeiro` varchar(30) collate latin1_general_ci NOT NULL,
  `tel_suporte` varchar(30) collate latin1_general_ci NOT NULL,
  `celular1` varchar(30) collate latin1_general_ci NOT NULL,
  `celular2` varchar(20) collate latin1_general_ci NOT NULL,
  `celular3` varchar(20) collate latin1_general_ci NOT NULL,
  `fax` varchar(30) collate latin1_general_ci NOT NULL,
  `email_principal` varchar(200) collate latin1_general_ci NOT NULL,
  `email_comercial` varchar(200) collate latin1_general_ci NOT NULL,
  `email_financeiro` varchar(200) collate latin1_general_ci NOT NULL,
  `email_suporte` varchar(200) collate latin1_general_ci NOT NULL,
  `observacoes` text collate latin1_general_ci NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `provedores`
--

/*!40000 ALTER TABLE `provedores` DISABLE KEYS */;
INSERT INTO `provedores` (`id`,`codigo`,`razaosocial`,`nomefantasia`,`cnpj`,`inscestadual`,`inscmunicipal`,`responsavel`,`endereco`,`numero`,`complemento`,`bairro`,`cep`,`cidade`,`uf`,`tel_principal`,`tel_comercial`,`tel_financeiro`,`tel_suporte`,`celular1`,`celular2`,`celular3`,`fax`,`email_principal`,`email_comercial`,`email_financeiro`,`email_suporte`,`observacoes`,`datacadastro`) VALUES 
 (5,'ssolution','Smart Solution Tecnologia da Informação Ltda.','Smart Solution TI ','05.198.010/0001-05','903.38693-28','6.024.442.076-9','Antonio Gustavo Sampaio de Oliveira ','Avenida Sete de Setembro','3272','Conjunto 11','Centro','80.230-010','Curitiba','PR','(41) 3234-2443','(41) 3234-2443','(41) 3234-2443','(41) 3234-2443','(41) 8416-0817','(41) 9121-2032','','','smart@smartsolution.com.br','comercial@smartsolution.com.br','financeiro@smartsolution.com.br','suporte@smartsolution.com.br','','2007-11-19 12:07:57');
/*!40000 ALTER TABLE `provedores` ENABLE KEYS */;


--
-- Definition of table `titulos`
--

DROP TABLE IF EXISTS `titulos`;
CREATE TABLE `titulos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `contrato_id` int(11) NOT NULL,
  `periodo_inicio` date NOT NULL,
  `periodo_fim` date NOT NULL,
  `numero` bigint(20) NOT NULL,
  `vencimento` date NOT NULL,
  `valor` decimal(2,0) NOT NULL,
  `observacoes` text collate latin1_general_ci NOT NULL,
  `datacadastro` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `titulos`
--

/*!40000 ALTER TABLE `titulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `titulos` ENABLE KEYS */;

--
-- Create schema phpmyadmin
--

CREATE DATABASE IF NOT EXISTS phpmyadmin;
USE phpmyadmin;

--
-- Definition of table `pma_bookmark`
--

DROP TABLE IF EXISTS `pma_bookmark`;
CREATE TABLE `pma_bookmark` (
  `id` int(11) NOT NULL auto_increment,
  `dbase` varchar(255) collate latin1_general_ci NOT NULL default '',
  `user` varchar(255) collate latin1_general_ci NOT NULL default '',
  `label` varchar(255) collate latin1_general_ci NOT NULL default '',
  `query` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Bookmarks';

--
-- Dumping data for table `pma_bookmark`
--

/*!40000 ALTER TABLE `pma_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `pma_bookmark` ENABLE KEYS */;


--
-- Definition of table `pma_column_info`
--

DROP TABLE IF EXISTS `pma_column_info`;
CREATE TABLE `pma_column_info` (
  `id` int(5) unsigned NOT NULL auto_increment,
  `db_name` varchar(64) collate latin1_general_ci NOT NULL default '',
  `table_name` varchar(64) collate latin1_general_ci NOT NULL default '',
  `column_name` varchar(64) collate latin1_general_ci NOT NULL default '',
  `comment` varchar(255) collate latin1_general_ci NOT NULL default '',
  `mimetype` varchar(255) collate latin1_general_ci NOT NULL default '',
  `transformation` varchar(255) collate latin1_general_ci NOT NULL default '',
  `transformation_options` varchar(255) collate latin1_general_ci NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Column information for phpMyAdmin';

--
-- Dumping data for table `pma_column_info`
--

/*!40000 ALTER TABLE `pma_column_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `pma_column_info` ENABLE KEYS */;


--
-- Definition of table `pma_designer_coords`
--

DROP TABLE IF EXISTS `pma_designer_coords`;
CREATE TABLE `pma_designer_coords` (
  `db_name` varchar(64) collate latin1_general_ci NOT NULL default '',
  `table_name` varchar(64) collate latin1_general_ci NOT NULL default '',
  `x` int(11) default NULL,
  `y` int(11) default NULL,
  `v` tinyint(4) default NULL,
  `h` tinyint(4) default NULL,
  PRIMARY KEY  (`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Table coordinates for Designer';

--
-- Dumping data for table `pma_designer_coords`
--

/*!40000 ALTER TABLE `pma_designer_coords` DISABLE KEYS */;
/*!40000 ALTER TABLE `pma_designer_coords` ENABLE KEYS */;


--
-- Definition of table `pma_history`
--

DROP TABLE IF EXISTS `pma_history`;
CREATE TABLE `pma_history` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `username` varchar(64) collate latin1_general_ci NOT NULL default '',
  `db` varchar(64) collate latin1_general_ci NOT NULL default '',
  `table` varchar(64) collate latin1_general_ci NOT NULL default '',
  `timevalue` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `sqlquery` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `username` (`username`,`db`,`table`,`timevalue`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='SQL history for phpMyAdmin';

--
-- Dumping data for table `pma_history`
--

/*!40000 ALTER TABLE `pma_history` DISABLE KEYS */;
INSERT INTO `pma_history` (`id`,`username`,`db`,`table`,`timevalue`,`sqlquery`) VALUES 
 (1,'root','ssolution','funcoes','2008-02-27 11:39:57','INSERT INTO `ssolution`.`funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (NULL, \'0\', \'100\', \'Títulos\', \'0\', \'0\', \'javascript:;\');'),
 (2,'root','ssolution','funcoes','2008-02-27 11:40:00','SELECT * FROM `funcoes`'),
 (3,'root','ssolution','funcoes','2008-02-27 11:40:47','SELECT *FROM `funcoes`  ORDER BY `funcoes`.`pai` ASC'),
 (4,'root','ssolution','funcoes','2008-02-27 11:40:57','SELECT *FROM `funcoes`  ORDER BY `funcoes`.`posicao` ASC'),
 (5,'root','ssolution','funcoes','2008-02-27 11:41:32','\n        ALTER TABLE `funcoes`\n        ORDER BY `pai`'),
 (6,'root','ssolution','funcoes','2008-02-27 11:41:43','SELECT * FROM `funcoes`'),
 (7,'root','ssolution','funcoes','2008-02-27 11:41:48','\n        ALTER TABLE `funcoes`\n        ORDER BY `pai`'),
 (8,'root','ssolution','funcoes','2008-02-27 11:42:03','\r\n        ALTER TABLE `funcoes`\r\n        ORDER BY `pai`,`posicao`'),
 (9,'root','ssolution','funcoes','2008-02-27 11:42:08','SELECT * FROM `funcoes`'),
 (10,'root','ssolution','funcoes','2008-02-27 11:42:36','SELECT * FROM `funcoes`'),
 (11,'root','ssolution','funcoes','2008-02-27 11:42:46','SELECT * FROM `funcoes`'),
 (12,'root','ssolution','funcoes','2008-02-27 11:43:07','SELECT * FROM `funcoes`'),
 (13,'root','ssolution','funcoes','2008-02-27 11:43:12','SELECT * FROM `funcoes`'),
 (14,'root','ssolution','funcoes','2008-02-27 11:43:36','INSERT INTO `ssolution`.`funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (NULL, \'27\', \'1\', \'Cadastrar\', \'1\', \'0\', \'cobrancas.php?modo=cad\');'),
 (15,'root','ssolution','funcoes','2008-02-27 11:54:15','SELECT * FROM `funcoes`'),
 (16,'root','ssolution','funcoes','2008-02-27 11:54:23','SELECT * FROM `funcoes`'),
 (17,'root','ssolution','funcoes','2008-02-27 11:54:32','SELECT * FROM `funcoes`'),
 (18,'root','','','2008-03-04 09:34:36','SELECT `User`,       `Host`,       IF(`Password` = _latin1 \'\', \'N\', \'Y\') AS \'Password\',       `Select_priv`,       `Insert_priv`,       `Update_priv`,       `Delete_priv`,       `Index_priv`,       `Alter_priv`,       `Create_priv`,       `Drop_priv`,       `Grant_priv`,       `References_priv`,       `Reload_priv`,       `Shutdown_priv`,       `Process_priv`,       `File_priv`, `Show_db_priv`, `Super_priv`, `Create_tmp_table_priv`, `Lock_tables_priv`, `Execute_priv`, `Repl_slave_priv`, `Repl_client_priv`, `Create_view_priv`, `Show_view_priv`, `Create_user_priv`, `Create_routine_priv`, `Alter_routine_priv`  FROM `mysql`.`user` ORDER BY `User` ASC, `Host` ASC;'),
 (19,'root','ssolution','clientes','2008-03-05 08:32:45','ALTER TABLE `clientes` ADD `complemento_tipo` VARCHAR(5) NOT NULL AFTER `numero`;'),
 (20,'root','ssolution','clientes','2008-03-05 08:32:55','SELECT * FROM `clientes`'),
 (21,'root','ssolution','clientes','2008-03-05 08:33:31','ALTER TABLE `clientes` CHANGE `nascimento` `nascimento` DATE NOT NULL DEFAULT \'0000-00-00\''),
 (22,'root','ssolution','clientes','2008-03-05 08:33:33','SELECT * FROM `clientes`'),
 (23,'root','ssolution','clientes','2008-03-05 08:36:26','ALTER TABLE `clientes` ADD `bloco` VARCHAR(10) NOT NULL AFTER `numero`;'),
 (24,'root','ssolution','clientes','2008-03-05 08:54:02','SELECT * FROM `clientes`'),
 (25,'root','ssolution','clientes','2008-03-05 09:00:31','ALTER TABLE `clientes` CHANGE `codigo` `codigo` VARCHAR(100) NOT NULL'),
 (26,'root','ssolution','clientes','2008-03-05 09:00:35','SELECT * FROM `clientes`'),
 (27,'root','ssolution','clientes','2008-03-05 09:18:00','SELECT * FROM `clientes` WHERE nome=\"Felipe Lukacievick Barbosa\"'),
 (28,'root','ssolution','clientes','2008-03-05 09:47:39','ALTER TABLE `clientes` ADD `site` VARCHAR(200) NOT NULL AFTER `fax`;'),
 (29,'root','ssolution','titulos','2008-03-08 17:55:36','ALTER TABLE `titulos` ADD `numero` BIGINT NOT NULL AFTER `contrato_id`;'),
 (30,'root','ssolution','titulos','2008-03-08 17:55:43','SELECT COUNT(*) AS `Registros`, `data_vencimento` FROM `titulos` GROUP BY `data_vencimento` ORDER BY `data_vencimento`'),
 (31,'root','ssolution','titulos','2008-03-08 17:56:03','ALTER TABLE `titulos` CHANGE `data_vencimento` `vencimento` DATE NOT NULL'),
 (32,'root','ssolution','titulos','2008-03-08 17:57:07','ALTER TABLE `titulos` ADD `periodo_inicio` DATE NOT NULL AFTER `contrato_id`, ADD `periodo_fim` DATE NOT NULL AFTER `periodo_inicio`;'),
 (33,'root','ssolution','periodos','2008-03-08 18:19:18','ALTER TABLE `periodos` ADD `dia_inicio` INT NOT NULL AFTER `periodo`, ADD `dia_termino` INT NOT NULL AFTER `dia_inicio`;'),
 (34,'root','ssolution','periodos','2008-03-08 18:20:12','ALTER TABLE `periodos` DROP `periodo`'),
 (35,'root','ssolution','periodos','2008-03-08 18:37:14','ALTER TABLE `periodos` ADD `nome` VARCHAR(250) NOT NULL AFTER `id`;'),
 (36,'root','ssolution','funcoes','2008-03-08 18:42:22','SELECT * FROM `funcoes`'),
 (37,'root','ssolution','funcoes','2008-03-08 18:42:39','SELECT * FROM `funcoes`'),
 (38,'root','ssolution','funcoes','2008-03-08 18:44:08','INSERT INTO `ssolution`.`funcoes` (`id`, `pai`, `posicao`, `nome`, `ativo`, `restrito`, `link`) VALUES (NULL, \'27\', \'10\', \'Períodos - Cadastrar\', \'1\', \'0\', \'periodos.php?modo=cad\'), (NULL, \'27\', \'11\', \'Períodos - Manutenção\', \'1\', \'0\', \'periodos.php?modo=lst\');'),
 (39,'root','ssolution','funcoes','2008-03-08 18:44:14','SELECT * FROM `funcoes`'),
 (40,'root','ssolution','periodos','2008-03-08 18:56:32','ALTER TABLE `periodos` CHANGE `id` `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT'),
 (41,'root','ssolution','periodos','2008-03-10 10:50:36','ALTER TABLE `periodos` ADD `dia_termino_mescorrente` INT NOT NULL, ADD `datacadastro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;'),
 (42,'root','ssolution','periodos','2008-03-10 11:03:05','SELECT * FROM `periodos`'),
 (43,'root','ssolution','periodos','2008-03-10 11:03:51','SELECT * FROM `periodos`'),
 (44,'root','ssolution','periodos','2008-03-10 11:04:31','SELECT * FROM `periodos`'),
 (45,'root','ssolution','periodos','2008-03-10 11:06:15','SELECT * FROM `periodos`'),
 (46,'root','ssolution','periodos','2008-03-10 11:11:04','SELECT * FROM `periodos`'),
 (47,'root','ssolution','contratos','2008-03-10 11:16:47','ALTER TABLE `contratos` ADD `periodo_id` INT NOT NULL AFTER `data_termino`;'),
 (48,'root','ssolution','contratos','2008-03-10 12:15:34','SELECT * FROM `contratos`'),
 (49,'root','ssolution','contratos','2008-03-10 12:15:41','SELECT * FROM `contratos`'),
 (50,'root','ssolution','contratos','2008-03-10 12:15:49','SELECT * FROM `contratos`'),
 (51,'root','ssolution','clientes','2008-03-15 10:37:43','SELECT * FROM `clientes`'),
 (52,'root','ssolution','clientes','2008-03-15 10:37:50','SELECT *FROM `clientes`  ORDER BY `clientes`.`codigo` ASC'),
 (53,'root','ssolution','clientes','2008-03-15 10:37:56','SELECT *FROM `clientes`  ORDER BY `clientes`.`codigo` ASC'),
 (54,'root','ssolution','grupos','2008-03-15 10:42:34','SELECT * FROM `grupos`'),
 (55,'root','ssolution','clientes','2008-03-15 10:42:57','SELECT codigo FROM clientes WHERE grupo_id = 4 ORDER BY codigo DESC'),
 (56,'root','ssolution','clientes','2008-03-15 10:43:29','SELECT codigo FROM clientes WHERE grupo_id = 4 ORDER BY codigo DESC'),
 (57,'root','ssolution','clientes','2008-03-15 10:43:44','SELECT codigo FROM clientes WHERE grupo_id = 4 ORDER BY codigo DESC'),
 (58,'root','ssolution','clientes','2008-03-15 10:43:49','SELECT codigo FROM clientes WHERE grupo_id = 4 ORDER BY codigo DESC'),
 (59,'root','ssolution','clientes','2008-03-15 10:43:51','SELECT codigo FROM clientes WHERE grupo_id = 4 ORDER BY codigo DESC'),
 (60,'root','ssolution','clientes','2008-03-15 10:44:28','SELECT * FROM `clientes`'),
 (61,'root','ssolution','clientes','2008-03-15 10:44:56','SELECT * FROM `clientes`'),
 (62,'root','ssolution','clientes','2008-03-15 10:45:00','SELECT * FROM `clientes`'),
 (63,'root','ssolution','clientes','2008-03-15 10:45:06','SELECT * FROM `clientes`'),
 (64,'root','ssolution','clientes','2008-03-15 10:45:28','SELECT * FROM `clientes`'),
 (65,'root','ssolution','clientes','2008-03-15 10:45:36','SELECT * FROM `clientes`'),
 (66,'root','ssolution','clientes','2008-03-15 10:45:46','SELECT * FROM `clientes`'),
 (67,'root','ssolution','clientes','2008-03-15 10:45:52','SELECT * FROM `clientes`'),
 (68,'root','ssolution','clientes','2008-03-15 10:49:03','SELECT codigo FROM `clientes` WHERE LENGTH(codigo)<5'),
 (69,'root','ssolution','clientes','2008-03-15 10:49:07','SELECT codigo FROM `clientes` WHERE LENGTH(codigo)<5'),
 (70,'root','ssolution','clientes','2008-03-15 10:49:31','DELETE FROM `clientes` WHERE CONVERT(`clientes`.`codigo` USING utf8) = \'6006\' LIMIT 1'),
 (71,'root','ssolution','clientes','2008-03-15 10:49:40','SELECT codigo FROM `clientes` WHERE LENGTH(codigo)<5'),
 (72,'root','ssolution','clientes','2008-03-15 10:56:39','SELECT codigo FROM `clientes` WHERE LENGTH(codigo)<5'),
 (73,'root','ssolution','clientes','2008-03-15 10:56:44','SELECT codigo FROM `clientes` WHERE LENGTH(codigo)<5'),
 (74,'root','ssolution','clientes','2008-03-15 10:56:50','SELECT codigo FROM `clientes` WHERE LENGTH(codigo)<5'),
 (75,'root','ssolution','clientes','2008-03-15 10:56:55','SELECT codigo FROM `clientes` WHERE LENGTH(codigo)<5'),
 (76,'root','ssolution','clientes','2008-03-15 10:56:58','SELECT codigo FROM `clientes` WHERE LENGTH(codigo)<5'),
 (77,'root','ssolution','clientes','2008-03-15 10:57:56','SELECT codigo FROM `clientes` WHERE LENGTH(codigo)<5'),
 (78,'root','ssolution','clientes','2008-03-15 10:58:05','SELECT codigo FROM `clientes` WHERE LENGTH(codigo)<5'),
 (79,'root','ssolution','clientes','2008-03-15 10:58:13','SELECT codigo FROM `clientes` WHERE LENGTH(codigo)<5'),
 (80,'root','ssolution','clientes','2008-03-15 10:58:20','SELECT codigo FROM `clientes` WHERE LENGTH(codigo)<5'),
 (81,'root','ssolution','clientes','2008-03-15 10:58:27','SELECT codigo FROM `clientes` WHERE LENGTH(codigo)<5'),
 (82,'root','ssolution','clientes','2008-03-15 10:58:34','SELECT codigo FROM `clientes` WHERE LENGTH(codigo)<5'),
 (83,'root','ssolution','clientes','2008-03-15 10:58:36','SELECT codigo FROM `clientes` WHERE LENGTH(codigo)<5'),
 (84,'root','ssolution','clientes','2008-03-15 10:58:46','SELECT codigo FROM `clientes` WHERE LENGTH(codigo)<5'),
 (85,'root','ssolution','clientes','2008-03-15 10:58:51','SELECT codigo FROM `clientes` WHERE LENGTH(codigo)<5'),
 (86,'root','ssolution','clientes','2008-03-15 11:41:49','SELECT codigo FROM `clientes` WHERE cpf!=\"\"'),
 (87,'root','ssolution','clientes','2008-03-15 11:41:58','SELECT nome FROM `clientes` WHERE cpf!=\"\"'),
 (88,'root','ssolution','clientes','2008-03-15 11:42:36','SELECT nome,cpf FROM `clientes` WHERE cpf!=\"\"'),
 (89,'root','ssolution','clientes','2008-03-15 11:43:36','SELECT nome,cpf FROM `clientes` WHERE cpf!=\"\"'),
 (90,'root','ssolution','clientes','2008-03-15 13:18:47','ALTER TABLE `clientes` ADD `tipo` INT NOT NULL AFTER `codigo`;'),
 (91,'root','ssolution','clientes','2008-03-15 13:19:21','ALTER TABLE `clientes` SET `tipo` = 0'),
 (92,'root','ssolution','clientes','2008-03-15 13:19:38','ALTER TABLE `clientes` SET tipo=0'),
 (93,'root','ssolution','clientes','2008-03-15 13:19:46','UPDATE TABLE `clientes` SET tipo=0'),
 (94,'root','ssolution','clientes','2008-03-15 13:19:54','UPDATE `clientes` SET tipo=0'),
 (95,'root','ssolution','clientes','2008-03-15 13:20:01','SELECT * FROM `clientes`'),
 (96,'root','ssolution','clientes','2008-03-15 13:53:49','ALTER TABLE `clientes` ADD `razao_social` VARCHAR(200) NOT NULL AFTER `sexo`, ADD `nome_fantasia` VARCHAR(200) NOT NULL AFTER `razao_social`, ADD `cnpj` VARCHAR(200) NOT NULL AFTER `nome_fantasia`, ADD `inscr_municipal` VARCHAR(200) NOT NULL AFTER `cnpj`, ADD `inscr_estadual` VARCHAR(200) NOT NULL AFTER `inscr_municipal`;'),
 (97,'root','ssolution','clientes','2008-03-15 17:46:50','SELECT * FROM `clientes`'),
 (98,'root','ssolution','clientes','2008-03-15 17:47:03','SELECT * FROM `clientes`'),
 (99,'root','ssolution','clientes','2008-03-15 17:47:24','SELECT * FROM `clientes` WHERE tipo != 0'),
 (100,'root','','','2008-03-21 15:22:58','SELECT `User`,       `Host`,       IF(`Password` = _latin1 \'\', \'N\', \'Y\') AS \'Password\',       `Select_priv`,       `Insert_priv`,       `Update_priv`,       `Delete_priv`,       `Index_priv`,       `Alter_priv`,       `Create_priv`,       `Drop_priv`,       `Grant_priv`,       `References_priv`,       `Reload_priv`,       `Shutdown_priv`,       `Process_priv`,       `File_priv`, `Show_db_priv`, `Super_priv`, `Create_tmp_table_priv`, `Lock_tables_priv`, `Execute_priv`, `Repl_slave_priv`, `Repl_client_priv`, `Create_view_priv`, `Show_view_priv`, `Create_user_priv`, `Create_routine_priv`, `Alter_routine_priv`  FROM `mysql`.`user` ORDER BY `User` ASC, `Host` ASC;'),
 (101,'root','','','2008-03-21 16:38:16','SELECT `User`,       `Host`,       IF(`Password` = _latin1 \'\', \'N\', \'Y\') AS \'Password\',       `Select_priv`,       `Insert_priv`,       `Update_priv`,       `Delete_priv`,       `Index_priv`,       `Alter_priv`,       `Create_priv`,       `Drop_priv`,       `Grant_priv`,       `References_priv`,       `Reload_priv`,       `Shutdown_priv`,       `Process_priv`,       `File_priv`, `Show_db_priv`, `Super_priv`, `Create_tmp_table_priv`, `Lock_tables_priv`, `Execute_priv`, `Repl_slave_priv`, `Repl_client_priv`, `Create_view_priv`, `Show_view_priv`, `Create_user_priv`, `Create_routine_priv`, `Alter_routine_priv`  FROM `mysql`.`user` ORDER BY `User` ASC, `Host` ASC;'),
 (102,'root','eticket','','2008-03-21 16:44:33','CREATE DATABASE `eticket`;'),
 (103,'root','','','2008-03-21 16:44:42','DROP DATABASE `eticket`'),
 (104,'root','','','2008-03-21 16:44:50','SELECT `User`,       `Host`,       IF(`Password` = _latin1 \'\', \'N\', \'Y\') AS \'Password\',       `Select_priv`,       `Insert_priv`,       `Update_priv`,       `Delete_priv`,       `Index_priv`,       `Alter_priv`,       `Create_priv`,       `Drop_priv`,       `Grant_priv`,       `References_priv`,       `Reload_priv`,       `Shutdown_priv`,       `Process_priv`,       `File_priv`, `Show_db_priv`, `Super_priv`, `Create_tmp_table_priv`, `Lock_tables_priv`, `Execute_priv`, `Repl_slave_priv`, `Repl_client_priv`, `Create_view_priv`, `Show_view_priv`, `Create_user_priv`, `Create_routine_priv`, `Alter_routine_priv`  FROM `mysql`.`user` ORDER BY `User` ASC, `Host` ASC;'),
 (105,'root','','','2008-03-21 17:29:08','SELECT `User`,       `Host`,       IF(`Password` = _latin1 \'\', \'N\', \'Y\') AS \'Password\',       `Select_priv`,       `Insert_priv`,       `Update_priv`,       `Delete_priv`,       `Index_priv`,       `Alter_priv`,       `Create_priv`,       `Drop_priv`,       `Grant_priv`,       `References_priv`,       `Reload_priv`,       `Shutdown_priv`,       `Process_priv`,       `File_priv`, `Show_db_priv`, `Super_priv`, `Create_tmp_table_priv`, `Lock_tables_priv`, `Execute_priv`, `Repl_slave_priv`, `Repl_client_priv`, `Create_view_priv`, `Show_view_priv`, `Create_user_priv`, `Create_routine_priv`, `Alter_routine_priv`  FROM `mysql`.`user` ORDER BY `User` ASC, `Host` ASC;'),
 (106,'root','','','2008-03-21 17:29:56','SELECT `User`,       `Host`,       IF(`Password` = _latin1 \'\', \'N\', \'Y\') AS \'Password\',       `Select_priv`,       `Insert_priv`,       `Update_priv`,       `Delete_priv`,       `Index_priv`,       `Alter_priv`,       `Create_priv`,       `Drop_priv`,       `Grant_priv`,       `References_priv`,       `Reload_priv`,       `Shutdown_priv`,       `Process_priv`,       `File_priv`, `Show_db_priv`, `Super_priv`, `Create_tmp_table_priv`, `Lock_tables_priv`, `Execute_priv`, `Repl_slave_priv`, `Repl_client_priv`, `Create_view_priv`, `Show_view_priv`, `Create_user_priv`, `Create_routine_priv`, `Alter_routine_priv`  FROM `mysql`.`user` ORDER BY `User` ASC, `Host` ASC;'),
 (107,'root','','','2008-03-21 17:32:05','SELECT `User`,       `Host`,       IF(`Password` = _latin1 \'\', \'N\', \'Y\') AS \'Password\',       `Select_priv`,       `Insert_priv`,       `Update_priv`,       `Delete_priv`,       `Index_priv`,       `Alter_priv`,       `Create_priv`,       `Drop_priv`,       `Grant_priv`,       `References_priv`,       `Reload_priv`,       `Shutdown_priv`,       `Process_priv`,       `File_priv`, `Show_db_priv`, `Super_priv`, `Create_tmp_table_priv`, `Lock_tables_priv`, `Execute_priv`, `Repl_slave_priv`, `Repl_client_priv`, `Create_view_priv`, `Show_view_priv`, `Create_user_priv`, `Create_routine_priv`, `Alter_routine_priv`  FROM `mysql`.`user` ORDER BY `User` ASC, `Host` ASC;');
/*!40000 ALTER TABLE `pma_history` ENABLE KEYS */;


--
-- Definition of table `pma_pdf_pages`
--

DROP TABLE IF EXISTS `pma_pdf_pages`;
CREATE TABLE `pma_pdf_pages` (
  `db_name` varchar(64) collate latin1_general_ci NOT NULL default '',
  `page_nr` int(10) unsigned NOT NULL auto_increment,
  `page_descr` varchar(50) collate latin1_general_ci NOT NULL default '',
  PRIMARY KEY  (`page_nr`),
  KEY `db_name` (`db_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='PDF relation pages for phpMyAdmin';

--
-- Dumping data for table `pma_pdf_pages`
--

/*!40000 ALTER TABLE `pma_pdf_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pma_pdf_pages` ENABLE KEYS */;


--
-- Definition of table `pma_relation`
--

DROP TABLE IF EXISTS `pma_relation`;
CREATE TABLE `pma_relation` (
  `master_db` varchar(64) collate latin1_general_ci NOT NULL default '',
  `master_table` varchar(64) collate latin1_general_ci NOT NULL default '',
  `master_field` varchar(64) collate latin1_general_ci NOT NULL default '',
  `foreign_db` varchar(64) collate latin1_general_ci NOT NULL default '',
  `foreign_table` varchar(64) collate latin1_general_ci NOT NULL default '',
  `foreign_field` varchar(64) collate latin1_general_ci NOT NULL default '',
  PRIMARY KEY  (`master_db`,`master_table`,`master_field`),
  KEY `foreign_field` (`foreign_db`,`foreign_table`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Relation table';

--
-- Dumping data for table `pma_relation`
--

/*!40000 ALTER TABLE `pma_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pma_relation` ENABLE KEYS */;


--
-- Definition of table `pma_table_coords`
--

DROP TABLE IF EXISTS `pma_table_coords`;
CREATE TABLE `pma_table_coords` (
  `db_name` varchar(64) collate latin1_general_ci NOT NULL default '',
  `table_name` varchar(64) collate latin1_general_ci NOT NULL default '',
  `pdf_page_number` int(11) NOT NULL default '0',
  `x` float unsigned NOT NULL default '0',
  `y` float unsigned NOT NULL default '0',
  PRIMARY KEY  (`db_name`,`table_name`,`pdf_page_number`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Table coordinates for phpMyAdmin PDF output';

--
-- Dumping data for table `pma_table_coords`
--

/*!40000 ALTER TABLE `pma_table_coords` DISABLE KEYS */;
/*!40000 ALTER TABLE `pma_table_coords` ENABLE KEYS */;


--
-- Definition of table `pma_table_info`
--

DROP TABLE IF EXISTS `pma_table_info`;
CREATE TABLE `pma_table_info` (
  `db_name` varchar(64) collate latin1_general_ci NOT NULL default '',
  `table_name` varchar(64) collate latin1_general_ci NOT NULL default '',
  `display_field` varchar(64) collate latin1_general_ci NOT NULL default '',
  PRIMARY KEY  (`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Table information for phpMyAdmin';

--
-- Dumping data for table `pma_table_info`
--

/*!40000 ALTER TABLE `pma_table_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `pma_table_info` ENABLE KEYS */;

--
-- Create schema mysql
--

CREATE DATABASE IF NOT EXISTS mysql;
USE mysql;

--
-- Definition of table `columns_priv`
--

DROP TABLE IF EXISTS `columns_priv`;
CREATE TABLE `columns_priv` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `Db` char(64) collate utf8_bin NOT NULL default '',
  `User` char(16) collate utf8_bin NOT NULL default '',
  `Table_name` char(64) collate utf8_bin NOT NULL default '',
  `Column_name` char(64) collate utf8_bin NOT NULL default '',
  `Timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') character set utf8 NOT NULL default '',
  PRIMARY KEY  (`Host`,`Db`,`User`,`Table_name`,`Column_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column privileges';

--
-- Dumping data for table `columns_priv`
--

/*!40000 ALTER TABLE `columns_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `columns_priv` ENABLE KEYS */;


--
-- Definition of table `db`
--

DROP TABLE IF EXISTS `db`;
CREATE TABLE `db` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `Db` char(64) collate utf8_bin NOT NULL default '',
  `User` char(16) collate utf8_bin NOT NULL default '',
  `Select_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Insert_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Update_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Delete_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Drop_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Grant_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `References_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Index_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_tmp_table_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Lock_tables_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Show_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Execute_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Event_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Trigger_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  PRIMARY KEY  (`Host`,`Db`,`User`),
  KEY `User` (`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database privileges';

--
-- Dumping data for table `db`
--

/*!40000 ALTER TABLE `db` DISABLE KEYS */;
INSERT INTO `db` (`Host`,`Db`,`User`,`Select_priv`,`Insert_priv`,`Update_priv`,`Delete_priv`,`Create_priv`,`Drop_priv`,`Grant_priv`,`References_priv`,`Index_priv`,`Alter_priv`,`Create_tmp_table_priv`,`Lock_tables_priv`,`Create_view_priv`,`Show_view_priv`,`Create_routine_priv`,`Alter_routine_priv`,`Execute_priv`,`Event_priv`,`Trigger_priv`) VALUES 
 (0x6C6F63616C686F7374,0x7068706D7961646D696E,0x706D61,'Y','Y','Y','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N'),
 (0x25,0x73736F6C7574696F6E,0x73736F6C7574696F6E,'Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','N','N'),
 (0x6C6F63616C686F7374,0x6F737469636B6574,0x6F737469636B6574,'Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','N','N'),
 (0x6C6F63616C686F7374,0x657469636B6574,0x657469636B6574,'Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','N','N');
/*!40000 ALTER TABLE `db` ENABLE KEYS */;


--
-- Definition of table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `db` char(64) character set utf8 collate utf8_bin NOT NULL default '',
  `name` char(64) NOT NULL default '',
  `body` longblob NOT NULL,
  `definer` char(77) character set utf8 collate utf8_bin NOT NULL default '',
  `execute_at` datetime default NULL,
  `interval_value` int(11) default NULL,
  `interval_field` enum('YEAR','QUARTER','MONTH','DAY','HOUR','MINUTE','WEEK','SECOND','MICROSECOND','YEAR_MONTH','DAY_HOUR','DAY_MINUTE','DAY_SECOND','HOUR_MINUTE','HOUR_SECOND','MINUTE_SECOND','DAY_MICROSECOND','HOUR_MICROSECOND','MINUTE_MICROSECOND','SECOND_MICROSECOND') default NULL,
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL default '0000-00-00 00:00:00',
  `last_executed` datetime default NULL,
  `starts` datetime default NULL,
  `ends` datetime default NULL,
  `status` enum('ENABLED','DISABLED','SLAVESIDE_DISABLED') NOT NULL default 'ENABLED',
  `on_completion` enum('DROP','PRESERVE') NOT NULL default 'DROP',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE') NOT NULL default '',
  `comment` char(64) character set utf8 collate utf8_bin NOT NULL default '',
  `originator` int(10) NOT NULL,
  `time_zone` char(64) character set latin1 NOT NULL default 'SYSTEM',
  `character_set_client` char(32) character set utf8 collate utf8_bin default NULL,
  `collation_connection` char(32) character set utf8 collate utf8_bin default NULL,
  `db_collation` char(32) character set utf8 collate utf8_bin default NULL,
  `body_utf8` longblob,
  PRIMARY KEY  (`db`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Events';

--
-- Dumping data for table `event`
--

/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;


--
-- Definition of table `func`
--

DROP TABLE IF EXISTS `func`;
CREATE TABLE `func` (
  `name` char(64) collate utf8_bin NOT NULL default '',
  `ret` tinyint(1) NOT NULL default '0',
  `dl` char(128) collate utf8_bin NOT NULL default '',
  `type` enum('function','aggregate') character set utf8 NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User defined functions';

--
-- Dumping data for table `func`
--

/*!40000 ALTER TABLE `func` DISABLE KEYS */;
/*!40000 ALTER TABLE `func` ENABLE KEYS */;



--
-- Definition of table `help_category`
--

DROP TABLE IF EXISTS `help_category`;
CREATE TABLE `help_category` (
  `help_category_id` smallint(5) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint(5) unsigned default NULL,
  `url` char(128) NOT NULL,
  PRIMARY KEY  (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help categories';

--
-- Dumping data for table `help_category`
--

/*!40000 ALTER TABLE `help_category` DISABLE KEYS */;
INSERT INTO `help_category` (`help_category_id`,`name`,`parent_category_id`,`url`) VALUES 
 (1,'Geographic',0,''),
 (2,'Polygon properties',31,''),
 (3,'WKT',31,''),
 (4,'Numeric Functions',35,''),
 (5,'Plugins',32,''),
 (6,'MBR',31,''),
 (7,'Control flow functions',35,''),
 (8,'Transactions',32,''),
 (9,'Account Management',32,''),
 (10,'Point properties',31,''),
 (11,'Encryption Functions',35,''),
 (12,'LineString properties',31,''),
 (13,'Logical operators',35,''),
 (14,'Miscellaneous Functions',35,''),
 (15,'Functions and Modifiers for Use with GROUP BY',32,''),
 (16,'Information Functions',35,''),
 (17,'Storage Engines',32,''),
 (18,'Comparison operators',35,''),
 (19,'Bit Functions',35,''),
 (20,'Table Maintenance',32,''),
 (21,'Data Types',32,''),
 (22,'Triggers',32,''),
 (23,'Geometry constructors',31,''),
 (24,'GeometryCollection properties',1,''),
 (25,'Data Manipulation',32,''),
 (26,'Administration',32,''),
 (27,'Geometry relations',31,''),
 (28,'Language Structure',32,''),
 (29,'Date and Time Functions',35,''),
 (30,'WKB',31,''),
 (31,'Geographic Features',32,''),
 (32,'Contents',0,''),
 (33,'Geometry properties',31,''),
 (34,'String Functions',35,''),
 (35,'Functions',32,''),
 (36,'Stored Routines',32,''),
 (37,'Data Definition',32,'');
/*!40000 ALTER TABLE `help_category` ENABLE KEYS */;


--
-- Definition of table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY  (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help keywords';

--
-- Dumping data for table `help_keyword`
--

/*!40000 ALTER TABLE `help_keyword` DISABLE KEYS */;
INSERT INTO `help_keyword` (`help_keyword_id`,`name`) VALUES 
 (0,'JOIN'),
 (1,'HOST'),
 (2,'REPEAT'),
 (3,'SERIALIZABLE'),
 (4,'REPLACE'),
 (5,'AT'),
 (6,'SCHEDULE'),
 (7,'RETURNS'),
 (8,'STARTS'),
 (9,'MASTER_SSL_CA'),
 (10,'NCHAR'),
 (11,'COMPLETION'),
 (12,'COLUMNS'),
 (13,'WORK'),
 (14,'DATETIME'),
 (15,'MODE'),
 (16,'OPEN'),
 (17,'INTEGER'),
 (18,'ESCAPE'),
 (19,'VALUE'),
 (20,'GEOMETRYCOLLECTIONFROMWKB'),
 (21,'MASTER_SSL_VERIFY_SERVER_CERT'),
 (22,'SQL_BIG_RESULT'),
 (23,'DROP'),
 (24,'EVENTS'),
 (25,'MONTH'),
 (26,'INFO'),
 (27,'DUPLICATE'),
 (28,'REPLICATION'),
 (29,'INNODB'),
 (30,'YEAR_MONTH'),
 (31,'SUBJECT'),
 (32,'PREPARE'),
 (33,'LOCK'),
 (34,'NDB'),
 (35,'CHECK'),
 (36,'FULL'),
 (37,'INT4'),
 (38,'BY'),
 (39,'NO'),
 (40,'MINUTE'),
 (41,'DATA'),
 (42,'PARTITION'),
 (43,'DAY'),
 (44,'SHARE'),
 (45,'REAL'),
 (46,'SEPARATOR'),
 (47,'DELETE'),
 (48,'ON'),
 (49,'CONNECTION'),
 (50,'CLOSE'),
 (51,'X509'),
 (52,'USE'),
 (53,'WHERE'),
 (54,'PRIVILEGES'),
 (55,'EVENT'),
 (56,'SPATIAL'),
 (57,'SUPER'),
 (58,'SQL_BUFFER_RESULT'),
 (59,'IGNORE'),
 (60,'QUICK'),
 (61,'SIGNED'),
 (62,'SECURITY'),
 (63,'POLYGONFROMWKB'),
 (64,'NDBCLUSTER'),
 (65,'FALSE'),
 (66,'LEVEL'),
 (67,'FORCE'),
 (68,'BINARY'),
 (69,'TO'),
 (70,'CHANGE'),
 (71,'CURRENT_USER'),
 (72,'HOUR_MINUTE'),
 (73,'PRESERVE'),
 (74,'UPDATE'),
 (75,'INTO'),
 (76,'FEDERATED'),
 (77,'VARYING'),
 (78,'HOUR_SECOND'),
 (79,'VARIABLE'),
 (80,'ROLLBACK'),
 (81,'PROCEDURE'),
 (82,'RTREE'),
 (83,'TIMESTAMP'),
 (84,'IMPORT'),
 (85,'AGAINST'),
 (86,'CHECKSUM'),
 (87,'COUNT'),
 (88,'LONGBINARY'),
 (89,'THEN'),
 (90,'INSERT'),
 (91,'ENGINES'),
 (92,'HANDLER'),
 (93,'PORT'),
 (94,'DAY_SECOND'),
 (95,'EXISTS'),
 (96,'MUTEX'),
 (97,'RELEASE'),
 (98,'BOOLEAN'),
 (99,'MOD'),
 (100,'DEFAULT'),
 (101,'TYPE'),
 (102,'NO_WRITE_TO_BINLOG'),
 (103,'OPTIMIZE'),
 (104,'RESET'),
 (105,'INSTALL'),
 (106,'ITERATE'),
 (107,'DO'),
 (108,'BIGINT'),
 (109,'SET'),
 (110,'ISSUER'),
 (111,'DATE'),
 (112,'STATUS'),
 (113,'FULLTEXT'),
 (114,'COMMENT'),
 (115,'MASTER_CONNECT_RETRY'),
 (116,'INNER'),
 (117,'STOP'),
 (118,'MASTER_LOG_FILE'),
 (119,'MRG_MYISAM'),
 (120,'PRECISION'),
 (121,'REQUIRE'),
 (122,'TRAILING'),
 (123,'LONG'),
 (124,'OPTION'),
 (125,'REORGANIZE'),
 (126,'ELSE'),
 (127,'DEALLOCATE'),
 (128,'IO_THREAD'),
 (129,'CASE'),
 (130,'CIPHER'),
 (131,'CONTINUE'),
 (132,'FROM'),
 (133,'READ'),
 (134,'LEFT'),
 (135,'ELSEIF'),
 (136,'MINUTE_SECOND'),
 (137,'COMPACT'),
 (138,'RESTORE'),
 (139,'DEC'),
 (140,'FOR'),
 (141,'WARNINGS'),
 (142,'MIN_ROWS'),
 (143,'STRING'),
 (144,'CONDITION'),
 (145,'FUNCTION'),
 (146,'ENCLOSED'),
 (147,'AGGREGATE'),
 (148,'FIELDS'),
 (149,'INT3'),
 (150,'ARCHIVE'),
 (151,'ADD'),
 (152,'AVG_ROW_LENGTH'),
 (153,'KILL'),
 (154,'FLOAT4'),
 (155,'TABLESPACE'),
 (156,'VIEW'),
 (157,'REPEATABLE'),
 (158,'INFILE'),
 (159,'ORDER'),
 (160,'USING'),
 (161,'MIDDLEINT'),
 (162,'GRANT'),
 (163,'UNSIGNED'),
 (164,'DECIMAL'),
 (165,'GEOMETRYFROMTEXT'),
 (166,'INDEXES'),
 (167,'FOREIGN'),
 (168,'CACHE'),
 (169,'HOSTS'),
 (170,'COMMIT'),
 (171,'SCHEMAS'),
 (172,'LEADING'),
 (173,'SNAPSHOT'),
 (174,'DECLARE'),
 (175,'LOAD'),
 (176,'SQL_CACHE'),
 (177,'CONVERT'),
 (178,'DYNAMIC'),
 (179,'POLYGONFROMTEXT'),
 (180,'COLLATE'),
 (181,'BYTE'),
 (182,'LINESTRINGFROMWKB'),
 (183,'GLOBAL'),
 (184,'WHEN'),
 (185,'HAVING'),
 (186,'AS'),
 (187,'STARTING'),
 (188,'RELOAD'),
 (189,'AUTOCOMMIT'),
 (190,'REVOKE'),
 (191,'GRANTS'),
 (192,'OUTER'),
 (193,'FLOOR'),
 (194,'WITH'),
 (195,'STD'),
 (196,'AFTER'),
 (197,'CSV'),
 (198,'DISABLE'),
 (199,'UNINSTALL'),
 (200,'OUTFILE'),
 (201,'LOW_PRIORITY'),
 (202,'FILE'),
 (203,'SCHEMA'),
 (204,'SONAME'),
 (205,'POW'),
 (206,'MULTIPOINTFROMWKB'),
 (207,'INDEX'),
 (208,'DUAL'),
 (209,'DEFINER'),
 (210,'MULTIPOINTFROMTEXT'),
 (211,'BACKUP'),
 (212,'REMOVE'),
 (213,'MULTILINESTRINGFROMWKB'),
 (214,'EXTENDED'),
 (215,'CROSS'),
 (216,'CONTRIBUTORS'),
 (217,'NATIONAL'),
 (218,'GROUP'),
 (219,'ONLINE'),
 (220,'UNDO'),
 (221,'ZEROFILL'),
 (222,'CLIENT'),
 (223,'MASTER_PASSWORD'),
 (224,'OWNER'),
 (225,'RELAY_LOG_FILE'),
 (226,'TRUE'),
 (227,'CHARACTER'),
 (228,'MASTER_USER'),
 (229,'TABLE'),
 (230,'ENGINE'),
 (231,'INSERT_METHOD'),
 (232,'CASCADE'),
 (233,'RELAY_LOG_POS'),
 (234,'SQL_CALC_FOUND_ROWS'),
 (235,'UNION'),
 (236,'MYISAM'),
 (237,'LEAVE'),
 (238,'MODIFY'),
 (239,'MATCH'),
 (240,'MASTER_LOG_POS'),
 (241,'DESC'),
 (242,'DISTINCTROW'),
 (243,'TIME'),
 (244,'NUMERIC'),
 (245,'EXPANSION'),
 (246,'CURSOR'),
 (247,'CODE'),
 (248,'GEOMETRYCOLLECTIONFROMTEXT'),
 (249,'CHAIN'),
 (250,'FLUSH'),
 (251,'CREATE'),
 (252,'DESCRIBE'),
 (253,'MAX_UPDATES_PER_HOUR'),
 (254,'INT2'),
 (255,'ENDS'),
 (256,'PROCESSLIST'),
 (257,'LOGS'),
 (258,'DISCARD'),
 (259,'HEAP'),
 (260,'SOUNDS'),
 (261,'BETWEEN'),
 (262,'MULTILINESTRINGFROMTEXT'),
 (263,'REPAIR'),
 (264,'PACK_KEYS'),
 (265,'CALL'),
 (266,'FAST'),
 (267,'VALUES'),
 (268,'LOOP'),
 (269,'VARCHARACTER'),
 (270,'BEFORE'),
 (271,'TRUNCATE'),
 (272,'SHOW'),
 (273,'REDUNDANT'),
 (274,'ALL'),
 (275,'USER_RESOURCES'),
 (276,'PARTIAL'),
 (277,'BINLOG'),
 (278,'END'),
 (279,'SECOND'),
 (280,'AND'),
 (281,'FLOAT8'),
 (282,'PREV'),
 (283,'HOUR'),
 (284,'SELECT'),
 (285,'DATABASES'),
 (286,'OR'),
 (287,'IDENTIFIED'),
 (288,'WRAPPER'),
 (289,'MASTER_SSL_CIPHER'),
 (290,'SQL_SLAVE_SKIP_COUNTER'),
 (291,'BOTH'),
 (292,'BOOL'),
 (293,'YEAR'),
 (294,'MASTER_PORT'),
 (295,'CONCURRENT'),
 (296,'HELP'),
 (297,'UNIQUE'),
 (298,'TRIGGERS'),
 (299,'PROCESS'),
 (300,'OPTIONS'),
 (301,'CONSISTENT'),
 (302,'MASTER_SSL'),
 (303,'DATE_ADD'),
 (304,'MAX_CONNECTIONS_PER_HOUR'),
 (305,'LIKE'),
 (306,'PLUGIN'),
 (307,'FETCH'),
 (308,'IN'),
 (309,'COLUMN'),
 (310,'DUMPFILE'),
 (311,'USAGE'),
 (312,'EXECUTE'),
 (313,'MEMORY'),
 (314,'CEIL'),
 (315,'QUERY'),
 (316,'MASTER_HOST'),
 (317,'LINES'),
 (318,'SQL_THREAD'),
 (319,'SERVER'),
 (320,'MAX_QUERIES_PER_HOUR'),
 (321,'MULTIPOLYGONFROMWKB'),
 (322,'MASTER_SSL_CERT'),
 (323,'TRANSACTION'),
 (324,'DAY_MINUTE'),
 (325,'DATE_SUB'),
 (326,'REBUILD'),
 (327,'GEOMETRYFROMWKB'),
 (328,'RENAME'),
 (329,'INT1'),
 (330,'PARSER'),
 (331,'ALTER'),
 (332,'MAX_ROWS'),
 (333,'RIGHT'),
 (334,'SOCKET'),
 (335,'STRAIGHT_JOIN'),
 (336,'NATURAL'),
 (337,'VARIABLES'),
 (338,'ESCAPED'),
 (339,'SHA1'),
 (340,'KEY_BLOCK_SIZE'),
 (341,'PASSWORD'),
 (342,'CHAR'),
 (343,'OFFSET'),
 (344,'NEXT'),
 (345,'SQL_LOG_BIN'),
 (346,'ERRORS'),
 (347,'TEMPORARY'),
 (348,'COMMITTED'),
 (349,'SQL_SMALL_RESULT'),
 (350,'UPGRADE'),
 (351,'BEGIN'),
 (352,'DELAY_KEY_WRITE'),
 (353,'MEDIUM'),
 (354,'INTERVAL'),
 (355,'SSL'),
 (356,'DAY_HOUR'),
 (357,'REFERENCES'),
 (358,'AES_ENCRYPT'),
 (359,'EVERY'),
 (360,'STORAGE'),
 (361,'ISOLATION'),
 (362,'INT8'),
 (363,'AUTHORS'),
 (364,'RESTRICT'),
 (365,'LINESTRINGFROMTEXT'),
 (366,'UNCOMMITTED'),
 (367,'IS'),
 (368,'NOT'),
 (369,'ANALYSE'),
 (370,'DES_KEY_FILE'),
 (371,'COMPRESSED'),
 (372,'START'),
 (373,'PLUGINS'),
 (374,'SAVEPOINT'),
 (375,'IF'),
 (376,'PRIMARY'),
 (377,'PURGE'),
 (378,'USER'),
 (379,'INNOBASE'),
 (380,'LAST'),
 (381,'EXIT'),
 (382,'KEYS'),
 (383,'LIMIT'),
 (384,'KEY'),
 (385,'MERGE'),
 (386,'UNTIL'),
 (387,'SQL_NO_CACHE'),
 (388,'DELAYED'),
 (389,'ANALYZE'),
 (390,'CONSTRAINT'),
 (391,'SERIAL'),
 (392,'ACTION'),
 (393,'WRITE'),
 (394,'SESSION'),
 (395,'DATABASE'),
 (396,'NULL'),
 (397,'USE_FRM'),
 (398,'SLAVE'),
 (399,'TERMINATED'),
 (400,'ASC'),
 (401,'ENABLE'),
 (402,'OPTIONALLY'),
 (403,'DIRECTORY'),
 (404,'WHILE'),
 (405,'MAX_USER_CONNECTIONS'),
 (406,'DISTINCT'),
 (407,'LOCAL'),
 (408,'MASTER_SSL_KEY'),
 (409,'NONE'),
 (410,'TABLES'),
 (411,'<>'),
 (412,'RLIKE'),
 (413,'TRIGGER'),
 (414,'COLLATION'),
 (415,'SHUTDOWN'),
 (416,'HIGH_PRIORITY'),
 (417,'BTREE'),
 (418,'FIRST'),
 (419,'COALESCE'),
 (420,'TYPES'),
 (421,'MASTER'),
 (422,'FIXED'),
 (423,'MULTIPOLYGONFROMTEXT'),
 (424,'ROW_FORMAT');
/*!40000 ALTER TABLE `help_keyword` ENABLE KEYS */;


--
-- Definition of table `help_relation`
--

DROP TABLE IF EXISTS `help_relation`;
CREATE TABLE `help_relation` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `help_keyword_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`help_keyword_id`,`help_topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='keyword-topic relation';

--
-- Dumping data for table `help_relation`
--

/*!40000 ALTER TABLE `help_relation` DISABLE KEYS */;
INSERT INTO `help_relation` (`help_topic_id`,`help_keyword_id`) VALUES 
 (0,0),
 (334,0),
 (445,1),
 (214,2),
 (420,3),
 (42,4),
 (399,4),
 (80,5),
 (80,6),
 (384,6),
 (195,7),
 (80,8),
 (175,9),
 (404,10),
 (80,11),
 (384,11),
 (21,12),
 (326,12),
 (134,13),
 (356,14),
 (79,15),
 (334,15),
 (15,16),
 (95,16),
 (121,16),
 (326,16),
 (195,17),
 (471,17),
 (359,18),
 (224,19),
 (97,20),
 (175,21),
 (334,22),
 (8,23),
 (29,23),
 (78,23),
 (176,23),
 (219,23),
 (244,23),
 (256,23),
 (280,23),
 (311,23),
 (383,23),
 (392,23),
 (435,23),
 (111,24),
 (355,25),
 (241,26),
 (93,27),
 (187,28),
 (326,29),
 (378,29),
 (440,29),
 (355,30),
 (187,31),
 (33,32),
 (219,32),
 (34,33),
 (334,33),
 (440,34),
 (393,35),
 (435,35),
 (440,35),
 (21,36),
 (274,36),
 (326,36),
 (425,36),
 (440,36),
 (471,37),
 (47,38),
 (70,38),
 (75,38),
 (187,38),
 (334,38),
 (341,38),
 (399,38),
 (435,38),
 (440,38),
 (440,39),
 (444,39),
 (355,40),
 (106,41),
 (399,41),
 (440,41),
 (445,41),
 (435,42),
 (440,42),
 (355,43),
 (334,44),
 (195,45),
 (294,45),
 (341,46),
 (47,47),
 (440,47),
 (444,47),
 (0,48),
 (80,48),
 (384,48),
 (444,48),
 (164,49),
 (440,49),
 (50,50),
 (95,50),
 (187,51),
 (0,52),
 (47,53),
 (75,53),
 (95,53),
 (180,54),
 (187,54),
 (230,54),
 (80,55),
 (280,55),
 (336,55),
 (384,55),
 (197,56),
 (435,56),
 (187,57),
 (334,58),
 (0,59),
 (75,59),
 (93,59),
 (334,59),
 (399,59),
 (435,59),
 (47,60),
 (393,60),
 (438,60),
 (356,61),
 (187,62),
 (82,63),
 (454,63),
 (440,64),
 (364,65),
 (420,66),
 (0,67),
 (37,68),
 (356,68),
 (175,69),
 (432,69),
 (436,69),
 (175,70),
 (435,70),
 (80,71),
 (384,71),
 (355,72),
 (80,73),
 (384,73),
 (75,74),
 (93,74),
 (334,74),
 (444,74),
 (42,75),
 (93,75),
 (284,75),
 (334,75),
 (440,76),
 (238,77),
 (355,78),
 (118,79),
 (134,80),
 (432,80),
 (17,81),
 (173,81),
 (281,81),
 (308,81),
 (326,81),
 (334,81),
 (392,81),
 (413,81),
 (459,81),
 (197,82),
 (88,83),
 (177,83),
 (399,84),
 (435,84),
 (79,85),
 (379,86),
 (440,86),
 (62,87),
 (309,87),
 (407,87),
 (265,88),
 (27,89),
 (76,89),
 (395,89),
 (93,90),
 (181,90),
 (282,90),
 (458,90),
 (261,91),
 (326,91),
 (95,92),
 (293,92),
 (445,93),
 (355,94),
 (8,95),
 (29,95),
 (80,95),
 (143,95),
 (176,95),
 (256,95),
 (280,95),
 (326,96),
 (345,96),
 (134,97),
 (432,97),
 (23,98),
 (79,98),
 (101,99),
 (162,99),
 (42,100),
 (93,100),
 (143,100),
 (185,100),
 (198,100),
 (224,100),
 (435,100),
 (440,100),
 (435,101),
 (103,102),
 (307,102),
 (438,102),
 (442,102),
 (103,103),
 (435,103),
 (36,104),
 (107,104),
 (139,104),
 (245,104),
 (396,105),
 (113,106),
 (80,107),
 (114,107),
 (384,107),
 (466,107),
 (206,108),
 (42,109),
 (75,109),
 (118,109),
 (127,109),
 (134,109),
 (143,109),
 (171,109),
 (198,109),
 (313,109),
 (326,109),
 (399,109),
 (435,109),
 (440,109),
 (444,109),
 (450,109),
 (464,109),
 (187,110),
 (119,111),
 (243,111),
 (355,111),
 (356,111),
 (54,112),
 (124,112),
 (200,112),
 (208,112),
 (308,112),
 (326,112),
 (345,112),
 (378,112),
 (197,113),
 (435,113),
 (440,113),
 (80,114),
 (384,114),
 (440,114),
 (175,115),
 (0,116),
 (51,117),
 (175,118),
 (440,119),
 (294,120),
 (187,121),
 (428,122),
 (265,123),
 (187,124),
 (230,124),
 (435,125),
 (76,126),
 (395,126),
 (219,127),
 (51,128),
 (305,128),
 (76,129),
 (395,129),
 (187,130),
 (293,131),
 (47,132),
 (106,132),
 (111,132),
 (326,132),
 (334,132),
 (340,132),
 (428,132),
 (34,133),
 (95,133),
 (420,133),
 (0,134),
 (27,135),
 (355,136),
 (440,137),
 (167,138),
 (194,139),
 (168,140),
 (293,140),
 (326,140),
 (334,140),
 (397,140),
 (309,141),
 (326,141),
 (440,142),
 (195,143),
 (168,144),
 (17,145),
 (195,145),
 (281,145),
 (308,145),
 (326,145),
 (383,145),
 (392,145),
 (413,145),
 (459,145),
 (399,146),
 (195,147),
 (326,148),
 (399,148),
 (233,149),
 (440,150),
 (56,151),
 (435,151),
 (435,152),
 (440,152),
 (164,153),
 (156,154),
 (435,155),
 (29,156),
 (147,156),
 (427,156),
 (420,157),
 (399,158),
 (47,159),
 (75,159),
 (334,159),
 (341,159),
 (435,159),
 (0,160),
 (47,160),
 (77,160),
 (233,161),
 (187,162),
 (230,162),
 (23,163),
 (117,163),
 (156,163),
 (194,163),
 (294,163),
 (356,163),
 (471,163),
 (144,164),
 (195,164),
 (389,165),
 (326,166),
 (435,167),
 (440,167),
 (444,167),
 (445,167),
 (91,168),
 (139,168),
 (284,168),
 (133,169),
 (326,169),
 (134,170),
 (148,171),
 (326,171),
 (428,172),
 (134,173),
 (168,174),
 (185,174),
 (293,174),
 (397,174),
 (106,175),
 (284,175),
 (340,175),
 (399,175),
 (334,176),
 (356,177),
 (440,178),
 (373,179),
 (143,180),
 (198,180),
 (440,180),
 (437,181),
 (424,182),
 (118,183),
 (124,183),
 (171,183),
 (328,183),
 (420,183),
 (76,184),
 (395,184),
 (334,185),
 (0,186),
 (34,186),
 (334,186),
 (399,187),
 (187,188),
 (134,189),
 (230,190),
 (179,191),
 (326,191),
 (0,192),
 (206,193),
 (79,194),
 (187,194),
 (197,194),
 (435,194),
 (440,194),
 (385,195),
 (435,196),
 (399,197),
 (440,197),
 (80,198),
 (384,198),
 (435,198),
 (271,199),
 (334,200),
 (34,201),
 (42,201),
 (47,201),
 (75,201),
 (93,201),
 (399,201),
 (187,202),
 (143,203),
 (176,203),
 (198,203),
 (289,203),
 (326,203),
 (468,203),
 (195,204),
 (455,205),
 (434,206),
 (0,207),
 (56,207),
 (78,207),
 (91,207),
 (197,207),
 (284,207),
 (288,207),
 (326,207),
 (435,207),
 (440,207),
 (258,208),
 (80,209),
 (384,209),
 (401,210),
 (337,211),
 (435,212),
 (252,213),
 (438,214),
 (0,215),
 (6,216),
 (326,216),
 (238,217),
 (404,217),
 (334,218),
 (435,219),
 (293,220),
 (23,221),
 (117,221),
 (156,221),
 (194,221),
 (294,221),
 (471,221),
 (187,222),
 (175,223),
 (445,224),
 (175,225),
 (364,226),
 (143,227),
 (198,227),
 (238,227),
 (313,227),
 (326,227),
 (399,227),
 (404,227),
 (440,227),
 (175,228),
 (56,229),
 (98,229),
 (103,229),
 (167,229),
 (200,229),
 (256,229),
 (257,229),
 (301,229),
 (326,229),
 (337,229),
 (340,229),
 (379,229),
 (393,229),
 (435,229),
 (438,229),
 (440,229),
 (442,229),
 (326,230),
 (345,230),
 (435,230),
 (440,230),
 (440,231),
 (29,232),
 (256,232),
 (440,232),
 (444,232),
 (175,233),
 (334,234),
 (285,235),
 (440,236),
 (290,237),
 (435,238),
 (79,239),
 (175,240),
 (310,241),
 (334,241),
 (341,241),
 (334,242),
 (295,243),
 (354,243),
 (356,243),
 (194,244),
 (79,245),
 (397,246),
 (459,247),
 (227,248),
 (134,249),
 (139,250),
 (307,250),
 (17,251),
 (20,251),
 (56,251),
 (70,251),
 (80,251),
 (143,251),
 (195,251),
 (197,251),
 (257,251),
 (281,251),
 (289,251),
 (326,251),
 (336,251),
 (427,251),
 (440,251),
 (445,251),
 (310,252),
 (187,253),
 (215,254),
 (80,255),
 (326,256),
 (425,256),
 (37,257),
 (326,257),
 (436,257),
 (435,258),
 (440,259),
 (357,260),
 (135,261),
 (96,262),
 (435,263),
 (438,263),
 (440,264),
 (318,265),
 (393,266),
 (42,267),
 (323,268),
 (238,269),
 (436,270),
 (301,271),
 (6,272),
 (9,272),
 (17,272),
 (21,272),
 (24,272),
 (32,272),
 (37,272),
 (54,272),
 (62,272),
 (111,272),
 (121,272),
 (124,272),
 (133,272),
 (148,272),
 (179,272),
 (180,272),
 (200,272),
 (208,272),
 (257,272),
 (261,272),
 (274,272),
 (288,272),
 (289,272),
 (308,272),
 (309,272),
 (313,272),
 (326,272),
 (328,272),
 (336,272),
 (345,272),
 (378,272),
 (425,272),
 (459,272),
 (462,272),
 (440,273),
 (187,274),
 (230,274),
 (285,274),
 (334,274),
 (307,275),
 (440,276),
 (111,277),
 (27,278),
 (76,278),
 (214,278),
 (306,278),
 (323,278),
 (395,278),
 (466,278),
 (355,279),
 (135,280),
 (296,280),
 (294,281),
 (95,282),
 (355,283),
 (42,284),
 (237,284),
 (241,284),
 (282,284),
 (334,284),
 (148,285),
 (326,285),
 (129,286),
 (70,287),
 (187,287),
 (445,288),
 (175,289),
 (171,290),
 (428,291),
 (23,292),
 (99,292),
 (355,293),
 (175,294),
 (399,295),
 (108,296),
 (369,296),
 (435,297),
 (24,298),
 (326,298),
 (187,299),
 (353,300),
 (445,300),
 (134,301),
 (175,302),
 (355,303),
 (187,304),
 (326,305),
 (357,305),
 (271,306),
 (326,306),
 (396,306),
 (362,307),
 (79,308),
 (111,308),
 (334,308),
 (435,309),
 (334,310),
 (187,311),
 (77,312),
 (187,312),
 (334,313),
 (421,314),
 (79,315),
 (139,315),
 (164,315),
 (175,316),
 (399,317),
 (51,318),
 (305,318),
 (8,319),
 (353,319),
 (445,319),
 (187,320),
 (112,321),
 (175,322),
 (134,323),
 (420,323),
 (355,324),
 (355,325),
 (435,326),
 (132,327),
 (98,328),
 (207,328),
 (384,328),
 (435,328),
 (468,328),
 (23,329),
 (197,330),
 (435,330),
 (440,330),
 (56,331),
 (147,331),
 (187,331),
 (198,331),
 (353,331),
 (384,331),
 (413,331),
 (435,331),
 (440,332),
 (0,333),
 (445,334),
 (0,335),
 (334,335),
 (0,336),
 (326,337),
 (328,337),
 (399,338),
 (264,339),
 (440,340),
 (70,341),
 (187,341),
 (445,341),
 (450,341),
 (356,342),
 (437,342),
 (334,343),
 (95,344),
 (464,345),
 (62,346),
 (326,346),
 (256,347),
 (420,348),
 (334,349),
 (393,350),
 (134,351),
 (306,351),
 (440,352),
 (393,353),
 (80,354),
 (355,354),
 (187,355),
 (355,356),
 (187,357),
 (440,357),
 (444,357),
 (467,358),
 (80,359),
 (261,360),
 (420,361),
 (117,362),
 (9,363),
 (326,363),
 (29,364),
 (256,364),
 (444,364),
 (53,365),
 (420,366),
 (348,367),
 (80,368),
 (143,368),
 (292,368),
 (173,369),
 (307,370),
 (440,371),
 (134,372),
 (305,372),
 (32,373),
 (432,374),
 (8,375),
 (27,375),
 (29,375),
 (80,375),
 (143,375),
 (176,375),
 (256,375),
 (280,375),
 (452,375),
 (435,376),
 (436,377),
 (70,378),
 (207,378),
 (311,378),
 (445,378),
 (440,379),
 (95,380),
 (293,381),
 (288,382),
 (326,382),
 (435,382),
 (47,383),
 (75,383),
 (95,383),
 (111,383),
 (334,383),
 (56,384),
 (93,384),
 (435,384),
 (440,384),
 (444,384),
 (440,385),
 (214,386),
 (334,387),
 (42,388),
 (93,388),
 (458,388),
 (435,389),
 (442,389),
 (435,390),
 (440,390),
 (224,391),
 (440,391),
 (440,392),
 (444,392),
 (34,393),
 (118,394),
 (124,394),
 (328,394),
 (420,394),
 (143,395),
 (176,395),
 (198,395),
 (289,395),
 (326,395),
 (445,395),
 (468,395),
 (348,396),
 (444,396),
 (438,397),
 (36,398),
 (51,398),
 (80,398),
 (133,398),
 (208,398),
 (305,398),
 (384,398),
 (399,399),
 (334,400),
 (341,400),
 (80,401),
 (384,401),
 (435,401),
 (399,402),
 (440,403),
 (466,404),
 (187,405),
 (268,406),
 (285,406),
 (334,406),
 (341,406),
 (363,406),
 (407,406),
 (449,406),
 (34,407),
 (103,407),
 (307,407),
 (399,407),
 (438,407),
 (442,407),
 (175,408),
 (187,409),
 (34,410),
 (121,410),
 (274,410),
 (326,410),
 (465,411),
 (26,412),
 (20,413),
 (244,413),
 (326,413),
 (326,414),
 (462,414),
 (187,415),
 (93,416),
 (334,416),
 (197,417),
 (95,418),
 (435,418),
 (440,418),
 (435,419),
 (326,420),
 (37,421),
 (54,421),
 (106,421),
 (175,421),
 (245,421),
 (340,421),
 (436,421),
 (194,422),
 (440,422),
 (186,423),
 (440,424);
/*!40000 ALTER TABLE `help_relation` ENABLE KEYS */;


--
-- Definition of table `help_topic`
--

DROP TABLE IF EXISTS `help_topic`;
CREATE TABLE `help_topic` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint(5) unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` char(128) NOT NULL,
  PRIMARY KEY  (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help topics';

--
-- Dumping data for table `help_topic`
--

/*!40000 ALTER TABLE `help_topic` DISABLE KEYS */;
INSERT INTO `help_topic` (`help_topic_id`,`name`,`help_category_id`,`description`,`example`,`url`) VALUES 
 (0,'JOIN',25,'MySQL supports the following JOIN syntaxes for the table_references\npart of SELECT statements and multiple-table DELETE and UPDATE\nstatements:\n\ntable_references:\n    table_reference [, table_reference] ...\n\ntable_reference:\n    table_factor\n  | join_table\n\ntable_factor:\n    tbl_name [[AS] alias] [index_hint_list]\n  | ( table_references )\n  | { OJ table_reference LEFT OUTER JOIN table_reference\n        ON conditional_expr }\n\njoin_table:\n    table_reference [INNER | CROSS] JOIN table_factor [join_condition]\n  | table_reference STRAIGHT_JOIN table_factor\n  | table_reference STRAIGHT_JOIN table_factor ON condition\n  | table_reference LEFT [OUTER] JOIN table_reference join_condition\n  | table_reference NATURAL [LEFT [OUTER]] JOIN table_factor\n  | table_reference RIGHT [OUTER] JOIN table_reference join_condition\n  | table_reference NATURAL [RIGHT [OUTER]] JOIN table_factor\n\njoin_condition:\n    ON conditional_expr\n  | USING (column_list)\n\nindex_hint_list:\n    index_hint [, index_hint] ...\n\nindex_hint:\n    USE {INDEX|KEY}\n      [{FOR {JOIN|ORDER BY|GROUP BY}] ([index_list])\n  | IGNORE {INDEX|KEY}\n      [{FOR {JOIN|ORDER BY|GROUP BY}] (index_list)\n  | FORCE {INDEX|KEY}\n      [{FOR {JOIN|ORDER BY|GROUP BY}] (index_list)\n\nindex_list:\n    index_name [, index_name] ...\n\nA table reference is also known as a join expression.\n\nThe syntax of table_factor is extended in comparison with the SQL\nStandard. The latter accepts only table_reference, not a list of them\ninside a pair of parentheses.\n\nThis is a conservative extension if we consider each comma in a list of\ntable_reference items as equivalent to an inner join. For example:\n\nSELECT * FROM t1 LEFT JOIN (t2, t3, t4)\n                 ON (t2.a=t1.a AND t3.b=t1.b AND t4.c=t1.c)\n\nis equivalent to:\n\nSELECT * FROM t1 LEFT JOIN (t2 CROSS JOIN t3 CROSS JOIN t4)\n                 ON (t2.a=t1.a AND t3.b=t1.b AND t4.c=t1.c)\n\nIn MySQL, CROSS JOIN is a syntactic equivalent to INNER JOIN (they can\nreplace each other). In standard SQL, they are not equivalent. INNER\nJOIN is used with an ON clause, CROSS JOIN is used otherwise.\n\nIn general, parentheses can be ignored in join expressions containing\nonly inner join operations. MySQL also supports nested joins (see\nhttp://dev.mysql.com/doc/refman/5.1/en/nested-joins.html).\n\nIndex hints can be specified to affect how the MySQL optimizer makes\nuse of indexes. For more information, see\nhttp://dev.mysql.com/doc/refman/5.1/en/index-hints.html.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/join.html\n\n','SELECT left_tbl.*\n  FROM left_tbl LEFT JOIN right_tbl ON left_tbl.id = right_tbl.id\n  WHERE right_tbl.id IS NULL;\n','http://dev.mysql.com/doc/refman/5.1/en/join.html'),
 (1,'HEX',34,'Syntax:\nHEX(N_or_S)\n\nIf N_or_S is a number, returns a string representation of the\nhexadecimal value of N, where N is a longlong (BIGINT) number. This is\nequivalent to CONV(N,10,16).\n\nIf N_or_S is a string, returns a hexadecimal string representation of\nN_or_S where each character in N_or_S is converted to two hexadecimal\ndigits.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT HEX(255);\n        -> \'FF\'\nmysql> SELECT 0x616263;\n        -> \'abc\'\nmysql> SELECT HEX(\'abc\');\n        -> 616263\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (2,'REPLACE',34,'Syntax:\nREPLACE(str,from_str,to_str)\n\nReturns the string str with all occurrences of the string from_str\nreplaced by the string to_str. REPLACE() performs a case-sensitive\nmatch when searching for from_str.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT REPLACE(\'www.mysql.com\', \'w\', \'Ww\');\n        -> \'WwWwWw.mysql.com\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (3,'CONTAINS',27,'Contains(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 completely contains g2. This\ntests the opposite relationship as Within().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/functions-that-test-spatial-relationships-between-geometries.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/functions-that-test-spatial-relationships-between-geometries.html'),
 (4,'SRID',33,'SRID(g)\n\nReturns an integer indicating the Spatial Reference System ID for the\ngeometry value g.\n\nIn MySQL, the SRID value is just an integer associated with the\ngeometry value. All calculations are done assuming Euclidean (planar)\ngeometry.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/general-geometry-property-functions.html\n\n','mysql> SELECT SRID(GeomFromText(\'LineString(1 1,2 2)\',101));\n+-----------------------------------------------+\n| SRID(GeomFromText(\'LineString(1 1,2 2)\',101)) |\n+-----------------------------------------------+\n|                                           101 |\n+-----------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/general-geometry-property-functions.html'),
 (5,'CURRENT_TIMESTAMP',29,'Syntax:\nCURRENT_TIMESTAMP, CURRENT_TIMESTAMP()\n\nCURRENT_TIMESTAMP and CURRENT_TIMESTAMP() are synonyms for NOW().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (6,'SHOW CONTRIBUTORS',25,'Syntax:\nSHOW CONTRIBUTORS\n\nThe SHOW CONTRIBUTORS statement displays information about the people\nwho contribute to MySQL source or to causes that MySQL AB supports. For\neach contributor, it displays Name, Location, and Comment values.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-contributors.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-contributors.html'),
 (7,'VARIANCE',15,'Syntax:\nVARIANCE(expr)\n\nReturns the population standard variance of expr. This is an extension\nto standard SQL. The standard SQL function VAR_POP() can be used\ninstead.\n\nVARIANCE() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html'),
 (8,'DROP SERVER',37,'Syntax:\nDROP SERVER [ IF EXISTS ] server_name\n\nDrops the server definition for the server named server_name. The\ncorresponding row within the mysql.servers table will be deleted. This\nstatement requires the SUPER privilege.\n\nDropping a server for a table does not affect any FEDERATED tables that\nused this connection information when they were created. See [HELP\nCREATE SERVER].\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/drop-server.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/drop-server.html'),
 (9,'SHOW AUTHORS',25,'Syntax:\nSHOW AUTHORS\n\nThe SHOW AUTHORS statement displays information about the people who\nwork on MySQL. For each author, it displays Name, Location, and Comment\nvalues.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-authors.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-authors.html'),
 (10,'VAR_SAMP',15,'Syntax:\nVAR_SAMP(expr)\n\nReturns the sample variance of expr. That is, the denominator is the\nnumber of rows minus one.\n\nVAR_SAMP() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html'),
 (11,'CONCAT',34,'Syntax:\nCONCAT(str1,str2,...)\n\nReturns the string that results from concatenating the arguments. May\nhave one or more arguments. If all arguments are non-binary strings,\nthe result is a non-binary string. If the arguments include any binary\nstrings, the result is a binary string. A numeric argument is converted\nto its equivalent binary string form; if you want to avoid that, you\ncan use an explicit type cast, as in this example:\n\nSELECT CONCAT(CAST(int_col AS CHAR), char_col);\n\nCONCAT() returns NULL if any argument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT CONCAT(\'My\', \'S\', \'QL\');\n        -> \'MySQL\'\nmysql> SELECT CONCAT(\'My\', NULL, \'QL\');\n        -> NULL\nmysql> SELECT CONCAT(14.3);\n        -> \'14.3\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (12,'GEOMETRY HIERARCHY',31,'Geometry is the base class. It is an abstract class. The instantiable\nsubclasses of Geometry are restricted to zero-, one-, and\ntwo-dimensional geometric objects that exist in two-dimensional\ncoordinate space. All instantiable geometry classes are defined so that\nvalid instances of a geometry class are topologically closed (that is,\nall defined geometries include their boundary).\n\nThe base Geometry class has subclasses for Point, Curve, Surface, and\nGeometryCollection:\n\no Point represents zero-dimensional objects.\n\no Curve represents one-dimensional objects, and has subclass\n  LineString, with sub-subclasses Line and LinearRing.\n\no Surface is designed for two-dimensional objects and has subclass\n  Polygon.\n\no GeometryCollection has specialized zero-, one-, and two-dimensional\n  collection classes named MultiPoint, MultiLineString, and\n  MultiPolygon for modeling geometries corresponding to collections of\n  Points, LineStrings, and Polygons, respectively. MultiCurve and\n  MultiSurface are introduced as abstract superclasses that generalize\n  the collection interfaces to handle Curves and Surfaces.\n\nGeometry, Curve, Surface, MultiCurve, and MultiSurface are defined as\nnon-instantiable classes. They define a common set of methods for their\nsubclasses and are included for extensibility.\n\nPoint, LineString, Polygon, GeometryCollection, MultiPoint,\nMultiLineString, and MultiPolygon are instantiable classes.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-geometry-class-hierarchy.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-geometry-class-hierarchy.html'),
 (13,'CHAR FUNCTION',34,'Syntax:\nCHAR(N,... [USING charset_name])\n\nCHAR() interprets each argument N as an integer and returns a string\nconsisting of the characters given by the code values of those\nintegers. NULL values are skipped.\nBy default, CHAR() returns a binary string. To produce a string in a\ngiven character set, use the optional USING clause:\n\nmysql> SELECT CHARSET(CHAR(0x65)), CHARSET(CHAR(0x65 USING utf8));\n+---------------------+--------------------------------+\n| CHARSET(CHAR(0x65)) | CHARSET(CHAR(0x65 USING utf8)) |\n+---------------------+--------------------------------+\n| binary              | utf8                           |\n+---------------------+--------------------------------+\n\nIf USING is given and the result string is illegal for the given\ncharacter set, a warning is issued. Also, if strict SQL mode is\nenabled, the result from CHAR() becomes NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT CHAR(77,121,83,81,\'76\');\n        -> \'MySQL\'\nmysql> SELECT CHAR(77,77.3,\'77.3\');\n        -> \'MMM\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (14,'DATETIME',21,'DATETIME\n\nA date and time combination. The supported range is \'1000-01-01\n00:00:00\' to \'9999-12-31 23:59:59\'. MySQL displays DATETIME values in\n\'YYYY-MM-DD HH:MM:SS\' format, but allows assignment of values to\nDATETIME columns using either strings or numbers.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-type-overview.html'),
 (15,'OPEN',36,'Syntax:\nOPEN cursor_name\n\nThis statement opens a previously declared cursor.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/open.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/open.html'),
 (16,'SHOW CREATE TRIGGER',25,'Syntax:\nSHOW CREATE TRIGGER trigger_name\n\nThis statement shows a CREATE TRIGGER statement that creates the given\ntrigger.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-create-trigger.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-create-trigger.html'),
 (17,'SHOW CREATE PROCEDURE',25,'Syntax:\nSHOW CREATE {PROCEDURE | FUNCTION} sp_name\n\nThese statements are MySQL extensions. Similar to SHOW CREATE TABLE,\nthey return the exact string that can be used to re-create the named\nroutine. The statements require that you be the owner of the routine or\nhave SELECT access to the mysql.proc table.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-create-procedure.html\n\n','mysql> SHOW CREATE FUNCTION test.hello\\G\n*************************** 1. row ***************************\n            Function: hello\n            sql_mode:\n     Create Function: CREATE FUNCTION `test`.`hello`(s CHAR(20)) »\n                      RETURNS CHAR(50)\n                      RETURN CONCAT(\'Hello, \',s,\'!\')\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n','http://dev.mysql.com/doc/refman/5.1/en/show-create-procedure.html'),
 (18,'INTEGER',21,'INTEGER[(M)] [UNSIGNED] [ZEROFILL]\n\nThis type is a synonym for INT.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html'),
 (19,'LOWER',34,'Syntax:\nLOWER(str)\n\nReturns the string str with all characters changed to lowercase\naccording to the current character set mapping. The default is latin1\n(cp1252 West European).\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT LOWER(\'QUADRATICALLY\');\n        -> \'quadratically\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (20,'CREATE TRIGGER',22,'Syntax:\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    TRIGGER trigger_name trigger_time trigger_event\n    ON tbl_name FOR EACH ROW trigger_stmt\n\nThis statement creates a new trigger. A trigger is a named database\nobject that is associated with a table, and that activates when a\nparticular event occurs for the table. Currently, CREATE TRIGGER\nrequires the TRIGGER privilege for the table associated with the\ntrigger. (This statement requires the SUPER privilege prior to MySQL\n5.1.6.)\n\nThe trigger becomes associated with the table named tbl_name, which\nmust refer to a permanent table. You cannot associate a trigger with a\nTEMPORARY table or a view.\n\nWhen the trigger is activated, the DEFINER clause determines the\nprivileges that apply, as described later in this section.\n\ntrigger_time is the trigger action time. It can be BEFORE or AFTER to\nindicate that the trigger activates before or after the statement that\nactivated it.\n\ntrigger_event indicates the kind of statement that activates the\ntrigger. The trigger_event can be one of the following:\n\no INSERT: The trigger is activated whenever a new row is inserted into\n  the table; for example, through INSERT, LOAD DATA, and REPLACE\n  statements.\n\no UPDATE: The trigger is activated whenever a row is modified; for\n  example, through UPDATE statements.\n\no DELETE: The trigger is activated whenever a row is deleted from the\n  table; for example, through DELETE and REPLACE statements. However,\n  DROP TABLE and TRUNCATE statements on the table do not activate this\n  trigger, because they do not use DELETE. Dropping a partition does\n  not activate DELETE triggers, either. See [HELP TRUNCATE TABLE].\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/create-trigger.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/create-trigger.html'),
 (21,'SHOW COLUMNS',25,'Syntax:\nSHOW [FULL] COLUMNS FROM tbl_name [FROM db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW COLUMNS displays information about the columns in a given table.\nIt also works for views. The LIKE clause, if present, indicates which\ncolumn names to match. The WHERE clause can be given to select rows\nusing more general conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.1/en/extended-show.html.\n\nThe FULL keyword causes the output to include the privileges you have\nas well as any per-column comments for each column.\n\nYou can use db_name.tbl_name as an alternative to the tbl_name FROM\ndb_name syntax. In other words, these two statements are equivalent:\n\nmysql> SHOW COLUMNS FROM mytable FROM mydb;\nmysql> SHOW COLUMNS FROM mydb.mytable;\n\nSHOW FIELDS is a synonym for SHOW COLUMNS. You can also list a table\'s\ncolumns with the mysqlshow db_name tbl_name command.\n\nThe DESCRIBE statement provides information similar to SHOW COLUMNS.\nSee [HELP DESCRIBE].\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-columns.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-columns.html'),
 (22,'MONTH',29,'Syntax:\nMONTH(date)\n\nReturns the month for date, in the range 0 to 12.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT MONTH(\'1998-02-03\');\n        -> 2\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (23,'TINYINT',21,'TINYINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA very small integer. The signed range is -128 to 127. The unsigned\nrange is 0 to 255.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html'),
 (24,'SHOW TRIGGERS',25,'Syntax:\nSHOW TRIGGERS [FROM db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TRIGGERS lists the triggers currently defined on the MySQL server.\nThis statement requires the SUPER privilege. The LIKE clause, if\npresent, indicates which trigger names to match. The WHERE clause can\nbe given to select rows using more general conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.1/en/extended-show.html.\n\nFor the trigger ins_sum as defined in\nhttp://dev.mysql.com/doc/refman/5.1/en/using-triggers.html, the output\nof this statement is as shown here:\n\nmysql> SHOW TRIGGERS LIKE \'acc%\'\\G\n*************************** 1. row ***************************\n             Trigger: ins_sum\n               Event: INSERT\n               Table: account\n           Statement: SET @sum = @sum + NEW.amount\n              Timing: BEFORE\n             Created: NULL\n            sql_mode:\n             Definer: myname@localhost\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n\ncharacter_set_client is the session value of the character_set_client\nsystem variable when the trigger was created. collation_connection is\nthe session value of the collation_connection system variable when the\ntrigger was created. Database Collation is the collation of the\ndatabase with which the trigger is associated. These columns were added\nin MySQL 5.1.21.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-triggers.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-triggers.html'),
 (25,'MASTER_POS_WAIT',14,'Syntax:\nMASTER_POS_WAIT(log_name,log_pos[,timeout])\n\nThis function is useful for control of master/slave synchronization. It\nblocks until the slave has read and applied all updates up to the\nspecified position in the master log. The return value is the number of\nlog events the slave had to wait for to advance to the specified\nposition. The function returns NULL if the slave SQL thread is not\nstarted, the slave\'s master information is not initialized, the\narguments are incorrect, or an error occurs. It returns -1 if the\ntimeout has been exceeded. If the slave SQL thread stops while\nMASTER_POS_WAIT() is waiting, the function returns NULL. If the slave\nis past the specified position, the function returns immediately.\n\nIf a timeout value is specified, MASTER_POS_WAIT() stops waiting when\ntimeout seconds have elapsed. timeout must be greater than 0; a zero or\nnegative timeout means no timeout.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html'),
 (26,'REGEXP',34,'Syntax:\nexpr REGEXP pat, expr RLIKE pat\n\nPerforms a pattern match of a string expression expr against a pattern\npat. The pattern can be an extended regular expression. The syntax for\nregular expressions is discussed in\nhttp://dev.mysql.com/doc/refman/5.1/en/regexp.html. Returns 1 if expr\nmatches pat; otherwise it returns 0. If either expr or pat is NULL, the\nresult is NULL. RLIKE is a synonym for REGEXP, provided for mSQL\ncompatibility.\n\nThe pattern need not be a literal string. For example, it can be\nspecified as a string expression or table column.\n\n*Note*: Because MySQL uses the C escape syntax in strings (for example,\n`\\n\' to represent the newline character), you must double any `\\\' that\nyou use in your REGEXP strings.\n\nREGEXP is not case sensitive, except when used with binary strings.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-comparison-functions.html\n\n','mysql> SELECT \'Monty!\' REGEXP \'m%y%%\';\n        -> 0\nmysql> SELECT \'Monty!\' REGEXP \'.*\';\n        -> 1\nmysql> SELECT \'new*\\n*line\' REGEXP \'new\\\\*.\\\\*line\';\n        -> 1\nmysql> SELECT \'a\' REGEXP \'A\', \'a\' REGEXP BINARY \'A\';\n        -> 1  0\nmysql> SELECT \'a\' REGEXP \'^[a-d]\';\n        -> 1\n','http://dev.mysql.com/doc/refman/5.1/en/string-comparison-functions.html'),
 (27,'IF STATEMENT',36,'Syntax:\nIF search_condition THEN statement_list\n    [ELSEIF search_condition THEN statement_list] ...\n    [ELSE statement_list]\nEND IF\n\nIF implements a basic conditional construct. If the search_condition\nevaluates to true, the corresponding SQL statement list is executed. If\nno search_condition matches, the statement list in the ELSE clause is\nexecuted. Each statement_list consists of one or more statements.\n\n*Note*: There is also an IF() function, which differs from the IF\nstatement described here. See [HELP CASE function].\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/if-statement.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/if-statement.html'),
 (28,'^',19,'Syntax:\n^\n\nBitwise XOR:\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/bit-functions.html\n\n','mysql> SELECT 1 ^ 1;\n        -> 0\nmysql> SELECT 1 ^ 0;\n        -> 1\nmysql> SELECT 11 ^ 3;\n        -> 8\n','http://dev.mysql.com/doc/refman/5.1/en/bit-functions.html'),
 (29,'DROP VIEW',37,'Syntax:\nDROP VIEW [IF EXISTS]\n    view_name [, view_name] ...\n    [RESTRICT | CASCADE]\n\nDROP VIEW removes one or more views. You must have the DROP privilege\nfor each view. If any of the views named in the argument list do not\nexist, MySQL returns an error indicating by name which non-existing\nviews it was unable to drop, but it also drops all of the views in the\nlist that do exist.\n\nThe IF EXISTS clause prevents an error from occurring for views that\ndon\'t exist. When this clause is given, a NOTE is generated for each\nnon-existent view. See [HELP SHOW WARNINGS].\n\nRESTRICT and CASCADE, if given, are parsed and ignored.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/drop-view.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/drop-view.html'),
 (30,'WITHIN',27,'Within(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially within g2. This\ntests the opposite relationship as Contains().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/functions-that-test-spatial-relationships-between-geometries.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/functions-that-test-spatial-relationships-between-geometries.html'),
 (31,'WEEK',29,'Syntax:\nWEEK(date[,mode])\n\nThis function returns the week number for date. The two-argument form\nof WEEK() allows you to specify whether the week starts on Sunday or\nMonday and whether the return value should be in the range from 0 to 53\nor from 1 to 53. If the mode argument is omitted, the value of the\ndefault_week_format system variable is used. See\nhttp://dev.mysql.com/doc/refman/5.1/en/server-system-variables.html.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT WEEK(\'1998-02-20\');\n        -> 7\nmysql> SELECT WEEK(\'1998-02-20\',0);\n        -> 7\nmysql> SELECT WEEK(\'1998-02-20\',1);\n        -> 8\nmysql> SELECT WEEK(\'1998-12-31\',1);\n        -> 53\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (32,'SHOW PLUGINS',25,'Syntax:\nSHOW PLUGINS\n\nSHOW PLUGINS displays information about known plugins.\n\nmysql> SHOW PLUGINS;\n+------------+--------+----------------+---------+\n| Name       | Status | Type           | Library |\n+------------+--------+----------------+---------+\n| MEMORY     | ACTIVE | STORAGE ENGINE | NULL    |\n| MyISAM     | ACTIVE | STORAGE ENGINE | NULL    |\n| InnoDB     | ACTIVE | STORAGE ENGINE | NULL    |\n| ARCHIVE    | ACTIVE | STORAGE ENGINE | NULL    |\n| CSV        | ACTIVE | STORAGE ENGINE | NULL    |\n| BLACKHOLE  | ACTIVE | STORAGE ENGINE | NULL    |\n| FEDERATED  | ACTIVE | STORAGE ENGINE | NULL    |\n| MRG_MYISAM | ACTIVE | STORAGE ENGINE | NULL    |\n+------------+--------+----------------+---------+\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-plugins.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-plugins.html'),
 (33,'PREPARE',25,'Syntax:\nPREPARE stmt_name FROM preparable_stmt\n\nThe PREPARE statement prepares a statement and assigns it a name,\nstmt_name, by which to refer to the statement later. Statement names\nare not case sensitive. preparable_stmt is either a string literal or a\nuser variable that contains the text of the statement. The text must\nrepresent a single SQL statement, not multiple statements. Within the\nstatement, `?\' characters can be used as parameter markers to indicate\nwhere data values are to be bound to the query later when you execute\nit. The `?\' characters should not be enclosed within quotes, even if\nyou intend to bind them to string values. Parameter markers can be used\nonly where data values should appear, not for SQL keywords,\nidentifiers, and so forth.\n\nIf a prepared statement with the given name already exists, it is\ndeallocated implicitly before the new statement is prepared. This means\nthat if the new statement contains an error and cannot be prepared, an\nerror is returned and no statement with the given name exists.\n\nThe scope of a prepared statement is the client session within which it\nis created. Other clients cannot see it.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/sqlps.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/sqlps.html'),
 (34,'LOCK',8,'Syntax:\nLOCK TABLES\n    tbl_name [[AS] alias] lock_type\n    [, tbl_name [[AS] alias] lock_type] ...\n\nlock_type:\n    READ [LOCAL]\n  | [LOW_PRIORITY] WRITE\n\nUNLOCK TABLES\n\nLOCK TABLES locks base tables (but not views) for the current thread.\nTo use LOCK TABLES, you must have the LOCK TABLES privilege, and the\nSELECT privilege for each table to be locked.\n\nUNLOCK TABLES explicitly releases any table locks held by the current\nthread. Another use for UNLOCK TABLES is to release the global read\nlock acquired with FLUSH TABLES WITH READ LOCK. (You can lock all\ntables in all databases with read locks with the FLUSH TABLES WITH READ\nLOCK statement. See [HELP FLUSH]. This is a very convenient way to get\nbackups if you have a filesystem such as Veritas that can take\nsnapshots in time.)\n\nThe following general rules apply to acquisition and release of locks\nby a given thread:\n\no Table locks are acquired with LOCK TABLES.\n\no If the LOCK TABLES statement must wait due to locks held by other\n  threads on any of the tables, it blocks until all locks can be\n  acquired.\n\no Table locks are released explicitly with UNLOCK TABLES.\n\no Table locks are released implicitly under these conditions:\n\n  o LOCK TABLES releases any table locks currently held by the thread\n    before acquiring new locks.\n\n  o Beginning a transaction (for example, with START TRANSACTION)\n    implicitly performs an UNLOCK TABLES. (Additional information about\n    the interaction between table locking and transactions is given\n    later in the section.)\n\n  o If a client connection drops, the server releases table locks held\n    by the client. If the client reconnects, the locks will no longer\n    be in effect. For this reason, clients may wish to disable\n    auto-reconnect. With auto-reconnect in effect, the client is not\n    notified if reconnect occurs but any table locks will have been\n    lost. With auto-reconnect disabled, if the connection drops, an\n    error occurs for the next statement issued. The client can detect\n    the error and take appropriate action such as reacquiring the\n    locks. See\n    http://dev.mysql.com/doc/refman/5.1/en/auto-reconnect.html.\n\no One thread cannot release another thread\'s locks.\n\n*Note*: If you use ALTER TABLE on a locked table, it may become\nunlocked. See\nhttp://dev.mysql.com/doc/refman/5.1/en/alter-table-problems.html.\n\nThe main reasons to use LOCK TABLES are to emulate transactions or to\nget more speed when updating tables. This is explained in more detail\nlater in this section.\n\nA table lock protects only against inappropriate reads or writes by\nother clients. The client holding the lock, even a read lock, can\nperform table-level operations such as DROP TABLE. Truncate operations\nare not transaction-safe, so an error occurs if the client attempts one\nduring an active transaction or while holding a table lock.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/lock-tables.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/lock-tables.html'),
 (35,'UPDATEXML',34,'Syntax:\nUpdateXML(xml_target, xpath_expr, new_xml)\n\nThis function replaces a single portion of a given fragment of XML\nmarkup xml_target with a new XML fragment new_xml, and then returns the\nchanged XML. The portion of xml_target that is replaced matches an\nXPath expression xpath_expr supplied by the user. If no expression\nmatching xpath_expr is found, or if multiple matches are found, the\nfunction returns the original xml_target XML fragment. All three\narguments must be strings.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/xml-functions.html\n\n','mysql> SELECT\n    ->   UpdateXML(\'<a><b>ccc</b><d></d></a>\', \'/a\', \'<e>fff</e>\') AS val1,\n    ->   UpdateXML(\'<a><b>ccc</b><d></d></a>\', \'/b\', \'<e>fff</e>\') AS val2,\n    ->   UpdateXML(\'<a><b>ccc</b><d></d></a>\', \'//b\', \'<e>fff</e>\') AS val3,\n    ->   UpdateXML(\'<a><b>ccc</b><d></d></a>\', \'/a/d\', \'<e>fff</e>\') AS val4,\n    ->   UpdateXML(\'<a><d></d><b>ccc</b><d></d></a>\', \'/a/d\', \'<e>fff</e>\') AS val5\n    -> \\G\n\n*************************** 1. row ***************************\nval1: <e>fff</e>\nval2: <a><b>ccc</b><d></d></a>\nval3: <a><e>fff</e><d></d></a>\nval4: <a><b>ccc</b><e>fff</e></a>\nval5: <a><d></d><b>ccc</b><d></d></a>\n','http://dev.mysql.com/doc/refman/5.1/en/xml-functions.html'),
 (36,'RESET SLAVE',25,'Syntax:\nRESET SLAVE\n\nRESET SLAVE makes the slave forget its replication position in the\nmaster\'s binary logs. This statement is meant to be used for a clean\nstart: It deletes the master.info and relay-log.info files, all the\nrelay logs, and starts a new relay log.\n\n*Note*: All relay logs are deleted, even if they have not been\ncompletely executed by the slave SQL thread. (This is a condition\nlikely to exist on a replication slave if you have issued a STOP SLAVE\nstatement or if the slave is highly loaded.)\n\nConnection information stored in the master.info file is immediately\nreset using any values specified in the corresponding startup options.\nThis information includes values such as master host, master port,\nmaster user, and master password. If the slave SQL thread was in the\nmiddle of replicating temporary tables when it was stopped, and RESET\nSLAVE is issued, these replicated temporary tables are deleted on the\nslave.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/reset-slave.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/reset-slave.html'),
 (37,'SHOW BINARY LOGS',25,'Syntax:\nSHOW BINARY LOGS\nSHOW MASTER LOGS\n\nLists the binary log files on the server. This statement is used as\npart of the procedure described in [HELP PURGE MASTER LOGS], that shows\nhow to determine which logs can be purged.\n\nmysql> SHOW BINARY LOGS;\n+---------------+-----------+\n| Log_name      | File_size |\n+---------------+-----------+\n| binlog.000015 |    724935 |\n| binlog.000016 |    733481 |\n+---------------+-----------+\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-binary-logs.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-binary-logs.html'),
 (38,'POLYGON',23,'Polygon(ls1,ls2,...)\n\nConstructs a WKB Polygon value from a number of WKB LineString\narguments. If any argument does not represent the WKB of a LinearRing\n(that is, not a closed and simple LineString) the return value is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-mysql-specific-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-mysql-specific-functions.html'),
 (39,'MINUTE',29,'Syntax:\nMINUTE(time)\n\nReturns the minute for time, in the range 0 to 59.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT MINUTE(\'98-02-03 10:05:03\');\n        -> 5\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (40,'DAY',29,'Syntax:\nDAY(date)\n\nDAY() is a synonym for DAYOFMONTH().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (41,'MID',34,'Syntax:\nMID(str,pos,len)\n\nMID(str,pos,len) is a synonym for SUBSTRING(str,pos,len).\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (42,'REPLACE INTO',25,'Syntax:\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name [(col_name,...)]\n    VALUES ({expr | DEFAULT},...),(...),...\n\nOr:\n\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name\n    SET col_name={expr | DEFAULT}, ...\n\nOr:\n\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name [(col_name,...)]\n    SELECT ...\n\nREPLACE works exactly like INSERT, except that if an old row in the\ntable has the same value as a new row for a PRIMARY KEY or a UNIQUE\nindex, the old row is deleted before the new row is inserted. See [HELP\nINSERT].\n\nREPLACE is a MySQL extension to the SQL standard. It either inserts, or\ndeletes and inserts. For another MySQL extension to standard SQL ---\nthat either inserts or updates --- see\nhttp://dev.mysql.com/doc/refman/5.1/en/insert-on-duplicate.html.\n\nNote that unless the table has a PRIMARY KEY or UNIQUE index, using a\nREPLACE statement makes no sense. It becomes equivalent to INSERT,\nbecause there is no index to be used to determine whether a new row\nduplicates another.\n\nValues for all columns are taken from the values specified in the\nREPLACE statement. Any missing columns are set to their default values,\njust as happens for INSERT. You cannot refer to values from the current\nrow and use them in the new row. If you use an assignment such as SET\ncol_name = col_name + 1, the reference to the column name on the right\nhand side is treated as DEFAULT(col_name), so the assignment is\nequivalent to SET col_name = DEFAULT(col_name) + 1.\n\nTo use REPLACE, you must have both the INSERT and DELETE privileges for\nthe table.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/replace.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/replace.html'),
 (43,'UUID',14,'Syntax:\nUUID()\n\nReturns a Universal Unique Identifier (UUID) generated according to\n\"DCE 1.1: Remote Procedure Call\" (Appendix A) CAE (Common Applications\nEnvironment) Specifications published by The Open Group in October 1997\n(Document Number C706,\nhttp://www.opengroup.org/public/pubs/catalog/c706.htm).\n\nA UUID is designed as a number that is globally unique in space and\ntime. Two calls to UUID() are expected to generate two different\nvalues, even if these calls are performed on two separate computers\nthat are not connected to each other.\n\nA UUID is a 128-bit number represented by a string of five hexadecimal\nnumbers in aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee format:\n\no The first three numbers are generated from a timestamp.\n\no The fourth number preserves temporal uniqueness in case the timestamp\n  value loses monotonicity (for example, due to daylight saving time).\n\no The fifth number is an IEEE 802 node number that provides spatial\n  uniqueness. A random number is substituted if the latter is not\n  available (for example, because the host computer has no Ethernet\n  card, or we do not know how to find the hardware address of an\n  interface on your operating system). In this case, spatial uniqueness\n  cannot be guaranteed. Nevertheless, a collision should have very low\n  probability.\n\n  Currently, the MAC address of an interface is taken into account only\n  on FreeBSD and Linux. On other operating systems, MySQL uses a\n  randomly generated 48-bit number.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html\n\n','mysql> SELECT UUID();\n        -> \'6ccd780c-baba-1026-9564-0040f4311e29\'\n','http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html'),
 (44,'LINESTRING',23,'LineString(pt1,pt2,...)\n\nConstructs a WKB LineString value from a number of WKB Point arguments.\nIf any argument is not a WKB Point, the return value is NULL. If the\nnumber of Point arguments is less than two, the return value is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-mysql-specific-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-mysql-specific-functions.html'),
 (45,'SLEEP',14,'Syntax:\nSLEEP(duration)\n\nSleeps (pauses) for the number of seconds given by the duration\nargument, then returns 0. If SLEEP() is interrupted, it returns 1. The\nduration may have a fractional part given in microseconds.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html'),
 (46,'CONNECTION_ID',16,'Syntax:\nCONNECTION_ID()\n\nReturns the connection ID (thread ID) for the connection. Every\nconnection has an ID that is unique among the set of currently\nconnected clients.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/information-functions.html\n\n','mysql> SELECT CONNECTION_ID();\n        -> 23786\n','http://dev.mysql.com/doc/refman/5.1/en/information-functions.html'),
 (47,'DELETE',25,'Syntax:\nSingle-table syntax:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE] FROM tbl_name\n    [WHERE where_condition]\n    [ORDER BY ...]\n    [LIMIT row_count]\n\nMultiple-table syntax:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE]\n    tbl_name[.*] [, tbl_name[.*]] ...\n    FROM table_references\n    [WHERE where_condition]\n\nOr:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE]\n    FROM tbl_name[.*] [, tbl_name[.*]] ...\n    USING table_references\n    [WHERE where_condition]\n\nFor the single-table syntax, the DELETE statement deletes rows from\ntbl_name and returns the number of rows deleted. The WHERE clause, if\ngiven, specifies the conditions that identify which rows to delete.\nWith no WHERE clause, all rows are deleted. If the ORDER BY clause is\nspecified, the rows are deleted in the order that is specified. The\nLIMIT clause places a limit on the number of rows that can be deleted.\n\nFor the multiple-table syntax, DELETE deletes from each tbl_name the\nrows that satisfy the conditions. In this case, ORDER BY and LIMIT\ncannot be used.\n\nwhere_condition is an expression that evaluates to true for each row to\nbe deleted. It is specified as described in [HELP SELECT].\n\nAs stated, a DELETE statement with no WHERE clause deletes all rows. A\nfaster way to do this, when you do not want to know the number of\ndeleted rows, is to use TRUNCATE TABLE. See [HELP TRUNCATE TABLE].\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/delete.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/delete.html'),
 (48,'ROUND',4,'Syntax:\nROUND(X), ROUND(X,D)\n\nRounds the argument X to D decimal places. The rounding algorithm\ndepends on the data type of X. D defaults to 0 if not specified. D can\nbe negative to cause D digits left of the decimal point of the value X\nto become zero.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT ROUND(-1.23);\n        -> -1\nmysql> SELECT ROUND(-1.58);\n        -> -2\nmysql> SELECT ROUND(1.58);\n        -> 2\nmysql> SELECT ROUND(1.298, 1);\n        -> 1.3\nmysql> SELECT ROUND(1.298, 0);\n        -> 1\nmysql> SELECT ROUND(23.298, -1);\n        -> 20\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (49,'NULLIF',7,'Syntax:\nNULLIF(expr1,expr2)\n\nReturns NULL if expr1 = expr2 is true, otherwise returns expr1. This is\nthe same as CASE WHEN expr1 = expr2 THEN NULL ELSE expr1 END.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/control-flow-functions.html\n\n','mysql> SELECT NULLIF(1,1);\n        -> NULL\nmysql> SELECT NULLIF(1,2);\n        -> 1\n','http://dev.mysql.com/doc/refman/5.1/en/control-flow-functions.html'),
 (50,'CLOSE',36,'Syntax:\nCLOSE cursor_name\n\nThis statement closes a previously opened cursor.\n\nIf not closed explicitly, a cursor is closed at the end of the compound\nstatement in which it was declared.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/close.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/close.html'),
 (51,'STOP SLAVE',25,'Syntax:\nSTOP SLAVE [thread_type [, thread_type] ... ]\n\nthread_type: IO_THREAD | SQL_THREAD\n\nStops the slave threads. STOP SLAVE requires the SUPER privilege.\n\nLike START SLAVE, this statement may be used with the IO_THREAD and\nSQL_THREAD options to name the thread or threads to be stopped.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/stop-slave.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/stop-slave.html'),
 (52,'TIMEDIFF',29,'Syntax:\nTIMEDIFF(expr1,expr2)\n\nTIMEDIFF() returns expr1 - expr2 expressed as a time value. expr1 and\nexpr2 are time or date-and-time expressions, but both must be of the\nsame type.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT TIMEDIFF(\'2000:01:01 00:00:00\',\n    ->                 \'2000:01:01 00:00:00.000001\');\n        -> \'-00:00:00.000001\'\nmysql> SELECT TIMEDIFF(\'1997-12-31 23:59:59.000001\',\n    ->                 \'1997-12-30 01:01:01.000002\');\n        -> \'46:58:57.999999\'\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (53,'LINEFROMTEXT',3,'LineFromText(wkt[,srid]), LineStringFromText(wkt[,srid])\n\nConstructs a LINESTRING value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-wkt-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-wkt-functions.html'),
 (54,'SHOW MASTER STATUS',25,'Syntax:\nSHOW MASTER STATUS\n\nProvides status information about the binary log files of the master.\nExample:\n\nmysql > SHOW MASTER STATUS;\n+---------------+----------+--------------+------------------+\n| File          | Position | Binlog_Do_DB | Binlog_Ignore_DB |\n+---------------+----------+--------------+------------------+\n| mysql-bin.003 | 73       | test         | manual,mysql     |\n+---------------+----------+--------------+------------------+\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-master-status.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-master-status.html'),
 (55,'ADDTIME',29,'Syntax:\nADDTIME(expr1,expr2)\n\nADDTIME() adds expr2 to expr1 and returns the result. expr1 is a time\nor datetime expression, and expr2 is a time expression.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT ADDTIME(\'1997-12-31 23:59:59.999999\',\n    ->                \'1 1:1:1.000002\');\n        -> \'1998-01-02 01:01:01.000001\'\nmysql> SELECT ADDTIME(\'01:00:00.999999\', \'02:00:00.999998\');\n        -> \'03:00:01.999997\'\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (56,'SPATIAL',31,'MySQL can create spatial indexes using syntax similar to that for\ncreating regular indexes, but extended with the SPATIAL keyword.\nCurrently, columns in spatial indexes must be declared NOT NULL. The\nfollowing examples demonstrate how to create spatial indexes:\n\no With CREATE TABLE:\n\nCREATE TABLE geom (g GEOMETRY NOT NULL, SPATIAL INDEX(g));\n\no With ALTER TABLE:\n\nALTER TABLE geom ADD SPATIAL INDEX(g);\n\no With CREATE INDEX:\n\nCREATE SPATIAL INDEX sp_index ON geom (g);\n\nFor MyISAM tables, SPATIAL INDEX creates an R-tree index. For storage\nengines that support non-spatial indexing of spatial columns, the\nengine creates a B-tree index. A B-tree index on spatial values will be\nuseful for exact-value lookups, but not for range scans.\n\nFor more information on indexing spatial columns, see [HELP CREATE\nINDEX].\n\nTo drop spatial indexes, use ALTER TABLE or DROP INDEX:\n\no With ALTER TABLE:\n\nALTER TABLE geom DROP INDEX g;\n\no With DROP INDEX:\n\nDROP INDEX sp_index ON geom;\n\nExample: Suppose that a table geom contains more than 32,000\ngeometries, which are stored in the column g of type GEOMETRY. The\ntable also has an AUTO_INCREMENT column fid for storing object ID\nvalues.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/creating-spatial-indexes.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/creating-spatial-indexes.html'),
 (57,'TIMESTAMPDIFF',29,'Syntax:\nTIMESTAMPDIFF(unit,datetime_expr1,datetime_expr2)\n\nReturns the integer difference between the date or datetime expressions\ndatetime_expr1 and datetime_expr2. The unit for the result is given by\nthe unit argument. The legal values for unit are the same as those\nlisted in the description of the TIMESTAMPADD() function.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT TIMESTAMPDIFF(MONTH,\'2003-02-01\',\'2003-05-01\');\n        -> 3\nmysql> SELECT TIMESTAMPDIFF(YEAR,\'2002-05-01\',\'2001-01-01\');\n        -> -1\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (58,'UPPER',34,'Syntax:\nUPPER(str)\n\nReturns the string str with all characters changed to uppercase\naccording to the current character set mapping. The default is latin1\n(cp1252 West European).\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT UPPER(\'Hej\');\n        -> \'HEJ\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (59,'FROM_UNIXTIME',29,'Syntax:\nFROM_UNIXTIME(unix_timestamp), FROM_UNIXTIME(unix_timestamp,format)\n\nReturns a representation of the unix_timestamp argument as a value in\n\'YYYY-MM-DD HH:MM:SS\' or YYYYMMDDHHMMSS format, depending on whether\nthe function is used in a string or numeric context. The value is\nexpressed in the current time zone. unix_timestamp is an internal\ntimestamp value such as is produced by the UNIX_TIMESTAMP() function.\n\nIf format is given, the result is formatted according to the format\nstring, which is used the same way as listed in the entry for the\nDATE_FORMAT() function.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT FROM_UNIXTIME(875996580);\n        -> \'1997-10-04 22:23:00\'\nmysql> SELECT FROM_UNIXTIME(875996580) + 0;\n        -> 19971004222300\nmysql> SELECT FROM_UNIXTIME(UNIX_TIMESTAMP(),\n    ->                      \'%Y %D %M %h:%i:%s %x\');\n        -> \'2003 6th August 06:22:58 2003\'\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (60,'MEDIUMBLOB',21,'MEDIUMBLOB\n\nA BLOB column with a maximum length of 16,777,215 (224 - 1) bytes.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html'),
 (61,'IFNULL',7,'Syntax:\nIFNULL(expr1,expr2)\n\nIf expr1 is not NULL, IFNULL() returns expr1; otherwise it returns\nexpr2. IFNULL() returns a numeric or string value, depending on the\ncontext in which it is used.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/control-flow-functions.html\n\n','mysql> SELECT IFNULL(1,0);\n        -> 1\nmysql> SELECT IFNULL(NULL,10);\n        -> 10\nmysql> SELECT IFNULL(1/0,10);\n        -> 10\nmysql> SELECT IFNULL(1/0,\'yes\');\n        -> \'yes\'\n','http://dev.mysql.com/doc/refman/5.1/en/control-flow-functions.html'),
 (62,'SHOW ERRORS',25,'Syntax:\nSHOW ERRORS [LIMIT [offset,] row_count]\nSHOW COUNT(*) ERRORS\n\nThis statement is similar to SHOW WARNINGS, except that instead of\ndisplaying errors, warnings, and notes, it displays only errors.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\n[HELP SELECT].\n\nThe SHOW COUNT(*) ERRORS statement displays the number of errors. You\ncan also retrieve this number from the error_count variable:\n\nSHOW COUNT(*) ERRORS;\nSELECT @@error_count;\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-errors.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-errors.html'),
 (63,'LEAST',18,'Syntax:\nLEAST(value1,value2,...)\n\nWith two or more arguments, returns the smallest (minimum-valued)\nargument. The arguments are compared using the following rules:\n\no If the return value is used in an INTEGER context or all arguments\n  are integer-valued, they are compared as integers.\n\no If the return value is used in a REAL context or all arguments are\n  real-valued, they are compared as reals.\n\no If any argument is a case-sensitive string, the arguments are\n  compared as case-sensitive strings.\n\no In all other cases, the arguments are compared as case-insensitive\n  strings.\n\nLEAST() returns NULL if any argument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html\n\n','mysql> SELECT LEAST(2,0);\n        -> 0\nmysql> SELECT LEAST(34.0,3.0,5.0,767.0);\n        -> 3.0\nmysql> SELECT LEAST(\'B\',\'A\',\'C\');\n        -> \'A\'\n','http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html'),
 (64,'=',18,'=\n\nEqual:\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html\n\n','mysql> SELECT 1 = 0;\n        -> 0\nmysql> SELECT \'0\' = 0;\n        -> 1\nmysql> SELECT \'0.0\' = 0;\n        -> 1\nmysql> SELECT \'0.01\' = 0;\n        -> 0\nmysql> SELECT \'.01\' = 0.01;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html'),
 (65,'REVERSE',34,'Syntax:\nREVERSE(str)\n\nReturns the string str with the order of the characters reversed.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT REVERSE(\'abc\');\n        -> \'cba\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (66,'ISNULL',18,'Syntax:\nISNULL(expr)\n\nIf expr is NULL, ISNULL() returns 1, otherwise it returns 0.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html\n\n','mysql> SELECT ISNULL(1+1);\n        -> 0\nmysql> SELECT ISNULL(1/0);\n        -> 1\n','http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html'),
 (67,'BINARY',21,'BINARY(M)\n\nThe BINARY type is similar to the CHAR type, but stores binary byte\nstrings rather than non-binary character strings.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html'),
 (68,'BLOB DATA TYPE',21,'A BLOB is a binary large object that can hold a variable amount of\ndata. The four BLOB types are TINYBLOB, BLOB, MEDIUMBLOB, and LONGBLOB.\nThese differ only in the maximum length of the values they can hold.\nThe four TEXT types are TINYTEXT, TEXT, MEDIUMTEXT, and LONGTEXT. These\ncorrespond to the four BLOB types and have the same maximum lengths and\nstorage requirements. See\nhttp://dev.mysql.com/doc/refman/5.1/en/storage-requirements.html. No\nlettercase conversion for TEXT or BLOB columns takes place during\nstorage or retrieval.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/blob.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/blob.html'),
 (69,'BOUNDARY',33,'Boundary(g)\n\nReturns a geometry that is the closure of the combinatorial boundary of\nthe geometry value g.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/general-geometry-property-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/general-geometry-property-functions.html'),
 (70,'CREATE USER',9,'Syntax:\nCREATE USER user [IDENTIFIED BY [PASSWORD] \'password\']\n    [, user [IDENTIFIED BY [PASSWORD] \'password\']] ...\n\nThe CREATE USER statement creates new MySQL accounts. To use it, you\nmust have the global CREATE USER privilege or the INSERT privilege for\nthe mysql database. For each account, CREATE USER creates a new row in\nthe mysql.user table that has no privileges. An error occurs if the\naccount already exists. Each account is named using the same format as\nfor the GRANT statement; for example, \'jeffrey\'@\'localhost\'. If you\nspecify only the username part of the account name, a hostname part of\n\'%\' is used. For additional information about specifying account names,\nsee [HELP GRANT].\n\nThe account can be given a password with the optional IDENTIFIED BY\nclause. The user value and the password are given the same way as for\nthe GRANT statement. In particular, to specify the password in plain\ntext, omit the PASSWORD keyword. To specify the password as the hashed\nvalue as returned by the PASSWORD() function, include the PASSWORD\nkeyword. See [HELP GRANT].\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/create-user.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/create-user.html'),
 (71,'POINT',23,'Point(x,y)\n\nConstructs a WKB Point using its coordinates.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-mysql-specific-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-mysql-specific-functions.html'),
 (72,'CURRENT_USER',16,'Syntax:\nCURRENT_USER, CURRENT_USER()\n\nReturns the username and hostname combination for the MySQL account\nthat the server used to authenticate the current client. This account\ndetermines your access privileges. Within a stored routine that is\ndefined with the SQL SECURITY DEFINER characteristic, CURRENT_USER()\nreturns the creator of the routine. The return value is a string in the\nutf8 character set.\n\nThe value of CURRENT_USER() can differ from the value of USER().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/information-functions.html\n\n','mysql> SELECT USER();\n        -> \'davida@localhost\'\nmysql> SELECT * FROM mysql.user;\nERROR 1044: Access denied for user \'\'@\'localhost\' to\ndatabase \'mysql\'\nmysql> SELECT CURRENT_USER();\n        -> \'@localhost\'\n','http://dev.mysql.com/doc/refman/5.1/en/information-functions.html'),
 (73,'LCASE',34,'Syntax:\nLCASE(str)\n\nLCASE() is a synonym for LOWER().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (74,'<=',18,'Syntax:\n<=\n\nLess than or equal:\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html\n\n','mysql> SELECT 0.1 <= 2;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html'),
 (75,'UPDATE',25,'Syntax:\nSingle-table syntax:\n\nUPDATE [LOW_PRIORITY] [IGNORE] tbl_name\n    SET col_name1=expr1 [, col_name2=expr2 ...]\n    [WHERE where_condition]\n    [ORDER BY ...]\n    [LIMIT row_count]\n\nMultiple-table syntax:\n\nUPDATE [LOW_PRIORITY] [IGNORE] table_references\n    SET col_name1=expr1 [, col_name2=expr2 ...]\n    [WHERE where_condition]\n\nFor the single-table syntax, the UPDATE statement updates columns of\nexisting rows in tbl_name with new values. The SET clause indicates\nwhich columns to modify and the values they should be given. The WHERE\nclause, if given, specifies the conditions that identify which rows to\nupdate. With no WHERE clause, all rows are updated. If the ORDER BY\nclause is specified, the rows are updated in the order that is\nspecified. The LIMIT clause places a limit on the number of rows that\ncan be updated.\n\nFor the multiple-table syntax, UPDATE updates rows in each table named\nin table_references that satisfy the conditions. In this case, ORDER BY\nand LIMIT cannot be used.\n\nwhere_condition is an expression that evaluates to true for each row to\nbe updated. It is specified as described in [HELP SELECT].\n\nThe UPDATE statement supports the following modifiers:\n\no If you use the LOW_PRIORITY keyword, execution of the UPDATE is\n  delayed until no other clients are reading from the table. This\n  affects only storage engines that use only table-level locking\n  (MyISAM, MEMORY, MERGE).\n\no If you use the IGNORE keyword, the update statement does not abort\n  even if errors occur during the update. Rows for which duplicate-key\n  conflicts occur are not updated. Rows for which columns are updated\n  to values that would cause data conversion errors are updated to the\n  closest valid values instead.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/update.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/update.html'),
 (76,'CASE STATEMENT',36,'Syntax:\nCASE case_value\n    WHEN when_value THEN statement_list\n    [WHEN when_value THEN statement_list] ...\n    [ELSE statement_list]\nEND CASE\n\nOr:\n\nCASE\n    WHEN search_condition THEN statement_list\n    [WHEN search_condition THEN statement_list] ...\n    [ELSE statement_list]\nEND CASE\n\nThe CASE statement for stored routines implements a complex conditional\nconstruct. If a search_condition evaluates to true, the corresponding\nSQL statement list is executed. If no search condition matches, the\nstatement list in the ELSE clause is executed. Each statement_list\nconsists of one or more statements.\n\n*Note*: The syntax of the CASE statement shown here for use inside\nstored routines differs slightly from that of the SQL CASE expression\ndescribed in [HELP CASE function]. The CASE statement cannot have an\nELSE NULL clause, and it is terminated with END CASE instead of END.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/case-statement.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/case-statement.html'),
 (77,'EXECUTE STATEMENT',25,'Syntax:\nEXECUTE stmt_name [USING @var_name [, @var_name] ...]\n\nAfter preparing a statement, you execute it with an EXECUTE statement\nthat refers to the prepared statement name. If the prepared statement\ncontains any parameter markers, you must supply a USING clause that\nlists user variables containing the values to be bound to the\nparameters. Parameter values can be supplied only by user variables,\nand the USING clause must name exactly as many variables as the number\nof parameter markers in the statement.\n\nYou can execute a given prepared statement multiple times, passing\ndifferent variables to it or setting the variables to different values\nbefore each execution.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/sqlps.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/sqlps.html'),
 (78,'DROP INDEX',37,'Syntax:\nDROP INDEX index_name ON tbl_name\n\nDROP INDEX drops the index named index_name from the table tbl_name.\nThis statement is mapped to an ALTER TABLE statement to drop the index.\nSee [HELP ALTER TABLE].\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/drop-index.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/drop-index.html'),
 (79,'MATCH AGAINST',34,'Syntax:\nMATCH (col1,col2,...) AGAINST (expr [search_modifier])\n\nsearch_modifier:\n  {\n       IN BOOLEAN MODE\n     | IN NATURAL LANGUAGE MODE\n     | IN NATURAL LANGUAGE MODE WITH QUERY EXPANSION\n     | WITH QUERY EXPANSION\n  }\n\nMySQL has support for full-text indexing and searching:\n\no A full-text index in MySQL is an index of type FULLTEXT.\n\no Full-text indexes can be used only with MyISAM tables, and can be\n  created only for CHAR, VARCHAR, or TEXT columns.\n\no A FULLTEXT index definition can be given in the CREATE TABLE\n  statement when a table is created, or added later using ALTER TABLE\n  or CREATE INDEX.\n\no For large datasets, it is much faster to load your data into a table\n  that has no FULLTEXT index and then create the index after that, than\n  to load data into a table that has an existing FULLTEXT index.\n\nFull-text searching is performed using MATCH() ... AGAINST syntax.\nMATCH() takes a comma-separated list that names the columns to be\nsearched. AGAINST takes a string to search for, and an optional\nmodifier that indicates what type of search to perform. The search\nstring must be a literal string, not a variable or a column name. There\nare three types of full-text searches:\n\no A boolean search interprets the search string using the rules of a\n  special query language. The string contains the words to search for.\n  It can also contain operators that specify requirements such that a\n  word must be present or absent in matching rows, or that it should be\n  weighted higher or lower than usual. Common words such as \"some\" or\n  \"then\" are stopwords and do not match if present in the search\n  string. The IN BOOLEAN MODE modifier specifies a boolean search. For\n  more information, see\n  http://dev.mysql.com/doc/refman/5.1/en/fulltext-boolean.html.\n\no A natural language search interprets the search string as a phrase in\n  natural human language (a phrase in free text). There are no special\n  operators. The stopword list applies. In addition, words that are\n  present in more than 50% of the rows are considered common and do not\n  match. Full-text searches are natural language searches if the IN\n  NATURAL LANGUAGE MODE modifier is given or if no modifier is given.\n\no A query expansion search is a modification of a natural language\n  search. The search string is used to perform a natural language\n  search. Then words from the most relevant rows returned by the search\n  are added to the search string and the search is done again. The\n  query returns the rows from the second search. The IN NATURAL\n  LANGUAGE MODE WITH QUERY EXPANSION or WITH QUERY EXPANSION modifier\n  specifies a query expansion search. For more information, see\n  http://dev.mysql.com/doc/refman/5.1/en/fulltext-query-expansion.html.\n\nThe IN NATURAL LANGUAGE MODE and IN NATURAL LANGUAGE MODE WITH QUERY\nEXPANSION modifiers were added in MySQL 5.1.7.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/fulltext-search.html\n\n','mysql> SELECT id, body, MATCH (title,body) AGAINST\n    -> (\'Security implications of running MySQL as root\'\n    -> IN NATURAL LANGUAGE MODE) AS score\n    -> FROM articles WHERE MATCH (title,body) AGAINST\n    -> (\'Security implications of running MySQL as root\'\n    -> IN NATURAL LANGUAGE MODE);\n+----+-------------------------------------+-----------------+\n| id | body                                | score           |\n+----+-------------------------------------+-----------------+\n|  4 | 1. Never run mysqld as root. 2. ... | 1.5219271183014 |\n|  6 | When configured properly, MySQL ... | 1.3114095926285 |\n+----+-------------------------------------+-----------------+\n2 rows in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.1/en/fulltext-search.html'),
 (80,'CREATE EVENT',37,'Syntax:\nCREATE \n    [DEFINER = { user | CURRENT_USER }]\n    EVENT \n    [IF NOT EXISTS]\n    event_name    \n    ON SCHEDULE schedule\n    [ON COMPLETION [NOT] PRESERVE]\n    [ENABLE | DISABLE | DISABLE ON SLAVE]\n    [COMMENT \'comment\']\n    DO sql_statement;\n\nschedule:\n    AT timestamp [+ INTERVAL interval]\n  | EVERY interval \n    [STARTS timestamp [+ INTERVAL interval]] \n    [ENDS timestamp [+ INTERVAL interval]]\n\ninterval:\n    quantity {YEAR | QUARTER | MONTH | DAY | HOUR | MINUTE |\n              WEEK | SECOND | YEAR_MONTH | DAY_HOUR | DAY_MINUTE |\n              DAY_SECOND | HOUR_MINUTE | HOUR_SECOND | MINUTE_SECOND}\n\nThis statement creates and schedules a new event. The minimum\nrequirements for a valid CREATE EVENT statement are as follows:\n\no The keywords CREATE EVENT plus an event name, which uniquely\n  identifies the event in the current schema.\n\n  (Prior to MySQL 5.1.12, the event name needed to be unique only among\n  events created by the same user on a given database.)\n\no An ON SCHEDULE clause, which determines when and how often the event\n  executes.\n\no A DO clause, which contains the SQL statement to be executed by an\n  event.\n\nThis is an example of a minimal CREATE EVENT statement:\n\nCREATE EVENT myevent\n    ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 HOUR\n    DO\n      UPDATE myschema.mytable SET mycol = mycol + 1;\n\nThe previous statement creates an event named myevent. This event\nexecutes once --- one hour following its creation --- by running an SQL\nstatement that increments the value of the myschema.mytable table\'s\nmycol column by 1.\n\nThe event_name must be a valid MySQL identifier with a maximum length\nof 64 characters. It may be delimited using back ticks, and may be\nqualified with the name of a database schema. An event is associated\nwith both a MySQL user (the definer) and a schema, and its name must be\nunique among names of events within that schema. In general, the rules\ngoverning event names are the same as those for names of stored\nroutines. See http://dev.mysql.com/doc/refman/5.1/en/identifiers.html.\n\nIf no schema is indicated as part of event_name, then the default\n(current) schema is assumed. The definer is always the current MySQL\nuser.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/create-event.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/create-event.html'),
 (81,'ABS',4,'Syntax:\nABS(X)\n\nReturns the absolute value of X.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT ABS(2);\n        -> 2\nmysql> SELECT ABS(-32);\n        -> 32\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html');
INSERT INTO `help_topic` (`help_topic_id`,`name`,`help_category_id`,`description`,`example`,`url`) VALUES 
 (82,'POLYFROMWKB',30,'PolyFromWKB(wkb[,srid]), PolygonFromWKB(wkb[,srid])\n\nConstructs a POLYGON value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-wkb-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-wkb-functions.html'),
 (83,'NOT LIKE',34,'Syntax:\nexpr NOT LIKE pat [ESCAPE \'escape_char\']\n\nThis is the same as NOT (expr LIKE pat [ESCAPE \'escape_char\']).\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-comparison-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-comparison-functions.html'),
 (84,'SPACE',34,'Syntax:\nSPACE(N)\n\nReturns a string consisting of N space characters.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT SPACE(6);\n        -> \'      \'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (85,'MBR DEFINITION',6,'Its MBR (Minimum Bounding Rectangle), or Envelope. This is the bounding\ngeometry, formed by the minimum and maximum (X,Y) coordinates:\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-class-geometry.html\n\n','((MINX MINY, MAXX MINY, MAXX MAXY, MINX MAXY, MINX MINY))\n','http://dev.mysql.com/doc/refman/5.1/en/gis-class-geometry.html'),
 (86,'GEOMETRYCOLLECTION',23,'GeometryCollection(g1,g2,...)\n\nConstructs a WKB GeometryCollection. If any argument is not a\nwell-formed WKB representation of a geometry, the return value is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-mysql-specific-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-mysql-specific-functions.html'),
 (87,'*',4,'Syntax:\n*\n\nMultiplication:\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/arithmetic-functions.html\n\n','mysql> SELECT 3*5;\n        -> 15\nmysql> SELECT 18014398509481984*18014398509481984.0;\n        -> 324518553658426726783156020576256.0\nmysql> SELECT 18014398509481984*18014398509481984;\n        -> 0\n','http://dev.mysql.com/doc/refman/5.1/en/arithmetic-functions.html'),
 (88,'TIMESTAMP',21,'TIMESTAMP\n\nA timestamp. The range is \'1970-01-01 00:00:01\' UTC to partway through\nthe year 2038. TIMESTAMP values are stored as the number of seconds\nsince the epoch (\'1970-01-01 00:00:00\' UTC). A TIMESTAMP cannot\nrepresent the value \'1970-01-01 00:00:00\' because that is equivalent to\n0 seconds from the epoch and the value 0 is reserved for representing\n\'0000-00-00 00:00:00\', the \"zero\" TIMESTAMP value.\n\nA TIMESTAMP column is useful for recording the date and time of an\nINSERT or UPDATE operation. By default, the first TIMESTAMP column in a\ntable is automatically set to the date and time of the most recent\noperation if you do not assign it a value yourself. You can also set\nany TIMESTAMP column to the current date and time by assigning it a\nNULL value. Variations on automatic initialization and update\nproperties are described in\nhttp://dev.mysql.com/doc/refman/5.1/en/timestamp.html.\n\nA TIMESTAMP value is returned as a string in the format \'YYYY-MM-DD\nHH:MM:SS\' with a display width fixed at 19 characters. To obtain the\nvalue as a number, you should add +0 to the timestamp column.\n\n*Note*: The TIMESTAMP format that was used prior to MySQL 4.1 is not\nsupported in MySQL 5.1; see MySQL 3.23, 4.0, 4.1 Reference Manual for\ninformation regarding the old format.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-type-overview.html'),
 (89,'DES_DECRYPT',11,'Syntax:\nDES_DECRYPT(crypt_str[,key_str])\n\nDecrypts a string encrypted with DES_ENCRYPT(). If an error occurs,\nthis function returns NULL.\n\nNote that this function works only if MySQL has been configured with\nSSL support. See\nhttp://dev.mysql.com/doc/refman/5.1/en/secure-connections.html.\n\nIf no key_str argument is given, DES_DECRYPT() examines the first byte\nof the encrypted string to determine the DES key number that was used\nto encrypt the original string, and then reads the key from the DES key\nfile to decrypt the message. For this to work, the user must have the\nSUPER privilege. The key file can be specified with the --des-key-file\nserver option.\n\nIf you pass this function a key_str argument, that string is used as\nthe key for decrypting the message.\n\nIf the crypt_str argument does not appear to be an encrypted string,\nMySQL returns the given crypt_str.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html'),
 (90,'ENDPOINT',12,'EndPoint(ls)\n\nReturns the Point that is the endpoint of the LineString value ls.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/linestring-property-functions.html\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(EndPoint(GeomFromText(@ls)));\n+-------------------------------------+\n| AsText(EndPoint(GeomFromText(@ls))) |\n+-------------------------------------+\n| POINT(3 3)                          |\n+-------------------------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/linestring-property-functions.html'),
 (91,'CACHE INDEX',25,'Syntax:\nCACHE INDEX\n  tbl_index_list [, tbl_index_list] ...\n  IN key_cache_name\n\ntbl_index_list:\n  tbl_name [[INDEX|KEY] (index_name[, index_name] ...)]\n\nThe CACHE INDEX statement assigns table indexes to a specific key\ncache. It is used only for MyISAM tables.\n\nThe following statement assigns indexes from the tables t1, t2, and t3\nto the key cache named hot_cache:\n\nmysql> CACHE INDEX t1, t2, t3 IN hot_cache;\n+---------+--------------------+----------+----------+\n| Table   | Op                 | Msg_type | Msg_text |\n+---------+--------------------+----------+----------+\n| test.t1 | assign_to_keycache | status   | OK       |\n| test.t2 | assign_to_keycache | status   | OK       |\n| test.t3 | assign_to_keycache | status   | OK       |\n+---------+--------------------+----------+----------+\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/cache-index.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/cache-index.html'),
 (92,'COMPRESS',11,'Syntax:\nCOMPRESS(string_to_compress)\n\nCompresses a string and returns the result as a binary string. This\nfunction requires MySQL to have been compiled with a compression\nlibrary such as zlib. Otherwise, the return value is always NULL. The\ncompressed string can be uncompressed with UNCOMPRESS().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html\n\n','mysql> SELECT LENGTH(COMPRESS(REPEAT(\'a\',1000)));\n        -> 21\nmysql> SELECT LENGTH(COMPRESS(\'\'));\n        -> 0\nmysql> SELECT LENGTH(COMPRESS(\'a\'));\n        -> 13\nmysql> SELECT LENGTH(COMPRESS(REPEAT(\'a\',16)));\n        -> 15\n','http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html'),
 (93,'INSERT',25,'Syntax:\nINSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name [(col_name,...)]\n    VALUES ({expr | DEFAULT},...),(...),...\n    [ ON DUPLICATE KEY UPDATE col_name=expr, ... ]\n\nOr:\n\nINSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name\n    SET col_name={expr | DEFAULT}, ...\n    [ ON DUPLICATE KEY UPDATE col_name=expr, ... ]\n\nOr:\n\nINSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name [(col_name,...)]\n    SELECT ...\n    [ ON DUPLICATE KEY UPDATE col_name=expr, ... ]\n\nINSERT inserts new rows into an existing table. The INSERT ... VALUES\nand INSERT ... SET forms of the statement insert rows based on\nexplicitly specified values. The INSERT ... SELECT form inserts rows\nselected from another table or tables. INSERT ... SELECT is discussed\nfurther in [HELP INSERT SELECT].\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/insert.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/insert.html'),
 (94,'COUNT',15,'Syntax:\nCOUNT(expr)\n\nReturns a count of the number of non-NULL values of expr in the rows\nretrieved by a SELECT statement. The result is a BIGINT value.\n\nCOUNT() returns 0 if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html\n\n','mysql> SELECT student.student_name,COUNT(*)\n    ->        FROM student,course\n    ->        WHERE student.student_id=course.student_id\n    ->        GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html'),
 (95,'HANDLER',25,'Syntax:\nHANDLER tbl_name OPEN [ [AS] alias]\nHANDLER tbl_name READ index_name { = | >= | <= | < } (value1,value2,...)\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name READ index_name { FIRST | NEXT | PREV | LAST }\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name READ { FIRST | NEXT }\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name CLOSE\n\nThe HANDLER statement provides direct access to table storage engine\ninterfaces. It is available for MyISAM and InnoDB tables.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/handler.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/handler.html'),
 (96,'MLINEFROMTEXT',3,'MLineFromText(wkt[,srid]), MultiLineStringFromText(wkt[,srid])\n\nConstructs a MULTILINESTRING value using its WKT representation and\nSRID.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-wkt-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-wkt-functions.html'),
 (97,'GEOMCOLLFROMWKB',30,'GeomCollFromWKB(wkb[,srid]), GeometryCollectionFromWKB(wkb[,srid])\n\nConstructs a GEOMETRYCOLLECTION value using its WKB representation and\nSRID.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-wkb-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-wkb-functions.html'),
 (98,'RENAME TABLE',37,'Syntax:\nRENAME TABLE tbl_name TO new_tbl_name\n    [, tbl_name2 TO new_tbl_name2] ...\n\nThis statement renames one or more tables.\n\nThe rename operation is done atomically, which means that no other\nthread can access any of the tables while the rename is running. For\nexample, if you have an existing table old_table, you can create\nanother table new_table that has the same structure but is empty, and\nthen replace the existing table with the empty one as follows (assuming\nthat backup_table does not already exist):\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/rename-table.html\n\n','CREATE TABLE new_table (...);\nRENAME TABLE old_table TO backup_table, new_table TO old_table;\n','http://dev.mysql.com/doc/refman/5.1/en/rename-table.html'),
 (99,'BOOLEAN',21,'BOOL, BOOLEAN\n\nThese types are synonyms for TINYINT(1). A value of zero is considered\nfalse. Non-zero values are considered true:\n\nmysql> SELECT IF(0, \'true\', \'false\');\n+------------------------+\n| IF(0, \'true\', \'false\') |\n+------------------------+\n| false                  |\n+------------------------+\n\nmysql> SELECT IF(1, \'true\', \'false\');\n+------------------------+\n| IF(1, \'true\', \'false\') |\n+------------------------+\n| true                   |\n+------------------------+\n\nmysql> SELECT IF(2, \'true\', \'false\');\n+------------------------+\n| IF(2, \'true\', \'false\') |\n+------------------------+\n| true                   |\n+------------------------+\n\nHowever, the values TRUE and FALSE are merely aliases for 1 and 0,\nrespectively, as shown here:\n\nmysql> SELECT IF(0 = FALSE, \'true\', \'false\');\n+--------------------------------+\n| IF(0 = FALSE, \'true\', \'false\') |\n+--------------------------------+\n| true                           |\n+--------------------------------+\n\nmysql> SELECT IF(1 = TRUE, \'true\', \'false\');\n+-------------------------------+\n| IF(1 = TRUE, \'true\', \'false\') |\n+-------------------------------+\n| true                          |\n+-------------------------------+\n\nmysql> SELECT IF(2 = TRUE, \'true\', \'false\');\n+-------------------------------+\n| IF(2 = TRUE, \'true\', \'false\') |\n+-------------------------------+\n| false                         |\n+-------------------------------+\n\nmysql> SELECT IF(2 = FALSE, \'true\', \'false\');\n+--------------------------------+\n| IF(2 = FALSE, \'true\', \'false\') |\n+--------------------------------+\n| false                          |\n+--------------------------------+\n\nThe last two statements display the results shown because 2 is equal to\nneither 1 nor 0.\n\nWe intend to implement full boolean type handling, in accordance with\nstandard SQL, in a future MySQL release.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html'),
 (100,'DEFAULT',14,'Syntax:\nDEFAULT(col_name)\n\nReturns the default value for a table column. An error results if the\ncolumn has no default value.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html\n\n','mysql> UPDATE t SET i = DEFAULT(i)+1 WHERE id < 100;\n','http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html'),
 (101,'MOD',4,'Syntax:\nMOD(N,M), N % M, N MOD M\n\nModulo operation. Returns the remainder of N divided by M.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT MOD(234, 10);\n        -> 4\nmysql> SELECT 253 % 7;\n        -> 1\nmysql> SELECT MOD(29,9);\n        -> 2\nmysql> SELECT 29 MOD 9;\n        -> 2\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (102,'TINYTEXT',21,'TINYTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 255 (28 - 1) characters.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html'),
 (103,'OPTIMIZE TABLE',20,'Syntax:\nOPTIMIZE [LOCAL | NO_WRITE_TO_BINLOG] TABLE tbl_name [, tbl_name] ...\n\nOPTIMIZE TABLE should be used if you have deleted a large part of a\ntable or if you have made many changes to a table with variable-length\nrows (tables that have VARCHAR, VARBINARY, BLOB, or TEXT columns).\nDeleted rows are maintained in a linked list and subsequent INSERT\noperations reuse old row positions. You can use OPTIMIZE TABLE to\nreclaim the unused space and to defragment the data file.\n\nThis statement requires SELECT and INSERT privileges for the table.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/optimize-table.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/optimize-table.html'),
 (104,'DECODE',11,'Syntax:\nDECODE(crypt_str,pass_str)\n\nDecrypts the encrypted string crypt_str using pass_str as the password.\ncrypt_str should be a string returned from ENCODE().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html'),
 (105,'<=>',18,'Syntax:\n<=>\n\nNULL-safe equal. This operator performs an equality comparison like the\n= operator, but returns 1 rather than NULL if both operands are NULL,\nand 0 rather than NULL if one operand is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html\n\n','mysql> SELECT 1 <=> 1, NULL <=> NULL, 1 <=> NULL;\n        -> 1, 1, 0\nmysql> SELECT 1 = 1, NULL = NULL, 1 = NULL;\n        -> 1, NULL, NULL\n','http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html'),
 (106,'LOAD DATA FROM MASTER',25,'Syntax:\nLOAD DATA FROM MASTER\n\nThis feature is deprecated. We recommend not using it anymore. It is\nsubject to removal in a future version of MySQL.\n\nSince the current implementation of LOAD DATA FROM MASTER and LOAD\nTABLE FROM MASTER is very limited, these statements are deprecated in\nversions 4.1 of MySQL and above. We will introduce a more advanced\ntechnique (called \"online backup\") in a future version. That technique\nwill have the additional advantage of working with more storage\nengines.\n\nFor MySQL 5.1 and earlier, the recommended alternative solution to\nusing LOAD DATA FROM MASTER or LOAD TABLE FROM MASTER is using\nmysqldump or mysqlhotcopy. The latter requires Perl and two Perl\nmodules (DBI and DBD:mysql) and works for MyISAM and ARCHIVE tables\nonly. With mysqldump, you can create SQL dumps on the master and pipe\n(or copy) these to a mysql client on the slave. This has the advantage\nof working for all storage engines, but can be quite slow, since it\nworks using SELECT.\n\nThis statement takes a snapshot of the master and copies it to the\nslave. It updates the values of MASTER_LOG_FILE and MASTER_LOG_POS so\nthat the slave starts replicating from the correct position. Any table\nand database exclusion rules specified with the --replicate-*-do-* and\n--replicate-*-ignore-* options are honored. --replicate-rewrite-db is\nnot taken into account because a user could use this option to set up a\nnon-unique mapping such as --replicate-rewrite-db=\"db1->db3\" and\n--replicate-rewrite-db=\"db2->db3\", which would confuse the slave when\nloading tables from the master.\n\nUse of this statement is subject to the following conditions:\n\no It works only for MyISAM tables. Attempting to load a non-MyISAM\n  table results in the following error:\n\nERROR 1189 (08S01): Net error reading from master\n\no It acquires a global read lock on the master while taking the\n  snapshot, which prevents updates on the master during the load\n  operation.\n\nIf you are loading large tables, you might have to increase the values\nof net_read_timeout and net_write_timeout on both the master and slave\nservers. See\nhttp://dev.mysql.com/doc/refman/5.1/en/server-system-variables.html.\n\nNote that LOAD DATA FROM MASTER does not copy any tables from the mysql\ndatabase. This makes it easy to have different users and privileges on\nthe master and the slave.\n\nTo use LOAD DATA FROM MASTER, the replication account that is used to\nconnect to the master must have the RELOAD and SUPER privileges on the\nmaster and the SELECT privilege for all master tables you want to load.\nAll master tables for which the user does not have the SELECT privilege\nare ignored by LOAD DATA FROM MASTER. This is because the master hides\nthem from the user: LOAD DATA FROM MASTER calls SHOW DATABASES to know\nthe master databases to load, but SHOW DATABASES returns only databases\nfor which the user has some privilege. See [HELP SHOW DATABASES]. On\nthe slave side, the user that issues LOAD DATA FROM MASTER must have\nprivileges for dropping and creating the databases and tables that are\ncopied.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/load-data-from-master.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/load-data-from-master.html'),
 (107,'RESET',25,'Syntax:\nRESET reset_option [, reset_option] ...\n\nThe RESET statement is used to clear the state of various server\noperations. You must have the RELOAD privilege to execute RESET.\n\nRESET acts as a stronger version of the FLUSH statement. See [HELP\nFLUSH].\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/reset.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/reset.html'),
 (108,'HELP STATEMENT',26,'Syntax:\nHELP \'search_string\'\n\nThe HELP statement returns online information from the MySQL Reference\nmanual. Its proper operation requires that the help tables in the mysql\ndatabase be initialized with help topic information (see\nhttp://dev.mysql.com/doc/refman/5.1/en/server-side-help-support.html).\n\nThe HELP statement searches the help tables for the given search string\nand displays the result of the search. The search string is not case\nsensitive.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/help.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/help.html'),
 (109,'GET_LOCK',14,'Syntax:\nGET_LOCK(str,timeout)\n\nTries to obtain a lock with a name given by the string str, using a\ntimeout of timeout seconds. Returns 1 if the lock was obtained\nsuccessfully, 0 if the attempt timed out (for example, because another\nclient has previously locked the name), or NULL if an error occurred\n(such as running out of memory or the thread was killed with mysqladmin\nkill). If you have a lock obtained with GET_LOCK(), it is released when\nyou execute RELEASE_LOCK(), execute a new GET_LOCK(), or your\nconnection terminates (either normally or abnormally). Locks obtained\nwith GET_LOCK() do not interact with transactions. That is, committing\na transaction does not release any such locks obtained during the\ntransaction.\n\nThis function can be used to implement application locks or to simulate\nrecord locks. Names are locked on a server-wide basis. If a name has\nbeen locked by one client, GET_LOCK() blocks any request by another\nclient for a lock with the same name. This allows clients that agree on\na given lock name to use the name to perform cooperative advisory\nlocking. But be aware that it also allows a client that is not among\nthe set of cooperating clients to lock a name, either inadvertently or\ndeliberately, and thus prevent any of the cooperating clients from\nlocking that name. One way to reduce the likelihood of this is to use\nlock names that are database-specific or application-specific. For\nexample, use lock names of the form db_name.str or app_name.str.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html\n\n','mysql> SELECT GET_LOCK(\'lock1\',10);\n        -> 1\nmysql> SELECT IS_FREE_LOCK(\'lock2\');\n        -> 1\nmysql> SELECT GET_LOCK(\'lock2\',10);\n        -> 1\nmysql> SELECT RELEASE_LOCK(\'lock2\');\n        -> 1\nmysql> SELECT RELEASE_LOCK(\'lock1\');\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html'),
 (110,'UCASE',34,'Syntax:\nUCASE(str)\n\nUCASE() is a synonym for UPPER().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (111,'SHOW BINLOG EVENTS',25,'Syntax:\nSHOW BINLOG EVENTS\n   [IN \'log_name\'] [FROM pos] [LIMIT [offset,] row_count]\n\nShows the events in the binary log. If you do not specify \'log_name\',\nthe first binary log is displayed.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-binlog-events.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-binlog-events.html'),
 (112,'MPOLYFROMWKB',30,'MPolyFromWKB(wkb[,srid]), MultiPolygonFromWKB(wkb[,srid])\n\nConstructs a MULTIPOLYGON value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-wkb-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-wkb-functions.html'),
 (113,'ITERATE',36,'Syntax:\nITERATE label\n\nITERATE can appear only within LOOP, REPEAT, and WHILE statements.\nITERATE means \"do the loop again.\"\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/iterate-statement.html\n\n','CREATE PROCEDURE doiterate(p1 INT)\nBEGIN\n  label1: LOOP\n    SET p1 = p1 + 1;\n    IF p1 < 10 THEN ITERATE label1; END IF;\n    LEAVE label1;\n  END LOOP label1;\n  SET @x = p1;\nEND\n','http://dev.mysql.com/doc/refman/5.1/en/iterate-statement.html'),
 (114,'DO',25,'Syntax:\nDO expr [, expr] ...\n\nDO executes the expressions but does not return any results. In most\nrespects, DO is shorthand for SELECT expr, ..., but has the advantage\nthat it is slightly faster when you do not care about the result.\n\nDO is useful primarily with functions that have side effects, such as\nRELEASE_LOCK().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/do.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/do.html'),
 (115,'CURTIME',29,'Syntax:\nCURTIME()\n\nReturns the current time as a value in \'HH:MM:SS\' or HHMMSS format,\ndepending on whether the function is used in a string or numeric\ncontext. The value is expressed in the current time zone.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT CURTIME();\n        -> \'23:50:26\'\nmysql> SELECT CURTIME() + 0;\n        -> 235026\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (116,'CHAR_LENGTH',34,'Syntax:\nCHAR_LENGTH(str)\n\nReturns the length of the string str, measured in characters. A\nmulti-byte character counts as a single character. This means that for\na string containing five two-byte characters, LENGTH() returns 10,\nwhereas CHAR_LENGTH() returns 5.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (117,'BIGINT',21,'BIGINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA large integer. The signed range is -9223372036854775808 to\n9223372036854775807. The unsigned range is 0 to 18446744073709551615.\n\nSERIAL is an alias for BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html'),
 (118,'SET',25,'Syntax:\nSET variable_assignment [, variable_assignment] ...\n\nvariable_assignment:\n      user_var_name = expr\n    | [GLOBAL | SESSION] system_var_name = expr\n    | [@@global. | @@session. | @@]system_var_name = expr\n\nThe SET statement assigns values to different types of variables that\naffect the operation of the server or your client. Older versions of\nMySQL employed SET OPTION, but this syntax is deprecated in favor of\nSET without OPTION.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/set-option.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/set-option.html'),
 (119,'DATE',21,'DATE\n\nA date. The supported range is \'1000-01-01\' to \'9999-12-31\'. MySQL\ndisplays DATE values in \'YYYY-MM-DD\' format, but allows assignment of\nvalues to DATE columns using either strings or numbers.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-type-overview.html'),
 (120,'CONV',34,'Syntax:\nCONV(N,from_base,to_base)\n\nConverts numbers between different number bases. Returns a string\nrepresentation of the number N, converted from base from_base to base\nto_base. Returns NULL if any argument is NULL. The argument N is\ninterpreted as an integer, but may be specified as an integer or a\nstring. The minimum base is 2 and the maximum base is 36. If to_base is\na negative number, N is regarded as a signed number. Otherwise, N is\ntreated as unsigned. CONV() works with 64-bit precision.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT CONV(\'a\',16,2);\n        -> \'1010\'\nmysql> SELECT CONV(\'6E\',18,8);\n        -> \'172\'\nmysql> SELECT CONV(-17,10,-18);\n        -> \'-H\'\nmysql> SELECT CONV(10+\'10\'+\'10\'+0xa,10,10);\n        -> \'40\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (121,'SHOW OPEN TABLES',25,'Syntax:\nSHOW OPEN TABLES [FROM db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW OPEN TABLES lists the non-TEMPORARY tables that are currently open\nin the table cache. See\nhttp://dev.mysql.com/doc/refman/5.1/en/table-cache.html. The LIKE\nclause, if present, indicates which table names to match. The WHERE\nclause can be given to select rows using more general conditions, as\ndiscussed in http://dev.mysql.com/doc/refman/5.1/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-open-tables.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-open-tables.html'),
 (122,'EXTRACT',29,'Syntax:\nEXTRACT(unit FROM date)\n\nThe EXTRACT() function uses the same kinds of unit specifiers as\nDATE_ADD() or DATE_SUB(), but extracts parts from the date rather than\nperforming date arithmetic.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT EXTRACT(YEAR FROM \'1999-07-02\');\n       -> 1999\nmysql> SELECT EXTRACT(YEAR_MONTH FROM \'1999-07-02 01:02:03\');\n       -> 199907\nmysql> SELECT EXTRACT(DAY_MINUTE FROM \'1999-07-02 01:02:03\');\n       -> 20102\nmysql> SELECT EXTRACT(MICROSECOND\n    ->                FROM \'2003-01-02 10:30:00.000123\');\n        -> 123\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (123,'ENCRYPT',11,'Syntax:\nENCRYPT(str[,salt])\n\nEncrypts str using the Unix crypt() system call and returns a binary\nstring. The salt argument should be a string with at least two\ncharacters. If no salt argument is given, a random value is used.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html\n\n','mysql> SELECT ENCRYPT(\'hello\');\n        -> \'VxuFAJXVARROc\'\n','http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html'),
 (124,'SHOW STATUS',25,'Syntax:\nSHOW [GLOBAL | SESSION] STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW STATUS provides server status information. This information also\ncan be obtained using the mysqladmin extended-status command. The LIKE\nclause, if present, indicates which variable names to match. The WHERE\nclause can be given to select rows using more general conditions, as\ndiscussed in http://dev.mysql.com/doc/refman/5.1/en/extended-show.html.\nWith a LIKE clause, the statement displays only rows for those\nvariables with names that match the pattern:\n\nmysql> SHOW STATUS LIKE \'Key%\';\n+--------------------+----------+\n| Variable_name      | Value    |\n+--------------------+----------+\n| Key_blocks_used    | 14955    |\n| Key_read_requests  | 96854827 |\n| Key_reads          | 162040   |\n| Key_write_requests | 7589728  |\n| Key_writes         | 3813196  |\n+--------------------+----------+\n\nWith the GLOBAL modifier, SHOW STATUS displays the status values for\nall connections to MySQL. With SESSION, it displays the status values\nfor the current connection. If no modifier is present, the default is\nSESSION. LOCAL is a synonym for SESSION.\n\nSome status variables have only a global value. For these, you get the\nsame value for both GLOBAL and SESSION. The scope for each status\nvariable is listed at\nhttp://dev.mysql.com/doc/refman/5.1/en/server-status-variables.html.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-status.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-status.html'),
 (125,'EXTRACTVALUE',34,'Syntax:\nExtractValue(xml_frag, xpath_expr)\n\nExtractValue() takes two string arguments, a fragment of XML markup\nxml_frag and an XPath expression xpath_expr (also known as a locator);\nit returns the text (CDATA) of the first text node which is a child of\nthe element(s) matched by the XPath expression. It is the equivalent of\nperforming a match using the xpath_expr after appending /text(). In\nother words, ExtractValue(\'<a><b>Sakila</b></a>\', \'/a/b\') and\nExtractValue(\'<a><b>Sakila</b></a>\', \'/a/b/text()\') produce the same\nresult.\n\nIf multiple matches are found, then the content of the first child text\nnode of each matching element is returned (in the order matched) as a\nsingle, space-delimited string.\n\nIf no matching text node is found for the (augmented) expression ---\nfor whatever reason, as long as xpth_expr is valid, and xml_frag is\nwell-formed --- an empty string is returned. No distinction is made\nbetween a match on an empty element and no match at all. This is by\ndesign.\n\nIf you need to determine whether no matching element was found in\nxml_frag or such an element was found but contained no child text\nnodes, you should test the result of an expression that uses the XPath\ncount() function. For example, both of these statements return an empty\nstring, as shown here:\n\nmysql> SELECT ExtractValue(\'<a><b/></a>\', \'/a/b\');\n+-------------------------------------+\n| ExtractValue(\'<a><b/></a>\', \'/a/b\') |\n+-------------------------------------+\n|                                     |\n+-------------------------------------+\n1 row in set (0.00 sec)\n\nmysql> SELECT ExtractValue(\'<a><c/></a>\', \'/a/b\');\n+-------------------------------------+\n| ExtractValue(\'<a><c/></a>\', \'/a/b\') |\n+-------------------------------------+\n|                                     |\n+-------------------------------------+\n1 row in set (0.00 sec)\n\nHowever, you can determine whether there was actually a matching\nelement using the following:\n\nmysql> SELECT ExtractValue(\'<a><b/></a>\', \'count(/a/b)\');\n+-------------------------------------+\n| ExtractValue(\'<a><b/></a>\', \'count(/a/b)\') |\n+-------------------------------------+\n| 1                                   |\n+-------------------------------------+\n1 row in set (0.00 sec)\n\nmysql> SELECT ExtractValue(\'<a><c/></a>\', \'count(/a/b)\');\n+-------------------------------------+\n| ExtractValue(\'<a><c/></a>\', \'count(/a/b)\') |\n+-------------------------------------+\n| 0                                   |\n+-------------------------------------+\n1 row in set (0.01 sec)\n\n*Important*: ExtractValue() returns only CDATA, and does not return any\ntags that might be contained within a matching tag, nor any of their\ncontent (see the result returned as val1 in the following example).\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/xml-functions.html\n\n','mysql> SELECT\n    ->   ExtractValue(\'<a>ccc<b>ddd</b></a>\', \'/a\') AS val1,\n    ->   ExtractValue(\'<a>ccc<b>ddd</b></a>\', \'/a/b\') AS val2,\n    ->   ExtractValue(\'<a>ccc<b>ddd</b></a>\', \'//b\') AS val3,\n    ->   ExtractValue(\'<a>ccc<b>ddd</b></a>\', \'/b\') AS val4,\n    ->   ExtractValue(\'<a>ccc<b>ddd</b><b>eee</b></a>\', \'//b\') AS val5;\n\n+------+------+------+------+---------+\n| val1 | val2 | val3 | val4 | val5    |\n+------+------+------+------+---------+\n| ccc  | ddd  | ddd  |      | ddd eee |\n+------+------+------+------+---------+\n','http://dev.mysql.com/doc/refman/5.1/en/xml-functions.html'),
 (126,'OLD_PASSWORD',11,'Syntax:\nOLD_PASSWORD(str)\n\nOLD_PASSWORD() was added to MySQL when the implementation of PASSWORD()\nwas changed to improve security. OLD_PASSWORD() returns the value of\nthe old (pre-4.1) implementation of PASSWORD() as a binary string, and\nis intended to permit you to reset passwords for any pre-4.1 clients\nthat need to connect to your version 5.1 MySQL server without locking\nthem out. See\nhttp://dev.mysql.com/doc/refman/5.1/en/password-hashing.html.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html'),
 (127,'SET VARIABLE',36,'Syntax:\nSET var_name = expr [, var_name = expr] ...\n\nThe SET statement in stored routines is an extended version of the\ngeneral SET statement. Referenced variables may be ones declared inside\na routine, or global system variables.\n\nThe SET statement in stored routines is implemented as part of the\npre-existing SET syntax. This allows an extended syntax of SET a=x,\nb=y, ... where different variable types (locally declared variables and\nglobal and session server variables) can be mixed. This also allows\ncombinations of local variables and some options that make sense only\nfor system variables; in that case, the options are recognized but\nignored.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/set-statement.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/set-statement.html'),
 (128,'FORMAT',34,'Syntax:\nFORMAT(X,D)\n\nFormats the number X to a format like \'#,###,###.##\', rounded to D\ndecimal places, and returns the result as a string. If D is 0, the\nresult has no decimal point or fractional part.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT FORMAT(12332.123456, 4);\n        -> \'12,332.1235\'\nmysql> SELECT FORMAT(12332.1,4);\n        -> \'12,332.1000\'\nmysql> SELECT FORMAT(12332.2,0);\n        -> \'12,332\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (129,'||',13,'Syntax:\nOR, ||\n\nLogical OR. When both operands are non-NULL, the result is 1 if any\noperand is non-zero, and 0 otherwise. With a NULL operand, the result\nis 1 if the other operand is non-zero, and NULL otherwise. If both\noperands are NULL, the result is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/logical-operators.html\n\n','mysql> SELECT 1 || 1;\n        -> 1\nmysql> SELECT 1 || 0;\n        -> 1\nmysql> SELECT 0 || 0;\n        -> 0\nmysql> SELECT 0 || NULL;\n        -> NULL\nmysql> SELECT 1 || NULL;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.1/en/logical-operators.html'),
 (130,'BIT_LENGTH',34,'Syntax:\nBIT_LENGTH(str)\n\nReturns the length of the string str in bits.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT BIT_LENGTH(\'text\');\n        -> 32\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (131,'EXTERIORRING',2,'ExteriorRing(poly)\n\nReturns the exterior ring of the Polygon value poly as a LineString.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/polygon-property-functions.html\n\n','mysql> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nmysql> SELECT AsText(ExteriorRing(GeomFromText(@poly)));\n+-------------------------------------------+\n| AsText(ExteriorRing(GeomFromText(@poly))) |\n+-------------------------------------------+\n| LINESTRING(0 0,0 3,3 3,3 0,0 0)           |\n+-------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/polygon-property-functions.html'),
 (132,'GEOMFROMWKB',30,'GeomFromWKB(wkb[,srid]), GeometryFromWKB(wkb[,srid])\n\nConstructs a geometry value of any type using its WKB representation\nand SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-wkb-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-wkb-functions.html'),
 (133,'SHOW SLAVE HOSTS',25,'Syntax:\nSHOW SLAVE HOSTS\n\nDisplays a list of replication slaves currently registered with the\nmaster. Only slaves started with the --report-host=slave_name option\nare visible in this list.\n\nThe list is displayed on any server (not just the master server). The\noutput looks like this: mysql> SHOW SLAVE HOSTS;\n+------------+-----------+------+-----------+ | Server_id | Host | Port\n| Master_id | +------------+-----------+------+-----------+ | 192168010\n| iconnect2 | 3306 | 192168011 | | 1921680101 | athena | 3306 |\n192168011 | +------------+-----------+------+-----------+ Server_id:\nThe unique server ID of the slave server, as configured in the server\'s\noption file, or on the command line with --server-id=value . Host: The\nhost name of the slave server, as configured in the server\'s option\nfile, or on the command line with --report-host=value. Note that this\ncan differ from the machine name as configured in the operating system.\nPort: The port the slave server is listening on. Master_id: The unique\nserver ID of the master server that the slave server is replicating\nfrom. Some MySQL versions report another variable, Rpl_recovery_rank.\nThis variable was never used, and was eventually removed.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-slave-hosts.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-slave-hosts.html'),
 (134,'START TRANSACTION',8,'Syntax:\nSTART TRANSACTION [WITH CONSISTENT SNAPSHOT] | BEGIN [WORK]\nCOMMIT [WORK] [AND [NO] CHAIN] [[NO] RELEASE]\nROLLBACK [WORK] [AND [NO] CHAIN] [[NO] RELEASE]\nSET AUTOCOMMIT = {0 | 1}\n\nThe START TRANSACTION and BEGIN statement begin a new transaction.\nCOMMIT commits the current transaction, making its changes permanent.\nROLLBACK rolls back the current transaction, canceling its changes. The\nSET AUTOCOMMIT statement disables or enables the default autocommit\nmode for the current connection.\n\nThe optional WORK keyword is supported for COMMIT and ROLLBACK, as are\nthe CHAIN and RELEASE clauses. CHAIN and RELEASE can be used for\nadditional control over transaction completion. The value of the\ncompletion_type system variable determines the default completion\nbehavior. See\nhttp://dev.mysql.com/doc/refman/5.1/en/server-system-variables.html.\n\nThe AND CHAIN clause causes a new transaction to begin as soon as the\ncurrent one ends, and the new transaction has the same isolation level\nas the just-terminated transaction. The RELEASE clause causes the\nserver to disconnect the current client connection after terminating\nthe current transaction. Including the NO keyword suppresses CHAIN or\nRELEASE completion, which can be useful if the completion_type system\nvariable is set to cause chaining or release completion by default.\n\nBy default, MySQL runs with autocommit mode enabled. This means that as\nsoon as you execute a statement that updates (modifies) a table, MySQL\nstores the update on disk.\n\nIf you are using a transaction-safe storage engine (such as InnoDB, or\nNDB Cluster), you can disable autocommit mode with the following\nstatement:\n\nSET AUTOCOMMIT=0;\n\nAfter disabling autocommit mode by setting the AUTOCOMMIT variable to\nzero, you must use COMMIT to store your changes to disk or ROLLBACK if\nyou want to ignore the changes you have made since the beginning of\nyour transaction.\n\nTo disable autocommit mode for a single series of statements, use the\nSTART TRANSACTION statement:\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/commit.html\n\n','START TRANSACTION;\nSELECT @A:=SUM(salary) FROM table1 WHERE type=1;\nUPDATE table2 SET summary=@A WHERE type=1;\nCOMMIT;\n','http://dev.mysql.com/doc/refman/5.1/en/commit.html'),
 (135,'BETWEEN AND',18,'Syntax:\nexpr BETWEEN min AND max\n\nIf expr is greater than or equal to min and expr is less than or equal\nto max, BETWEEN returns 1, otherwise it returns 0. This is equivalent\nto the expression (min <= expr AND expr <= max) if all the arguments\nare of the same type. Otherwise type conversion takes place according\nto the rules described in\nhttp://dev.mysql.com/doc/refman/5.1/en/type-conversion.html, but\napplied to all the three arguments.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html\n\n','mysql> SELECT 1 BETWEEN 2 AND 3;\n        -> 0\nmysql> SELECT \'b\' BETWEEN \'a\' AND \'c\';\n        -> 1\nmysql> SELECT 2 BETWEEN 2 AND \'3\';\n        -> 1\nmysql> SELECT 2 BETWEEN 2 AND \'x-3\';\n        -> 0\n','http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html'),
 (136,'MULTIPOLYGON',23,'MultiPolygon(poly1,poly2,...)\n\nConstructs a WKB MultiPolygon value from a set of WKB Polygon\narguments. If any argument is not a WKB Polygon, the return value is\nNULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-mysql-specific-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-mysql-specific-functions.html'),
 (137,'TIME_FORMAT',29,'Syntax:\nTIME_FORMAT(time,format)\n\nThis is used like the DATE_FORMAT() function, but the format string may\ncontain format specifiers only for hours, minutes, and seconds. Other\nspecifiers produce a NULL value or 0.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT TIME_FORMAT(\'100:00:00\', \'%H %k %h %I %l\');\n        -> \'100 100 04 04 4\'\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (138,'LEFT',34,'Syntax:\nLEFT(str,len)\n\nReturns the leftmost len characters from the string str, or NULL if any\nargument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT LEFT(\'foobarbar\', 5);\n        -> \'fooba\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (139,'FLUSH QUERY CACHE',26,'You can defragment the query cache to better utilize its memory with\nthe FLUSH QUERY CACHE statement. The statement does not remove any\nqueries from the cache.\n\nThe RESET QUERY CACHE statement removes all query results from the\nquery cache. The FLUSH TABLES statement also does this.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/query-cache-status-and-maintenance.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/query-cache-status-and-maintenance.html'),
 (140,'SET DATA TYPE',21,'SET(\'value1\',\'value2\',...) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA set. A string object that can have zero or more values, each of which\nmust be chosen from the list of values \'value1\', \'value2\', ... A SET\ncolumn can have a maximum of 64 members. SET values are represented\ninternally as integers.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html'),
 (141,'RAND',4,'Syntax:\nRAND(), RAND(N)\n\nReturns a random floating-point value v in the range 0 <= v < 1.0. If a\nconstant integer argument N is specified, it is used as the seed value,\nwhich produces a repeatable sequence of column values.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT RAND();\n        -> 0.9233482386203\nmysql> SELECT RAND(20);\n        -> 0.15888261251047\nmysql> SELECT RAND(20);\n        -> 0.15888261251047\nmysql> SELECT RAND();\n        -> 0.63553050033332\nmysql> SELECT RAND();\n        -> 0.70100469486881\nmysql> SELECT RAND(20);\n        -> 0.15888261251047\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (142,'RPAD',34,'Syntax:\nRPAD(str,len,padstr)\n\nReturns the string str, right-padded with the string padstr to a length\nof len characters. If str is longer than len, the return value is\nshortened to len characters.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT RPAD(\'hi\',5,\'?\');\n        -> \'hi???\'\nmysql> SELECT RPAD(\'hi\',1,\'?\');\n        -> \'h\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (143,'CREATE DATABASE',37,'Syntax:\nCREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name\n    [create_specification ...]\n\ncreate_specification:\n    [DEFAULT] CHARACTER SET charset_name\n  | [DEFAULT] COLLATE collation_name\n\nCREATE DATABASE creates a database with the given name. To use this\nstatement, you need the CREATE privilege for the database. CREATE\nSCHEMA is a synonym for CREATE DATABASE.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/create-database.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/create-database.html'),
 (144,'DEC',21,'DEC[(M[,D])] [UNSIGNED] [ZEROFILL], NUMERIC[(M[,D])] [UNSIGNED]\n[ZEROFILL], FIXED[(M[,D])] [UNSIGNED] [ZEROFILL]\n\nThese types are synonyms for DECIMAL. The FIXED synonym is available\nfor compatibility with other database systems.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html'),
 (145,'VAR_POP',15,'Syntax:\nVAR_POP(expr)\n\nReturns the population standard variance of expr. It considers rows as\nthe whole population, not as a sample, so it has the number of rows as\nthe denominator. You can also use VARIANCE(), which is equivalent but\nis not standard SQL.\n\nVAR_POP() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html'),
 (146,'ELT',34,'Syntax:\nELT(N,str1,str2,str3,...)\n\nReturns str1 if N = 1, str2 if N = 2, and so on. Returns NULL if N is\nless than 1 or greater than the number of arguments. ELT() is the\ncomplement of FIELD().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT ELT(1, \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> \'ej\'\nmysql> SELECT ELT(4, \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> \'foo\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (147,'ALTER VIEW',37,'Syntax:\nALTER\n    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]\n    [DEFINER = { user | CURRENT_USER }]\n    [SQL SECURITY { DEFINER | INVOKER }]\n    VIEW view_name [(column_list)]\n    AS select_statement\n    [WITH [CASCADED | LOCAL] CHECK OPTION]\n\nThis statement changes the definition of a view, which must exist. The\nsyntax is similar to that for CREATE VIEW and the effect is the same as\nfor CREATE OR REPLACE VIEW. See [HELP CREATE VIEW]. This statement\nrequires the CREATE VIEW and DROP privileges for the view, and some\nprivilege for each column referred to in the SELECT statement.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/alter-view.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/alter-view.html'),
 (148,'SHOW DATABASES',25,'Syntax:\nSHOW {DATABASES | SCHEMAS}\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW DATABASES lists the databases on the MySQL server host. SHOW\nSCHEMAS is a synonym for SHOW DATABASES. The LIKE clause, if present,\nindicates which database names to match. The WHERE clause can be given\nto select rows using more general conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.1/en/extended-show.html.\n\nYou see only those databases for which you have some kind of privilege,\nunless you have the global SHOW DATABASES privilege. You can also get\nthis list using the mysqlshow command.\n\nIf the server was started with the --skip-show-database option, you\ncannot use this statement at all unless you have the SHOW DATABASES\nprivilege.\n\nSHOW SCHEMAS can also be used.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-databases.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-databases.html'),
 (149,'~',19,'Syntax:\n~\n\nInvert all bits.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/bit-functions.html\n\n','mysql> SELECT 5 & ~1;\n        -> 4\n','http://dev.mysql.com/doc/refman/5.1/en/bit-functions.html'),
 (150,'TEXT',21,'TEXT[(M)] [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 65,535 (216 - 1) characters.\n\nAn optional length M can be given for this type. If this is done, MySQL\ncreates the column as the smallest TEXT type large enough to hold\nvalues M characters long.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html'),
 (151,'CONCAT_WS',34,'Syntax:\nCONCAT_WS(separator,str1,str2,...)\n\nCONCAT_WS() stands for Concatenate With Separator and is a special form\nof CONCAT(). The first argument is the separator for the rest of the\narguments. The separator is added between the strings to be\nconcatenated. The separator can be a string, as can the rest of the\narguments. If the separator is NULL, the result is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT CONCAT_WS(\',\',\'First name\',\'Second name\',\'Last Name\');\n        -> \'First name,Second name,Last Name\'\nmysql> SELECT CONCAT_WS(\',\',\'First name\',NULL,\'Last Name\');\n        -> \'First name,Last Name\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (152,'ROW_COUNT',16,'Syntax:\nROW_COUNT()\n\nROW_COUNT() returns the number of rows updated, inserted, or deleted by\nthe preceding statement. This is the same as the row count that the\nmysql client displays and the value from the mysql_affected_rows() C\nAPI function.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/information-functions.html\n\n','mysql> INSERT INTO t VALUES(1),(2),(3);\nQuery OK, 3 rows affected (0.00 sec)\nRecords: 3  Duplicates: 0  Warnings: 0\n\nmysql> SELECT ROW_COUNT();\n+-------------+\n| ROW_COUNT() |\n+-------------+\n|           3 |\n+-------------+\n1 row in set (0.00 sec)\n\nmysql> DELETE FROM t WHERE i IN(1,2);\nQuery OK, 2 rows affected (0.00 sec)\n\nmysql> SELECT ROW_COUNT();\n+-------------+\n| ROW_COUNT() |\n+-------------+\n|           2 |\n+-------------+\n1 row in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.1/en/information-functions.html'),
 (153,'ASIN',4,'Syntax:\nASIN(X)\n\nReturns the arc sine of X, that is, the value whose sine is X. Returns\nNULL if X is not in the range -1 to 1.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT ASIN(0.2);\n        -> 0.20135792079033\nmysql> SELECT ASIN(\'foo\');\n\n+-------------+\n| ASIN(\'foo\') |\n+-------------+\n|           0 |\n+-------------+\n1 row in set, 1 warning (0.00 sec)\n\nmysql> SHOW WARNINGS;\n+---------+------+-----------------------------------------+\n| Level   | Code | Message                                 |\n+---------+------+-----------------------------------------+\n| Warning | 1292 | Truncated incorrect DOUBLE value: \'foo\' |\n+---------+------+-----------------------------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (154,'SIGN',4,'Syntax:\nSIGN(X)\n\nReturns the sign of the argument as -1, 0, or 1, depending on whether X\nis negative, zero, or positive.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT SIGN(-32);\n        -> -1\nmysql> SELECT SIGN(0);\n        -> 0\nmysql> SELECT SIGN(234);\n        -> 1\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (155,'SEC_TO_TIME',29,'Syntax:\nSEC_TO_TIME(seconds)\n\nReturns the seconds argument, converted to hours, minutes, and seconds,\nas a TIME value. The range of the result is constrained to that of the\nTIME data type. A warning occurs if the argument corresponds to a value\noutside that range.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT SEC_TO_TIME(2378);\n        -> \'00:39:38\'\nmysql> SELECT SEC_TO_TIME(2378) + 0;\n        -> 3938\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (156,'FLOAT',21,'FLOAT[(M,D)] [UNSIGNED] [ZEROFILL]\n\nA small (single-precision) floating-point number. Allowable values are\n-3.402823466E+38 to -1.175494351E-38, 0, and 1.175494351E-38 to\n3.402823466E+38. These are the theoretical limits, based on the IEEE\nstandard. The actual range might be slightly smaller depending on your\nhardware or operating system.\n\nM is the total number of digits and D is the number of digits following\nthe decimal point. If M and D are omitted, values are stored to the\nlimits allowed by the hardware. A single-precision floating-point\nnumber is accurate to approximately 7 decimal places.\n\nUNSIGNED, if specified, disallows negative values.\n\nUsing FLOAT might give you some unexpected problems because all\ncalculations in MySQL are done with double precision. See\nhttp://dev.mysql.com/doc/refman/5.1/en/no-matching-rows.html.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html'),
 (157,'LOCATE',34,'Syntax:\nLOCATE(substr,str), LOCATE(substr,str,pos)\n\nThe first syntax returns the position of the first occurrence of\nsubstring substr in string str. The second syntax returns the position\nof the first occurrence of substring substr in string str, starting at\nposition pos. Returns 0 if substr is not in str.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT LOCATE(\'bar\', \'foobarbar\');\n        -> 4\nmysql> SELECT LOCATE(\'xbar\', \'foobar\');\n        -> 0\nmysql> SELECT LOCATE(\'bar\', \'foobarbar\', 5);\n        -> 7\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (158,'CHARSET',16,'Syntax:\nCHARSET(str)\n\nReturns the character set of the string argument.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/information-functions.html\n\n','mysql> SELECT CHARSET(\'abc\');\n        -> \'latin1\'\nmysql> SELECT CHARSET(CONVERT(\'abc\' USING utf8));\n        -> \'utf8\'\nmysql> SELECT CHARSET(USER());\n        -> \'utf8\'\n','http://dev.mysql.com/doc/refman/5.1/en/information-functions.html'),
 (159,'SUBDATE',29,'Syntax:\nSUBDATE(date,INTERVAL expr unit), SUBDATE(expr,days)\n\nWhen invoked with the INTERVAL form of the second argument, SUBDATE()\nis a synonym for DATE_SUB(). For information on the INTERVAL unit\nargument, see the discussion for DATE_ADD().\n\nmysql> SELECT DATE_SUB(\'1998-01-02\', INTERVAL 31 DAY);\n        -> \'1997-12-02\'\nmysql> SELECT SUBDATE(\'1998-01-02\', INTERVAL 31 DAY);\n        -> \'1997-12-02\'\n\nThe second form allows the use of an integer value for days. In such\ncases, it is interpreted as the number of days to be subtracted from\nthe date or datetime expression expr.\n\nmysql> SELECT SUBDATE(\'1998-01-02 12:00:00\', 31);\n        -> \'1997-12-02 12:00:00\'\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (160,'DAYOFYEAR',29,'Syntax:\nDAYOFYEAR(date)\n\nReturns the day of the year for date, in the range 1 to 366.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT DAYOFYEAR(\'1998-02-03\');\n        -> 34\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (161,'LONGTEXT',21,'LONGTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 4,294,967,295 or 4GB (232 - 1)\ncharacters. The maximum effective (permitted) length of LONGTEXT\ncolumns depends on the configured maximum packet size in the\nclient/server protocol and available memory.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html'),
 (162,'%',4,'Syntax:\nN % M\n\nModulo operation. Returns the remainder of N divided by M. For more\ninformation, see the description for the MOD() function in [HELP ABS].\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/arithmetic-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/arithmetic-functions.html'),
 (163,'DISJOINT',27,'Disjoint(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially disjoint from (does\nnot intersect) g2.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/functions-that-test-spatial-relationships-between-geometries.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/functions-that-test-spatial-relationships-between-geometries.html'),
 (164,'KILL',25,'Syntax:\nKILL [CONNECTION | QUERY] thread_id\n\nEach connection to mysqld runs in a separate thread. You can see which\nthreads are running with the SHOW PROCESSLIST statement and kill a\nthread with the KILL thread_id statement.\n\nKILL allows the optional CONNECTION or QUERY modifier:\n\no KILL CONNECTION is the same as KILL with no modifier: It terminates\n  the connection associated with the given thread_id.\n\no KILL QUERY terminates the statement that the connection is currently\n  executing, but leaves the connection itself intact.\n\nIf you have the PROCESS privilege, you can see all threads. If you have\nthe SUPER privilege, you can kill all threads and statements.\nOtherwise, you can see and kill only your own threads and statements.\n\nYou can also use the mysqladmin processlist and mysqladmin kill\ncommands to examine and kill threads.\n\n*Note*: You cannot use KILL with the Embedded MySQL Server library,\nbecause the embedded server merely runs inside the threads of the host\napplication. It does not create any connection threads of its own.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/kill.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/kill.html'),
 (165,'ASTEXT',3,'AsText(g)\n\nConverts a value in internal geometry format to its WKT representation\nand returns the string result.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/functions-to-convert-geometries-between-formats.html\n\n','mysql> SET @g = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(GeomFromText(@g));\n+--------------------------+\n| AsText(GeomFromText(@g)) |\n+--------------------------+\n| LINESTRING(1 1,2 2,3 3)  |\n+--------------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/functions-to-convert-geometries-between-formats.html'),
 (166,'LPAD',34,'Syntax:\nLPAD(str,len,padstr)\n\nReturns the string str, left-padded with the string padstr to a length\nof len characters. If str is longer than len, the return value is\nshortened to len characters.\n\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT LPAD(\'hi\',4,\'??\');\n        -> \'??hi\'\nmysql> SELECT LPAD(\'hi\',1,\'??\');\n        -> \'h\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (167,'RESTORE TABLE',20,'Syntax:\nRESTORE TABLE tbl_name [, tbl_name] ... FROM \'/path/to/backup/directory\'\n\nRESTORE TABLE restores the table or tables from a backup that was made\nwith BACKUP TABLE. The directory should be specified as a full\npathname.\n\nExisting tables are not overwritten; if you try to restore over an\nexisting table, an error occurs. Just as for BACKUP TABLE, RESTORE\nTABLE currently works only for MyISAM tables. Restored tables are not\nreplicated from master to slave.\n\nThe backup for each table consists of its .frm format file and .MYD\ndata file. The restore operation restores those files, and then uses\nthem to rebuild the .MYI index file. Restoring takes longer than\nbacking up due to the need to rebuild the indexes. The more indexes the\ntable has, the longer it takes.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/restore-table.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/restore-table.html'),
 (168,'DECLARE CONDITION',36,'Syntax:\nDECLARE condition_name CONDITION FOR condition_value\n\ncondition_value:\n    SQLSTATE [VALUE] sqlstate_value\n  | mysql_error_code\n\nThis statement specifies conditions that need specific handling. It\nassociates a name with a specified error condition. The name can\nsubsequently be used in a DECLARE HANDLER statement. See [HELP DECLARE\nHANDLER].\n\nA condition_value can be an SQLSTATE value or a MySQL error code.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/declare-conditions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/declare-conditions.html'),
 (169,'OVERLAPS',27,'Overlaps(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially overlaps g2. The term\nspatially overlaps is used if two geometries intersect and their\nintersection results in a geometry of the same dimension but not equal\nto either of the given geometries.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/functions-that-test-spatial-relationships-between-geometries.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/functions-that-test-spatial-relationships-between-geometries.html'),
 (170,'NUMGEOMETRIES',24,'NumGeometries(gc)\n\nReturns the number of geometries in the GeometryCollection value gc.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/geometrycollection-property-functions.html\n\n','mysql> SET @gc = \'GeometryCollection(Point(1 1),LineString(2 2, 3 3))\';\nmysql> SELECT NumGeometries(GeomFromText(@gc));\n+----------------------------------+\n| NumGeometries(GeomFromText(@gc)) |\n+----------------------------------+\n|                                2 |\n+----------------------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/geometrycollection-property-functions.html'),
 (171,'SET GLOBAL SQL_SLAVE_SKIP_COUNTER',25,'Syntax:\nSET GLOBAL SQL_SLAVE_SKIP_COUNTER = N\n\nThis statement skips the next N events from the master. This is useful\nfor recovering from replication stops caused by a statement.\n\nThis statement is valid only when the slave thread is not running.\nOtherwise, it produces an error.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/set-global-sql-slave-skip-counter.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/set-global-sql-slave-skip-counter.html'),
 (172,'MONTHNAME',29,'Syntax:\nMONTHNAME(date)\n\nReturns the full name of the month for date. As of MySQL 5.1.12, the\nlanguage used for the name is controlled by the value of the\nlc_time_names system variable\n(http://dev.mysql.com/doc/refman/5.1/en/locale-support.html).\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT MONTHNAME(\'1998-02-05\');\n        -> \'February\'\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (173,'PROCEDURE ANALYSE',35,'Syntax:\nanalyse([max_elements[,max_memory]])\n\nThis procedure is defined in the sql/sql_analyse.cc file. It examines\nthe result from a query and returns an analysis of the results that\nsuggests optimal data types for each column. To obtain this analysis,\nappend PROCEDURE ANALYSE to the end of a SELECT statement:\n\nSELECT ... FROM ... WHERE ... PROCEDURE ANALYSE([max_elements,[max_memory]])\n\nFor example:\n\nSELECT col1, col2 FROM table1 PROCEDURE ANALYSE(10, 2000);\n\nThe results show some statistics for the values returned by the query,\nand propose an optimal data type for the columns. This can be helpful\nfor checking your existing tables, or after importing new data. You may\nneed to try different settings for the arguments so that PROCEDURE\nANALYSE() does not suggest the ENUM data type when it is not\nappropriate.\n\nThe arguments are optional and are used as follows:\n\no max_elements (default 256) is the maximum number of distinct values\n  that analyse notices per column. This is used by analyse to check\n  whether the optimal data type should be of type ENUM.\n\no max_memory (default 8192) is the maximum amount of memory that\n  analyse should allocate per column while trying to find all distinct\n  values.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/procedure-analyse.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/procedure-analyse.html'),
 (174,'MBREQUAL',6,'MBREqual(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 are the same.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/relations-on-geometry-mbr.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/relations-on-geometry-mbr.html');
INSERT INTO `help_topic` (`help_topic_id`,`name`,`help_category_id`,`description`,`example`,`url`) VALUES 
 (175,'CHANGE MASTER TO',25,'Syntax:\nCHANGE MASTER TO master_def [, master_def] ...\n\nmaster_def:\n    MASTER_HOST = \'host_name\'\n  | MASTER_USER = \'user_name\'\n  | MASTER_PASSWORD = \'password\'\n  | MASTER_PORT = port_num\n  | MASTER_CONNECT_RETRY = count\n  | MASTER_LOG_FILE = \'master_log_name\'\n  | MASTER_LOG_POS = master_log_pos\n  | RELAY_LOG_FILE = \'relay_log_name\'\n  | RELAY_LOG_POS = relay_log_pos\n  | MASTER_SSL = {0|1}\n  | MASTER_SSL_CA = \'ca_file_name\'\n  | MASTER_SSL_CAPATH = \'ca_directory_name\'\n  | MASTER_SSL_CERT = \'cert_file_name\'\n  | MASTER_SSL_KEY = \'key_file_name\'\n  | MASTER_SSL_CIPHER = \'cipher_list\'\n  | MASTER_SSL_VERIFY_SERVER_CERT = {0|1}\n\nCHANGE MASTER TO changes the parameters that the slave server uses for\nconnecting to and communicating with the master server. It also updates\nthe contents of the master.info and relay-log.info files.\n\nMASTER_USER, MASTER_PASSWORD, MASTER_SSL, MASTER_SSL_CA,\nMASTER_SSL_CAPATH, MASTER_SSL_CERT, MASTER_SSL_KEY, MASTER_SSL_CIPHER,\nand MASTER_SSL_VERIFY_SERVER_CERT provide information to the slave\nabout how to connect to its master. MASTER_SSL_VERIFY_SERVER_CERT was\nadded in MySQL 5.1.18. It is used as described for the\n--ssl-verify-server-cert option in\nhttp://dev.mysql.com/doc/refman/5.1/en/ssl-options.html.\n\nThe SSL options (MASTER_SSL, MASTER_SSL_CA, MASTER_SSL_CAPATH,\nMASTER_SSL_CERT, MASTER_SSL_KEY, MASTER_SSL_CIPHER), and\nMASTER_SSL_VERIFY_SERVER_CERT can be changed even on slaves that are\ncompiled without SSL support. They are saved to the master.info file,\nbut are ignored unless you use a server that has SSL support enabled.\n\nIf you don\'t specify a given parameter, it keeps its old value, except\nas indicated in the following discussion. For example, if the password\nto connect to your MySQL master has changed, you just need to issue\nthese statements to tell the slave about the new password:\n\nSTOP SLAVE; -- if replication was running\nCHANGE MASTER TO MASTER_PASSWORD=\'new3cret\';\nSTART SLAVE; -- if you want to restart replication\n\nThere is no need to specify the parameters that do not change (host,\nport, user, and so forth).\n\nMASTER_HOST and MASTER_PORT are the hostname (or IP address) of the\nmaster host and its TCP/IP port. Note that if MASTER_HOST is equal to\nlocalhost, then, like in other parts of MySQL, the port number might be\nignored.\n\n*Note*: Replication cannot use Unix socket files. You must be able to\nconnect to the master MySQL server using TCP/IP.\n\nIf you specify MASTER_HOST or MASTER_PORT, the slave assumes that the\nmaster server is different from before (even if you specify a host or\nport value that is the same as the current value.) In this case, the\nold values for the master binary log name and position are considered\nno longer applicable, so if you do not specify MASTER_LOG_FILE and\nMASTER_LOG_POS in the statement, MASTER_LOG_FILE=\'\' and\nMASTER_LOG_POS=4 are silently appended to it.\n\nMASTER_LOG_FILE and MASTER_LOG_POS are the coordinates at which the\nslave I/O thread should begin reading from the master the next time the\nthread starts. If you specify either of them, you cannot specify\nRELAY_LOG_FILE or RELAY_LOG_POS. If neither of MASTER_LOG_FILE or\nMASTER_LOG_POS are specified, the slave uses the last coordinates of\nthe slave SQL thread before CHANGE MASTER was issued. This ensures that\nthere is no discontinuity in replication, even if the slave SQL thread\nwas late compared to the slave I/O thread, when you merely want to\nchange, say, the password to use.\n\nCHANGE MASTER deletes all relay log files and starts a new one, unless\nyou specify RELAY_LOG_FILE or RELAY_LOG_POS. In that case, relay logs\nare kept; the relay_log_purge global variable is set silently to 0.\n\nCHANGE MASTER is useful for setting up a slave when you have the\nsnapshot of the master and have recorded the log and the offset\ncorresponding to it. After loading the snapshot into the slave, you can\nrun CHANGE MASTER TO MASTER_LOG_FILE=\'log_name_on_master\',\nMASTER_LOG_POS=log_offset_on_master on the slave.\n\nThe following example changes the master and master\'s binary log\ncoordinates. This is used when you want to set up the slave to\nreplicate the master:\n\nCHANGE MASTER TO\n  MASTER_HOST=\'master2.mycompany.com\',\n  MASTER_USER=\'replication\',\n  MASTER_PASSWORD=\'bigs3cret\',\n  MASTER_PORT=3306,\n  MASTER_LOG_FILE=\'master2-bin.001\',\n  MASTER_LOG_POS=4,\n  MASTER_CONNECT_RETRY=10;\n\nThe next example shows an operation that is less frequently employed.\nIt is used when the slave has relay logs that you want it to execute\nagain for some reason. To do this, the master need not be reachable.\nYou need only use CHANGE MASTER TO and start the SQL thread (START\nSLAVE SQL_THREAD):\n\nCHANGE MASTER TO\n  RELAY_LOG_FILE=\'slave-relay-bin.006\',\n  RELAY_LOG_POS=4025;\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/change-master-to.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/change-master-to.html'),
 (176,'DROP DATABASE',37,'Syntax:\nDROP {DATABASE | SCHEMA} [IF EXISTS] db_name\n\nDROP DATABASE drops all tables in the database and deletes the\ndatabase. Be very careful with this statement! To use DROP DATABASE,\nyou need the DROP privilege on the database. DROP SCHEMA is a synonym\nfor DROP DATABASE.\n\n*Important*: When a database is dropped, user privileges on the\ndatabase are not automatically dropped. See [HELP GRANT].\n\nIF EXISTS is used to prevent an error from occurring if the database\ndoes not exist.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/drop-database.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/drop-database.html'),
 (177,'TIMESTAMP FUNCTION',29,'Syntax:\nTIMESTAMP(expr), TIMESTAMP(expr1,expr2)\n\nWith a single argument, this function returns the date or datetime\nexpression expr as a datetime value. With two arguments, it adds the\ntime expression expr2 to the date or datetime expression expr1 and\nreturns the result as a datetime value.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT TIMESTAMP(\'2003-12-31\');\n        -> \'2003-12-31 00:00:00\'\nmysql> SELECT TIMESTAMP(\'2003-12-31 12:00:00\',\'12:00:00\');\n        -> \'2004-01-01 00:00:00\'\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (178,'CHARACTER_LENGTH',34,'Syntax:\nCHARACTER_LENGTH(str)\n\nCHARACTER_LENGTH() is a synonym for CHAR_LENGTH().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (179,'SHOW GRANTS',25,'Syntax:\nSHOW GRANTS [FOR user]\n\nThis statement lists the GRANT statement or statements that must be\nissued to duplicate the privileges that are granted to a MySQL user\naccount. The account is named using the same format as for the GRANT\nstatement; for example, \'jeffrey\'@\'localhost\'. If you specify only the\nusername part of the account name, a hostname part of \'%\' is used. For\nadditional information about specifying account names, see [HELP\nGRANT].\n\nmysql> SHOW GRANTS FOR \'root\'@\'localhost\';\n+---------------------------------------------------------------------+\n| Grants for root@localhost                                           |\n+---------------------------------------------------------------------+\n| GRANT ALL PRIVILEGES ON *.* TO \'root\'@\'localhost\' WITH GRANT OPTION |\n+---------------------------------------------------------------------+\n\nTo list the privileges granted to the account that you are using to\nconnect to the server, you can use any of the following statements:\n\nSHOW GRANTS;\nSHOW GRANTS FOR CURRENT_USER;\nSHOW GRANTS FOR CURRENT_USER();\n\nAs of MySQL 5.1.12, if SHOW GRANTS FOR CURRENT_USER (or any of the\nequivalent syntaxes) is used in DEFINER context, such as within a\nstored procedure that is defined with SQL SECURITY DEFINER), the grants\ndisplayed are those of the definer and not the invoker.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-grants.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-grants.html'),
 (180,'SHOW PRIVILEGES',25,'Syntax:\nSHOW PRIVILEGES\n\nSHOW PRIVILEGES shows the list of system privileges that the MySQL\nserver supports. The exact list of privileges depends on the version of\nyour server.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-privileges.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-privileges.html'),
 (181,'INSERT FUNCTION',34,'Syntax:\nINSERT(str,pos,len,newstr)\n\nReturns the string str, with the substring beginning at position pos\nand len characters long replaced by the string newstr. Returns the\noriginal string if pos is not within the length of the string. Replaces\nthe rest of the string from position pos if len is not within the\nlength of the rest of the string. Returns NULL if any argument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT INSERT(\'Quadratic\', 3, 4, \'What\');\n        -> \'QuWhattic\'\nmysql> SELECT INSERT(\'Quadratic\', -1, 4, \'What\');\n        -> \'Quadratic\'\nmysql> SELECT INSERT(\'Quadratic\', 3, 100, \'What\');\n        -> \'QuWhat\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (182,'CRC32',4,'Syntax:\nCRC32(expr)\n\nComputes a cyclic redundancy check value and returns a 32-bit unsigned\nvalue. The result is NULL if the argument is NULL. The argument is\nexpected to be a string and (if possible) is treated as one if it is\nnot.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT CRC32(\'MySQL\');\n        -> 3259397556\nmysql> SELECT CRC32(\'mysql\');\n        -> 2501908538\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (183,'XOR',13,'Syntax:\nXOR\n\nLogical XOR. Returns NULL if either operand is NULL. For non-NULL\noperands, evaluates to 1 if an odd number of operands is non-zero,\notherwise 0 is returned.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/logical-operators.html\n\n','mysql> SELECT 1 XOR 1;\n        -> 0\nmysql> SELECT 1 XOR 0;\n        -> 1\nmysql> SELECT 1 XOR NULL;\n        -> NULL\nmysql> SELECT 1 XOR 1 XOR 1;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.1/en/logical-operators.html'),
 (184,'STARTPOINT',12,'StartPoint(ls)\n\nReturns the Point that is the start point of the LineString value ls.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/linestring-property-functions.html\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(StartPoint(GeomFromText(@ls)));\n+---------------------------------------+\n| AsText(StartPoint(GeomFromText(@ls))) |\n+---------------------------------------+\n| POINT(1 1)                            |\n+---------------------------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/linestring-property-functions.html'),
 (185,'DECLARE VARIABLE',36,'Syntax:\nDECLARE var_name[,...] type [DEFAULT value]\n\nThis statement is used to declare local variables. To provide a default\nvalue for the variable, include a DEFAULT clause. The value can be\nspecified as an expression; it need not be a constant. If the DEFAULT\nclause is missing, the initial value is NULL.\n\nLocal variables are treated like routine parameters with respect to\ndata type and overflow checking. See [HELP CREATE PROCEDURE].\n\nThe scope of a local variable is within the BEGIN ... END block where\nit is declared. The variable can be referred to in blocks nested within\nthe declaring block, except those blocks that declare a variable with\nthe same name.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/declare-local-variables.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/declare-local-variables.html'),
 (186,'MPOLYFROMTEXT',3,'MPolyFromText(wkt[,srid]), MultiPolygonFromText(wkt[,srid])\n\nConstructs a MULTIPOLYGON value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-wkt-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-wkt-functions.html'),
 (187,'GRANT',9,'Syntax:\nGRANT priv_type [(column_list)] [, priv_type [(column_list)]] ...\n    ON [object_type] {tbl_name | * | *.* | db_name.*}\n    TO user [IDENTIFIED BY [PASSWORD] \'password\']\n        [, user [IDENTIFIED BY [PASSWORD] \'password\']] ...\n    [REQUIRE\n        NONE |\n        [{SSL| X509}]\n        [CIPHER \'cipher\' [AND]]\n        [ISSUER \'issuer\' [AND]]\n        [SUBJECT \'subject\']]\n    [WITH with_option [with_option] ...]\n\nobject_type =\n    TABLE\n  | FUNCTION\n  | PROCEDURE\n\nwith_option =\n    GRANT OPTION\n  | MAX_QUERIES_PER_HOUR count\n  | MAX_UPDATES_PER_HOUR count\n  | MAX_CONNECTIONS_PER_HOUR count\n  | MAX_USER_CONNECTIONS count\n\nThe GRANT statement enables system administrators to create MySQL user\naccounts and to grant rights to from accounts. To use GRANT, you must\nhave the GRANT OPTION privilege, and you must have the privileges that\nyou are granting. The REVOKE statement is related and enables\nadministrators to remove account privileges. See [HELP REVOKE].\n\nMySQL account information is stored in the tables of the mysql\ndatabase. This database and the access control system are discussed\nextensively in\nhttp://dev.mysql.com/doc/refman/5.1/en/database-administration.html,\nwhich you should consult for additional details.\n\n*Important*: Some releases of MySQL introduce changes to the structure\nof the grant tables to add new privileges or features. Whenever you\nupdate to a new version of MySQL, you should update your grant tables\nto make sure that they have the current structure so that you can take\nadvantage of any new capabilities. See\nhttp://dev.mysql.com/doc/refman/5.1/en/mysql-upgrade.html.\n\nIf the grant tables hold privilege rows that contain mixed-case\ndatabase or table names and the lower_case_table_names system variable\nis set to a non-zero value, REVOKE cannot be used to revoke these\nprivileges. It will be necessary to manipulate the grant tables\ndirectly. (GRANT will not create such rows when lower_case_table_names\nis set, but such rows might have been created prior to setting the\nvariable.)\n\nPrivileges can be granted at several levels. The examples shown here\ninclude no IDENTIFIED BY \'password\' clause for brevity, but you should\ninclude one if the account does not already exist to avoid creating an\naccount with no password.\n\no Global level\n\n  Global privileges apply to all databases on a given server. These\n  privileges are stored in the mysql.user table. GRANT ALL ON *.* and\n  REVOKE ALL ON *.* grant and revoke only global privileges.\n\nGRANT ALL ON *.* TO \'someuser\'@\'somehost\';\nGRANT SELECT, INSERT ON *.* TO \'someuser\'@\'somehost\';\n\no Database level\n\n  Database privileges apply to all objects in a given database. These\n  privileges are stored in the mysql.db and mysql.host tables. GRANT\n  ALL ON db_name.* and REVOKE ALL ON db_name.* grant and revoke only\n  database privileges.\n\nGRANT ALL ON mydb.* TO \'someuser\'@\'somehost\';\nGRANT SELECT, INSERT ON mydb.* TO \'someuser\'@\'somehost\';\n\no Table level\n\n  Table privileges apply to all columns in a given table. These\n  privileges are stored in the mysql.tables_priv table. GRANT ALL ON\n  db_name.tbl_name and REVOKE ALL ON db_name.tbl_name grant and revoke\n  only table privileges.\n\nGRANT ALL ON mydb.mytbl TO \'someuser\'@\'somehost\';\nGRANT SELECT, INSERT ON mydb.mytbl TO \'someuser\'@\'somehost\';\n\no Column level\n\n  Column privileges apply to single columns in a given table. These\n  privileges are stored in the mysql.columns_priv table. When using\n  REVOKE, you must specify the same columns that were granted. The\n  column or columns for which the privileges are to be granted must be\n  enclosed within parentheses.\n\nGRANT SELECT (col1), INSERT (col1,col2) ON mydb.mytbl TO \'someuser\'@\'somehost\';\n\no Routine level\n\n  The CREATE ROUTINE, ALTER ROUTINE, EXECUTE, and GRANT privileges\n  apply to stored routines (functions and procedures). They can be\n  granted at the global and database levels. Also, except for CREATE\n  ROUTINE, these privileges can be granted at the routine level for\n  individual routines and are stored in the mysql.procs_priv table.\n\nGRANT CREATE ROUTINE ON mydb.* TO \'someuser\'@\'somehost\';\nGRANT EXECUTE ON PROCEDURE mydb.myproc TO \'someuser\'@\'somehost\';\n\nThe object_type clause should be specified as TABLE, FUNCTION, or\nPROCEDURE when the following object is a table, a stored function, or a\nstored procedure.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/grant.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/grant.html'),
 (188,'MBRINTERSECTS',6,'MBRIntersects(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 intersect.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/relations-on-geometry-mbr.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/relations-on-geometry-mbr.html'),
 (189,'BIT_OR',15,'Syntax:\nBIT_OR(expr)\n\nReturns the bitwise OR of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html'),
 (190,'YEARWEEK',29,'Syntax:\nYEARWEEK(date), YEARWEEK(date,mode)\n\nReturns year and week for a date. The mode argument works exactly like\nthe mode argument to WEEK(). The year in the result may be different\nfrom the year in the date argument for the first and the last week of\nthe year.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT YEARWEEK(\'1987-01-01\');\n        -> 198653\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (191,'NOT BETWEEN',18,'Syntax:\nexpr NOT BETWEEN min AND max\n\nThis is the same as NOT (expr BETWEEN min AND max).\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html'),
 (192,'LOG10',4,'Syntax:\nLOG10(X)\n\nReturns the base-10 logarithm of X.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT LOG10(2);\n        -> 0.30102999566398\nmysql> SELECT LOG10(100);\n        -> 2\nmysql> SELECT LOG10(-100);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (193,'SQRT',4,'Syntax:\nSQRT(X)\n\nReturns the square root of a non-negative number X.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT SQRT(4);\n        -> 2\nmysql> SELECT SQRT(20);\n        -> 4.4721359549996\nmysql> SELECT SQRT(-16);\n        -> NULL        \n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (194,'DECIMAL',21,'DECIMAL[(M[,D])] [UNSIGNED] [ZEROFILL]\n\nA packed \"exact\" fixed-point number. M is the total number of digits\n(the precision) and D is the number of digits after the decimal point\n(the scale). The decimal point and (for negative numbers) the `-\' sign\nare not counted in M. If D is 0, values have no decimal point or\nfractional part. The maximum number of digits (M) for DECIMAL is 65.\nThe maximum number of supported decimals (D) is 30. If D is omitted,\nthe default is 0. If M is omitted, the default is 10.\n\nUNSIGNED, if specified, disallows negative values.\n\nAll basic calculations (+, -, *, /) with DECIMAL columns are done with\na precision of 65 digits.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html'),
 (195,'CREATE FUNCTION',35,'Syntax:\nCREATE [AGGREGATE] FUNCTION function_name RETURNS {STRING|INTEGER|REAL|DECIMAL}\n    SONAME shared_library_name\n\nA user-defined function (UDF) is a way to extend MySQL with a new\nfunction that works like a native (built-in) MySQL function such as\nABS() or CONCAT().\n\nfunction_name is the name that should be used in SQL statements to\ninvoke the function. The RETURNS clause indicates the type of the\nfunction\'s return value. DECIMAL is a legal value after RETURNS, but\ncurrently DECIMAL functions return string values and should be written\nlike STRING functions.\n\nshared_library_name is the basename of the shared object file that\ncontains the code that implements the function. The file must be\nlocated in the plugin directory. This directory is given by the value\nof the plugin_dir system variable. (Note: This a change in MySQL 5.1.\nFor earlier versions of MySQL, the shared object can be located in any\ndirectory that is searched by your system\'s dynamic linker.)\n\nTo create a function, you must have the INSERT and privilege for the\nmysql database. This is necessary because CREATE FUNCTION adds a row to\nthe mysql.func system table that records the function\'s name, type, and\nshared library name. If you do not have this table, you should run the\nmysql_upgrade command to create it. See\nhttp://dev.mysql.com/doc/refman/5.1/en/mysql-upgrade.html.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/create-function.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/create-function.html'),
 (196,'GEOMETRYN',24,'GeometryN(gc,N)\n\nReturns the N-th geometry in the GeometryCollection value gc.\nGeometries are numbered beginning with 1.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/geometrycollection-property-functions.html\n\n','mysql> SET @gc = \'GeometryCollection(Point(1 1),LineString(2 2, 3 3))\';\nmysql> SELECT AsText(GeometryN(GeomFromText(@gc),1));\n+----------------------------------------+\n| AsText(GeometryN(GeomFromText(@gc),1)) |\n+----------------------------------------+\n| POINT(1 1)                             |\n+----------------------------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/geometrycollection-property-functions.html'),
 (197,'CREATE INDEX',37,'Syntax:\nCREATE [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name\n    [index_type]\n    ON tbl_name (index_col_name,...)\n    [index_option ...]\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_type:\n    USING {BTREE | HASH | RTREE}\n\nindex_option:\n    KEY_BLOCK_SIZE value\n  | index_type\n  | WITH PARSER parser_name\n\nCREATE INDEX is mapped to an ALTER TABLE statement to create indexes.\nSee [HELP ALTER TABLE]. CREATE INDEX cannot be used to create a PRIMARY\nKEY; use ALTER TABLE instead. For more information about indexes, see\nhttp://dev.mysql.com/doc/refman/5.1/en/mysql-indexes.html.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/create-index.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/create-index.html'),
 (198,'ALTER DATABASE',37,'Syntax:\nALTER {DATABASE | SCHEMA} [db_name]\n    alter_specification ...\n\nalter_specification:\n    [DEFAULT] CHARACTER SET charset_name\n  | [DEFAULT] COLLATE collation_name\n\nALTER DATABASE enables you to change the overall characteristics of a\ndatabase. These characteristics are stored in the db.opt file in the\ndatabase directory. To use ALTER DATABASE, you need the ALTER privilege\non the database. ALTER SCHEMA is a synonym for ALTER DATABASE.\n\nThe CHARACTER SET clause changes the default database character set.\nThe COLLATE clause changes the default database collation.\nhttp://dev.mysql.com/doc/refman/5.1/en/charset.html, discusses\ncharacter set and collation names.\n\nThe database name can be omitted, in which case the statement applies\nto the default database.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/alter-database.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/alter-database.html'),
 (199,'<<',19,'Syntax:\n<<\n\nShifts a longlong (BIGINT) number to the left.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/bit-functions.html\n\n','mysql> SELECT 1 << 2;\n        -> 4\n','http://dev.mysql.com/doc/refman/5.1/en/bit-functions.html'),
 (200,'SHOW TABLE STATUS',25,'Syntax:\nSHOW TABLE STATUS [FROM db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TABLE STATUS works likes SHOW TABLES, but provides a lot of\ninformation about each table. You can also get this list using the\nmysqlshow --status db_name command. The LIKE clause, if present,\nindicates which table names to match. The WHERE clause can be given to\nselect rows using more general conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.1/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-table-status.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-table-status.html'),
 (201,'MD5',11,'Syntax:\nMD5(str)\n\nCalculates an MD5 128-bit checksum for the string. The value is\nreturned as a binary string of 32 hex digits, or NULL if the argument\nwas NULL. The return value can, for example, be used as a hash key.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html\n\n','mysql> SELECT MD5(\'testing\');\n        -> \'ae2b1fca515949e5d54fb22b8ed95575\'\n','http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html'),
 (202,'<',18,'Syntax:\n<\n\nLess than:\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html\n\n','mysql> SELECT 2 < 2;\n        -> 0\n','http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html'),
 (203,'UNIX_TIMESTAMP',29,'Syntax:\nUNIX_TIMESTAMP(), UNIX_TIMESTAMP(date)\n\nIf called with no argument, returns a Unix timestamp (seconds since\n\'1970-01-01 00:00:00\' UTC) as an unsigned integer. If UNIX_TIMESTAMP()\nis called with a date argument, it returns the value of the argument as\nseconds since \'1970-01-01 00:00:00\' UTC. date may be a DATE string, a\nDATETIME string, a TIMESTAMP, or a number in the format YYMMDD or\nYYYYMMDD. The server interprets date as a value in the current time\nzone and converts it to an internal value in UTC. Clients can set their\ntime zone as described in\nhttp://dev.mysql.com/doc/refman/5.1/en/time-zone-support.html.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT UNIX_TIMESTAMP();\n        -> 882226357\nmysql> SELECT UNIX_TIMESTAMP(\'1997-10-04 22:23:00\');\n        -> 875996580\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (204,'DAYOFMONTH',29,'Syntax:\nDAYOFMONTH(date)\n\nReturns the day of the month for date, in the range 0 to 31.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT DAYOFMONTH(\'1998-02-03\');\n        -> 3\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (205,'ASCII',34,'Syntax:\nASCII(str)\n\nReturns the numeric value of the leftmost character of the string str.\nReturns 0 if str is the empty string. Returns NULL if str is NULL.\nASCII() works for 8-bit characters.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT ASCII(\'2\');\n        -> 50\nmysql> SELECT ASCII(2);\n        -> 50\nmysql> SELECT ASCII(\'dx\');\n        -> 100\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (206,'DIV',4,'Syntax:\nDIV\n\nInteger division. Similar to FLOOR(), but is safe with BIGINT values.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/arithmetic-functions.html\n\n','mysql> SELECT 5 DIV 2;\n        -> 2\n','http://dev.mysql.com/doc/refman/5.1/en/arithmetic-functions.html'),
 (207,'RENAME USER',9,'Syntax:\nRENAME USER old_user TO new_user\n    [, old_user TO new_user] ...\n\nThe RENAME USER statement renames existing MySQL accounts. To use it,\nyou must have the global CREATE USER privilege or the UPDATE privilege\nfor the mysql database. An error occurs if any old account does not\nexist or any new account exists. Each account is named using the same\nformat as for the GRANT statement; for example, \'jeffrey\'@\'localhost\'.\nIf you specify only the username part of the account name, a hostname\npart of \'%\' is used. For additional information about specifying\naccount names, see [HELP GRANT].\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/rename-user.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/rename-user.html'),
 (208,'SHOW SLAVE STATUS',25,'Syntax:\nSHOW SLAVE STATUS\n\nThis statement provides status information on essential parameters of\nthe slave threads. If you issue this statement using the mysql client,\nyou can use a \\G statement terminator rather than a semicolon to obtain\na more readable vertical layout:\n\nmysql> SHOW SLAVE STATUS\\G\n*************************** 1. row ***************************\n               Slave_IO_State: Waiting for master to send event\n                  Master_Host: localhost\n                  Master_User: root\n                  Master_Port: 3306\n                Connect_Retry: 3\n              Master_Log_File: gbichot-bin.005\n          Read_Master_Log_Pos: 79\n               Relay_Log_File: gbichot-relay-bin.005\n                Relay_Log_Pos: 548\n        Relay_Master_Log_File: gbichot-bin.005\n             Slave_IO_Running: Yes\n            Slave_SQL_Running: Yes\n              Replicate_Do_DB:\n          Replicate_Ignore_DB:\n                   Last_Errno: 0\n                   Last_Error:\n                 Skip_Counter: 0\n          Exec_Master_Log_Pos: 79\n              Relay_Log_Space: 552\n              Until_Condition: None\n               Until_Log_File:\n                Until_Log_Pos: 0\n           Master_SSL_Allowed: No\n           Master_SSL_CA_File:\n           Master_SSL_CA_Path:\n              Master_SSL_Cert:\n            Master_SSL_Cipher:\n               Master_SSL_Key:\n        Seconds_Behind_Master: 8\nMaster_SSL_Verify_Server_Cert: No\n                Last_IO_Errno: 0\n                Last_IO_Error:\n               Last_SQL_Errno: 0\n               Last_SQL_Error:\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-slave-status.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-slave-status.html'),
 (209,'GEOMETRY',31,'MySQL provides a standard way of creating spatial columns for geometry\ntypes, for example, with CREATE TABLE or ALTER TABLE. Currently,\nspatial columns are supported for MyISAM, InnoDB, NDB, and ARCHIVE\ntables. See also the annotations about spatial indexes under [HELP\nSPATIAL].\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/creating-spatial-columns.html\n\n','CREATE TABLE geom (g GEOMETRY);\n','http://dev.mysql.com/doc/refman/5.1/en/creating-spatial-columns.html'),
 (210,'NUMPOINTS',12,'NumPoints(ls)\n\nReturns the number of Point objects in the LineString value ls.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/linestring-property-functions.html\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT NumPoints(GeomFromText(@ls));\n+------------------------------+\n| NumPoints(GeomFromText(@ls)) |\n+------------------------------+\n|                            3 |\n+------------------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/linestring-property-functions.html'),
 (211,'&',19,'Syntax:\n&\n\nBitwise AND:\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/bit-functions.html\n\n','mysql> SELECT 29 & 15;\n        -> 13\n','http://dev.mysql.com/doc/refman/5.1/en/bit-functions.html'),
 (212,'LOCALTIMESTAMP',29,'Syntax:\nLOCALTIMESTAMP, LOCALTIMESTAMP()\n\nLOCALTIMESTAMP and LOCALTIMESTAMP() are synonyms for NOW().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (213,'ADDDATE',29,'Syntax:\nADDDATE(date,INTERVAL expr unit), ADDDATE(expr,days)\n\nWhen invoked with the INTERVAL form of the second argument, ADDDATE()\nis a synonym for DATE_ADD(). The related function SUBDATE() is a\nsynonym for DATE_SUB(). For information on the INTERVAL unit argument,\nsee the discussion for DATE_ADD().\n\nmysql> SELECT DATE_ADD(\'1998-01-02\', INTERVAL 31 DAY);\n        -> \'1998-02-02\'\nmysql> SELECT ADDDATE(\'1998-01-02\', INTERVAL 31 DAY);\n        -> \'1998-02-02\'\n\nWhen invoked with the days form of the second argument, MySQL treats it\nas an integer number of days to be added to expr.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT ADDDATE(\'1998-01-02\', 31);\n        -> \'1998-02-02\'\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (214,'REPEAT LOOP',36,'Syntax:\n[begin_label:] REPEAT\n    statement_list\nUNTIL search_condition\nEND REPEAT [end_label]\n\nThe statement list within a REPEAT statement is repeated until the\nsearch_condition is true. Thus, a REPEAT always enters the loop at\nleast once. statement_list consists of one or more statements.\n\nA REPEAT statement can be labeled. end_label cannot be given unless\nbegin_label also is present. If both are present, they must be the\nsame.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/repeat-statement.html\n\n','mysql> delimiter //\n\nmysql> CREATE PROCEDURE dorepeat(p1 INT)\n    -> BEGIN\n    ->   SET @x = 0;\n    ->   REPEAT SET @x = @x + 1; UNTIL @x > p1 END REPEAT;\n    -> END\n    -> //\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> CALL dorepeat(1000)//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT @x//\n+------+\n| @x   |\n+------+\n| 1001 |\n+------+\n1 row in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.1/en/repeat-statement.html'),
 (215,'SMALLINT',21,'SMALLINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA small integer. The signed range is -32768 to 32767. The unsigned\nrange is 0 to 65535.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html'),
 (216,'DOUBLE PRECISION',21,'DOUBLE PRECISION[(M,D)] [UNSIGNED] [ZEROFILL], REAL[(M,D)] [UNSIGNED]\n[ZEROFILL]\n\nThese types are synonyms for DOUBLE. Exception: If the REAL_AS_FLOAT\nSQL mode is enabled, REAL is a synonym for FLOAT rather than DOUBLE.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html'),
 (217,'ORD',34,'Syntax:\nORD(str)\n\nIf the leftmost character of the string str is a multi-byte character,\nreturns the code for that character, calculated from the numeric values\nof its constituent bytes using this formula:\n\n  (1st byte code)\n+ (2nd byte code x 256)\n+ (3rd byte code x 2562) ...\n\nIf the leftmost character is not a multi-byte character, ORD() returns\nthe same value as the ASCII() function.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT ORD(\'2\');\n        -> 50\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (218,'ENVELOPE',33,'Envelope(g)\n\nReturns the Minimum Bounding Rectangle (MBR) for the geometry value g.\nThe result is returned as a Polygon value.\n\nThe polygon is defined by the corner points of the bounding box:\n\nPOLYGON((MINX MINY, MAXX MINY, MAXX MAXY, MINX MAXY, MINX MINY))\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/general-geometry-property-functions.html\n\n','mysql> SELECT AsText(Envelope(GeomFromText(\'LineString(1 1,2 2)\')));\n+-------------------------------------------------------+\n| AsText(Envelope(GeomFromText(\'LineString(1 1,2 2)\'))) |\n+-------------------------------------------------------+\n| POLYGON((1 1,2 1,2 2,1 2,1 1))                        |\n+-------------------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/general-geometry-property-functions.html'),
 (219,'DEALLOCATE PREPARE',25,'Syntax:\n{DEALLOCATE | DROP} PREPARE stmt_name\n\nTo deallocate a prepared statement, use the DEALLOCATE PREPARE\nstatement. Attempting to execute a prepared statement after\ndeallocating it results in an error.\n\nIf you terminate a client session without deallocating a previously\nprepared statement, the server deallocates it automatically.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/sqlps.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/sqlps.html'),
 (220,'IS_FREE_LOCK',14,'Syntax:\nIS_FREE_LOCK(str)\n\nChecks whether the lock named str is free to use (that is, not locked).\nReturns 1 if the lock is free (no one is using the lock), 0 if the lock\nis in use, and NULL if an error occurs (such as an incorrect argument).\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html'),
 (221,'TOUCHES',27,'Touches(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially touches g2. Two\ngeometries spatially touch if the interiors of the geometries do not\nintersect, but the boundary of one of the geometries intersects either\nthe boundary or the interior of the other.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/functions-that-test-spatial-relationships-between-geometries.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/functions-that-test-spatial-relationships-between-geometries.html'),
 (222,'INET_ATON',14,'Syntax:\nINET_ATON(expr)\n\nGiven the dotted-quad representation of a network address as a string,\nreturns an integer that represents the numeric value of the address.\nAddresses may be 4- or 8-byte addresses.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html\n\n','mysql> SELECT INET_ATON(\'209.207.224.40\');\n        -> 3520061480\n','http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html'),
 (223,'UNCOMPRESS',11,'Syntax:\nUNCOMPRESS(string_to_uncompress)\n\nUncompresses a string compressed by the COMPRESS() function. If the\nargument is not a compressed value, the result is NULL. This function\nrequires MySQL to have been compiled with a compression library such as\nzlib. Otherwise, the return value is always NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html\n\n','mysql> SELECT UNCOMPRESS(COMPRESS(\'any string\'));\n        -> \'any string\'\nmysql> SELECT UNCOMPRESS(\'any string\');\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html'),
 (224,'AUTO_INCREMENT',21,'The AUTO_INCREMENT attribute can be used to generate a unique identity\nfor new rows:\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/example-auto-increment.html\n\n','CREATE TABLE animals (\n     id MEDIUMINT NOT NULL AUTO_INCREMENT,\n     name CHAR(30) NOT NULL,\n     PRIMARY KEY (id)\n );\n\nINSERT INTO animals (name) VALUES \n    (\'dog\'),(\'cat\'),(\'penguin\'),\n    (\'lax\'),(\'whale\'),(\'ostrich\');\n\nSELECT * FROM animals;\n','http://dev.mysql.com/doc/refman/5.1/en/example-auto-increment.html'),
 (225,'ISSIMPLE',33,'IsSimple(g)\n\nCurrently, this function is a placeholder and should not be used. If\nimplemented, its behavior will be as described in the next paragraph.\n\nReturns 1 if the geometry value g has no anomalous geometric points,\nsuch as self-intersection or self-tangency. IsSimple() returns 0 if the\nargument is not simple, and -1 if it is NULL.\n\nThe description of each instantiable geometric class given earlier in\nthe chapter includes the specific conditions that cause an instance of\nthat class to be classified as not simple. (See [HELP Geometry\nhierarchy].)\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/general-geometry-property-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/general-geometry-property-functions.html'),
 (226,'- BINARY',4,'Syntax:\n-\n\nSubtraction:\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/arithmetic-functions.html\n\n','mysql> SELECT 3-5;\n        -> -2\n','http://dev.mysql.com/doc/refman/5.1/en/arithmetic-functions.html'),
 (227,'GEOMCOLLFROMTEXT',3,'GeomCollFromText(wkt[,srid]), GeometryCollectionFromText(wkt[,srid])\n\nConstructs a GEOMETRYCOLLECTION value using its WKT representation and\nSRID.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-wkt-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-wkt-functions.html'),
 (228,'WKT DEFINITION',3,'The Well-Known Text (WKT) representation of Geometry is designed to\nexchange geometry data in ASCII form.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-wkt-format.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-wkt-format.html'),
 (229,'CURRENT_TIME',29,'Syntax:\nCURRENT_TIME, CURRENT_TIME()\n\nCURRENT_TIME and CURRENT_TIME() are synonyms for CURTIME().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (230,'REVOKE',9,'Syntax:\nREVOKE priv_type [(column_list)] [, priv_type [(column_list)]] ...\n    ON [object_type] {tbl_name | * | *.* | db_name.*}\n    FROM user [, user] ...\n\nREVOKE ALL PRIVILEGES, GRANT OPTION FROM user [, user] ...\n\nThe REVOKE statement enables system administrators to revoke privileges\nfrom MySQL accounts. To use REVOKE, you must have the GRANT OPTION\nprivilege, and you must have the privileges that you are revoking.\n\nEach account is named using the same format as for the GRANT statement;\nfor example, \'jeffrey\'@\'localhost\'. If you specify only the username\npart of the account name, a hostname part of \'%\' is used. For\nadditional information about specifying account names, see [HELP\nGRANT].\n\nFor details on the levels at which privileges exist, the allowable\npriv_type values, and the syntax for specifying users and passwords,\nsee [HELP GRANT]\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/revoke.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/revoke.html'),
 (231,'LAST_INSERT_ID',16,'Syntax:\nLAST_INSERT_ID(), LAST_INSERT_ID(expr)\n\nFor MySQL 5.1.12 and later, LAST_INSERT_ID() (no arguments) returns the\nfirst automatically generated value successfully inserted for an\nAUTO_INCREMENT column as a result of the most recently executed INSERT\nstatement. The value of LAST_INSERT_ID() remains unchanged if no rows\nare successfully inserted.\n\nFor example, after inserting a row that generates an AUTO_INCREMENT\nvalue, you can get the value like this:\n\nmysql> SELECT LAST_INSERT_ID();\n        -> 195\n\nIn MySQL 5.1.11 and earlier, LAST_INSERT_ID() (no arguments) returns\nthe first automatically generated value if any rows were successfully\ninserted or updated. This means that the returned value could be a\nvalue that was not successfully inserted into the table. If no rows\nwere successfully inserted, LAST_INSERT_ID() returns 0.\n\nThe value of LAST_INSERT_ID() will be consistent across all versions if\nall rows in the INSERT or UPDATE statement were successful.\n\nThe currently executing statement does not affect the value of\nLAST_INSERT_ID(). Suppose that you generate an AUTO_INCREMENT value\nwith one statement, and then refer to LAST_INSERT_ID() in a\nmultiple-row INSERT statement that inserts rows into a table with its\nown AUTO_INCREMENT column. The value of LAST_INSERT_ID() will remain\nstable in the second statement; its value for the second and later rows\nis not affected by the earlier row insertions. (However, if you mix\nreferences to LAST_INSERT_ID() and LAST_INSERT_ID(expr), the effect is\nundefined.)\n\nIf the previous statement returned an error, the value of\nLAST_INSERT_ID() is undefined. For transactional tables, if the\nstatement is rolled back due to an error, the value of LAST_INSERT_ID()\nis left undefined. For manual ROLLBACK, the value of LAST_INSERT_ID()\nis not restored to that before the transaction; it remains as it was at\nthe point of the ROLLBACK.\n\nWithin the body of a stored routine (procedure or function) or a\ntrigger, the value of LAST_INSERT_ID() changes the same way as for\nstatements executed outside the body of these kinds of objects. The\neffect of a stored routine or trigger upon the value of\nLAST_INSERT_ID() that is seen by following statements depends on the\nkind of routine:\n\no If a stored procedure executes statements that change the value of\n  LAST_INSERT_ID(), the changed value will be seen by statements that\n  follow the procedure call.\n\no For stored functions and triggers that change the value, the value is\n  restored when the function or trigger ends, so following statements\n  will not see a changed value.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/information-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/information-functions.html'),
 (232,'LAST_DAY',29,'Syntax:\nLAST_DAY(date)\n\nTakes a date or datetime value and returns the corresponding value for\nthe last day of the month. Returns NULL if the argument is invalid.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT LAST_DAY(\'2003-02-05\');\n        -> \'2003-02-28\'\nmysql> SELECT LAST_DAY(\'2004-02-05\');\n        -> \'2004-02-29\'\nmysql> SELECT LAST_DAY(\'2004-01-01 01:01:01\');\n        -> \'2004-01-31\'\nmysql> SELECT LAST_DAY(\'2003-03-32\');\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (233,'MEDIUMINT',21,'MEDIUMINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA medium-sized integer. The signed range is -8388608 to 8388607. The\nunsigned range is 0 to 16777215.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html'),
 (234,'FLOOR',4,'Syntax:\nFLOOR(X)\n\nReturns the largest integer value not greater than X.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT FLOOR(1.23);\n        -> 1\nmysql> SELECT FLOOR(-1.23);\n        -> -2\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (235,'RTRIM',34,'Syntax:\nRTRIM(str)\n\nReturns the string str with trailing space characters removed.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT RTRIM(\'barbar   \');\n        -> \'barbar\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (236,'DEGREES',4,'Syntax:\nDEGREES(X)\n\nReturns the argument X, converted from radians to degrees.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT DEGREES(PI());\n        -> 180\nmysql> SELECT DEGREES(PI() / 2);\n        -> 90\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (237,'EXPLAIN',25,'Syntax:\nEXPLAIN tbl_name\n\nOr:\n\nEXPLAIN [EXTENDED | PARTITIONS] SELECT select_options\n\nThe EXPLAIN statement can be used either as a synonym for DESCRIBE or\nas a way to obtain information about how MySQL executes a SELECT\nstatement:\n\no EXPLAIN tbl_name is synonymous with DESCRIBE tbl_name or SHOW COLUMNS\n  FROM tbl_name.\n\no When you precede a SELECT statement with the keyword EXPLAIN, MySQL\n  displays information from the optimizer about the query execution\n  plan. That is, MySQL explains how it would process the SELECT,\n  including information about how tables are joined and in which order.\n\no EXPLAIN PARTITIONS is available beginning with MySQL 5.1.5. It is\n  useful only when examining queries involving partitioned tables. For\n  details, see\n  http://dev.mysql.com/doc/refman/5.1/en/partitioning-info.html.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/explain.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/explain.html'),
 (238,'VARCHAR',21,'[NATIONAL] VARCHAR(M) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA variable-length string. M represents the maximum column length. The\nrange of M is 0 to 65,535. (The actual maximum length of a VARCHAR is\ndetermined by the maximum row size and the character set you use. The\nmaximum effective column length is subject to a row size of 65,535\nbytes, which is shared among all columns.)\n\n*Note*: MySQL 5.1 follows the standard SQL specification, and does not\nremove trailing spaces from VARCHAR values.\n\nVARCHAR is shorthand for CHARACTER VARYING.\n\nVARCHAR is stored with a one-byte or two-byte length prefix plus data.\nThe length prefix is two bytes if the VARCHAR column is declared with a\nlength greater than 255.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html'),
 (239,'UNHEX',34,'Syntax:\n\nUNHEX(str)\n\nPerforms the inverse operation of HEX(str). That is, it interprets each\npair of hexadecimal digits in the argument as a number and converts it\nto the character represented by the number. The resulting characters\nare returned as a binary string.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT UNHEX(\'4D7953514C\');\n        -> \'MySQL\'\nmysql> SELECT 0x4D7953514C;\n        -> \'MySQL\'\nmysql> SELECT UNHEX(HEX(\'string\'));\n        -> \'string\'\nmysql> SELECT HEX(UNHEX(\'1267\'));\n        -> \'1267\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (240,'- UNARY',4,'Syntax:\n-\n\nUnary minus. This operator changes the sign of the argument.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/arithmetic-functions.html\n\n','mysql> SELECT - 2;\n        -> -2\n','http://dev.mysql.com/doc/refman/5.1/en/arithmetic-functions.html'),
 (241,'SELECT INTO',36,'Syntax:\nSELECT col_name[,...] INTO var_name[,...] table_expr\n\nThis SELECT syntax stores selected columns directly into variables.\nTherefore, only a single row may be retrieved.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/select-into-statement.html\n\n','SELECT id,data INTO x,y FROM test.t1 LIMIT 1;\n','http://dev.mysql.com/doc/refman/5.1/en/select-into-statement.html'),
 (242,'COS',4,'Syntax:\nCOS(X)\n\nReturns the cosine of X, where X is given in radians.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT COS(PI());\n        -> -1\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (243,'DATE FUNCTION',29,'Syntax:\nDATE(expr)\n\nExtracts the date part of the date or datetime expression expr.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT DATE(\'2003-12-31 01:02:03\');\n        -> \'2003-12-31\'\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (244,'DROP TRIGGER',22,'Syntax:\nDROP TRIGGER [IF EXISTS] [schema_name.]trigger_name\n\nThis statement drops a trigger. The schema (database) name is optional.\nIf the schema is omitted, the trigger is dropped from the default\nschema. DROP TRIGGER was added in MySQL 5.0.2. Its use requires the\nTRIGGER privilege for the table associated with the trigger. (This\nstatement requires the SUPER privilege prior to MySQL 5.1.6.)\n\nUse IF EXISTS to prevent an error from occurring for a trigger that\ndoes not exist. A NOTE is generated for a non-existent trigger when\nusing IF EXISTS. See [HELP SHOW WARNINGS]. The IF EXISTS clause was\nadded in MySQL 5.1.14.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/drop-trigger.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/drop-trigger.html'),
 (245,'RESET MASTER',25,'Syntax:\nRESET MASTER\n\nDeletes all binary logs listed in the index file, resets the binary log\nindex file to be empty, and creates a new binary log file.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/reset-master.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/reset-master.html'),
 (246,'TAN',4,'Syntax:\nTAN(X)\n\nReturns the tangent of X, where X is given in radians.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT TAN(PI());\n        -> -1.2246063538224e-16\nmysql> SELECT TAN(PI()+1);\n        -> 1.5574077246549\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (247,'PI',4,'Syntax:\nPI()\n\nReturns the value of π (pi). The default number of decimal places\ndisplayed is seven, but MySQL uses the full double-precision value\ninternally.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT PI();\n        -> 3.141593\nmysql> SELECT PI()+0.000000000000000000;\n        -> 3.141592653589793116\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (248,'WEEKOFYEAR',29,'Syntax:\nWEEKOFYEAR(date)\n\nReturns the calendar week of the date as a number in the range from 1\nto 53. WEEKOFYEAR() is a compatibility function that is equivalent to\nWEEK(date,3).\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT WEEKOFYEAR(\'1998-02-20\');\n        -> 8\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (249,'/',4,'Syntax:\n/\n\nDivision:\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/arithmetic-functions.html\n\n','mysql> SELECT 3/5;\n        -> 0.60\n','http://dev.mysql.com/doc/refman/5.1/en/arithmetic-functions.html'),
 (250,'STDDEV_SAMP',15,'Syntax:\nSTDDEV_SAMP(expr)\n\nReturns the sample standard deviation of expr (the square root of\nVAR_SAMP().\n\nSTDDEV_SAMP() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html'),
 (251,'SCHEMA',16,'Syntax:\nSCHEMA()\n\nThis function is a synonym for DATABASE().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/information-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/information-functions.html'),
 (252,'MLINEFROMWKB',30,'MLineFromWKB(wkb[,srid]), MultiLineStringFromWKB(wkb[,srid])\n\nConstructs a MULTILINESTRING value using its WKB representation and\nSRID.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-wkb-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-wkb-functions.html'),
 (253,'LOG2',4,'Syntax:\nLOG2(X)\n\nReturns the base-2 logarithm of X.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT LOG2(65536);\n        -> 16\nmysql> SELECT LOG2(-100);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (254,'SUBTIME',29,'Syntax:\nSUBTIME(expr1,expr2)\n\nSUBTIME() returns expr1 - expr2 expressed as a value in the same format\nas expr1. expr1 is a time or datetime expression, and expr2 is a time\nexpression.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT SUBTIME(\'1997-12-31 23:59:59.999999\',\'1 1:1:1.000002\');\n        -> \'1997-12-30 22:58:58.999997\'\nmysql> SELECT SUBTIME(\'01:00:00.999999\', \'02:00:00.999998\');\n        -> \'-00:59:59.999999\'\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (255,'UNCOMPRESSED_LENGTH',11,'Syntax:\nUNCOMPRESSED_LENGTH(compressed_string)\n\nReturns the length that the compressed string had before being\ncompressed.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html\n\n','mysql> SELECT UNCOMPRESSED_LENGTH(COMPRESS(REPEAT(\'a\',30)));\n        -> 30\n','http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html'),
 (256,'DROP TABLE',37,'Syntax:\nDROP [TEMPORARY] TABLE [IF EXISTS]\n    tbl_name [, tbl_name] ...\n    [RESTRICT | CASCADE]\n\nDROP TABLE removes one or more tables. You must have the DROP privilege\nfor each table. All table data and the table definition are removed, so\nbe careful with this statement! If any of the tables named in the\nargument list do not exist, MySQL returns an error indicating by name\nwhich non-existing tables it was unable to drop, but it also drops all\nof the tables in the list that do exist.\n\n*Important*: When a table is dropped, user privileges on the table are\nnot automatically dropped. See [HELP GRANT].\n\nNote that for a partitioned table, DROP TABLE permanently removes the\ntable definition, all of its partitions, and all of the data which was\nstored in those partitions. It also removes the partitioning definition\n(.par) file associated with the dropped table.\n\nUse IF EXISTS to prevent an error from occurring for tables that do not\nexist. A NOTE is generated for each non-existent table when using IF\nEXISTS. See [HELP SHOW WARNINGS].\n\nRESTRICT and CASCADE are allowed to make porting easier. In MySQL 5.1,\nthey do nothing.\n\n*Note*: DROP TABLE automatically commits the current active\ntransaction, unless you use the TEMPORARY keyword.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/drop-table.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/drop-table.html'),
 (257,'SHOW CREATE TABLE',25,'Syntax:\nSHOW CREATE TABLE tbl_name\n\nShows the CREATE TABLE statement that creates the given table. This\nstatement also works with views.\nSHOW CREATE TABLE quotes table and column names according to the value\nof the SQL_QUOTE_SHOW_CREATE option. See [HELP SET].\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-create-table.html\n\n','mysql> SHOW CREATE TABLE t\\G\n*************************** 1. row ***************************\n       Table: t\nCreate Table: CREATE TABLE t (\n  id INT(11) default NULL auto_increment,\n  s char(60) default NULL,\n  PRIMARY KEY (id)\n) ENGINE=MyISAM\n','http://dev.mysql.com/doc/refman/5.1/en/show-create-table.html'),
 (258,'DUAL',25,'You are allowed to specify DUAL as a dummy table name in situations\nwhere no tables are referenced:\n\nmysql> SELECT 1 + 1 FROM DUAL;\n        -> 2\n\nDUAL is purely for the convenience of people who require that all\nSELECT statements should have FROM and possibly other clauses. MySQL\nmay ignore the clauses. MySQL does not require FROM DUAL if no tables\nare referenced.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/select.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/select.html'),
 (259,'INSTR',34,'Syntax:\nINSTR(str,substr)\n\nReturns the position of the first occurrence of substring substr in\nstring str. This is the same as the two-argument form of LOCATE(),\nexcept that the order of the arguments is reversed.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT INSTR(\'foobarbar\', \'bar\');\n        -> 4\nmysql> SELECT INSTR(\'xbar\', \'foobar\');\n        -> 0\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (260,'NOW',29,'Syntax:\nNOW()\n\nReturns the current date and time as a value in \'YYYY-MM-DD HH:MM:SS\'\nor YYYYMMDDHHMMSS format, depending on whether the function is used in\na string or numeric context. The value is expressed in the current time\nzone.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT NOW();\n        -> \'1997-12-15 23:50:26\'\nmysql> SELECT NOW() + 0;\n        -> 19971215235026\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (261,'SHOW ENGINES',25,'Syntax:\nSHOW [STORAGE] ENGINES\n\nSHOW ENGINES displays status information about the server\'s storage\nengines. This is particularly useful for checking whether a storage\nengine is supported, or to see what the default engine is. SHOW TABLE\nTYPES is a deprecated synonym.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-engines.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-engines.html'),
 (262,'>=',18,'Syntax:\n>=\n\nGreater than or equal:\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html\n\n','mysql> SELECT 2 >= 2;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html'),
 (263,'EXP',4,'Syntax:\nEXP(X)\n\nReturns the value of e (the base of natural logarithms) raised to the\npower of X.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT EXP(2);\n        -> 7.3890560989307\nmysql> SELECT EXP(-2);\n        -> 0.13533528323661\nmysql> SELECT EXP(0);\n        -> 1\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (264,'SHA',11,'Syntax:\nSHA1(str), SHA(str)\n\nCalculates an SHA-1 160-bit checksum for the string, as described in\nRFC 3174 (Secure Hash Algorithm). The value is returned as a binary\nstring of 40 hex digits, or NULL if the argument was NULL. One of the\npossible uses for this function is as a hash key. You can also use it\nas a cryptographic function for storing passwords. SHA() is synonymous\nwith SHA1().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html\n\n','mysql> SELECT SHA1(\'abc\');\n        -> \'a9993e364706816aba3e25717850c26c9cd0d89d\'\n','http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html'),
 (265,'LONGBLOB',21,'LONGBLOB\n\nA BLOB column with a maximum length of 4,294,967,295 or 4GB (232 - 1)\nbytes. The maximum effective (permitted) length of LONGBLOB columns\ndepends on the configured maximum packet size in the client/server\nprotocol and available memory.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html'),
 (266,'POINTN',12,'PointN(ls,N)\n\nReturns the N-th Point in the Linestring value ls. Points are numbered\nbeginning with 1.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/linestring-property-functions.html\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(PointN(GeomFromText(@ls),2));\n+-------------------------------------+\n| AsText(PointN(GeomFromText(@ls),2)) |\n+-------------------------------------+\n| POINT(2 2)                          |\n+-------------------------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/linestring-property-functions.html'),
 (267,'YEAR DATA TYPE',21,'YEAR[(2|4)]\n\nA year in two-digit or four-digit format. The default is four-digit\nformat. In four-digit format, the allowable values are 1901 to 2155,\nand 0000. In two-digit format, the allowable values are 70 to 69,\nrepresenting years from 1970 to 2069. MySQL displays YEAR values in\nYYYY format, but allows you to assign values to YEAR columns using\neither strings or numbers.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-type-overview.html'),
 (268,'SUM',15,'Syntax:\nSUM([DISTINCT] expr)\n\nReturns the sum of expr. If the return set has no rows, SUM() returns\nNULL. The DISTINCT keyword can be used in MySQL 5.1 to sum only the\ndistinct values of expr.\n\nSUM() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html'),
 (269,'OCT',34,'Syntax:\nOCT(N)\n\nReturns a string representation of the octal value of N, where N is a\nlonglong (BIGINT) number. This is equivalent to CONV(N,10,8). Returns\nNULL if N is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT OCT(12);\n        -> \'14\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (270,'SYSDATE',29,'Syntax:\nSYSDATE()\n\nReturns the current date and time as a value in \'YYYY-MM-DD HH:MM:SS\'\nor YYYYMMDDHHMMSS format, depending on whether the function is used in\na string or numeric context.\n\nSYSDATE() returns the time at which it executes. This differs from the\nbehavior for NOW(), which returns a constant time that indicates the\ntime at which the statement began to execute. (Within a stored routine\nor trigger, NOW() returns the time at which the routine or triggering\nstatement began to execute.)\n\nmysql> SELECT NOW(), SLEEP(2), NOW();\n+---------------------+----------+---------------------+\n| NOW()               | SLEEP(2) | NOW()               |\n+---------------------+----------+---------------------+\n| 2006-04-12 13:47:36 |        0 | 2006-04-12 13:47:36 |\n+---------------------+----------+---------------------+\n\nmysql> SELECT SYSDATE(), SLEEP(2), SYSDATE();\n+---------------------+----------+---------------------+\n| SYSDATE()           | SLEEP(2) | SYSDATE()           |\n+---------------------+----------+---------------------+\n| 2006-04-12 13:47:44 |        0 | 2006-04-12 13:47:46 |\n+---------------------+----------+---------------------+\n\nIn addition, the SET TIMESTAMP statement affects the value returned by\nNOW() but not by SYSDATE(). This means that timestamp settings in the\nbinary log have no effect on invocations of SYSDATE().\n\nBecause SYSDATE() can return different values even within the same\nstatement, and is not affected by SET TIMESTAMP, it is\nnon-deterministic and therefore unsafe for replication if\nstatement-based binary logging is used. If that is a problem, you can\nuse row-based logging, or start the server with the --sysdate-is-now\noption to cause SYSDATE() to be an alias for NOW(). The\nnon-deterministic nature of SYSDATE() also means that indexes cannot be\nused for evaluating expressions that refer to it.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (271,'UNINSTALL PLUGIN',5,'Syntax:\nUNINSTALL PLUGIN plugin_name\n\nThis statement removes an installed plugin. You cannot uninstall a\nplugin if any table that uses it is open.\n\nplugin_name must be the name of some plugin that is listed in the\nmysql.plugin table. The server executes the plugin\'s deinitialization\nfunction and removes the row for the plugin from the mysql.plugin\ntable, so that subsequent server restarts will not load and initialize\nthe plugin. UNINSTALL PLUGIN does not remove the plugin\'s shared\nlibrary file.\n\nTo use UNINSTALL PLUGIN, you must have the DELETE privilege for the\nmysql.plugin table.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/uninstall-plugin.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/uninstall-plugin.html');
INSERT INTO `help_topic` (`help_topic_id`,`name`,`help_category_id`,`description`,`example`,`url`) VALUES 
 (272,'ASBINARY',30,'AsBinary(g)\n\nConverts a value in internal geometry format to its WKB representation\nand returns the binary result.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/functions-to-convert-geometries-between-formats.html\n\n','SELECT AsBinary(g) FROM geom;\n','http://dev.mysql.com/doc/refman/5.1/en/functions-to-convert-geometries-between-formats.html'),
 (273,'REPEAT FUNCTION',34,'Syntax:\nREPEAT(str,count)\n\nReturns a string consisting of the string str repeated count times. If\ncount is less than 1, returns an empty string. Returns NULL if str or\ncount are NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT REPEAT(\'MySQL\', 3);\n        -> \'MySQLMySQLMySQL\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (274,'SHOW TABLES',25,'Syntax:\nSHOW [FULL] TABLES [FROM db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TABLES lists the non-TEMPORARY tables in a given database. You can\nalso get this list using the mysqlshow db_name command. The LIKE\nclause, if present, indicates which table names to match. The WHERE\nclause can be given to select rows using more general conditions, as\ndiscussed in http://dev.mysql.com/doc/refman/5.1/en/extended-show.html.\n\nThis statement also lists any views in the database. The FULL modifier\nis supported such that SHOW FULL TABLES displays a second output\ncolumn. Values for the second column are BASE TABLE for a table and\nVIEW for a view.\n\n*Note*: If you have no privileges for a table, the table does not show\nup in the output from SHOW TABLES or mysqlshow db_name.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-tables.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-tables.html'),
 (275,'MAKEDATE',29,'Syntax:\nMAKEDATE(year,dayofyear)\n\nReturns a date, given year and day-of-year values. dayofyear must be\ngreater than 0 or the result is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT MAKEDATE(2001,31), MAKEDATE(2001,32);\n        -> \'2001-01-31\', \'2001-02-01\'\nmysql> SELECT MAKEDATE(2001,365), MAKEDATE(2004,365);\n        -> \'2001-12-31\', \'2004-12-30\'\nmysql> SELECT MAKEDATE(2001,0);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (276,'BINARY OPERATOR',34,'Syntax:\nBINARY\n\nThe BINARY operator casts the string following it to a binary string.\nThis is an easy way to force a column comparison to be done byte by\nbyte rather than character by character. This causes the comparison to\nbe case sensitive even if the column isn\'t defined as BINARY or BLOB.\nBINARY also causes trailing spaces to be significant.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/cast-functions.html\n\n','mysql> SELECT \'a\' = \'A\';\n        -> 1\nmysql> SELECT BINARY \'a\' = \'A\';\n        -> 0\nmysql> SELECT \'a\' = \'a \';\n        -> 1\nmysql> SELECT BINARY \'a\' = \'a \';\n        -> 0\n','http://dev.mysql.com/doc/refman/5.1/en/cast-functions.html'),
 (277,'MBROVERLAPS',6,'MBROverlaps(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 overlap. The term spatially overlaps is\nused if two geometries intersect and their intersection results in a\ngeometry of the same dimension but not equal to either of the given\ngeometries.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/relations-on-geometry-mbr.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/relations-on-geometry-mbr.html'),
 (278,'SOUNDEX',34,'Syntax:\nSOUNDEX(str)\n\nReturns a soundex string from str. Two strings that sound almost the\nsame should have identical soundex strings. A standard soundex string\nis four characters long, but the SOUNDEX() function returns an\narbitrarily long string. You can use SUBSTRING() on the result to get a\nstandard soundex string. All non-alphabetic characters in str are\nignored. All international alphabetic characters outside the A-Z range\nare treated as vowels.\n\n*Important*: When using SOUNDEX(), you should be aware of the following\nlimitations:\n\no This function, as currently implemented, is intended to work well\n  with strings that are in the English language only. Strings in other\n  languages may not produce reliable results.\n\no This function is not guaranteed to provide consistent results with\n  strings that use multi-byte character sets, including utf-8.\n\n  We hope to remove these limitations in a future release. See\n  Bug#22638 (http://bugs.mysql.com/22638) for more information.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT SOUNDEX(\'Hello\');\n        -> \'H400\'\nmysql> SELECT SOUNDEX(\'Quadratically\');\n        -> \'Q36324\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (279,'MBRTOUCHES',6,'MBRTouches(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 touch. Two geometries spatially touch if\nthe interiors of the geometries do not intersect, but the boundary of\none of the geometries intersects either the boundary or the interior of\nthe other.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/relations-on-geometry-mbr.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/relations-on-geometry-mbr.html'),
 (280,'DROP EVENT',37,'Syntax:\nDROP EVENT [IF EXISTS] event_name\n\nThis statement drops the event named event_name. The event immediately\nceases being active, and is deleted completely from the server.\n\nIf the event does not exist, the error ERROR 1517 (HY000): Unknown\nevent \'event_name\' results. You can override this and cause the\nstatement to fail silently by using IF EXISTS.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/drop-event.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/drop-event.html'),
 (281,'CREATE PROCEDURE',36,'Syntax:\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    PROCEDURE sp_name ([proc_parameter[,...]])\n    [characteristic ...] routine_body\n\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    FUNCTION sp_name ([func_parameter[,...]])\n    RETURNS type\n    [characteristic ...] routine_body\n    \nproc_parameter:\n    [ IN | OUT | INOUT ] param_name type\n    \nfunc_parameter:\n    param_name type\n\ntype:\n    Any valid MySQL data type\n\ncharacteristic:\n    LANGUAGE SQL\n  | [NOT] DETERMINISTIC\n  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n  | COMMENT \'string\'\n\nroutine_body:\n    Valid SQL procedure statement\n\nThese statements create stored routines. To use them, it is necessary\nto have the CREATE ROUTINE privilege. If binary logging is enabled, the\nCREATE FUNCTION statement might also require the SUPER privilege, as\ndescribed in\nhttp://dev.mysql.com/doc/refman/5.1/en/stored-procedure-logging.html.\nMySQL automatically grants the ALTER ROUTINE and EXECUTE privileges to\nthe routine creator.\n\nBy default, the routine is associated with the default database. To\nassociate the routine explicitly with a given database, specify the\nname as db_name.sp_name when you create it.\n\nIf the routine name is the same as the name of a built-in SQL function,\nyou must use a space between the name and the following parenthesis\nwhen defining the routine, or a syntax error occurs. This is also true\nwhen you invoke the routine later. For this reason, we suggest that it\nis better to avoid re-using the names of existing SQL functions for\nyour own stored routines.\n\nThe IGNORE_SPACE SQL mode applies to built-in functions, not to stored\nroutines. It is always allowable to have spaces after a routine name,\nregardless of whether IGNORE_SPACE is enabled.\n\nThe parameter list enclosed within parentheses must always be present.\nIf there are no parameters, an empty parameter list of () should be\nused.\n\nEach parameter can be declared to use any valid data type, except that\nthe COLLATE attribute cannot be used.\n\nEach parameter is an IN parameter by default. To specify otherwise for\na parameter, use the keyword OUT or INOUT before the parameter name.\n\n*Note*: Specifying a parameter as IN, OUT, or INOUT is valid only for a\nPROCEDURE. (FUNCTION parameters are always regarded as IN parameters.)\n\nAn IN parameter passes a value into a procedure. The procedure might\nmodify the value, but the modification is not visible to the caller\nwhen the procedure returns. An OUT parameter passes a value from the\nprocedure back to the caller. Its initial value is NULL within the\nprocedure, and its value is visible to the caller when the procedure\nreturns. An INOUT parameter is initialized by the caller, can be\nmodified by the procedure, and any change made by the procedure is\nvisible to the caller when the procedure returns.\n\nFor each OUT or INOUT parameter, pass a user-defined variable so that\nyou can obtain its value when the procedure returns. (For an example,\nsee [HELP CALL].) If you are calling the procedure from within another\nstored procedure or function, you can also pass a routine parameter or\nlocal routine variable as an IN or INOUT parameter.\n\nThe RETURNS clause may be specified only for a FUNCTION, for which it\nis mandatory. It indicates the return type of the function, and the\nfunction body must contain a RETURN value statement. If the RETURN\nstatement returns a value of a different type, the value is coerced to\nthe proper type. For example, if a function specifies an ENUM or SET\nvalue in the RETURNS clause, but the RETURN statement returns an\ninteger, the value returned from the function is the string for the\ncorresponding ENUM member of set of SET members.\n\nThe routine_body consists of a valid SQL procedure statement. This can\nbe a simple statement such as SELECT or INSERT, or it can be a compound\nstatement written using BEGIN and END. Compound statement syntax is\ndescribed in [HELP BEGIN END]. Compound statements can contain\ndeclarations, loops, and other control structure statements. The syntax\nfor these statements is described later in this chapter. See, for\nexample, http://dev.mysql.com/doc/refman/5.1/en/declare.html, and [HELP\nIF statement]. Some statements are not allowed in stored routines; see\nhttp://dev.mysql.com/doc/refman/5.1/en/routine-restrictions.html.\n\nMySQL stores the sql_mode system variable setting that is in effect at\nthe time a routine is created, and always executes the routine with\nthis setting in force, regardless of the current server SQL mode.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/create-procedure.html\n\n','mysql> delimiter //\n\nmysql> CREATE PROCEDURE simpleproc (OUT param1 INT)\n    -> BEGIN\n    ->   SELECT COUNT(*) INTO param1 FROM t;\n    -> END;\n    -> //\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> delimiter ;\n\nmysql> CALL simpleproc(@a);\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT @a;\n+------+\n| @a   |\n+------+\n| 3    |\n+------+\n1 row in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.1/en/create-procedure.html'),
 (282,'INSERT SELECT',25,'Syntax:\nINSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name [(col_name,...)]\n    SELECT ...\n    [ ON DUPLICATE KEY UPDATE col_name=expr, ... ]\n\nWith INSERT ... SELECT, you can quickly insert many rows into a table\nfrom one or many tables. For example:\n\nINSERT INTO tbl_temp2 (fld_id)\n  SELECT tbl_temp1.fld_order_id\n  FROM tbl_temp1 WHERE tbl_temp1.fld_order_id > 100;\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/insert-select.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/insert-select.html'),
 (283,'VARBINARY',21,'VARBINARY(M)\n\nThe VARBINARY type is similar to the VARCHAR type, but stores binary\nbyte strings rather than non-binary character strings.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html'),
 (284,'LOAD INDEX',25,'Syntax:\nLOAD INDEX INTO CACHE\n  tbl_index_list [, tbl_index_list] ...\n\ntbl_index_list:\n  tbl_name\n    [[INDEX|KEY] (index_name[, index_name] ...)]\n    [IGNORE LEAVES]\n\nThe LOAD INDEX INTO CACHE statement preloads a table index into the key\ncache to which it has been assigned by an explicit CACHE INDEX\nstatement, or into the default key cache otherwise. LOAD INDEX INTO\nCACHE is used only for MyISAM tables. It is not supported for tables\nhaving user-defined partitioning (see\nhttp://dev.mysql.com/doc/refman/5.1/en/partitioning-limitations.html.)\n\nThe IGNORE LEAVES modifier causes only blocks for the non-leaf nodes of\nthe index to be preloaded.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/load-index.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/load-index.html'),
 (285,'UNION',25,'Syntax:\nSELECT ...\nUNION [ALL | DISTINCT] SELECT ...\n[UNION [ALL | DISTINCT] SELECT ...]\n\nUNION is used to combine the result from multiple SELECT statements\ninto a single result set.\n\nThe column names from the first SELECT statement are used as the column\nnames for the results returned. Selected columns listed in\ncorresponding positions of each SELECT statement should have the same\ndata type. (For example, the first column selected by the first\nstatement should have the same type as the first column selected by the\nother statements.)\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/union.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/union.html'),
 (286,'TO_DAYS',29,'Syntax:\nTO_DAYS(date)\n\nGiven a date date, returns a day number (the number of days since year\n0).\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT TO_DAYS(950501);\n        -> 728779\nmysql> SELECT TO_DAYS(\'1997-10-07\');\n        -> 729669\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (287,'NOT REGEXP',34,'Syntax:\nexpr NOT REGEXP pat, expr NOT RLIKE pat\n\nThis is the same as NOT (expr REGEXP pat).\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-comparison-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-comparison-functions.html'),
 (288,'SHOW INDEX',25,'Syntax:\nSHOW INDEX FROM tbl_name [FROM db_name]\n\nSHOW INDEX returns table index information. The format resembles that\nof the SQLStatistics call in ODBC.\nYou can use db_name.tbl_name as an alternative to the tbl_name FROM\ndb_name syntax. These two statements are equivalent:\n\nSHOW INDEX FROM mytable FROM mydb;\nSHOW INDEX FROM mydb.mytable;\n\nSHOW KEYS is a synonym for SHOW INDEX. You can also list a table\'s\nindexes with the mysqlshow -k db_name tbl_name command.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-index.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-index.html'),
 (289,'SHOW CREATE DATABASE',25,'Syntax:\nSHOW CREATE {DATABASE | SCHEMA} db_name\n\nShows the CREATE DATABASE statement that creates the given database.\nSHOW CREATE SCHEMA is a synonym for SHOW CREATE DATABASE.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-create-database.html\n\n','mysql> SHOW CREATE DATABASE test\\G\n*************************** 1. row ***************************\n       Database: test\nCreate Database: CREATE DATABASE `test`\n                 /*!40100 DEFAULT CHARACTER SET latin1 */\n\nmysql> SHOW CREATE SCHEMA test\\G\n*************************** 1. row ***************************\n       Database: test\nCreate Database: CREATE DATABASE `test`\n                 /*!40100 DEFAULT CHARACTER SET latin1 */\n','http://dev.mysql.com/doc/refman/5.1/en/show-create-database.html'),
 (290,'LEAVE',36,'Syntax:\nLEAVE label\n\nThis statement is used to exit any labeled flow control construct. It\ncan be used within BEGIN ... END or loop constructs (LOOP, REPEAT,\nWHILE).\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/leave-statement.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/leave-statement.html'),
 (291,'NOT IN',18,'Syntax:\nexpr NOT IN (value,...)\n\nThis is the same as NOT (expr IN (value,...)).\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html'),
 (292,'!',13,'Syntax:\nNOT, !\n\nLogical NOT. Evaluates to 1 if the operand is 0, to 0 if the operand is\nnon-zero, and NOT NULL returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/logical-operators.html\n\n','mysql> SELECT NOT 10;\n        -> 0\nmysql> SELECT NOT 0;\n        -> 1\nmysql> SELECT NOT NULL;\n        -> NULL\nmysql> SELECT ! (1+1);\n        -> 0\nmysql> SELECT ! 1+1;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.1/en/logical-operators.html'),
 (293,'DECLARE HANDLER',36,'Syntax:\nDECLARE handler_type HANDLER FOR condition_value[,...] statement\n\nhandler_type:\n    CONTINUE\n  | EXIT\n  | UNDO\n\ncondition_value:\n    SQLSTATE [VALUE] sqlstate_value\n  | condition_name\n  | SQLWARNING\n  | NOT FOUND\n  | SQLEXCEPTION\n  | mysql_error_code\n\nThe DECLARE ... HANDLER statement specifies handlers that each may deal\nwith one or more conditions. If one of these conditions occurs, the\nspecified statement is executed. statement can be a simple statement\n(for example, SET var_name = value), or it can be a compound statement\nwritten using BEGIN and END (see [HELP BEGIN END]).\n\nFor a CONTINUE handler, execution of the current routine continues\nafter execution of the handler statement. For an EXIT handler,\nexecution terminates for the BEGIN ... END compound statement in which\nthe handler is declared. (This is true even if the condition occurs in\nan inner block.) The UNDO handler type statement is not yet supported.\n\nIf a condition occurs for which no handler has been declared, the\ndefault action is EXIT.\n\nA condition_value can be any of the following values:\n\no An SQLSTATE value or a MySQL error code.\n\no A condition name previously specified with DECLARE ... CONDITION. See\n  [HELP DECLARE CONDITION].\n\no SQLWARNING is shorthand for all SQLSTATE codes that begin with 01.\n\no NOT FOUND is shorthand for all SQLSTATE codes that begin with 02.\n\no SQLEXCEPTION is shorthand for all SQLSTATE codes not caught by\n  SQLWARNING or NOT FOUND.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/declare-handlers.html\n\n','mysql> CREATE TABLE test.t (s1 int,primary key (s1));\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> delimiter //\n\nmysql> CREATE PROCEDURE handlerdemo ()\n    -> BEGIN\n    ->   DECLARE CONTINUE HANDLER FOR SQLSTATE \'23000\' SET @x2 = 1;\n    ->   SET @x = 1;\n    ->   INSERT INTO test.t VALUES (1);\n    ->   SET @x = 2;\n    ->   INSERT INTO test.t VALUES (1);\n    ->   SET @x = 3;\n    -> END;\n    -> //\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> CALL handlerdemo()//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT @x//\n    +------+\n    | @x   |\n    +------+\n    | 3    |\n    +------+\n    1 row in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.1/en/declare-handlers.html'),
 (294,'DOUBLE',21,'DOUBLE[(M,D)] [UNSIGNED] [ZEROFILL]\n\nA normal-size (double-precision) floating-point number. Allowable\nvalues are -1.7976931348623157E+308 to -2.2250738585072014E-308, 0, and\n2.2250738585072014E-308 to 1.7976931348623157E+308. These are the\ntheoretical limits, based on the IEEE standard. The actual range might\nbe slightly smaller depending on your hardware or operating system.\n\nM is the total number of digits and D is the number of digits following\nthe decimal point. If M and D are omitted, values are stored to the\nlimits allowed by the hardware. A double-precision floating-point\nnumber is accurate to approximately 15 decimal places.\n\nUNSIGNED, if specified, disallows negative values.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html'),
 (295,'TIME',21,'TIME\n\nA time. The range is \'-838:59:59\' to \'838:59:59\'. MySQL displays TIME\nvalues in \'HH:MM:SS\' format, but allows assignment of values to TIME\ncolumns using either strings or numbers.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-type-overview.html'),
 (296,'&&',13,'Syntax:\nAND, &&\n\nLogical AND. Evaluates to 1 if all operands are non-zero and not NULL,\nto 0 if one or more operands are 0, otherwise NULL is returned.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/logical-operators.html\n\n','mysql> SELECT 1 && 1;\n        -> 1\nmysql> SELECT 1 && 0;\n        -> 0\nmysql> SELECT 1 && NULL;\n        -> NULL\nmysql> SELECT 0 && NULL;\n        -> 0\nmysql> SELECT NULL && 0;\n        -> 0\n','http://dev.mysql.com/doc/refman/5.1/en/logical-operators.html'),
 (297,'X',10,'X(p)\n\nReturns the X-coordinate value for the point p as a double-precision\nnumber.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/point-property-functions.html\n\n','mysql> SET @pt = \'Point(56.7 53.34)\';\nmysql> SELECT X(GeomFromText(@pt));\n+----------------------+\n| X(GeomFromText(@pt)) |\n+----------------------+\n|                 56.7 |\n+----------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/point-property-functions.html'),
 (298,'FOUND_ROWS',16,'Syntax:\nFOUND_ROWS()\n\nA SELECT statement may include a LIMIT clause to restrict the number of\nrows the server returns to the client. In some cases, it is desirable\nto know how many rows the statement would have returned without the\nLIMIT, but without running the statement again. To obtain this row\ncount, include a SQL_CALC_FOUND_ROWS option in the SELECT statement,\nand then invoke FOUND_ROWS() afterward:\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/information-functions.html\n\n','mysql> SELECT SQL_CALC_FOUND_ROWS * FROM tbl_name\n    -> WHERE id > 100 LIMIT 10;\nmysql> SELECT FOUND_ROWS();\n','http://dev.mysql.com/doc/refman/5.1/en/information-functions.html'),
 (299,'SYSTEM_USER',16,'Syntax:\nSYSTEM_USER()\n\nSYSTEM_USER() is a synonym for USER().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/information-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/information-functions.html'),
 (300,'CROSSES',27,'Crosses(g1,g2)\n\nReturns 1 if g1 spatially crosses g2. Returns NULL if g1 is a Polygon\nor a MultiPolygon, or if g2 is a Point or a MultiPoint. Otherwise,\nreturns 0.\n\nThe term spatially crosses denotes a spatial relation between two given\ngeometries that has the following properties:\n\no The two geometries intersect\n\no Their intersection results in a geometry that has a dimension that is\n  one less than the maximum dimension of the two given geometries\n\no Their intersection is not equal to either of the two given geometries\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/functions-that-test-spatial-relationships-between-geometries.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/functions-that-test-spatial-relationships-between-geometries.html'),
 (301,'TRUNCATE TABLE',25,'Syntax:\nTRUNCATE [TABLE] tbl_name\n\nTRUNCATE TABLE empties a table completely. Logically, this is\nequivalent to a DELETE statement that deletes all rows, but there are\npractical differences under some circumstances.\n\nFor InnoDB tables, TRUNCATE TABLE is mapped to DELETE if there are\nforeign key constraints that reference the table; otherwise fast\ntruncation (dropping and re-creating the table) is used. The\nAUTO_INCREMENT counter is reset by TRUNCATE TABLE, regardless of\nwhether there is a foreign key constraint.\n\nFor other storage engines, TRUNCATE TABLE differs from DELETE in the\nfollowing ways in MySQL 5.1:\n\no Truncate operations drop and re-create the table, which is much\n  faster than deleting rows one by one.\n\no Truncate operations are not transaction-safe; an error occurs when\n  attempting one in the course of an active transaction or active table\n  lock.\n\no The number of deleted rows is not returned.\n\no As long as the table format file tbl_name.frm is valid, the table can\n  be re-created as an empty table with TRUNCATE TABLE, even if the data\n  or index files have become corrupted.\n\no The table handler does not remember the last used AUTO_INCREMENT\n  value, but starts counting from the beginning. This is true even for\n  MyISAM and InnoDB, which normally do not reuse sequence values.\n\no When used with partitioned tables, TRUNCATE TABLE preserves the\n  partitioning; that is, the data and index files are dropped and\n  re-created, while the partition definitions (.par) file is\n  unaffected.\n\no Since truncation of a table does not make any use of DELETE, the\n  TRUNCATE statement does not invoke ON DELETE triggers.\n\nTRUNCATE TABLE requires the DROP privilege as of MySQL 5.1.16. (Before\n5.1.16, it requires the DELETE privilege.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/truncate.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/truncate.html'),
 (302,'BIT_XOR',15,'Syntax:\nBIT_XOR(expr)\n\nReturns the bitwise XOR of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html'),
 (303,'CURRENT_DATE',29,'Syntax:\nCURRENT_DATE, CURRENT_DATE()\n\nCURRENT_DATE and CURRENT_DATE() are synonyms for CURDATE().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (304,'AREA',2,'Area(poly)\n\nReturns as a double-precision number the area of the Polygon value\npoly, as measured in its spatial reference system.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/polygon-property-functions.html\n\n','mysql> SET @poly = \'Polygon((0 0,0 3,3 0,0 0),(1 1,1 2,2 1,1 1))\';\nmysql> SELECT Area(GeomFromText(@poly));\n+---------------------------+\n| Area(GeomFromText(@poly)) |\n+---------------------------+\n|                         4 |\n+---------------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/polygon-property-functions.html'),
 (305,'START SLAVE',25,'Syntax:\nSTART SLAVE [thread_type [, thread_type] ... ]\nSTART SLAVE [SQL_THREAD] UNTIL\n    MASTER_LOG_FILE = \'log_name\', MASTER_LOG_POS = log_pos\nSTART SLAVE [SQL_THREAD] UNTIL\n    RELAY_LOG_FILE = \'log_name\', RELAY_LOG_POS = log_pos\n\nthread_type: IO_THREAD | SQL_THREAD\n\nSTART SLAVE with no thread_type options starts both of the slave\nthreads. The I/O thread reads queries from the master server and stores\nthem in the relay log. The SQL thread reads the relay log and executes\nthe queries. START SLAVE requires the SUPER privilege.\n\nIf START SLAVE succeeds in starting the slave threads, it returns\nwithout any error. However, even in that case, it might be that the\nslave threads start and then later stop (for example, because they do\nnot manage to connect to the master or read its binary logs, or some\nother problem). START SLAVE does not warn you about this. You must\ncheck the slave\'s error log for error messages generated by the slave\nthreads, or check that they are running satisfactorily with SHOW SLAVE\nSTATUS.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/start-slave.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/start-slave.html'),
 (306,'BEGIN END',36,'Syntax:\n[begin_label:] BEGIN\n    [statement_list]\nEND [end_label]\n\nBEGIN ... END syntax is used for writing compound statements, which can\nappear within stored routines and triggers. A compound statement can\ncontain multiple statements, enclosed by the BEGIN and END keywords.\nstatement_list represents a list of one or more statements. Each\nstatement within statement_list must be terminated by a semicolon (;)\nstatement delimiter. Note that statement_list is optional, which means\nthat the empty compound statement (BEGIN END) is legal.\n\nUse of multiple statements requires that a client is able to send\nstatement strings containing the ; statement delimiter. This is handled\nin the mysql command-line client with the delimiter command. Changing\nthe ; end-of-statement delimiter (for example, to //) allows ; to be\nused in a routine body. For an example, see [HELP CREATE PROCEDURE].\n\nA compound statement can be labeled. end_label cannot be given unless\nbegin_label also is present. If both are present, they must be the\nsame.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/begin-end.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/begin-end.html'),
 (307,'FLUSH',25,'Syntax:\nFLUSH [LOCAL | NO_WRITE_TO_BINLOG]\n    flush_option [, flush_option] ...\n\nThe FLUSH statement clears or reloads various internal caches used by\nMySQL. To execute FLUSH, you must have the RELOAD privilege.\n\nThe RESET statement is similar to FLUSH. See [HELP RESET].\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/flush.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/flush.html'),
 (308,'SHOW PROCEDURE STATUS',25,'Syntax:\nSHOW {PROCEDURE | FUNCTION} STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nThese statements are MySQL extensions. They return characteristics of\nroutines, such as the database, name, type, creator, creation and\nmodification dates, and character set information. The LIKE clause, if\npresent, indicates which procedure or function names to match. The\nWHERE clause can be given to select rows using more general conditions,\nas discussed in\nhttp://dev.mysql.com/doc/refman/5.1/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-procedure-status.html\n\n','mysql> SHOW FUNCTION STATUS LIKE \'hello\'\\G\n*************************** 1. row ***************************\n                  Db: test\n                Name: hello\n                Type: FUNCTION\n             Definer: testuser@localhost\n            Modified: 2004-08-03 15:29:37\n             Created: 2004-08-03 15:29:37\n       Security_type: DEFINER\n             Comment:\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n','http://dev.mysql.com/doc/refman/5.1/en/show-procedure-status.html'),
 (309,'SHOW WARNINGS',25,'Syntax:\nSHOW WARNINGS [LIMIT [offset,] row_count]\nSHOW COUNT(*) WARNINGS\n\nSHOW WARNINGS shows the error, warning, and note messages that resulted\nfrom the last statement that generated messages, or nothing if the last\nstatement that used a table generated no messages. A related statement,\nSHOW ERRORS, shows only the errors. See [HELP SHOW ERRORS].\n\nThe list of messages is reset for each new statement that uses a table.\n\nThe SHOW COUNT(*) WARNINGS statement displays the total number of\nerrors, warnings, and notes. You can also retrieve this number from the\nwarning_count variable:\n\nSHOW COUNT(*) WARNINGS;\nSELECT @@warning_count;\n\nThe value of warning_count might be greater than the number of messages\ndisplayed by SHOW WARNINGS if the max_error_count system variable is\nset so low that not all messages are stored. An example shown later in\nthis section demonstrates how this can happen.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\n[HELP SELECT].\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-warnings.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-warnings.html'),
 (310,'DESCRIBE',26,'Syntax:\n{DESCRIBE | DESC} tbl_name [col_name | wild]\n\nDESCRIBE provides information about the columns in a table. It is a\nshortcut for SHOW COLUMNS FROM. These statements also display\ninformation for views. (See [HELP SHOW COLUMNS].)\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/describe.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/describe.html'),
 (311,'DROP USER',9,'Syntax:\nDROP USER user [, user] ...\n\nThe DROP USER statement removes one or more MySQL accounts. It removes\nprivilege rows for the account from all grant tables. To use this\nstatement, you must have the global CREATE USER privilege or the DELETE\nprivilege for the mysql database. Each account is named using the same\nformat as for the GRANT statement; for example, \'jeffrey\'@\'localhost\'.\nIf you specify only the username part of the account name, a hostname\npart of \'%\' is used. For additional information about specifying\naccount names, see [HELP GRANT].\n\nWith DROP USER, you can remove an account and its privileges as\nfollows:\n\nDROP USER user;\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/drop-user.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/drop-user.html'),
 (312,'STDDEV_POP',15,'Syntax:\nSTDDEV_POP(expr)\n\nReturns the population standard deviation of expr (the square root of\nVAR_POP()). You can also use STD() or STDDEV(), which are equivalent\nbut not standard SQL.\n\nSTDDEV_POP() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html'),
 (313,'SHOW CHARACTER SET',25,'Syntax:\nSHOW CHARACTER SET\n    [LIKE \'pattern\' | WHERE expr]\n\nThe SHOW CHARACTER SET statement shows all available character sets.\nThe LIKE clause, if present, indicates which character set names to\nmatch. The WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.1/en/extended-show.html. For example:\n\nmysql> SHOW CHARACTER SET LIKE \'latin%\';\n+---------+-----------------------------+-------------------+--------+\n| Charset | Description                 | Default collation | Maxlen |\n+---------+-----------------------------+-------------------+--------+\n| latin1  | cp1252 West European        | latin1_swedish_ci |      1 |\n| latin2  | ISO 8859-2 Central European | latin2_general_ci |      1 |\n| latin5  | ISO 8859-9 Turkish          | latin5_turkish_ci |      1 |\n| latin7  | ISO 8859-13 Baltic          | latin7_general_ci |      1 |\n+---------+-----------------------------+-------------------+--------+\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-character-set.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-character-set.html'),
 (314,'SUBSTRING',34,'Syntax:\nSUBSTRING(str,pos), SUBSTRING(str FROM pos), SUBSTRING(str,pos,len),\nSUBSTRING(str FROM pos FOR len)\n\nThe forms without a len argument return a substring from string str\nstarting at position pos. The forms with a len argument return a\nsubstring len characters long from string str, starting at position\npos. The forms that use FROM are standard SQL syntax. It is also\npossible to use a negative value for pos. In this case, the beginning\nof the substring is pos characters from the end of the string, rather\nthan the beginning. A negative value may be used for pos in any of the\nforms of this function.\n\nFor all forms of SUBSTRING(), the position of the first character in\nthe string from which the substring is to be extracted is reckoned as\n1.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT SUBSTRING(\'Quadratically\',5);\n        -> \'ratically\'\nmysql> SELECT SUBSTRING(\'foobarbar\' FROM 4);\n        -> \'barbar\'\nmysql> SELECT SUBSTRING(\'Quadratically\',5,6);\n        -> \'ratica\'        \nmysql> SELECT SUBSTRING(\'Sakila\', -3);\n        -> \'ila\'        \nmysql> SELECT SUBSTRING(\'Sakila\', -5, 3);\n        -> \'aki\'\nmysql> SELECT SUBSTRING(\'Sakila\' FROM -4 FOR 2);\n        -> \'ki\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (315,'ISEMPTY',33,'IsEmpty(g)\n\nReturns 1 if the geometry value g is the empty geometry, 0 if it is not\nempty, and -1 if the argument is NULL. If the geometry is empty, it\nrepresents the empty point set.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/general-geometry-property-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/general-geometry-property-functions.html'),
 (316,'LTRIM',34,'Syntax:\nLTRIM(str)\n\nReturns the string str with leading space characters removed.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT LTRIM(\'  barbar\');\n        -> \'barbar\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (317,'INTERSECTS',27,'Intersects(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially intersects g2.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/functions-that-test-spatial-relationships-between-geometries.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/functions-that-test-spatial-relationships-between-geometries.html'),
 (318,'CALL',36,'Syntax:\nCALL sp_name([parameter[,...]])\nCALL sp_name[()]\n\nThe CALL statement invokes a procedure that was defined previously with\nCREATE PROCEDURE.\n\nCALL can pass back values to its caller using parameters that are\ndeclared as OUT or INOUT parameters. It also \"returns\" the number of\nrows affected, which a client program can obtain at the SQL level by\ncalling the ROW_COUNT() function and from C by calling the\nmysql_affected_rows() C API function.\n\nAs of MySQL 5.1.13, stored procedures that take no arguments now can be\ninvoked without parentheses. That is, CALL p() and CALL p are\nequivalent.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/call.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/call.html'),
 (319,'MBRDISJOINT',6,'MBRDisjoint(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 are disjoint (do not intersect).\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/relations-on-geometry-mbr.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/relations-on-geometry-mbr.html'),
 (320,'VALUES',14,'Syntax:\nVALUES(col_name)\n\nIn an INSERT ... ON DUPLICATE KEY UPDATE statement, you can use the\nVALUES(col_name) function in the UPDATE clause to refer to column\nvalues from the INSERT portion of the statement. In other words,\nVALUES(col_name) in the UPDATE clause refers to the value of col_name\nthat would be inserted, had no duplicate-key conflict occurred. This\nfunction is especially useful in multiple-row inserts. The VALUES()\nfunction is meaningful only in INSERT ... ON DUPLICATE KEY UPDATE\nstatements and returns NULL otherwise.\nhttp://dev.mysql.com/doc/refman/5.1/en/insert-on-duplicate.html.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html\n\n','mysql> INSERT INTO table (a,b,c) VALUES (1,2,3),(4,5,6)\n    -> ON DUPLICATE KEY UPDATE c=VALUES(a)+VALUES(b);\n','http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html'),
 (321,'SUBSTRING_INDEX',34,'Syntax:\nSUBSTRING_INDEX(str,delim,count)\n\nReturns the substring from string str before count occurrences of the\ndelimiter delim. If count is positive, everything to the left of the\nfinal delimiter (counting from the left) is returned. If count is\nnegative, everything to the right of the final delimiter (counting from\nthe right) is returned. SUBSTRING_INDEX() performs a case-sensitive\nmatch when searching for delim.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT SUBSTRING_INDEX(\'www.mysql.com\', \'.\', 2);\n        -> \'www.mysql\'\nmysql> SELECT SUBSTRING_INDEX(\'www.mysql.com\', \'.\', -2);\n        -> \'mysql.com\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (322,'ENCODE',11,'Syntax:\nENCODE(str,pass_str)\n\nEncrypt str using pass_str as the password. To decrypt the result, use\nDECODE().\n\nThe result is a binary string of the same length as str.\n\nThe strength of the encryption is based on how good the random\ngenerator is. It should suffice for short strings.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html'),
 (323,'LOOP',36,'Syntax:\n[begin_label:] LOOP\n    statement_list\nEND LOOP [end_label]\n\nLOOP implements a simple loop construct, enabling repeated execution of\nthe statement list, which consists of one or more statements. The\nstatements within the loop are repeated until the loop is exited;\nusually this is accomplished with a LEAVE statement.\n\nA LOOP statement can be labeled. end_label cannot be given unless\nbegin_label also is present. If both are present, they must be the\nsame.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/loop-statement.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/loop-statement.html'),
 (324,'TRUNCATE',4,'Syntax:\nTRUNCATE(X,D)\n\nReturns the number X, truncated to D decimal places. If D is 0, the\nresult has no decimal point or fractional part. D can be negative to\ncause D digits left of the decimal point of the value X to become zero.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT TRUNCATE(1.223,1);\n        -> 1.2\nmysql> SELECT TRUNCATE(1.999,1);\n        -> 1.9\nmysql> SELECT TRUNCATE(1.999,0);\n        -> 1\nmysql> SELECT TRUNCATE(-1.999,1);\n        -> -1.9\nmysql> SELECT TRUNCATE(122,-2);\n       -> 100\nmysql> SELECT TRUNCATE(10.28*100,0);\n       -> 1028\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (325,'TIMESTAMPADD',29,'Syntax:\nTIMESTAMPADD(unit,interval,datetime_expr)\n\nAdds the integer expression interval to the date or datetime expression\ndatetime_expr. The unit for interval is given by the unit argument,\nwhich should be one of the following values: FRAC_SECOND, SECOND,\nMINUTE, HOUR, DAY, WEEK, MONTH, QUARTER, or YEAR.\n\nThe unit value may be specified using one of keywords as shown, or with\na prefix of SQL_TSI_. For example, DAY and SQL_TSI_DAY both are legal.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT TIMESTAMPADD(MINUTE,1,\'2003-01-02\');\n        -> \'2003-01-02 00:01:00\'\nmysql> SELECT TIMESTAMPADD(WEEK,1,\'2003-01-02\');\n        -> \'2003-01-09\'\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (326,'SHOW',25,'SHOW has many forms that provide information about databases, tables,\ncolumns, or status information about the server. This section describes\nthose following:\n\nSHOW AUTHORS\nSHOW CHARACTER SET [like_or_where]\n[like_or_where]\nSHOW COLLATION [like_or_where]\nSHOW [FULL] COLUMNS FROM tbl_name [FROM db_name] [like_or_where]\nSHOW CONTRIBUTORS\nSHOW CREATE DATABASE db_name\nSHOW CREATE EVENT event_name\nSHOW CREATE FUNCTION funcname\nSHOW CREATE PROCEDURE procname\nSHOW CREATE TABLE tbl_name\nSHOW CREATE TRIGGER trigger_name\nSHOW CREATE VIEW view_name\nSHOW DATABASES [like_or_where]\nSHOW ENGINE engine_name {STATUS | MUTEX}\nSHOW [STORAGE] ENGINES\nSHOW ERRORS [LIMIT [offset,] row_count]\nSHOW [FULL] EVENTS\nSHOW FUNCTION CODE sp_name\nSHOW FUNCTION STATUS [like_or_where]\nSHOW GRANTS FOR user\nSHOW INDEX FROM tbl_name [FROM db_name]\nSHOW INNODB STATUS\nSHOW OPEN TABLES [FROM db_name] [like_or_where]\nSHOW PROCEDURE CODE sp_name\nSHOW PROCEDURE STATUS [like_or_where]\nSHOW PLUGINS\nSHOW PRIVILEGES\nSHOW [FULL] PROCESSLIST\nSHOW SCHEDULER STATUS\nSHOW [GLOBAL | SESSION] STATUS [like_or_where]\nSHOW TABLE STATUS [FROM db_name] [like_or_where]\nSHOW TABLES [FROM db_name] [like_or_where]\nSHOW TRIGGERS [FROM db_name] [like_or_where]\nSHOW [GLOBAL | SESSION] VARIABLES [like_or_where]\nSHOW WARNINGS [LIMIT [offset,] row_count]\n\nlike_or_where:\n    LIKE \'pattern\'\n  | WHERE expr\n\nThe SHOW statement also has forms that provide information about\nreplication master and slave servers and are described in [HELP PURGE\nMASTER LOGS]:\n\nSHOW BINARY LOGS\nSHOW BINLOG EVENTS\nSHOW MASTER STATUS\nSHOW SLAVE HOSTS\nSHOW SLAVE STATUS\n\nIf the syntax for a given SHOW statement includes a LIKE \'pattern\'\npart, \'pattern\' is a string that can contain the SQL `%\' and `_\'\nwildcard characters. The pattern is useful for restricting statement\noutput to matching values.\n\nSeveral SHOW statements also accept a WHERE clause that provides more\nflexibility in specifying which rows to display. See\nhttp://dev.mysql.com/doc/refman/5.1/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show.html'),
 (327,'GREATEST',18,'Syntax:\nGREATEST(value1,value2,...)\n\nWith two or more arguments, returns the largest (maximum-valued)\nargument. The arguments are compared using the same rules as for\nLEAST().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html\n\n','mysql> SELECT GREATEST(2,0);\n        -> 2\nmysql> SELECT GREATEST(34.0,3.0,5.0,767.0);\n        -> 767.0\nmysql> SELECT GREATEST(\'B\',\'A\',\'C\');\n        -> \'C\'\n','http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html'),
 (328,'SHOW VARIABLES',25,'Syntax:\nSHOW [GLOBAL | SESSION] VARIABLES\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW VARIABLES shows the values of MySQL system variables. This\ninformation also can be obtained using the mysqladmin variables\ncommand. The LIKE clause, if present, indicates which variable names to\nmatch. The WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.1/en/extended-show.html.\n\nWith the GLOBAL modifier, SHOW VARIABLES displays the values that are\nused for new connections to MySQL. With SESSION, it displays the values\nthat are in effect for the current connection. If no modifier is\npresent, the default is SESSION. LOCAL is a synonym for SESSION.\nWith a LIKE clause, the statement displays only rows for those\nvariables with names that match the pattern. To obtain the row for a\nspecific variable, use a LIKE clause as shown:\n\nSHOW VARIABLES LIKE \'max_join_size\';\nSHOW SESSION VARIABLES LIKE \'max_join_size\';\n\nTo get a list of variables whose name match a pattern, use the `%\'\nwildcard character in a LIKE clause:\n\nSHOW VARIABLES LIKE \'%size%\';\nSHOW GLOBAL VARIABLES LIKE \'%size%\';\n\nWildcard characters can be used in any position within the pattern to\nbe matched. Strictly speaking, because `_\' is a wildcard that matches\nany single character, you should escape it as `\\_\' to match it\nliterally. In practice, this is rarely necessary.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-variables.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-variables.html'),
 (329,'BIT_AND',15,'Syntax:\nBIT_AND(expr)\n\nReturns the bitwise AND of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html'),
 (330,'SECOND',29,'Syntax:\nSECOND(time)\n\nReturns the second for time, in the range 0 to 59.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT SECOND(\'10:05:03\');\n        -> 3\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (331,'ATAN2',4,'Syntax:\nATAN(Y,X), ATAN2(Y,X)\n\nReturns the arc tangent of the two variables X and Y. It is similar to\ncalculating the arc tangent of Y / X, except that the signs of both\narguments are used to determine the quadrant of the result.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT ATAN(-2,2);\n        -> -0.78539816339745\nmysql> SELECT ATAN2(PI(),0);\n        -> 1.5707963267949\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (332,'MBRCONTAINS',6,'MBRContains(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangle of g1\ncontains the Minimum Bounding Rectangle of g2. This tests the opposite\nrelationship as MBRWithin().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/relations-on-geometry-mbr.html\n\n','mysql> SET @g1 = GeomFromText(\'Polygon((0 0,0 3,3 3,3 0,0 0))\');\nmysql> SET @g2 = GeomFromText(\'Point(1 1)\');\nmysql> SELECT MBRContains(@g1,@g2), MBRContains(@g2,@g1);\n----------------------+----------------------+\n| MBRContains(@g1,@g2) | MBRContains(@g2,@g1) |\n+----------------------+----------------------+\n|                    1 |                    0 |\n+----------------------+----------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/relations-on-geometry-mbr.html'),
 (333,'HOUR',29,'Syntax:\nHOUR(time)\n\nReturns the hour for time. The range of the return value is 0 to 23 for\ntime-of-day values. However, the range of TIME values actually is much\nlarger, so HOUR can return values greater than 23.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT HOUR(\'10:05:03\');\n        -> 10\nmysql> SELECT HOUR(\'272:59:59\');\n        -> 272\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (334,'SELECT',25,'Syntax:\nSELECT\n    [ALL | DISTINCT | DISTINCTROW ]\n      [HIGH_PRIORITY]\n      [STRAIGHT_JOIN]\n      [SQL_SMALL_RESULT] [SQL_BIG_RESULT] [SQL_BUFFER_RESULT]\n      [SQL_CACHE | SQL_NO_CACHE] [SQL_CALC_FOUND_ROWS]\n    select_expr, ...\n    [FROM table_references\n    [WHERE where_condition]\n    [GROUP BY {col_name | expr | position}\n      [ASC | DESC], ... [WITH ROLLUP]]\n    [HAVING where_condition]\n    [ORDER BY {col_name | expr | position}\n      [ASC | DESC], ...]\n    [LIMIT {[offset,] row_count | row_count OFFSET offset}]\n    [PROCEDURE procedure_name(argument_list)]\n    [INTO OUTFILE \'file_name\' export_options\n      | INTO DUMPFILE \'file_name\'\n      | INTO var_name [, var_name]]\n    [FOR UPDATE | LOCK IN SHARE MODE]]\n\nSELECT is used to retrieve rows selected from one or more tables, and\ncan include UNION statements and subqueries. See [HELP UNION], and\nhttp://dev.mysql.com/doc/refman/5.1/en/subqueries.html.\n\nThe most commonly used clauses of SELECT statements are these:\n\no Each select_expr indicates a column that you want to retrieve. There\n  must be at least one select_expr.\n\no table_references indicates the table or tables from which to retrieve\n  rows. Its syntax is described in [HELP JOIN].\n\no The WHERE clause, if given, indicates the condition or conditions\n  that rows must satisfy to be selected. where_condition is an\n  expression that evaluates to true for each row to be selected. The\n  statement selects all rows if there is no WHERE clause.\n\n  In the WHERE clause, you can use any of the functions and operators\n  that MySQL supports, except for aggregate (summary) functions. See\n  [HELP =].\n\nSELECT can also be used to retrieve rows computed without reference to\nany table.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/select.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/select.html'),
 (335,'COT',4,'Syntax:\nCOT(X)\n\nReturns the cotangent of X.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT COT(12);\n        -> -1.5726734063977\nmysql> SELECT COT(0);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (336,'SHOW CREATE EVENT',25,'Syntax:\nSHOW CREATE EVENT event_name\n\nThis statement displays the CREATE EVENT statement needed to re-create\na given event. For example (using the same event e_daily defined and\nthen altered in\nhttp://dev.mysql.com/doc/refman/5.1/en/show-events.html):\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-create-event.html\n\n','mysql> SHOW CREATE EVENT test.e_daily\\G\n\n*************************** 1. row ***************************\n               Event: e_daily\n        Create Event: CREATE EVENT e_daily\n                        ON SCHEDULE EVERY 1 DAY\n                        STARTS CURRENT_TIMESTAMP + INTERVAL 6 HOUR\n                        ENABLE\n                        COMMENT \'Saves total number of sessions and\n                                 clears the table once per day.\'\n                        DO\n                          BEGIN\n                            INSERT INTO site_activity.totals (when, total)\n                              SELECT CURRENT_TIMESTAMP, COUNT(*) \n                              FROM site_activity.sessions;\n                            DELETE FROM site_activity.sessions;\n                          END\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n','http://dev.mysql.com/doc/refman/5.1/en/show-create-event.html'),
 (337,'BACKUP TABLE',20,'Syntax:\nBACKUP TABLE tbl_name [, tbl_name] ... TO \'/path/to/backup/directory\'\n\n*Note*: This statement is deprecated. We are working on a better\nreplacement for it that will provide online backup capabilities. In the\nmeantime, the mysqlhotcopy script can be used instead.\n\nBACKUP TABLE copies to the backup directory the minimum number of table\nfiles needed to restore the table, after flushing any buffered changes\nto disk. The statement works only for MyISAM tables. It copies the .frm\ndefinition and .MYD data files. The .MYI index file can be rebuilt from\nthose two files. The directory should be specified as a full pathname.\nTo restore the table, use RESTORE TABLE.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/backup-table.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/backup-table.html'),
 (338,'LOAD_FILE',34,'Syntax:\nLOAD_FILE(file_name)\n\nReads the file and returns the file contents as a string. To use this\nfunction, the file must be located on the server host, you must specify\nthe full pathname to the file, and you must have the FILE privilege.\nThe file must be readable by all and its size less than\nmax_allowed_packet bytes.\n\nIf the file does not exist or cannot be read because one of the\npreceding conditions is not satisfied, the function returns NULL.\n\nAs of MySQL 5.1.6, the character_set_filesystem system variable\ncontrols interpretation of filenames that are given as literal strings.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> UPDATE t\n            SET blob_col=LOAD_FILE(\'/tmp/picture\')\n            WHERE id=1;\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (339,'POINTFROMTEXT',3,'PointFromText(wkt[,srid])\n\nConstructs a POINT value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-wkt-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-wkt-functions.html'),
 (340,'LOAD TABLE FROM MASTER',25,'Syntax:\nLOAD TABLE tbl_name FROM MASTER\n\nThis feature is deprecated. We recommend not using it anymore. It is\nsubject to removal in a future version of MySQL.\n\nSince the current implementation of LOAD DATA FROM MASTER and LOAD\nTABLE FROM MASTER is very limited, these statements are deprecated in\nversions 4.1 of MySQL and above. We will introduce a more advanced\ntechnique (called \"online backup\") in a future version. That technique\nwill have the additional advantage of working with more storage\nengines.\n\nFor MySQL 5.1 and earlier, the recommended alternative solution to\nusing LOAD DATA FROM MASTER or LOAD TABLE FROM MASTER is using\nmysqldump or mysqlhotcopy. The latter requires Perl and two Perl\nmodules (DBI and DBD:mysql) and works for MyISAM and ARCHIVE tables\nonly. With mysqldump, you can create SQL dumps on the master and pipe\n(or copy) these to a mysql client on the slave. This has the advantage\nof working for all storage engines, but can be quite slow, since it\nworks using SELECT.\n\nTransfers a copy of the table from the master to the slave. This\nstatement is implemented mainly debugging LOAD DATA FROM MASTER\noperations. To use LOAD TABLE, the account used for connecting to the\nmaster server must have the RELOAD and SUPER privileges on the master\nand the SELECT privilege for the master table to load. On the slave\nside, the user that issues LOAD TABLE FROM MASTER must have privileges\nfor dropping and creating the table.\n\nThe conditions for LOAD DATA FROM MASTER apply here as well. For\nexample, LOAD TABLE FROM MASTER works only for MyISAM tables. The\ntimeout notes for LOAD DATA FROM MASTER apply as well.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/load-table-from-master.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/load-table-from-master.html'),
 (341,'GROUP_CONCAT',15,'Syntax:\nGROUP_CONCAT(expr)\n\nThis function returns a string result with the concatenated non-NULL\nvalues from a group. It returns NULL if there are no non-NULL values.\nThe full syntax is as follows:\n\nGROUP_CONCAT([DISTINCT] expr [,expr ...]\n             [ORDER BY {unsigned_integer | col_name | expr}\n                 [ASC | DESC] [,col_name ...]]\n             [SEPARATOR str_val])\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html\n\n','mysql> SELECT student_name,\n    ->     GROUP_CONCAT(test_score)\n    ->     FROM student\n    ->     GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html'),
 (342,'DATE_FORMAT',29,'Syntax:\nDATE_FORMAT(date,format)\n\nFormats the date value according to the format string.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT DATE_FORMAT(\'1997-10-04 22:23:00\', \'%W %M %Y\');\n        -> \'Saturday October 1997\'\nmysql> SELECT DATE_FORMAT(\'1997-10-04 22:23:00\', \'%H:%i:%s\');\n        -> \'22:23:00\'\nmysql> SELECT DATE_FORMAT(\'1997-10-04 22:23:00\',\n                          \'%D %y %a %d %m %b %j\');\n        -> \'4th 97 Sat 04 10 Oct 277\'\nmysql> SELECT DATE_FORMAT(\'1997-10-04 22:23:00\',\n                          \'%H %k %I %r %T %S %w\');\n        -> \'22 22 10 10:23:00 PM 22:23:00 00 6\'\nmysql> SELECT DATE_FORMAT(\'1999-01-01\', \'%X %V\');\n        -> \'1998 52\'\nmysql> SELECT DATE_FORMAT(\'2006-06-00\', \'%d\');\n        -> \'00\'\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (343,'BENCHMARK',16,'Syntax:\nBENCHMARK(count,expr)\n\nThe BENCHMARK() function executes the expression expr repeatedly count\ntimes. It may be used to time how quickly MySQL processes the\nexpression. The result value is always 0. The intended use is from\nwithin the mysql client, which reports query execution times:\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/information-functions.html\n\n','mysql> SELECT BENCHMARK(1000000,ENCODE(\'hello\',\'goodbye\'));\n+----------------------------------------------+\n| BENCHMARK(1000000,ENCODE(\'hello\',\'goodbye\')) |\n+----------------------------------------------+\n|                                            0 |\n+----------------------------------------------+\n1 row in set (4.74 sec)\n','http://dev.mysql.com/doc/refman/5.1/en/information-functions.html'),
 (344,'YEAR',29,'Syntax:\nYEAR(date)\n\nReturns the year for date, in the range 1000 to 9999, or 0 for the\n\"zero\" date.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT YEAR(\'98-02-03\');\n        -> 1998\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (345,'SHOW ENGINE',25,'Syntax:\nSHOW ENGINE engine_name {STATUS | MUTEX}\n\nSHOW ENGINE displays operational information about a storage engine.\nThe following statements currently are supported:\n\nSHOW ENGINE INNODB STATUS\nSHOW ENGINE INNODB MUTEX\nSHOW ENGINE {NDB | NDBCLUSTER} STATUS\n\nOlder (and now deprecated) synonyms are SHOW INNODB STATUS for SHOW\nENGINE INNODB STATUS and SHOW MUTEX STATUS for SHOW ENGINE INNODB\nMUTEX.\n\nIn MySQL 5.0, SHOW ENGINE INNODB MUTEX is invoked as SHOW MUTEX STATUS.\nThe latter statement displays similar information but in a somewhat\ndifferent output format.\n\nSHOW ENGINE BDB LOGS formerly displayed status information about BDB\nlog files. As of MySQL 5.1.12, the BDB storage engine is not supported,\nand this statement produces a warning.\n\nSHOW ENGINE INNODB STATUS displays extensive information about the\nstate of the InnoDB storage engine.\n\nThe InnoDB Monitors provide additional information about InnoDB\nprocessing. See\nhttp://dev.mysql.com/doc/refman/5.1/en/innodb-monitor.html.\n\nSHOW ENGINE INNODB MUTEX displays InnoDB mutex statistics. From MySQL\n5.1.2 to 5.1.14, the statement displays the following output fields:\n\no Type\n\n  Always InnoDB.\n\no Name\n\n  The mutex name and the source file where it is implemented. Example:\n  &pool->mutex:mem0pool.c\n\n  The mutex name indicates its purpose. For example, the log_sys mutex\n  is used by the InnoDB logging subsystem and indicates how intensive\n  logging activity is. The buf_pool mutex protects the InnoDB buffer\n  pool.\n\no Status\n\n  The mutex status. The fields contains several values:\n\n  o count indicates how many times the mutex was requested.\n\n  o spin_waits indicates how many times the spinlock had to run.\n\n  o spin_rounds indicates the number of spinlock rounds. (spin_rounds\n    divided by spin_waits provides the average round count.)\n\n  o os_waits indicates the number of operating system waits. This\n    occurs when the spinlock did not work (the mutex was not locked\n    during the spinlock and it was necessary to yield to the operating\n    system and wait).\n\n  o os_yields indicates the number of times a the thread trying to lock\n    a mutex gave up its timeslice and yielded to the operating system\n    (on the presumption that allowing other threads to run will free\n    the mutex so that it can be locked).\n\n  o os_wait_times indicates the amount of time (in ms) spent in\n    operating system waits, if the timed_mutexes system variable is 1\n    (ON). If timed_mutexes is 0 (OFF), timing is disabled, so\n    os_wait_times is 0. timed_mutexes is off by default.\n\nFrom MySQL 5.1.15 on, the statement displays the following output\nfields:\n\no Type\n\n  Always InnoDB.\n\no Name\n\n  The source file where the mutex is implemented, and the line number\n  in the file where the mutex is created. The line number may change\n  depending on your version of MySQL.\n\no Status\n\n  This field displays the same values as previously described (count,\n  spin_waits, spin_rounds, os_waits, os_yields, os_wait_times), but\n  only if UNIV_DEBUG was defined at MySQL compilation time (for\n  example, in include/univ.h in the InnoDB part of the MySQL source\n  tree). If UNIV_DEBUG was not defined, the statement displays only the\n  os_waits value. In the latter case (without UNIV_DEBUG), the\n  information on which the output is based is insufficient to\n  distinguish regular mutexes and mutexes that protect rw-locks (which\n  allow multiple readers or a single writer). Consequently, the output\n  may appear to contain multiple rows for the same mutex.\n\nInformation from this statement can be used to diagnose system\nproblems. For example, large values of spin_waits and spin_rounds may\nindicate scalability problems.\n\nIf the server has the NDBCLUSTER storage engine enabled, SHOW ENGINE\nNDB STATUS displays cluster status information such as the number of\nconnected data nodes, the cluster connectstring, and cluster binlog\nepochs, as well as counts of various Cluster API objects created by the\nMySQL Server when connected to the cluster. Sample output from this\nstatement is shown here:\n\nmysql> SHOW ENGINE NDB STATUS;\n+------------+-----------------------+--------------------------------------------------+\n| Type       | Name                  | Status                                           |\n+------------+-----------------------+--------------------------------------------------+\n| ndbcluster | connection            | cluster_node_id=7, \n  connected_host=192.168.0.103, connected_port=1186, number_of_data_nodes=4, \n  number_of_ready_data_nodes=3, connect_count=0                                         |\n| ndbcluster | NdbTransaction        | created=6, free=0, sizeof=212                    |\n| ndbcluster | NdbOperation          | created=8, free=8, sizeof=660                    |\n| ndbcluster | NdbIndexScanOperation | created=1, free=1, sizeof=744                    |\n| ndbcluster | NdbIndexOperation     | created=0, free=0, sizeof=664                    |\n| ndbcluster | NdbRecAttr            | created=1285, free=1285, sizeof=60               |\n| ndbcluster | NdbApiSignal          | created=16, free=16, sizeof=136                  |\n| ndbcluster | NdbLabel              | created=0, free=0, sizeof=196                    |\n| ndbcluster | NdbBranch             | created=0, free=0, sizeof=24                     |\n| ndbcluster | NdbSubroutine         | created=0, free=0, sizeof=68                     |\n| ndbcluster | NdbCall               | created=0, free=0, sizeof=16                     |\n| ndbcluster | NdbBlob               | created=1, free=1, sizeof=264                    |\n| ndbcluster | NdbReceiver           | created=4, free=0, sizeof=68                     |\n| ndbcluster | binlog                | latest_epoch=155467, latest_trans_epoch=148126, \n  latest_received_binlog_epoch=0, latest_handled_binlog_epoch=0, \n  latest_applied_binlog_epoch=0                                                         |\n+------------+-----------------------+--------------------------------------------------+\n\nThe rows with connection and binlog in the Name column were added to\nthe output of this statement in MySQL 5.1. The Status column in each of\nthese rows provides information about the MySQL server\'s connection to\nthe cluster and about the cluster binary log\'s status, respectively.\nThe Status information is in the form of comma-delimited set of\nname/value pairs.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-engine.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-engine.html'),
 (346,'NAME_CONST',14,'Syntax:\nNAME_CONST(name,value)\n\nReturns the given value. When used to produce a result set column,\nNAME_CONST() causes the column to have the given name.\n\nmysql> SELECT NAME_CONST(\'myname\', 14);\n+--------+\n| myname |\n+--------+\n|     14 |\n+--------+\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html');
INSERT INTO `help_topic` (`help_topic_id`,`name`,`help_category_id`,`description`,`example`,`url`) VALUES 
 (347,'RELEASE_LOCK',14,'Syntax:\nRELEASE_LOCK(str)\n\nReleases the lock named by the string str that was obtained with\nGET_LOCK(). Returns 1 if the lock was released, 0 if the lock was not\nestablished by this thread (in which case the lock is not released),\nand NULL if the named lock did not exist. The lock does not exist if it\nwas never obtained by a call to GET_LOCK() or if it has previously been\nreleased.\n\nThe DO statement is convenient to use with RELEASE_LOCK(). See [HELP\nDO].\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html'),
 (348,'IS NULL',18,'Syntax:\nIS NULL, IS NOT NULL\n\nTests whether a value is or is not NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html\n\n','mysql> SELECT 1 IS NULL, 0 IS NULL, NULL IS NULL;\n        -> 0, 0, 1\nmysql> SELECT 1 IS NOT NULL, 0 IS NOT NULL, NULL IS NOT NULL;\n        -> 1, 1, 0\n','http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html'),
 (349,'CONVERT_TZ',29,'Syntax:\nCONVERT_TZ(dt,from_tz,to_tz)\n\nCONVERT_TZ() converts a datetime value dt from the time zone given by\nfrom_tz to the time zone given by to_tz and returns the resulting\nvalue. Time zones are specified as described in\nhttp://dev.mysql.com/doc/refman/5.1/en/time-zone-support.html. This\nfunction returns NULL if the arguments are invalid.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT CONVERT_TZ(\'2004-01-01 12:00:00\',\'GMT\',\'MET\');\n        -> \'2004-01-01 13:00:00\'\nmysql> SELECT CONVERT_TZ(\'2004-01-01 12:00:00\',\'+00:00\',\'+10:00\');\n        -> \'2004-01-01 22:00:00\'\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (350,'TIME_TO_SEC',29,'Syntax:\nTIME_TO_SEC(time)\n\nReturns the time argument, converted to seconds.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT TIME_TO_SEC(\'22:23:00\');\n        -> 80580\nmysql> SELECT TIME_TO_SEC(\'00:39:38\');\n        -> 2378\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (351,'WEEKDAY',29,'Syntax:\nWEEKDAY(date)\n\nReturns the weekday index for date (0 = Monday, 1 = Tuesday, ... 6 =\nSunday).\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT WEEKDAY(\'1998-02-03 22:23:00\');\n        -> 1\nmysql> SELECT WEEKDAY(\'1997-11-05\');\n        -> 2\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (352,'EXPORT_SET',34,'Syntax:\nEXPORT_SET(bits,on,off[,separator[,number_of_bits]])\n\nReturns a string such that for every bit set in the value bits, you get\nan on string and for every bit not set in the value, you get an off\nstring. Bits in bits are examined from right to left (from low-order to\nhigh-order bits). Strings are added to the result from left to right,\nseparated by the separator string (the default being the comma\ncharacter `,\'). The number of bits examined is given by number_of_bits\n(defaults to 64).\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT EXPORT_SET(5,\'Y\',\'N\',\',\',4);\n        -> \'Y,N,Y,N\'\nmysql> SELECT EXPORT_SET(6,\'1\',\'0\',\',\',10);\n        -> \'0,1,1,0,0,0,0,0,0,0\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (353,'ALTER SERVER',37,'Syntax:\nALTER SERVER  server_name\nOPTIONS (option ...)\n\nAlters the server information for server_name, adjusting the specified\noptions as per the CREATE SERVER command. See [HELP CREATE SERVER]. The\ncorresponding fields in the mysql.servers table are updated\naccordingly. This statement requires the SUPER privilege.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/alter-server.html\n\n','ALTER SERVER s OPTIONS (USER \'sally\');\n','http://dev.mysql.com/doc/refman/5.1/en/alter-server.html'),
 (354,'TIME FUNCTION',29,'Syntax:\nTIME(expr)\n\nExtracts the time part of the time or datetime expression expr and\nreturns it as a string.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT TIME(\'2003-12-31 01:02:03\');\n        -> \'01:02:03\'\nmysql> SELECT TIME(\'2003-12-31 01:02:03.000123\');\n        -> \'01:02:03.000123\'\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (355,'DATE_ADD',29,'Syntax:\nDATE_ADD(date,INTERVAL expr unit), DATE_SUB(date,INTERVAL expr unit)\n\nThese functions perform date arithmetic. date is a DATETIME or DATE\nvalue specifying the starting date. expr is an expression specifying\nthe interval value to be added or subtracted from the starting date.\nexpr is a string; it may start with a `-\' for negative intervals. unit\nis a keyword indicating the units in which the expression should be\ninterpreted.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT \'1997-12-31 23:59:59\' + INTERVAL 1 SECOND;\n        -> \'1998-01-01 00:00:00\'\nmysql> SELECT INTERVAL 1 DAY + \'1997-12-31\';\n        -> \'1998-01-01\'\nmysql> SELECT \'1998-01-01\' - INTERVAL 1 SECOND;\n        -> \'1997-12-31 23:59:59\'\nmysql> SELECT DATE_ADD(\'1997-12-31 23:59:59\',\n    ->                 INTERVAL 1 SECOND);\n        -> \'1998-01-01 00:00:00\'\nmysql> SELECT DATE_ADD(\'1997-12-31 23:59:59\',\n    ->                 INTERVAL 1 DAY);\n        -> \'1998-01-01 23:59:59\'\nmysql> SELECT DATE_ADD(\'1997-12-31 23:59:59\',\n    ->                 INTERVAL \'1:1\' MINUTE_SECOND);\n        -> \'1998-01-01 00:01:00\'\nmysql> SELECT DATE_SUB(\'1998-01-01 00:00:00\',\n    ->                 INTERVAL \'1 1:1:1\' DAY_SECOND);\n        -> \'1997-12-30 22:58:59\'\nmysql> SELECT DATE_ADD(\'1998-01-01 00:00:00\',\n    ->                 INTERVAL \'-1 10\' DAY_HOUR);\n        -> \'1997-12-30 14:00:00\'\nmysql> SELECT DATE_SUB(\'1998-01-02\', INTERVAL 31 DAY);\n        -> \'1997-12-02\'\nmysql> SELECT DATE_ADD(\'1992-12-31 23:59:59.000002\',\n    ->            INTERVAL \'1.999999\' SECOND_MICROSECOND);\n        -> \'1993-01-01 00:00:01.000001\'\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (356,'CAST',34,'Syntax:\nCAST(expr AS type), CONVERT(expr,type), CONVERT(expr USING\ntranscoding_name)\n\nThe CAST() and CONVERT() functions take a value of one type and produce\na value of another type.\n\nThe type can be one of the following values:\n\no BINARY[(N)]\n\no CHAR[(N)]\n\no DATE\n\no DATETIME\n\no DECIMAL\n\no SIGNED [INTEGER]\n\no TIME\n\no UNSIGNED [INTEGER]\n\nBINARY produces a string with the BINARY data type. See\nhttp://dev.mysql.com/doc/refman/5.1/en/binary-varbinary.html for a\ndescription of how this affects comparisons. If the optional length N\nis given, BINARY(N) causes the cast to use no more than N bytes of the\nargument. Values shorter than N bytes are padded with 0x00 bytes to a\nlength of N.\n\nCHAR(N) causes the cast to use no more than N characters of the\nargument.\n\nCAST() and CONVERT(... USING ...) are standard SQL syntax. The\nnon-USING form of CONVERT() is ODBC syntax.\n\nCONVERT() with USING is used to convert data between different\ncharacter sets. In MySQL, transcoding names are the same as the\ncorresponding character set names. For example, this statement converts\nthe string \'abc\' in the default character set to the corresponding\nstring in the utf8 character set:\n\nSELECT CONVERT(\'abc\' USING utf8);\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/cast-functions.html\n\n','SELECT enum_col FROM tbl_name ORDER BY CAST(enum_col AS CHAR);\n','http://dev.mysql.com/doc/refman/5.1/en/cast-functions.html'),
 (357,'SOUNDS LIKE',34,'Syntax:\nexpr1 SOUNDS LIKE expr2\n\nThis is the same as SOUNDEX(expr1) = SOUNDEX(expr2).\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (358,'PERIOD_DIFF',29,'Syntax:\nPERIOD_DIFF(P1,P2)\n\nReturns the number of months between periods P1 and P2. P1 and P2\nshould be in the format YYMM or YYYYMM. Note that the period arguments\nP1 and P2 are not date values.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT PERIOD_DIFF(9802,199703);\n        -> 11\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (359,'LIKE',34,'Syntax:\nexpr LIKE pat [ESCAPE \'escape_char\']\n\nPattern matching using SQL simple regular expression comparison.\nReturns 1 (TRUE) or 0 (FALSE). If either expr or pat is NULL, the\nresult is NULL.\n\nThe pattern need not be a literal string. For example, it can be\nspecified as a string expression or table column.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-comparison-functions.html\n\n','mysql> SELECT \'David!\' LIKE \'David_\';\n        -> 1\nmysql> SELECT \'David!\' LIKE \'%D%v%\';\n        -> 1\n','http://dev.mysql.com/doc/refman/5.1/en/string-comparison-functions.html'),
 (360,'MULTIPOINT',23,'MultiPoint(pt1,pt2,...)\n\nConstructs a WKB MultiPoint value using WKB Point arguments. If any\nargument is not a WKB Point, the return value is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-mysql-specific-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-mysql-specific-functions.html'),
 (361,'>>',19,'Syntax:\n>>\n\nShifts a longlong (BIGINT) number to the right.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/bit-functions.html\n\n','mysql> SELECT 4 >> 2;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.1/en/bit-functions.html'),
 (362,'FETCH',36,'Syntax:\nFETCH cursor_name INTO var_name [, var_name] ...\n\nThis statement fetches the next row (if a row exists) using the\nspecified open cursor, and advances the cursor pointer.\n\nIf no more rows are available, a No Data condition occurs with SQLSTATE\nvalue 02000. To detect this condition, you can set up a handler for it.\nAn example is shown in [HELP DECLARE CURSOR].\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/fetch.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/fetch.html'),
 (363,'AVG',15,'Syntax:\nAVG([DISTINCT] expr)\n\nReturns the average value of expr. The DISTINCT option can be used to\nreturn the average of the distinct values of expr.\n\nAVG() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html\n\n','mysql> SELECT student_name, AVG(test_score)\n    ->        FROM student\n    ->        GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html'),
 (364,'TRUE FALSE',28,'The constants TRUE and FALSE evaluate to 1 and 0, respectively. The\nconstant names can be written in any lettercase.\n\nmysql> SELECT TRUE, true, FALSE, false;\n        -> 1, 1, 0, 0\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/boolean-values.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/boolean-values.html'),
 (365,'MBRWITHIN',6,'MBRWithin(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangle of g1\nis within the Minimum Bounding Rectangle of g2. This tests the opposite\nrelationship as MBRContains().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/relations-on-geometry-mbr.html\n\n','mysql> SET @g1 = GeomFromText(\'Polygon((0 0,0 3,3 3,3 0,0 0))\');\nmysql> SET @g2 = GeomFromText(\'Polygon((0 0,0 5,5 5,5 0,0 0))\');\nmysql> SELECT MBRWithin(@g1,@g2), MBRWithin(@g2,@g1);\n+--------------------+--------------------+\n| MBRWithin(@g1,@g2) | MBRWithin(@g2,@g1) |\n+--------------------+--------------------+\n|                  1 |                  0 |\n+--------------------+--------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/relations-on-geometry-mbr.html'),
 (366,'IN',18,'Syntax:\nexpr IN (value,...)\n\nReturns 1 if expr is equal to any of the values in the IN list, else\nreturns 0. If all values are constants, they are evaluated according to\nthe type of expr and sorted. The search for the item then is done using\na binary search. This means IN is very quick if the IN value list\nconsists entirely of constants. Otherwise, type conversion takes place\naccording to the rules described in\nhttp://dev.mysql.com/doc/refman/5.1/en/type-conversion.html, but\napplied to all the arguments.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html\n\n','mysql> SELECT 2 IN (0,3,5,7);\n        -> 0\nmysql> SELECT \'wefwf\' IN (\'wee\',\'wefwf\',\'weg\');\n        -> 1\n','http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html'),
 (367,'QUOTE',34,'Syntax:\nQUOTE(str)\n\nQuotes a string to produce a result that can be used as a properly\nescaped data value in an SQL statement. The string is returned enclosed\nby single quotes and with each instance of single quote (`\'\'),\nbackslash (`\\\'), ASCII NUL, and Control-Z preceded by a backslash. If\nthe argument is NULL, the return value is the word \"NULL\" without\nenclosing single quotes.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT QUOTE(\'Don\\\'t!\');\n        -> \'Don\\\'t!\'\nmysql> SELECT QUOTE(NULL);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (368,'SESSION_USER',16,'Syntax:\nSESSION_USER()\n\nSESSION_USER() is a synonym for USER().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/information-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/information-functions.html'),
 (369,'HELP COMMAND',26,'Syntax:\nmysql> help search_string\n\nIf you provide an argument to the help command, mysql uses it as a\nsearch string to access server-side help from the contents of the MySQL\nReference Manual. The proper operation of this command requires that\nthe help tables in the mysql database be initialized with help topic\ninformation (see\nhttp://dev.mysql.com/doc/refman/5.1/en/server-side-help-support.html).\n\nIf there is no match for the search string, the search fails:\n\nmysql> help me\n\nNothing found\nPlease try to run \'help contents\' for a list of all accessible topics\n\nUse help contents to see a list of the help categories:\n\nmysql> help contents\nYou asked for help about help category: \"Contents\"\nFor more information, type \'help <item>\', where <item> is one of the\nfollowing categories:\n   Account Management\n   Administration\n   Data Definition\n   Data Manipulation\n   Data Types\n   Functions\n   Functions and Modifiers for Use with GROUP BY\n   Geographic Features\n   Language Structure\n   Plugins\n   Storage Engines\n   Stored Routines\n   Table Maintenance\n   Transactions\n   Triggers\n\nIf the search string matches multiple items, mysql shows a list of\nmatching topics:\n\nmysql> help logs\nMany help items for your request exist.\nTo make a more specific request, please type \'help <item>\',\nwhere <item> is one of the following topics:\n   SHOW\n   SHOW BINARY LOGS\n   SHOW ENGINE\n   SHOW LOGS\n\nUse a topic as the search string to see the help entry for that topic:\n\nmysql> help show binary logs\nName: \'SHOW BINARY LOGS\'\nDescription:\nSyntax:\nSHOW BINARY LOGS\nSHOW MASTER LOGS\n\nLists the binary log files on the server. This statement is used as\npart of the procedure described in [purge-master-logs], that shows how\nto determine which logs can be purged.\n\nmysql> SHOW BINARY LOGS;\n+---------------+-----------+\n| Log_name      | File_size |\n+---------------+-----------+\n| binlog.000015 |    724935 |\n| binlog.000016 |    733481 |\n+---------------+-----------+\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mysql-server-side-help.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/mysql-server-side-help.html'),
 (370,'QUARTER',29,'Syntax:\nQUARTER(date)\n\nReturns the quarter of the year for date, in the range 1 to 4.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT QUARTER(\'98-04-01\');\n        -> 2\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (371,'POSITION',34,'Syntax:\nPOSITION(substr IN str)\n\nPOSITION(substr IN str) is a synonym for LOCATE(substr,str).\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (372,'IS_USED_LOCK',14,'Syntax:\nIS_USED_LOCK(str)\n\nChecks whether the lock named str is in use (that is, locked). If so,\nit returns the connection identifier of the client that holds the lock.\nOtherwise, it returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html'),
 (373,'POLYFROMTEXT',3,'PolyFromText(wkt[,srid]), PolygonFromText(wkt[,srid])\n\nConstructs a POLYGON value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-wkt-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-wkt-functions.html'),
 (374,'DES_ENCRYPT',11,'Syntax:\nDES_ENCRYPT(str[,{key_num|key_str}])\n\nEncrypts the string with the given key using the Triple-DES algorithm.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html\n\n','key_num des_key_str\n','http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html'),
 (375,'LENGTH',34,'Syntax:\nLENGTH(str)\n\nReturns the length of the string str, measured in bytes. A multi-byte\ncharacter counts as multiple bytes. This means that for a string\ncontaining five two-byte characters, LENGTH() returns 10, whereas\nCHAR_LENGTH() returns 5.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT LENGTH(\'text\');\n        -> 4\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (376,'STR_TO_DATE',29,'Syntax:\nSTR_TO_DATE(str,format)\n\nThis is the inverse of the DATE_FORMAT() function. It takes a string\nstr and a format string format. STR_TO_DATE() returns a DATETIME value\nif the format string contains both date and time parts, or a DATE or\nTIME value if the string contains only date or time parts.\n\nThe date, time, or datetime values contained in str should be given in\nthe format indicated by format. For the specifiers that can be used in\nformat, see the DATE_FORMAT() function description. If str contains an\nillegal date, time, or datetime value, STR_TO_DATE() returns NULL. An\nillegal value also produces a warning.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (377,'Y',10,'Y(p)\n\nReturns the Y-coordinate value for the point p as a double-precision\nnumber.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/point-property-functions.html\n\n','mysql> SET @pt = \'Point(56.7 53.34)\';\nmysql> SELECT Y(GeomFromText(@pt));\n+----------------------+\n| Y(GeomFromText(@pt)) |\n+----------------------+\n|                53.34 |\n+----------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/point-property-functions.html'),
 (378,'SHOW INNODB STATUS',25,'Syntax:\nSHOW INNODB STATUS\n\nIn MySQL 5.1, this is a deprecated synonym for SHOW ENGINE INNODB\nSTATUS. See [HELP SHOW ENGINE].\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-innodb-status.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-innodb-status.html'),
 (379,'CHECKSUM TABLE',20,'Syntax:\nCHECKSUM TABLE tbl_name [, tbl_name] ... [ QUICK | EXTENDED ]\n\nCHECKSUM TABLE reports a table checksum.\n\nWith QUICK, the live table checksum is reported if it is available, or\nNULL otherwise. This is very fast. A live checksum is enabled by\nspecifying the CHECKSUM=1 table option when you create the table;\ncurrently, this is supported only for MyISAM tables. See [HELP CREATE\nTABLE].\n\nWith EXTENDED, the entire table is read row by row and the checksum is\ncalculated. This can be very slow for large tables.\n\nIf neither QUICK nor EXTENDED is specified, MySQL returns a live\nchecksum if the table storage engine supports it and scans the table\notherwise.\n\nFor a non-existent table, CHECKSUM TABLE returns NULL and generates a\nwarning.\n\nThe checksum value depends on the table row format. If the row format\nchanges, the checksum also changes. For example, the storage format for\nVARCHAR changed between MySQL 4.1 and 5.0, so if a 4.1 table is\nupgraded to MySQL 5.0, the checksum value may change.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/checksum-table.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/checksum-table.html'),
 (380,'NUMINTERIORRINGS',2,'NumInteriorRings(poly)\n\nReturns the number of interior rings in the Polygon value poly.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/polygon-property-functions.html\n\n','mysql> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nmysql> SELECT NumInteriorRings(GeomFromText(@poly));\n+---------------------------------------+\n| NumInteriorRings(GeomFromText(@poly)) |\n+---------------------------------------+\n|                                     1 |\n+---------------------------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/polygon-property-functions.html'),
 (381,'INTERIORRINGN',2,'InteriorRingN(poly,N)\n\nReturns the N-th interior ring for the Polygon value poly as a\nLineString. Rings are numbered beginning with 1.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/polygon-property-functions.html\n\n','mysql> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nmysql> SELECT AsText(InteriorRingN(GeomFromText(@poly),1));\n+----------------------------------------------+\n| AsText(InteriorRingN(GeomFromText(@poly),1)) |\n+----------------------------------------------+\n| LINESTRING(1 1,1 2,2 2,2 1,1 1)              |\n+----------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/polygon-property-functions.html'),
 (382,'UTC_TIME',29,'Syntax:\nUTC_TIME, UTC_TIME()\n\nReturns the current UTC time as a value in \'HH:MM:SS\' or HHMMSS format,\ndepending on whether the function is used in a string or numeric\ncontext.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT UTC_TIME(), UTC_TIME() + 0;\n        -> \'18:07:53\', 180753\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (383,'DROP FUNCTION',35,'Syntax:\nDROP FUNCTION function_name\n\nThis statement drops the user-defined function (UDF) named\nfunction_name.\n\nTo drop a function, you must have the DELETE privilege for the mysql\ndatabase. This is because DROP FUNCTION removes a row from the\nmysql.func system table that records the function\'s name, type, and\nshared library name.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/drop-function.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/drop-function.html'),
 (384,'ALTER EVENT',37,'Syntax:\nALTER EVENT\n    [DEFINER = { user | CURRENT_USER }]\n    event_name\n    [ON SCHEDULE schedule]\n    [RENAME TO new_event_name]\n    [ON COMPLETION [NOT] PRESERVE]\n    [ENABLE | DISABLE | DISABLE ON SLAVE]\n    [COMMENT \'comment\']\n    [DO sql_statement]\n\nThe ALTER EVENT statement is used to change one or more of the\ncharacteristics of an existing event without the need to drop and\nrecreate it. The syntax for each of the DEFINER, ON SCHEDULE, ON\nCOMPLETION, COMMENT, ENABLE / DISABLE, and DO clauses is exactly the\nsame as when used with CREATE EVENT. (See [HELP CREATE EVENT].)\n\nSupport for the DEFINER clause was added in MySQL 5.1.17.\n\nBeginning with MySQL 5.1.12, any user can alter an event defined on a\ndatabase for which that user has the EVENT privilege. When a user\nexecutes a successful ALTER EVENT statement, that user becomes the\ndefiner for the affected event.\n\n(In MySQL 5.1.11 and earlier, an event could be altered only by its\ndefiner, or by a user having the SUPER privilege.)\n\nALTER EVENT works only with an existing event:\n\nmysql> ALTER EVENT no_such_event \n     >     ON SCHEDULE \n     >       EVERY \'2:3\' DAY_HOUR;\nERROR 1517 (HY000): Unknown event \'no_such_event\'\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/alter-event.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/alter-event.html'),
 (385,'STDDEV',15,'Syntax:\nSTD(expr) STDDEV(expr)\n\nReturns the population standard deviation of expr. This is an extension\nto standard SQL. The STDDEV() form of this function is provided for\ncompatibility with Oracle. The standard SQL function STDDEV_POP() can\nbe used instead.\n\nThese functions return NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html'),
 (386,'DATE_SUB',29,'Syntax:\nDATE_SUB(date,INTERVAL expr unit)\n\nSee DATE_ADD().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (387,'PERIOD_ADD',29,'Syntax:\nPERIOD_ADD(P,N)\n\nAdds N months to period P (in the format YYMM or YYYYMM). Returns a\nvalue in the format YYYYMM. Note that the period argument P is not a\ndate value.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT PERIOD_ADD(9801,2);\n        -> 199803\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (388,'|',19,'Syntax:\n|\n\nBitwise OR:\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/bit-functions.html\n\n','mysql> SELECT 29 | 15;\n        -> 31\n','http://dev.mysql.com/doc/refman/5.1/en/bit-functions.html'),
 (389,'GEOMFROMTEXT',3,'GeomFromText(wkt[,srid]), GeometryFromText(wkt[,srid])\n\nConstructs a geometry value of any type using its WKT representation\nand SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-wkt-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-wkt-functions.html'),
 (390,'RIGHT',34,'Syntax:\nRIGHT(str,len)\n\nReturns the rightmost len characters from the string str, or NULL if\nany argument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT RIGHT(\'foobarbar\', 4);\n        -> \'rbar\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (391,'DATEDIFF',29,'Syntax:\nDATEDIFF(expr1,expr2)\n\nDATEDIFF() returns expr1 - expr2 expressed as a value in days from one\ndate to the other. expr1 and expr2 are date or date-and-time\nexpressions. Only the date parts of the values are used in the\ncalculation.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT DATEDIFF(\'1997-12-31 23:59:59\',\'1997-12-30\');\n        -> 1\nmysql> SELECT DATEDIFF(\'1997-11-30 23:59:59\',\'1997-12-31\');\n        -> -31\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (392,'DROP PROCEDURE',36,'Syntax:\nDROP {PROCEDURE | FUNCTION} [IF EXISTS] sp_name\n\nThis statement is used to drop a stored procedure or function. That is,\nthe specified routine is removed from the server. You must have the\nALTER ROUTINE privilege for the routine. (That privilege is granted\nautomatically to the routine creator.)\n\nThe IF EXISTS clause is a MySQL extension. It prevents an error from\noccurring if the procedure or function does not exist. A warning is\nproduced that can be viewed with SHOW WARNINGS.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/drop-procedure.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/drop-procedure.html'),
 (393,'CHECK TABLE',20,'Syntax:\nCHECK TABLE tbl_name [, tbl_name] ... [option] ...\n\noption = {FOR UPGRADE | QUICK | FAST | MEDIUM | EXTENDED | CHANGED}\n\nCHECK TABLE checks a table or tables for errors. CHECK TABLE works for\nMyISAM, InnoDB, and ARCHIVE tables. Starting with MySQL 5.1.9, CHECK is\nalso valid for CSV tables, see\nhttp://dev.mysql.com/doc/refman/5.1/en/csv-storage-engine.html. For\nMyISAM tables, the key statistics are updated as well.\n\nCHECK TABLE can also check views for problems, such as tables that are\nreferenced in the view definition that no longer exist.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/check-table.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/check-table.html'),
 (394,'BIN',34,'Syntax:\nBIN(N)\n\nReturns a string representation of the binary value of N, where N is a\nlonglong (BIGINT) number. This is equivalent to CONV(N,10,2). Returns\nNULL if N is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT BIN(12);\n        -> \'1100\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (395,'CASE FUNCTION',7,'Syntax:\nCASE value WHEN [compare_value] THEN result [WHEN [compare_value] THEN\nresult ...] [ELSE result] END\n\nCASE WHEN [condition] THEN result [WHEN [condition] THEN result ...]\n[ELSE result] END\n\nThe first version returns the result where value=compare_value. The\nsecond version returns the result for the first condition that is true.\nIf there was no matching result value, the result after ELSE is\nreturned, or NULL if there is no ELSE part.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/control-flow-functions.html\n\n','mysql> SELECT CASE 1 WHEN 1 THEN \'one\'\n    ->     WHEN 2 THEN \'two\' ELSE \'more\' END;\n        -> \'one\'\nmysql> SELECT CASE WHEN 1>0 THEN \'true\' ELSE \'false\' END;\n        -> \'true\'\nmysql> SELECT CASE BINARY \'B\'\n    ->     WHEN \'a\' THEN 1 WHEN \'b\' THEN 2 END;\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.1/en/control-flow-functions.html'),
 (396,'INSTALL PLUGIN',5,'Syntax:\nINSTALL PLUGIN plugin_name SONAME \'plugin_library\'\n\nThis statement installs a plugin.\n\nplugin_name is the name of the plugin as defined in the plugin\ndeclaration structure contained in the library file. Plugin name case\nsensitivity is determined by the host system filename semantics.\n\nplugin_library is the name of the shared library that contains the\nplugin code. The name includes the filename extension (for example,\nlibmyplugin.so or libmyplugin.dylib).\n\nThe shared library must be located in the plugin directory (that is,\nthe directory named by the plugin_dir system variable). The library\nmust be in the plugin directory itself, not in a subdirectory. By\ndefault, plugin_dir is the directory named by the pkglibdir\nconfiguration variable, but it can be changed by setting the value of\nplugin_dir at server startup. For example, set its value in a my.cnf\nfile:\n\n[mysqld]\nplugin_dir=/path/to/plugin/directory\n\nIf the value of plugin_dir is a relative pathname, it is taken to be\nrelative to the MySQL base directory (the value of the basedir system\nvariable).\n\nINSTALL PLUGIN adds a line to the mysql.plugin table that describes the\nplugin. This table contains the plugin name and library filename.\n\nINSTALL PLUGIN also loads and initializes the plugin code to make the\nplugin available for use. A plugin is initialized by executing its\ninitialization function, which handles any setup that the plugin must\nperform before it can be used.\n\nTo use INSTALL PLUGIN, you must have the INSERT privilege for the\nmysql.plugin table.\n\nAt server startup, the server loads and initializes any plugin that is\nlisted in the mysql.plugin table. This means that a plugin is installed\nwith INSTALL PLUGIN only once, not every time the server starts. Plugin\nloading at startup does not occur if the server is started with the\n--skip-grant-tables option.\n\nWhen the server shuts down, it executes the deinitialization function\nfor each plugin that is loaded so that the plugin has a change to\nperform any final cleanup.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/install-plugin.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/install-plugin.html'),
 (397,'DECLARE CURSOR',36,'Syntax:\nDECLARE cursor_name CURSOR FOR select_statement\n\nThis statement declares a cursor. Multiple cursors may be declared in a\nroutine, but each cursor in a given block must have a unique name.\n\nThe SELECT statement cannot have an INTO clause.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/declare-cursors.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/declare-cursors.html'),
 (398,'MULTILINESTRING',23,'MultiLineString(ls1,ls2,...)\n\nConstructs a WKB MultiLineString value using WKB LineString arguments.\nIf any argument is not a WKB LineString, the return value is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-mysql-specific-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-mysql-specific-functions.html'),
 (399,'LOAD DATA',25,'Syntax:\nLOAD DATA [LOW_PRIORITY | CONCURRENT] [LOCAL] INFILE \'file_name\'\n    [REPLACE | IGNORE]\n    INTO TABLE tbl_name\n    [CHARACTER SET charset_name]\n    [FIELDS\n        [TERMINATED BY \'string\']\n        [[OPTIONALLY] ENCLOSED BY \'char\']\n        [ESCAPED BY \'char\']\n    ]\n    [LINES\n        [STARTING BY \'string\']\n        [TERMINATED BY \'string\']\n    ]\n    [IGNORE number LINES]\n    [(col_name_or_user_var,...)]\n    [SET col_name = expr,...]\n\nThe LOAD DATA INFILE statement reads rows from a text file into a table\nat a very high speed. The filename must be given as a literal string.\n\nLOAD DATA INFILE is the complement of SELECT ... INTO OUTFILE. (See\n[HELP SELECT].) To write data from a table to a file, use SELECT ...\nINTO OUTFILE. To read the file back into a table, use LOAD DATA INFILE.\nThe syntax of the FIELDS and LINES clauses is the same for both\nstatements. Both clauses are optional, but FIELDS must precede LINES if\nboth are specified.\n\nFor more information about the efficiency of INSERT versus LOAD DATA\nINFILE and speeding up LOAD DATA INFILE, see\nhttp://dev.mysql.com/doc/refman/5.1/en/insert-speed.html.\n\nThe character set indicated by the character_set_database system\nvariable is used to interpret the information in the file. SET NAMES\nand the setting of character_set_client do not affect interpretation of\ninput. Beginning with MySQL 5.1.17, if the contents of the input file\nuse a character set that differs from the default, it is possible (and\nusually preferable) to use the CHARACTER SET clause to specify the\ncharacter set of the file.\n\nLOAD DATA INFILE interprets all fields in the file as having the same\ncharacter set, regardless of the data types of the columns into which\nfield values are loaded. For proper interpretation of file contents,\nyou must ensure that it was written with the correct character set. For\nexample, if you write a data file with mysqldump -T or by issuing a\nSELECT ... INTO OUTFILE statement in mysql, be sure to use a\n--default-character-set option with mysqldump or mysql so that output\nis written in the character set to be used when the file is loaded with\nLOAD DATA INFILE.\n\nNote that it is currently not possible to load data files that use the\nucs2 character set.\n\nAs of MySQL 5.1.6, the character_set_filesystem system variable\ncontrols the interpretation of the filename.\n\nYou can also load data files by using the mysqlimport utility; it\noperates by sending a LOAD DATA INFILE statement to the server. The\n--local option causes mysqlimport to read data files from the client\nhost. You can specify the --compress option to get better performance\nover slow networks if the client and server support the compressed\nprotocol. See http://dev.mysql.com/doc/refman/5.1/en/mysqlimport.html.\n\nIf you use LOW_PRIORITY, execution of the LOAD DATA statement is\ndelayed until no other clients are reading from the table. This affects\nonly storage engines that use only table-level locking (MyISAM, MEMORY,\nMERGE).\n\nIf you specify CONCURRENT with a MyISAM table that satisfies the\ncondition for concurrent inserts (that is, it contains no free blocks\nin the middle), other threads can retrieve data from the table while\nLOAD DATA is executing. Using this option affects the performance of\nLOAD DATA a bit, even if no other thread is using the table at the same\ntime.\n\nThe LOCAL keyword, if specified, is interpreted with respect to the\nclient end of the connection:\n\no If LOCAL is specified, the file is read by the client program on the\n  client host and sent to the server. The file can be given as a full\n  pathname to specify its exact location. If given as a relative\n  pathname, the name is interpreted relative to the directory in which\n  the client program was started.\n\no If LOCAL is not specified, the file must be located on the server\n  host and is read directly by the server. The server uses the\n  following rules to locate the file:\n\n  o If the filename is an absolute pathname, the server uses it as\n    given.\n\n  o If the filename is a relative pathname with one or more leading\n    components, the server searches for the file relative to the\n    server\'s data directory.\n\n  o If a filename with no leading components is given, the server looks\n    for the file in the database directory of the default database.\n\nNote that, in the non-LOCAL case, these rules mean that a file named as\n./myfile.txt is read from the server\'s data directory, whereas the file\nnamed as myfile.txt is read from the database directory of the default\ndatabase. For example, if db1 is the default database, the following\nLOAD DATA statement reads the file data.txt from the database directory\nfor db1, even though the statement explicitly loads the file into a\ntable in the db2 database:\n\nLOAD DATA INFILE \'data.txt\' INTO TABLE db2.my_table;\n\nWindows pathnames are specified using forward slashes rather than\nbackslashes. If you do use backslashes, you must double them.\n\nFor security reasons, when reading text files located on the server,\nthe files must either reside in the database directory or be readable\nby all. Also, to use LOAD DATA INFILE on server files, you must have\nthe FILE privilege. See\nhttp://dev.mysql.com/doc/refman/5.1/en/privileges-provided.html.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/load-data.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/load-data.html'),
 (400,'LOCALTIME',29,'Syntax:\nLOCALTIME, LOCALTIME()\n\nLOCALTIME and LOCALTIME() are synonyms for NOW().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (401,'MPOINTFROMTEXT',3,'MPointFromText(wkt[,srid]), MultiPointFromText(wkt[,srid])\n\nConstructs a MULTIPOINT value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-wkt-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-wkt-functions.html'),
 (402,'BLOB',21,'BLOB[(M)]\n\nA BLOB column with a maximum length of 65,535 (216 - 1) bytes.\n\nAn optional length M can be given for this type. If this is done, MySQL\ncreates the column as the smallest BLOB type large enough to hold\nvalues M bytes long.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html'),
 (403,'PASSWORD',11,'Syntax:\nPASSWORD(str)\n\nCalculates and returns a password string from the plaintext password\nstr and returns a binary string, or NULL if the argument was NULL. This\nis the function that is used for encrypting MySQL passwords for storage\nin the Password column of the user grant table.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html\n\n','mysql> SELECT PASSWORD(\'badpwd\');\n        -> \'*AAB3E285149C0135D51A520E1940DD3263DC008C\'\n','http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html'),
 (404,'CHAR',21,'[NATIONAL] CHAR(M) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA fixed-length string that is always right-padded with spaces to the\nspecified length when stored. M represents the column length. The range\nof M is 0 to 255 characters.\n\n*Note*: Trailing spaces are removed when CHAR values are retrieved.\n\nIf you attempt to set the length of a CHAR greater than 255, the CREATE\nTABLE or ALTER TABLE statement in which this is done fails with an\nerror:\n\nmysql> CREATE TABLE c1 (col1 INT, col2 CHAR(500));\nERROR 1074 (42000): Column length too big for column \'col\' (max = 255);\nuse BLOB or TEXT instead\nmysql> SHOW CREATE TABLE c1;\nERROR 1146 (42S02): Table \'test.c1\' doesn\'t exist\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html'),
 (405,'UTC_DATE',29,'Syntax:\nUTC_DATE, UTC_DATE()\n\nReturns the current UTC date as a value in \'YYYY-MM-DD\' or YYYYMMDD\nformat, depending on whether the function is used in a string or\nnumeric context.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT UTC_DATE(), UTC_DATE() + 0;\n        -> \'2003-08-14\', 20030814\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (406,'DIMENSION',33,'Dimension(g)\n\nReturns the inherent dimension of the geometry value g. The result can\nbe -1, 0, 1, or 2. The meaning of these values is given in [HELP MBR\ndefinition].\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/general-geometry-property-functions.html\n\n','mysql> SELECT Dimension(GeomFromText(\'LineString(1 1,2 2)\'));\n+------------------------------------------------+\n| Dimension(GeomFromText(\'LineString(1 1,2 2)\')) |\n+------------------------------------------------+\n|                                              1 |\n+------------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/general-geometry-property-functions.html'),
 (407,'COUNT DISTINCT',15,'Syntax:\nCOUNT(DISTINCT expr,[expr...])\n\nReturns a count of the number of different non-NULL values.\n\nCOUNT(DISTINCT) returns 0 if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html\n\n','mysql> SELECT COUNT(DISTINCT results) FROM student;\n','http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html'),
 (408,'BIT',21,'BIT[(M)]\n\nA bit-field type. M indicates the number of bits per value, from 1 to\n64. The default is 1 if M is omitted.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html'),
 (409,'EQUALS',27,'Equals(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially equal to g2.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/functions-that-test-spatial-relationships-between-geometries.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/functions-that-test-spatial-relationships-between-geometries.html'),
 (410,'SHOW CREATE VIEW',25,'Syntax:\nSHOW CREATE VIEW view_name\n\nThis statement shows a CREATE VIEW statement that creates the given\nview.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-create-view.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-create-view.html'),
 (411,'INTERVAL',18,'Syntax:\nINTERVAL(N,N1,N2,N3,...)\n\nReturns 0 if N < N1, 1 if N < N2 and so on or -1 if N is NULL. All\narguments are treated as integers. It is required that N1 < N2 < N3 <\n... < Nn for this function to work correctly. This is because a binary\nsearch is used (very fast).\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html\n\n','mysql> SELECT INTERVAL(23, 1, 15, 17, 30, 44, 200);\n        -> 3\nmysql> SELECT INTERVAL(10, 1, 10, 100, 1000);\n        -> 2\nmysql> SELECT INTERVAL(22, 23, 30, 44, 200);\n        -> 0\n','http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html'),
 (412,'FROM_DAYS',29,'Syntax:\nFROM_DAYS(N)\n\nGiven a day number N, returns a DATE value.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT FROM_DAYS(729669);\n        -> \'1997-10-07\'\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (413,'ALTER PROCEDURE',36,'Syntax:\nALTER {PROCEDURE | FUNCTION} sp_name [characteristic ...]\n\ncharacteristic:\n    { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n  | COMMENT \'string\'\n\nThis statement can be used to change the characteristics of a stored\nprocedure or function. You must have the ALTER ROUTINE privilege for\nthe routine. (That privilege is granted automatically to the routine\ncreator.) If binary logging is enabled, the ALTER FUNCTION statement\nmight also require the SUPER privilege, as described in\nhttp://dev.mysql.com/doc/refman/5.1/en/stored-procedure-logging.html.\n\nMore than one change may be specified in an ALTER PROCEDURE or ALTER\nFUNCTION statement.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/alter-procedure.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/alter-procedure.html'),
 (414,'BIT_COUNT',19,'Syntax:\nBIT_COUNT(N)\n\nReturns the number of bits that are set in the argument N.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/bit-functions.html\n\n','mysql> SELECT BIT_COUNT(29), BIT_COUNT(b\'101010\');\n        -> 4, 3\n','http://dev.mysql.com/doc/refman/5.1/en/bit-functions.html'),
 (415,'OCTET_LENGTH',34,'Syntax:\nOCTET_LENGTH(str)\n\nOCTET_LENGTH() is a synonym for LENGTH().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (416,'UTC_TIMESTAMP',29,'Syntax:\nUTC_TIMESTAMP, UTC_TIMESTAMP()\n\nReturns the current UTC date and time as a value in \'YYYY-MM-DD\nHH:MM:SS\' or YYYYMMDDHHMMSS format, depending on whether the function\nis used in a string or numeric context.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT UTC_TIMESTAMP(), UTC_TIMESTAMP() + 0;\n        -> \'2003-08-14 18:08:04\', 20030814180804\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (417,'+',4,'Syntax:\n+\n\nAddition:\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/arithmetic-functions.html\n\n','mysql> SELECT 3+5;\n        -> 8\n','http://dev.mysql.com/doc/refman/5.1/en/arithmetic-functions.html'),
 (418,'INET_NTOA',14,'Syntax:\nINET_NTOA(expr)\n\nGiven a numeric network address (4 or 8 byte), returns the dotted-quad\nrepresentation of the address as a string.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html\n\n','mysql> SELECT INET_NTOA(3520061480);\n        -> \'209.207.224.40\'\n','http://dev.mysql.com/doc/refman/5.1/en/miscellaneous-functions.html'),
 (419,'ACOS',4,'Syntax:\nACOS(X)\n\nReturns the arc cosine of X, that is, the value whose cosine is X.\nReturns NULL if X is not in the range -1 to 1.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT ACOS(1);\n        -> 0\nmysql> SELECT ACOS(1.0001);\n        -> NULL\nmysql> SELECT ACOS(0);\n        -> 1.5707963267949\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (420,'ISOLATION',8,'Syntax:\nSET [GLOBAL | SESSION] TRANSACTION ISOLATION LEVEL\n{ READ UNCOMMITTED | READ COMMITTED | REPEATABLE READ | SERIALIZABLE }\n\nThis statement sets the transaction isolation level for the next\ntransaction, globally, or for the current session.\n\nThe default behavior of SET TRANSACTION is to set the isolation level\nfor the next (not yet started) transaction. If you use the GLOBAL\nkeyword, the statement sets the default transaction level globally for\nall new connections created from that point on. Existing connections\nare unaffected. You need the SUPER privilege to do this. Using the\nSESSION keyword sets the default transaction level for all future\ntransactions performed on the current connection.\n\nFor descriptions of each InnoDB transaction isolation level, see\nhttp://dev.mysql.com/doc/refman/5.1/en/innodb-transaction-isolation.htm\nl. InnoDB supports each of these levels in MySQL 5.1. The default level\nis REPEATABLE READ.\n\nIn MySQL 5.1, if the READ COMMITTED isolation level is used or the\ninnodb_locks_unsafe_for_binlog system variable is enabled, there is no\nInnoDB gap locking except in constraint checking. Also, record locks\nfor non-matching rows are released after MySQL has evaluated the WHERE\ncondition.\n\nTo set the initial default global isolation level for mysqld, use the\n--transaction-isolation option. See\nhttp://dev.mysql.com/doc/refman/5.1/en/server-options.html.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/set-transaction.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/set-transaction.html'),
 (421,'CEILING',4,'Syntax:\nCEILING(X), CEIL(X)\n\nReturns the smallest integer value not less than X. CEILING() and\nCEIL() are synonymous.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT CEILING(1.23);\n        -> 2\nmysql> SELECT CEIL(-1.23);\n        -> -1\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (422,'SIN',4,'Syntax:\nSIN(X)\n\nReturns the sine of X, where X is given in radians.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT SIN(PI());\n        -> 1.2246063538224e-16\nmysql> SELECT ROUND(SIN(PI()));\n        -> 0\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (423,'DAYOFWEEK',29,'Syntax:\nDAYOFWEEK(date)\n\nReturns the weekday index for date (1 = Sunday, 2 = Monday, ..., 7 =\nSaturday). These index values correspond to the ODBC standard.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT DAYOFWEEK(\'1998-02-03\');\n        -> 3\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (424,'LINEFROMWKB',30,'LineFromWKB(wkb[,srid]), LineStringFromWKB(wkb[,srid])\n\nConstructs a LINESTRING value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-wkb-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-wkb-functions.html'),
 (425,'SHOW PROCESSLIST',25,'Syntax:\nSHOW [FULL] PROCESSLIST\n\nSHOW PROCESSLIST shows you which threads are running. You can also get\nthis information from the INFORMATION_SCHEMA PROCESSLIST table or the\nmysqladmin processlist command. If you have the PROCESS privilege, you\ncan see all threads. Otherwise, you can see only your own threads (that\nis, threads associated with the MySQL account that you are using). If\nyou do not use the FULL keyword, only the first 100 characters of each\nstatement are shown in the Info field.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-processlist.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-processlist.html'),
 (426,'GEOMETRYTYPE',33,'GeometryType(g)\n\nReturns as a string the name of the geometry type of which the geometry\ninstance g is a member. The name corresponds to one of the instantiable\nGeometry subclasses.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/general-geometry-property-functions.html\n\n','mysql> SELECT GeometryType(GeomFromText(\'POINT(1 1)\'));\n+------------------------------------------+\n| GeometryType(GeomFromText(\'POINT(1 1)\')) |\n+------------------------------------------+\n| POINT                                    |\n+------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/general-geometry-property-functions.html'),
 (427,'CREATE VIEW',37,'Syntax:\nCREATE\n    [OR REPLACE]\n    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]\n    [DEFINER = { user | CURRENT_USER }]\n    [SQL SECURITY { DEFINER | INVOKER }]\n    VIEW view_name [(column_list)]\n    AS select_statement\n    [WITH [CASCADED | LOCAL] CHECK OPTION]\n\nThis statement creates a new view, or replaces an existing one if the\nOR REPLACE clause is given. If the view does not exist, CREATE OR\nREPLACE VIEW is the same as CREATE VIEW. If the view does exist, CREATE\nOR REPLACE VIEW is the same as ALTER VIEW. The select_statement is a\nSELECT statement that provides the definition of the view. The\nstatement can select from base tables or other views.\n\nThis statement requires the CREATE VIEW privilege for the view, and\nsome privilege for each column selected by the SELECT statement. For\ncolumns used elsewhere in the SELECT statement you must have the SELECT\nprivilege. If the OR REPLACE clause is present, you must also have the\nDROP privilege for the view.\n\nA view belongs to a database. By default, a new view is created in the\ndefault database. To create the view explicitly in a given database,\nspecify the name as db_name.view_name when you create it.\n\nmysql> CREATE VIEW test.v AS SELECT * FROM t;\n\nBase tables and views share the same namespace within a database, so a\ndatabase cannot contain a base table and a view that have the same\nname.\n\nViews must have unique column names with no duplicates, just like base\ntables. By default, the names of the columns retrieved by the SELECT\nstatement are used for the view column names. To define explicit names\nfor the view columns, the optional column_list clause can be given as a\nlist of comma-separated identifiers. The number of names in column_list\nmust be the same as the number of columns retrieved by the SELECT\nstatement.\n\nColumns retrieved by the SELECT statement can be simple references to\ntable columns. They can also be expressions that use functions,\nconstant values, operators, and so forth.\n\nUnqualified table or view names in the SELECT statement are interpreted\nwith respect to the default database. A view can refer to tables or\nviews in other databases by qualifying the table or view name with the\nproper database name.\n\nA view can be created from many kinds of SELECT statements. It can\nrefer to base tables or other views. It can use joins, UNION, and\nsubqueries. The SELECT need not even refer to any tables. The following\nexample defines a view that selects two columns from another table, as\nwell as an expression calculated from those columns:\n\nmysql> CREATE TABLE t (qty INT, price INT);\nmysql> INSERT INTO t VALUES(3, 50);\nmysql> CREATE VIEW v AS SELECT qty, price, qty*price AS value FROM t;\nmysql> SELECT * FROM v;\n+------+-------+-------+\n| qty  | price | value |\n+------+-------+-------+\n|    3 |    50 |   150 |\n+------+-------+-------+\n\nA view definition is subject to the following restrictions:\n\no The SELECT statement cannot contain a subquery in the FROM clause.\n\no The SELECT statement cannot refer to system or user variables.\n\no The SELECT statement cannot refer to prepared statement parameters.\n\no Within a stored routine, the definition cannot refer to routine\n  parameters or local variables.\n\no Any table or view referred to in the definition must exist. However,\n  after a view has been created, it is possible to drop a table or view\n  that the definition refers to. In this case, use of the view results\n  in an error. To check a view definition for problems of this kind,\n  use the CHECK TABLE statement.\n\no The definition cannot refer to a TEMPORARY table, and you cannot\n  create a TEMPORARY view.\n\no The tables named in the view definition must already exist.\n\no You cannot associate a trigger with a view.\n\nORDER BY is allowed in a view definition, but it is ignored if you\nselect from a view using a statement that has its own ORDER BY.\n\nFor other options or clauses in the definition, they are added to the\noptions or clauses of the statement that references the view, but the\neffect is undefined. For example, if a view definition includes a LIMIT\nclause, and you select from the view using a statement that has its own\nLIMIT clause, it is undefined which limit applies. This same principle\napplies to options such as ALL, DISTINCT, or SQL_SMALL_RESULT that\nfollow the SELECT keyword, and to clauses such as INTO, FOR UPDATE,\nLOCK IN SHARE MODE, and PROCEDURE.\n\nIf you create a view and then change the query processing environment\nby changing system variables, that may affect the results that you get\nfrom the view:\n\nmysql> CREATE VIEW v (mycol) AS SELECT \'abc\';\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> SET sql_mode = \'\';\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT \"mycol\" FROM v;\n+-------+\n| mycol |\n+-------+\n| mycol | \n+-------+\n1 row in set (0.01 sec)\n\nmysql> SET sql_mode = \'ANSI_QUOTES\';\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT \"mycol\" FROM v;\n+-------+\n| mycol |\n+-------+\n| abc   | \n+-------+\n1 row in set (0.00 sec)\n\nThe DEFINER and SQL SECURITY clauses specify the security context to be\nused when checking access privileges at view invocation time. They were\naddded in MySQL 5.1.2.\n\nCURRENT_USER also can be given as CURRENT_USER().\n\nWithin a stored routine that is defined with the SQL SECURITY DEFINER\ncharacteristic, CURRENT_USER returns the routine creator. This also\naffects a view defined within such a routine, if the view definition\ncontains a DEFINER value of CURRENT_USER.\n\nThe default DEFINER value is the user who executes the CREATE VIEW\nstatement. (This is the same as DEFINER = CURRENT_USER.) If a user\nvalue is given, it should be a MySQL account in \'user_name\'@\'host_name\'\nformat (the same format used in the GRANT statement). The user_name and\nhost_name values both are required.\n\nIf you specify the DEFINER clause, you cannot set the value to any user\nbut your own unless you have the SUPER privilege. These rules determine\nthe legal DEFINER user values:\n\no If you do not have the SUPER privilege, the only legal user value is\n  your own account, either specified literally or by using\n  CURRENT_USER. You cannot set the definer to some other account.\n\no If you have the SUPER privilege, you can specify any syntactically\n  legal account name. If the account does not actually exist, a warning\n  is generated.\n\nThe SQL SECURITY characteristic determines which MySQL account to use\nwhen checking access privileges for the view when the view is executed.\nThe legal characteristic values are DEFINER and INVOKER. These indicate\nthat the view must be executable by the user who defined it or invoked\nit, respectively. The default SQL SECURITY value is DEFINER.\n\nAs of MySQL 5.1.2 (when the DEFINER and SQL SECURITY clauses were\nimplemented), view privileges are checked like this:\n\no At view definition time, the view creator must have the privileges\n  needed to use the top-level objects accessed by the view. For\n  example, if the view definition refers to a stored function, only the\n  privileges needed to invoke the function can be checked. The\n  privileges required when the function runs can be checked only as it\n  executes: For different invocations of the function, different\n  execution paths within the function might be taken.\n\no At view execution time, privileges for objects accessed by the view\n  are checked against the privileges held by the view creator or\n  invoker, depending on whether the SQL SECURITY characteristic is\n  DEFINER or INVOKER, respectively.\n\no If view execution causes execution of a stored function, privilege\n  checking for statements executed within the function depend on\n  whether the function is defined with a SQL SECURITY characteristic of\n  DEFINER or INVOKER. If the security characteristic is DEFINER, the\n  function runs with the privileges of its creator. If the\n  characteristic is INVOKER, the function runs with the privileges\n  determined by the view\'s SQL SECURITY characteristic.\n\nPrior to MySQL 5.1.2 (before the DEFINER and SQL SECURITY clauses were\nimplemented), privileges required for objects used in a view are\nchecked at view creation time.\n\nExample: A view might depend on a stored function, and that function\nmight invoke other stored routines. For example, the following view\ninvokes a stored function f():\n\nCREATE VIEW v AS SELECT * FROM t WHERE t.id = f(t.name);\n\nSuppose that f() contains a statement such as this:\n\nIF name IS NULL then\n  CALL p1();\nELSE\n  CALL p2();\nEND IF;\n\nThe privileges required for executing statements within f() need to be\nchecked when f() executes. This might mean that privileges are needed\nfor p1() or p2(), depending on the execution path within f(). Those\nprivileges need to be checked at runtime, and the user who must possess\nthe privileges is determined by the SQL SECURITY values of the function\nf() and the view v.\n\nThe DEFINER and SQL SECURITY clauses for views are extensions to\nstandard SQL. In standard SQL, views are handled using the rules for\nSQL SECURITY INVOKER.\n\nIf you invoke a view that was created before MySQL 5.0.13/5.1.2, it is\ntreated as though it was created with a SQL SECURITY DEFINER clause and\nwith a DEFINER value that is the same as your account. However, because\nthe actual definer is unknown, MySQL issues a warning. To make the\nwarning go away, it is sufficient to re-create the view so that the\nview definition includes a DEFINER clause.\n\nThe optional ALGORITHM clause is a MySQL extension to standard SQL.\nALGORITHM takes three values: MERGE, TEMPTABLE, or UNDEFINED. The\ndefault algorithm is UNDEFINED if no ALGORITHM clause is present. The\nalgorithm affects how MySQL processes the view.\n\nFor MERGE, the text of a statement that refers to the view and the view\ndefinition are merged such that parts of the view definition replace\ncorresponding parts of the statement.\n\nFor TEMPTABLE, the results from the view are retrieved into a temporary\ntable, which then is used to execute the statement.\n\nFor UNDEFINED, MySQL chooses which algorithm to use. It prefers MERGE\nover TEMPTABLE if possible, because MERGE is usually more efficient and\nbecause a view cannot be updatable if a temporary table is used.\n\nA reason to choose TEMPTABLE explicitly is that locks can be released\non underlying tables after the temporary table has been created and\nbefore it is used to finish processing the statement. This might result\nin quicker lock release than the MERGE algorithm so that other clients\nthat use the view are not blocked as long.\n\nA view algorithm can be UNDEFINED for three reasons:\n\no No ALGORITHM clause is present in the CREATE VIEW statement.\n\no The CREATE VIEW statement has an explicit ALGORITHM = UNDEFINED\n  clause.\n\no ALGORITHM = MERGE is specified for a view that can be processed only\n  with a temporary table. In this case, MySQL generates a warning and\n  sets the algorithm to UNDEFINED.\n\nAs mentioned earlier, MERGE is handled by merging corresponding parts\nof a view definition into the statement that refers to the view. The\nfollowing examples briefly illustrate how the MERGE algorithm works.\nThe examples assume that there is a view v_merge that has this\ndefinition:\n\nCREATE ALGORITHM = MERGE VIEW v_merge (vc1, vc2) AS\nSELECT c1, c2 FROM t WHERE c3 > 100;\n\nExample 1: Suppose that we issue this statement:\n\nSELECT * FROM v_merge;\n\nMySQL handles the statement as follows:\n\no v_merge becomes t\n\no * becomes vc1, vc2, which corresponds to c1, c2\n\no The view WHERE clause is added\n\nThe resulting statement to be executed becomes:\n\nSELECT c1, c2 FROM t WHERE c3 > 100;\n\nExample 2: Suppose that we issue this statement:\n\nSELECT * FROM v_merge WHERE vc1 < 100;\n\nThis statement is handled similarly to the previous one, except that\nvc1 < 100 becomes c1 < 100 and the view WHERE clause is added to the\nstatement WHERE clause using an AND connective (and parentheses are\nadded to make sure the parts of the clause are executed with correct\nprecedence). The resulting statement to be executed becomes:\n\nSELECT c1, c2 FROM t WHERE (c3 > 100) AND (c1 < 100);\n\nEffectively, the statement to be executed has a WHERE clause of this\nform:\n\nWHERE (select WHERE) AND (view WHERE)\n\nThe MERGE algorithm requires a one-to-one relationship between the rows\nin the view and the rows in the underlying table. If this relationship\ndoes not hold, a temporary table must be used instead. Lack of a\none-to-one relationship occurs if the view contains any of a number of\nconstructs:\n\no Aggregate functions (SUM(), MIN(), MAX(), COUNT(), and so forth)\n\no DISTINCT\n\no GROUP BY\n\no HAVING\n\no UNION or UNION ALL\n\no Subquery in the select list\n\no Refers only to literal values (in this case, there is no underlying\n  table)\n\nSome views are updatable. That is, you can use them in statements such\nas UPDATE, DELETE, or INSERT to update the contents of the underlying\ntable. For a view to be updatable, there must be a one-to-one\nrelationship between the rows in the view and the rows in the\nunderlying table. There are also certain other constructs that make a\nview non-updatable. To be more specific, a view is not updatable if it\ncontains any of the following:\n\no Aggregate functions (SUM(), MIN(), MAX(), COUNT(), and so forth)\n\no DISTINCT\n\no GROUP BY\n\no HAVING\n\no UNION or UNION ALL\n\no Subquery in the select list\n\no Certain joins (see additional join discussion later in this section)\n\no Non-updatable view in the FROM clause\n\no A subquery in the WHERE clause that refers to a table in the FROM\n  clause\n\no Refers only to literal values (in this case, there is no underlying\n  table to update)\n\no ALGORITHM = TEMPTABLE (use of a temporary table always makes a view\n  non-updatable)\n\nWith respect to insertability (being updatable with INSERT statements),\nan updatable view is insertable if it also satisfies these additional\nrequirements for the view columns:\n\no There must be no duplicate view column names.\n\no The view must contain all columns in the base table that do not have\n  a default value.\n\no The view columns must be simple column references and not derived\n  columns. A derived column is one that is not a simple column\n  reference but is derived from an expression. These are examples of\n  derived columns:\n\n3.14159\ncol1 + 3\nUPPER(col2)\ncol3 / col4\n(subquery)\n\nA view that has a mix of simple column references and derived columns\nis not insertable, but it can be updatable if you update only those\ncolumns that are not derived. Consider this view:\n\nCREATE VIEW v AS SELECT col1, 1 AS col2 FROM t;\n\nThis view is not insertable because col2 is derived from an expression.\nBut it is updatable if the update does not try to update col2. This\nupdate is allowable:\n\nUPDATE v SET col1 = 0;\n\nThis update is not allowable because it attempts to update a derived\ncolumn:\n\nUPDATE v SET col2 = 0;\n\nIt is sometimes possible for a multiple-table view to be updatable,\nassuming that it can be processed with the MERGE algorithm. For this to\nwork, the view must use an inner join (not an outer join or a UNION).\nAlso, only a single table in the view definition can be updated, so the\nSET clause must name only columns from one of the tables in the view.\nViews that use UNION ALL are disallowed even though they might be\ntheoretically updatable, because the implementation uses temporary\ntables to process them.\n\nFor a multiple-table updatable view, INSERT can work if it inserts into\na single table. DELETE is not supported.\n\nINSERT DELAYED is not supported for views.\n\nIf a table contains an AUTO_INCREMENT column, inserting into an\ninsertable view on the table that does not include the AUTO_INCREMENT\ncolumn does not change the value of LAST_INSERT_ID(), because the side\neffects of inserting default values into columns not part of the view\nshould not be visible.\n\nThe WITH CHECK OPTION clause can be given for an updatable view to\nprevent inserts or updates to rows except those for which the WHERE\nclause in the select_statement is true.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/create-view.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/create-view.html'),
 (428,'TRIM',34,'Syntax:\nTRIM([{BOTH | LEADING | TRAILING} [remstr] FROM] str), TRIM([remstr\nFROM] str)\n\nReturns the string str with all remstr prefixes or suffixes removed. If\nnone of the specifiers BOTH, LEADING, or TRAILING is given, BOTH is\nassumed. remstr is optional and, if not specified, spaces are removed.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT TRIM(\'  bar   \');\n        -> \'bar\'\nmysql> SELECT TRIM(LEADING \'x\' FROM \'xxxbarxxx\');\n        -> \'barxxx\'\nmysql> SELECT TRIM(BOTH \'x\' FROM \'xxxbarxxx\');\n        -> \'bar\'\nmysql> SELECT TRIM(TRAILING \'xyz\' FROM \'barxxyz\');\n        -> \'barx\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html');
INSERT INTO `help_topic` (`help_topic_id`,`name`,`help_category_id`,`description`,`example`,`url`) VALUES 
 (429,'IS',18,'Syntax:\nIS boolean_value, IS NOT boolean_value\n\nTests a value against a boolean value, where boolean_value can be TRUE,\nFALSE, or UNKNOWN.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html\n\n','mysql> SELECT 1 IS TRUE, 0 IS FALSE, NULL IS UNKNOWN;\n        -> 1, 1, 1\nmysql> SELECT 1 IS NOT UNKNOWN, 0 IS NOT UNKNOWN, NULL IS NOT UNKNOWN;\n        -> 1, 1, 0\n','http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html'),
 (430,'GET_FORMAT',29,'Syntax:\nGET_FORMAT(DATE|TIME|DATETIME, \'EUR\'|\'USA\'|\'JIS\'|\'ISO\'|\'INTERNAL\')\n\nReturns a format string. This function is useful in combination with\nthe DATE_FORMAT() and the STR_TO_DATE() functions.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT DATE_FORMAT(\'2003-10-03\',GET_FORMAT(DATE,\'EUR\'));\n        -> \'03.10.2003\'\nmysql> SELECT STR_TO_DATE(\'10.31.2003\',GET_FORMAT(DATE,\'USA\'));\n        -> \'2003-10-31\'\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (431,'TINYBLOB',21,'TINYBLOB\n\nA BLOB column with a maximum length of 255 (28 - 1) bytes.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html'),
 (432,'SAVEPOINT',8,'Syntax:\nSAVEPOINT identifier\nROLLBACK [WORK] TO SAVEPOINT identifier\nRELEASE SAVEPOINT identifier\n\nInnoDB supports the SQL statements SAVEPOINT, ROLLBACK TO SAVEPOINT,\nRELEASE SAVEPOINT and the optional WORK keyword for ROLLBACK.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/savepoints.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/savepoints.html'),
 (433,'USER',16,'Syntax:\nUSER()\n\nReturns the current MySQL username and hostname as a string in the utf8\ncharacter set.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/information-functions.html\n\n','mysql> SELECT USER();\n        -> \'davida@localhost\'\n','http://dev.mysql.com/doc/refman/5.1/en/information-functions.html'),
 (434,'MPOINTFROMWKB',30,'MPointFromWKB(wkb[,srid]), MultiPointFromWKB(wkb[,srid])\n\nConstructs a MULTIPOINT value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-wkb-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-wkb-functions.html'),
 (435,'ALTER TABLE',37,'Syntax:\nALTER [ONLINE] [IGNORE] TABLE tbl_name\n    alter_specification [, alter_specification] ...\n\nalter_specification:\n    table_option ...\n  | ADD [COLUMN] column_definition [FIRST | AFTER col_name ]\n  | ADD [COLUMN] (column_definition,...)\n  | ADD {INDEX|KEY} [index_name] [index_type] (index_col_name,...)\n  | ADD [CONSTRAINT [symbol]]\n        PRIMARY KEY [index_type] (index_col_name,...)\n  | ADD [CONSTRAINT [symbol]]\n        UNIQUE [INDEX|KEY] [index_name] [index_type] (index_col_name,...)\n  | ADD FULLTEXT [INDEX|KEY] [index_name] (index_col_name,...)\n      [WITH PARSER parser_name]\n  | ADD SPATIAL [INDEX|KEY] [index_name] (index_col_name,...)\n  | ADD [CONSTRAINT [symbol]]\n        FOREIGN KEY [index_name] (index_col_name,...)\n        [reference_definition]\n  | ALTER [COLUMN] col_name {SET DEFAULT literal | DROP DEFAULT}\n  | CHANGE [COLUMN] old_col_name column_definition\n        [FIRST|AFTER col_name]\n  | MODIFY [COLUMN] column_definition [FIRST | AFTER col_name]\n  | DROP [COLUMN] col_name\n  | DROP PRIMARY KEY\n  | DROP {INDEX|KEY} index_name\n  | DROP FOREIGN KEY fk_symbol\n  | DISABLE KEYS\n  | ENABLE KEYS\n  | RENAME [TO] new_tbl_name\n  | ORDER BY col_name [, col_name] ...\n  | CONVERT TO CHARACTER SET charset_name [COLLATE collation_name]\n  | [DEFAULT] CHARACTER SET charset_name [COLLATE collation_name]\n  | DISCARD TABLESPACE\n  | IMPORT TABLESPACE\n  | PARTITION BY partition_options\n  | ADD PARTITION (partition_definition)\n  | DROP PARTITION partition_names\n  | COALESCE PARTITION number\n  | REORGANIZE PARTITION partition_names INTO (partition_definitions)\n  | ANALYZE PARTITION partition_names\n  | CHECK PARTITION partition_names\n  | OPTIMIZE PARTITION partition_names\n  | REBUILD PARTITION partition_names\n  | REPAIR PARTITION partition_names\n  | REMOVE PARTITIONING\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_type:\n    USING {BTREE | HASH}\n\nALTER TABLE enables you to change the structure of an existing table.\nFor example, you can add or delete columns, create or destroy indexes,\nchange the type of existing columns, or rename columns or the table\nitself. You can also change the comment for the table and type of the\ntable.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/alter-table.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/alter-table.html'),
 (436,'PURGE MASTER LOGS',25,'Syntax:\nPURGE {MASTER | BINARY} LOGS TO \'log_name\'\nPURGE {MASTER | BINARY} LOGS BEFORE \'date\'\n\nDeletes all the binary logs listed in the log index prior to the\nspecified log or date. The logs also are removed from the list recorded\nin the log index file, so that the given log becomes the first.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/purge-master-logs.html\n\n','PURGE MASTER LOGS TO \'mysql-bin.010\';\nPURGE MASTER LOGS BEFORE \'2003-04-02 22:46:26\';\n','http://dev.mysql.com/doc/refman/5.1/en/purge-master-logs.html'),
 (437,'CHAR BYTE',21,'The CHAR BYTE data type is an alias for the BINARY data type. This is a\ncompatibility feature.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html'),
 (438,'REPAIR TABLE',20,'Syntax:\nREPAIR [LOCAL | NO_WRITE_TO_BINLOG] TABLE\n    tbl_name [, tbl_name] ... [QUICK] [EXTENDED] [USE_FRM]\n\nREPAIR TABLE repairs a possibly corrupted table. By default, it has the\nsame effect as myisamchk --recover tbl_name. REPAIR TABLE works for\nMyISAM and for ARCHIVE tables. Starting with MySQL 5.1.9, REPAIR is\nalso valid for CSV tables. See\nhttp://dev.mysql.com/doc/refman/5.1/en/myisam-storage-engine.html, and\nhttp://dev.mysql.com/doc/refman/5.1/en/archive-storage-engine.html, and\nhttp://dev.mysql.com/doc/refman/5.1/en/csv-storage-engine.html\n\nThis statement requires SELECT and INSERT privileges for the table.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/repair-table.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/repair-table.html'),
 (439,'MERGE',37,'The MERGE storage engine, also known as the MRG_MyISAM engine, is a\ncollection of identical MyISAM tables that can be used as one.\n\"Identical\" means that all tables have identical column and index\ninformation. You cannot merge MyISAM tables in which the columns are\nlisted in a different order, do not have exactly the same columns, or\nhave the indexes in different order. However, any or all of the MyISAM\ntables can be compressed with myisampack. See\nhttp://dev.mysql.com/doc/refman/5.1/en/myisampack.html. Differences in\ntable options such as AVG_ROW_LENGTH, MAX_ROWS, or PACK_KEYS do not\nmatter.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/merge-storage-engine.html\n\n','mysql> CREATE TABLE t1 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nmysql> CREATE TABLE t2 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nmysql> INSERT INTO t1 (message) VALUES (\'Testing\'),(\'table\'),(\'t1\');\nmysql> INSERT INTO t2 (message) VALUES (\'Testing\'),(\'table\'),(\'t2\');\nmysql> CREATE TABLE total (\n    ->    a INT NOT NULL AUTO_INCREMENT,\n    ->    message CHAR(20), INDEX(a))\n    ->    ENGINE=MERGE UNION=(t1,t2) INSERT_METHOD=LAST;\n','http://dev.mysql.com/doc/refman/5.1/en/merge-storage-engine.html'),
 (440,'CREATE TABLE',37,'Syntax:\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    (create_definition,...)\n    [table_option ...]\n    [partition_options]\n\nOr:\n\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    [(create_definition,...)]\n    [table_option ...]\n    [PARTITION BY partition_options]\n    select_statement\n\nOr:\n\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    { LIKE old_tbl_name | (LIKE old_tbl_name) }\n\ncreate_definition:\n    column_definition\n  | [CONSTRAINT [symbol]] PRIMARY KEY [index_type] (index_col_name,...)\n      [index_option ...]\n  | {INDEX|KEY} [index_name] [index_type] (index_col_name,...)\n      [index_option ...]\n  | [CONSTRAINT [symbol]] UNIQUE [INDEX|KEY]\n      [index_name] [index_type] (index_col_name,...)\n      [index_option ...]\n  | {FULLTEXT|SPATIAL} [INDEX|KEY] [index_name] (index_col_name,...)\n      [index_option ...]\n  | [CONSTRAINT [symbol]] FOREIGN KEY\n      [index_name] (index_col_name,...) [reference_definition]\n  | CHECK (expr)\n\ncolumn_definition:\n    col_name data_type [NOT NULL | NULL] [DEFAULT default_value]\n      [AUTO_INCREMENT] [UNIQUE [KEY] | [PRIMARY] KEY]\n      [COMMENT \'string\'] [reference_definition]\n      [COLUMN_FORMAT {FIXED|DYNAMIC|DEFAULT}]\n      [STORAGE {DISK|MEMORY}]\n\ndata_type:\n    BIT[(length)]\n  | TINYINT[(length)] [UNSIGNED] [ZEROFILL]\n  | SMALLINT[(length)] [UNSIGNED] [ZEROFILL]\n  | MEDIUMINT[(length)] [UNSIGNED] [ZEROFILL]\n  | INT[(length)] [UNSIGNED] [ZEROFILL]\n  | INTEGER[(length)] [UNSIGNED] [ZEROFILL]\n  | BIGINT[(length)] [UNSIGNED] [ZEROFILL]\n  | REAL[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | DOUBLE[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | FLOAT[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | DECIMAL(length,decimals) [UNSIGNED] [ZEROFILL]\n  | NUMERIC(length,decimals) [UNSIGNED] [ZEROFILL]\n  | DATE\n  | TIME\n  | TIMESTAMP\n  | DATETIME\n  | YEAR\n  | CHAR(length)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | VARCHAR(length)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | BINARY(length)\n  | VARBINARY(length)\n  | TINYBLOB\n  | BLOB\n  | MEDIUMBLOB\n  | LONGBLOB\n  | TINYTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | TEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | MEDIUMTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | LONGTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | ENUM(value1,value2,value3,...)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | SET(value1,value2,value3,...)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | spatial_type\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_type:\n    USING {BTREE | HASH | RTREE}\n\nindex_option:\n    KEY_BLOCK_SIZE value\n  | index_type\n  | WITH PARSER parser_name\n\nreference_definition:\n    REFERENCES tbl_name [(index_col_name,...)]\n      [MATCH FULL | MATCH PARTIAL | MATCH SIMPLE]\n      [ON DELETE reference_option]\n      [ON UPDATE reference_option]\n\nreference_option:\n    RESTRICT | CASCADE | SET NULL | NO ACTION\n\ntable_option:\n    [TABLESPACE tablespace_name STORAGE DISK]\n    ENGINE [=] engine_name\n  | AUTO_INCREMENT [=] value\n  | AVG_ROW_LENGTH [=] value\n  | [DEFAULT] CHARACTER SET charset_name\n  | CHECKSUM [=] {0 | 1}\n  | COLLATE collation_name\n  | COMMENT [=] \'string\'\n  | CONNECTION [=] \'connect_string\'\n  | DATA DIRECTORY [=] \'absolute path to directory\'\n  | DELAY_KEY_WRITE [=] {0 | 1}\n  | INDEX DIRECTORY [=] \'absolute path to directory\'\n  | INSERT_METHOD [=] { NO | FIRST | LAST }\n  | KEY_BLOCK_SIZE [=] value\n  | MAX_ROWS [=] value\n  | MIN_ROWS [=] value\n  | PACK_KEYS [=] {0 | 1 | DEFAULT}\n  | PASSWORD [=] \'string\'\n  | ROW_FORMAT [=] {DEFAULT|DYNAMIC|FIXED|COMPRESSED|REDUNDANT|COMPACT}\n  | UNION [=] (tbl_name[,tbl_name]...)\n\npartition_options:\n          [LINEAR] HASH(expr)\n        | [LINEAR] KEY(column_list)\n        | RANGE(expr)\n        | LIST(expr)\n    [PARTITIONS num]\n    [SUBPARTITION BY\n          [LINEAR] HASH(expr)\n        | [LINEAR] KEY(column_list)\n      [SUBPARTITIONS num]\n    ]\n    [(partition_definition [, partition_definition] ...)]\n\npartition_definition:\n    PARTITION partition_name\n        [VALUES {LESS THAN (expr) | MAXVALUE | IN (value_list)}]\n        [[STORAGE] ENGINE [=] engine_name]\n        [COMMENT [=] \'comment_text\' ]\n        [DATA DIRECTORY [=] \'data_dir\']\n        [INDEX DIRECTORY [=] \'index_dir\']\n        [MAX_ROWS [=] max_number_of_rows]\n        [MIN_ROWS [=] min_number_of_rows]\n        [TABLESPACE [=] (tablespace_name)]\n        [NODEGROUP [=] node_group_id]\n        [(subpartition_definition [, subpartition_definition] ...)]\n\nsubpartition_definition:\n    SUBPARTITION logical_name\n        [[STORAGE] ENGINE [=] engine_name]\n        [COMMENT [=] \'comment_text\' ]\n        [DATA DIRECTORY [=] \'data_dir\']\n        [INDEX DIRECTORY [=] \'index_dir\']\n        [MAX_ROWS [=] max_number_of_rows]\n        [MIN_ROWS [=] min_number_of_rows]\n        [TABLESPACE [=] (tablespace_name)]\n        [NODEGROUP [=] node_group_id]\n\nselect_statement:\n    [IGNORE | REPLACE] [AS] SELECT ...   (Some legal select statement)\n\nCREATE TABLE creates a table with the given name. You must have the\nCREATE privilege for the table.\n\nRules for allowable table names are given in\nhttp://dev.mysql.com/doc/refman/5.1/en/identifiers.html. By default,\nthe table is created in the default database. An error occurs if the\ntable exists, if there is no default database, or if the database does\nnot exist.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/create-table.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/create-table.html'),
 (441,'>',18,'Syntax:\n>\n\nGreater than:\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html\n\n','mysql> SELECT 2 > 2;\n        -> 0\n','http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html'),
 (442,'ANALYZE TABLE',20,'Syntax:\nANALYZE [LOCAL | NO_WRITE_TO_BINLOG] TABLE tbl_name [, tbl_name] ...\n\nANALYZE TABLE analyzes and stores the key distribution for a table.\nDuring the analysis, the table is locked with a read lock for MyISAM.\nFor InnoDB the table is locked with a write lock. This statement works\nwith MyISAM, and InnoDB tables. For MyISAM tables, this statement is\nequivalent to using myisamchk --analyze.\n\nFor more information on how the analysis works withinInnoDB, see\nhttp://dev.mysql.com/doc/refman/5.1/en/innodb-restrictions.html.\n\nMySQL uses the stored key distribution to decide the order in which\ntables should be joined when you perform a join on something other than\na constant.\n\nThis statement requires SELECT and INSERT privileges for the table.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/analyze-table.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/analyze-table.html'),
 (443,'MICROSECOND',29,'Syntax:\nMICROSECOND(expr)\n\nReturns the microseconds from the time or datetime expression expr as a\nnumber in the range from 0 to 999999.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT MICROSECOND(\'12:00:00.123456\');\n        -> 123456\nmysql> SELECT MICROSECOND(\'1997-12-31 23:59:59.000010\');\n        -> 10\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (444,'CONSTRAINT',37,'InnoDB also supports foreign key constraints. The syntax for a foreign\nkey constraint definition in InnoDB looks like this:\n\n[CONSTRAINT symbol] FOREIGN KEY [id] (index_col_name, ...)\n    REFERENCES tbl_name (index_col_name, ...)\n    [ON DELETE {RESTRICT | CASCADE | SET NULL | NO ACTION}]\n    [ON UPDATE {RESTRICT | CASCADE | SET NULL | NO ACTION}]\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/innodb-foreign-key-constraints.html\n\n','CREATE TABLE product (category INT NOT NULL, id INT NOT NULL,\n                      price DECIMAL,\n                      PRIMARY KEY(category, id)) ENGINE=INNODB;\nCREATE TABLE customer (id INT NOT NULL,\n                       PRIMARY KEY (id)) ENGINE=INNODB;\nCREATE TABLE product_order (no INT NOT NULL AUTO_INCREMENT,\n                            product_category INT NOT NULL,\n                            product_id INT NOT NULL,\n                            customer_id INT NOT NULL,\n                            PRIMARY KEY(no),\n                            INDEX (product_category, product_id),\n                            FOREIGN KEY (product_category, product_id)\n                              REFERENCES product(category, id)\n                              ON UPDATE CASCADE ON DELETE RESTRICT,\n                            INDEX (customer_id),\n                            FOREIGN KEY (customer_id)\n                              REFERENCES customer(id)) ENGINE=INNODB;\n','http://dev.mysql.com/doc/refman/5.1/en/innodb-foreign-key-constraints.html'),
 (445,'CREATE SERVER',37,'Syntax:\nCREATE SERVER server_name\n    FOREIGN DATA WRAPPER wrapper_name\n    OPTIONS (option ...)\n\noption:\n  { HOST character-literal\n  | DATABASE character-literal\n  | USER character-literal\n  | PASSWORD character-literal\n  | SOCKET character-literal\n  | OWNER character-literal\n  | PORT numeric-literal }\n\nThis statement creates the definition of a server for use with the\nFEDERATED storage engine. The CREATE SERVER statement creates a new row\nwithin the servers table within the mysql database. This statement\nrequires the SUPER privilege.\n\nThe server_name should be a unique reference to the server. Server\ndefinitions are global within the scope of the server, it is not\npossible to qualify the server definition to a specific database.\nserver_name has a maximum length of 63 characters (names longer than 63\ncharacters are silently truncated), and is case insensitive. You may\nspecify the name using single quotes.\n\nThe wrapper_name should be mysql, and may be quoted with single quotes.\nOther values for wrapper_name are not currently supported.\n\nFor each option you must specify either a character literal or numeric\nliteral. Character literals are UTF8, support a maximum length of 64\ncharacters and default to a blank (empty) string. String literals are\nsilently truncated to 64 characters. Numeric literals must be a number\nbetween 0 and 9999, default value is 0.\n\nThe CREATE SERVER statement creates an entry in the mysql.server table\nthat can later be used with the CREATE TABLE statement when creating a\nFEDERATED table. The options that you specify will be used to populate\nthe columns in the mysql.server table. The table columns are\nServer_name, Host, Db, Username, Password, Port and Socket.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/create-server.html\n\n','CREATE SERVER s\nFOREIGN DATA WRAPPER mysql\nOPTIONS (USER \'Remote\', HOST \'192.168.1.106\', DATABASE \'test\');\n','http://dev.mysql.com/doc/refman/5.1/en/create-server.html'),
 (446,'FIELD',34,'Syntax:\nFIELD(str,str1,str2,str3,...)\n\nReturns the index (position) of str in the str1, str2, str3, ... list.\nReturns 0 if str is not found.\n\nIf all arguments to FIELD() are strings, all arguments are compared as\nstrings. If all arguments are numbers, they are compared as numbers.\nOtherwise, the arguments are compared as double.\n\nIf str is NULL, the return value is 0 because NULL fails equality\ncomparison with any value. FIELD() is the complement of ELT().\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT FIELD(\'ej\', \'Hej\', \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> 2\nmysql> SELECT FIELD(\'fo\', \'Hej\', \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> 0\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (447,'MAKETIME',29,'Syntax:\nMAKETIME(hour,minute,second)\n\nReturns a time value calculated from the hour, minute, and second\narguments.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT MAKETIME(12,15,30);\n        -> \'12:15:30\'\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (448,'CURDATE',29,'Syntax:\nCURDATE()\n\nReturns the current date as a value in \'YYYY-MM-DD\' or YYYYMMDD format,\ndepending on whether the function is used in a string or numeric\ncontext.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT CURDATE();\n        -> \'1997-12-15\'\nmysql> SELECT CURDATE() + 0;\n        -> 19971215\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (449,'MIN MAX',15,'Syntax:\nMIN([DISTINCT] expr), MAX([DISTINCT] expr)\n\nReturns the minimum or maximum value of expr. MIN() and MAX() may take\na string argument; in such cases they return the minimum or maximum\nstring value. See\nhttp://dev.mysql.com/doc/refman/5.1/en/mysql-indexes.html. The DISTINCT\nkeyword can be used to find the minimum or maximum of the distinct\nvalues of expr, however, this produces the same result as omitting\nDISTINCT.\n\nMIN() and MAX() return NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html\n\n','mysql> SELECT student_name, MIN(test_score), MAX(test_score)\n    ->        FROM student\n    ->        GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.1/en/group-by-functions.html'),
 (450,'SET PASSWORD',9,'Syntax:\nSET PASSWORD [FOR user] = PASSWORD(\'some password\')\n\nThe SET PASSWORD statement assigns a password to an existing MySQL user\naccount.\n\nWith no FOR clause, this statement sets the password for the current\nuser. Any client that has connected to the server using a non-anonymous\naccount can change the password for that account.\n\nWith a FOR clause, this statement sets the password for a specific\naccount on the current server host. Only clients that have the UPDATE\nprivilege for the mysql database can do this. The user value should be\ngiven in user_name@host_name format, where user_name and host_name are\nexactly as they are listed in the User and Host columns of the\nmysql.user table entry. For example, if you had an entry with User and\nHost column values of \'bob\' and \'%.loc.gov\', you would write the\nstatement like this:\n\nSET PASSWORD FOR \'bob\'@\'%.loc.gov\' = PASSWORD(\'newpass\');\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/set-password.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/set-password.html'),
 (451,'ENUM',21,'ENUM(\'value1\',\'value2\',...) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nAn enumeration. A string object that can have only one value, chosen\nfrom the list of values \'value1\', \'value2\', ..., NULL or the special \'\'\nerror value. An ENUM column can have a maximum of 65,535 distinct\nvalues. ENUM values are represented internally as integers.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html'),
 (452,'IF FUNCTION',7,'Syntax:\nIF(expr1,expr2,expr3)\n\nIf expr1 is TRUE (expr1 <> 0 and expr1 <> NULL) then IF() returns\nexpr2; otherwise it returns expr3. IF() returns a numeric or string\nvalue, depending on the context in which it is used.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/control-flow-functions.html\n\n','mysql> SELECT IF(1>2,2,3);\n        -> 3\nmysql> SELECT IF(1<2,\'yes\',\'no\');\n        -> \'yes\'\nmysql> SELECT IF(STRCMP(\'test\',\'test1\'),\'no\',\'yes\');\n        -> \'no\'\n','http://dev.mysql.com/doc/refman/5.1/en/control-flow-functions.html'),
 (453,'DATABASE',16,'Syntax:\nDATABASE()\n\nReturns the default (current) database name as a string in the utf8\ncharacter set. If there is no default database, DATABASE() returns\nNULL. Within a stored routine, the default database is the database\nthat the routine is associated with, which is not necessarily the same\nas the database that is the default in the calling context.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/information-functions.html\n\n','mysql> SELECT DATABASE();\n        -> \'test\'\n','http://dev.mysql.com/doc/refman/5.1/en/information-functions.html'),
 (454,'POINTFROMWKB',30,'PointFromWKB(wkb[,srid])\n\nConstructs a POINT value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/gis-wkb-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/gis-wkb-functions.html'),
 (455,'POWER',4,'Syntax:\nPOW(X,Y), POWER(X,Y)\n\nReturns the value of X raised to the power of Y.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT POW(2,2);\n        -> 4\nmysql> SELECT POW(2,-2);\n        -> 0.25\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (456,'ATAN',4,'Syntax:\nATAN(X)\n\nReturns the arc tangent of X, that is, the value whose tangent is X.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT ATAN(2);\n        -> 1.1071487177941\nmysql> SELECT ATAN(-2);\n        -> -1.1071487177941\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (457,'STRCMP',34,'Syntax:\nSTRCMP(expr1,expr2)\n\nSTRCMP() returns 0 if the strings are the same, -1 if the first\nargument is smaller than the second according to the current sort\norder, and 1 otherwise.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-comparison-functions.html\n\n','mysql> SELECT STRCMP(\'text\', \'text2\');\n        -> -1\nmysql> SELECT STRCMP(\'text2\', \'text\');\n        -> 1\nmysql> SELECT STRCMP(\'text\', \'text\');\n        -> 0\n','http://dev.mysql.com/doc/refman/5.1/en/string-comparison-functions.html'),
 (458,'INSERT DELAYED',25,'Syntax:\nINSERT DELAYED ...\n\nThe DELAYED option for the INSERT statement is a MySQL extension to\nstandard SQL that is very useful if you have clients that cannot or\nneed not wait for the INSERT to complete. This is a common situation\nwhen you use MySQL for logging and you also periodically run SELECT and\nUPDATE statements that take a long time to complete.\n\nWhen a client uses INSERT DELAYED, it gets an okay from the server at\nonce, and the row is queued to be inserted when the table is not in use\nby any other thread.\n\nAnother major benefit of using INSERT DELAYED is that inserts from many\nclients are bundled together and written in one block. This is much\nfaster than performing many separate inserts.\n\nNote that INSERT DELAYED is slower than a normal INSERT if the table is\nnot otherwise in use. There is also the additional overhead for the\nserver to handle a separate thread for each table for which there are\ndelayed rows. This means that you should use INSERT DELAYED only when\nyou are really sure that you need it.\n\nThe queued rows are held only in memory until they are inserted into\nthe table. This means that if you terminate mysqld forcibly (for\nexample, with kill -9) or if mysqld dies unexpectedly, any queued rows\nthat have not been written to disk are lost.\n\nThere are some constraints on the use of DELAYED:\n\no INSERT DELAYED works only with MyISAM, MEMORY, ARCHIVE, and (as of\n  MySQL 5.1.19) BLACKHOLE tables. See\n  http://dev.mysql.com/doc/refman/5.1/en/myisam-storage-engine.html,\n  http://dev.mysql.com/doc/refman/5.1/en/memory-storage-engine.html,\n  http://dev.mysql.com/doc/refman/5.1/en/archive-storage-engine.html,\n  and\n  http://dev.mysql.com/doc/refman/5.1/en/blackhole-storage-engine.html.\n\no For MyISAM tables, if there are no free blocks in the middle of the\n  data file, concurrent SELECT and INSERT statements are supported.\n  Under these circumstances, you very seldom need to use INSERT DELAYED\n  with MyISAM.\n\no INSERT DELAYED should be used only for INSERT statements that specify\n  value lists. The server ignores DELAYED for INSERT ... SELECT or\n  INSERT ... ON DUPLICATE KEY UPDATE statements.\n\no Because the INSERT DELAYED statement returns immediately, before the\n  rows are inserted, you cannot use LAST_INSERT_ID() to get the\n  AUTO_INCREMENT value that the statement might generate.\n\no DELAYED rows are not visible to SELECT statements until they actually\n  have been inserted.\n\no DELAYED is ignored on slave replication servers because it could\n  cause the slave to have different data than the master.\n\no Pending INSERT DELAYED statements are lost if a table is write locked\n  and ALTER TABLE is used to modify the table structure.\n\no INSERT DELAYED is not supported for views.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/insert-delayed.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/insert-delayed.html'),
 (459,'SHOW PROCEDURE CODE',25,'Syntax:\nSHOW {PROCEDURE | FUNCTION} CODE sp_name\n\nThese statements are MySQL extensions that are available only for\nservers that have been built with debugging support. They display a\nrepresentation of the internal implementation of the named routine. The\nstatements require that you be the owner of the routine or have SELECT\naccess to the mysql.proc table.\n\nIf the named routine is available, each statement produces a result\nset. Each row in the result set corresponds to one \"instruction\" in the\nroutine. The first column is Pos, which is an ordinal number beginning\nwith 0. The second column is Instruction, which contains an SQL\nstatement (usually changed from the original source), or a directive\nwhich has meaning only to the stored-routine handler.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-procedure-code.html\n\n','mysql> DELIMITER //\nmysql> CREATE PROCEDURE p1 ()\n    -> BEGIN\n    ->   DECLARE fanta INT DEFAULT 55;\n    ->   DROP TABLE t2;\n    ->   LOOP\n    ->     INSERT INTO t3 VALUES (fanta);\n    ->     END LOOP;\n    ->   END//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SHOW PROCEDURE CODE p1//\n+-----+----------------------------------------+\n| Pos | Instruction                            |\n+-----+----------------------------------------+\n|   0 | set fanta@0 55                         |\n|   1 | stmt 9 \"DROP TABLE t2\"                 |\n|   2 | stmt 5 \"INSERT INTO t3 VALUES (fanta)\" |\n|   3 | jump 2                                 |\n+-----+----------------------------------------+\n4 rows in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.1/en/show-procedure-code.html'),
 (460,'MEDIUMTEXT',21,'MEDIUMTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 16,777,215 (224 - 1) characters.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/string-type-overview.html'),
 (461,'LN',4,'Syntax:\nLN(X)\n\nReturns the natural logarithm of X; that is, the base-e logarithm of X.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT LN(2);\n        -> 0.69314718055995\nmysql> SELECT LN(-2);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (462,'SHOW COLLATION',25,'Syntax:\nSHOW COLLATION\n    [LIKE \'pattern\' | WHERE expr]\n\nThe output from SHOW COLLATION includes all available character sets.\nThe LIKE clause, if present, indicates which collation names to match.\nThe WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.1/en/extended-show.html. For example:\n\nmysql> SHOW COLLATION LIKE \'latin1%\';\n+-------------------+---------+----+---------+----------+---------+\n| Collation         | Charset | Id | Default | Compiled | Sortlen |\n+-------------------+---------+----+---------+----------+---------+\n| latin1_german1_ci | latin1  |  5 |         |          |       0 |\n| latin1_swedish_ci | latin1  |  8 | Yes     | Yes      |       0 |\n| latin1_danish_ci  | latin1  | 15 |         |          |       0 |\n| latin1_german2_ci | latin1  | 31 |         | Yes      |       2 |\n| latin1_bin        | latin1  | 47 |         | Yes      |       0 |\n| latin1_general_ci | latin1  | 48 |         |          |       0 |\n| latin1_general_cs | latin1  | 49 |         |          |       0 |\n| latin1_spanish_ci | latin1  | 94 |         |          |       0 |\n+-------------------+---------+----+---------+----------+---------+\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/show-collation.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/show-collation.html'),
 (463,'LOG',4,'Syntax:\nLOG(X), LOG(B,X)\n\nIf called with one parameter, this function returns the natural\nlogarithm of X.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT LOG(2);\n        -> 0.69314718055995\nmysql> SELECT LOG(-2);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (464,'SET SQL_LOG_BIN',25,'Syntax:\nSET SQL_LOG_BIN = {0|1}\n\nDisables or enables binary logging for the current connection\n(SQL_LOG_BIN is a session variable) if the client has the SUPER\nprivilege. The statement is refused with an error if the client does\nnot have that privilege.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/set-sql-log-bin.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/set-sql-log-bin.html'),
 (465,'!=',18,'Syntax:\n<>, !=\n\nNot equal:\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html\n\n','mysql> SELECT \'.01\' <> \'0.01\';\n        -> 1\nmysql> SELECT .01 <> \'0.01\';\n        -> 0\nmysql> SELECT \'zapp\' <> \'zappp\';\n        -> 1\n','http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html'),
 (466,'WHILE',36,'Syntax:\n[begin_label:] WHILE search_condition DO\n    statement_list\nEND WHILE [end_label]\n\nThe statement list within a WHILE statement is repeated as long as the\nsearch_condition is true. statement_list consists of one or more\nstatements.\n\nA WHILE statement can be labeled. end_label cannot be given unless\nbegin_label also is present. If both are present, they must be the\nsame.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/while-statement.html\n\n','CREATE PROCEDURE dowhile()\nBEGIN\n  DECLARE v1 INT DEFAULT 5;\n\n  WHILE v1 > 0 DO\n    ...\n    SET v1 = v1 - 1;\n  END WHILE;\nEND\n','http://dev.mysql.com/doc/refman/5.1/en/while-statement.html'),
 (467,'AES_DECRYPT',11,'Syntax:\nAES_ENCRYPT(str,key_str), AES_DECRYPT(crypt_str,key_str)\n\nThese functions allow encryption and decryption of data using the\nofficial AES (Advanced Encryption Standard) algorithm, previously known\nas \"Rijndael.\" Encoding with a 128-bit key length is used, but you can\nextend it up to 256 bits by modifying the source. We chose 128 bits\nbecause it is much faster and it is secure enough for most purposes.\n\nAES_ENCRYPT() encrypts a string and returns a binary string.\nAES_DECRYPT() decrypts the encrypted string and returns the original\nstring. The input arguments may be any length. If either argument is\nNULL, the result of this function is also NULL.\n\nBecause AES is a block-level algorithm, padding is used to encode\nuneven length strings and so the result string length may be calculated\nusing this formula:\n\n16 x (trunc(string_length / 16) + 1)\n\nIf AES_DECRYPT() detects invalid data or incorrect padding, it returns\nNULL. However, it is possible for AES_DECRYPT() to return a non-NULL\nvalue (possibly garbage) if the input data or the key is invalid.\n\nYou can use the AES functions to store data in an encrypted form by\nmodifying your queries:\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html\n\n','INSERT INTO t VALUES (1,AES_ENCRYPT(\'text\',\'password\'));\n','http://dev.mysql.com/doc/refman/5.1/en/encryption-functions.html'),
 (468,'RENAME DATABASE',37,'Syntax:\nRENAME {DATABASE | SCHEMA} db_name TO new_db_name;\n\nThis statement renames a database. It requires the ALTER and DROP\nprivileges for the database, and the CREATE privilege for the new\ndatabase. RENAME SCHEMA is a synonym for RENAME DATABASE.\n\nWhen the server receives this statement, it creates a new database.\nThen it moves tables and other database objects such as triggers to the\nnew database. It also updates the Db column in the system tables for\nobjects such as stored routines and events. Finally, the server drops\nthe old database.\n\nNote that currently there are these limitations: RENAME DATABASE does\nnot change any account privileges listed in the system tables. They\nmust be changed manually. RENAME DATABASE destroys any stored routines\nor events associated with the original database.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/rename-database.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/rename-database.html'),
 (469,'DAYNAME',29,'Syntax:\nDAYNAME(date)\n\nReturns the name of the weekday for date. As of MySQL 5.1.12, the\nlanguage used for the name is controlled by the value of the\nlc_time_names system variable\n(http://dev.mysql.com/doc/refman/5.1/en/locale-support.html).\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html\n\n','mysql> SELECT DAYNAME(\'1998-02-05\');\n        -> \'Thursday\'\n','http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html'),
 (470,'COERCIBILITY',16,'Syntax:\nCOERCIBILITY(str)\n\nReturns the collation coercibility value of the string argument.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/information-functions.html\n\n','mysql> SELECT COERCIBILITY(\'abc\' COLLATE latin1_swedish_ci);\n        -> 0\nmysql> SELECT COERCIBILITY(USER());\n        -> 3\nmysql> SELECT COERCIBILITY(\'abc\');\n        -> 4\n','http://dev.mysql.com/doc/refman/5.1/en/information-functions.html'),
 (471,'INT',21,'INT[(M)] [UNSIGNED] [ZEROFILL]\n\nA normal-size integer. The signed range is -2147483648 to 2147483647.\nThe unsigned range is 0 to 4294967295.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.1/en/numeric-type-overview.html'),
 (472,'GLENGTH',12,'GLength(ls)\n\nReturns as a double-precision number the length of the LineString value\nls in its associated spatial reference.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/linestring-property-functions.html\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT GLength(GeomFromText(@ls));\n+----------------------------+\n| GLength(GeomFromText(@ls)) |\n+----------------------------+\n|            2.8284271247462 |\n+----------------------------+\n','http://dev.mysql.com/doc/refman/5.1/en/linestring-property-functions.html'),
 (473,'RADIANS',4,'Syntax:\nRADIANS(X)\n\nReturns the argument X, converted from degrees to radians. (Note that\nπ radians equals 180 degrees.)\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html\n\n','mysql> SELECT RADIANS(90);\n        -> 1.5707963267949\n','http://dev.mysql.com/doc/refman/5.1/en/mathematical-functions.html'),
 (474,'COLLATION',16,'Syntax:\nCOLLATION(str)\n\nReturns the collation of the string argument.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/information-functions.html\n\n','mysql> SELECT COLLATION(\'abc\');\n        -> \'latin1_swedish_ci\'\nmysql> SELECT COLLATION(_utf8\'abc\');\n        -> \'utf8_general_ci\'\n','http://dev.mysql.com/doc/refman/5.1/en/information-functions.html'),
 (475,'COALESCE',18,'Syntax:\nCOALESCE(value,...)\n\nReturns the first non-NULL value in the list, or NULL if there are no\nnon-NULL values.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html\n\n','mysql> SELECT COALESCE(NULL,1);\n        -> 1\nmysql> SELECT COALESCE(NULL,NULL,NULL);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.1/en/comparison-operators.html'),
 (476,'VERSION',16,'Syntax:\nVERSION()\n\nReturns a string that indicates the MySQL server version. The string\nuses the utf8 character set.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/information-functions.html\n\n','mysql> SELECT VERSION();\n        -> \'5.1.21-beta-standard\'\n','http://dev.mysql.com/doc/refman/5.1/en/information-functions.html'),
 (477,'MAKE_SET',34,'Syntax:\nMAKE_SET(bits,str1,str2,...)\n\nReturns a set value (a string containing substrings separated by `,\'\ncharacters) consisting of the strings that have the corresponding bit\nin bits set. str1 corresponds to bit 0, str2 to bit 1, and so on. NULL\nvalues in str1, str2, ... are not appended to the result.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT MAKE_SET(1,\'a\',\'b\',\'c\');\n        -> \'a\'\nmysql> SELECT MAKE_SET(1 | 4,\'hello\',\'nice\',\'world\');\n        -> \'hello,world\'\nmysql> SELECT MAKE_SET(1 | 4,\'hello\',\'nice\',NULL,\'world\');\n        -> \'hello\'\nmysql> SELECT MAKE_SET(0,\'a\',\'b\',\'c\');\n        -> \'\'\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html'),
 (478,'FIND_IN_SET',34,'Syntax:\nFIND_IN_SET(str,strlist)\n\nReturns a value in the range of 1 to N if the string str is in the\nstring list strlist consisting of N substrings. A string list is a\nstring composed of substrings separated by `,\' characters. If the first\nargument is a constant string and the second is a column of type SET,\nthe FIND_IN_SET() function is optimized to use bit arithmetic. Returns\n0 if str is not in strlist or if strlist is the empty string. Returns\nNULL if either argument is NULL. This function does not work properly\nif the first argument contains a comma (`,\') character.\n\nURL: http://dev.mysql.com/doc/refman/5.1/en/string-functions.html\n\n','mysql> SELECT FIND_IN_SET(\'b\',\'a,b,c,d\');\n        -> 2\n','http://dev.mysql.com/doc/refman/5.1/en/string-functions.html');
/*!40000 ALTER TABLE `help_topic` ENABLE KEYS */;


--
-- Definition of table `host`
--

DROP TABLE IF EXISTS `host`;
CREATE TABLE `host` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `Db` char(64) collate utf8_bin NOT NULL default '',
  `Select_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Insert_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Update_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Delete_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Drop_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Grant_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `References_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Index_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_tmp_table_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Lock_tables_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Show_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Execute_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Trigger_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  PRIMARY KEY  (`Host`,`Db`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Host privileges;  Merged with database privileges';

--
-- Dumping data for table `host`
--

/*!40000 ALTER TABLE `host` DISABLE KEYS */;
/*!40000 ALTER TABLE `host` ENABLE KEYS */;


--
-- Definition of table `ndb_binlog_index`
--

DROP TABLE IF EXISTS `ndb_binlog_index`;
CREATE TABLE `ndb_binlog_index` (
  `Position` bigint(20) unsigned NOT NULL,
  `File` varchar(255) NOT NULL,
  `epoch` bigint(20) unsigned NOT NULL,
  `inserts` bigint(20) unsigned NOT NULL,
  `updates` bigint(20) unsigned NOT NULL,
  `deletes` bigint(20) unsigned NOT NULL,
  `schemaops` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`epoch`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ndb_binlog_index`
--

/*!40000 ALTER TABLE `ndb_binlog_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `ndb_binlog_index` ENABLE KEYS */;


--
-- Definition of table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
CREATE TABLE `plugin` (
  `name` char(64) collate utf8_bin NOT NULL default '',
  `dl` char(128) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='MySQL plugins';

--
-- Dumping data for table `plugin`
--

/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;


--
-- Definition of table `proc`
--

DROP TABLE IF EXISTS `proc`;
CREATE TABLE `proc` (
  `db` char(64) character set utf8 collate utf8_bin NOT NULL default '',
  `name` char(64) NOT NULL default '',
  `type` enum('FUNCTION','PROCEDURE') NOT NULL,
  `specific_name` char(64) NOT NULL default '',
  `language` enum('SQL') NOT NULL default 'SQL',
  `sql_data_access` enum('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') NOT NULL default 'CONTAINS_SQL',
  `is_deterministic` enum('YES','NO') NOT NULL default 'NO',
  `security_type` enum('INVOKER','DEFINER') NOT NULL default 'DEFINER',
  `param_list` blob NOT NULL,
  `returns` char(64) NOT NULL default '',
  `body` longblob NOT NULL,
  `definer` char(77) character set utf8 collate utf8_bin NOT NULL default '',
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL default '0000-00-00 00:00:00',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE') NOT NULL default '',
  `comment` char(64) character set utf8 collate utf8_bin NOT NULL default '',
  `character_set_client` char(32) character set utf8 collate utf8_bin default NULL,
  `collation_connection` char(32) character set utf8 collate utf8_bin default NULL,
  `db_collation` char(32) character set utf8 collate utf8_bin default NULL,
  `body_utf8` longblob,
  PRIMARY KEY  (`db`,`name`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stored Procedures';

--
-- Dumping data for table `proc`
--

/*!40000 ALTER TABLE `proc` DISABLE KEYS */;
/*!40000 ALTER TABLE `proc` ENABLE KEYS */;


--
-- Definition of table `procs_priv`
--

DROP TABLE IF EXISTS `procs_priv`;
CREATE TABLE `procs_priv` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `Db` char(64) collate utf8_bin NOT NULL default '',
  `User` char(16) collate utf8_bin NOT NULL default '',
  `Routine_name` char(64) collate utf8_bin NOT NULL default '',
  `Routine_type` enum('FUNCTION','PROCEDURE') collate utf8_bin NOT NULL,
  `Grantor` char(77) collate utf8_bin NOT NULL default '',
  `Proc_priv` set('Execute','Alter Routine','Grant') character set utf8 NOT NULL default '',
  `Timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`Host`,`Db`,`User`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Procedure privileges';

--
-- Dumping data for table `procs_priv`
--

/*!40000 ALTER TABLE `procs_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `procs_priv` ENABLE KEYS */;


--
-- Definition of table `servers`
--

DROP TABLE IF EXISTS `servers`;
CREATE TABLE `servers` (
  `Server_name` char(64) NOT NULL default '',
  `Host` char(64) NOT NULL default '',
  `Db` char(64) NOT NULL default '',
  `Username` char(64) NOT NULL default '',
  `Password` char(64) NOT NULL default '',
  `Port` int(4) NOT NULL default '0',
  `Socket` char(64) NOT NULL default '',
  `Wrapper` char(64) NOT NULL default '',
  `Owner` char(64) NOT NULL default '',
  PRIMARY KEY  (`Server_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='MySQL Foreign Servers table';

--
-- Dumping data for table `servers`
--

/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;



--
-- Definition of table `tables_priv`
--

DROP TABLE IF EXISTS `tables_priv`;
CREATE TABLE `tables_priv` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `Db` char(64) collate utf8_bin NOT NULL default '',
  `User` char(16) collate utf8_bin NOT NULL default '',
  `Table_name` char(64) collate utf8_bin NOT NULL default '',
  `Grantor` char(77) collate utf8_bin NOT NULL default '',
  `Timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') character set utf8 NOT NULL default '',
  `Column_priv` set('Select','Insert','Update','References') character set utf8 NOT NULL default '',
  PRIMARY KEY  (`Host`,`Db`,`User`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table privileges';

--
-- Dumping data for table `tables_priv`
--

/*!40000 ALTER TABLE `tables_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tables_priv` ENABLE KEYS */;


--
-- Definition of table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
CREATE TABLE `time_zone` (
  `Time_zone_id` int(10) unsigned NOT NULL auto_increment,
  `Use_leap_seconds` enum('Y','N') NOT NULL default 'N',
  PRIMARY KEY  (`Time_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zones';

--
-- Dumping data for table `time_zone`
--

/*!40000 ALTER TABLE `time_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone` ENABLE KEYS */;


--
-- Definition of table `time_zone_leap_second`
--

DROP TABLE IF EXISTS `time_zone_leap_second`;
CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint(20) NOT NULL,
  `Correction` int(11) NOT NULL,
  PRIMARY KEY  (`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Leap seconds information for time zones';

--
-- Dumping data for table `time_zone_leap_second`
--

/*!40000 ALTER TABLE `time_zone_leap_second` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_leap_second` ENABLE KEYS */;


--
-- Definition of table `time_zone_name`
--

DROP TABLE IF EXISTS `time_zone_name`;
CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone names';

--
-- Dumping data for table `time_zone_name`
--

/*!40000 ALTER TABLE `time_zone_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_name` ENABLE KEYS */;


--
-- Definition of table `time_zone_transition`
--

DROP TABLE IF EXISTS `time_zone_transition`;
CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_time` bigint(20) NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`Time_zone_id`,`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transitions';

--
-- Dumping data for table `time_zone_transition`
--

/*!40000 ALTER TABLE `time_zone_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition` ENABLE KEYS */;


--
-- Definition of table `time_zone_transition_type`
--

DROP TABLE IF EXISTS `time_zone_transition_type`;
CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  `Offset` int(11) NOT NULL default '0',
  `Is_DST` tinyint(3) unsigned NOT NULL default '0',
  `Abbreviation` char(8) NOT NULL default '',
  PRIMARY KEY  (`Time_zone_id`,`Transition_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transition types';

--
-- Dumping data for table `time_zone_transition_type`
--

/*!40000 ALTER TABLE `time_zone_transition_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition_type` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `User` char(16) collate utf8_bin NOT NULL default '',
  `Password` char(41) character set latin1 collate latin1_bin NOT NULL default '',
  `Select_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Insert_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Update_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Delete_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Drop_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Reload_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Shutdown_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Process_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `File_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Grant_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `References_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Index_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Show_db_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Super_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_tmp_table_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Lock_tables_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Execute_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Repl_slave_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Repl_client_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Show_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_user_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Event_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Trigger_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') character set utf8 NOT NULL default '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int(11) unsigned NOT NULL default '0',
  `max_updates` int(11) unsigned NOT NULL default '0',
  `max_connections` int(11) unsigned NOT NULL default '0',
  `max_user_connections` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`Host`,`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and global privileges';

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`Host`,`User`,`Password`,`Select_priv`,`Insert_priv`,`Update_priv`,`Delete_priv`,`Create_priv`,`Drop_priv`,`Reload_priv`,`Shutdown_priv`,`Process_priv`,`File_priv`,`Grant_priv`,`References_priv`,`Index_priv`,`Alter_priv`,`Show_db_priv`,`Super_priv`,`Create_tmp_table_priv`,`Lock_tables_priv`,`Execute_priv`,`Repl_slave_priv`,`Repl_client_priv`,`Create_view_priv`,`Show_view_priv`,`Create_routine_priv`,`Alter_routine_priv`,`Create_user_priv`,`Event_priv`,`Trigger_priv`,`ssl_type`,`ssl_cipher`,`x509_issuer`,`x509_subject`,`max_questions`,`max_updates`,`max_connections`,`max_user_connections`) VALUES 
 (0x6C6F63616C686F7374,0x706D61,'','N','N','N','N','N','N','N','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0),
 (0x25,0x73736F6C7574696F6E,0x36623662633534323238353563613664,'N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0),
 (0x6C6F63616C686F7374,0x6F737469636B6574,0x2A32433644444142444244333342323242314435434337383444354535443732314538344338463831,'N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0),
 (0x6C6F63616C686F7374,0x657469636B6574,0x2A37314242354643344135454241333338423534463444413135463332433043333935433738453539,'N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0),
 (0x25,0x726F6F74,'','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','N','N','','','','',0,0,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
