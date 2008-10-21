<?php
if (!$step) { header('Location: install.php'); die(); }
//step1: database details, get them right and you may continue...
if (!isset($errors)) {
	$db_table_prefix=$db_table_prefix?$db_table_prefix:'ticket_';
	$db_table_tickets=$db_table_tickets?$db_table_tickets:'tickets';
	$output='<p>Enter your database settings:</p>
	<table>
	<form id="database" name="database" method="post">
	<tr>
	<td><label>Database Type</label></td>
	<td>
		<select name="db_type">
			<option value="mysql">MySQL</option>
		</select>
  </td>
	</tr>

	<tr>
	<td><label>Database Server</label></td>
	<td><input name="db_host" type="text" value="localhost" /></td>
	</tr>
	<tr>
	<td><label>Database Name</label></td>
	<td><input name="db_name" type="text" value="" /></td>
	</tr>

	<tr>
	<td><label>Database Username</label></td>
	<td><input name="db_user" type="text" value="" /></td>
	</tr>
	<tr>
	<td><label>Database Password</label></td>
	<td><input name="db_pass" type="password" value="" /></td>
	</tr>

	<tr>
	<td><label>Table Prefix*</label></td>
	<td><input name="db_table_prefix" type="text" value="'.$db_table_prefix.'" />
	</tr>
	<tr>
	<td colspan=2>(ie: "ticket_" makes the tables for config become "ticket_config")</td>
	</tr>
	
	<tr>
	<td><label>Tickets Table*</label></td>
	<td><input name="db_table_tickets" type="text" value="'.$db_table_tickets.'" />
	</tr>
	<tr>
	<td colspan=2>(ie: "tickets") we need this as in the past this table didn\'t have a prefix.</td>
	</tr>

	<tr>
	<td><label></label></td>
	<td><input type="submit" name="Submit" value="Submit" /></td>
	</tr>
	<input type="hidden" name="step" value="2" />
	</form>
	</table>
	<p>* If unsure, please leave it as is.</p>
	';
}

if (isset($errors)) {
	$output=DisplayErrors($errors);
	$output.='<p>Please fix the above error(s), install halted!</p>';
}

echo $output;

?>