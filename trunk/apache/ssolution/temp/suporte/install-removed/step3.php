<?php
if (!$step) { header('Location: ./install.php'); die(); }
//step3: write db info to files, update config/rep/cat tables, and load settings into settings table

#if (empty($_POST['admin_user'])) { $errors[]='Admin username must NOT be blank!'; }
if (empty($_POST['admin_name'])) { $errors[]='Admin name must NOT be blank!'; }
if (empty($_POST['admin_email'])) { $errors[]='Admin email must NOT be blank!'; }
if (empty($_POST['admin_pass'])) { $errors[]='Admin password must NOT be blank!'; }
if (empty($_POST['cat_name'])) { $errors[]='Default category name must NOT be blank!'; }
if (empty($_POST['cat_email'])) { $errors[]='Default category email must NOT be blank!'; }
if (!file_exists($_POST['rootpath_dir'])) { $errors[]='The rootpath directory you entered does not exist!'; }

if (!isset($errors)) {
	if (SLASH == '\\') { $_POST['rootpath_dir']=add_trailing_slash($_POST['rootpath_dir'],SLASH).SLASH.SLASH; } //fixed slashing for win

	//fields to look for when replacing
	$fields=array('db_type','db_host','db_name','db_user','db_pass','db_table_prefix','db_table_tickets');

		//update the settings.php file according to the new database settings
		$file='..'.SLASH.'settings.php';
		$str=file_get_contents($file);
		if($handle = fopen($file, 'w')) {
			foreach ($fields as $field) {
				$str=preg_replace("/($field)( = ')(.*)(';)/", '${1}${2}'.$_POST[$field].'${4}', $str);
			}
			if(fwrite($handle, $str)) {
				echo "<p>'$file' was updated successfully.</p>\n";
				fclose($handle);
			} 
			else { $errors[]="Could not write to '$file' file."; }
		} 
		else { $errors[]="<b>Could not open '$file' file for writing."; }
		unset($str);

		//update the automail-settings.pl file according to the new settings
		$file='..'.SLASH.'automail-settings.pl';
		$str=file_get_contents($file);
		if($handle = fopen($file, 'w')) {
			$str=preg_replace('/^(.*)/', '#!'.trim($_POST['perlpath']), $str);
			foreach ($fields as $field) {
				$str=preg_replace("/($field)( => ')(.*)(')/", '${1}${2}'.$_POST[$field].'${4}', $str);
			}
			if(fwrite($handle, $str)) {
				echo "<p>'$file' was updated successfully.</p>\n";
				fclose($handle);
			} 
			else { $errors[]="Could not write to '$file' file."; }
		} 
		else { $errors[]="Could not open '$file' file for writing."; }
		unset($str);

		//update the automail.pl file according to the new settings
		$file='..'.SLASH.'automail.pl';
		$str=file_get_contents($file);
		if($handle = fopen($file, 'w')) {
			$str=preg_replace('/^(.*)/', '#!'.trim($_POST['perlpath']), $str);
			if(fwrite($handle, $str)) {
				echo "<p>'$file' was updated successfully.</p>\n";
				fclose($handle);
			}
			else { $errors[]="Could not write to '$file' file."; }
		} 
		else { $errors[]="Could not open '$file' file for writing."; }
		unset($str);
}

