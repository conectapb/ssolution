<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

if(!defined('ISINC')) die('serious error');
if ($_SESSION['user']['type'] !== 'admin') { die(LANG_ERROR_DENIED); }
load_buttons();
?>

<form action="<?=htmlspecialchars($_SERVER['REQUEST_URI']);?>" method="post">
<input type="hidden" name="a" value="mail">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
	<tr>
		<td>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr class="TableMsg" width="100%">
				<td class="TableHeaderText" style="text-align: left; padding: 5px;" width="100%">
					<?=LANG_NEW_TICKET_REPLY?>
				</td>
			</tr>
			<tr>
				<td class="TableInfoText"><?=LANG_NEW_TICKET_REPLY_INFO?></td>
			</tr>
		</table>
		</td>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="2" class="TableHeader">
				<tr>
					<td class="mainTable" width="120"><?=LANG_ENABLE?>:</td>
					<td class="mainTableAlt">
						<input type="checkbox" name="ticket_response"<?=htmlspecialchars($config['ticket_response']) ? ' checked': ''?>>
					</td>
				</tr>
				<tr>
					<td class="mainTable"><?=LANG_SUBJECT?>:</td>
					<td class="mainTableAlt"><input type="text" name="ticket_subj" value="<?=htmlspecialchars($config['ticket_subj'])?>" size="45"></td>
				</tr>
				<tr>
					<td class="mainTable"><?=LANG_MSG?>:</td>
					<td class="mainTableAlt"><textarea rows="7" cols="45" name="ticket_msg"><?=htmlspecialchars($config['ticket_msg'])?></textarea></td>
				</tr>
				<tr>
					<td class="mainTable"><?=LANG_VARS?>:</td>
					<td class="mainTableAlt">
						%ticket: <?=LANG_TICKET_ID?><br>
						%subject: <?=LANG_VAR_SUBJECT?><br>
						%message: <?=LANG_VAR_MESSAGE?><br>
						%name: <?=LANG_VAR_NAME?><br>
						%email: <?=LANG_VAR_EMAIL?><br>
						%url: <?=LANG_ROOT_URL?>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<p><input class="inputsubmit" type="submit" name="submitmail" value="<?=LANG_SAVE_CHANGES; ?>"></p>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr class="TableMsg" width="100%">
				<td class="TableHeaderText" style="text-align: left; padding: 5px;" width="100%">
					<?=LANG_NEW_MSG_REPLY?>
				</td>
			</tr>
			<tr>
				<td class="TableInfoText"><?=LANG_NEW_MSG_REPLY_INFO?></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="2" class="TableHeader">
				<tr>
					<td class="mainTable" width="120"><?=LANG_ENABLE?>:</td>
					<td class="mainTableAlt"><input type="checkbox" name="message_response"<?=htmlspecialchars($config['message_response']) ? ' checked': ''?>></td>
				</tr>
				<tr>
					<td class="mainTable"><?=LANG_SUBJECT?>:</td>
					<td class="mainTableAlt"><input type="text" name="message_subj" value="<?=htmlspecialchars($config['message_subj'])?>" size="45"></td>
				</tr>
				<tr>
					<td class="mainTable"><?=LANG_MSG?>:</td>
					<td class="mainTableAlt"><textarea rows="7" cols="45" name="message_msg"><?=htmlspecialchars($config['message_msg'])?></textarea></td>
				</tr>
				<tr>
					<td class="mainTable"><?=LANG_VARS?>:</td>
					<td class="mainTableAlt">
						%ticket: <?=LANG_TICKET_ID?><br>
						%subject: <?=LANG_VAR_SUBJECT?><br>
						%name: <?=LANG_VAR_NAME?><br>
						%email: <?=LANG_VAR_EMAIL?><br>
						%url: <?=LANG_ROOT_URL?>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<p><input class="inputsubmit" type="submit" name="submitmail" value="<?=LANG_SAVE_CHANGES; ?>"></p>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr class="TableMsg" width="100%">
				<td class="TableHeaderText" style="text-align: left; padding: 5px;" width="100%">
					<?=LANG_TICKET_LIMIT_REPLY?>
				</td>
			</tr>
			<tr>
				<td class="TableInfoText"><?=LANG_TICKET_LIMIT_REPLY_INFO?></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="2" class="TableHeader">
				<tr>
					<td class="mainTable" width="120"><?=LANG_ENABLE; ?>:</td>
					<td class="mainTableAlt">
						<input type="checkbox" name="limit_response"<?=htmlspecialchars($config['limit_response']) ? 'checked': ''?>>
					</td>
				</tr>
				<tr>
					<td class="mainTable"><?=LANG_EMAIL?>:</td>
					<td class="mainTableAlt">
						<input type="text" name="limit_email" value="<?=htmlspecialchars($config['limit_email'])?>" size="45">
					</td>
				</tr>
				<tr>
					<td class="mainTable"><?=LANG_SUBJECT; ?>:</td>
					<td class="mainTableAlt"><input type="text" name="limit_subj" value="<?=htmlspecialchars($config['limit_subj'])?>" size="45"></td>
				</tr>
				<tr>
					<td class="mainTable"><?=LANG_MSG; ?>:</td>
					<td class="mainTableAlt"><textarea rows="7" cols="45" name="limit_msg"><?=htmlspecialchars($config['limit_msg'])?></textarea></td>
				</tr>
				<tr>
					<td class="mainTable"><?=LANG_VARS?>:</td>
					<td class="mainTableAlt">
						%ticket_max: <?=LANG_TICKET_MAX_VAR?><br>
						%user_email: <?=LANG_FROM_EMAIL?><br>
						%local_email: <?=LANG_VAR_EMAIL?><br>
						%url: <?=LANG_ROOT_URL?>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<p><input class="inputsubmit" type="submit" name="submitmail" value="<?=LANG_SAVE_CHANGES; ?>"></p>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr class="TableMsg" width="100%">
				<td class="TableHeaderText" style="text-align: left; padding: 5px;" width="100%">
					<?=LANG_CAT_TRANS_NOTICE?>
				</td>
			</tr>
			<tr>
				<td class="TableInfoText"><?=LANG_CAT_TRANS_NOTICE_INFO?></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="2" class="TableHeader">
				<tr>
					<td class="mainTable" width="120"><?=LANG_ENABLE?>:</td>
					<td class="mainTableAlt"><input type="checkbox" name="trans_response" <?=htmlspecialchars($config['trans_response']) ? 'checked': ''?>></td>
				</tr>
				<tr>
					<td class="mainTable"><?=LANG_SUBJECT?>:</td>
					<td class="mainTableAlt"><input type="text" name="trans_subj" value="<?=htmlspecialchars($config['trans_subj'])?>" size="45"></td>
				</tr>
				<tr>
					<td class="mainTable"><?=LANG_MSG?>:</td>
					<td class="mainTableAlt"><textarea rows="7" cols="45" name="trans_msg"><?=htmlspecialchars($config['trans_msg'])?></textarea></td>
				</tr>
				<tr>
					<td class="mainTable"><?=LANG_VARS?>:</td>
					<td class="mainTableAlt">
						%ticket: <?=LANG_TICKET_ID?><br>
						%category: <?=LANG_CAT_NAME_VAR?><br>
						%trans_msg: <?=LANG_TRANS_MSG_VAR?><br>
						%subject: <?=LANG_VAR_SUBJECT?><br>
						%name: <?=LANG_VAR_NAME?><br>
						%email: <?=LANG_VAR_EMAIL?><br>
						%url: <?=LANG_ROOT_URL?>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<p><input class="inputsubmit" type="submit" name="submitmail" value="<?=LANG_SAVE_CHANGES; ?>"></p>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr class="TableMsg" width="100%">
				<td class="TableHeaderText" style="text-align: left; padding: 5px;" width="100%">
					<?=LANG_EMAIL_ALERT?>
				</td>
			</tr>
			<tr>
				<td class="TableInfoText"><?=LANG_EMAIL_ALERT_INFO?></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="2" class="TableHeader">
			<tr>
				<td class="mainTable" width="120"><?=LANG_ENABLE; ?>:</td>
				<td class="mainTableAlt"><input type="checkbox" name="alert_new"<?=htmlspecialchars($config['alert_new']) ? ' checked': ''?>></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_ADDR_TO_EMAIL; ?>:</td>
				<td class="mainTableAlt"><input type="text" name="alert_user" value="<?=htmlspecialchars($config['alert_user'])?>" size="55"></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_FROM_EMAIL; ?>:</td>
				<td class="mainTableAlt"><input type="text" name="alert_email" value="<?=htmlspecialchars($config['alert_email'])?>" size="45"></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_SUBJECT; ?>:</td>
				<td class="mainTableAlt"><input type="text" name="alert_subj" value="<?=htmlspecialchars($config['alert_subj'])?>" size="45"></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_MSG; ?>:</td>
				<td class="mainTableAlt"><textarea rows="7" cols="45" name="alert_msg"><?=htmlspecialchars($config['alert_msg'])?></textarea></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_VARS; ?>:</td>
				<td class="mainTableAlt">
					%ticket: <?=LANG_TICKET_ID?><br>
					%email: <?=LANG_VAR_EMAIL?><br>
					%message: <?=LANG_MSG_VAR?><br>
					%url: <?=LANG_ROOT_URL?><br>
					%name: <?=LANG_VAR_NAME?><br>
					%datetime: <?=LANG_VAR_DATETIME?><br>
					%subject: <?=LANG_SUBJECT; ?><br>
					%category: <?=LANG_CAT; ?>
				</td>
			</tr>
			</table>
		</td>
	</tr>
