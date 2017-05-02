<%@ include file = "../tin.jsp" %>
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
  int totalNum = 0;
  int easyNum = 0;
  String type = "";
  String SQL_basicinfo =
         " SELECT * FROM game_basicinfo WHERE gameID = ?";
  String SQL_user_totalNum =
         " SELECT * FROM user WHERE userID = ? ";
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
    pStatement = conn.prepareStatement(SQL_user_totalNum);
    pStatement.setString(1, userID);
    rs = pStatement.executeQuery();
    while(rs.next()) {
      /*totalNum = rs.getInt("totalNum");
      easyNum = rs.getInt("easyNum");*/
      type = rs.getString("type");
    }
    pStatement.close();
  } catch (SQLException e) {
    e.printStackTrace();
  }
%>
<html>
<head>
<link rel="icon" href="/game/game_platform/images/logo/icon.png" type="image/png"/>
<meta name="viewport" content="width=device-width,maximum-scale=1.0, minimum-scale=1.0 , user-scalable=no" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Holiyo</title>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<link rel="stylesheet" href="../css/game/intro2.css" ></link>
<link rel="stylesheet" href="../css/game/helper2.css"></link>
<link rel="stylesheet" href="../css/game/main2.css"></link>
<link rel="stylesheet" href="../css/game/end2.css"></link>
<link rel="stylesheet" href="../css/game/common.css"></link>
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

</head>
<body onSelectStart="event.returnValue=false" fastid='random'>
<!-- navbar -->
<header class="navbar">
	<div class="itstopbar">
		<span id="back" onclick='back()'>
			<img class="naviBtn" src="../images/naviBar/back.svg"/>
		</span>
		<span id="planTitle"></span>
    <span class="pull-right">
      <span id="searchTrigger" onClick="save()" class="search-trigger naviSearch">
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
  <nav id='menubar'>
    <!-- <div id="line"></div> -->
    <div id="step1" class="step stepOpen stepUse"></div>
    <div id="step2" class="step stepOpen stepClose" disabled="disabled"></div>
    <div id="step3" class="step stepOpen stepClose" disabled="disabled"></div>
    <div id="step4" class="step stepOpen stepClose" disabled="disabled"></div>
  </nav>
	<div class='fullmain' stage="1">		
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
			<div id='imgbox'>
        <div id="bgUp"></div>
        <div id="bgDown"></div>
				<div id="typeDom" type='noimg'>
					<div id='uploadbtn'>
						<div id='imgActive'></div>
						<input type='file' id='myuploadimg_intro'></input>
					</div>
					<sdiv id='cardimg'></sdiv>
				</div>
			</div>
			<div id='intro_NextBtn' style="display:none">
				<div id='nextBtn' disabled="disabled"></div>
			</div>
		</div>
	</div>
	<div class="fullmain" stage="2">
    <div id="bottombar">
      <span class="titleT">說明頁</span>
      <div id="explain">
        <div id="p1" class="page show use"></div>
        <div id="p2" class="page show close" disabled="disabled"></div>
        <div id="p3" class="page show close" disabled="disabled"></div>
      </div>
    </div>
		<div id='imgArea' p1='false' p2='false' p3='false'>
			<!-- <div id="nextPage" class="pagebtn">下一頁說明頁</div>
			<div id="prevPage" class="pagebtn">上一頁說明頁</div> -->
      <div id="bg2Up"></div>
      <div id="bg2Down"></div>
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
            <div class='imgDel'></div>
					</div>
					<sdiv class='cardimg' id='cardimg2'></sdiv>
				</div>
			</div>
			<div class='imgBox' no="3" style="display: none;">
				<div id="typeDom3" type='noimg'>
					<div class="uploadbtn">
						<div class='imgActive'></div>
						<input type='file' class='myuploadimg_helper'></input>
            <div class='imgDel'></div>
					</div>
					<sdiv class='cardimg' id='cardimg3'></sdiv>
				</div>
			</div>
			<!-- <div id='helper_NextBtn'>
				<div id='nextBtn'  disabled="disabled"></div>
			</div>
			<div id='helper_PrevBtn'>
				<div id='prevBtn'></div>
			</div> -->
		</div>
	</div>
	<div class="fullmain" stage="3">
    <div id="bg3Up"></div>
    <div id="bg3Down"></div>
		<div id="somedialog" class="dialog">
			<div class="dialog__overlay"></div>
			<div class="dialog__content">
				<h2>
					<div class='hintImgList' type='noImg' hint='1'>
            <div class="hintIcon"></div>
						<div id='changeHintImg'></div>
					</div>
          <div class='hintImgList' type='noImg' hint='2'>
            <div class="hintIcon"></div>
            <div id='changeHintImg'></div>
          </div>
				</h2>
				<div><button class="action" data-dialog-close>關閉</button></div>
			</div>
		</div>
		<div id="somedialog2" class="dialog">
			<div class="dialog__overlay"></div>
			<div class="dialog__content">
				<h2>
					<div id='alertMsg'>請先建立題目</div>
				</h2>
				<div><button class="action" data-dialog-close>關閉</button></div>
			</div>
		</div>
    <div id="somedialog3" class="dialog">
      <div class="dialog__overlay"></div>
      <div class="dialog__content">
        <h2>
          <div id="eContent">本平台感謝臺南市資訊教育輔導團楊易霖、陳秀梅老師協助製作
            <br>本平台相關智慧財產權為宏鼎資訊股份有限公司所有
          </div>
        </h2>
        <div><button class="action" data-dialog-close>關閉</button></div>
      </div>
    </div>
		<div id='imgArea'>
			<div id='topBar'>
				<div id='aboutTime'>
					<select id='timetype'>
						<option val='grow'>進行時間</option>
						<option val='down'>剩餘時間</option>
					</select>
					<input id='timeClock' type='text' value="00:00" readonly pattern="[0-9]{2}:[0-9]{2}" maxlength="5" placeholder="mm:ss"/><span style="color:red;font-size:13px">請確認計時方式</span>
				</div>

				<!-- <div id="aboutGame">
					<input type='text' id="aboutGameText" class='single-line' placeholder="請輸入遊戲名稱"></input>
				</div>-->

				<div id='aboutSetting'>
					<div id='menuBtn'></div>
          <div class="hideBar">
            <div id="menu1" class="hideBtn"></div>
            <div id="menu2" class="hideBtn"></div>
          </div>
				</div> 
			</div>
			<div id='quizList'>
				<div id='quizImg'>
					<div id='addImg' type='noimg'>
						<div id='imageChange'></div>
					</div>
				</div>
				<div id='levelBox'>
					<div style="-webkit-box-align: end;-ms-flex-align: end;-ms-grid-row-align: flex-end;align-items: flex-end;">
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
          <div class="light">
            <div id="1">
              <!-- <div class="square"></div> -->
              <span class="common"></span>
              <span class="common"></span>
              <span class="common"></span>
              <span class="common"></span>
            </div>
            <div id="2" class="noShow">
              <!-- <div class="square"></div> -->
              <span class="common"></span>
              <span class="common"></span>
              <span class="common"></span>
              <span class="common"></span>
            </div>
            <div id="3" class="noShow">
              <!-- <div class="square"></div> -->
              <span class="common"></span>
              <span class="common"></span>
              <span class="common"></span>
              <span class="common"></span>
            </div>
          </div>
					<div style="-webkit-box-align: start;-ms-flex-align: start;align-items: flex-start">
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
          <div class="light" style="position: relative;bottom: calc(50% - 150px);">
            <div id="4" class="noShow">
              <!-- <div class="square"></div> -->
              <span class="common"></span>
              <span class="common"></span>
              <span class="common"></span>
              <span class="common"></span>
            </div>
            <div id="5" class="noShow">
              <!-- <div class="square"></div> -->
              <span class="common"></span>
              <span class="common"></span>
              <span class="common"></span>
              <span class="common"></span>
            </div>
            <div id="6" class="noShow">
              <!-- <div class="square"></div> -->
              <span class="common"></span>
              <span class="common"></span>
              <span class="common"></span>
              <span class="common"></span>
            </div>
					</div>
				</div>
			</div>
			<div id='bottomBar' stage='stagelist'>
				<div id='hint' cd='cding'>
					<!-- <div id="m2" style="-webkit-filter:url(#goo);filter:url(#goo);">
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
					</div> -->
					<div id='hintTimeBox' leaftime='0' getTime='120'>
						<span id='isHintBtn' data-dialog="somedialog" class="trigger"></span>
						<div id='setting'>
							<div id='hintLabel'>設定提示倒數</div>
							<!-- <input id="hintTime" type='text' value='20' maxlength=2  pattern="^[0-9]{1,2}$" placeholder="ss" onblur="numChange(this)"/>秒 -->
              <select id="hintTimeSelect" name="hintTimeSelect">
                <option value="05" class="selectOpt">05秒</option>
                <option value="10" class="selectOpt">10秒</option>
                <option value="15" class="selectOpt">15秒</option>
                <option value="20" class="selectOpt">20秒</option>
                <option value="25" class="selectOpt">25秒</option>
                <option value="30" class="selectOpt">30秒</option>
              </select>
						</div>
					</div>
				</div>
				<div id='ansArea'>
					<input id='ansFill' placeholder="請輸入答案(限10字)" maxlength="10"></input>
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
				<div id='sendBtn' stage='stagelist'>
					<div id='isSendBtn' onclick="openMenu()"></div>
					<div id='setting_send'>
						<span id='sendLebel'>設定答題倒數</span>
						<!-- <input id="sendTime" type='text' value='15' maxlength=2  pattern="^[0-9]{1,2}$" placeholder="ss" onblur="numChange(this)"/> -->
            <select id="sendTimeSelect" name="sendTimeSelect">
                <option value="05" class="selectOpt">05秒</option>
                <option value="10" class="selectOpt">10秒</option>
                <option value="15" class="selectOpt">15秒</option>
                <option value="20" class="selectOpt">20秒</option>
                <option value="25" class="selectOpt">25秒</option>
                <option value="30" class="selectOpt">30秒</option>
            </select>
					</div>
				</div>
			</div>

			<!-- <div id='level_NextBtn'>
				<div id='nextBtn'  disabled="disabled"></div>
			</div>
			<div id='level_PrevBtn'>
				<div id='prevBtn'></div>
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
		<div id='imgArea' type='showWiner'>
      <div id="bg4Up"></div>
      <div id="bg4Down"></div>
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
      <div class="bottomBar">
        <div id="winerPage" class="pagebtn pagebtnOpen pagebtnUse">闖關成功</div>
        <div id="loserPage" class="pagebtn pagebtnOpen pagebtnClose" disabled="disabled">闖關失敗</div>
        <div class="timebar">
          <timeicon></timeicon>
          <span class="timeText">00:00</span>
          <restart></restart>
        </div>
      </div>			
