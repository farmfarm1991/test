<%@ include file = "../chkAuth.jsp"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="flex.dao.DBManger" %>
<%@ page import="flex.dao.DBUtils" %>
<%@ page contentType="text/html;charset=UTF-8" %> 
<%
  String gameID = request.getQueryString();
  
System.out.println("game:"+gameID);
  String userID = auth.getUserID();
  String userName = auth.getUserName();
  String userRole = auth.getMainRoleID();

  if(!gameID.equals("new")){
    gameID = gameID.split("=")[1];
  }

  String domID = "";
  String gameName = "";
  String SQL_basicinfo =
         " SELECT * FROM game_basicinfo WHERE gameID = ?";
  try {
    //gameID = gameID.split("=")[1];
      DBManger db = DBUtils.getDBManger();
      Connection conn = db.connWrite();
      PreparedStatement pStatement = conn.prepareStatement(SQL_basicinfo);
      pStatement.setString(1, gameID);
      ResultSet rs = pStatement.executeQuery();
      while(rs.next()) {
        domID = rs.getString("unitID");
        gameName = rs.getString("gameName");
      }
        pStatement.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
System.out.println("gameName:"+gameName);

%>
<html>
<head>
<link rel="icon" href="/game/game_platform/images/logo/icon.png" type="image/png"/>
<meta name="viewport" content="width=device-width,maximum-scale=1.0, minimum-scale=1.0 , user-scalable=no" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Holiyo</title>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<link rel="stylesheet" href="../css/game/intro.css" ></link>
<link rel="stylesheet" href="../css/game/helper.css"></link>
<link rel="stylesheet" href="../css/game/main.css"></link>
<link rel="stylesheet" href="../css/game/end.css"></link>
<link rel="stylesheet" type="text/css" href="../css/game/normalize.css" />
<!-- common styles -->
<link rel="stylesheet" type="text/css" href="../css/game/dialog.css" />
<!-- individual effect -->
<link rel="stylesheet" type="text/css" href="../css/game/dialog-cathy.css" />
<script type="text/javascript" src="../js/modernizr.custom.js"></script>
<script type="text/javascript" src="../js/classie.js"></script>
<script type="text/javascript" src="../js/dialogFx.js"></script>
<script type="text/javascript" src="../js/qrcode.min.js"></script>
<script type="text/javascript" src="../js/md5.js"></script>
<!-- <link href="<%=pURL%>bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"> -->
<script type="text/javascript" src="<%=pURL%>js/iTS5Dialog.js"></script>
<script type="text/javascript" src="<%=pURL%>js/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=pURL%>js/lang.js"></script>
<style>
body{
	overflow:hidden;
	margin: 0;
	font-family: Microsoft JhengHei;
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
  -ms-flex-direction: column;
          flex-direction: column;
}
.fullmain {
	/*height:94%;*/
	box-sizing:border-box;
	display: none;
  -webkit-box-flex: 1;
  -webkit-flex: 1;
  -ms-flex: 1;
      flex: 1;
}
#imgArea {
	/*height: 100%;*/
	background-image: url("images/bground_right.png"),url("images/bground_left.png") ,url("images/_background.png");
    background-position-x: 100%,0%,50%;
    background-position-y: -25%,100%,50%;
    background-size: 250px, 200px, cover;
	background-color: #E5D1AA;
	background-repeat: no-repeat;
	/*padding: 10px 30px 20px;*/
	box-sizing:border-box;
	display:-webkit-flex;
	display:-webkit-box;
	display:-moz-box;
	display:flex;
	-webkit-flex:1;
	-webkit-box-flex:1;
	   -moz-box-flex:1;
	        flex:1;
	-webkit-flex-direction:column;
	-webkit-box-orient:vertical;
	-webkit-box-direction:normal;
	   -moz-box-orient:vertical;
	   -moz-box-direction:normal;
	        flex-direction:column;
  overflow: hidden;
  /*bottom: 20px;*/
}
#loadingWait {
    width: 100%;
    height: 100%;
    position: absolute;
    z-index: 999;
    z-index: 999;
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: flex;
	-webkit-justify-content: center;
	        justify-content: center;
    -webkit-box-align: center;
	-webkit-align-items: center;
	   -moz-box-align: center;
	        align-items: center;
	background-color: #E5D1AA;
}
div#bottomOfText{
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: flex;
	-webkit-flex-direction:column;
	-webkit-box-orient:vertical;
	-webkit-box-direction:normal;
	   -moz-box-orient:vertical;
	   -moz-box-direction:normal;
	        flex-direction:column;
	-webkit-box-align: center;
	-webkit-align-items: center;
	   -moz-box-align: center;
	        align-items: center;
}
div#bottomOfText>div{
	font-size:12px;
	font-family:微軟正黑體;
	color:#525252;
}
#forSelectFile,#forSelectHintFile,#forSelectWinOrLoseFile{
	display: none;
}
/* progress end */
progress{
 	border: 0;
	width: 80%;
	height: 35px;
	margin-top: 20px;
	border-radius: 5px;
	border:1px solid #d0d0d0;
	box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.1);
}
progress::-webkit-progress-value{
       background: -webkit-gradient(linear, 50% 10%, 50% 100%, from(#47FFEB), color-stop(0.6, #70BBCB), to(#47FFEB));
}
progress::-webkit-progress-bar{
    background: -webkit-gradient(linear, 50% 10%, 50% 100%, from(#E0E0E0), color-stop(0.6, #F0F0F0), to(#E0E0E0));
    border-radius: 5px;
}
/*logo*/
.logoBackground{      
	background-image: url("images/bground_right.png"),url("images/bground_left.png") ,url("images/_background.png");
	width: 100%;
	height: 100%;
	background-repeat: no-repeat;
	background-position-x: 100%,0%,50%;      
	background-position-y: -25%,100%,50%;      
	background-size: 250px, 200px, cover;      
	background-color: #E5D1AA;
	-webkit-filter: blur(12px);
	z-index: 100;
}
.logo{
	width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  z-index: 100;
  background-image: url("images/logo-01.png");
  background-size: 45%;
  background-repeat: no-repeat;
  background-position: 50%;
  cursor: pointer;
}
.navbar {
    width: 100%;
    z-index: 40;
    overflow: hidden;
    margin: 0;
}
.itstopbar {
    max-height: 40px;
    background-color: #462301;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#cc9058), to(#A05A27));
    background:-webkit-linear-gradient(top,#cc9058,#A05A27);
    background: -moz-linear-gradient(top,#cc9058,#A05A27);
    background: -ms-linear-gradient(top,#cc9058,#A05A27);
    background:    linear-gradient(top,#cc9058,#A05A27);
    border-bottom: 1px solid #462301;
    display: -wekbki-box;
    display: -webkit-flex;
    display: -webkit-box;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
}
#planTitle {
    line-height: 40px;
    font-size: 25px;
    box-sizing: border-box;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    -webkit-box-flex: 1;
    -webkit-flex: 1;
    -moz-box-flex: 1;
    -ms-flex: 1;
    flex: 1;
    vertical-align: top;
    /* position: absolute; */
}
#blank {
    /* position: relative; */
    -webkit-box-flex: 1;
    -webkit-flex: 1;
    -moz-box-flex: 1;
    -ms-flex: 1;
    flex: 1;
    height: 40px;
}
.naviBtn {
  margin: 4px 18px;
  cursor: pointer;
}
/*save*/
#studen_stat_table {
  width: 100%;
  height: 100%;
  position: fixed;
  z-index: 51;
  display: none;
  top: 0px;
  left:0px;
}
#maskpage {
  background: black;
  width: 100%;
  height: 100%;
  opacity: 0.7;
}
#maskpage+div {
  position: absolute;
  top: 0;
  display: -webkit-box;
  -webkit-box-align: center;
  -webkit-box-pack: center;
  height: 100%;
  width: 100%;
  min-width: 400px;
  display:-webkit-flex;
  display:flex;
  -webkit-justify-content:center;
  justify-content:center;
  -webkit-align-items:center;
  align-items:center;
}
#addmetadata{
  margin-top: -42px;
  width: 500px;
  height: 400px;
  max-height: 500px;
  background: white;
  border-radius: 15px;
  box-shadow: 0px 0px 10px 5px #3C3C3C;
}
#titlename3,  #titlename2{
  border-bottom: 1px solid #4a2500;
  text-align: center;
  font-size: 18px;
  line-height: 48px;
  height: 48px;
  background: #4a2500;
  border-radius: 6px 6px 0px 0px;
  /*margin-bottom: 20px;*/
  color:white;
  border-bottom: 2px solid #4a2500;
}
#examtitle>input[type="text"] {
    padding: 4px 6px;
}
#allmetadata{
  width: 100%;
  height: 265px;
  padding-top: 20px;
  padding-bottom: 20px;
  overflow: auto;
}
#examtitle, #examtime, #examnote, #examcreate, #examimgid, #selectYS, #selectGD, #selectAC {
  display: inline-block;
  width: 100%;
  margin-bottom: 14px;
  font-size: 14px;
}
#examtitle>div, #examtime>div, #examnote>div,
#examcreate>div, #examimgid>div, #selectYS>div, #selectGD>div, #selectAC>div {
  float: left;
  width: 80px;
  text-align: center;
  height: 28px;
  line-height: 28px;
}
#examtime>div:after {
  content: "分鐘";
  position: absolute;
  margin-left: 70px;
}
input[type="text"], input[type="url"] {
  margin: 0px;
  height: 28px;
  border: 0px;
  border-radius: 0px;
  width: 100%;
}
#examtitle>input[type="text"], #examnote>input[type='text'] {
  float: left;
  width: 75%;
  border: 1px solid;
}
#examtime>input[type="number"] {
  float: left;
  width: 50px;
  border: 1px solid;
  margin-left: 0px;
  height: 28px;
}

#examcreate>span, #examimgid>span {
  height: 28px;
  display: block;
  float: left;
  line-height: 28px;
  text-align: center;
}
/*#selectGD {
  margin-bottom: 0px;
}*/
#yy, #ss, #gg, #dd ,#aa ,#cc{
  float: left;
  width: 147;
  -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
  border-radius: 4px;
  padding: 4px 6px;
  margin-bottom: 10px;
  color: #555;
  border: 1px solid #ccc;
}
#OKbtn, #NObtn, #OKbtn2, #NObtn2 {
  width: 90px;
  height: 25px;
  cursor: pointer;
  text-shadow: none;
  line-height: 25px;
  text-shadow: none;
  margin: 0px 10px;
  border-radius: 4px;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    text-align: center;
  background: #c79463;
  border: 1px solid #ad835c; 
  padding: 4px 12px;
  color: white;
  font-size: 14px;
}
}
#OKbtn, #OKbtn2 {
  background: #c79463;
  border: 1px solid #ad835c;
}
#NObtn, #NObtn2 {
  background: #bdbdbd;
  border: 1px solid #a8a8a8;
}

