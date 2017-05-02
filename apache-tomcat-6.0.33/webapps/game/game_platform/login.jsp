<%@ page contentType="text/html;charset=UTF-8" %>  
<%
String user_name = request.getParameter("user_name");
String user_email = request.getParameter("user_email");
String source_type = request.getParameter("source_type");
String userIdentify = request.getParameter("userIdentify");
%>
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
#top_text {
	margin-top: -75px;
	width: 100%;
	text-align: center;
	position: absolute;
	font-size: 35px;
	color: #649A36;
	font-weight: bold;
	letter-spacing: 9px;
}
#down_text {
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
	background-image: url('images/error.svg');
	background-position: 20% 50%;
	background-repeat: no-repeat;
	background-size: 20px;
	margin-bottom: 20px;
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
	background-image: url('images/teacher.svg');
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
	background-image: url('images/student.svg');
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



</style>
<!-- <script type="text/javascript" src="js/jquery.min.js" ></script> -->
<!-- <script type="text/javascript" src="js/jquery-ui.js" ></script> -->
</head>
<body>
	<div id="background_block">
		<div id="top_text">請選擇您所扮演的角色</div>
		<div id="choiceRolePage">
			<div id="teacher" onclick='viewHandle()'>teacher</div>
			<div id="student" onclick='viewHandle()'>student</div>
		</div>
		<div id="down_text">注意！選擇後將無法更改</div>
	</div>
</body>
<script>

function viewHandle(){

	var user_role = event.target.id;

	var senddata = {
		user_role: user_role,
		// user_id: speciallyID(),
		user_name: '<%=user_name%>',
		user_email: '<%=user_email%>',
		source_type: '<%=source_type%>',
		userIdentify: '<%=userIdentify%>'
	};
	startPOST("login_chk.jsp",senddata);
}

function startPOST(postUrl, data){
	var temp = document.createElement("form");
	temp.action = postUrl;
	temp.method = "post";
	temp.style.display = "none";
	for (var x in data) {
		var opt = document.createElement("textarea");
		opt.name = x;
		opt.value = data[x];
		temp.appendChild(opt);
	}
	document.body.appendChild(temp);
	temp.submit();
	return temp;  
}
function S4() {
	return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
}
function speciallyID() {
	var temp = S4()+S4();
	return temp.substring(0,6);
}
</script>
</html>