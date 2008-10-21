<?php

if(!defined('ISINC')) die('serious error');

if (!$_SESSION['user']) { logout($page); } //logout to force login if there's no user
if ($_REQUEST['reset']) { unset($_SESSION['view']); } //reset view settings

/* Filter & Session Data - START */

//Switch view status
if ($a == 'view_open') { $_SESSION['view']['status'] = 'open'; }
elseif ($a == 'view_closed') { $_SESSION['view']['status'] = 'closed'; }
elseif ($a == 'view_answered') { $_SESSION['view']['status'] = 'answered'; }

if (isset($_REQUEST['status'])) {
	$_SESSION['view']['status']=$_REQUEST['status']?htmlspecialchars($_REQUEST['status'],ENT_QUOTES):'';
}

//the default is to read 'open' tickets
if (!isset($_SESSION['view']['status'])) { //changed both to open as I added last answered back
	if ($_SESSION['user']['type'] == 'admin') $_SESSION['view']['status']='open';
	if ($_SESSION['user']['type'] == 'client') $_SESSION['view']['status']='open';
}

//if an admin submits an email search
if (($_SESSION['user']['type'] == 'admin') && (isset($_REQUEST['email'])) && ($_REQUEST['email'])) { $filter['email']=$_REQUEST['email']; }

//if they are a client (not admin) we must force filter their query
if ($_SESSION['user']['type'] == 'client') { $filter['email']=$_SESSION['user']['id']; }

//how should we order?
if ((!$_SESSION['view']['sort']) || (!$_SESSION['view']['way']) || !$_REQUEST['s']) {
	switch ($_SESSION['view']['status']) {
		case open:
			$_SESSION['view']['sort']='timestamp';
			$_SESSION['view']['way']='ASC';
		break;
		case answered:
			$_SESSION['view']['sort']='timestamp';
			$_SESSION['view']['way']='DESC';
		break;
		case closed:
			$_SESSION['view']['sort']='timestamp';
			$_SESSION['view']['way']='DESC';
		break;
	}
}

if ($_REQUEST['s']) {
	if ($_REQUEST['sort']) { $_SESSION['view']['sort']=htmlspecialchars($_REQUEST['sort'],ENT_QUOTES); }
	if ($_REQUEST['way']) { $_SESSION['view']['way']=htmlspecialchars($_REQUEST['way'],ENT_QUOTES); }
}

if (($_SESSION['view']['sort']) && ($_SESSION['view']['way'])) { $_SESSION['view']['orderby']=$db_table['tickets'].'.'.$_SESSION['view']['sort'].' '.$_SESSION['view']['way']; }

//filter by catagory
if (isset($_REQUEST['cat'])) $_SESSION['view']['cat']=htmlspecialchars($_REQUEST['cat'],ENT_QUOTES);

//filter by rep
if (isset($_REQUEST['rep'])) $_SESSION['view']['rep']=htmlspecialchars($_REQUEST['rep'],ENT_QUOTES);

//set tickets per page
$_SESSION['view']['per']=$_REQUEST['per']?htmlspecialchars($_REQUEST['per'],ENT_QUOTES):$config['tickets_per_page'];

//set page number
$_SESSION['view']['p']=$_REQUEST['p']?htmlspecialchars($_REQUEST['p'],ENT_QUOTES):1;

/* Filter & Session Data - END */

//correct dates
if (isset($_REQUEST['date_from'])) { 
	$_REQUEST['date_from']=format_time('Y-m-d', strtotime($_REQUEST['date_from']));
	$_SESSION['view']['date_from']=$_REQUEST['date_from'];
}
if (isset($_REQUEST['date_to'])) { 
	$_REQUEST['date_to']=format_time('Y-m-d', strtotime($_REQUEST['date_to']));
	$_SESSION['view']['date_to']=$_REQUEST['date_to'];
}

/* set vars */
if ((isset($_REQUEST['text'])) && ($_REQUEST['text'])) $text=htmlspecialchars($_REQUEST['text'],ENT_QUOTES);
if (isset($_REQUEST['s'])) { $s=$_REQUEST['s'] == 'advanced'?'advanced':'basic'; }