#msg {
  display: none;
  width: 320px;
  height: 215px;
  border: 2px solid #848484;
  border-radius: 8px;
}
#msg.isOnlyMsg {
  height: 156px;
}
#msgMain {
  width: 100%;
  height: 106px;
  background-color: white;
  font-size: 18px;
  line-height: 32px;
  text-align: center;
  box-sizing:border-box;
  display: -webkit-box;
  display: -webkit-flex;
  display: flex;
  -webkit-box-pack:center;
  -webkit-align-items:center;
  align-items:center;
  -webkit-box-align: center;
  -webkit-justify-content: center;
  justify-content: center;
  
}
.choicebox {
  display: -webkit-flex;
  display: flex;
  -webkit-justify-content: space-around;
  justify-content: space-around;
  -webkit-align-items: center;
  align-items: center;
  height: 58px;
  border-top: 1px solid #E6E6E6;
  background: white;
  border-radius: 0px 0px 6px 6px;
}
.isWaitMsg>.choicebox,  .isOnlyMsg>.choicebox{
  display: none;
}
.isOnlyMsg>#msgMain {
  border-radius: 0px 0px 6px 6px;
}
.isWaitMsg>#msgMain {
  border-radius: 0px 0px 6px 6px;
  background-image: url('img/ql3.gif');
  background-position: 50% 5px;
  background-repeat: no-repeat;
  height: 165px;
  line-height: 75px;
  -webkit-align-items:flex-end;
  align-items:flex-end;
  -webkit-justify-content: center;
  justify-content: center;
}
.isAlert>.choicebox>#NObtn2 {
  display: none;
}
.isAlert>.choicebox>#OKbtn2 {
    width: 50%;
}
/*QRcode*/
#somedialog6 .dialog__content>div{
  width: 100%;
   display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: flex;
    -webkit-box-pack: justify;
  -webkit-justify-content: space-around;
     -moz-box-pack: justify;
          justify-content: space-around;
}
div#qrcode {
    width: 100%;
    height: 100%;
    background-repeat: no-repeat;
    -webkit-background-size: contain;
            background-size: contain;
    background-position: 50%;
    -webkit-background-origin: content-box;
            background-origin: content-box;
    padding: 20px;
    -webkit-box-sizing: border-box;
       -moz-box-sizing: border-box;
            box-sizing: border-box;
}

#qrcode>img {
    width: auto;
    height: 100%;
    margin: auto;
    visibility: hidden;
}
div#startPlay{
  display: -webkit-inline-box;
    align-items: baseline;
}
.playGame{
  width: 70px;
    height: 67px;
    margin-left: 30px;
    margin-top: 25px;
    background-image: url('images/fullimg3.png');
    background-repeat: no-repeat;
    background-position-x: -2242px;
    background-position-y: -843px;
    zoom:0.365;

}
.playGame:hover:after{
  content: "點我開始玩";
  color: black;
    font-size: 35px;
    position: fixed;
    padding: 10px 18px;
    border-radius: 17px;
    margin-left: 50px;
    background-color: rgb(255, 195, 108);
}
.playGame:hover:before{
  content: "";
    width: 0px;
    height: 0px;
    border-right: 15px solid #FFC36C;
    border-bottom: 13px solid transparent;
    border-top: 13px solid transparent;
    position: absolute;
    margin-top: 25px;
    margin-left: 40px;
    opacity: 1;
}
button {
    padding: 0.5em 1em;
    outline: none;
    font-weight: 600;
    border: none;
    color: #fff;
    background-color: #4FA7D1;
    text-decoration: none;
    -webkit-box-sizing: border-box;
       -moz-box-sizing: border-box;
            box-sizing: border-box;
}
.pull-right{
  right: 0;
  position: absolute;
}
/* show external qrcode */
/*#qrcodeImg{
  width: 180px;
  height: 180px;
  margin-left: 160px;
}
#intro_NextBtn,#helper_PrevBtn,#helper_NextBtn,#level_NextBtn,#level_PrevBtn,#end_PrevBtn{
  top: 20px;
}*/
</style>
</head>
<body onSelectStart="event.returnValue=false" fastid='random'>
<!-- navbar -->
<header class="navbar">
	<div class="itstopbar">
		<span id="back" onclick='back()'>
			<img class="naviBtn" src="../images/naviBar/back.svg"/>
		</span>
		<span id="planTitle"></span>
    <span class="pull-right" onClick="save()">
      <span id="searchTrigger" class="search-trigger naviSearch">
        <img class="naviBtn" src="img/save.svg"/>
      </span>   
    </span>
	</div>
</header>
<div id="studen_stat_table">
    <div id="maskpage"></div>
    <div>
      <div id="addmetadata">
        <div class='text' id="titlename3">加註資料</div>
        <div id="allmetadata">
          <div id='examtitle'><div class='text' id='plan_name_label'>遊戲名稱</div><input type='text'></div>
          <div id='examcreate'><div class='text' id='plan_create_label'>製作者</div><span><%=userName%></span></div>
          <jsp:include page="../module/getdomain_forAdding.jsp" />
        </div>
        <div  class='choicebox'>
          <div class='btn text' id="OKbtn">確定</div>
          <div class='btn text' id="NObtn">取消</div>
        </div>
      </div>
    </div>
</div>
<!-- create game -->
	<div class='fullmain' stage="1">
		<!-- <div class='logoBackground'></div>
		<div class="logo"></div> -->
		<!-- <div class="logo" onclick='startGame()'></div> -->
		
		<div id='loadingWait'>
			<div class="loader">
				<div class="timerWrap">
					<svg version="1.1" viewBox="131.623 175.5 120 160" preserveAspectRatio="xMinYMin meet" class="timer">
						<path fill="#FFFFFF" d="M212.922,255.45l36.855-64.492c1.742-3.069,1.742-6.836-0.037-9.896c-1.783-3.06-5.037-4.938-8.581-4.938
					h-99.158c-3.524,0-6.797,1.878-8.569,4.938c-1.773,3.06-1.792,6.827-0.03,9.896l36.846,64.491l-36.845,64.492
					c-1.762,3.068-1.743,6.836,0.03,9.896c1.772,3.061,5.044,4.938,8.569,4.938h99.158c3.544,0,6.798-1.878,8.581-4.938
					c1.779-3.06,1.779-6.827,0.037-9.896L212.922,255.45z M142.001,324.86l39.664-69.41l-39.664-69.41h99.158l-39.663,69.41
					l39.663,69.41H142.001z"></path>
					</svg>
				</div>
			</div>
