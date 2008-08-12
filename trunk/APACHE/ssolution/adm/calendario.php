<script>
function sel(val) {
	w=window.opener;
	window.opener.document.<?= $_REQUEST['campo'] ?>.value = val;
	w.focus();
	window.close();
}
//-->
</script>

<style>
A, A:HOVER {
	font-style:normal;
	text-decoration:none;
	color:#000000;
}

.calendarHeader{
	height: 18px;
	width: 32px;
	background-color: #e0e0e0;
	text-align:center;
	font-size:13px;
	font-weight:bold;
}

.calendarCurrent{
	width: 190px;
	background-color: #e0e0e0;
	text-align:center;
	font-size:13px;
}

.PrevNextMonth{
	font-size:12px;
}

.calendarToday{
	background-color: #FFFFFF;
	font-weight:bold;
}

.calendarNormal{
	background-color: #f3f3f3;
}

.calendar{
	background-color: #d5d5d5;
}

SELECT {
	font-family:verdana;
	font-size:10px;"
}

</style>

<body marginheight="0" leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0">
<?
include('class_calendario.php');

class MyCalendar extends Calendar
{
	function getCalendarLink($month, $year)
	{
	// Redisplay the current page, but with some parameters
	// to set the new month and year
	$s = getenv('SCRIPT_NAME');
	return "$s?month=$month&year=$year"; }
}

$d = getdate(time());
$month = $_REQUEST['month'];
$year = $_REQUEST['year'];

if ($month == "")
{
	$month = $d["mon"];
}
if ($year == "")
{
	$year = $d["year"];
}

$cal = new MyCalendar;

foreach ( $cal->getMonthNames() as $mes )
{
	$counter++;
	$selMeses .= "<option value=\"$counter\">$mes</option>\n";
}
?>
<table align="center" width="100%" cellpadding="0" cellspacing="0">
<form action="<?= $_SERVER['SCRIPT_NAME'] ?>" name="frm" method="post">
<input type="hidden" name="campo" value="<?= $_REQUEST['campo'] ?>">
	<tr>
		<td align="center">

<select name="month" onChange="frm.submit();">
	<option></option>
	<?= $selMeses ?>
</select>
<select name="year" onChange="frm.submit();">
<? for($ano=$year;$ano>=$year-150;$ano--) { ?>
	<option value="<?= $ano ?>"><?= $ano ?></option>
<? } ?>
</select>
		</td>
	</tr>
</form>
</table>
<script>
	document.frm.year.value="<?= $year ?>";
	document.frm.month.value="<?= $month ?>";
</script>

<?
echo $cal->getMonthView($month, $year);
?>
</body>