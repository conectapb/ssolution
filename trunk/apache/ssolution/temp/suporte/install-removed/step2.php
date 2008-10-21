<?php
if (!$step) { header('Location: install.php'); die(); }
//step2: check database details are correct, create/upgrade database and load a form of adjustable settings for step3
if (!isset($errors)) { //check the database connection
	$conn = @mysql_connect($_POST['db_host'],$_POST['db_user'],$_POST['db_pass']);
	if (!$conn) { $errors[]='Cannot connect to the database <b>server</b> using the information provided.'; }
}

if (!isset($errors)) { //check the database name
		echo "<p>Database connection established...</p>\n";
		$selectdb=mysql_select_db($_POST['db_name'], $conn);
		if(!$selectdb) { $errors[]='Connected to the database, but the database name is incorrect.'; }
}

if (!isset($errors)) { //database works, time to create/upgrade
		//database prefix
		$db_table_prefix=$_POST['db_table_prefix']?$_POST['db_table_prefix']:'ticket_';
		$db_table_tickets=$_POST['db_table_tickets']?$_POST['db_table_tickets']:'tickets';

		echo '<div class="databases">';
		echo "<p><b>Found database...</b></p>\n";
		echo "<p><b>Innitialising database...</b></p>\n";
		
		//load .sql file into database
		if ($installed) { $files=array('upgrade.sql'); }
		else { $files=array('create.sql','upgrade.sql'); }
		foreach ($files as $file) {
			if (file_exists($file)) {
				$end=' <a href="#end">(skip to end)</a>';
				echo "<p><b>Running queries from '$file'...</b>$end</p>\n";
				$sql_query=file_get_contents($file);
				//fix the table prefix on the fly... (not that it works fully yet)
				if ((isset($db_table_prefix)) && ($db_table_prefix != 'ticket_')) {
					$sql_query=str_replace('CREATE TABLE `ticket_','CREATE TABLE `'.$db_table_prefix,$sql_query);
					$sql_query=str_replace('INSERT INTO `ticket_','INSERT INTO `'.$db_table_prefix,$sql_query);
					$sql_query=str_replace('ALTER TABLE `ticket_','ALTER TABLE  `'.$db_table_prefix,$sql_query);
					$sql_query=str_replace('OPTIMIZE TABLE `ticket_','OPTIMIZE TABLE `'.$db_table_prefix,$sql_query);
				}
				if ((isset($db_table_tickets)) && ($db_table_tickets != 'tickets')) {
					$sql_query=str_replace('CREATE TABLE `tickets','CREATE TABLE `'.$db_table_prefix,$sql_query);
					$sql_query=str_replace('INSERT INTO `tickets','INSERT INTO `'.$db_table_prefix,$sql_query);
					$sql_query=str_replace('ALTER TABLE `tickets','ALTER TABLE  `'.$db_table_prefix,$sql_query);
					$sql_query=str_replace('OPTIMIZE TABLE `tickets','OPTIMIZE TABLE `'.$db_table_prefix,$sql_query);
				}
				if (!mysql_run_queries($sql_query,$installed)) {
					$warn = 'There was a database query problem. Usually you can ignore these.';
					echo "<p><b>WARNING:</b> $warn</p>\n";
				}
			}
			else { $errors[]="Cannot locate '$file'."; }
		}
		echo '</div>';
}