<style>
@-webkit-keyframes timerRotate {
  0% {
    transform: rotateZ(0deg);
  }
  50% {
    transform: rotateZ(0deg);
  }
  100% {
    transform: rotateZ(-180deg);
  }
}
@-moz-keyframes timerRotate {
  0% {
    transform: rotateZ(0deg);
  }
  50% {
    transform: rotateZ(0deg);
  }
  100% {
    transform: rotateZ(-180deg);
  }
}
@-ms-keyframes timerRotate {
  0% {
    transform: rotateZ(0deg);
  }
  50% {
    transform: rotateZ(0deg);
  }
  100% {
    transform: rotateZ(-180deg);
  }
}
@keyframes timerRotate {
  0% {
    transform: rotateZ(0deg);
  }
  50% {
    transform: rotateZ(0deg);
  }
  100% {
    transform: rotateZ(-180deg);
  }
}
@-webkit-keyframes bottomFill {
  0% {
    border-bottom-width: 0px;
  }
  50% {
    border-bottom-width: 60px;
  }
  100% {
    border-bottom-width: 60px;
  }
}
@-moz-keyframes bottomFill {
  0% {
    border-bottom-width: 0px;
  }
  50% {
    border-bottom-width: 60px;
  }
  100% {
    border-bottom-width: 60px;
  }
}
@-ms-keyframes bottomFill {
  0% {
    border-bottom-width: 0px;
  }
  50% {
    border-bottom-width: 60px;
  }
  100% {
    border-bottom-width: 60px;
  }
}
@keyframes bottomFill {
  0% {
    border-bottom-width: 0px;
  }
  50% {
    border-bottom-width: 60px;
  }
  100% {
    border-bottom-width: 60px;
  }
}
@-webkit-keyframes topEmpty {
  0% {
    top: 19px;
    border-top-width: 60px;
    border-left-width: 35px;
    border-right-width: 35px;
  }
  50% {
    top: 80px;
    border-top-width: 0px;
    border-left-width: 0px;
    border-right-width: 0px;
  }
  100% {
    top: 80px;
    border-top-width: 0px;
    border-left-width: 0px;
    border-right-width: 0px;
  }
}
@-moz-keyframes topEmpty {
  0% {
    top: 19px;
    border-top-width: 60px;
    border-left-width: 35px;
    border-right-width: 35px;
  }
  50% {
    top: 80px;
    border-top-width: 0px;
    border-left-width: 0px;
    border-right-width: 0px;
  }
  100% {
    top: 80px;
    border-top-width: 0px;
    border-left-width: 0px;
    border-right-width: 0px;
  }
}
@-ms-keyframes topEmpty {
  0% {
    top: 19px;
    border-top-width: 60px;
    border-left-width: 35px;
    border-right-width: 35px;
  }
  50% {
    top: 80px;
    border-top-width: 0px;
    border-left-width: 0px;
    border-right-width: 0px;
  }
  100% {
    top: 80px;
    border-top-width: 0px;
    border-left-width: 0px;
    border-right-width: 0px;
  }
}
@keyframes topEmpty {
  0% {
    top: 19px;
    border-top-width: 60px;
    border-left-width: 35px;
    border-right-width: 35px;
  }
  50% {
    top: 80px;
    border-top-width: 0px;
    border-left-width: 0px;
    border-right-width: 0px;
  }
  100% {
    top: 80px;
    border-top-width: 0px;
    border-left-width: 0px;
    border-right-width: 0px;
  }
}
.loader {
  float: left;
  -webkit-transform: translateZ(0);
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  -webkit-perspective: 1000;
}
.loader .timerWrap {
  position: relative;
  animation: timerRotate 1s infinite ease;
  -webkit-animation: timerRotate 1s infinite ease;
  -moz-animation: timerRotate 1s infinite ease;
  -ms-animation: timerRotate 1s infinite ease;
}
.loader .timerWrap:before {
  content: "";
  width: 0;
  height: 0;
  border-style: solid;
  border-width: 60px 35px 0 35px;
  border-color: #e08f24 transparent transparent transparent;
  position: absolute;
  top: 19px;
  left: 0;
  right: 0;
  margin: auto;
  animation: topEmpty 1s infinite ease;
  -webkit-animation: topEmpty 1s infinite ease;
  -moz-animation: topEmpty 1s infinite ease;
  -ms-animation: topEmpty 1s infinite ease;
}
.loader .timerWrap:after {
  content: "";
  width: 0;
  height: 0;
  border-style: solid;
  border-width: 0 35px 60px 35px;
  border-color: transparent transparent #e08f24 transparent;
  position: absolute;
  bottom: 19px;
  left: 0;
  right: 0;
  margin: auto;
  animation: bottomFill 1s infinite ease;
  -webkit-animation: bottomFill 1s infinite ease;
  -moz-animation: bottomFill 1s infinite ease;
  -ms-animation: bottomFill 1s infinite ease;
}
.loader .timerWrap .timer {
  width: 120px;
  max-width: 100%;
  height: 160px;
  position: relative;
  top: 0;
  left: 0;
}
.loader .timerWrap .timer path {
  fill: #3f6b9d;
}
			</style>
		</div>
		<div id='imgArea'>
			<div class='text' id='uploadTitle'>上傳起始頁</div>
			<div id='imgbox'>
				<div id="typeDom" type='noimg'>
					<div id='uploadbtn'>
						<div id='imgActive'></div>
						<input type='file' id='myuploadimg_intro'></input>
					</div>
					<sdiv id='cardimg'></sdiv>
				</div>
			</div>
			<div id='intro_NextBtn'>
				<div id='nextBtn' disabled="disabled"></div>
			</div>
			<!-- <div id='bottomOfText'>
				<div>此遊戲行動APP平台由 台南資訊教育輔導團 楊易霖  陳秀梅老師協助製作</div>
				<div>本軟體智慧財產權為宏鼎資訊股份有限公司所有</div>
			</div> -->
		</div>
		<!-- <div id='importEditCode'></div> -->
	</div>
	<div class="fullmain" stage="2">
		<div id='imgArea' p1='false' p2='false' p3='false'>
			<!-- <div id="aboutGame">
				<div id="aboutGameText" class='single-line' contenteditable="true"></div>
			</div> -->
			<div id="nextPage" class="pagebtn">下一頁說明頁</div>
			<div id="prevPage" class="pagebtn">上一頁說明頁</div>
			<div class='imgBox' no="1">
				<div id="typeDom1" type='noimg'>
					<div class="uploadbtn">
						<div class='imgActive'></div>
						<input type='file' class='myuploadimg_helper'></input>
					</div>
					<sdiv class='cardimg' id='cardimg1'></sdiv>
				</div>
			</div>
			<div class='imgBox' no="2" style="display: none;">
				<div id="typeDom2" type='noimg'>
					<div class="uploadbtn">
						<div class='imgActive'></div>
						<input type='file' class='myuploadimg_helper'></input>
					</div>
					<sdiv class='cardimg' id='cardimg2'></sdiv>
				</div>
			</div>
			<div class='imgBox' no="3" style="display: none;">
				<div id="typeDom3" type='noimg'>
					<div class="uploadbtn">
						<div class='imgActive'></div>
						<input type='file' class='myuploadimg_helper'></input>
					</div>
					<sdiv class='cardimg' id='cardimg3'></sdiv>
				</div>
			</div>
			<div id='helper_NextBtn'>
				<div id='nextBtn'  disabled="disabled"></div>
			</div>
			<div id='helper_PrevBtn'>
				<div id='prevBtn'></div>
			</div>
			<!-- <div id='bottomOfText'>
				<div>此遊戲行動APP平台由 台南資訊教育輔導團 楊易霖  陳秀梅老師協助製作</div>
				<div>本軟體智慧財產權為宏鼎資訊股份有限公司所有</div>
			</div> -->
		</div>
	</div>
	<div class="fullmain" stage="3">
		<div id="somedialog" class="dialog">
			<div class="dialog__overlay"></div>
			<div class="dialog__content">
				<h2>
					<div id='hintImgList' type='noImg'>
						<div id='changeHintImg'></div>
					</div>
				</h2>
				<div><button class="action" data-dialog-close>Close</button></div>
			</div>
		</div>
		<div id="somedialog2" class="dialog">
			<div class="dialog__overlay"></div>
			<div class="dialog__content">
				<h2>
					<div id='alertMsg'>請先建立題目</div>
				</h2>
				<div><button class="action" data-dialog-close>Close</button></div>
			</div>
		</div>

		<div id='imgArea'>
			<div id='topBar'>
				<div id='aboutTime'>
					<select id='timetype'>
						<option val='grow'>進行時間</option>
						<option val='down'>剩餘時間</option>
					</select>
					<input id='timeClock' type='text' value="00:00" readonly pattern="[0-9]{2}:[0-9]{2}" maxlength="5" placeholder="mm:ss"/>
				</div>

				<div id="aboutGame">
					<input type='text' id="aboutGameText" class='single-line' placeholder="請輸入遊戲名稱"></input>
				</div>

				<div id='aboutSetting'>
					<div id='menuBtn'></div>
				</div>
			</div>
			<div id='quizList'>
				<div id='quizImg'>
					<div id='addImg' type='noimg'>
						<div id='imageChange'></div>
					</div>
				</div>
				<div id='levelBox'>
					<div>
						<div class="level open" id="level1" itemno="1">
							<div class="deleteBtn"></div>
						</div>
						<div class="level lock none" id="level2" itemno="2">
							<div class="deleteBtn"></div>
						</div>
						<div class="level lock hide" id="level3" itemno="3">
							<div class="deleteBtn"></div>
						</div>
					</div>
					<div>
						<div class="level lock hide" id="level4" itemno="4">
							<div class="deleteBtn"></div>
						</div>
						<div class="level lock hide" id="level5" itemno="5">
							<div class="deleteBtn"></div>
						</div>
						<div class="level lock hide" id="level6" itemno="6">
							<div class="deleteBtn"></div>
						</div>
					</div>
				</div>
			</div>
			<div id='bottomBar' stage='stagelist'>
				<div id='hint' cd='cding'>
					<div id="m2" style="-webkit-filter:url(#goo);filter:url(#goo);">
						<div class='ball_outside'  deg='25'>
							<div class='ball' id='ball_orange'></div>
						</div>
						<div class='ball_outside'  deg='25'>
							<div class='ball' id='ball_orange'></div>
						</div>
						<div class='ball_outside'  deg='25'>
							<div class='ball' id='ball_orange'></div>
						</div>
						<div class='ball_outside' deg='25'>
							<div class='ball' id='ball_orange'></div>
						</div>
						<div class='ball_outside' deg='25'>
							<div class='ball' id='ball_orange'></div>
						</div>
						<div class='ball_outside' deg='25'>
							<div class='ball' id='ball_orange'></div>
						</div>
						<div class='ball_outside' deg='25'>
							<div class='ball' id='ball_orange'></div>
						</div>
						<div class='ball_outside' deg='25'>
							<div class='ball' id='ball_orange'></div>
						</div>
						<div class='ball_outside' deg='25'>
							<div class='ball' id='ball_orange'></div>
						</div>
					</div>
					<div id='hintTimeBox' leaftime='0' getTime='120'>
						<span id='isHintBtn' data-dialog="somedialog" class="trigger">創建提示</span>
						<div id='setting'>
							<span id='hintLebel'>設定提示倒數</span>
							<!-- <div id='hintTime' contenteditable="true" onkeypress="return (this.innerText.length <= 5)">00:00</div> -->
							<input id="hintTime" type='text' value='20' maxlength=2  pattern="^[0-9]{1,2}$" placeholder="ss" onblur="numChange(this)"/>
						</div>
					</div>
				</div>
				<div id='ansArea'>
					<input id='ansFill' placeholder="在此輸入答案" maxlength="10"></input>
					<div class='oneWord ishide'></div>
					<div class='oneWord ishide'></div>
					<div class='oneWord ishide'></div>
					<div class='oneWord ishide'></div>
					<div class='oneWord ishide'></div>
					<div class='oneWord ishide'></div>
					<div class='oneWord ishide'></div>
					<div class='oneWord ishide'></div>
					<div class='oneWord ishide'></div>
					<div class='oneWord ishide'></div>
				</div>
				<div id='sendBtn' stage='stagelist' onclick="openMenu()">
					<div id='isSendBtn'>關卡</div>
					<div id='setting_send'>
						<span id='sendLebel'>設定答題倒數</span>
						<!-- <div id='sendTime' contenteditable="true">00:00</div> -->
						<input id="sendTime" type='text' value='15' maxlength=2  pattern="^[0-9]{1,2}$" placeholder="ss" onblur="numChange(this)"/>
					</div>
				</div>
			</div>

			<div id='level_NextBtn'>
				<div id='nextBtn'  disabled="disabled"></div>
			</div>
			<div id='level_PrevBtn'>
				<div id='prevBtn'></div>
			</div>
			<!-- <div id='bottomOfText'>
				<div>此遊戲行動APP平台由 台南資訊教育輔導團 楊易霖  陳秀梅老師協助製作</div>
				<div>本軟體智慧財產權為宏鼎資訊股份有限公司所有</div>
			</div> -->
		</div>
	</div>
	<div  class="fullmain" stage="4">
		<div id="somedialog4" class="dialog">
			<div class="dialog__overlay"></div>
			<div class="dialog__content">
				<h2>
					<div><label>創建者 : </label><input type="text"></div>
					<div><label>遊戲名稱 : </label><input type="text"></div>
				</h2>
				<div><button class="action" data-dialog-close>存檔</button></div>
			</div>
		</div>
		<div id="somedialog5" class="dialog" style='display:none'>
			<div class="dialog__overlay"></div>
			<div class="dialog__content">
				<h2>
					<div>存檔中</div>
					<progress value='0' max='100'></progress>
				</h2>
				<div><button class="action" data-dialog-close style='display:none'>存檔</button></div>
			</div>
		</div>
		<!-- <div id="somedialog6" class="dialog">
			<div class="dialog__overlay"></div>
			<div class="dialog__content">
				<h2>
					<div id='startPlay'>開始玩 QRcode
					 	<a href='' target='blank'>
					 		<div class='playGame'></div>
					 	</a>
					</div>
					<div id='qrcode'></div>
				</h2>
				<div>
					<div id='reEditCode'>遊戲ID：
						<span></span>
					</div>
					<button class="action" data-dialog-close>關閉</button>
				</div>
			</div>
		</div> -->
		<div id='imgArea' type='showWiner'>
			<div id="winerPage" class="pagebtn">切換為過關畫面</div>
			<div id="loserPage" class="pagebtn" style="display:none">切換為失敗畫面</div>
			<div class='imgBox' no="1">
				<div id="winerImg" type='noimg'>
					<div id='changeWinImg'></div>
				</div>
			</div>
			<div class='imgBox' no="2">
				<div id="loserImg" type='noimg'>
					<div id='changeLoseImg'></div>
				</div>
			</div>
			<!-- <div id='end_NextBtn'>
				<div id='nextBtn' disabled="disabled"></div>
			</div> -->
			<div id='end_PrevBtn'>
				<div id='prevBtn'></div>
			</div>
			<!-- <div id='bottomOfText'>
				<div>此遊戲行動APP平台由 台南資訊教育輔導團 楊易霖  陳秀梅老師協助製作</div>
				<div>本軟體智慧財產權為宏鼎資訊股份有限公司所有</div>
			</div> -->
		</div>
	</div>
	<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="800" style='display:none;'>
		<defs>
			<filter id="goo">
				<feGaussianBlur in="SourceGraphic" stdDeviation="10" result="blur"></feGaussianBlur>
				<feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 19 -9" result="goo"></feColorMatrix>
				<feComposite in="SourceGraphic" in2="goo" operator="atop"></feComposite>
			</filter>
			<filter id="goo-no-comp">
				<feGaussianBlur in="SourceGraphic" stdDeviation="10" result="blur"></feGaussianBlur>
				<feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 19 -9" result="goo"></feColorMatrix>
			</filter>
		</defs>
	</svg>
  <!-- 新加 -->
  <div id="somedialog6" class="dialog">
      <div class="dialog__overlay"></div>
      <div class="dialog__content">
        <h2>
          <div id='startPlay'>開始玩 QRcode
            <a href='' target='blank'>
              <div class='playGame'></div>
            </a>
          </div>
          <div id='qrcode'></div>
        </h2>
        <div>
          <div id='reEditCode'>遊戲ID：
            <span></span>
          </div>
          <button class="action" data-dialog-close>關閉</button>
        </div>
      </div>
    </div>
