<?php

if(!defined('ISINC')) die('serious error');

$id=preg_replace('/\D+/', '', $_GET['id']); //sanitise
if ($res=mysql_query("SELECT * FROM ".$db_table['tickets']." WHERE ID=".$id)) {
	if ($ticket_row=mysql_fetch_array($res)) {
		if ($ticket_row['cat']) { $cat_row=mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['categories']." WHERE ID=".$ticket_row['cat'])); }
		if ($ticket_row['rep']) { $rep_row=mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['reps']." WHERE ID=".$ticket_row['rep'])); }
	}
}

$show = $_SESSION['user']['type'] == 'admin' ? 1: !$cat_row['hidden'];
$admin_permis = ($_SESSION['user']['type'] == 'admin' && (@in_array($cat_row['ID'], $login['cat_access']) || $login['cat_access']['0'] == 'all' || $login['ID'] == ADMIN));
$client_permis = ($_SESSION['user']['type'] == 'client' && strtolower($ticket_row['email']) == $_SESSION['user']['id']);

if (!$client_permis && !$admin_permis) { $error=LANG_ERROR_DENIED; }
if (!$res || !mysql_num_rows($res)) { $error=LANG_ERROR_NOTFOUND; }

if (isset($error)) { echo '<p id="err">'.$error."</span>\n"; }

