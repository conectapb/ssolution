<?php

//display errors

  if (!empty($_SESSION['user']['err'])) { $err = $_SESSION['user']['err']; unset($_SESSION['user']['err']); }
  if (!empty($err)) {
  	echo '<p id="err">';
  	if (is_array($err)) { 
  		foreach ($err as $msg) {
  			echo '<b>'.LANG_ERROR.':</b> '.$msg."<br>\n";
  		}
  	}
    else { echo '<b>'.LANG_ERROR.':</b> '.$err; }
    echo "</p>\n";
    if (isset($err)) { unset($err); }
  }
  if (!empty($_SESSION['user']['warn'])) { $warn = $_SESSION['user']['warn']; unset($_SESSION['user']['warn']); }
  if (!empty($warn)) {
  	echo '<p id="warn">';
  	if (is_array($warn)) { 
  		foreach ($warn as $msg) {
  			echo '<b>'.LANG_WARNING.':</b> '.$msg."<br>\n";
  		}
  	}
    else { echo '<b>'.LANG_WARNING.':</b> '.$warn; }
    echo "</p>\n";
    if (isset($warn)) { unset($warn); }
  }

?>