</body>
<script>
$('link[rel="stylesheet"][href="../css/game/helper.css"]').remove();
$('link[rel="stylesheet"][href="../css/game/main.css"]').remove();
$('link[rel="stylesheet"][href="../css/game/end.css"]').remove();
var authUserRole = "<%=userRole%>";
var nowNumber;
var file_array_list = new Array();
var editMode = false;
var gameid = "";
// alert("domID "+'<%=domID%>'+" gameName "+'<%=gameName%>');
$(function() {
	gameid = S4()+S4();
	$('body').attr('gameid',gameid);
	$('#reEditCode>span').text(gameid);
	
	$('#bottomOfText').hide();

	//解決ipad 螢幕底部多20px 問題
	if(navigator.userAgent.match(/iPad/i) && !window.navigator.standalone) {

		$('html').addClass('ipad ios7');
    var mainHeight = $(window).height()-41;
    $(".fullmain").css('height',mainHeight+'px');
	}

	if(location.search.substr(1).split('&')[0].length>0){
		//	有參數近來
		var getPararmeter = location.search.substr(1).split('&')[0].split('=')[0];
		var getValue = location.search.substr(1).split('&')[0].split('=')[1];
		if(getPararmeter == 'edit'){
			if(getValue.length == 8) {
				gameid = getValue;
				editMode = true;
				$('body').attr('gameid',getValue);
			}
		}
	}


	if(editMode){
		loadGameData();
	}
	else {
		$('#loadingWait').remove();

		if(location.hash == '#2'){
			stage1_to_stage2();
		}
		if(location.hash == '#3'){
			//$('link[rel="stylesheet"][href="css/intro.css"]').remove();
			stage1_to_stage2();
			stage2_to_stage3();

		}
		if(location.hash == '#4'){
			//$('link[rel="stylesheet"][href="css/intro.css"]').remove();
			stage1_to_stage2();
			stage2_to_stage3();
			stage3_to_stage4();
		}
	}
	//stage1 :
	$('#importEditCode').bind('click', reloadEditCode);
	$('#myuploadimg_intro').bind('change',upload_by_intro);
	$('#imgActive').bind('click', removeImg_intro);
	$('.fullmain[stage="1"] #nextBtn').bind('click', stage1_to_stage2);

	//stage2 :
	$('.myuploadimg_helper').bind('change',upload_by_helper);
	$('.imgActive').bind('click', removeImg_helper);
	$('.fullmain[stage="2"] #prevPage').bind('click', prevPage);
	$('.fullmain[stage="2"] #nextPage').bind('click', nextPage);
	$('.fullmain[stage="2"] #nextBtn').bind('click', stage2_to_stage3);
	$('.fullmain[stage="2"] #prevBtn').bind('click', stage2_to_stage1);

	//$('.fullmain[stage="2"] #aboutGameText').bind('blur',reTextTitle);
	

	//stage3 :
//	$('.fullmain[stage="3"] #aboutGameText').bind('blur',reTextTitle2);
	$('.fullmain[stage="3"] #menuBtn').bind('click', openMenu);
	$('.fullmain[stage="3"] .level').bind('click', whenClickLevel);
	$('.fullmain[stage="3"] .deleteBtn').bind('click', whenClickRemoveLevel);
	$('.fullmain[stage="3"] #addImg').bind('click', upload_by_eachQuiz);
	$('.fullmain[stage="3"] #hintImgList').bind('click', showHintBox);
	$('.fullmain[stage="3"] #nextBtn').bind('click', stage3_to_stage4);
	$('.fullmain[stage="3"] #prevBtn').bind('click', stage3_to_stage2);
	$('.fullmain[stage="3"] #timetype').on('change', select_change );
	$('.fullmain[stage="3"] #timeClock').on('blur', checkTimeFormat );
	$('.fullmain[stage="3"] #hintTime').on('blur', checkTimeFormat );
	$('.fullmain[stage="3"] #sendTime').on('blur', checkTimeFormat );

	//stage4 :
	$('.fullmain[stage="4"] #loserPage').bind('click', change2LoserPage);
	$('.fullmain[stage="4"] #WinerPage').bind('click', change2WinerPage);
	$('.fullmain[stage="4"] .imgBox>div').bind('click', upload_WinorLose_Img);
	// $('.fullmain[stage="4"] #nextBtn').bind('click', stage4_to_stage5);
	$('.fullmain[stage="4"] #prevBtn').bind('click', stage4_to_stage3);
});

function stage1_to_stage2() {
	$('link[rel="stylesheet"][href="../css/game/intro.css"]').attr('href', '../css/game/helper.css');
//	$('link[rel="stylesheet"][href="css/intro.css"]').remove();
//	$('head').append("<link rel='stylesheet' href='css/helper.css'></link>");
	init_stage2();
	controlArrow();
}
function stage2_to_stage1() {
	$('link[rel="stylesheet"][href="../css/game/helper.css"]').attr('href', '../css/game/intro.css');
//	$('head').append("<link rel='stylesheet' href='css/intro.css'></link>");
//	$('link[rel="stylesheet"][href="css/helper.css"]').remove();

}
function stage2_to_stage3() {
	$('link[rel="stylesheet"][href="../css/game/helper.css"]').attr('href', '../css/game/main.css');
//	$('link[rel="stylesheet"][href="css/helper.css"]').remove();
//	$('head').append("<link rel='stylesheet' href='css/main.css'></link>");
	init_stage3();
  checkCanGoNextStage();
//	var k = $(".fullmain[stage='2'] #aboutGameText").text();
//	$(".fullmain[stage='3'] #aboutGameText").text(k);
}
function stage3_to_stage4() {
	$('link[rel="stylesheet"][href="../css/game/main.css"]').attr('href', '../css/game/end.css');
	$('#loserPage').show();
	console.log("123");
}
function stage3_to_stage2() {
	$('link[rel="stylesheet"][href="../css/game/main.css"]').attr('href', '../css/game/helper.css');
}

var getBeforeGameData;
function loadGameData(){
	$.get( "/iTS5/service/file/game/"+gameid+"/data.txt" ,function(result){
		getBeforeGameData = $.parseJSON(result);

		//置換圖片
		//封面頁
		var imgURL01 = "/iTS5/service/file/game/"+gameid+"/"+getBeforeGameData.fileList[0];
		$('.fullmain[stage="1"] #cardimg').css('background-image','url("'+imgURL01+'")');
		$('.fullmain[stage="1"] #typeDom').attr('type','hasimg');
		$('.fullmain[stage="1"] #nextBtn').removeAttr('disabled');
		file_array_list[0] = {};
		file_array_list[0].finalName = getBeforeGameData.fileList[0];
		file_array_list[0].imageUrl = imgURL01;
		//說明頁
		$('.fullmain[stage="2"] .imgBox[no="1"]').addClass('nowPoint');
		$('.fullmain[stage="2"] .imgBox[no="2"]').css('display','none');
		$('.fullmain[stage="2"] .imgBox[no="3"]').css('display','none');
    // 判斷是否為undefined(少判斷圖片會有誤)
    if (getBeforeGameData.fileList[1]!=null) {
      if (getBeforeGameData.fileList[1].split('/').pop() != "undefined") {
        var imgURL02 = "/iTS5/service/file/game/"+gameid+"/"+getBeforeGameData.fileList[1];
        $('.fullmain[stage="2"] #cardimg1').css('background-image','url("'+imgURL02+'")');
        $('.fullmain[stage="2"] #typeDom1').attr('type','hasimg');
        $('.fullmain[stage="2"] #imgArea').attr('p1','true');
        file_array_list[1] = {};
        file_array_list[1].finalName = getBeforeGameData.fileList[1];
        file_array_list[1].imageUrl = imgURL02;
      }
    }
		
		if(getBeforeGameData.fileList[2] != null) {
			var imgURL03 = "/iTS5/service/file/game/"+gameid+"/"+getBeforeGameData.fileList[2];
			$('.fullmain[stage="2"] #cardimg2').css('background-image','url("'+imgURL03+'")');
			$('.fullmain[stage="2"] #typeDom2').attr('type','hasimg');
			$('.fullmain[stage="2"] #imgArea').attr('p2','true');
			file_array_list[2] = {};
			file_array_list[2].finalName = getBeforeGameData.fileList[2];
			file_array_list[2].imageUrl = imgURL03;
		}
		if(getBeforeGameData.fileList[3] != null) {
			var imgURL04 = "/iTS5/service/file/game/"+gameid+"/"+getBeforeGameData.fileList[3];
			$('.fullmain[stage="2"] #cardimg3').css('background-image','url("'+imgURL04+'")');
			$('.fullmain[stage="2"] #typeDom3').attr('type','hasimg');
			$('.fullmain[stage="2"] #imgArea').attr('p3','true');
			file_array_list[3] = {};
			file_array_list[3].finalName = getBeforeGameData.fileList[3];
			file_array_list[3].imageUrl = imgURL04;
		}
		//遊戲頁
		//getBeforeGameData.finalData = $.parseJSON(getBeforeGameData.finalData);
		//getBeforeGameData.finalData = getBeforeGameData.finalData;

		for(var gg = 0; gg<getBeforeGameData.finalData.length; gg++){

			var tempimg = "/iTS5/service/file/game/"+gameid+"/"+getBeforeGameData.fileList[4-0+gg*2];

			file_array_list[4-0+gg*2] = {};
			file_array_list[4-0+gg*2].imageUrl = tempimg;
			file_array_list[4-0+gg*2].quizAns = decodeURI( getBeforeGameData.finalData[gg].ans );

			$($('.level')[gg]).removeClass('hide').removeClass('lock').removeClass('none').addClass('open');

			//檢查提示
			if(getBeforeGameData.fileList[4-0+gg*2+1] != null) {
				var tempimg2 = "/iTS5/service/file/game/"+gameid+"/"+getBeforeGameData.fileList[4-0+gg*2+1];

				file_array_list[4-0+gg*2+1] = {};
				file_array_list[4-0+gg*2+1].imageUrl = tempimg2;
			}
		}
		if($('.level.none').length<1)
			$($('.level.hide')[0]).removeClass('hide').addClass('none');
		$('.fullmain[stage="3"] #nextBtn').removeAttr('disabled');
		//遊戲參數
//debugger
		var mm = getBeforeGameData.clock.substr(0,2);
		var ss = getBeforeGameData.clock.substr(2);
		var timetype = getBeforeGameData.timetype;
		$('#timeClock').attr('value',mm+':'+ss);
		$('#hintTime').attr('value', getBeforeGameData.hintClock)
		$('#sendTime').attr('value',getBeforeGameData.sendLockClock);
		//$('#aboutGameText').text(decodeURI(getBeforeGameData.title));
		$('#aboutGameText').val(decodeURI(getBeforeGameData.gameName));
		//determine timetype 
		if (timetype == 'b' || $('#timeClock').val() != '00:00') {
			$($('#timetype option')[1]).attr('selected', true);
			$('#timeClock').prop('readonly', false);
		}
		//設定過關或失敗圖片
    //新增判斷(修正讀取時無法新增圖片)
    if (getBeforeGameData.fileList[16]!=null) {
      if (getBeforeGameData.fileList[16].split('/').pop() != "undefined") {
        // if (getBeforeGameData.fileList[16]==undefined) {
    		var imgURL16 = "/iTS5/service/file/game/"+gameid+"/"+getBeforeGameData.fileList[16];
    		$('#winerImg').css('background-image','url("'+imgURL16+'")');
    		$('#winerImg').attr('type', 'hasimg');
    		file_array_list[16] = {};
    		file_array_list[16].finalName = getBeforeGameData.fileList[16];
    		file_array_list[16].imageUrl = imgURL16;
      }
    }
    //新增判斷
    if (getBeforeGameData.fileList[17]!=null) {
      if (getBeforeGameData.fileList[17].split('/').pop() != "undefined") {
        // if (getBeforeGameData.fileList[17]==undefined) {
    		var imgURL17 = "/iTS5/service/file/game/"+gameid+"/"+getBeforeGameData.fileList[17];
    		$('#loserImg').css('background-image','url("'+imgURL17+'")');
    		$('#loserImg').attr('type', 'hasimg');
    		file_array_list[17] = {};
    		file_array_list[17].finalName = getBeforeGameData.fileList[17];
    		file_array_list[17].imageUrl = imgURL17;
      }
    }
		$('.fullmain[stage="4"] #nextBtn').removeAttr('disabled');

		$($('#somedialog4 input')[0]).attr('value',decodeURI( getBeforeGameData.create) );
		$($('#somedialog4 input')[1]).attr('value',decodeURI( getBeforeGameData.gameName) );
		//最後
		$('#loadingWait').remove();
		$('#reEditCode>span').text(gameid);

		//debugger
	});
  // 資訊放入加註資料
  var domID = '<%=domID%>';
  var loadY = domID.substring(domID.indexOf('y'),domID.indexOf('g'));
  var loadG = domID.substring(domID.indexOf('g')+1,domID.indexOf('s'));
  var loadS = domID.substring(domID.indexOf('s')+1,domID.indexOf('t'));
  var loadT = domID.substring(domID.indexOf('t')+1,domID.indexOf('a'));
  var loadA = domID.substring(domID.indexOf('a')+1,domID.indexOf('c'));
  var loadC = domID.substring(domID.indexOf('c')+1,domID.indexOf('@'));

  if(loadY=='%') loadY='0';
  if(loadG=='%') loadG='0';
  if(loadS=='%') loadS='0';
  if(loadT=='%') loadT='0';
  if(loadA=='%') loadT='0';
  if(loadC=='%') loadT='0';
  loadT = loadT.replace(/_+/,'');

  $("#yy>option[value='"+loadY+"']").prop('selected', true);
  $("#gg>option[value='"+loadG+"']").prop('selected', true);
  $("#ss>option[value='"+loadS+"']").prop('selected', true);
   // 顯示某學段
  gradeSelectbindDomain();
  $("#dd option[value='"+loadT+"']").prop('selected', true);
  $("#aa>option[value='"+loadA+"']").prop('selected', true);
  // 顯示某地區
  citySelectbindArea();
  $("#cc option[value='"+loadC+"']").prop('selected', true);
  
  // $('#examtitle>input').val('<%=gameName%>');  
}

