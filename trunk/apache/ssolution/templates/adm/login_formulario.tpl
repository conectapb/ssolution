
<style>
{literal}
BODY {
	font:Verdana, Arial, Helvetica, sans-serif;
}

a#tooCool {
	position: fixed;
	right: 0;
	bottom: 0;
	display: block;
	height: 80px;
	width: 80px;
	background: url(../images/too_cool_sash.png) bottom right no-repeat;
	text-indent: -999em;
	text-decoration: none;
}

#errorbox{
	font: bold;
	color:#FF0000;
	padding:2px;
}

#outter_box{
width: 676px;
height:190px;
position: absolute;
left: 50%;
margin-left: -338px;
top: 50%;
margin-top: -250px;
{/literal}background-image:url({$tpl_dir}/images/login_box.jpg);{literal}
}

label{
width: 4em;
float: left;
text-align: right;
margin-right: 0.5em;
display: block;
font-family:Verdana, Arial, Helvetica, sans-serif;
font-weight:bold;
font-size:small;
}

 .submit input {
 /*color: #000;*/
/*background: #ffa20f;*/
/*border: 2px outset #d7b9c9;*/
margin-left: 10.3em;
}

fieldset {
border: 1px solid #999999;
width: 220px;
height: 145px;
position:relative;
float:left;
left: 26px;
top: 17px;
padding: 3px 3px 3px 15px;
}

 legend
{
/*color: #fff;*/
font-weight:bold;
/*background: #ffa20c;*/
border: 1px solid #781351;
padding: 2px 6px;
}


{/literal}
</style>

<body onLoad="document.frm.login.focus();">
<a id="tooCool" href="http://www.w3junkies.com/toocool/">Too Cool for Internet Explorer</a>
<div id="errorbox" align="center">{$msg}</div>

<div id="outter_box">

<form name="frm" method="post" action="{$SCRIPT_NAME}">
<fieldset>
<legend>Bem-vindo</legend>
<input type="hidden" name="processa" value="ok">
<p><label>Usu&aacute;rio:</label>&nbsp;<input type="text" name="login" value="{$login}"><br />
<p><label>Senha:</label>&nbsp;<input type="password" name="senha"><br />
<p class="submit"><input type="submit" value="Acessar"></p>
</fieldset>
</form>



</div>
</body>