$orderby=$_SESSION['view']['orderby'];
$per=$_SESSION['view']['per'];
$p=$_SESSION['view']['p'];
$status=$_SESSION['view']['status'];
$date_from=escape_string($_SESSION['view']['date_from']);
$date_to=escape_string($_SESSION['view']['date_to']);

/*Table Details*/

if ($_REQUEST['s']) {	$newway=($_SESSION['view']['way'] == 'ASC')?'DESC':'ASC'; }
else { $newway=$_SESSION['view']['way']; }

$table_header = '
	  <tr>
	    <td width="22">&nbsp;</td>
	    <td width="50" class="TableHeaderText" title="'.LANG_TIP_TICKET.'"><a href="?s=advanced&sort=ID&way='.$newway.'">'.LANG_TICKET.'</a></td>
	    <td width="70" class="TableHeaderText" title="'.LANG_TIP_DATE.'"><a href="?s=advanced&sort=timestamp&way='.$newway.'">'.LANG_DATE.'</a></td>
	    <td width="263" class="TableHeaderText" title="'.LANG_TIP_SUBJECT.'"><a href="?s=advanced&sort=subject&way='.$newway.'">'.LANG_SUBJECT.'</a></td>
	    <td width="100" class="TableHeaderText" title="'.LANG_TIP_CAT.'"><a href="?s=advanced&sort=cat&way='.$newway.'">'.LANG_CAT.'</a></td>
	    <td width="12%" class="TableHeaderText" title="'.LANG_TIP_REP.'"><a href="?s=advanced&sort=rep&way='.$newway.'">'.LANG_REP.'</a></td>
	    <td width="50" class="TableHeaderText" title="'.LANG_TIP_PRIORITY.'"><a href="?s=advanced&sort=priority&way='.$newway.'">'.LANG_PRIORITY.'</a></td>
	    <td width="125" class="TableHeaderText" title="'.LANG_TIP_FROM.'"><a href="?s=advanced&sort=name&way='.$newway.'">'.LANG_FROM.'</a></td>
	    <td width="20" class="TableHeaderText" title="'.LANG_TIP_UM.'"><a href="?s=advanced&sort=unanswered&way='.$newway.'">'.LANG_UM.'</a></td>
	  </tr>
';

$table_content = '
		  <tr class="{class}" onmouseover="this.className=\'mainTableOn\';" onmouseout="this.className=\'{class}\';">
		   <td align="center" class="checkbox">{checkbox}</td>
		   <td align="center" class="ticket"><a href="{page}?a=view&amp;id={id}">{id}</a></td>
		   <td align="center" class="date">{short_time}</td>
		   <td class="subject"><a href="{page}?a=view&amp;id={id}">{subject}</a></td>
		   <td class="cat">{cat_name}</td>
		   <td class="rep">{rep_name}</td>
		   <td {pri_style}>{pri_text}</td>
		   <td class="from"><a onClick="document.forms[0].email.value=\'{email}\';" title="{email}">{name}</a></td>
		   <td align="center" class="um">{unanswered}</td>
			</tr>
';

/* Create Query Start */

//set filters for the where statement
$filter['status']=$_SESSION['view']['status'];
if ($_SESSION['view']['cat']) $filter['cat']=$_SESSION['view']['cat'];
if ($_SESSION['view']['rep']) $filter['rep']=$_SESSION['view']['rep'];

//implode the $filter array together into the WHERE
if (is_array($filter)) {
	foreach ($filter as $key => $value) {
		if ($key == 'status' && $value == 'answered') { $value='open'; } //work around
		if (!empty($where)) { $where.=' AND '; }
		else { $where=''; }
		if (!preg_match('/\./',$key)) {
			$key=$db_table['tickets'].".$key";
		}
		$value=escape_string($value);
		$where.=" $key = $value";
	}
}

if ($_REQUEST['use_dates']) {
	//format_time('Y-m-d H:i:s',$date);
		if (empty($where)) { $where=''; }
		else { $where.=' AND '; }
		$where.=$db_table['tickets'].".timestamp BETWEEN $date_from AND $date_to";
}

