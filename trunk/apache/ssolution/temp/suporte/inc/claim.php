<?php

if(!defined('ISINC')) die('serious error');

	// CLAIM THE TICKET
  if ($_SESSION['user']['type'] === 'admin' && $ticket->status != 'closed') {
    if ($rep_row['ID'] == 0 ) {
	    $sql="SELECT * FROM ".$db_table['reps']." where username = '".$_SESSION['user']['id']."' LIMIT 1";
	    $uid_res = mysql_query($sql);
	    $uid_raw = mysql_fetch_array($uid_res);
    	
    	$vars=array();
      $vars['form_action']=htmlspecialchars($_SERVER['REQUEST_URI']);
			$vars['ticketid']=$ticket->id;
			$vars['text']=LANG_UNASSIGNED_TICKET.' '.LANG_CLAIM_TEXT;
			$vars['submit_text']=LANG_CLAIM_IT;
			$vars['myuid']=$uid_raw['ID'];

      $html='<div id="claim-ticket">
	    <form name="claim" action="$form_action" method="POST">
	    	<input type="hidden" name="a" value="transfer_rep">
	    	<input type="hidden" name="tid" value="$ticketid">
	    	<input type="hidden" name="rid" value="$myuid">
	    	<p>$text <input type="submit" value="$submit_text"></p>
	    </form>
	    </div>';
	    
			foreach ($vars as $key => $val) {
				$html=preg_replace('/\$'.$key.'/i',$val,$html);
			}
			echo $html;
    }
  }
?>