<!-- 			<div id='end_PrevBtn'>
				<div id='prevBtn'></div>
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
$('link[rel="stylesheet"][href="../css/game/helper2.css"]').remove();
$('link[rel="stylesheet"][href="../css/game/main2.css"]').remove();
$('link[rel="stylesheet"][href="../css/game/end2.css"]').remove();
var authUserRole = "<%=userRole%>";
var nowNumber;
var file_array_list = new Array();
var editMode = false;
var gameid = "";
var fixImg = new Image();
var startTime = new Date().getTime();
var modeType = "";
// alert("domID "+'<%=domID%>'+" gameName "+'<%=gameName%>');
$(function() {
  // for(var i = 0; i<$('*').length; i++){ $($('*')[i]).css('box-shadow', 'inset 0px 0px 0px 4px #'+Math.floor(Math.random()*16777215).toString(16)) };
	gameid = S4()+S4();
	$('body').attr('gameid',gameid);
	$('#reEditCode>span').text(gameid);
	
	$('#bottomOfText').hide();
  // if(parseInt('<%=easyNum%>')>=parseInt('<%=totalNum%>') && '<%=type%>'!='money' && location.search.match('new')!= null){
  //   iTS5Dialog.myOnlyMsg2('您的遊戲數已達上限!!',function(){
  //     location.replace('firstEdit.jsp');
  //   });
  // }

	//解決ipad 螢幕底部多20px 問題
	if(navigator.userAgent.match(/iPhone|iPad|iPod/) && !window.navigator.standalone) {

		$('html').addClass('ipad ios7');
    
    var mainHeight = window.innerHeight ? window.innerHeight:$(window).height();
    mainHeight = mainHeight-41;
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
			// stage1_to_stage2();
      stage2();
		}
		if(location.hash == '#3'){
			//$('link[rel="stylesheet"][href="css/intro.css"]').remove();
			// stage1_to_stage2();
			// stage2_to_stage3();
      stage3();
		}
		if(location.hash == '#4'){
			//$('link[rel="stylesheet"][href="css/intro.css"]').remove();
			// stage1_to_stage2();
			// stage2_to_stage3();
			// stage3_to_stage4();
      stage4();
		}
	}
  // menu bar
  $('#step1').bind('click',stage1);
  $('#step2').bind('click',stage2);
  $('#step3').bind('click',stage3);
  $('#step4').bind('click',stage4);
	//stage1 :
	$('#importEditCode').bind('click', reloadEditCode);
	$('#myuploadimg_intro').bind('change',upload_by_intro);
	$('#imgActive').bind('click', removeImg_intro);
  // $('#step2').bind('click', stage1_to_stage2);

	//stage2 :
	$('.myuploadimg_helper').bind('change',upload_by_helper);
	$('.imgActive').bind('click', removeImg_helper);
  $('.imgDel').bind('click', deleteImg_helper);
	// $('.fullmain[stage="2"] #prevPage').bind('click', prevPage);
	$('.fullmain[stage="2"] .page').bind('click', decidePage);
	// $('.fullmain[stage="2"] #nextBtn').bind('click', stage2_to_stage3);
	//$('.fullmain[stage="2"] #prevBtn').bind('click', stage2_to_stage1);
  // $('.fullmain[stage="2"] #step1').bind('click', stage2_to_stage1);

	//stage3 :
  $('.fullmain[stage="3"] #menuBtn').bind('click', showHideBar);
  $('.fullmain[stage="3"] #menu1').bind('click', openMenu);
	$('.fullmain[stage="3"] #menu2').bind('click', openExplain);
	$('.fullmain[stage="3"] .level').bind('click', whenClickLevel);
	$('.fullmain[stage="3"] .deleteBtn').bind('click', whenClickRemoveLevel);
	$('.fullmain[stage="3"] #addImg').bind('click', upload_by_eachQuiz);
	$('.fullmain[stage="3"] .hintImgList').bind('click', showHintBox);
	// $('.fullmain[stage="3"] #nextBtn').bind('click', stage3_to_stage4);
	// $('.fullmain[stage="3"] #prevBtn').bind('click', stage3_to_stage2);
	$('.fullmain[stage="3"] #timetype').on('change', select_change );
	$('.fullmain[stage="3"] #timeClock').on('blur', checkTimeFormat );
	$('.fullmain[stage="3"] #hintTime').on('blur', checkTimeFormat );
	$('.fullmain[stage="3"] #sendTime').on('blur', checkTimeFormat );

	//stage4 :
	$('.fullmain[stage="4"] #loserPage').bind('click', change2LoserPage);
	$('.fullmain[stage="4"] #WinerPage').bind('click', change2WinerPage);
	$('.fullmain[stage="4"] .imgBox>div').bind('click', upload_WinorLose_Img);
	// $('.fullmain[stage="4"] #nextBtn').bind('click', stage4_to_stage5);
  // $('.fullmain[stage="4"] #prevBtn').bind('click', stage4_to_stage3);
});
// 封面頁
if ( $("#typeDom").attr("type") != "hasimg" ) {
  $('#bgUp,#bgDown').show();
}
function stage1(){
  var nowLink = $('link[rel="stylesheet"]').attr('href');
  $('link[rel="stylesheet"][href="'+nowLink+'"]').attr('href', '../css/game/intro2.css');  
  init_stage2();
  controlArrow();
  // change menu color
  $(".step").removeClass("stepUse");
  $("#step1").addClass("stepUse");
  $(".imgbox").removeClass("click");
  $(".fullmain[stage='1'] #imgbox").addClass("click");
}
function stage2(){
  var nowLink = $('link[rel="stylesheet"]').attr('href');
  $('link[rel="stylesheet"][href="'+nowLink+'"]').attr('href', '../css/game/helper2.css'); 
  init_stage2();
  controlArrow();
  // change menu color
  $(".step").removeClass("stepUse");
  $("#step2").addClass("stepUse");
  $(".imgbox").removeClass("click");
  $(".fullmain[stage='2'] .imgbox").addClass("click");
  // 說明頁
  setTimeout(function(){
    if ( $("#typeDom1").attr("type") != "hasimg" ) {
      $('#bg2Up,#bg2Down').show();
    }
  },100);
  

}
function stage3(){
  var nowLink = $('link[rel="stylesheet"]').attr('href');
  $('link[rel="stylesheet"][href="'+nowLink+'"]').attr('href', '../css/game/main2.css');
  init_stage3();
  checkCanGoNextStage();
  // change menu color
  $(".step").removeClass("stepUse");
  $("#step3").addClass("stepUse");
  $("#quizList").removeClass("click");
  $(".fullmain[stage='3'] #quizList").addClass("click");
}
function stage4(){
  var nowLink = $('link[rel="stylesheet"]').attr('href');
  $('link[rel="stylesheet"][href="'+nowLink+'"]').attr('href', '../css/game/end2.css');
  $('#winerPage').click();
  // change menu color
  $(".step").removeClass("stepUse");
  $("#step4").addClass("stepUse");
  $(".imgbox").removeClass("click");
  $(".fullmain[stage='4'] .imgbox").addClass("click");
  // 說明頁
  setTimeout(function(){
    if ( $("#winerImg").attr("type") != "hasimg" ) {
      $('#bg4Up,#bg4Down').show();
    }
  },100);
}

