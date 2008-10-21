#osTicket v1.3.1 osticket_upgrade.sql for osTicket v1.2.x compat (obsolete?)
#<1.3.1:ALTER TABLE `ticket_banlist` ADD `value_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST ; 
#<1.3.1:ALTER TABLE `ticket_groups` ADD `banlist` INT(1) NOT NULL DEFAULT '0' AFTER `user_group` ;

#You don't need an INDEX on PRIMARY KEYs: Drop them; (added v1.5.6)
#We need to add INDEXes to some tables, we'll drop them first then add them to avoid adding many. (added v1.5.6)
#any:
ALTER TABLE `tickets` DROP INDEX `ID`;
ALTER TABLE `tickets` DROP INDEX `timestamp`;
ALTER TABLE `tickets` ADD INDEX (`timestamp`);
ALTER TABLE `tickets` DROP INDEX `ID`;
ALTER TABLE `ticket_answers` DROP INDEX `ticket`;
ALTER TABLE `ticket_answers` ADD INDEX (`ticket`);
ALTER TABLE `ticket_answers` DROP INDEX `timestamp`;
ALTER TABLE `ticket_answers` ADD INDEX (`timestamp`);
ALTER TABLE `ticket_attachments` DROP INDEX `ticket`;
ALTER TABLE `ticket_attachments` ADD INDEX (`ticket`);
ALTER TABLE `ticket_messages` DROP INDEX `ID`;
ALTER TABLE `ticket_messages` DROP INDEX `ticket`;
ALTER TABLE `ticket_messages` ADD INDEX (`ticket`);
ALTER TABLE `ticket_privmsg` DROP INDEX `ticket`;
ALTER TABLE `ticket_privmsg` ADD INDEX (`ticket`);

#[1793730] SQL commands in the Notification email (Fixed: subject length was too short) (added v1.5.6)
#<1.5.6:
ALTER TABLE `tickets` CHANGE `subject` `subject` VARCHAR( 255 );

#A bit of optimizing never hurt anyone... (added v1.5.6)
#any:
OPTIMIZE TABLE `tickets`;
OPTIMIZE TABLE `ticket_answers`;
OPTIMIZE TABLE `ticket_attachments`;
OPTIMIZE TABLE `ticket_banlist`;
OPTIMIZE TABLE `ticket_categories`;
OPTIMIZE TABLE `ticket_config`;
OPTIMIZE TABLE `ticket_groups`;
OPTIMIZE TABLE `ticket_messages`;
OPTIMIZE TABLE `ticket_privmsg`;
OPTIMIZE TABLE `ticket_reps`;

#New rep field so tickets can be assigned to reps (added v1.5.6)
#<1.5.6:
ALTER TABLE `tickets` ADD `rep` INT(5) NULL DEFAULT '0' AFTER `cat` ;

#Added settings table to replace mostly settings in settings.php/automail-settings.pl and eventually the config table
#<1.5.6:
CREATE TABLE `ticket_settings`(
  `ID` int(5) NOT NULL auto_increment,
  `group` varchar(255) NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `GROUP` (`GROUP`),
  KEY `VALUE` (`KEY`)
);

#Disables ON UPDATE CURRENT_TIMESTAMP (added v1.5.6)
#<1.5.6
ALTER TABLE `tickets` CHANGE `timestamp` `timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP

#Change timestamp to datetime (added v1.5.6)
#<1.5.6
ALTER TABLE `tickets` CHANGE `timestamp` `timestamp` DATETIME NULL  