</table>

<p><input class="inputsubmit" type="submit" name="submitmail" value="<?=LANG_SAVE_CHANGES; ?>"></p>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr class="TableMsg" width="100%">
				<td class="TableHeaderText" style="text-align: left; padding: 5px;" width="100%">
					<?=LANG_ANSWER_MSG?>
				</td>
			</tr>
			<tr>
				<td class="TableInfoText"><?=LANG_ANSWER_MSG_INFO?></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="2" class="TableHeader">
				<tr>
					<td class="mainTable"><?=LANG_SUBJECT?>:</td>
					<td class="mainTableAlt"><input type="text" name="answer_subj" value="<?=htmlspecialchars($config['answer_subj'])?>" size="45"></td>
				</tr>
				<tr>
					<td class="mainTable"><?=LANG_MSG?>:</td>
					<td class="mainTableAlt"><textarea rows="7" cols="45" name="answer_msg"><?=htmlspecialchars($config['answer_msg'])?></textarea></td>
				</tr>
				<tr>
					<td class="mainTable"><?=LANG_VARS?>:</td>
					<td class="mainTableAlt">
						%ticket: <?=LANG_TICKET_ID?><br>
						%category: <?=LANG_CAT_NAME_VAR?><br>
						%trans_msg: <?=LANG_TRANS_MSG_VAR?><br>
						%subject: <?=LANG_VAR_SUBJECT?><br>
						%name: <?=LANG_VAR_NAME?><br>
						%email: <?=LANG_VAR_EMAIL?><br>
						%url: <?=LANG_ROOT_URL?>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<p><input class="inputsubmit" type="submit" name="submitmail" value="<?=LANG_SAVE_CHANGES; ?>"></p>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr class="TableMsg" width="100%">
				<td class="TableHeaderText" style="text-align: left; padding: 5px;" width="100%">
					<?=LANG_REP_TRANS_NOTICE?>
				</td>
			</tr>
			<tr>
				<td class="TableInfoText"><?=LANG_REP_TRANS_NOTICE_INFO?></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="2" class="TableHeader">
			<tr>
				<td class="mainTable" width="120"><?=LANG_ENABLE; ?>:</td>
				<td class="mainTableAlt"><input type="checkbox" name="rep_trans_response"<?=htmlspecialchars($config['rep_trans_response']) ? ' checked': ''?>></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_SUBJECT; ?>:</td>
				<td class="mainTableAlt"><input type="text" name="rep_trans_subj" value="<?=htmlspecialchars($config['rep_trans_subj'])?>" size="45"></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_MSG; ?>:</td>
				<td class="mainTableAlt"><textarea rows="7" cols="45" name="rep_trans_msg"><?=htmlspecialchars($config['rep_trans_msg'])?></textarea></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_VARS; ?>:</td>
				<td class="mainTableAlt">
						%ticket: <?=LANG_TICKET_ID?><br>
						%subject: <?=LANG_VAR_SUBJECT?><br>
						%name: <?=LANG_VAR_NAME?><br>
						%email: <?=LANG_VAR_EMAIL?><br>
						%url: <?=LANG_ROOT_URL?><br>
						%rep_name: <?=LANG_REP_NAME_VAR?>
				</td>
			</tr>
			</table>
		</td>
	</tr>
