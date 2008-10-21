<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

if(!defined('ISINC')) die('serious error');
if ($_SESSION['user']['type'] !== 'admin') { die(LANG_ERROR_DENIED); }
load_buttons();

$types = explode(';', $config['filetypes']);
$types_html='';
foreach ($types as $type) {
	if (!empty($type)) {
		$types_html.="<option>$type</option>\n";
	}
}

$timezone_html='';
if ($timezones) {
	foreach ($timezones as $key => $text) {
		$selected = ($config['timezone'] == $key) ? ' SELECTED':'';
		$timezone_html.='<option value="'.$key.'"'.$selected.">$text</option>\n";
	}
}

$results_pp=array(5,10,15,20,25,50,100);
$results_pp_html='';
foreach ($results_pp as $key => $pp) {
	$selected = ($config['tickets_per_page'] == $pp) ? ' SELECTED': '';
	$results_pp_html.='<option'.$selected.">$pp</option>\n";
}

$predef_answers_html='';
if ($config['answers']) {
	foreach ($config['answers'] as $key => $answer) {
		$selected = ($_POST['answer'] == $key) ? ' SELECTED': '';
		$key=htmlspecialchars($key);
		$predef_answers_html.='<option'.$selected.">$key</option>\n";
	}
}
$pri_html='';
$pri=$config['pri'][(string) $_POST['pri']];
if ($config['pri']) {
	foreach ($config['pri'] as $key => $val) {
		$selected = ($pri == $val) ? ' SELECTED': '';
		$pri_html.='<option'.$selected.' value="'.$key.'"'.">$val</option>\n";
	}
}
$pri_text=$pri?htmlspecialchars($config['pri_text'][$pri]):'';
$pri_style=$pri?htmlspecialchars($config['pri_style'][$pri]):'';
//echo "<pre>"; print_r($config); echo "</pre>";

$themedirs=getfiles($themes_dir);
$theme_html='';
foreach ($themedirs as $dir) {
	$selected = ($config['theme'] == $dir) ? ' SELECTED': '';
	$theme_html.='<option'.$selected.">$dir</option>\n";
}