if ($text) {
	$query="SELECT DISTINCT 
	".$db_table['tickets'].".ID AS ID,
	".$db_table['tickets'].".status,
	".$db_table['tickets'].".timestamp as timestamp,
	".$db_table['tickets'].".cat AS cat, 
	".$db_table['tickets'].".subject AS subject,
	priority,
	".$db_table['tickets'].".name AS name FROM (
		( ".$db_table['tickets']." LEFT JOIN ".$db_table['messages']." ON ".$db_table['messages'].".ticket = ".$db_table['tickets'].".ID )
		LEFT JOIN ".$db_table['answers']." ON ".$db_table['answers'].".reference = ".$db_table['messages'].".ID 
	)";
	if (!empty($where)) { $where.=' AND '; }
	else { $where=''; }
	$where.="(
	    ".$db_table['messages'].".message LIKE '%$text%' OR
	    ".$db_table['answers'].".message LIKE '%$text%' OR
	    ".$db_table['tickets'].".subject LIKE '%$text%' OR
	    ".$db_table['tickets'].".phone LIKE '%$text%' OR
	    ".$db_table['tickets'].".ip LIKE '%$text%' OR
	    ".$db_table['tickets'].".name LIKE '%$text%'
	)";
}
else { $query="SELECT * FROM ".$db_table['tickets']; }

//add the where to the rest of the query
if ((isset($where)) && ($where)) { $query.=" WHERE $where"; }

//add the ordering at the end
if ($orderby) $query.=" ORDER BY ".$orderby;

/* Create Query End */

	//get a list of tickets as per query
	if ($sql=mysql_query($query)) {
		while ($result=mysql_fetch_array($sql)) {
			$result['unanswered']=get_un_tickets($result['ID']);
			if (!$result['unanswered'] && $result['status'] !== 'closed') { $result['status'] = 'answered'; }
			if ($_SESSION['user']['type'] == 'client' || (@in_array($result['cat'], $login['cat_access']) || $login['cat_access'][0] == 'all')) { //filter by permissions
				if ((!$_REQUEST['s']) && ($result['status'] == 'answered')) { $j++; $um[$j]=$result;  }
				if ($result['status'] == $status) { //filter by status
					$i++;
					$results[$i]=$result;
				}
			}
		}
	}

	//work out page title
	if ($s == 'basic') { $pagetitle=LANG_BASIC_SEARCH; }
	elseif ($s == 'advanced') { $pagetitle=LANG_ADVANCED_SEARCH; }
	else { $pagetitle=get_real_status_names($status); }

	/*pagingation*/
	$total=count($results);
	$pages=ceil($total / $per);
	//if total pages is more than current page, display last page instead of nothing
	if ($p > ($pages -1)) { $p=$pages; }
	$start=($p - 1) * $per;
	$end=$p*$per;

	//get a list of the catagories - save repeating
  $cats_res=mysql_query("SELECT * FROM ".$db_table['categories']);
  while ($cats_row=mysql_fetch_array($cats_res)) {
      $cats_rows[$cats_row['ID']] = $cats_row;
  }
  
  //get a list of the reps - save repeating
  $reps_res=mysql_query("SELECT * FROM ".$db_table['reps']);
  while ($reps_row=mysql_fetch_array($reps_res)) {
      $reps_rows[$reps_row['ID']] = $reps_row;
  }

if (($config['search_disp']) && (!strstr($_SERVER['PHP_SELF'],'search'))) include_once(INC_DIR.'search_form.php');