var getBeforeGameData;
function loadGameData(){
	$.get( "/iTS5/service/file/game/"+gameid+"/data.txt" ,function(result){
		getBeforeGameData = $.parseJSON(result);
    // 遊戲名稱
    $('#examtitle>input').val(decodeURIComponent(getBeforeGameData.gameName));
		//置換圖片
		//封面頁
		var imgURL01 = "/iTS5/service/file/game/"+gameid+"/"+getBeforeGameData.fileList[0];
		$('.fullmain[stage="1"] #cardimg').css('background-image','url("'+imgURL01+'")');
		$('.fullmain[stage="1"] #typeDom').attr('type','hasimg');
		// $('.fullmain[stage="1"] #nextBtn').removeAttr('disabled');
    $('#step2').removeAttr('disabled');
    $('#step2').removeClass("stepClose");
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
        $('.fullmain[stage="2"] #cardimg1').css({'background-image':'url("'+imgURL02+'")','height':'calc(100% - 41px - 70px)'});
        $('.fullmain[stage="2"] #typeDom1').attr('type','hasimg');
        $('.fullmain[stage="2"] #imgArea').attr('p1','true');
        file_array_list[1] = {};
        file_array_list[1].finalName = getBeforeGameData.fileList[1];
        file_array_list[1].imageUrl = imgURL02;
        $('#bgUp,#bgDown').hide();
      }
      // 調整menu bar 顯示
      $('#step3').removeClass("stepClose");
      $('#step3').removeAttr("disabled");
    }
		
		if(getBeforeGameData.fileList[2] != null) {
			var imgURL03 = "/iTS5/service/file/game/"+gameid+"/"+getBeforeGameData.fileList[2];
			$('.fullmain[stage="2"] #cardimg2').css({'background-image':'url("'+imgURL03+'")','height':'calc(100% - 41px - 70px)'});
			$('.fullmain[stage="2"] #typeDom2').attr('type','hasimg');
			$('.fullmain[stage="2"] #imgArea').attr('p2','true');
			file_array_list[2] = {};
			file_array_list[2].finalName = getBeforeGameData.fileList[2];
			file_array_list[2].imageUrl = imgURL03;
      $('#bg2Up,#bg2Down').hide();
		}
		if(getBeforeGameData.fileList[3] != null) {
			var imgURL04 = "/iTS5/service/file/game/"+gameid+"/"+getBeforeGameData.fileList[3];
			$('.fullmain[stage="2"] #cardimg3').css({'background-image':'url("'+imgURL04+'")','height':'calc(100% - 41px - 70px)'});
			$('.fullmain[stage="2"] #typeDom3').attr('type','hasimg');
			$('.fullmain[stage="2"] #imgArea').attr('p3','true');
			file_array_list[3] = {};
			file_array_list[3].finalName = getBeforeGameData.fileList[3];
			file_array_list[3].imageUrl = imgURL04;
		}
		//遊戲頁
		//getBeforeGameData.finalData = $.parseJSON(getBeforeGameData.finalData);
		//getBeforeGameData.finalData = getBeforeGameData.finalData;
    
    // 判斷關卡是否完成
    var doneFlag;
		for(var gg = 0; gg<getBeforeGameData.finalData.length; gg++){

			var tempimg = "/iTS5/service/file/game/"+gameid+"/"+getBeforeGameData.fileList[4-0+gg*3];

			file_array_list[4-0+gg*3] = {};
			file_array_list[4-0+gg*3].imageUrl = tempimg;
			file_array_list[4-0+gg*3].quizAns = decodeURI( getBeforeGameData.finalData[gg].ans );
			$($('.level')[gg]).removeClass('hide').removeClass('lock').removeClass('none').addClass('open');
       // 題目顯示綠燈
      $($('.light>#'+(gg+1)+'>.common')[0]).addClass('hasData');
      // 答案顯示綠燈
      if (getBeforeGameData.finalData[gg].ans != "" ) {

        $($('.light>#'+(gg+1)+'>.common')[1]).addClass('hasData');
        if (doneFlag != false && (getBeforeGameData.fileList[4-0+gg*3+1] != null || getBeforeGameData.fileList[4-0+gg*3+2] != null)) {
          doneFlag = true;
        }else{
          doneFlag = false;
        }
      }else{
        doneFlag = false;
      }

			//檢查提示1(之後上下合併)
			if(getBeforeGameData.fileList[4-0+gg*3+1] != null) {
				var tempimg2 = "/iTS5/service/file/game/"+gameid+"/"+getBeforeGameData.fileList[4-0+gg*3+1];

				file_array_list[4-0+gg*3+1] = {};
				file_array_list[4-0+gg*3+1].imageUrl = tempimg2;
        // 題目提示綠燈
        $($('.light>#'+(gg+1)+'>.common')[2]).addClass('hasData');
			}
      //檢查提示2
      if(getBeforeGameData.fileList[4-0+gg*3+2] != null) {
        var tempimg2 = "/iTS5/service/file/game/"+gameid+"/"+getBeforeGameData.fileList[4-0+gg*3+2];

        file_array_list[4-0+gg*3+2] = {};
        file_array_list[4-0+gg*3+2].imageUrl = tempimg2;
        // 題目提示綠燈
        $($('.light>#'+(gg+1)+'>.common')[3]).addClass('hasData');
      }
		}
		if($('.level.none').length<1)
			$($('.level.hide')[0]).removeClass('hide').addClass('none');
		// $('.fullmain[stage="3"] #nextBtn').removeAttr('disabled');
    if (doneFlag == true) {
      $('#step4').removeAttr('disabled').removeClass("stepClose");
    }
		//遊戲參數
//debugger
		var mm = getBeforeGameData.clock.substr(0,2);
		var ss = getBeforeGameData.clock.substr(2);
		var timetype = getBeforeGameData.timetype;
		$('#timeClock').attr('value',mm+':'+ss);
		$('#hintTime').attr('value', getBeforeGameData.hintClock)
		$('#sendTime').attr('value',getBeforeGameData.sendLockClock);
		// $('#aboutGameText').val(decodeURI(getBeforeGameData.gameName));
		//determine timetype 
		if (timetype == 'b' || $('#timeClock').val() != '00:00') {
			$($('#timetype option')[1]).attr('selected', true);
			$('#timeClock').prop('readonly', false);
		}
		//設定過關或失敗圖片
    //新增判斷(修正讀取時無法新增圖片)
    if (getBeforeGameData.fileList[22]!=null) {
      if (getBeforeGameData.fileList[22].split('/').pop() != "undefined") {
        // if (getBeforeGameData.fileList[16]==undefined) {
    		var imgURL16 = "/iTS5/service/file/game/"+gameid+"/"+getBeforeGameData.fileList[22];
    		$('#winerImg').css('background-image','url("'+imgURL16+'")');
    		$('#winerImg').attr('type', 'hasimg');
    		file_array_list[22] = {};
    		file_array_list[22].finalName = getBeforeGameData.fileList[22];
    		file_array_list[22].imageUrl = imgURL16;
        $('#loserPage').removeAttr('disabled').removeClass('pagebtnClose');
        $('#bg4Up,#bg4Down').hide();
        // 判斷關卡是否完成
        var gameLength = getBeforeGameData.finalData.length;
        if (getBeforeGameData.finalData[gameLength-1].ans != "") {
          $('#step4').removeClass("stepClose");
          $('#step4').removeAttr("disabled");
        }        
      }
    }
    if (getBeforeGameData.fileList[23]!=null) {
      if (getBeforeGameData.fileList[23].split('/').pop() != "undefined") {
        // if (getBeforeGameData.fileList[17]==undefined) {
    		var imgURL17 = "/iTS5/service/file/game/"+gameid+"/"+getBeforeGameData.fileList[23];
    		$('#loserImg').css('background-image','url("'+imgURL17+'")');
    		$('#loserImg').attr('type', 'hasimg');
    		file_array_list[23] = {};
    		file_array_list[23].finalName = getBeforeGameData.fileList[23];
    		file_array_list[23].imageUrl = imgURL17;
      }
    }
		// $('.fullmain[stage="4"] #nextBtn').removeAttr('disabled');
    // $('#step4').removeAttr('disabled');

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
  // gradeSelectbindDomain();
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
 
  if(file_array_list.length <= 0) {
    iTS5Dialog.myAlert('尚未製作遊戲');//尚未製作遊戲
    return
  }
  if ($('#levelBox').css('visibility') == 'hidden') {
    openMenu();
  };
  $('#addmetadata').show();
  $('#msg').hide();
  $('#studen_stat_table').show();

}
// 傳送xapi
var xapiData = {};
var objectSource, objectName, objType, verb, description;
var xhr,title, savetype;
//是否為new
if ('<%=gameID%>' == 'new') {
  savetype = "createNewGame";
  modeType = "new";
}else{
  savetype = "editGame";
  modeType = "edit";
}
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
  //判斷image type
  var imgPath;
  if (file_array_list[0].toString()=="[object Object]") {
    imgPath = file_array_list[0].finalName;
  }else if (file_array_list[0].toString()=="[object File]") {
    imgPath = "img0."+file_array_list[0].name.split('.').pop();
  }else{
    imgPath = null;
  }

  var year = $('#yy>option')[$('#yy')[0].selectedIndex].text;
  var semester = $('#ss>option')[$('#ss')[0].selectedIndex].text;
  var subject = $('#dd option')[$('#dd')[0].selectedIndex].text;
  var grade = $('#gg>option')[$('#gg')[0].selectedIndex].text;
  var area = $('#aa>option')[$('#aa')[0].selectedIndex].text;
  var counties = $('#cc option')[$('#cc')[0].selectedIndex].text;

  xhr = $.ajax({
            type:'POST',
            url:'action/savegame.jsp',
            data:{
                gameid:gameid,
                gameName:title,
                dom:dom,
                gtype:'chance',
                schoolYear:year,
                semester:semester,
                subject:subject,
                grade:grade,
                area:area,
                counties:counties,
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
               var levelCount = 0;
              var hintCount = 0;
              var second = 0;
              var minute = 0;
               xapiData.extensions = [];

              for (var i = 4; i <=21; i++) {
                // 關卡數
                if (i%3 == 1 && file_array_list[i] != undefined) {
                  levelCount++;
                }else if(i%3 != 1 && file_array_list[i] != undefined){
                  hintCount++;
                }
              }
               // 新增時間差距
              var gapTime = new Date().getTime()-startTime;
              second = Math.floor(gapTime/1000); // 秒
              if (second >= 60) {
                minute =  Math.floor(second/60);
                second = second%60;
              }
              console.log("level number "+levelCount+" hint "+hintCount);
              xapiData.objectSource = gameid;
              xapiData.objectName = title;
              xapiData.roleType = "<%=type%>";
              xapiData.objType = "chanceHoliyo";
              xapiData.verb = "saved";
              xapiData.description = modeType+"-"+year+"-"+semester+"-"+subject+"-"+grade+"-"+area+"-"+counties;
              xapiData.description2 = modeType+"-"+dom;

              xapiData.extensions = [levelCount,hintCount,minute+":"+second];
              xAPIinit(xapiData);
          });

  iTS5Dialog.myWaitMsg("請稍後", function(){
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

    // if(i==0){
    //   var oMyForm2 = new FormData();
    //   file_array_list[i].imgurl = fixImg.src;
    //   oMyForm2.append('filepath', file_array_list[i]);
    //   fileDir = "/game/tn/" + id;
    //   oReq.open("POST", "/iTS5/service/file/UploadServlet/?upload_folder="+fileDir+"&filepath="+imgName, true);
    //   oReq.send(oMyForm2);
    // }
    if(i==24 && file_array_list[i] != undefined){
      $.ajax({
        type:'post',
        url:'action/savegame.jsp',
        data:{
          creator:'<%=userID%>',
          gameid:id,
          type:'createPoint'
        }
      }).done(function(evt){
        console.log(evt);
      })
    }

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
      /*if(i==0 && file_array_list[i] != undefined){
        $.ajax({
          url: "http://holiyo.tn.edu.tw/game/service/game/FileManager/createGameImageWithWidth",
          type: "POST",
          headers: {
            "content-type": "application/x-www-form-urlencoded"
          },
          data: {
            "gameid": id,
            "width": 300,
            "height": 272,
            finalName:file_array_list[i].finalName
          }
        }).done(function(evt){
          console.log(evt);
        })
      }*/
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
					"/game/game_platform/edit/images/newImg/ansbtn.png\n"+
          "/game/game_platform/edit/images/newImg/background.png\n"+
          "/game/game_platform/edit/images/newImg/bgcenter.png\n"+
          "/game/game_platform/edit/images/newImg/button.png\n"+
          "/game/game_platform/edit/images/newImg/endIcon.png\n"+
          "/game/game_platform/edit/images/newImg/hintans.png\n"+
          "/game/game_platform/edit/images/newImg/levelbtn.png\n"+
          "/game/game_platform/edit/images/newImg/nextbtn.png\n"+
          "/game/game_platform/edit/images/newImg/playBtn.png\n"+
          "/game/game_platform/edit/images/newImg/playhint.png\n"+
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
          "/game/js/jquery.cookie.js\n"+
					"\n"+
					"#---------------------\n"+
					"#css use\n"+
					"/game/game_platform/css/game/end2.css\n"+
					"/game/game_platform/css/game/main2.css\n"+
					"/game/game_platform/css/game/helper2.css\n"+
          "/game/game_platform/css/game/intro2.css\n"+
					"/game/game_platform/css/game/common.css\n"+
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

	var getURL = "/game/game_platform/edit/cplay.jsp?id="+$('body').attr('gameid');
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

	var getThisHint = $('.fullmain[stage="3"] #hintTimeSelect>option:selected').val();
	getData = getData + getThisHint;
	finalSaveData.hintClock = getThisHint;

	var getThisSendLock = $('.fullmain[stage="3"] #sendTimeSelect>option:selected').val();
	getData = getData + getThisSendLock;
	finalSaveData.sendLockClock = getThisSendLock;

	for(var k = 0; k < 6; k++) {
		if(file_array_list[k*3+4] == undefined){
			break;
		}
		else {
			var getAnsLength = file_array_list[k*3+4].quizAns.length;
      var getAnsHerfStr = fullToHalf(file_array_list[k*2+4].quizAns.toLowerCase());
			var getAnsMD5 = CryptoJS.MD5(getAnsHerfStr).toString();
			getData =  getData  + "."+ getAnsLength + "-" +getAnsMD5;

			finalData[k] = {"leng":getAnsLength,"ans": encodeURI(file_array_list[k*3+4].quizAns) };
		}
	}
	finalSaveData.finalData = finalData;

	//var getTitle = $('#aboutGameText').text();
	var getTitle = $('#examtitle>input').val();
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
  getURL = getURL +"&time="+new Date().getTime();

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

}
var alertMsgSaveStart = new DialogFx( $('#somedialog5')[0] , {'onCloseDialog': function(){
	
  iTS5Dialog.myAlert('存檔完畢');
	
	console.log("End Sava Dialog");
}});
var thisQrcode = new QRCode($('#qrcode')[0]);
var alertMsgShowQrcode = new DialogFx( $('#somedialog6')[0] , {'onCloseDialog': function(){
	
	console.log("start Sava Dialog");
}});

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
	// $('.fullmain[stage="2"] #prevPage').css('display','none');
	// $('.fullmain[stage="2"] #nextPage').css('display','none');
  // 說明頁顯示
  $('.fullmain[stage="2"]').css('display','');
}
function init_stage3() {
  // 說明頁顯示
  $('.fullmain[stage="3"]').css('display','');
  openMenu();
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
      fixImg.src=e.target.result;
      ImgAuto(fixImg);
			// $('.fullmain[stage="1"] #nextBtn').removeAttr('disabled');
      // change menu color
      $('#step2').removeAttr("disabled");
      $('#step2').removeClass('stepClose');
      $('#bgUp,#bgDown').hide();
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
			$('#cardimg'+nowNumber).css({'background-image':'url('+e.target.result+')','background-size':'contain','background-position':'50%','background-repeat':'no-repeat','height':'calc(100% - 41px - 70px)'});
			$('.fullmain[stage="2"] #typeDom'+nowNumber).attr('type', 'hasimg');
			$('.fullmain[stage="2"] #imgArea').attr('p'+nowNumber,'true');
			objectID = guid();
			file_array_list[parseInt(nowNumber)]=files;
			
			controlArrow();
      $('#step3').removeAttr("disabled");
      $('#step3').removeClass('stepClose');
      $('#bg2Up,#bg2Down').hide();
		}
		reader.readAsDataURL(eachfile);
	}
}

