<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>eTicket</title>
<link rel="stylesheet" href="style.css" type="text/css">
<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="text/html; charset=ISO-8859-1">
<script language="JavaScript" type="text/javascript">
<!--
function PopWindow()
{
window.open('help.php','help','width=400,height=250,menubar=no,scrollbars=no,toolbar=no,location=yes,directories=no,resizable=no,top=200,left=300');
}
//-->
</script>
</head>
<body>
<!-- // Start container // -->
<div class="container">
		<!-- // Start header // -->
		<h1><a href="index.php"><img src="images/logo.gif" alt="<?=$site_title?>" border="0"></a></h1>
			<div class="nav">
				<ul>
					<li>
					<?php if (isset($login) && ($login != 0) && isset($_SESSION['user']['id'])) {
					echo LANG_USER.': '.$_SESSION['user']['id']; 
					} ?>
					</li>
					<li id="home"><a href="index.php"><img src="images/arrow.gif" border="0" alt="<?=LANG_MAIN?>"> <?=LANG_MAIN?></a></li>
					<?php if (isset($login) && ($login != 0) && isset($_SESSION['user']['type'])) {?>
					<li><a href="JavaScript:PopWindow()"><img src="images/arrow.gif" border="0" alt="<?=LANG_HELP?>"> <?=LANG_HELP?></a></li>
					<?php if (!$config['search_disp']) { ?>
					<li><a href="search.php"><img src="images/arrow.gif" border="0" alt="<?=LANG_SEARCH?>"> <?=LANG_SEARCH?></a></li>
					<?php } if ($_SESSION['user']['type'] == 'admin') { ?>
					<li><a href="newticket.php"><img src="images/arrow.gif" border="0" alt="<?=LANG_NEW_TICKET?>"> <?=LANG_NEW_TICKET?></a></li>
					<?php } else { ?>
					<li><a href="open.php"><img src="images/arrow.gif" border="0" alt="<?=LANG_NEW_TICKET?>"> <?=LANG_NEW_TICKET?></a></li>
					<?php } ?>
					<li><a href="index.php?a=logout"><img src="images/arrow.gif" border="0" alt="Logout"> Logout</a></li>
					<?php } ?>
				</ul>
			</div>
		<!-- // End header // -->
	
<!-- // Start content // -->
<div class="content">%%BODY%%</div>
<!-- // End of content // -->
	
	<!-- // Start of pre-footer // -->
	<div class="pre-footer">Support Ticket System</div>
	<!-- // End of pre-footer-table // -->	

	<!-- // Start of footer // -->
	<a href="http://eticket.sourceforge.net/"><img src="images/powered_by.gif" border="0" alt="Powered By eTicket" style="float: right;"></a>
	<div class="footer">
	eTicket
	</div>
	<!-- // End of footer // -->

</div>
<!-- // End of container // -->
</body>
</html>