if (empty($error)):
	$ticket = new ticket($ticket_row);
	$form_action = htmlspecialchars($_SERVER['REQUEST_URI']);

	if ($ticket->priority) {
		$pri=$ticket->priority?$ticket->priority:2;
		$pri=$config['pri_text'][$pri];
		if ($_SESSION['user']['type'] === 'admin') {
			$pri_options='';
			foreach ($config['pri'] as $pri_value) {
				$pri_text=$config['pri_text'][$pri_value];
				$selected = ($pri_value == $ticket->priority) ? ' SELECTED': '';
				$pri_options.='<option value="'.$pri_value.'"'.$selected.'>'.$pri_text.'</option>';
			}
			if (!empty($pri_options)) {
				$pri='
				<form name="pri" action="'.$form_action.'" method="POST">
				<input type="hidden" name="a" value="priority">
				<input type="hidden" name="tid" value="'.$ticket->id.'">
				<select name="pri">
				'.$pri_options.'
				</select>
				<input type="submit" name="submit_pri" value="'.LANG_SUBMIT.'" class="inputsubmit">
				</form>';
			}
		}
	}
	// Claim This Ticket button
	$include=INC_DIR.'claim.php';
	if (file_exists($include)) { include_once($include); }
	?>
	<table align="center" class="msgBorderInfo" cellspacing="1" cellpadding="3" width="100%" border="0">
	<tr>
		<td width="100" class="mainTable"><b><?=LANG_TICKET_ID?>:</b></td>
		<td class="mainTable"><?=$ticket->id?></td>
	</tr>
	<tr>
		<td width="100" class="mainTable"><b><?=LANG_STATUS?>:</b></td>
		<td class="mainTable"><?=get_real_status_name($ticket->status)?></td>
	</tr>
	<tr>
		<td width="100" class="mainTable"><b><?=LANG_DATE?>:</b></td>
		<td class="mainTable"><?=$ticket->short_time?></td>
	</tr>
	<tr>
		<td class="mainTable"><b><?=LANG_SUBJECT?>:</b></td>
		<td class="mainTable"><?=htmlspecialchars(stripslashes($ticket->subject))?></td>
	</tr>
	<?php if ($ticket->name !== $ticket->email): ?>
	<tr>
		<td class="mainTable"><b><?=LANG_NAME?>:</b></td>
		<td class="mainTable"><?=htmlspecialchars(stripslashes($ticket->name))?></td>
	</tr>
	<?php endif; ?>
    <tr>
		<td class="mainTable"><b><?=LANG_EMAIL?>:</b></td>
		<td class="mainTable"><?=htmlspecialchars($ticket->email)?></td>
	</tr>
	<?php if ($ticket->ip): ?>
	<tr>
		<td class="mainTable"><b><?=LANG_IP?>:</b></td>
		<td class="mainTable"><a href="http://whoisx.co.uk/<?=$ticket->ip?>"><?=$ticket->ip?></a></td>
	</tr>	
	<?php endif; ?>
	<?php if ($ticket->phone): ?>
	<tr>
		<td class="mainTable"><b><?=LANG_PHONE?>:</b></td>
		<td class="mainTable"><?=$ticket->phone?></td>
	</tr>
	<?php endif; ?>
	<?php if ($pri): ?>
	<tr>
		<td class="mainTable"><b><?=LANG_PRIORITY?>:</b></td>
		<td class="mainTable"><?=$pri?></td>
	</tr>
	<?php endif; ?>
   <tr>
   <td class="mainTable"><b><?=LANG_REP?>:</b></td>
   <td class="mainTable">
    <?php
    if ($_SESSION['user']['type'] === 'admin') {
     if ($login['ID'] == ADMIN || $_SESSION['user']['ID'] === $rep_row['ID'] || !$ticket_row['rep']) {
     ?>
     <form name="rep" action="<?=htmlspecialchars($_SERVER['REQUEST_URI'])?>" method="POST">
     <input type="hidden" name="a" value="transfer_rep">
       <input type="hidden" name="tid" value="<?=$ticket->id?>">
         <select name="rid">
             <option value="0"></option>
             <?php
             $reps = mysql_query("SELECT * FROM ".$db_table['reps']);
             while ($rep = mysql_fetch_array($reps)) {
                 $selected = ($rep['ID'] == $rep_row['ID']) ? ' SELECTED': '';
             ?>
             <option value="<?=$rep['ID']?>"<?=$selected?>><?=$rep['name']?></option>
             <?php
             }
             ?>
         </select>
         <input type="checkbox" title="<?=LANG_SEND_ALERT?>" name="trans_alert" checked>
         <input type="submit" name="submit_rep" value="<?=LANG_TRANSFER?>" class="inputsubmit">
     </form>
     <?php
     }
     else { echo $rep_row['name']; }
    }
    else { echo $rep_row['name']; }
    ?>
     </td>
  </tr>
	</table>

	<table align="center" class="msgBorder" cellspacing="1" cellpadding="3" width="100%" border="0">
	<tr>
		<td width="100" class="mainTable"><b><?=LANG_CAT?>:</b></td>
		<td class="mainTable">
			<?php if ($_SESSION['user']['type'] === 'admin'): ?>
		  <form name="transfer" action="<?=$form_action?>" method="POST">
			<input type="hidden" name="a" value="transfer">
			<input type="hidden" name="tid" value="<?=$ticket->id?>">
      <table cellspacing="0" cellpadding="0" border="0">
      	<tr>
      		<td>
	          <select name="cid">
	    	    <?php
	    	    $cats = mysql_query("SELECT * FROM ".$db_table['categories']);
	    	    while ($cat = mysql_fetch_array($cats)) {
	    	        $selected = ($cat['ID'] == $cat_row['ID']) ? ' SELECTED': '';
	    	        $cat['name'] = $cat['hidden'] ? "$cat[name]*": $cat['name'];
	 	        ?>
	 	        <option value="<?=$cat['ID']?>"<?=$selected?>><?=$cat['name']?></option>
	    	    <?php } ?>
	    	    </select>
    	    </td>
    	    <td>&nbsp;</td>
    	    <td><?=LANG_OPT_MSG?>:</td>
					<td><input type="text" size="20" name="add_msg"></td>
					<td><?=LANG_SEND_ALERT?>:</td>
					<td><input type="checkbox" title="<?=LANG_SEND_ALERT?>" name="trans_alert" checked></td>
					<td><input type="submit" name="transfer" value="<?=LANG_TRANSFER?>" class="inputsubmit"></td>
      	</tr>
      </table>
			</form>
			<?php 
			endif;
			if ($_SESSION['user']['type'] != 'admin') { echo $cat_row['name']; }
			?>
		</td>
	</tr>
	</table>

	<?php
	//transfer section
	if ($ticket_row['trans_msg']): ?>
		<table align="center" class="msgBorder" cellspacing="1" cellpadding="3" width="100%" border="0">
			<tr>
				<td width="100" class="mainTable"><b><?=LANG_TRANS_NOTE?>:</b></td>
				<td class="mainTable"><?=$ticket_row['trans_msg']?></td>
			</tr>
		</table>
	<?php
	endif; //end transfer section

	//get all private messages if user is admin
	if ($_SESSION['user']['type'] == 'admin'):
		$priv_res=mysql_query("SELECT * FROM ".$db_table['privmsg']." WHERE ticket='$id'");
		$priv_rows=array();
		while ($priv_row = mysql_fetch_array($priv_res)) {
			$priv_rows[]=$priv_row;
		}
		if (!empty($priv_rows)):