function removeImg_intro(evnet){

	var fileUploadBtn = $('#myuploadimg_intro');
	fileUploadBtn.replaceWith( fileUploadBtn = fileUploadBtn.clone( true ) );
	fileUploadBtn.trigger('click');
}
function removeImg_helper(evnet){
	var temp = $('.nowPoint input');
	temp.replaceWith(temp = temp.clone(true));
	temp.trigger('click');

	controlArrow();
}
function deleteImg_helper(){
  iTS5Dialog.myConfirm("確定刪除?",function(){
    $('.fullmain[stage="2"] #typeDom'+nowNumber).attr('type', 'noimg');
    if(nowNumber==2 && file_array_list[3]!=null){
      var imgurl = $('#cardimg3').css('background-image');
      file_array_list[2] = file_array_list[3];
      file_array_list[3] = null;
      if (file_array_list[2].toString()=="[object Object]"){//存檔圖片格式
        $('#cardimg2').css('background-image','url('+file_array_list[2].imageUrl+')');
      }else{//上傳圖片格式
        $('#cardimg2').css('background-image',imgurl);
      }
      $('.fullmain[stage="2"] #typeDom2').attr('type', 'hasimg');
      $('.fullmain[stage="2"] #typeDom3').attr('type', 'noimg');
      $('.fullmain[stage="2"] #imgArea').attr('p'+(nowNumber-0+1),false);
    }else{
      file_array_list[parseInt(nowNumber)] = null;
      $('.fullmain[stage="2"] #imgArea').attr('p'+nowNumber,false);
    }
    controlArrow();
  })
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
	}else{ 
    if (p1Flag == "true") {
      $('#p2').removeClass('close').removeAttr("disabled");
      $('#bg2Up,#bg2Down').hide();
    }
    if (p2Flag == "true") {
      $('#p3').removeClass('close').removeAttr("disabled");
      $('#bg2Up,#bg2Down').hide();
    }else{
      if (p3Flag == "true") {
        $('#p3').removeClass('close').removeAttr("disabled");
        $('#bg2Up,#bg2Down').hide();
      }else{
        $('#p3').addClass('close').attr("disabled","disabled");
      }

    }
    // $('#p2').removeClass('close').removeAttr("disabled");
  }
  // bg2顯示
  if (typeFlag == "noimg") {
    $('#bg2Up,#bg2Down').show();
  }
	/*else if(nowNumber==1){
		// $('.fullmain[stage="2"] #prevPage').css('display','none');
		if(p1Flag=='true' || p2Flag=='true' || p3Flag=='true'){
			// $('.fullmain[stage="2"] #nextPage').css('display','');
      $('#p2').removeClass('close').removeAttr("disabled");
		}
		else {
			// $('.fullmain[stage="2"] #nextPage').css('display','none');
		}
	}
	else if(nowNumber==2){
		// $('.fullmain[stage="2"] #prevPage').css('display','');
		if(p2Flag=='true' || p3Flag=='true'){
			// $('.fullmain[stage="2"] #nextPage').css('display','');
      $('#p3').removeClass('close').removeAttr("disabled");
		}
		else{
			// $('.fullmain[stage="2"] #nextPage').css('display','none');
		}	
	}
	else if(nowNumber==3){
		// $('.fullmain[stage="2"] #prevPage').css('display','');
		// $('.fullmain[stage="2"] #nextPage').css('display','none');
	}*/

	if(p1Flag=='true' || p2Flag=='true' || p3Flag=='true'){
		// $('.fullmain[stage="2"] #nextBtn').removeAttr('disabled');
    $('#step3').removeAttr("disabled");
	}
	else {
		// $('.fullmain[stage="2"] #nextBtn').attr('disabled', 'disabled');
    $('step3').attr('disabled','disabled');
	}
}
// function prevPage(){
// 	nowNumber=$('.fullmain[stage="2"] .nowPoint').attr('no');

