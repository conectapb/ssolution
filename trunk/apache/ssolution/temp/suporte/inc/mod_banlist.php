<?php
/*
	eTicket, Open Source Support Ticket System
	http://eticket.sourceforge.net/

	Released under the GNU General Public License
*/

if(!defined('ISINC')) die('serious error');
if ($_SESSION['user']['type'] !== 'admin') { die(LANG_ERROR_DENIED); }

              if ($login[$a] || $login['ID'] == ADMIN) {
              		if (isset($_REQUEST['e'])) {
              			$e=$_REQUEST['e'];
	              		switch($e) {
	              			case "add":
                      if (!$_POST['Action']) {
                          $inc = 'banlist_addedit';
                      }
                      ob_start();
                      // get action
                      $ab = @$_POST['ab'];
                      if (empty($ab)) {
                          $key = @$_GET['key'];
                          if ($key <> "") {
                              // copy record
                              $ab = 'C';
                          } else {
                              $ab = 'I';
                          }
                          // display blank record
                      }
                      switch ($ab) {
                          case "C":
                              // get a record to display
                              $tkey = "" . $key . "";
                              $strsql = "SELECT * FROM ".$db_table['banlist']." WHERE `value_id`=" . $tkey;
                              $rs = mysql_query($strsql);
                              if (mysql_num_rows($rs) == 0) {
                                  ob_end_clean();
                                  header('Location: admin.php?a=banlist'); die();
                              } else {
                                  $row = mysql_fetch_array($rs);
                                  // get the field contents
                                  $x_value = @$row['value'];
                              }
                              mysql_free_result($rs);
                              break;
                          case "A":
                              // add
                              // get the form values
                              $x_value = @$_POST['x_value'];
                              $x_value_id = @$_POST['x_value_id'];
                              // add the values into an array
                              if ($x_value != '') {
                                  // value
                                  $theValue = get_magic_quotes_gpc()?$x_value:addslashes($x_value);
                                  $theValue = ($theValue != '') ? "'$theValue'" : "NULL";
                                  $fieldList['value'] = $theValue;
                                  // insert into database
                                  $strsql = "INSERT INTO ".$db_table['banlist']." (" . implode(',', array_keys($fieldList)) . ") VALUES (" . implode(',', array_values($fieldList)) . ")";
                                  mysql_query($strsql) or die(mysql_error());
                                  ob_end_clean();
                              }
                              header('Location: admin.php?a=banlist'); die();
                              break;
                      }
	              			break;
	              			case "delete":
                      if (!$_POST['submit']) {
                          $inc = 'banlist_delete';
                      }
                      ob_start();
                      $page = 'admin.php';
                      // multiple delete records
                      $key = @$_POST['key'];
                      if (count($key) == 0) {
                          header('Location: admin.php?a=banlist'); die();
                      }
                      $sqlKey = '';
                      foreach ($key as $reckey) {
                          $reckey = trim($reckey);
                          // build the SQL
                          $sqlKey .= "(" . "`value_id`=" . "" . $reckey . "" . " AND ";
                          if (substr($sqlKey, -5) == " AND ") {
                              $sqlKey = substr($sqlKey, 0, strlen($sqlKey) - 5);
                          }
                          $sqlKey .= ") OR ";
                      }
                      if (substr($sqlKey, -4) == " OR ") {
                          $sqlKey = substr($sqlKey, 0, strlen($sqlKey) - 4);
                      }
                      // get action
                      $ab = @$_POST['ab'];
                      if (empty($ab)) {
                          // display
                          $ab = "I";
                      }
                      switch ($ab) {
                          case "I":
                              // display
                              $strsql = "SELECT * FROM ".$db_table['banlist']." WHERE " . $sqlKey;
                              $rs = mysql_query($strsql) or die(mysql_error());
                              if (mysql_num_rows($rs) == 0) {
                                  ob_end_clean();
                                  header('Location: admin.php?a=banlist'); die();
                              }
                              break;
                          case "D":
                              // delete
                              $strsql = "DELETE FROM ".$db_table['banlist']." WHERE " . $sqlKey;
                              $rs = mysql_query($strsql) or die(mysql_error());
                              ob_end_clean();
                              header('Location: admin.php?a=banlist'); die();
                              break;
                      }
	              			break;
	              			case "edit":
	              			if (!$_POST['submit']) { $inc = 'banlist_addedit'; }
                      ob_start();
                      $page = 'admin.php';
                      $key = @$_GET["key"];
                      if (empty($key)) {
                          $key = @$_POST["key"];
                      }
                      if (empty($key)) {
                          header('Location: admin.php?a=banlist'); die();
                      }
                      // get action
                      $ab = @$_POST["ab"];
                      if (empty($ab)) {
                          //display with input box
                          $ab = "I";
                      }
                      // get fields from form
                      $x_value = @$_POST["x_value"];
                      $x_value_id = @$_POST["x_value_id"];
                      switch ($ab) {
                          case "I":
                              // get a record to display
                              $tkey = "" . $key . "";
                              $strsql = "SELECT * FROM ".$db_table['banlist']." WHERE `value_id`=" . $tkey;
                              $rs = mysql_query($strsql) or die(mysql_error());
                              if (!($row = mysql_fetch_array($rs))) {
                                  ob_end_clean();
                                  header('Location: admin.php?a=banlist'); die();
                              }
                              // get the field contents
                              $x_value = @$row["value"];
                              $x_value_id = @$row["value_id"];
                              mysql_free_result($rs);
                              break;
                          case "U":
                              // update
                              $tkey = "" . $key . "";
                              // get the form values
                              $x_value = @$_POST["x_value"];
                              $x_value_id = @$_POST["x_value_id"];
                              // add the values into an array
                              // value
                              $theValue = (!get_magic_quotes_gpc()) ? addslashes($x_value) : $x_value;
                              $theValue = ($theValue != "") ? " '" . $theValue . "'" : "NULL";
                              $fieldList["`value`"] = $theValue;
                              // update
                              $updateSQL = "UPDATE ".$db_table['banlist']." SET ";
                              foreach ($fieldList as $key => $temp) {
                                  $updateSQL .= "$key = $temp, ";
                              }
                              if (substr($updateSQL, -2) == ", ") {
                                  $updateSQL = substr($updateSQL, 0, strlen($updateSQL) - 2);
                              }
                              $updateSQL .= " WHERE `value_id`=" . $tkey;
                              $rs = mysql_query($updateSQL) or die(mysql_error());
                              ob_end_clean();
                              header('Location: admin.php?a=banlist'); die();
                      }
	              			break;
	              		}
	              	}
	              	else {
                      if (!$_POST['submit']) {
                          $inc = 'banlist';
                      }
                      $displayRecs = 20;
                      $recRange = 10;
                      $dbwhere = "";
                      $masterdetailwhere = "";
                      $searchwhere = "";
                      $a_search = "";
                      $b_search = "";
                      $whereClause = "";
                      // get search criteria for basic search
                      $pSearch = @$_GET["psearch"];
                      $pSearchType = @$_GET["psearchtype"];
                      if ($pSearch <> "") {
                          $pSearch = str_replace("'", "\'", $pSearch);
                          if ($pSearchType <> "") {
                              while (strpos($pSearch, "  ") > 0) {
                                  $pSearch = str_replace("  ", " ", $pSearch);
                              }
                              $arpSearch = explode(" ", trim($pSearch));
                              foreach ($arpSearch as $kw) {
                                  $b_search .= "(";
                                  $b_search .= "`value` LIKE '%" . trim($kw) . "%' OR ";
                                  if (substr($b_search, -4) == " OR ") {
                                      $b_search = substr($b_search, 0, strlen($b_search) - 4);
                                  }
                                  $b_search .= ") " . $pSearchType . " ";
                              }
                          } else {
                              $b_search .= "`value` LIKE '%" . $pSearch . "%' OR ";
                          }
                      }
                      if (substr($b_search, -4) == " OR ") {
                          $b_search = substr($b_search, 0, strlen($b_search) - 4);
                      }
                      if (substr($b_search, -5) == " AND ") {
                          $b_search = substr($b_search, 0, strlen($b_search) - 5);
                      }
                      // build search criteria
                      if ($a_search <> "") {
                          //advanced search
                          $searchwhere = $a_search;
                      } elseif ($b_search <> "") {
                          //basic search
                          $searchwhere = $b_search;
                      }
                      // save search criteria
                      if ($searchwhere <> "") {
                          $_SESSION['banlist']['searchwhere'] = $searchwhere;
                          $_SESSION['banlist']['pSearch'] = $pSearch;
                          $_SESSION['banlist']['pSearchType'] = $pSearchType;
                          //reset start record counter (new search)
                          $startRec = 1;
                          $_SESSION['banlist']["REC"] = $startRec;
                      } else {
                          $searchwhere = @$_SESSION['banlist']["searchwhere"];
                          $pSearch = $_SESSION['banlist']['pSearch'];
                          $pSearchType = $_SESSION['banlist']['pSearchType'];
                      }
                      // get clear search cmd
                      if (@$_GET["cmd"] <> "") {
                          $cmd = $_GET["cmd"];
                          if (strtoupper($cmd) == "RESET") {
                              //reset search criteria
                              $searchwhere = '';
                              $_SESSION['banlist']['searchwhere'] = $searchwhere;
                              $pSearch = '';
                              $_SESSION['banlist']['pSearch'] = $pSearch;
                              $pSearchType = '';
                              $_SESSION['banlist']['pSearchType'] = $pSearchType;
                          } elseif (strtoupper($cmd) == "RESETALL") {
                              //reset search criteria
                              $searchwhere = '';
                              $_SESSION['banlist']["searchwhere"] = $searchwhere;
                              $pSearch = '';
                              $_SESSION['banlist']['pSearch'] = $pSearch;
                              $pSearchType = '';
                              $_SESSION['banlist']['pSearchType'] = $pSearchType;
                          }
                          //reset start record counter (reset command)
                          $startRec = 1;
                          $_SESSION['banlist']["REC"] = $startRec;
                      }
                      // build dbwhere
                      if ($masterdetailwhere <> "") {
                          $dbwhere .= "(" . $masterdetailwhere . ") AND ";
                      }
                      if ($searchwhere <> "") {
                          $dbwhere .= "(" . $searchwhere . ") AND ";
                      }
                      if (strlen($dbwhere) > 5) {
                          // trim rightmost AND
                          $dbwhere = substr($dbwhere, 0, strlen($dbwhere) - 5);
                      }
                      // default order
                      $DefaultOrder = '';
                      $DefaultOrderType = '';
                      // default filter
                      $DefaultFilter = '';
                      // check for an Order parameter
                      $OrderBy = '';
                      if (@$_GET["order"] <> "") {
                          $OrderBy = $_GET["order"];
                          // check if an ASC/DESC toggle is required
                          if (@$_SESSION['banlist']["OB"] == $OrderBy) {
                              if (@$_SESSION['banlist']["OT"] == "ASC") {
                                  $_SESSION['banlist']["OT"] = "DESC";
                              } else {
                                  $_SESSION['banlist']["OT"] = "ASC";
                              }
                          } else {
                              $_SESSION['banlist']["OT"] = "ASC";
                          }
                          $_SESSION['banlist']["OB"] = $OrderBy;
                          $_SESSION['banlist']["REC"] = 1;
                      } else {
                          $OrderBy = @$_SESSION['banlist']["OB"];
                          if ($OrderBy == "") {
                              $OrderBy = $DefaultOrder;
                              $_SESSION['banlist']["OB"] = $OrderBy;
                              $_SESSION['banlist']["OT"] = $DefaultOrderType;
                          }
                      }
                      // build SQL
                      $strsql = "SELECT * FROM ".$db_table['banlist'];
                      if ($DefaultFilter <> "") {
                          $whereClause .= "(" . $DefaultFilter . ") AND ";
                      }
                      if ($dbwhere <> "") {
                          $whereClause .= "(" . $dbwhere . ") AND ";
                      }
                      if (substr($whereClause, -5) == " AND ") {
                          $whereClause = substr($whereClause, 0, strlen($whereClause) - 5);
                      }
                      if ($whereClause <> "") {
                          $strsql .= " WHERE " . $whereClause;
                      }
                      if ($OrderBy <> "") {
                          $strsql .= " ORDER BY `" . $OrderBy . "` " . @$_SESSION['banlist']["OT"];
                      }
                      //echo $strsql; // comment out this line to view the SQL
                      $rs = mysql_query($strsql);
                      $totalRecs = intval(@mysql_num_rows($rs));
                      // check for a START parameter
                      if (@$_GET["start"] <> "") {
                          $startRec = $_GET["start"];
                          $_SESSION['banlist']["REC"] = $startRec;
                      } elseif (@$_GET["pageno"] <> "") {
                          $pageno = $_GET["pageno"];
                          if (is_numeric($pageno)) {
                              $startRec = ($pageno - 1) * $displayRecs + 1;
                              if ($startRec <= 0) {
                                  $startRec = 1;
                              } elseif ($startRec >= (($totalRecs - 1) / $displayRecs) * $displayRecs + 1) {
                                  $startRec = (($totalRecs - 1) / $displayRecs) * $displayRecs + 1;
                              }
                              $_SESSION['banlist']["REC"] = $startRec;
                          } else {
                              $startRec = @$_SESSION['banlist']["REC"];
                              if (!is_numeric($startRec)) {
                                  // reset start record counter
                                  $startRec = 1;
                                  $_SESSION['banlist']["REC"] = $startRec;
                              }
                          }
                      } else {
                          $startRec = @$_SESSION['banlist']["REC"];
                          if (!is_numeric($startRec)) {
                              // reset start record counter
                              $startRec = 1;
                              $_SESSION['banlist']["REC"] = $startRec;
                          }
                      }
                   }
                  }

?>