if (!isset($errors)) {
		echo "<p>Updating settings...</p>\n";
		//update the settings.php file according to the new settings
		$file='..'.SLASH.'settings.php';
		$str=file_get_contents($file);
		$site_title_str=htmlspecialchars($_POST['site_title']);
		$rootpath_dir_str=$_POST['rootpath_dir'];
		$str=preg_replace("/(site_title=')(.*)(';)/", '${1}'.$site_title_str.'$3', $str);
		$str=preg_replace("/(rootpath_dir=')(.*)(';)/", '${1}'.$rootpath_dir_str.'$3', $str);
		$str=preg_replace("/(db_table_prefix=')(.*)(';)/", '${1}'.$db_table_prefix.'$3', $str);
		$str=str_replace('$installed=FALSE;', '$installed=TRUE;', $str);
		if($handle = fopen($file, 'w')) {
			if(fwrite($handle, $str)) {
				echo "<p>'$file' was updated successfully.</p>\n";
				fclose($handle);
			} 
			else { $errors[]="Could not write to '$file' file."; }
		} 
		else { $errors[]="<b>Could not open '$file' file for writing."; }
		unset($str);
}

	if (!isset($errors)) {
		$conn = @mysql_connect($_POST['db_host'],$_POST['db_user'],$_POST['db_pass']);
		if (empty($conn)) { $errors[]='Could not connect to database.'; }
		$db_selected = @mysql_select_db($_POST['db_name'], $conn);
		if (empty($db_selected)) { $errors[]='Could not select database.'; }
	}

	if (!isset($errors)) {
		echo '<p>Updating database...</p>';
		$queries=array();
		$queries[]="UPDATE `".$db_table_prefix."reps` SET email='".$_POST['admin_email']."' WHERE ID=1";
		$queries[]="UPDATE `".$db_table_prefix."reps` SET password='".md5($_POST['admin_pass'])."' WHERE ID=1";
		$queries[]="UPDATE `".$db_table_prefix."categories` SET name='".$_POST['cat_name']."' WHERE ID=1";
		$queries[]="UPDATE `".$db_table_prefix."categories` SET email='".$_POST['cat_email']."' WHERE ID=1";
		$queries[]="UPDATE `".$db_table_prefix."config` SET attachment_dir='".$_POST['attachment_dir']."'";
		$queries[]="UPDATE `".$db_table_prefix."config` SET root_url='".remove_trailing_slash($_POST['root_url'])."'";
		$queries[]="UPDATE `".$db_table_prefix."config` SET limit_email='".$_POST['no_return']."'";
		$queries[]="UPDATE `".$db_table_prefix."config` SET alert_email='".$_POST['no_return']."'";
		$queries[]="UPDATE `".$db_table_prefix."config` SET alert_user='".$_POST['admin_email']."'";
		foreach ($queries as $query) {
			mysql_query($query);
			if (mysql_error()) { $errors[]='Error: '.$query.' : '.mysql_error(); }
		}
	}
	
	if (!isset($errors)) {
		echo '<p>Loading settings...</p>';
		$db_settings=array();
		$query=@mysql_query('SELECT * FROM '.$db_table_prefix.'settings');
		while ($setting=mysql_fetch_array($query)) {
			$db_settings['settings'][$setting['id']]=$setting['value'];
			if (!empty($setting['group'])) {
				$db_settings[$setting['group']][$setting['key']]=$setting['value'];
			}
			else {
				$db_settings[$setting['key']]=$setting['value'];
			}
		}
		//incase we're missing these settings from the settings.php, defaults are loaded here. DO NOT EDIT.
		if (!isset($settings['site_title'])) $settings['site_title'] = $_POST['site_title'];
		if (!isset($settings['theme'])) $settings['theme'] = 'eticket';
		if (!isset($settings['charset'])) $settings['charset'] = 'UTF-8';
		if (!isset($settings['presig'])) $settings['presig'] = "\n\n";
		if (!isset($settings['pop3_automail'])) $settings['pop3_automail']='automail.php';
		if (!isset($settings['short_date_format'])) $settings['short_date_format'] = 'd/m/Y';
		if (!isset($settings['answer_subj'])) $settings['answer_subj'] = "[#%ticket] %subject";
		if (!isset($settings['answer_msg'])) $settings['answer_msg'] = "%answer";
		if (!isset($settings['pri'])) $settings['pri']=array(1,2,3);
		if (!isset($settings['pri_text'])) $settings['pri_text']=array('Low','Normal','High');
		if (!isset($settings['pri_style'])) $settings['pri_style']=array('class="priLow"','class="priNormal"','class="priHigh"');
		if (!isset($settings['default_search_days'])) $settings['default_search_days']='30';
		if (!isset($settings['rep_trans_response'])) $settings['rep_trans_response']=1;
		if (!isset($settings['rep_trans_subj'])) $settings['rep_trans_subj']='[#%ticket] Representative Transfer';
		if (!isset($settings['rep_trans_msg'])) $settings['rep_trans_msg']='Ticket was transferred to representative %rep_name.';
		if (!isset($settings['nosubject'])) $settings['nosubject']='[No Subject]';
		if (!isset($settings['ticket_format'])) $settings['ticket_format']='\\\[#([0-9]{6})\\\]';
		if (!isset($settings['subject_re'])) { $settings['subject_re'] = 'Re|Antw'; }
		if (!isset($settings['spamword'])) { $settings['spamword'] = '[SPAM]'; }
		if (!isset($settings['flood_msg_rate'])) { $settings['flood_msg_rate'] = 10; }
		if (!isset($settings['ANTISPAM_MAGICWORD'])) { $settings['ANTISPAM_MAGICWORD'] = 'ANTI_SPAM_MAGICWORD'; }
		if (!isset($settings['ANTISPAM_SUBJECT'])) { $settings['ANTISPAM_SUBJECT'] = 'Ticked Rejected: Mail detected as SPAM'; }
		if (!isset($settings['ANTISPAM_MSG'])) { $settings['ANTISPAM_MSG'] = 'Your email was detected as spam and has been rejected. If your email was not spam, please re-send your email, including the word "{MAGICWORD}" in the body of the email.'; }
		if (!isset($settings['ANTISPAM_EMAIL'])) { $settings['ANTISPAM_EMAIL'] = $_POST['no_return']; }
		if (!isset($settings['spamassassin_enable'])) { $settings['spamassassin_enable'] = 1; }

		if (!isset($settings['answers']) && is_array($answers)) { $settings['answers']=$answers; }
		$queries=array();
		foreach ($settings as $key => $value) {
			if (is_array($value)) {
				$group=$key;
				foreach ($value as $key => $val) {
					if (empty($db_settings[$group])) {
						$queries[]="INSERT INTO `".$db_table_prefix."settings` VALUES ('','$group','$key','$val')";
					}
				}
			}
			elseif (empty($db_settings[$key])) {
				$queries[]="INSERT INTO `".$db_table_prefix."settings` VALUES ('','','$key','$value')";
			}
		}
		foreach ($queries as $query) {
			mysql_query($query);
			if (mysql_error()) { $errors[]='Error: '.$query.' : '.mysql_error(); }
		}
	}

if (!isset($errors)) {
	//done
	$output='<p><a href="../">eTicket</a> appears to have installed successfully!</p>
	<p>Things to do next:</p>
	<ul>
	<li>Review the contents of "settings.php" and "automail-settings.pl", ensure settings meet your requirements</li>
	<li>chmod "settings.php" and "automail-settings.pl" to 644, no further editing is required</li>
	<li>chmod "automail.pl" to 755, must be executable</li>
	<li>If you want attachments enabled you MUST chmod 777 your attachments directory</li>
	<li>REMOVE the "install" directory from your server before you continue</li>
	<li>Login to the <a href="../admin.php">admin area to configure the helpdesk</a></li>
	<li>Setup email handling using the piping or pop3 method</li>
	<li>If you intend on using the pipe method, make sure you have SpamAssassin configured first</li>
	<li>Visit the <a href="http://sourceforge.net/projects/eticket/">eTicket Project Page</a>.</li>
	</ul>';
}

if (isset($errors)) {
	$output=DisplayErrors($errors);
	$output.='<p>Please fix the above error(s), install halted!</p>';
}

echo $output;

?>