// 	if(nowNumber<=3 && nowNumber>1){
// 		prevNumber=parseInt(nowNumber)-1;
// 		$('.fullmain[stage="2"] .imgBox[no="'+parseInt(nowNumber)+'"]').css('display','none');
// 		$('.fullmain[stage="2"] .imgBox[no="'+prevNumber+'"]').css({'display':'flex','display':'-moz-box', 'display':'-webkit-box','display':'-webkit-flex'});
// 		//$('.fullmain[stage="2"] .imgBox[no="'+prevNumber+'"]').css('display','-webkit-box');
// 		$('.fullmain[stage="2"] .imgBox[no="'+parseInt(nowNumber)+'"]').removeClass('nowPoint');
// 		$('.fullmain[stage="2"] .imgBox[no="'+prevNumber+'"]').addClass('nowPoint');
// 		//debugger
// 		nowNumber=$('.nowPoint').attr('no');
// 		controlArrow();
// 	}
// }

function decidePage(evt){
  $('.page').removeClass('use');
	nowNumber = $('.fullmain[stage="2"] .nowPoint').attr('no');
	nextNumber = evt.target.id.substr(-1);
  $('#p'+nextNumber).addClass('use');
	
	if(nowNumber <= 3){
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
// function numChange(num){
// 	var number = num.value;
// 	var idType = num.id;
// 	if (number < 10 && number.length < 2) {
// 		number = 0+number;
// 		if (idType == "hintTime") {
// 			$('#hintTime').val(number);
// 		}else if (idType == "sendTime") {
// 			$('#sendTime').val(number);
// 		}
// 	}
// }
function showHideBar(){
  $('.fullmain[stage="3"] #menuBtn').unbind();
  $('.hideBar').css({"-webkit-animation-name":"barAnimation","height":"120px","padding-top": "20px"}).fadeIn();
  setTimeout(function(){
    $('.hideBtn').fadeIn();
    $('body').bind('click', concealBar);
  },200);
}
function concealBar(){
  $('body').unbind();
  $('.hideBar').css({"-webkit-animation-name":null,"animation-name":null}).fadeOut();
  $('.hideBtn').fadeOut();
  $('.fullmain[stage="3"] #menuBtn').bind('click',showHideBar);
}
var alertExplain = new DialogFx( $('#somedialog3')[0] )
function openExplain(){
  alertExplain.toggle();
}
function openMenu(){
	$('#levelBox').css('visibility','visible');
	$('#quizImg').css('visibility', 'hidden');
  $('#bg3Up').hide();
  $('#bg3Down').show();
	// showGoStage();

	//修改底部按鈕狀態
	$('#bottomBar').attr('stage','stagelist');
  $('#sendBtn').attr('stage','stagelist');

  // 顯示light
  for (var i =0; i < $('.level.open').length; i++) {
    var itemno = $($('.level.open')[i]).attr('itemno');
    if (!$($('.level.open')[i]).hasClass('none')) {
      $('.light>#'+itemno).removeClass('noShow');
    }
  }

	//儲存作答紀錄
	var quizIndex = ($('#quizImg').attr('itemno')- 0)*3 + 3 - 2;
	if(file_array_list[quizIndex] != undefined){
		file_array_list[quizIndex].quizAns = $('#ansArea').attr('ansstring');
    if ($('#ansArea').attr('ansstring') != "") {
      $($('.light>#'+$('#quizImg').attr('itemno')+'>.common')[1]).addClass('hasData');
    }
	}

	//是否顯示下一題
	checkCanGoNextStage();
}
function checkCanGoNextStage() {
	var a = $('.level:not(".none,.hide")').length;
	var b = file_array_list.slice().splice(4,18);
	//var b = file_array_list.length-4;
	var length_B = b.length;
	for(var i = 0; i<length_B; i++){
		var popElem = b.pop();
		if(popElem != undefined)
			b.push(popElem)
	}
	b = Math.ceil((b.length)/3);

  var hasHint = true;
	var allHasAns = true;
	for(var i = 0;i<a;i++){
    // 檢查答案
		if(file_array_list[i*3+4] == undefined){
			allHasAns = false;
		}else {
			var tempAns = file_array_list[i*3+4].quizAns;
			if(tempAns == "" || tempAns == undefined){
				allHasAns = false;
			}	
		}
    // 檢查提示
    if (file_array_list[i*3+4+1] == undefined && file_array_list[i*3+4+2] == undefined) {
      hasHint = false;
    }
	}

	if(a == b && allHasAns && hasHint){
		// $('.fullmain[stage="3"] #nextBtn').removeAttr('disabled');
    $('#step4').removeAttr("disabled");
    $('#step4').removeClass("stepClose");
	}
	else {
		// $('.fullmain[stage="3"] #nextBtn').attr('disabled', 'disabled');
    $('#step4').attr('disabled','disabled');
    $('#step4').addClass("stepClose");
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
		var realFileIndex = (itemno - 0)*3 + 3 - 2;
		if(file_array_list[realFileIndex - 3] != undefined && $(clickObject).hasClass('lock')){
			$('.level.lock').first().removeClass('lock').addClass('open');
      $('.light>#'+itemno).removeClass('noShow');
		}else {
      // 顯示light
      for (var i =0; i < $('.level.open').length; i++) {
        var itemno = $($('.level.open')[i]).attr('itemno');
        if (!$($('.level.open')[i]).hasClass('none')) {
          $('.light>#'+itemno).removeClass('noShow');
        }
      }
    }
	}
	else if( $(clickObject).hasClass('lock') ){

	}
	else if( $(clickObject).hasClass('open') ){
		$('#levelBox').css('visibility','hidden');
		$('#quizImg').css('visibility', 'visible');

		var itemno = $(event.target).attr('itemno');
		$('#quizImg').attr('itemno', itemno);
		var realFileIndex = (itemno - 0)*3 + 3 - 2;
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
      $('#ansArea').css('background','transparent');
		}
		else {
			$('#addImg').attr('style','').attr('type','noimg');
			$('#ansArea').attr('ansstring', '');
      $('.light>#'+itemno).removeClass('noShow');
      $('#bg3Up').show();
      $('#ansArea').css('background','#cccccc');
			setAns('');
		}

		hideGoStage();

    //css變更
    $('#quizList>#quizImg').css('height',$(window).height()-41+"px");
    $('#quizList>#quizImg').css('top','-65px');
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
	var fileIndex = ( itemIndex - 0) *3 + 3 -2;
	if(file_array_list[fileIndex] != undefined) {
    // 移除?題題目X1提示X2
		file_array_list.splice(fileIndex, 3);
		file_array_list.splice(19, 0, undefined, undefined, undefined);
		$('.level.open').last().removeClass('open').addClass('lock');
    // 燈號顯示
    $($('.light>div')[itemIndex-1]).addClass('noShow');
    $($('.light>div')[itemIndex-1]).children().removeClass('hasData');
    var lightArray = $('.light>div');
    var deleteLight = lightArray[itemIndex-1];
    lightArray.splice(itemIndex-1,1);
    lightArray.push(deleteLight);
    $('.light>div').remove();
    for (var i = 0; i < lightArray.length; i++) {
      lightArray[i].id = i+1;
      if (i<3) {
        $($('.light')[0]).append(lightArray[i]);
      }else{
        $($('.light')[1]).append(lightArray[i]);
      }
    }
    // $($('.light>div')[itemIndex]).children().removeClass('hasData');
    // var nextLightShow = $($('.light>div')[itemIndex-0+1]).children();
    // for (var i = 0; i < nextLightShow.length-1; i++) {
    //   $($('.light>#'+(itemIndex-0+1)+'>.common')[i]).hasClass('hasData')?$($('.light>#'+itemIndex+'>.common')[i]).addClass('hasData'):$($('.light>#'+itemIndex+'>.common')[i]).removeClass('hasData');
    // }
    // $('.light>#'+$('.level.open').last().attr('itemno')).addClass('noShow');
      
	}
	else{debugger
		if($('.level.open').last().attr('itemno') == itemIndex){
			$('.level.open').last().removeClass('open').addClass('lock');
      $('.light>#'+itemIndex).addClass('noShow');
			if($(event.currentTarget).parent().next().hasClass('lock') && !($(event.currentTarget).parent().hasClass('none'))){
				$('.level.lock').first().removeClass('lock').addClass('open');
        $('.light>#'+itemIndex).removeClass('noShow');
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
$('.hintImgList').bind('dragover', draghendler);
$('.hintImgList').bind('dragenter', draghendler);
$('.hintImgList').bind('dragleave', leftdraghendler);
$('.hintImgList').bind('drop', selectNewHintfile);
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
	var  itemIndex = ( $('#quizImg').attr('itemno') - 0 )*3 + 3 - 2;
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
      $($('.light>#'+$('#quizImg').attr('itemno')+'>.common')[0]).addClass('hasData');
      $('#bg3Up,#bg3Down').hide();

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

function showHintBox(evt){
  var hintNum = $(evt.target).attr('hint');
  if (hintNum == undefined) {
    hintNum = $(evt.target).parent().attr('hint');
  }
	var itemIndex = ( $('#quizImg').attr('itemno') - 0 )*3 + 3 -2 +(hintNum-0);
  $('.dialog.dialog--open .dialog__content').css('width','75%');
	if($('#forSelectHintFile').length==0)
    $('body').append("<input type='file' id='forSelectHintFile' hint="+hintNum+" onchange='selectNewHintfile(this)'>");
	$('#forSelectHintFile')[0].value=null;
	$('#forSelectHintFile').click();
	// close事件
	$('.dialog.dialog--open button').bind('click',function(){
		$('.dialog.dialog--open button').unbind('click');
		//關閉更換圖示按鈕
    $('#changeHintImg').css('display','none');
		$('.hintIcon').css('display','none');
    $('.dialog.dialog--open .dialog__content').css('width','80%');

	});

	if( file_array_list[itemIndex] == undefined){
    var num = Math.abs((itemIndex -1)% 3);

		$($('.hintImgList')[num-1]).attr('style', '');
		// if($('#forSelectHintFile').length==0)
		// 	$('body').append("<input type='file' id='forSelectHintFile' onchange='selectNewHintfile()'>");
		// $('#forSelectHintFile').click();
	}
	else {
		$($('.hintImgList')[num-1]).css('background-image', file_array_list[itemIndex].imageUrl );
	}
}
function selectNewHintfile(evt){
  var  num = $(evt).attr('hint') -0;
  var  itemIndex =  ( $('#quizImg').attr('itemno') - 0 )*3  + 3 -2 +num;
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
      // 提示位置
      // var num = Math.abs((itemIndex -1)% 3);debugger
			$($('.fullmain[stage="3"] .hintImgList')[num-1]).css({'background-image':'url('+e.target.result+')'});
      $('#forSelectHintFile').unbind('onchange');
			file_array_list[itemIndex] = files;
			file_array_list[itemIndex].imageUrl = e.target.result;

			$($('.fullmain[stage="3"] .hintImgList')[num-1]).attr('type', 'hasimg');
			$('div.hintImgList[type="hasimg"] #changeHintImg').css('display','');
      $('.hintImgList[hint='+num+']>.hintIcon').css('display','none');
      $($('.light>#'+$('#quizImg').attr('itemno')+'>.common')[num+1]).addClass('hasData');
      $('#forSelectHintFile').remove();
		}
		reader2.readAsDataURL(eachfile);
	}
	
}





/***/
	$('#ansFill').bind('focus',function(){
		var quizIndex = ( $('#quizImg').attr('itemno') - 0 )*3 + 3 -2;
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
    if (temp != "") {
      $('#ansArea').css('background','transparent');
    }
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
	var quizIndex = ($('#quizImg').attr('itemno') - 0)*3 + 3 - 2;
	if(file_array_list[quizIndex] == undefined){
		$('#alertMsg').text('請先建立題目');
		alertMsg.toggle();
		//alert("請先建立題目再建立提示");
	}else {
		var hintIndex = ($('#quizImg').attr('itemno') - 0)*3 + 3 - 1;
    for (var i = hintIndex; i <= hintIndex+1; i++) {
      var num = Math.abs((i -1)% 3);
      if(file_array_list[i] == undefined){
        $($('.hintImgList')[num-1]).attr('style','');
        $($('.hintImgList')[num-1]).attr('type', 'noimg');
        $('.hintImgList[hint='+num+']>.hintIcon').css('display','');
        // dlg.toggle();
      }
      else {
        $($('.hintImgList')[num-1]).css('background-image',"url('"+file_array_list[i].imageUrl+"')");
        $($('.hintImgList')[num-1]).attr('type', 'hasimg');
        $('div.hintImgList[type="hasimg"] #changeHintImg').css('display','');
        $('.hintImgList[hint='+num+']>.hintIcon').css('display','none');
        // dlg.toggle(); 
      }
    }
    dlg.toggle();
    $('.dialog.dialog--open .dialog__content').css('width','75%');
	}
  $($('#somedialog')[0]).find('button').bind('click',function(){
    $('div.hintImgList[type="hasimg"] #changeHintImg').css('display','none');
    $('div.hintImgList[type="hasimg"]>.hintIcon').css('display','');
  })
});

var alertMsg = new DialogFx( $('#somedialog2')[0] )


//開始轉盤
rotateBall();


function change2LoserPage(){
	$('.fullmain[stage="4"]>#imgArea').attr('type','showLoser');
  $('.pagebtn').removeClass('pagebtnUse');
  $('#loserPage').addClass('pagebtnUse');
  $('#bg4Up').css('background-position-y','180px');
  if ($('#loserImg').attr("type") == "noimg" ) {
     $('#bg4Up,#bg4Down').show();
  }else{
     $('#bg4Up,#bg4Down').hide();
  }
}
function change2WinerPage(){
	$('.fullmain[stage="4"]>#imgArea').attr('type','showWiner');
  $('.pagebtn').removeClass('pagebtnUse');
  $('#winerPage').addClass('pagebtnUse');
  $('#bg4Up').css('background-position-y','360px');
  if ($('#winerImg').attr("type") == "noimg" ) {
     $('#bg4Up,#bg4Down').show();
  }else{
     $('#bg4Up,#bg4Down').hide();
  }
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

				file_array_list[22] = files;
				file_array_list[22].imageUrl = e.target.result;
        $('#loserPage').removeAttr('disabled').removeClass('pagebtnClose');
			}
			else if($('.fullmain[stage="4"] #imgArea').attr('type') == "showLoser") {
				$('.fullmain[stage="4"] #loserImg').css('background-image', 'url('+e.target.result+')');
				$('.fullmain[stage="4"] #loserImg').attr('type', 'hasimg');

				file_array_list[23] = files;
				file_array_list[23].imageUrl = e.target.result;
			}
      $('#bg4Up,#bg4Down').hide();

		if(file_array_list[22] != undefined && file_array_list[23] != undefined){
				// $('#end_NextBtn>#nextBtn').attr('disabled', false);
			}
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
      location.replace('chanceEdit.jsp');
  })
}

function ImgAuto(ImgD){
  var image=new Image();
  image.src=ImgD.src;
  var proMaxWidth = 300;
  var proMaxHeight = 272;
  if(image.width>0&&image.height>0){
    var rate=(proMaxWidth/image.width<proMaxHeight/image.height)?proMaxWidth/image.width:proMaxHeight/image.height;
    if(rate<=1){
      ImgD.width=image.width*rate;
      ImgD.height=image.height*rate
    }else{
      ImgD.width=image.width;
      ImgD.height=image.height;
    }
  }
  fixImg = image;
};
function fullToHalf(str)
{
    var value = str || "";
    var result = "";
    if (value)
    {
        for (i = 0; i <= value.length; i++)
        {
            if (value.charCodeAt(i) == 12288)
                result += " ";
            else if (value.charCodeAt(i) >= 65280 && value.charCodeAt(i) < 65375)
                result += String.fromCharCode(value.charCodeAt(i) - 65248);
            else if(value.charCodeAt(i) == 65087)//"︿"
                result += String.fromCharCode(94);//"^"
            else
                result += String.fromCharCode(value.charCodeAt(i));
        }
    }
    return result;
}
</script>
</html>