?>
<br>
<form name="pref" action="<?=htmlspecialchars($_SERVER['REQUEST_URI'])?>" method="post">
  <input type="hidden" name="a" value="pref">
      <table width="100%" border="0" cellspacing="1" cellpadding="2" class="TableMsg">
        <tr>
          <td class="TableHeaderText" style="text-align: left;" width="100%"><a name="attach"></a><?=LANG_ATTACHMENTS?></td>
          <td></td>
        </tr>
        <tr>
          <td class="mainTable"><?=LANG_ACC_ATTACH?>:</td>
          <td class="mainTableAlt">
            <input type="checkbox" name="accept_attachments" <?=htmlspecialchars($config['accept_attachments'])? ' checked': ''?>>
            <b><?=LANG_WARNING?>:</b><?=LANG_ACC_ATTACH_TIP?></td>
        </tr>
        <tr>
          <td class="mainTable"><?=LANG_MAX_FILE_SIZE?>:</td>
          <td class="mainTableAlt">
            <input type="text" name="attachment_size" value="<?=htmlspecialchars($config['attachment_size'])?>">
          </td>
        </tr>
        <tr>
          <td class="mainTable"><?=LANG_ATTACH_URL_PATH?>:</td>
          <td class="mainTableAlt">
            <input type="text" size="70" name="attachment_url" READONLY value="<?=htmlspecialchars($config['attachment_url'])?>">
          </td>
        </tr>
        <tr>
          <td class="mainTable"><?=LANG_ATTACH_DIR?>:</td>
          <td class="mainTableAlt">
            <input type="text" size="70" name="attachment_dir" value="<?=htmlspecialchars($config['attachment_dir'])?>">
            <br><?=LANG_ATTACH_DIR_TIP?>
          </td>
        </tr>
        <tr>
          <td class="mainTable"><?=LANG_ACC_FILE_TYPES?>:</td>
          <td class="mainTableAlt"> 
            <table>
              <tr>
                <td> 
                  <select size="5" name="filetypes">
		              		<?=$types_html?>
                  </select>
                </td>
                <td valign="top"> 
                  <input type="submit" name="remove_filetype" value="<?=LANG_REM_TYPE?>" class="inputsubmit">
                  <br>
                  <table>
                    <tr>
                      <td>
                        <input type="text" name="ext" size="4">
                      </td>
                      <td>
                        <input type="submit" name="add_filetype" value="<?=LANG_ADD?>" class="inputsubmit">
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
			<br><input class="inputsubmit" type="submit" name="submitpref" value="<?=LANG_SAVE_CHANGES?>"><br><br>
      <table width="100%" border="0" cellspacing="1" cellpadding="2" class="TableMsg">
        <tr>
          <td class="TableHeaderText" style="text-align: left;" width="100%"><a name="mail"></a><?=LANG_MAIL?></td>
          <td></td>
        </tr>
        <tr>
          <td class="mainTable" style="text-align: left;" width="100%"><?=LANG_ANS_METHOD?>:</td>
          <td class="mainTableAlt">
            <select name="answer_method">
              <option value="automatic"<?=htmlspecialchars($config['answer_method']) == 'automatic'?' selected':''?>>automatic</option>
              <option value="pop3"<?=htmlspecialchars($config['answer_method']) == 'pop3'?' selected':''?>>pop3</option>
            </select>
          </td>
        </tr>
        <tr>
          <td class="mainTable"><?=LANG_SAVE_EMAIL_HEADERS?>:</td>
          <td class="mainTableAlt">
            <input type="checkbox" name="save_headers"<?=htmlspecialchars($config['save_headers'])?' checked':''?>>
          </td>
        </tr>
        <tr>
          <td class="mainTable"><?=LANG_MIN_EMAIL_INT?>:</td>
          <td class="mainTableAlt">
            <input type="text" name="min_interval" value="<?=htmlspecialchars($config['min_interval'])?>">
          </td>
        </tr>
        <tr>
          <td class="mainTable"><?=LANG_MAX_OPEN_TICKETS?>:</td>
          <td class="mainTableAlt">
            <input type="text" name="ticket_max" value="<?=htmlspecialchars($config['ticket_max'])?>">
          </td>
        </tr>
        <tr>
          <td class="mainTable"><?=LANG_REM_ORIGINAL_EMAIL?>:</td>
          <td class="mainTableAlt">
            <input type="checkbox" name="remove_original"<?=htmlspecialchars($config['remove_original'])?' checked':''?>>
          </td>
        </tr>
        <tr>
          <td class="mainTable"><?=LANG_REM_TAG?>:</td>
          <td class="mainTableAlt">
            <input type="text" name="remove_tag" value="<?=htmlspecialchars($config['remove_tag'])?>">
          </td>
        </tr>
      </table>
			<br><input class="inputsubmit" type="submit" name="submitpref" value="<?=LANG_SAVE_CHANGES?>"><br><br>
		<table width="100%" border="0" cellspacing="1" cellpadding="2" class="TableMsg">
			<tr>
				<td class="TableHeaderText" style="text-align: left;" width="100%"><a name="misc"></a><?=LANG_MISC?></td>
				<td></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_ROOT_URL?>:</td><td class="mainTableAlt">
					<input type="text" name="root_url" value="<?=htmlspecialchars($config['root_url'])?>">
				</td>
			</tr>
			<tr class="mainTable">
				<td><?=LANG_SEARCH_ON_MAIN?>:</td>
				<td class="mainTableAlt">
					<input type="checkbox" name="search_disp"<?=htmlspecialchars($config['search_disp'])? ' checked': ''?>>
				</td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_PREF_TIMEZONE?>:</td>
				<td class="mainTableAlt">
					<select name="timezone">
          <?=$timezone_html;?>
					</select>
					<?php echo LANG_SYSTEM_TIMEZONE.': '.date('O'); ?>
				</td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_TICKETS_PP?>:</td>
				<td class="mainTableAlt">
					<select name="tickets_per_page">
              <?=$results_pp_html;?>
					</select>
				</td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_NO_ANS_MSGS?>:</td>
				<td class="mainTableAlt">
					<input type="text" name="umq" value="<?=htmlspecialchars($config['umq'])?>">
				</td>
			</tr>
			<tr>
				<td class="mainTable"><a href="http://www.php.net/date" target="_new"><?=LANG_TIME_FORMAT?></a>:</td>
				<td class="mainTableAlt"><input type="text" name="time_format" value="<?=htmlspecialchars($config['time_format'])?>"></td>
			</tr>
		</table>
		<br><input class="inputsubmit" type="submit" name="submitpref" value="<?=LANG_SAVE_CHANGES?>">
