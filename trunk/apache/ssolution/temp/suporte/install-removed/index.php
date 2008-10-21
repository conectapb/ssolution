<?php $include='header.php'; if (file_exists($include)) { include_once($include); } ?>

<h2>Welcome to the eTicket Installer!</h2>
	<h3>Introduction</h3>
		<p>eTicket is an electronic (open source) support ticket system based on osTicket, 
			that can receive tickets via email (pop3 or pipe) and a web-based form, as well as manage them using a 
			web interface, with many new features and bug fixes. It makes an ideal helpdesk solution for any web site.</p>
		<p>Please make sure you have read the <a href="../readme.html">readme</a> file before you continue.</p>

	<h3>Upgrading</h3>
		<p><b>NOTICE: Always make backup your files AND database first!</b></p>
		<p>If you ARE upgrading, (backup: attachements, settings.php and automail-settings.pl FIRST), remove all 
			files and folders, upload the new ones, and finally restore any files you backed up.</p>
		<p>Then, you MUST follow the upgrade <a href="upgrade.php">sql upgrade</a> to update the database.</p>

	<h3>Installation</h3>
		<p>eTicket can be both installed from fresh or upgraded from previous versions of osTicket or eTicket. 
			The installer will handle both. Go to the <a href="./install.php">installer</a>.</p>
		<p>If you wish to do a clean install, please ensure you drop all your tables before running the installer.</p>

<p><b>NOTICE: Always make backup your files AND database first!</b></p>

<?php $include='footer.php'; if (file_exists($include)) { include_once($include); } ?>