function myAlert(ss){
  $('#addmetadata').hide();
  $('#msg').show();
  $('#msg').attr('class', 'isAlert');
  $('#msgMain').text(ss);
  $('#studen_stat_table').show();
  $('#OKbtn2').bind('click', function(){
    $('#studen_stat_table').hide();
    $('#addmetadata').show();
    $('#msg').hide();
    $('#OKbtn2').unbind('click');
  });
}
// save Information
$('#OKbtn').bind('click', startSave);
$('#NObtn').bind('click', cancelSave);
function save(){
  if ($('#aboutGame>input').val().length != 0) {
    $('#examtitle>input').val($('#aboutGame>input').val());
  }
  if(file_array_list.length <= 0) {
    iTS5Dialog.myAlert('尚未製作遊戲');//尚未製作遊戲
    return
  }
  if ($('#levelBox').css('visibility') == 'hidden') {
    openMenu();
  };
  if($('#mydialog').length>0){
    return;
  }
  $('#addmetadata').show();
  $('#msg').hide();
  $('#studen_stat_table').show();

  // 針對FB、Google+做調整
  // if ( authUserRole == 'external') {
  //   var gameURL = createFinalData();
  //   var isDone = gameURL.split(',')[1];
  //   gameURL = gameURL.split(',')[0];

  //   $('#studen_stat_table').show();
  //   $('#qrcodeImg').remove();

  //   $('#selectYS').hide();
  //   $('#selectGD').hide();
  //   $('#selectAC').hide();
  //   if (isDone == "true") {
  //     $('#allmetadata').append('<img id="qrcodeImg" src='+gameURL+'/>');
  //   }else if (isDone == "false") {
  //     $('#allmetadata').append('<img id="qrcodeImg" src="img/no_qrcode.svg"/>');
  //   }
  // }
}
var xhr;
var title;
var savetype;
function startSave(){
  title = $('#examtitle>input').val();
  if(title.trim() == "") {
    iTS5Dialog.myAlert('尚未提供遊戲名稱');//尚未提供遊戲名稱
    return;
  }

  var dom = "";
    
  if($('#yy').val()==0) {
    var tempString = translate($.cookie('leng'), 'provided_year');//請提供年度
    iTS5Dialog.myAlert(tempString);
    return
  }else
    dom = $('#yy').val();

  if($('#gg').val()==0) {
    var tempString = translate($.cookie('leng'), 'provided_grade');//請提供年級
    iTS5Dialog.myAlert(tempString);
    return
  }else
    dom = dom+"g"+$('#gg').val();

  if($('#ss').val()==0) {
    var tempString = translate($.cookie('leng'), 'provided_order');//請提供學期
    iTS5Dialog.myAlert(tempString);
    return
  }else
    dom = dom+"s"+$('#ss').val();

  if($('#dd').val()==0) {
    var tempString = translate($.cookie('leng'), 'provided_domain');//請提供學期
    iTS5Dialog.myAlert(tempString);
    return
  }else{
    dom = dom+"t"+$('#dd').val();
  }

  if($('#aa').val()==0) {
    var tempString = translate($.cookie('leng'), 'provided_area');//請提供地區
    iTS5Dialog.myAlert(tempString);
    return
  }else{
    dom = dom+"a"+$('#aa').val();
  }

  if($('#cc').val()==0) {
    var tempString = translate($.cookie('leng'), 'provided_counties');//請提供縣市
    iTS5Dialog.myAlert(tempString);
    return
  }else{
    dom = dom+"c"+$('#cc').val();
  }
  dom = dom+"@%";

  console.log(gameid);
  //是否為new
  if ('<%=gameID%>' == 'new') {
    savetype = "createNewGame";
  }else{
    savetype = "editGame";
  }
  //判斷image type
  var imgPath;
  if (file_array_list[0].toString()=="[object Object]") {
    imgPath = file_array_list[0].finalName;
  }else if (file_array_list[0].toString()=="[object File]") {
    imgPath = "img0."+file_array_list[0].name.split('.')[1];
  }else{
    imgPath = null;
  }

  xhr = $.ajax({
            type:'POST',
            url:'action/savegame.jsp',
            data:{
                gameid:gameid,
                gameName:title,
                dom:dom,
                gtype:'easy',
                schoolYear:$('#yy>option')[$('#yy')[0].selectedIndex].text,
                semester:$('#ss>option')[$('#ss')[0].selectedIndex].text,
                subject:$('#dd option')[$('#dd')[0].selectedIndex].text,
                grade:$('#gg>option')[$('#gg')[0].selectedIndex].text,
                area:$('#aa>option')[$('#aa')[0].selectedIndex].text,
                counties:$('#cc option')[$('#cc')[0].selectedIndex].text,
                creator:"<%=userID%>",
                creatorName:"<%=userName%>",
                imgPath:imgPath,
                type:savetype,
               },
          }).done(function(evt){
              evt = evt.trim();
              console.log(evt);
              //相當於要進行存檔
              alertMsgSaveStart.toggle();
              //開始上傳檔案
              onSaveTime_uploadImg(0, $('body').attr('gameid'));  
          });

  iTS5Dialog.myWaitMsg(translate($.cookie('leng'), 'msg015'), function(){
       //教案儲存中請稍等
    xhr.abort();
    
  });
  
}
function cancelSave(){
  $('#studen_stat_table').hide();
}
// 平台不需要再儲存遊戲名稱&作者
// var alertMsgSave = new DialogFx( $('#somedialog4')[0] , {'onCloseDialog': function(){
// 	//相當於要進行存檔
// 	alertMsgSaveStart.toggle();
// 	//開始上傳檔案
// 	onSaveTime_uploadImg(0, $('body').attr('gameid'));
// 	console.log("Sava...");
// }});

//為了safari看不懂this.responseURL
var tempI;
function onSaveTime_uploadImg(i, id){
	tempI=i;
	if(i>=file_array_list.length){
		// $('progress').attr('value',90);
		onSaveManifest();
		$('#somedialog5 button').click();
		return;
	}


	var imgName = "img";
	// if(i<10){
	// 	imgName = "img0" +i ;
	// }
	// else {
		imgName = "img" +i ;
//	}
	var fileDir="/game/" + id;


	if(file_array_list[i] == undefined){
		// $('progress').attr('value',(parseInt($('progress').attr('value')) + 5));
		onSaveTime_uploadImg(i-0+1, id);
	}
	else {
		if(file_array_list[i].toString() == "[object Object]" && (file_array_list[i].imageUrl.substring((file_array_list[i].imageUrl).lastIndexOf('/') + 1, (file_array_list[i].imageUrl).length)) == getBeforeGameData.fileList[i]){
			file_array_list[i].finalName =getBeforeGameData.fileList[i];
			onSaveTime_uploadImg(i-0+1, id);
			return;
		}
		else if(file_array_list[i].toString() == "[object Object]" && (file_array_list[i].imageUrl.substring((file_array_list[i].imageUrl).lastIndexOf('/') + 1, (file_array_list[i].imageUrl).length)) != getBeforeGameData.fileList[i]){
				$.ajax({
					type: 'POST',
					url:location.origin+'/iTS5/service/games/switchImage?id='+ id +'&originFileName='+(file_array_list[i].imageUrl.substring((file_array_list[i].imageUrl).lastIndexOf('/') + 1, (file_array_list[i].imageUrl).length))+'&nowIndex='+i,
					/*url:location.origin+'/iTS5/service/games/switchImage',
					data:{
						'id' : id,
						'originIndex' : i,
						'nowIndex' : (file_array_list[i].imageUrl.substring((file_array_list[i].imageUrl).lastIndexOf('/') + 4, (file_array_list[i].imageUrl).length-4))
					},*/
					async:false
				});
			file_array_list[i].finalName = "img"+i+"."+file_array_list[i].imageUrl.split('.').pop();
			onSaveTime_uploadImg(i-0+1, id);
			return;
		}
		
		file_array_list[i].finalName = "img"+i+"."+file_array_list[i].name.split('.').pop();
		var oMyForm = new FormData();

		oMyForm.append('filepath', file_array_list[i]);
	
		var oReq = new XMLHttpRequest();
		oReq.open("POST", "/iTS5/service/file/UploadServlet/?upload_folder="+fileDir+"&filepath="+imgName, true);
		oReq.send(oMyForm);
		oReq.addEventListener("loadend", loadEnd, false);

		function loadEnd() {
			console.log("one file upload");
			//上傳第 fi 個檔案完畢
			if(this.responseURL!=undefined){
				//var upload_index = parseInt(this.responseURL.split('=').pop().replace('img',''))+1;
				//新版ios上的chrome看不懂this.responseURL,改用imgName取圖
				var upload_index = parseInt(imgName.replace('img',''))+1;
			}
			else if(this.responseURL==undefined){
				var upload_index = parseInt(tempI)+1;
			}

			// $('progress').attr('value',(parseInt($('progress').attr('value')) + 5));
			onSaveTime_uploadImg(upload_index, $('body').attr('gameid'));
		}
	}
}
var  manifestString="";
function onSaveManifest() {
	var getThisGameId= $('body').attr('gameid');
	manifestString= "CACHE MANIFEST\n"+
					"#version 0.0.2."+Math.random()+"\n"+
					"CACHE:\n"+
					"#---------------------\n"+
					"#image use\n"+
					"/game/game_platform/edit/images/bground_right.png\n"+
					"/game/game_platform/edit/images/bground_left.png\n"+
          "/game/game_platform/edit/images/_background.png\n"+
					"/game/game_platform/edit/images/pen.png\n"+
					"/game/game_platform/edit/images/cardadd2.svg\n"+
          "/game/game_platform/edit/img/basic.png\n"+
          "/game/game_platform/edit/img/advanced.png\n"+
          "/game/game_platform/images/logo/icon.png\n"+
					"/game/game_platform/edit/images/fullimg.png\n";

	for(var fi = 0;fi<file_array_list.length; fi++){
		if(file_array_list[fi] != undefined){

			manifestString = manifestString +
					"/iTS5/service/file/game/"+getThisGameId+"/"+file_array_list[fi].finalName+"\n";
		}
	}
	manifestString = manifestString +
					"\n"+
					"#---------------------\n"+
					"#javascript use\n"+
					"/game/game_platform/js/jquery.min.js\n"+
					"/game/game_platform/js/modernizr.custom.js\n"+
					"/game/game_platform/js/classie.js\n"+
					"/game/game_platform/js/dialogFx.js\n"+
          "/game/game_platform/js/md5.js\n"+
					"/game/game_platform/js/fastclick.js\n"+
					"\n"+
					"#---------------------\n"+
					"#css use\n"+
					"/game/game_platform/css/game/end.css\n"+
					"/game/game_platform/css/game/main.css\n"+
					"/game/game_platform/css/game/helper.css\n"+
					"/game/game_platform/css/game/intro.css\n"+
					"/game/game_platform/css/game/normalize.css\n"+
					"/game/game_platform/css/game/dialog.css\n"+
					"/game/game_platform/css/game/dialog-cathy.css\n"+
					"\n"+
					"NETWORK:\n"+
					"*";
	$.ajax({
		type: 'POST',
		url:"/iTS5/service/game/Post_StringSaveToTxt/",
		data:{
			"String": manifestString,
			"id":getThisGameId,
			"filename": "play.manifest"
		}
	}).done(function(result){
		createFinalData();
		onSaveQuizList();
		// $('progress').attr('value',90);
		$('#somedialog5 button').click();
	}).error(function(evt){
		//解決iPad使用ajax結束會進入error的問題
		if(navigator.userAgent.match(/iPhone|iPad|iPod/)){
			createFinalData();
			onSaveQuizList();
			// $('progress').attr('value',90);
		}
	});
}
function onSaveQuizList(){
	var sendString = JSON.stringify(finalSaveData);;
	var getThisGameId= $('body').attr('gameid');
	$.ajax({
		type: 'POST',
		url:"/iTS5/service/game/Post_StringSaveToTxt/",
		data:{
			"String": sendString,
			"id":getThisGameId,
			"filename": "data.txt"
		}
	}).done(function(result){
		// $('progress').attr('value',100);
		$('#somedialog5 button').click();
	}).error(function(evt){
		//解決iPad使用ajax結束會進入error的問題
		if(navigator.userAgent.match(/iPhone|iPad|iPod/)){
			// $('progress').attr('value',100);
			$('#somedialog5 button').click();
		}
	});
}
var feValue = "";
var finalSaveData = {};
var finalData = [];
var finalTitle ="&title=";
function createFinalData() {
  iTS5Dialog.myCloseMsg();
  $('#studen_stat_table').css('display','none');

	var getURL = location.protocol+"//"+location.host+"/game/game_platform/edit/play.jsp?id="+$('body').attr('gameid');
	var getData = "&data=";
	if($('.fullmain[stage="3"] #timetype > option')[0].selected) {
		getData = getData+"a";
		finalSaveData.timetype = "a";
	}
	else if($('.fullmain[stage="3"] #timetype > option')[1].selected) {
		getData = getData+"b";
		finalSaveData.timetype = "b";
	}

	var getThisClock = $('.fullmain[stage="3"] #timeClock').val().replace(':','');
	getData = getData + getThisClock;
	finalSaveData.clock = getThisClock;

	var getThisHint = $('.fullmain[stage="3"] #hintTime').val();
	getData = getData + getThisHint;
	finalSaveData.hintClock = getThisHint;

	var getThisSendLock = $('.fullmain[stage="3"] #sendTime').val();
	getData = getData + getThisSendLock;
	finalSaveData.sendLockClock = getThisSendLock;

	for(var k = 0; k < 6; k++) {
		if(file_array_list[k*2+4] == undefined){
			break;
		}
		else {
			var getAnsLength = file_array_list[k*2+4].quizAns.length;
			var getAnsMD5 = CryptoJS.MD5(file_array_list[k*2+4].quizAns).toString();
			getData =  getData  + "."+ getAnsLength + "-" +getAnsMD5;

			finalData[k] = {"leng":getAnsLength,"ans": encodeURI(file_array_list[k*2+4].quizAns) };
		}
	}
	finalSaveData.finalData = finalData;

	//var getTitle = $('#aboutGameText').text();
	var getTitle = $('#aboutGameText').val();
	if(getTitle == "") {
		getTitle = "新遊戲";
	}
	finalSaveData.title = encodeURI(getTitle);

//	getData = getData;
	getURL = getURL + getData;
//	finalData = JSON.stringify(finalData);

	var getFileExtension = "";
	var alphaBit =		['x'  ,'o'  ,'n'  ,'u'  ,'v'   ,'c'  ,'e'  ];
	var parallelArray = ["PNG","png","jpg","JPG","jpeg","gif","bmp"];
	finalSaveData.fileList = [];
	for(var u = 0; u<file_array_list.length; u++){
		if(file_array_list[u] == undefined){
			getFileExtension = getFileExtension + "-";
			continue;
		}

		var getFileExt= "";
		if(file_array_list[u].toString() == "[object Object]"){
			getFileExt = file_array_list[u].imageUrl.split('.').pop();

			for(var ex = 0; ex<parallelArray.length; ex++){
				if(parallelArray[ex] == getFileExt){
					getFileExtension = getFileExtension + alphaBit[ex];
					break;
				}
			}
			
			finalSaveData.fileList[u] = file_array_list[u].finalName;
		}
		else {
			getFileExt = file_array_list[u].name.split('.').pop();

			for(var ex = 0; ex<parallelArray.length; ex++){
				if(parallelArray[ex] == getFileExt){
					getFileExtension = getFileExtension + alphaBit[ex];
					break;
				}
			}
			finalSaveData.fileList[u] = file_array_list[u].finalName;
		}
	}
	console.log(getFileExtension);
  // 判斷qrcode是否產生
  feValue = getFileExtension;
	getURL = getURL+"&fe="+getFileExtension
	getURL = getURL + "&title="+encodeURI(getTitle);
	finalTitle = "&title="+encodeURI(getTitle);

	// finalSaveData.create = encodeURI ( $($('#somedialog4>.dialog__content input')[0]).val() );
	// finalSaveData.gameName = encodeURI ( $($('#somedialog4>.dialog__content input')[1]).val() );
  finalSaveData.create = encodeURI($('body').attr('gameid'));
  finalSaveData.gameName = encodeURI(title);

	//var tmp = "http://api.qrserver.com/v1/create-qr-code/?size=500x500&data=";
  var tmp = "http://www.qr-code-generator.com/phpqrcode/getCode.php?cht=qr&chl=";
	var tmp2 = encodeURIComponent(getURL);

	$('#qrcode>img').attr('src',tmp+tmp2);
	$('#qrcode>canvas').remove();
	$('#qrcode>img').css('display','');
	$('#qrcode>img').css('visibility','visible');
	$('#somedialog6 #startPlay>a').attr('href',getURL);

  // 存取遊戲URL
  $.ajax({
          type:'POST',
          url:'action/savegame.jsp',
          data:{
            type:'saveURL',
            gameid:$('body').attr('gameid'),
            playURL:getURL,
          },
  }).done(function(evt){
    evt = evt.trim();
    console.log(evt);
  })
  // 針對FB、Google+顯示Qrcode圖示
  // if (authUserRole == 'external') {
  //   var isDone = "false";
  //   if (feValue.length == 18) {
  //     isDone = "true";
  //   }
  //   return tmp+tmp2+","+isDone;
  // }
}








