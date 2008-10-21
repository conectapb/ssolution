#!

#######################################################
#
#	eTicket, Open Source Support Ticket System
#	http://eticket.sourceforge.net/
#
#	Released under the GNU General Public License
#
#######################################################
#
#	Email Gateway for piping/aliases (automail.pl)
#
#	Configuration settings (for automail.pl)
#
#######################################################

%config = (
		   db_type => 'mysql',
		   db_host => 'localhost',
		   db_name => 'eticket',
		   db_user => 'eticket',
		   db_pass => '98q9ShAn3yhPTPSG',
		   db_table_prefix => 'ticket_',
		   db_table_tickets => 'tickets'
		   );

# Note: This should work without any editing, just run the installer, but if it doesn't, edit the settings appropreately

#flood protection mod - you can change the number here, its the max num of messages per min sent by 1 email.
$flood_msg_rate = 10;

#antispam mod - the over-ride or exception word (NOT PHRASE, no spaces), this word must be in the body text to over-ride the ban list
$ANTISPAM_MAGICWORD = 'ANTI_SPAM_MAGICWORD';
#antispam mod - subject for spam rejection notice
$ANTISPAM_SUBJECT = 'Ticked Rejected: Mail detected as SPAM';
#antispam mod - rejection message (don't take out {MAGICWORD} from this text, it gets replaced later automatically)
$ANTISPAM_MSG = "Your email was detected as spam and has been rejected. If your email was not spam, please re-send your email, including the word '{MAGICWORD}' in the body of the email.";
#antispam mod - email to send the rejection message from (you would use a non-existing email address at your domain)
$ANTISPAM_EMAIL = 'noreply@example.com';

#SpamAssassin mod - set this to 1 to enable this mod
#Note: to install do: perl -MCPAN -e'install Mail::SpamAssassin'
$spamassassin_enable = 1;
#SpamAssassin mod - this is the word you put in your subjects to idenify spam, add it to your helpdesk banlist
$spamword = '[SPAM]';

#language mod - Default subject if there's no subject entered
$no_subject = '[No Subject]';
#language mod - "|" seperated terms that mean "Re" (as in Reply/Respond/Regarding/Re:) add your language (Do not add the :)
$subject_re = 'Re|Antw';

#language charset mod - added for outgoing mail
$mailcharset='UTF-8';

#the pre-signature, the string that appears before each signature is attached
$presig="\r\n--\n";

#Format of the ticket number in the email subject (ie: [#123456])
$ticket_format='\[#([0-9]{6})\]';

#EOF