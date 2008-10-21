<?php

if(!defined('ISINC')) die('serious error');

$name_html = '<input type="text" name="name" id="name" size="25" value="'.htmlspecialchars($_POST['name']).'">';
$email_html = '<input type="text" name="email" id="email" size="25" value="'.htmlspecialchars($_POST['email']).'">';
if ($login && $_SESSION['user']['type'] == 'client') {
	$client = mysql_fetch_array(mysql_query("SELECT DISTINCT name FROM ".$db_table['tickets']." WHERE email=".escape_string($_SESSION['user']['id'])));
	if ($client['name']) $name_html = '<input type="hidden" name="name" value="'.$client['name'].'">'.$client['name'];
	$email_html = '<input type="hidden" name="email" id="email" size="25" value="'.$_SESSION['user']['id'].'">'.$_SESSION['user']['id'];
}

// Disable hidden categories in user "new ticket" form, but not in admin form
if ($_SESSION['user']['type'] == 'admin') { $cats = mysql_query("SELECT * FROM ".$db_table['categories']); }
else { $cats = mysql_query("SELECT * FROM ".$db_table['categories']." WHERE NOT hidden"); }

$cat_options='';
while ($cat = mysql_fetch_array($cats)) {
	$selected = ($_POST['cat'] == $cat['ID']) ? ' SELECTED': '';
	$hidden = ($cat['hidden']) ? '*': '';
	$cat_options.='<option value="'.$cat['ID'].'"'.$selected.'>'.$cat['name'].$hidden.'</option>';
}

$pri_options='';
foreach ($config['pri'] as $pri) {
	$pri_text=$config['pri_text'][$pri];
	$pri_options.='<option value="'.$pri.'">'.$pri_text.'</option>';
}

//Predefined answer responses MOD START
if ((!empty($config['answers'])) && ($_SESSION['user']['type'] === 'admin')) {
	echo '
			<script language="javascript" type="text/javascript">
			function setMessage() {
			var newmessage = document.openForm.responses.value;
			document.openForm.answer.value += newmessage;
			document.openForm.answer.focus();
			}
			</script>
	';
	$response_options='';
	foreach($config['answers'] as $key => $value) {
		$name=htmlspecialchars($ticket->name);
		$firstname=substr($firstname,0,strpos($firstname,' '));
		$value=str_replace('%name', $name, $value);
		$value=str_replace('%firstname', $firstname?$firstname:$name, $value);
		$response_options.='<option value="'.htmlspecialchars($value).'">'.htmlspecialchars($key).'</option>';
	}
} //end answers

//Predefined answer responses MOD END

?>

<form name="openForm" action="<?=$_SERVER['PHP_SELF']?>" method="POST" enctype="multipart/form-data">
<table cellpadding="3" cellspacing="0" class="formTable">
	<tr>
		<td align="left"><b><?=LANG_NAME?>:</b></td>
		<td><?=$name_html?></td>
	</tr>
	<tr>
		<td align="left"><b><?=LANG_EMAIL?>:</b></td>
		<td><?=$email_html?></td>
	</tr>
<?php if (!$login): ?>
	<tr>
		<td align="left"><b><?=LANG_EMAIL_CONFIRM?>:</b></td>
		<td><input type="text" name="email_confirm" id="email_confirm" size="25" value="<?=htmlspecialchars($_POST['email_confirm'])?>"></td>
	</tr>
<?php endif; ?>
	<tr>
		<td align="left"><?=LANG_PHONE?>:</td>
		<td><input type="text" name="phone" id="phone" size="25" value="<?=htmlspecialchars($_POST['phone'])?>"></td>
	</tr>
	<tr>
		<td align="left"><b><?=LANG_DEPT?>:</b></td>
		<td>
			<select name="cat">
			<?=$cat_options;?>
			</select>
		</td>
	</tr>
	<tr>
		<td align="left"><b><?=LANG_SUBJECT?>:</b></td>
		<td><input type="text" name="subject" id="subject" size="35" value="<?=htmlspecialchars($_POST['subject'])?>"></td>
	</tr>
	<tr>
		<td align="left" valign="top"><b><?=LANG_MSG?>:</b></td>
		<td>
			<textarea name="message" id="message" cols="30" rows="6"><?=htmlspecialchars($_POST['message'])?></textarea>
			<?php if (file_exists('core.js') && !defined('NO_JS')): ?>
			<div style="text-align: right" class="resizer">
				<a href="javascript:resizer(1,'message')" id="bigger"><?=LANG_BIGGER?></a>
				<a href="javascript:resizer(-1,'message')" id="smaller"><?=LANG_SMALLER?></a>
			</div>
			<?php endif; ?>
		</td>
	</tr>
<?php
if ($login && $_SESSION['user']['type'] === 'admin'):
?>
	<tr>
		<td align="left" valign="top"><b><?=LANG_ANSWER?>:</b></td>
		<td>
			<textarea name="answer" id="answer" cols="30" rows="6"><?=htmlspecialchars($_POST['answer'])?></textarea>
			<?php if (file_exists('core.js') && !defined('NO_JS')): ?>
			<div style="text-align: right" class="resizer">
				<a href="javascript:resizer(1,'answer')" id="bigger"><?=LANG_BIGGER?></a>
				<a href="javascript:resizer(-1,'answer')" id="smaller"><?=LANG_SMALLER?></a>
			</div>
			<?php endif; ?>
	<?php
	//Predefined answer responses MOD START
	if ((!empty($config['answers'])) && ($_SESSION['user']['type'] === 'admin')):
		?>
		<br>
		<select name="responses" onChange="setMessage()">
		<option value="">[<?=LANG_PREDEFINED?>]</option>
		<?=$response_options?>
		</select>
		<?php
	endif;
	//Predefined answer responses MOD END
	?>
		</td>
	</tr>
<?php
endif;
?>
	<tr>
		<td align="left"><?=LANG_PRIORITY?>:</td>
		<td>
			<select name="pri" id="pri">
			<?=$pri_options?>
			</select>
		</td>
	</tr>
<?php 
	//CAPTCHA MOD - START
	if ((file_exists($rootpath_dir.$captcha_file)) && ($_SESSION['user']['type'] != 'admin')):
?>
	<tr valign="middle">
		<td align="left" nowrap><b><?=LANG_CAPTCHA_TITLE?>:</b></td>
		<td>
			<img src="<?=$root_url.'/'.$captcha_file?>" alt="<?=LANG_CAPTCHA_TITLE?>">
			<input id="captcha_input" name="captcha_input" type="text" value="" size="8" maxlength="6" onClick="document.forms[0].captcha_input.value='';"/>
		</td>
	</tr>
<?php 
		endif;
		//CAPTCHA MOD - END
?>
<?php if ($login && $config['accept_attachments']): ?>
	<tr>
		<td><?=LANG_ATTACHMENT?>:</td>
		<td>
			<input type="file" name="attachment" id="attachment" onchange="document.getElementById('moreUploadsLink').style.display = 'block';" />
			<div id="moreUploads"></div>
			<div id="moreUploadsLink" style="display:none;"><a href="javascript:addFileInput('moreUploads');">Attach another File</a></div>
		</td>
	</tr>
<?php
endif; // end accept attachments
?>
	<tr>
		<td>&nbsp;</td>
		<td>
			<input class="inputsubmit" type="submit" name="submit_x" value="<?=LANG_OPEN_TICKET?>">
			<input class="inputsubmit" type="reset" value="<?=LANG_RESET?>">
		</td>
	</tr>
</table>
</form>