echo '<a id="end"></a>';
if (!isset($errors)) {

	//get configuration from database
	$config=@mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table_prefix.'config'));
	
	//let's guess some vars...
	$perlpath=perlpath();

	//get rootpath details
	if (!$installed) { $rootpath_dir=rootpath_dir(); }

	//url details
	if ($installed) { $root_url=$config['root_url']; }
	else { $root_url=root_url(); }

	if ($installed) {
	//get first rep from database
	$rep=@mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table_prefix.'reps'));

	//get first cat from database
	$cat=@mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table_prefix.'categories'));
	}
	else {
		$domain=str_replace('www.','',$_SERVER['HTTP_HOST']);
		$site_title=$domain.' - Helpdesk';
	}

	//email details
	$admin_user=$rep['username']? $rep['username']:'admin';
	$admin_email=$rep['email']? $rep['email']:$admin_user.'@'.$domain;
	$admin_name=$rep['name']? $rep['name']:'Administrator';
	
	//cat details
	$cat_name=$cat['name']? $cat['name']:'Support';
	$cat_tmpname=preg_replace('/\s\s+/', '', $cat_name);//remove whitespace
	$cat_email=$cat['email']? $cat['email']:strtolower($cat_tmpname).'@'.$domain;
	
	//attachments
	if ($installed) { $attachment_dir=$config['attachment_dir']? $config['attachment_dir']:'attachments'.SLASH; }
	else { $attachment_dir=$rootpath_dir.'attachments'.SLASH; }
	
	//no return
	$no_return=$config['limit_email']? $config['limit_email']:'noreply@'.$domain;

	$output='<hr><p>Enter your settings:</p>
	<table>
	<form id="settings" name="settings" method="post">
	
	<tr>
	<td><label>Path to perl (for automail.pl)</label></td>
	<td><input name="perlpath" type="text" value="'.$perlpath.'" />
	</tr>

	<tr>
	<td><label>Admin Username</label></td>
	<td><input name="admin_user" type="text" value="'.$admin_user.'" size="32" disabled />
	</tr>
	<tr>
	<td colspan=2>You need to know this to login.</td>
	</tr>

	<tr>
	<td><label>Admin Password</label></td>
	<td><input name="admin_pass" type="password" value="" size="32" />
	</tr>
	<tr>
	<td colspan=2>Please enter a secure password.</td>
	</tr>

	<tr>
	<td><label>Admin Name</label></td>
	<td><input name="admin_name" type="text" value="'.$admin_name.'" size="32" />
	</tr>
	<tr>
	<td colspan=2>(eg: Administrator)</td>
	</tr>

	<tr>
	<td><label>Admin Email</label></td>
	<td><input name="admin_email" type="text" value="'.$admin_email.'" size="32" />
	</tr>
	<tr>
	<td colspan=2>(eg: "admin@example.com")</td>
	</tr>

	<tr>
	<td><label>Default Category Name</label></td>
	<td><input name="cat_name" type="text" value="'.$cat_name.'" size="32" />
	</tr>
	<tr>
	<td colspan=2>(eg: "Support") - Can be changed later</td>
	</tr>
	
	<tr>
	<td><label>Default Category Email Address</label></td>
	<td><input name="cat_email" type="text" value="'.$cat_email.'" size="32" />
	</tr>
	<tr>
	<td colspan=2>(eg: "support@example.com")</td>
	</tr>
	
	<tr>
	<td><label>Root Path Dir</label></td>
	<td><input name="rootpath_dir" type="text" value="'.$rootpath_dir.'" size="32" /> 	 
	</tr> 	 
	<tr> 	 
	<td colspan=2>(eg: "/home/user/public_html/helpdesk/")</td>
	</tr>
	<tr>
	<td colspan=2>NOTE: MUST HAVE TRAILING SLASH</td>
	</tr>

	<tr>
	<td><label>Root URL</label></td>
	<td><input name="root_url" type="text" value="'.$root_url.'" size="32" />
	</tr>
	<tr>
	<td colspan=2>(eg: "http://www.example.com/helpdesk")</td>
	</tr>

	<tr>
	<td><label>Site Title</label></td>
	<td><input name="site_title" type="text" value="'.$site_title.'" size="32" />
	</tr>
	<tr>
	<td colspan=2>(eg: "Your Company - Helpdesk")</td>
	</tr>

	<tr>
	<td><label>Attachments Upload Directory</label></td>
	<td><input name="attachment_dir" type="text" value="'.$attachment_dir.'" size="32" />
	</tr>
	<tr>
	<td colspan=2>(eg: just "attachments" or "/home/user/attachments/" if its not in your web dir)</td>
	</tr>
	
	<tr>
	<td><label>Email Address of No Return</label></td>
	<td><input name="no_return" type="text" value="'.$no_return.'" size="32" />
	</tr>
	<tr>
	<td colspan=2>(eg: "noreply@example.com" this must be a none existant address at your domain)</td>
	</tr>

	<tr>
	<td><label></label></td>
	<td>
		<input type="hidden" name="db_type" value="'.$_POST['db_type'].'" />
		<input type="hidden" name="db_host" value="'.$_POST['db_host'].'" />
		<input type="hidden" name="db_name" value="'.$_POST['db_name'].'" />
		<input type="hidden" name="db_user" value="'.$_POST['db_user'].'" />
		<input type="hidden" name="db_pass" value="'.$_POST['db_pass'].'" />
		<input type="hidden" name="db_table_prefix" value="'.$db_table_prefix.'" />
		<input type="hidden" name="db_table_tickets" value="'.$db_table_tickets.'" />
		<input type="hidden" name="step" value="3">
		<input type="submit" name="Submit" value="Update Settings" />
		</td>
	</tr>
	</form></table>';
}

if (isset($errors)) {
  $output=DisplayErrors($errors);
  $output.='<form id="thisform">
  <input type="button" onclick="window.history.go(-1)" value="Go Back" />
  </form>';
}

echo $output;

?>