?>
<h2><?=ucwords($pagetitle)?></h2>
<form action="<?=htmlspecialchars($_SERVER['REQUEST_URI'])?>" method="POST">
<div id="main">
<?php
if ($results) {
?>
	<table border="0" cellspacing="1" cellpadding="2" class="TableMsg" align="center">
<?php
	echo $table_header;
	$class = 'mainTable'; //for table stripes (default)
	foreach ($results as $key => $result) {
		if (($key > $start) && ($key <= $end)) {
			//case by case vars
			$eval = new Ticket($result);
			$cat_row = $cats_rows[$eval->cat];
	 		$rep_row = $reps_rows[$eval->rep];
			$hide = ($_SESSION['user']['type'] == 'client' && $cat_row['hidden']);
			$cat_row['name'] = $hide ? LANG_IN_PROGRESS : $cat_row['name'];
			$pri_text = $config['pri_text'][$eval->priority];
			$pri_style = $config['pri_style'][$eval->priority];
			$class = ($class == 'mainTableAlt') ? 'mainTable' : 'mainTableAlt';
			
			$output=$table_content;
			$output=str_replace('{class}',$class,$output);
			$output=str_replace('{page}',$page,$output);
			$output=str_replace('{id}',$eval->id,$output);
			$output=str_replace('{checkbox}','<input type="checkbox" name="t['.$eval->id.']" class="checkbox">',$output);
			$output=str_replace('{short_time}',$eval->short_time,$output);
			$output=str_replace('{subject}',htmlspecialchars(stripslashes($eval->subject)),$output);
			$output=str_replace('{cat_name}',$cat_row['name'],$output);
			$output=str_replace('{rep_name}',$rep_row['name'],$output);
			$output=str_replace('{pri_style}',$pri_style,$output);
			$output=str_replace('{pri_text}',$pri_text,$output);
			$output=str_replace('{email}',htmlspecialchars(stripslashes($eval->email)),$output);
			$output=str_replace('{name}',htmlspecialchars(stripslashes($eval->name)),$output);
			$output=str_replace('{unanswered}',$eval->unanswered.has_priv_msg($eval->id),$output);
			echo $output;
		}
	}
	unset($output);
	?>
	</table>
	<?php
		/*pagination*/
      @($pages = $total / $_SESSION['view']['per']);
      $pages = (intval($pages) == $pages) ? $pages : intval($pages) + 1;
      if ($pages > 1) {
      		$pgs=array();
          for ($x = 1; $x <= $pages; ++$x) {
	          if ($x == $_SESSION['view']['p']) {
	          	$pgs[] = '<span id="currentpage">'."$x</span>\n";
	          }
	          else {
				    	$purl=$_SERVER['PHP_SELF'].'?p='.$x;
				      $qs=preg_replace('/p=[0-9]+/', '', $_SERVER['QUERY_STRING']);
				      if (!empty($qs)) { $purl.=(substr($qs, 0, 1) == '&')?$qs:"&amp;$qs"; }
				      $pgs[] = '<a href="'.$purl.'">'.$x.'</a>';
			      }
          }
          $pgs=implode(', ',$pgs);
      }
	?>
	<input class="inputsubmit2" id="checkall" type="button" onclick="checkAll(this.form)" value="<?=LANG_SELECT_ALL?>"> 
	<input class="inputsubmit2" id="uncheckall" type="button" onclick="uncheckAll(this.form)" value="<?=LANG_UNSELECT?>">
	<br>
<?php echo '<span id="tickets_found">'.intval($total).' <em>'.LANG_TICKETS_FOUND.".</em></span> \n"; ?>
<?php if (!empty($pgs)) { echo ' <span class="pages"><b>'.LANG_PAGES.':</b> '.$pgs."</span>\n"; unset($pgs); } ?>
<?php 
	}
	else { echo '<p style="text-align: center;" id="no_tickets">'.LANG_NO_TICKETS."</p>\n"; }
