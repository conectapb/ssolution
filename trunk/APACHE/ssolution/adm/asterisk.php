<?
        $col[10] = "accountcode";
        $col[1] = "src";
        $col[8] = "channel";
        $col[2] = "dst";
        $col[9] = "dstchannel";
        $col[3] = "start";
        $col[4] = "answer";
        $col[5] = "end";
        $col[6] = "duration";
        $col[14] = "dcontext";
        $col[15] = "clid";
        $col[12] = "lastapp";
        $col[13] = "lastdata";
        $col[7] = "billsec";
        $col[11] = "disposition";
        $col[16] = "amaflags";
?>

<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title></title>

        <script language="javascript" src="../templates/js/jquery.js"></script>
        <script language="javascript" src="../templates/js/jquery.tablesorter.pack.js"></script>
        <link href="../templates/adm/tablesorter.css" rel="stylesheet" type="text/css" />
        <script>
        $(document).ready(function() {
            $("#tablesorter").tablesorter(
                {
                    headers: { 5: { sorter: false } },
                    cancelSelection: true,
                    widgets: ['zebra']
                });
        });
        </script>
    </head>

    <body>
    
    <table cellpadding="0" cellspacing="0" border="1" id="tablesorter">
        <thead>
            <tr>
                <th><?=$col[1]?></th>
                <th><?=$col[2]?></th>
                <th><?=$col[3]?></th>
                <th><?=$col[4]?></th>
                <th><?=$col[5]?></th>
                <th><?=$col[6]?></th>
                <th><?=$col[7]?></th>
                <th><?=$col[8]?></th>
                <th><?=$col[9]?></th>
                <th><?=$col[10]?></th>
                <th><?=$col[11]?></th>
                <th><?=$col[12]?></th>
                <th><?=$col[13]?></th>
                <th><?=$col[14]?></th>
                <th><?=$col[15]?></th>
                <th><?=$col[16]?></th>
            </tr>
        </thead>
        <tbody>
        <?php
 
        $arq = file('Master.csv');
        foreach($arq as $linha)
        {
            list($accountcode,$src,$dst,$dcontext,$clid,$channel,$dstchannel,$lastapp,$lastdata,$start,$answer,$end,$duration,$billsec,$disposition,$amaflags)
                = explode(",", $linha);

            printf("<tr>\n
                \t<td nowrap>%s</td>\n
                \t<td nowrap>%s</td>\n
                \t<td nowrap>%s</td>\n
                \t<td nowrap>%s</td>\n
                \t<td nowrap>%s</td>\n
                \t<td nowrap>%s</td>\n
                \t<td nowrap>%s</td>\n
                \t<td nowrap>%s</td>\n
                \t<td nowrap>%s</td>\n
                \t<td nowrap>%s</td>\n
                \t<td nowrap>%s</td>\n
                \t<td nowrap>%s</td>\n
                \t<td nowrap>%s</td>\n
                \t<td nowrap>%s</td>\n
                \t<td nowrap>%s</td>\n
                \t<td nowrap>%s</td>\n
                </tr>\n",
                trim($$col[1], "\""),
                trim($$col[2], "\""),
                trim($$col[3], "\""),
                trim($$col[4], "\""),
                trim($$col[5], "\""),
                trim($$col[6], "\""),
                trim($$col[7], "\""),
                trim($$col[8], "\""),
                trim($$col[9], "\""),
                trim($$col[10], "\""),
                trim($$col[11], "\""),
                trim($$col[12], "\""),
                trim($$col[13], "\""),
                trim($$col[14], "\""),
                trim($$col[15], "\""),
                trim($$col[16], "\"")
            );
        }
        
        ?>

        </tbody>
    </table>

    </body>
</html>
