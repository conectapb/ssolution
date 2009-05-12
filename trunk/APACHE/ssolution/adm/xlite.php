<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title></title>
    </head>

    <body>
    
    <table cellpadding="0" cellspacing="0" border="1" id="tablesorter">
        <?php
 
        $arq = file('xlite.csv');
        foreach($arq as $linha)
        {
            ?><tr><?
            $tmp = explode(",", $linha);
            foreach($tmp as $item)
            {
                ?><td><?=$item?></td><?
            }
            ?></tr><?
        }
        
        ?>
    </table>

    </body>
</html>