?>
	<table class="msgBorder" cellspacing="1" cellpadding="3" width="100%" border="0">
		<tr class="mainTable">
			<td valign="top" width="100"><b><?=LANG_PRIV_MSGS?></b></td>
			<td>
				<table id="privmsgs" cellspacing="1" cellpadding="3" width="100%" border="0">
				<?php
				foreach ($priv_rows as $priv_row) {
					$rep = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['reps']." WHERE ID=".$priv_row['rep']));
					$datetime = format_time($config['time_format'], time_convert($priv_row['timestamp']));
					$file='';
					if ($priv_row['attachment']) { $file=$config['attachment_dir'].$priv_row['attachment']; }
					if (file_exists($file)) {
						$attachurl=$config['attachment_url'].'?file='.urlencode($priv_row['attachment']);
						$attach = '<a href="'.$attachurl.'">'.htmlspecialchars($priv_row['attachment']).'</a>';
						$attach.= '('.size_readable($file).')'.mp3_player($priv_row['attachment']);
						$attach='<br><span class="msgAttachments">'.$attach."</span>";
					}
					?>
					<form name="privmsg" action="<?=$form_action?>" method="POST">
					<input type="hidden" name="a" value="post">
					<input type="hidden" name="tid" value="<?=$ticket->id?>">
					<input type="hidden" name="privid" value="<?=$priv_row['ID']?>">
					<tr class="mainTable">
						<td>
							<b><?=$rep['name']?></b> <span class="datetime">(<?=$datetime?>)</span>
							<?php
							if (($_SESSION['user']['id'] == $priv_row['rep']) || $login['ID'] == ADMIN):
							?>
								<input class="inputsubmit" type="submit" id="delete" name="delete" value="<?=LANG_DELETE?>" onClick='if(confirm("<?php echo LANG_DELETE_CONFIRM; ?>")) return; else return false;'>
							<?php
							endif; //end privmsg delete
							?>
							<?=$attach?>
							<p class="privmsg"><?=clean_input($priv_row['message'])?></p>
						</td>
					</tr>
					</form>
				<?php
				}
				unset($priv_res);
				unset($priv_rows);
				?>
			</table>
			</td>
		</tr>
	</table>
<?php
	endif; // no private rows