var alertMsgSaveStart = new DialogFx( $('#somedialog5')[0] , {'onCloseDialog': function(){
	//相當於要進行存檔
  //是否顯示QRcode
  // if(file_array_list[16] != undefined && file_array_list[17] != undefined){
  // if (feValue.length == 18){
	 // alertMsgShowQrcode.toggle();
  // }else{
    iTS5Dialog.myAlert('存檔完畢');
  // }
	/*
	var getURL = location.protocol+"//"+location.host+"/game/play.jsp?id="+$('body').attr('gameid');
	var getData = "&data=";
	if($('.fullmain[stage="3"] #timetype > option')[0].selected)
		getData = getData+"a";
	else if($('.fullmain[stage="3"] #timetype > option')[1].selected)
		getData = getData+"b";

	var getThisClock = $('.fullmain[stage="3"] #timeClock').attr('value').replace(':','');
	getData = getData + getThisClock;
	var getThisHint = $('.fullmain[stage="3"] #hintTime').attr('value');
	getData = getData + getThisHint;
	var getThisSendLock = $('.fullmain[stage="3"] #sendTime').attr('value');
	getData = getData + getThisSendLock;

	for(var k = 0; k < 6; k++) {
		if(file_array_list[k*2+4] == undefined){
			break;
		}
		else {
			var getAnsLength = file_array_list[k*2+4].quizAns.length;
			var getAnsMD5 = CryptoJS.MD5(file_array_list[k*2+4].quizAns).toString();
			getData =  getData  + "."+ getAnsLength + "-" +getAnsMD5;

			finalData[k] = {"leng":getAnsLength,"ans":file_array_list[k*2+4].quizAns};
		}
	}

	var getTitle = $('#aboutGameText').text();
	if(getTitle == "") {
		getTitle = "新遊戲";
	}
//	getData = getData;
	getURL = getURL + getData;
	finalData = JSON.stringify(finalData);


	var getFileExtension = "";
	var alphaBit =		['x'  ,'o'  ,'n'  ,'u'  ,'v'   ,'c'  ,'e'  ];
	var parallelArray = ["PNG","png","jpg","JPG","jpeg","gif","bmp"];
	for(var u = 0; u<file_array_list.length; u++){
		if(file_array_list[u] == undefined){
			getFileExtension = getFileExtension + "-";
			continue;
		}

		var getFileExt = file_array_list[u].name.split('.').pop();

		for(var ex = 0; ex<parallelArray.length; ex++){
			if(parallelArray[ex] == getFileExt){
				getFileExtension = getFileExtension + alphaBit[ex];
				break;
			}
		}
	}
	console.log(getFileExtension);
	getURL = getURL+"&fe="+getFileExtension
	getURL = getURL + "&title="+encodeURI(getTitle);
	finalTitle = "&title="+encodeURI(getTitle);





	thisQrcode.makeCode(getURL);
*/
	
//	setTimeout(function(){
//		$('#qrcode').css('background-image','url("'+$('#qrcode>img').attr('src')+'")');
//	},300);
	
	console.log("End Sava Dialog");
}});
var thisQrcode = new QRCode($('#qrcode')[0]);
var alertMsgShowQrcode = new DialogFx( $('#somedialog6')[0] , {'onCloseDialog': function(){
	//相當於要進行存檔
  // iTS5Dialog.myAlert('存檔完畢');
	console.log("start Sava Dialog");
}});
// function stage4_to_stage5() {
// 	console.log("edit OVER!");
// 	alertMsgSave.toggle();
// }
function stage4_to_stage3 (){
	$('link[rel="stylesheet"][href="../css/game/end.css"]').attr('href', '../css/game/main.css');
}



function reTextTitle(){
	var t = $('.fullmain[stage="2"] .single-line').text();
	$('.fullmain[stage="2"] .single-line').text(t);
}
function reTextTitle2(){
	var t = $('.fullmain[stage="3"] .single-line').text();
	$('.fullmain[stage="3"] .single-line').text(t);
}

function init_stage2(){
	$('.fullmain[stage="2"] .imgBox').attr('style', '').removeClass('nowPoint');

	$('.fullmain[stage="2"] .imgBox[no="1"]').addClass('nowPoint');
	$('.fullmain[stage="2"] .imgBox[no="2"]').css('display','none');
	$('.fullmain[stage="2"] .imgBox[no="3"]').css('display','none');
	nowNumber=$('.nowPoint').attr('no');
	$('.fullmain[stage="2"] #prevPage').css('display','none');
	$('.fullmain[stage="2"] #nextPage').css('display','none');
  var pheight = $(window).height()-40;
  $('#helper_NextBtn').css({'height':pheight+'px','top':'40px'});
  $('.fullmain[stage="2"] #nextBtn').css('margin-top','-100px');
}
function init_stage3() {

}

function upload_by_intro(evt){
	files = evt.target.files[0];//找到第一筆資料
	var eachfile = files;
	var fileExtension=$(files.name.split('.')).get(-1);//找檔案type;
	if(fileExtension =='PNG' || fileExtension =='JPG' || fileExtension =='jpeg'|| fileExtension =='BMP' ||
		fileExtension =='png' || fileExtension =='jpg' || fileExtension =='bmp' || fileExtension =='gif') {
		var reader = new FileReader();
		reader.onload=function(e) {
			//$('#cardimg').attr('src', e.target.result);
			$('.fullmain[stage="1"] #cardimg').css({'background-image':'url('+e.target.result+')','background-size':'contain','background-position':'50%','background-repeat':'no-repeat','height':'100%'});
			$('.fullmain[stage="1"] #typeDom').attr('type', 'hasimg');
			objectID = guid();
			//file_array_list.push(files);
			file_array_list[0]=files;

			$('.fullmain[stage="1"] #nextBtn').removeAttr('disabled');
		}
		reader.readAsDataURL(eachfile);
	}
}

