<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License

	eTicket RSS Feed v0.2 *BETA*
*/

/* settings - you shouldn't need to edit these... */

$rss_template='<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/">
  <channel>
    <title>%site_title</title>
    <link>%url</link>
    <description>%site_title</description>
    <language>en-us</language>
%items
  </channel>
</rss>';

$item_template='    <item>
      <title>%ticket</title>
      <description>%subject</description>
      <pubDate>%date</pubDate>
      <guid isPermaLink="true">%link</guid>
      <link>%link</link>
    </item>';

$root_url=$config['root_url'];

@header('Cache-control: private');

require_once('init.php');

if ($_SESSION['user']['type'] == 'client') {
    $a = strtolower($_REQUEST['a']);
	if ($login) {

	//code start
	$where = $_SESSION['user']['type'] == 'client' ? "WHERE email='" . $_SESSION['user']['id'] . "'": '';
	$tickets_res = mysql_query("SELECT * FROM ".$db_table['tickets']." $where ORDER BY timestamp DESC");

	if($tickets_res):
	
			$output=$rss_template;
			$output=str_replace('%site_title',$site_title,$output);
			$output=str_replace('%url',$root_url,$output);
			$output=str_replace('%now',date('Z'),$output);

			$items='';

	while ($tickets_row = mysql_fetch_array($tickets_res)) {
		$eval = new Ticket($tickets_row);

		if ($eval->status == 'answered') {
			++$i;
			$um[$i] = $eval;
		}

		if ($_SESSION['user']['type'] == 'client' || (@in_array($eval->cat, $login['cat_access']) || $login['cat_access'][0] == 'all')) {

		$cat_res = mysql_query("SELECT * FROM ".$db_table['categories']." WHERE ID=$eval->cat");
        $cat_row = mysql_fetch_array($cat_res);
        
        $hide = ($_SESSION['user']['type'] == 'client' && $cat_row['hidden']);
        $cat_row['name'] = $hide ? LANG_IN_PROGRESS: $cat_row['name'];

			//item output start
			$ticket_link=$root_url.'/view.php?a=view&id='.$eval->id;
			$ticket_link=htmlspecialchars($ticket_link);
			$itemout = $item_template;
			$itemout=str_replace('%ticket',$eval->id,$itemout);
			$itemout=str_replace('%url',$root_url,$itemout);
			$itemout=str_replace('%link',$ticket_link,$itemout);
			$itemout=str_replace('%subject',$eval->subject,$itemout);
			$itemout=str_replace('%date',$eval->short_time,$itemout);
			//item output end
			$items.=$itemout;
		}
	}
	endif;

	$output=str_replace('%items',$items,$output);
	}
	else { $inc = 'user_login'; }
}
else { $inc = 'user_login'; }
//code end

if (isset($inc)) {
	$include=$site_header; if (file_exists($include)) { include_once($include); }
	$include=$site_errors; if (file_exists($include)) { include_once($include); }
	include_once(INCLUDE_DIR."$inc.php");
	$include=$site_footer; if (file_exists($include)) { include_once($include); }
}
else { header('Content-Type: text/xml'); echo $output; }

?>