?>
	<p class="privmsgs_form">
		<form name="privmsgs" action="<?=$form_action?>" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="a" value="post">
			<input type="hidden" name="tid" value="<?=$ticket->id?>">
			<input type="text" name="priv" id="priv" size="42">
			<input class="inputsubmit" type="submit" name="submit" value="<?=LANG_ADD?> <?=LANG_PRIV_MSG?>">
			<input type="file" name="attachment" id="attachment">
		</form>
	</p>
	<?php
	endif; //end private messages

	//get messages
	$msg_res = mysql_query("SELECT * FROM ".$db_table['messages']." WHERE ticket=".$ticket_row['ID']." ORDER BY timestamp");
	while ($msg_row = mysql_fetch_array($msg_res)) {
	$datetime=format_time($config['time_format'], time_convert($msg_row['timestamp']));
	?>
	<table align="center" class="msgBorder" cellspacing="1" cellpadding="3" width="100%" border="0">
		<tr class="msgReceived">
			<td class="msgReceived"><span class="datetime"><?=$datetime?></span></td>
		</tr>
	<?php
		//get file attachments
		$files = mysql_query("SELECT * FROM ".$db_table['attachments']." WHERE ref=".$msg_row['ID']." AND type='q'");
		$fstr=array();
		while ($file = mysql_fetch_array($files)) {
			if (file_exists($config['attachment_dir'].$file['filename'])) {
				$size = size_readable($config['attachment_dir'].$file['filename']);
				//we no longer need to restrict this to admin only links
				$fstr[]='<a href="'.$config['attachment_url'].'?file='.urlencode($file['filename']).'">'.htmlspecialchars($file['filename'])."</a> ($size) ".mp3_player($file['filename']);
			}
		}
		if (!empty($fstr)) {
			$fstr=implode(' ; ',$fstr);
			$fstr='<span class="attachments">'.LANG_ATTACHMENT.': '.$fstr."</span>\n";
		}
	 	if ($msg_row['headers'] && $_SESSION['user']['type'] == 'admin') {
	 		if (empty($fstr)) { $fstr=''; }
	 		$fstr=' <a href="admin.php?a=headers&amp;msg='.$msg_row['ID'].'" target="_new">['.LANG_HEADERS.']</a> '.$fstr;
	 	}
		if (!empty($fstr)) {
	 ?>
	 <tr class="msgAttachments">
	 	<td class="msgAttachments"><?=$headers.$fstr;?></td>
	 </tr>
		<?php
		}
		?>
		<tr class="msgBox">
			<td align="left">
				<?php
				$buffer=$msg_row['message'];
				$buffer=str_replace("\'","'",$buffer); //replaces stripslashes, bug #1721308
				$buffer=clean_input($buffer);
				echo $buffer;
				unset($buffer);
				?>
			</td>
		</tr>
	</table>
	
	<?php
	//get answers for messages
	$answers_res = mysql_query("SELECT * FROM ".$db_table['answers']." WHERE reference=".$msg_row['ID']." ORDER BY timestamp");
	while ($answer_row = mysql_fetch_array($answers_res)) {
		$rep = mysql_fetch_array(mysql_query("SELECT * FROM ".$db_table['reps']." WHERE ID=".$answer_row['rep']));
		$datetime=format_time($config['time_format'], time_convert($answer_row['timestamp']));
		?>
		<table align="center" class="msgBorder" cellspacing="1" cellpadding="3" width="100%" border="0">
			<tr class="msgAnswered">
				<td class="msgAnswered">
					<b><?=$rep['name']?></b> <span class="datetime">(<?=$datetime?>)</span>
				</td>
			</tr>
			<?php
			//get file attachments
			$files = mysql_query("SELECT * FROM ".$db_table['attachments']." WHERE ref=".$answer_row['ID']." AND type='a'");
			$fstr=array();
			while ($file = mysql_fetch_array($files)) {
				if (file_exists($config['attachment_dir'].$file['filename'])) {
					$size = size_readable($config['attachment_dir'].$file['filename']);
					$fstr[]='<a href="'.$config['attachment_url'].'?file='.urlencode($file['filename']).'">'.htmlspecialchars($file['filename'])."</a> ($size) ".mp3_player($file['filename']);
				}
			}
			if (!empty($fstr)) {
				$fstr=implode(' ; ',$fstr);
				$fstr='<span class="attachments">'.LANG_ATTACHMENT.': '.$fstr."</span>\n";
			?>
				<tr class="msgAttachments">
					<td class="msgAttachments"><?=$fstr?></td>
				</tr>
			<?php
			}
			?>
			<tr class="msgBox">
				<td align="left">
				<?php
				$buffer=$answer_row['message'];
				$buffer=str_replace("\'","'",$buffer); //replaces stripslashes, bug #1721308
				$buffer=clean_input($buffer);
				echo $buffer;
				unset($buffer);
				?>
				</td>
			</tr>
		</table>
<?php
	} //end while answers
	if ($_SESSION['user']['type'] === 'admin') { $lastid=$msg_row['ID']; }
	} //end while msgs
	if (empty($lastid)) { $lastid=$ticket_row['ID']; }
	