</form>
<br><br>
<form name="pref" action="<?=htmlspecialchars($_SERVER['REQUEST_URI']).'#settings';?>" method="post">
  <input type="hidden" name="a" value="pref">
		<table width="100%" border="0" cellspacing="1" cellpadding="2" class="TableMsg">
			<tr>
				<td class="TableHeaderText" style="text-align: left;" width="100%"><a name="settings"></a><?=LANG_SETTINGS?></td>
				<td></td>
			</tr>
			<tr>
				<td class="mainTable"><a href="http://www.php.net/date" target="_new"><?=LANG_SHORT_DATE_FORMAT?></a>:</td>
				<td class="mainTableAlt"><input type="text" name="short_date_format" value="<?=htmlspecialchars($config['short_date_format'])?>"></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_THEME?>:</td>
				<td class="mainTableAlt">
					<select name="theme">
						<?=$theme_html?>
					</select>
				</td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_CHARSET?>:</td>
				<td class="mainTableAlt"><input type="text" name="charset" value="<?=htmlspecialchars($config['charset'])?>"></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_PRESIG?>:</td>
				<td class="mainTableAlt">
					<textarea name="presig" id="presig" cols="60" rows="4" wrap="soft"><?=htmlspecialchars($config['presig'])?></textarea>
				</td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_SITE_TITLE?>:</td>
				<td class="mainTableAlt"><input type="text" name="site_title" value="<?=htmlspecialchars($config['site_title'])?>"></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_NO_SUBJECT?>:</td>
				<td class="mainTableAlt"><input type="text" name="nosubject" value="<?=htmlspecialchars($config['nosubject'])?>"></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_TICKET_FORMAT?>:</td>
				<td class="mainTableAlt"><input type="text" name="ticket_format" value="<?=htmlspecialchars($config['ticket_format'])?>"></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_SUBJECT_RE?>:</td>
				<td class="mainTableAlt"><input type="text" name="subject_re" value="<?=htmlspecialchars($config['subject_re'])?>"></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_SPAMASSASSIN_ENABLE?>:</td>
				<td class="mainTableAlt"><input type="checkbox" name="spamassassin_enable"<?=htmlspecialchars($config['spamassassin_enable'])? ' checked': ''?>></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_SPAM_WORD?>:</td>
				<td class="mainTableAlt"><input type="text" name="spamword" value="<?=htmlspecialchars($config['spamword'])?>"></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_FLOOD_MSG_RATE?>:</td>
				<td class="mainTableAlt"><input type="text" name="flood_msg_rate" value="<?=htmlspecialchars($config['flood_msg_rate'])?>"></td>
			</tr>
		</table>
		<br><input class="inputsubmit" type="submit" name="submitset" value="<?=LANG_SAVE_CHANGES?>"><br><br>
</form>

<br>
<form name="pref" action="<?=htmlspecialchars($_SERVER['REQUEST_URI']).'#predefined';?>" method="post">
  <input type="hidden" name="a" value="pref">
		<table width="100%" border="0" cellspacing="1" cellpadding="2" class="TableMsg">
			<tr>
				<td class="TableHeaderText" style="text-align: left;" width="100%"><a name="predefined"></a><?=LANG_PREDEFINED?></td>
				<td></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_PREDEFINED?>:</td>
				<td class="mainTableAlt">
					<select name="answer">
						<?=$predef_answers_html?>
					</select>
					<input type="submit" name="answer_load" value="<?=LANG_LOAD?>" class="inputsubmit">
					<input type="submit" name="answer_remove" value="<?=LANG_REM?>" class="inputsubmit">
					<br>
					<input type="text" name="answer_key" value="<? if ($_POST['answer_load'] || $_POST['answer']) echo htmlspecialchars($_POST['answer']); ?>">
					<input type="submit" name="answer_add" id="answer_add" value="<?=LANG_ADD?>" class="inputsubmit">
					<textarea name="answer_value" id="answer_value" cols="60" rows="6" wrap="soft"><? if ($_POST['answer_load'] || $_POST['answer']) echo htmlspecialchars($config['answers'][$_POST['answer']]); ?></textarea>
					<?php if ($_POST['answer']): ?>
					<input type="submit" name="answer_save" value="<?=LANG_SAVE?>" class="inputsubmit">
					<?php endif; ?>
				</td>
			</tr>
		</table>
</form>

<br>
<form name="pref" action="<?=htmlspecialchars($_SERVER['REQUEST_URI']).'#priority';?>" method="post">
  <input type="hidden" name="a" value="pref">
		<table width="100%" border="0" cellspacing="1" cellpadding="2" class="TableMsg">
			<tr>
				<td class="TableHeaderText" style="text-align: left;" width="100%"><a name="priority"></a><?=LANG_PRIORITY?></td>
				<td></td>
			</tr>
			<tr>
				<td class="mainTable"><?=LANG_PRIORITY?>:</td>
				<td class="mainTableAlt">
					<select name="pri">
						<?=$pri_html?>
					</select>
					<input type="submit" name="pri_load" value="<?=LANG_LOAD?>" class="inputsubmit">
					<input type="text" name="pri_text" value="<?=$pri_text?>">
					<input type="text" name="pri_style" value="<?=$pri_style?>">
					<?php if (isset($_POST['pri'])): ?>
					<input type="submit" name="pri_save" value="<?=LANG_SAVE?>" class="inputsubmit">
					<?php endif; ?>
				</td>
			</tr>
		</table>
</form>