function upload_by_helper(evt){
	files = evt.target.files[0];//找到第一筆資料
	var eachfile = files;
	var fileExtension=$(files.name.split('.')).get(-1);//找檔案type;
	if(fileExtension =='PNG' || fileExtension =='JPG' || fileExtension =='jpeg'|| fileExtension =='BMP' ||
		fileExtension =='png' || fileExtension =='jpg' || fileExtension =='bmp' || fileExtension =='gif') {
		//找現在是屬於第幾個框框
		a=$(event.target).closest('.imgBox').attr('no')
		var reader = new FileReader();
		reader.onload=function(e) {
			//$('#cardimg'+nowNumber).attr('src', e.target.result);
			$('#cardimg'+nowNumber).css({'background-image':'url('+e.target.result+')','background-size':'contain','background-position':'50%','background-repeat':'no-repeat','height':'100%'});
			$('.fullmain[stage="2"] #typeDom'+nowNumber).attr('type', 'hasimg');
			$('.fullmain[stage="2"] #imgArea').attr('p'+nowNumber,'true');
			objectID = guid();
			file_array_list[parseInt(nowNumber)]=files;
			
			controlArrow();
		}
		reader.readAsDataURL(eachfile);
	}
}

function removeImg_intro(evnet){
	// var fileclick = $('#myuploadimg');
	// fileclick.replaceWith(fileclick=fileclick.clone(true))
	// $('#imgbox>div').attr('type', 'noimg');
	// $('#cardimg').attr('style','');
	// file_array_list[0]=undefined;
	// $('.fullmain[stage="1"] #nextBtn').attr('disabled', 'disabled');

	var fileUploadBtn = $('#myuploadimg_intro');
	fileUploadBtn.replaceWith( fileUploadBtn = fileUploadBtn.clone( true ) );
	fileUploadBtn.trigger('click');
}
function removeImg_helper(evnet){
	/*
	var fileclick = $('.imgBox[no="'+parseInt(nowNumber)+'"]').find('.myuploadimg');
	
	fileclick.replaceWith(fileclick=fileclick.clone(true));
	$('#typeDom'+nowNumber).attr('type', 'noimg');
	$('#cardimg'+nowNumber).attr('style','');
	//$('#typeDom'+nowNumber).find('.cardimg').attr('src','');
	$('#imgArea').attr('p'+nowNumber,'false');
	*/
	var temp = $('.nowPoint input');
	temp.replaceWith(temp = temp.clone(true));
	temp.trigger('click');

//	file_array_list[parseInt(nowNumber)]=undefined;
	controlArrow();
}
function select_change(){
	if($(event.target).prop('value') == "剩餘時間") {
		$('#timeClock').prop('readonly', false);
		$('#timeClock').val("60:00");
	}
	else {
		$('#timeClock').prop('readonly', true).val("00:00");
	}
}
function checkTimeFormat(){
	var isValid = this.value.search(new RegExp($(this).attr('pattern')));
	if(isValid<0){
		$('#alertMsg').text('時間設定錯誤');
		alertMsg.toggle();
		this.focus();
	}
	else {

	}
}

function controlArrow(){
//控制箭號要不要顯示
	var typeFlag=$('#typeDom'+nowNumber).attr('type');
	p1Flag=$('.fullmain[stage="2"] #imgArea').attr('p1');
	p2Flag=$('.fullmain[stage="2"] #imgArea').attr('p2');
	p3Flag=$('.fullmain[stage="2"] #imgArea').attr('p3');
	if(nowNumber>3){
		console.log("It's no possible!");
		return
	}
	else if(nowNumber==1){
		$('.fullmain[stage="2"] #prevPage').css('display','none');
		if(p1Flag=='true' || p2Flag=='true' || p3Flag=='true'){
			$('.fullmain[stage="2"] #nextPage').css('display','');
		}
		else {
			$('.fullmain[stage="2"] #nextPage').css('display','none');
		}
	}
	else if(nowNumber==2){
		$('.fullmain[stage="2"] #prevPage').css('display','');
		if(p2Flag=='true' || p3Flag=='true'){
			$('.fullmain[stage="2"] #nextPage').css('display','');
		}
		else{
			$('.fullmain[stage="2"] #nextPage').css('display','none');
		}	
	}
	else if(nowNumber==3){
		$('.fullmain[stage="2"] #prevPage').css('display','');
		$('.fullmain[stage="2"] #nextPage').css('display','none');
	}

	if(p1Flag=='true' || p2Flag=='true' || p3Flag=='true'){
		$('.fullmain[stage="2"] #nextBtn').removeAttr('disabled');
	}
	else {
		$('.fullmain[stage="2"] #nextBtn').attr('disabled', 'disabled');
	}
}
function prevPage(){
	nowNumber=$('.fullmain[stage="2"] .nowPoint').attr('no');

	if(nowNumber<=3 && nowNumber>1){
		prevNumber=parseInt(nowNumber)-1;
		$('.fullmain[stage="2"] .imgBox[no="'+parseInt(nowNumber)+'"]').css('display','none');
		$('.fullmain[stage="2"] .imgBox[no="'+prevNumber+'"]').css({'display':'flex','display':'-moz-box', 'display':'-webkit-box','display':'-webkit-flex'});
		//$('.fullmain[stage="2"] .imgBox[no="'+prevNumber+'"]').css('display','-webkit-box');
		$('.fullmain[stage="2"] .imgBox[no="'+parseInt(nowNumber)+'"]').removeClass('nowPoint');
		$('.fullmain[stage="2"] .imgBox[no="'+prevNumber+'"]').addClass('nowPoint');
		//debugger
		nowNumber=$('.nowPoint').attr('no');
		controlArrow();
	}
}

function nextPage(){
	nowNumber=$('.fullmain[stage="2"] .nowPoint').attr('no');
	nextNumber=parseInt(nowNumber)+1;
	
	if(nowNumber<3){
		$('.fullmain[stage="2"] .imgBox[no="'+parseInt(nowNumber)+'"]').css('display','none');
		$('.fullmain[stage="2"] .imgBox[no="'+nextNumber+'"]').css({'display':'flex','display':'-moz-box', 'display':'-webkit-box','display':'-webkit-flex'});
		//$('.fullmain[stage="2"] .imgBox[no="'+nextNumber+'"]').css('display','-webkit-box');
		$('.fullmain[stage="2"] .imgBox[no="'+parseInt(nowNumber)+'"]').removeClass('nowPoint');
		$('.fullmain[stage="2"] .imgBox[no="'+nextNumber+'"]').addClass('nowPoint');

		nowNumber=$('.nowPoint').attr('no');
		controlArrow();
		//debugger
	}

}

function S4() {
	return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
}
function guid() {
	return (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4());
}
// 個位數時補0
function numChange(num){
	var number = num.value;
	var idType = num.id;
	if (number < 10 && number.length < 2) {
		number = 0+number;
		if (idType == "hintTime") {
			$('#hintTime').val(number);
		}else if (idType == "sendTime") {
			$('#sendTime').val(number);
		};
	};
	

}
function openMenu(){
	//儲存作答紀錄
	var quizIndex = ($('#quizImg').attr('itemno')- 0)*2 + 3 - 1;
	if(file_array_list[quizIndex] != undefined){
		// file_array_list[quizIndex].quizAns = $('#ansArea').attr('ansstring');
    var answerText = $('#ansArea').attr('ansstring');
    file_array_list[quizIndex].quizAns = answerText;
    if (answerText =="") {
      iTS5Dialog.myAlert("請輸入答案");
      return;
    }
	}
  $('#levelBox').css('visibility','visible');
  $('#quizImg').css('visibility', 'hidden');
  showGoStage();

  //修改底部按鈕狀態
  $('#bottomBar').attr('stage','stagelist');
  $('#sendBtn').attr('stage','stagelist');
	//是否顯示下一題
	checkCanGoNextStage();
}
function checkCanGoNextStage() {
	var a = $('.level:not(".none,.hide")').length;
	var b = file_array_list.slice().splice(4,12)
	//var b = file_array_list.length-4;
	var length_B = b.length;
	for(var i = 0; i<length_B; i++){
		var popElem = b.pop();
		if(popElem != undefined)
			b.push(popElem)
	}
	b = Math.round((b.length)/2);

	var allHasAns = true;
	for(var i = 0;i<a;i++){
		if(file_array_list[i*2+4] == undefined){
			allHasAns = false;
		}
		else {
			var tempAns = file_array_list[i*2+4].quizAns;
			if(tempAns == "" || tempAns == undefined){
				allHasAns = false;
			}	
		}
	}

	if(a == b && allHasAns){
		$('.fullmain[stage="3"] #nextBtn').removeAttr('disabled');
	}
	else {
		$('.fullmain[stage="3"] #nextBtn').attr('disabled', 'disabled');
	}
}