</table>

<p><input class="inputsubmit" type="submit" name="submitmail" value="<?=LANG_SAVE_CHANGES; ?>"></p>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr class="TableMsg" width="100%">
				<td class="TableHeaderText" style="text-align: left; padding: 5px;" width="100%">
					<?=LANG_ANTISPAM?>
				</td>
			</tr>
			<tr>
				<td class="TableInfoText"><?=LANG_ANTISPAM_INFO?></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="1" cellpadding="2" class="TableHeader">
			<tr>
				<td class="mainTable"><?=LANG_ANTISPAM_MAGICWORD; ?>:</td>
				<td class="mainTableAlt"><input type="text" name="ANTISPAM_MAGICWORD" value="<?=htmlspecialchars($config['ANTISPAM_MAGICWORD'])?>" size="45"></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_SUBJECT; ?>:</td>
				<td class="mainTableAlt"><input type="text" name="ANTISPAM_SUBJECT" value="<?=htmlspecialchars($config['ANTISPAM_SUBJECT'])?>" size="45"></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_MSG; ?>:</td>
				<td class="mainTableAlt"><textarea rows="7" cols="45" name="ANTISPAM_MSG"><?=htmlspecialchars($config['ANTISPAM_MSG'])?></textarea></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_FROM_EMAIL; ?>:</td>
				<td class="mainTableAlt"><input type="text" name="ANTISPAM_EMAIL" value="<?=htmlspecialchars($config['ANTISPAM_EMAIL'])?>" size="45"></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_VARS; ?>:</td>
				<td class="mainTableAlt">
					%ticket: <?=LANG_TICKET_ID?><br>
					%email: <?=LANG_VAR_EMAIL?><br>
					%message: <?=LANG_MSG_VAR?><br>
					%url: <?=LANG_ROOT_URL?><br>
					%name: <?=LANG_VAR_NAME?><br>
					%datetime: <?=LANG_VAR_DATETIME?><br>
					%subject: <?=LANG_SUBJECT?>
				</td>
			</tr>
			</table>
		</td>
	</tr>
</table>

<p><input class="inputsubmit" type="submit" name="submitmail" value="<?=LANG_SAVE_CHANGES; ?>"></p>
</form>
