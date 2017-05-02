<%@ include file = "chkAuth.jsp"%>
<!--
使用alert(window.navigator.language);
取得使用者目前瀏覽器的語系，然後馬上進行更改

目前查到i18n可以處理語系檔問題
-->
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="css/jquery-ui.css"/>
<link href="../favicon.ico?v=14.01.02" rel="Shortcut Icon" type="image/x-icon">
<link rel="apple-touch-icon-precomposed" href="images/icon/its512.png"/>
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>iTS 5</title>
<style type="text/css">
html {
	height: 100%;
	width:100%;
	margin: 0px;
	/*background: url(images/background.png);*/
}
body {
	display: -webkit-flex;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100%;
	margin: 0px;
	-webkit-user-select: none;
	font-family: "Helvetica Neue","微軟正黑體",Helvetica,Arial,sans-serif;
}

#background_block{
	width: 100%;
	height: 345px;
	background-color: #A1DE2D;
	display: flex;
	display: -webkit-flex;
	-webkit-justify-content:center;
	justify-content:center;
	-webkit-flex-direction:column;
	flex-direction:column;
}
#choiceRolePage {
	top: 0;
	left: 0;
	width: 100%;
	display: -webkit-flex;
	display: flex;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-align-items: center;
	align-items: center;
	box-sizing: border-box;
	margin:20px 0px;
}
#teacher {
	width: 200px;
	height: 200px;
	margin: 0px 30px;
	line-height: 320px;
	text-align: center;
	background-color: white;
	background-image: url('images/CIASS.svg');
	background-position: 50% 20%;
	background-repeat: no-repeat;
	background-size: 65%;
	font-size: 29px;
	border: 2px solid #D8DF00;
	border-radius: 15px;
	cursor: pointer;
	color: black;
}
#student {
	width: 200px;
	height: 200px;
	margin: 0px 30px;
	line-height: 320px;
	text-align: center;
	background-color: white;
	background-image: url('images/P+.svg');
	background-position: 50% 20%;
	background-repeat: no-repeat;
	background-size: 65%;
	font-size: 29px;
	border: 2px solid #D8DF00;
	border-radius: 15px;
	cursor: pointer;
	color: black;
}
#teacher:active {
	border: 2px solid #006E00;
}
#student:active {
	border: 2px solid #006E00;
}
#logout {
	position: relative;
	font-size: 19px;
	text-align: center;
	width: 450px;
	background-color: #618634;
	color: white;
	border-radius: 10px;
	margin: 0px auto;
	margin-top: 0px;
	height: 30px;
	line-height: 30px;
/*	background-image: url('images/error.svg');
	background-position: 20% 50%;
	background-repeat: no-repeat;
	background-size: 20px;*/
	margin-bottom: 20px;
	cursor: pointer;	
}


</style>
<!-- <script type="text/javascript" src="js/jquery.min.js" ></script> -->
<!-- <script type="text/javascript" src="js/jquery-ui.js" ></script> -->
</head>
<body>
	<div id="background_block">
		<div id="choiceRolePage">
			<div id="teacher" onclick='GoToHtml()'>新增班級帳號</div>
			<div id="student" onclick='GoToHtml2()'>增加帳號關聯</div>
		</div>
		<div id="logout" onclick='GoHome()'>登出</div>
	</div>
</body>
<script>
function GoToHtml()
{
window.location.href="http://"+window.location.host+"/iTS5/AccountManagement/EditModeDemo.jsp";
}
function GoToHtml2()
{
window.location.href="http://"+window.location.host+"/iTS5/AccountManagement/ChangeModeDemo.jsp";
}
function GoHome()
{
window.location.href="http://"+window.location.host+"/iTS5/logout.jsp";
}
</script>
</html>