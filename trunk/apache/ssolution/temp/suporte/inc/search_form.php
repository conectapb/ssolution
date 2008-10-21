<?php if (!defined('ISINC')) die('serious error'); ?>
<!-- SEARCH FORM START -->
<center>
<div class="searchBox">
<form action="" method="GET" name="search">
<?php
  if (!$s) $s=$_REQUEST['s']?$_REQUEST['s']:'basic';
?>
<input type="hidden" name="s" value="<? echo htmlspecialchars($s);?>">
<?php if ($_SESSION['user']['type'] == 'admin') { ?>
    <?=LANG_EMAIL?>:
    <input type="text" name="email" id="email" value="<?=htmlspecialchars($_REQUEST['email'])?>" size="25">
<?php } ?>
<?=LANG_QUERY?>:
<input type="text" name="text" id="text" value="<?=htmlspecialchars(stripslashes($_REQUEST['text']))?>">
<?php
if ($s == 'advanced') {
?>
    <?=LANG_CAT?>:
    <select name="cat"><option></option>
    <?php
          $cats = mysql_query("SELECT * FROM ".$db_table['categories']);
          while ($cat = mysql_fetch_array($cats)) {
              $selected = ($_SESSION['view']['cat'] == $cat['ID']) ? ' SELECTED' : '';
              $hide = ($_SESSION['user']['type'] == 'client' && $cat['hidden']);
              $cat['name'] = $cat['hidden'] ? "$cat[name]*": $cat['name'];
              if (!$hide) {
?>
        <option value="<?=$cat['ID']?>"<?=$selected?>><?=$cat['name']?></option>
    <?php
              }
          }
?>
    </select>

     <?=LANG_REP?>:
     <select name="rep"><option value=""><?=LANG_ALL;?></option>
     <?php 
           $reps = mysql_query("SELECT * FROM ".$db_table['reps']);
           while ($rep = mysql_fetch_array($reps)) {
               $selected = ($_SESSION['view']['rep'] == $rep['ID']) ? ' SELECTED' : '';
 ?>
         <option value="<?=$rep['ID']?>"<?=$selected?>><?=$rep['name']?></option>
     <?php
           }
 ?>
     </select>

    <?=LANG_STATUS?>:
    
    <select name="status">
        <option value="open"<?= $_SESSION['view']['status'] == 'open' ? ' SELECTED': ''?>><?=LANG_OPEN?></option>
        <option value="answered"<?= $_SESSION['view']['status'] == 'answered' ? ' SELECTED': ''?>><?=LANG_ANSWERED?></option>
        <option value="closed"<?= $_SESSION['view']['status'] == 'closed' ? ' SELECTED': ''?>><?=LANG_CLOSED?></option>
    </select>

    <?=LANG_SORT_BY?>:
    <select name="sort">
      <option value="timestamp"<?= $_SESSION['view']['sort'] == 'timestamp' ? ' SELECTED': ''?>><?=LANG_DATE?></option>
      <option value="ID"<?= $_SESSION['view']['sort'] == 'ID' ? ' SELECTED' : ''?>><?=LANG_TICKET_ID?></option>
      <option value="subject"<?= $_SESSION['view']['sort'] == 'subject' ? ' SELECTED' : ''?>><?=LANG_SUBJECT?></option>
      <option value="cat"<?= $_SESSION['view']['sort'] == 'cat' ? ' SELECTED' : ''?>><?=LANG_CAT?></option>
      <option value="rep"<?= $_SESSION['view']['sort'] == 'rep' ? ' SELECTED' : ''?>><?=LANG_REP?></option>
      <option value="priority"<?= $_SESSION['view']['sort'] == 'priority' ? ' SELECTED': ''?>><?=LANG_PRIORITY?></option>
      <option value="name"<?= $_SESSION['view']['sort'] == 'name' ? ' SELECTED' : ''?>><?=LANG_NAME?></option>
      <option value="email"<?= $_SESSION['view']['sort'] == 'email' ? ' SELECTED' : ''?>><?=LANG_EMAIL?></option>
    </select>
    <select name="way">
        <option value="ASC"<?= $_SESSION['view']['way'] == 'ASC' ? ' SELECTED': ''?>><?=LANG_ASC?></option>
        <option value="DESC"<?= $_SESSION['view']['way'] == 'DESC' ? ' SELECTED': ''?>><?=LANG_DES?></option>
    </select>
    
    <?=LANG_USE_DATES?>
    <input type="checkbox" name="use_dates" value="1" <?=$_REQUEST['use_dates']?'checked':''?>>
    <?=LANG_BETWEEN?>
    <input type="text" name="date_from" id="date_from" value="<?=$_SESSION['view']['date_from']?$_SESSION['view']['date_from']:'yesterday'?>" size="8">
   	&
   	<input type="text" name="date_to" id="date_to" value="<?=$_SESSION['view']['date_to']?$_SESSION['view']['date_to']:'now'?>" size="8">
    

    <?=LANG_RESULTS_PP?>:
    <select name="per">
	<?php
	$results_pp=array(5,10,15,20,25,50,100);
	foreach ($results_pp as $key => $x) {
	       $per = $_SESSION['view']['per'] ? $_SESSION['view']['per'] : $config['tickets_per_page'];
	       $selected = $per == $x ? ' SELECTED' : '';
	?>
	     <option<?=$selected?>><?=$x?></option>
	<?php
	}
	?>
    </select>
<?php
}

$news=($s == 'basic')?'advanced':'basic';
$stext=($news == 'basic')?LANG_BASIC:LANG_ADVANCED;

//work out the query string and url
$surl=$_SERVER['PHP_SELF'].'?s='.$news;
$qs=preg_replace('/s=(basic|advanced)/', '', htmlspecialchars($_SERVER['QUERY_STRING']));
if ($qs != '') { $surl.=(substr($qs, 0, 1) == '&')?$qs:"&amp;$qs"; }

?>
    <input type="submit" name="search_submit" class="inputsubmit" value="<?=LANG_SEARCH?>">
    [<a href="<?=$surl?>"><?=$stext?></a>]
</form>
</div>
</center>
<!-- SEARCH FORM END -->