?>
</div>
<?php
	if (($config['umq'] > 0) && ($status == 'open') && (count($um) > 0)) {
		$um_total=count($um);
?>
		<h2><?=LANG_LAST?> <?=$config['umq']?> <?=LANG_ANS_TICKETS?></h2>
		<table border="0" cellspacing="1" cellpadding="2" class="TableMsg" align="center">
	<?php
	echo $table_header;
	$class = 'mainTable'; //for table stripes (default)
	foreach ($um as $key => $result) {
		if ($key >= $um_total-$config['umq']) {
			//case by case vars
			$eval = new Ticket($result);
			$cat_row = $cats_rows[$eval->cat];
			$rep_row = $reps_rows[$eval->rep];
			$hide = ($_SESSION['user']['type'] == 'client' && $cat_row['hidden']);
			$cat_row['name'] = $hide ? LANG_IN_PROGRESS : $cat_row['name'];
			$pri_text = $config['pri_text'][$eval->priority];
			$pri_style = $config['pri_style'][$eval->priority];
			$class = ($class == 'mainTableAlt') ? 'mainTable' : 'mainTableAlt';
			
			$output=$table_content;
			$output=str_replace('{class}',$class,$output);
			$output=str_replace('{page}',$page,$output);
			$output=str_replace('{id}',$eval->id,$output);
			$output=str_replace('{checkbox}','',$output);
			$output=str_replace('{short_time}',$eval->short_time,$output);
			$output=str_replace('{subject}',htmlspecialchars(stripslashes($eval->subject)),$output);
			$output=str_replace('{cat_name}',$cat_row['name'],$output);
			$output=str_replace('{rep_name}',$rep_row['name'],$output);
			$output=str_replace('{pri_style}',$pri_style,$output);
			$output=str_replace('{pri_text}',$pri_text,$output);
			$output=str_replace('{email}',htmlspecialchars(stripslashes($eval->email)),$output);
			$output=str_replace('{name}',htmlspecialchars(stripslashes($eval->name)),$output);
			$output=str_replace('{unanswered}',$eval->unanswered.has_priv_msg($eval->id),$output);
			echo $output;
		}
	}
	unset($output);
	?>
	</table>
<?php
	}
?>
<br>
<div class="buttons">
<?php if (($_SESSION['user']['type'] == 'admin') && ($login[$a] || $login['ID'] == ADMIN)): ?>
	<input class="inputsubmit" type="submit" id="delete" name="delete" title="<?=LANG_TIP_DELETE?>" onClick='if(confirm("<?=LANG_DELETE_CONFIRM?>")) return; else return false;' value="<?=LANG_DELETE;?>">
<?php endif;
switch ($status) {
  case 'closed':
?>
	<input class="inputsubmit" type="submit"  id="reopen" name="reopen" title="<?=LANG_TIP_REOPEN;?>" value="<?=LANG_REOPEN;?>">
	<input class="inputsubmit" type="submit" id="view_open" name="view_open" title="<?=LANG_TIP_VIEW_OPEN;?>" value="<?=LANG_VIEW_OPEN;?>">
	<input class="inputsubmit" type="submit" id="view_answered" name="view_answered" title="<?=LANG_TIP_VIEW_ANSWERED;?>" value="<?=LANG_VIEW_ANSWERED;?>">
<?php
  break;
  case 'open':
?>
	<input class="inputsubmit" type="submit" id="close" name="close" title="<?=LANG_TIP_CLOSE;?>" value="<?=LANG_CLOSE;?>">
	<input class="inputsubmit" type="submit" id="view_answered" name="view_answered" title="<?=LANG_TIP_VIEW_ANSWERED;?>" value="<?=LANG_VIEW_ANSWERED;?>">
	<input class="inputsubmit" type="submit" id="view_closed" name="view_closed" title="<?=LANG_TIP_VIEW_CLOSED;?>" value="<?=LANG_VIEW_CLOSED;?>">
<?php
  break;
  case 'answered':
?>
	<input class="inputsubmit" type="submit" id="close" name="close" title="<?=LANG_TIP_CLOSE;?>" value="<?=LANG_CLOSE;?>">
	<input class="inputsubmit" type="submit" id="view_open" name="view_open" title="<?=LANG_TIP_VIEW_OPEN;?>" value="<?=LANG_VIEW_OPEN;?>">
	<input class="inputsubmit" type="submit" id="view_closed" name="view_closed" title="<?=LANG_TIP_VIEW_CLOSED;?>" value="<?=LANG_VIEW_CLOSED;?>">
<?php
  break;
}
?>
	<input class="inputsubmit" type="submit" id="refresh" name="refresh" title="<?=LANG_TIP_REFRESH;?>" value="<?=LANG_REFRESH;?>">
</div>
</form>
<br>
<?php load_buttons(); ?>