//post message form
if ($show):
	?>
	<form name="replyForm" action="<?=$form_action?>" method="post" enctype="multipart/form-data">
	<input type="hidden" name="a" value="post">
	<input type="hidden" name="id" value="<?=$lastid?>">
	<div style="margin: auto">
		<table border="0" cellspacing="0" cellpadding="5">
			<tr> 
				<td valign="top">
					<div style="text-align: right" class="resizer">
						<a href="javascript:resizer(1,'d')" id="bigger"><?=LANG_BIGGER?></a>
						<a href="javascript:resizer(-1,'d')" id="smaller"><?=LANG_SMALLER?></a>
					</div>
					<textarea name="message" id="d" cols="60" rows="8" wrap="soft"></textarea>
					<input type="hidden" id="textarea_next_time" name="textarea_next_time" value="8">
	      </td>
	      <td valign="top">
	<?php
	//Predefined answer responses MOD START
	if ((!empty($config['answers'])) && ($_SESSION['user']['type'] === 'admin')):
		?>
		<script language="javascript" type="text/javascript">
		function setMessage() {
		var newmessage = document.replyForm.responses.value;
		document.replyForm.message.value += newmessage;
		document.replyForm.message.focus();
		}
		</script>
		<br>
		<select name="responses" onChange="setMessage()">
		<option value="">[<?=LANG_PREDEFINED?>]</option>
			<?php
			foreach($config['answers'] as $key => $value) {
				$name=htmlspecialchars($ticket->name);
				$firstname=substr($firstname,0,strpos($firstname,' '));
				$value=str_replace('%name', $name, $value);
				$value=str_replace('%firstname', $firstname?$firstname:$name, $value);
			?>
				<option value="<?=htmlspecialchars($value);?>"><?=htmlspecialchars($key)?></option>
			<?php
			}
			?>
		</select>
			
		<?php
	endif; //end answers
	//Predefined answer responses MOD END
	?>
	
	<?php
	if ($config['accept_attachments']):
	?>
		<br>
			<input type="file" name="attachment" id="attachment" onchange="document.getElementById('moreUploadsLink').style.display = 'block';" />
			<div id="moreUploads"></div>
			<div id="moreUploadsLink" style="display:none;"><a href="javascript:addFileInput('moreUploads');">Attach another File</a></div>
	<?php
	endif;
	?>
	
		<table>
		<?php
		if ($_SESSION['user']['type'] === 'admin'):
		?>
				<tr>
					<td>
						<!--
						<input type="checkbox" name="priv" id="priv">
						<label for="priv"><?=LANG_PRIV_MSG?></label><br>
						-->
						<input type="checkbox" name="close" id="close">
						<label for="close"><?=LANG_REPLY_AND_CLOSE?></label>
					</td>
				</tr>
		<?php
		endif;
		?>
				<tr>
					<td>
						<input class="inputsubmit" type="submit" name="submit" value="<?=LANG_REPLY_TO_MSG?>">
					</td>
				</tr>
		<?php
		if (($_SESSION['user']['type'] == 'admin') && ($login[$a] || $login['ID'] == ADMIN)):
		?>
			<tr>
				<td>
					<br>
					<input class="inputsubmit" type="submit" name="delete" value="<?=LANG_DELETE?>" onClick='if(confirm("<?php echo LANG_DELETE_CONFIRM; ?>")) return; else return false;'>
				</td>
			</tr>
		<?php
		endif;
		?>
		</table>
	
				</td>
			</tr>
		</table>
	</form>
	</div>
	<div id="backtomain" style="margin: auto; text-align: center;"><a href="<?=$_SESSION['view']['qs']?$page.'?'.$_SESSION['view']['qs']:$page?>"><?=LANG_BACK_TO_MAIN?></a></div>
	<a name="end"></a>
	<?php
endif;// end $show
endif; //end error check
?>