function whenClickLevel(){
	var clickObject = event.currentTarget;
	
	if(	$(clickObject).hasClass('none') ){
		$(event.target).removeClass('none');
		$('.level.hide').first().removeClass('hide').addClass('none');

		var itemno = $(event.target).attr('itemno');
		if(itemno == 1) {
			$($('.level')[0]).removeClass('lock').addClass('open');
		}
		var realFileIndex = (itemno - 0)*2 + 3 - 1;
		if(file_array_list[realFileIndex - 2] != undefined && $(clickObject).hasClass('lock')){
			$('.level.lock').first().removeClass('lock').addClass('open');
		}
	}
	else if( $(clickObject).hasClass('lock') ){

	}
	else if( $(clickObject).hasClass('open') ){
		$('#levelBox').css('visibility','hidden');
		$('#quizImg').css('visibility', 'visible');

		var itemno = $(event.target).attr('itemno');
		$('#quizImg').attr('itemno', itemno);
		var realFileIndex = (itemno - 0)*2 + 3 - 1;
		if(file_array_list[realFileIndex] != undefined) {
			//過去已經有上傳過圖片檔了
			$('#addImg').css('background-image', 'url('+file_array_list[realFileIndex].imageUrl+')');
			$('#addImg').attr('type','hasimg');

			if(file_array_list[realFileIndex].quizAns != undefined){
				$('#ansArea').attr('ansstring', file_array_list[realFileIndex].quizAns);
				setAns(file_array_list[realFileIndex].quizAns);
			}
			else {
				$('#ansArea').attr('ansstring', '');
				setAns('');
			}
			
		}
		else {
			$('#addImg').attr('style','').attr('type','noimg');
			$('#ansArea').attr('ansstring', '');
			setAns('');
		}

		hideGoStage();

    //css變更
    $('#quizList>#quizImg').css('height',$(window).height()-41+"px");
    $('#quizList>#quizImg').css('top','41px');
		//修改底部按鈕狀態
		$('#bottomBar').attr('stage','onequiz');
    $('#sendBtn').attr('stage','onequiz');
	}

	checkCanGoNextStage();
}
function hideGoStage() {
	$('#level_NextBtn').hide();
	$('#level_PrevBtn').hide();
}
function showGoStage() {
	$('#level_NextBtn').show();
	$('#level_PrevBtn').show();
}
function whenClickRemoveLevel() {
	$('.level.none').removeClass('none').addClass('hide');
	$('.level:not(".hide")').last().addClass('none');
	var itemIndex = $(event.currentTarget).parent().attr('itemno');
	var fileIndex = ( itemIndex - 0) *2 + 3 -1;
	if(file_array_list[fileIndex] != undefined) {
		file_array_list.splice(fileIndex, 2);
		file_array_list.splice(14, 0, undefined, undefined);
		$('.level.open').last().removeClass('open').addClass('lock');
	}
	else{
		if($('.level.open').last().attr('itemno') == itemIndex){
			$('.level.open').last().removeClass('open').addClass('lock');
			if($(event.currentTarget).parent().next().hasClass('lock') && !($(event.currentTarget).parent().hasClass('none'))){
				$('.level.lock').first().removeClass('lock').addClass('open');
			}
		}
	}
	checkCanGoNextStage();
	event.stopPropagation();
}
// 拖曳事件
// document.onselectstart=new Function("event.returnValue=false;");
//stage 3
$('#addImg[type="noimg"]').bind('dragover', draghendler);
$('#addImg[type="noimg"]').bind('dragenter', draghendler);
$('#addImg[type="noimg"]').bind('dragleave', leftdraghendler);
$('#addImg[type="noimg"]').bind('drop', selectNewfile);
//hint
$('#hintImgList').bind('dragover', draghendler);
$('#hintImgList').bind('dragenter', draghendler);
$('#hintImgList').bind('dragleave', leftdraghendler);
$('#hintImgList').bind('drop', selectNewHintfile);
//stage4
$('.fullmain[stage="4"] .imgBox').bind('dragover', draghendler);
$('.fullmain[stage="4"] .imgBox').bind('dragenter', draghendler);
$('.fullmain[stage="4"] .imgBox').bind('dragleave', leftdraghendler);
$('.fullmain[stage="4"] .imgBox').bind('drop', selectWinOrLoseFile);
function drophendler(evt) {
	evt.preventDefault();
	evt.stopPropagation();

}
function leftdraghendler(evt) {
	evt.preventDefault();
	evt.stopPropagation();

}
function draghendler(evt){
	evt.preventDefault();
	evt.stopPropagation();

}
function upload_by_eachQuiz() {
	if($('#forSelectFile').length==0)
		$('body').append("<input type='file' id='forSelectFile' onchange='selectNewfile()'>");
	$('#forSelectFile')[0].value=null;
	$('#forSelectFile').click();
}
function selectNewfile(evt){
	var  itemIndex = ( $('#quizImg').attr('itemno') - 0 )*2 + 3 - 1;
	var files ;
	// drop
	if(event.toString() == '[object DragEvent]'){
		evt.preventDefault();
		evt.stopPropagation();
		files = evt.originalEvent.dataTransfer.files[0];
		
	}else{
		files = event.target.files[0];//找到第一筆資料
	}
	if(files == undefined){
		return;
	}

	var eachfile = files;
	var fileExtension=$(files.name.split('.')).get(-1);//找檔案type;
	if(fileExtension =='PNG' || fileExtension =='JPG' || fileExtension =='jpeg'|| fileExtension =='BMP' ||
		fileExtension =='png' || fileExtension =='jpg' || fileExtension =='bmp' || fileExtension =='gif') {
		var reader = new FileReader();
		reader.onload=function(e) {
			//$('#cardimg').attr('src', e.target.result);
			//$('.fullmain[stage="3"] #quizImg>#addImg').css({'background-image':'url('+e.target.result+')','background-size':'contain','background-position':'50%','background-repeat':'no-repeat','height':'100%'});
			$('.fullmain[stage="3"] #quizImg>#addImg').css({'background-image':'url('+e.target.result+')'});
			$('.fullmain[stage="3"] #quizImg>#addImg').attr('type', 'hasimg');
			objectID = guid();
			//file_array_list.push(files);
			file_array_list[itemIndex] = files;
			file_array_list[itemIndex].imageUrl = e.target.result;

			if($('.level.open').last().attr('itemno') == $('#quizImg').attr('itemno'))
				$('.lock').first().removeClass('lock').addClass('open');
		}
		reader.readAsDataURL(eachfile);
	}
}
function rotateBall() {
	for(i = 0; i<$('#m2>.ball_outside').length; i++){
		var tempDeg = $($('#m2>.ball_outside')[i]).attr('deg');

		//tempDeg = parseInt(tempDeg)+ballAddSpeedArray[i];
		tempDeg = parseInt(tempDeg)+parseInt(Math.random()*360);

		$($('#m2>.ball_outside')[i]).attr('deg', tempDeg);
		$($('#m2>.ball_outside')[i]).css('transform','rotate('+tempDeg+'deg)');

		$('#m2>.ball_outside>.ball').css('transform','translate('+s1+'px, -20px) scale('+s2+')');
	}
	setTimeout('rotateBall()', 1000);
}
var s1 = -18;
var s2 = 2.8;

function showHintBox(){
	var  itemIndex = ( $('#quizImg').attr('itemno') - 0 )*2 + 3 ;
	if($('#forSelectHintFile').length==0)
		$('body').append("<input type='file' id='forSelectHintFile' onchange='selectNewHintfile()'>");
	$('#forSelectHintFile')[0].value=null;
	$('#forSelectHintFile').click();
	// close事件
	$('.dialog.dialog--open button').bind('click',function(){
		$('.dialog.dialog--open button').unbind('click');
		//關閉更換圖示按鈕
		$('#changeHintImg').css('display','none');
	});

	if( file_array_list[itemIndex] == undefined){
		$('#hintImgList').attr('style', '');
		// if($('#forSelectHintFile').length==0)
		// 	$('body').append("<input type='file' id='forSelectHintFile' onchange='selectNewHintfile()'>");
		// $('#forSelectHintFile').click();
	}
	else {
		$('#hintImgList').css('background-image', file_array_list[itemIndex].imageUrl );
	}
}
function selectNewHintfile(evt){
	var  itemIndex =  ( $('#quizImg').attr('itemno') - 0 )*2  + 3 ;
	var files ;
	// drop
	if(event.toString() == '[object DragEvent]'){
		evt.preventDefault();
		evt.stopPropagation();
		files = evt.originalEvent.dataTransfer.files[0];
		
	}else{
		files = event.target.files[0];//找到第一筆資料
	}
	if(files == undefined){
		return;
	}
	var eachfile = files;
	var fileExtension=$(files.name.split('.')).get(-1);//找檔案type;
	if(fileExtension =='PNG' || fileExtension =='JPG' || fileExtension =='jpeg'|| fileExtension =='BMP' ||
		fileExtension =='png' || fileExtension =='jpg' || fileExtension =='bmp' || fileExtension =='gif') {
		var reader2 = new FileReader();
		reader2.onload=function(e) {
			//$('#cardimg').attr('src', e.target.result);
			$('.fullmain[stage="3"] #hintImgList').css({'background-image':'url('+e.target.result+')'});
			file_array_list[itemIndex] = files;
			file_array_list[itemIndex].imageUrl = e.target.result;
			$('.fullmain[stage="3"] #hintImgList').attr('type', 'hasimg');
			$('div#hintImgList[type="hasimg"] #changeHintImg').css('display','');
		}
		reader2.readAsDataURL(eachfile);
	}
	
}





/***/
	$('#ansFill').bind('focus',function(){
		var quizIndex = ( $('#quizImg').attr('itemno') - 0 )*2 + 3 -1;
		if(file_array_list[quizIndex] == undefined){
			$('#alertMsg').text('請先建立題目');
			alertMsg.toggle();
			//alert("請先建立題目再建立答案");
			$('#ansFill').blur();
		}
		else {
			for(var i= 0; i<$('.oneWord').length; i++){
				$($('.oneWord')[i]).addClass('ishide');
			}
		}
	})
	$('#ansFill').bind('blur', function(){
		var temp = $('#ansFill').val().trim();
		setAns(temp);
	})

function setAns(answer){
	$('#ansArea').attr('ansstring', answer);
	$('#ansArea').attr('length', answer.length);
	$('#ansArea>input').val(answer);

	$('.oneWord').addClass('ishide');
	$('.oneWord').text('');
	for(var i= 0; i<answer.length; i++){
		$($('.oneWord')[i]).removeClass('ishide');
		$($('.oneWord')[i]).text(answer[i]);
	}
}

	//設定dialog可跳出
	var dlg = new DialogFx( $('#somedialog')[0] )
	$('#isHintBtn').bind( 'click', function () {
		var quizIndex = ($('#quizImg').attr('itemno') - 0)*2 + 3 - 1;
		if(file_array_list[quizIndex] == undefined){
			$('#alertMsg').text('請先建立題目');
			alertMsg.toggle();
			//alert("請先建立題目再建立提示");
		}
		else {
			var hintIndex = ($('#quizImg').attr('itemno') - 0)*2 + 3;
			if(file_array_list[hintIndex] == undefined){
				$('#hintImgList').attr('style','');
				$('#hintImgList').attr('type', 'noimg');
				dlg.toggle();
			}
			else {
				$('#hintImgList').css('background-image',"url('"+file_array_list[hintIndex].imageUrl+"')");
				$('#hintImgList').attr('type', 'hasimg');
				$('div#hintImgList[type="hasimg"] #changeHintImg').css('display','');
				dlg.toggle();	
			}
		}
	});

	var alertMsg = new DialogFx( $('#somedialog2')[0] )


//開始轉盤
rotateBall();


function change2LoserPage(){
	$('.fullmain[stage="4"]>#imgArea').attr('type','showLoser');
}
function change2WinerPage(){
	$('.fullmain[stage="4"]>#imgArea').attr('type','showWiner');
}
function upload_WinorLose_Img(){
	var switchID = $(event.currentTarget).parent().attr('no');
	if($('input[type="file"]#forSelectWinOrLoseFile').length>1) {
		$('input[type="file"]#forSelectWinOrLoseFile').remove();
	}
	if($('input[type="file"]#forSelectWinOrLoseFile').length>1) {
		$('input[type="file"]#forSelectWinOrLoseFile').remove();
	}

	if(switchID == "1") {
		$('body').append("<input type='file' id='forSelectWinOrLoseFile' onchange='selectWinOrLoseFile()'>");
		$('#forSelectWinOrLoseFile')[0].value=null;
		$('#forSelectWinOrLoseFile').click();
	}
	else if(switchID == "2"){
		$('body').append("<input type='file' id='forSelectWinOrLoseFile' onchange='selectWinOrLoseFile()'>");
		$('#forSelectWinOrLoseFile')[0].value=null;
		$('#forSelectWinOrLoseFile').click();
	}
}
function selectWinOrLoseFile(evt){
	// files = event.target.files[0];//找到第一筆資料
	var files ;
	// drop
	if(event.toString() == '[object DragEvent]'){
		evt.preventDefault();
		evt.stopPropagation();
		files = evt.originalEvent.dataTransfer.files[0];
		
	}else{
		files = event.target.files[0];//找到第一筆資料
	}
	if(files == undefined){
		return;
	}
	var eachfile = files;
	var fileExtension=$(files.name.split('.')).get(-1);//找檔案type;
	if(fileExtension =='PNG' || fileExtension =='JPG' || fileExtension =='jpeg'|| fileExtension =='BMP' ||
		fileExtension =='png' || fileExtension =='jpg' || fileExtension =='bmp' || fileExtension =='gif') {
		var reader3 = new FileReader();
		reader3.onload=function(e) {

			if($('.fullmain[stage="4"] #imgArea').attr('type') == "showWiner") {
				$('.fullmain[stage="4"] #winerImg').css('background-image', 'url('+e.target.result+')');
				$('.fullmain[stage="4"] #winerImg').attr('type', 'hasimg');

				file_array_list[16] = files;
				file_array_list[16].imageUrl = e.target.result;
			}
			else if($('.fullmain[stage="4"] #imgArea').attr('type') == "showLoser") {
				$('.fullmain[stage="4"] #loserImg').css('background-image', 'url('+e.target.result+')');
				$('.fullmain[stage="4"] #loserImg').attr('type', 'hasimg');

				file_array_list[17] = files;
				file_array_list[17].imageUrl = e.target.result;
			}


			if(file_array_list[16] != undefined && file_array_list[17] != undefined){
				$('#end_NextBtn>#nextBtn').attr('disabled', false);
			}
			//$('#cardimg').attr('src', e.target.result);
			/*$('.fullmain[stage="4"] #hintImgList').css({'background-image':'url('+e.target.result+')'});
			file_array_list[itemIndex] = files;
			file_array_list[itemIndex].imageUrl = e.target.result;
			$('.fullmain[stage="3"] #hintImgList').attr('type', 'hasimg')
			*/
		}
		reader3.readAsDataURL(eachfile);
	}
}
function selectloserFile(){
	
}

function reloadEditCode(){
	var this_InputText=prompt("請輸入遊戲ID", "");
	if(this_InputText != "") {
		location.replace(location.protocol+"//"+location.host+location.pathname+"?edit="+this_InputText);
	}
}

function back(){
  iTS5Dialog.myConfirm("確定要離開嗎?",function(){
      location.replace('firstEdit.jsp');
  })
}
</script>
</html>