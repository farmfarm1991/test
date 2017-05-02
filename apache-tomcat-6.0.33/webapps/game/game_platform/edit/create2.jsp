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
  flex.object.nadmin.SchoolProfile schoolProfile = auth.getLoginSchool();
  String schoolID = schoolProfile.getSchoolID();

  if(!gameID.equals("new")){
    gameID = gameID.split("=")[1];
  }

  String domID = "";
  String gameName = "";
  String remarkContent = "";
  int totalNum = 0;
  int oxNum = 0;
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
      remarkContent = rs.getString("remark");
    }
    pStatement = conn.prepareStatement(SQL_user_totalNum);
    pStatement.setString(1, userID);
    rs = pStatement.executeQuery();
    while(rs.next()) {
      totalNum = rs.getInt("totalNum");
      oxNum = rs.getInt("oxNum");
      type = rs.getString("type");
      if(userID.equals("114692-yilinteacher@tn.edu.tw") || userID.equals("114677-hsiumei@tn.edu.tw") || userID.equals("094628-kentxchang@gmail.com") || userID.equals("213639-testopenid@tn.edu.tw")){
        type = "money";
      }
    }
    pStatement.close();
  } catch (SQLException e) {
    e.printStackTrace();
  }
%>
<html>
<head>
<link rel="icon" href="/game/game_platform/images/logo/icon.png" type="image/png"/>
<!-- <meta name="viewport" content="width=device-width,maximum-scale=1.0, minimum-scale=1.0 , user-scalable=no" /> -->
<meta name="viewport" content="width=device-width,maximum-scale=1.0, minimum-scale=1.0 " />
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Holiyo</title>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<link rel="stylesheet" href="../css/game/intro.css" ></link>
<link rel="stylesheet" href="../css/game/helper.css"></link>
<link rel="stylesheet" href="../css/game/main.css"></link>
<link rel="stylesheet" href="../css/game/end.css"></link>
<link rel="stylesheet" type="text/css" href="../css/game/normalize.css" />
<link rel="stylesheet" type="text/css" href="../css/game/general.css" />
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
    <!-- <span id="back" onclick='back()'>
      <img class="naviBtn" src="../images/naviBar/back.svg"/>
    </span> -->
    <span class="pull-right">
      <!-- <span id="searchTrigger" onClick="save()" class="search-trigger naviSearch">
        <img class="naviBtn" src="img/save.svg"/>
      </span> -->
      <span id="saveText" onClick="save()">儲存檔案</span>
      <span id="back" onclick="back()">離開</span>
      <span id="iamlittlehelp">
        <img src="../images/menu/banner_btn02.svg">
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
          <div id='remarkC'>
            <div class='text' id='remark_label'>備註</div>
            <input type='text' placeholder="學校名稱、單位名稱...等">
          </div>
        </div>
        <div  class='choicebox'>
          <div class='btn text' id="OKbtn">確定</div>
          <div class='btn text' id="NObtn">取消</div>
        </div>
      </div>
    </div>
</div>
<nav id='menubar'>
  <div id="step1" class="step stepOpen stepUse">
    <div id="stepName"><span>步驟 1.</span></div>
    <div id="stepC"><span>製作封面頁</span></div>
  </div>
  <div id="step2" class="step stepOpen stepClose" disabled="disabled">
    <div id="stepName"><span>步驟 2.</span></div>
    <div id="stepC"><span>製作說明頁</span></div>
  </div>
  <div id="step3" class="step stepOpen stepClose" disabled="disabled">
    <div id="stepName"><span>步驟 3.</span></div>
    <div id="stepC"><span>製作題目頁</span></div>
  </div>
</nav>
<!-- 小幫手 -->
<div id="hintbox">
  <div id="allvideo">
    <div class="hintVideo" id='downloadhelper'>
      <div>下載使用手冊</div>
    </div>
    <div class="btn hintBtn text" id="OKbtn_x" onclick="download()">下載</div>
    <div class="btn hintBtn text" id="NObtn_x">取消</div>
  </div>
</div>
<!-- create game -->
<div class='fullmain' stage="1">
  <div id='imgArea'>
    <div class='text' id='uploadTitle'>上傳起始頁</div>
    <div id='imgbox'>
      <div id="typeDom" type='noimg'>
        <div id='uploadbtn'>
          <div id='imgActive'></div>
          <input type='file' id='myuploadimg_intro'></input>
        </div>
        <div id='cardimg'></div>
      </div>
    </div>
   <!--  <div id='intro_NextBtn'>
      <div id='nextBtn' disabled="disabled"></div>
    </div> -->
    <div id='bottomFun'>
      <div id="changeImg"><img src="images/changeImg.svg" style="top: 7px;position: relative;">更換圖片</div>
      <span></span>
      <div id="nextStep"><img src="images/newImg/edit_next.svg" style="top: 7px;position: relative;">進入步驟2</div>
    </div>
    <!-- <div id='bottomOfText'>
      <div>本平台感謝臺南市資訊教育輔導團楊易霖、陳秀梅老師協助製作</div>
      <div>本平台相關智慧財產權為宏鼎資訊股份有限公司所有</div>
    </div> -->
  </div>
  <!-- <div id='importEditCode'></div> -->
</div>
<div class="fullmain" stage="2">
  <div id='imgArea' p1='false' p2='false' p3='false'>
    <!-- <div id="aboutGame">
      <div id="aboutGameText" class='single-line' contenteditable="true"></div>
    </div> -->
   <!--  <div id="nextPage" class="pagebtn">下一頁說明頁</div>
    <div id="prevPage" class="pagebtn">上一頁說明頁</div> -->
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
          <!-- <div class='imgDel'></div> -->
        </div>
        <sdiv class='cardimg' id='cardimg2'></sdiv>
      </div>
    </div>
    <div class='imgBox' no="3" style="display: none;">
      <div id="typeDom3" type='noimg'>
        <div class="uploadbtn">
          <div class='imgActive'></div>
          <input type='file' class='myuploadimg_helper'></input>
          <!-- <div class='imgDel'></div> -->
        </div>
        <sdiv class='cardimg' id='cardimg3'></sdiv>
      </div>
    </div>
    <div id='bottomFun'>
      <div id="leftContent">
        <span>最多3頁：</span>
        <div id="helperBtn">
          <span id="helper1" class="helper clickNow" onclick="changePage(this)"></span>
          <span id="helper_plus" onclick="helper_plus()"></span>
          <span id="helper_less" onclick="deleteImg_helper()" style="display: none;"></span>
        </div>
      </div>
      <div id="changeImg"><img src="images/changeImg.svg" style="top: 7px;position: relative;"><span>更換圖片</span></div>
      <span></span>
      <div id="nextStep"><img src="images/newImg/edit_next.svg" style="top: 7px;position: relative;"><span>進入步驟3</span></div>
    </div>
    <!-- <div id='helper_NextBtn'>
      <div id='nextBtn'  disabled="disabled"></div>
    </div>
    <div id='helper_PrevBtn'>
      <div id='prevBtn'></div>
    </div>
    <div id='bottomOfText'>
      <div>本平台感謝臺南市資訊教育輔導團楊易霖、陳秀梅老師協助製作</div>
      <div>本平台相關智慧財產權為宏鼎資訊股份有限公司所有</div>
    </div> -->
  </div>
</div>
<div class="fullmain" stage="3">
  <div id="somedialog" class="dialog">
    <div class="dialog__overlay"></div>
    <div class="dialog__content">
      <h2>
        <div id='hintImgList' type='noImg'>
          <div id="hintImg"></div>
          <!-- <div id='changeHintImg'></div> -->
        </div>
        <div id='bottomFun' style="margin-left: -75px;">
          <div id="changeImg" onclick="showHintBox()"><img src="images/changeImg.svg" style="top: 7px;position: relative;">更換圖片</div>
            <span></span>
            <div id="nextStep">確定</div>
        </div>
      </h2>
      <div><button class="action" data-dialog-close></button></div>
    </div>
  </div>
  <div id="somedialog2" class="dialog">
    <div class="dialog__overlay"></div>
    <div class="dialog__content">
      <h2>
        <div id='alertMsg'>請先建立題目</div>
      </h2>
      <div><button class="action" data-dialog-close></button></div>
    </div>
  </div>

  <div id='imgArea'>
    <!-- <div id='topBar'>
      <div id='aboutTime'>
        <select id='timetype'>
          <option val='grow'>進行時間</option>
          <option val='down'>剩餘時間</option>
        </select>
        <input id='timeClock' type='text' value="00:00" readonly pattern="[0-9]{2}:[0-9]{2}" maxlength="5" placeholder="mm:ss"/>
      </div>

      <div id="aboutGame">
        <input type='text' id="aboutGameText" class='single-line' style="pointer-events: none;"></input>
      </div>

      <div id='aboutSetting'>
        <div id='menuBtn'></div>
      </div>
    </div> -->
    <div id='quizList'>
      <div id='quizImg'>
        <div id="levelTitle">題目</div>
        <div id="addbox">
            <div id='addImg' type='noimg'>
              <div id="addNewImg"></div>
              <!-- <div id='imageChange'></div> -->
            </div>
        </div>
        <div id="cardimg"></div>
      </div>
      <div id='levelBox'>
        <div class="fontStyle" style="height: 40px;">
          <span>名稱：</span>
          <input id="gN" type="text" placeholder="請輸入遊戲名稱">
        </div>
        <div class="fontStyle" style="height: 40px;">
          <span>題目設定：</span>
          <span style="color: #8F4508;margin-left: 9px;">最多6題</span>
        </div>
        <div>
          <div class="level open" id="level1" itemno="1">
            <div class="deleteBtn"></div>
              <div class="cover"></div>
          </div>
          <div class="level lock none" id="level2" itemno="2">
            <div class="deleteBtn"></div>
              <div class="cover"></div>
          </div>
          <div class="level lock hide" id="level3" itemno="3">
            <div class="deleteBtn"></div>
              <div class="cover"></div>
          </div>
        </div>
        <div>
          <div class="level lock hide" id="level4" itemno="4">
            <div class="deleteBtn"></div>
              <div class="cover"></div>
          </div>
          <div class="level lock hide" id="level5" itemno="5">
            <div class="deleteBtn"></div>
              <div class="cover"></div>
          </div>
          <div class="level lock hide" id="level6" itemno="6">
            <div class="deleteBtn"></div>
              <div class="cover"></div>
          </div>
        </div>
        <hr style="margin-top: 15px;" />
        <div id='aboutTime' class="fontStyle" style="height:36px;">
            <span id='hintLebel'>答題時間：</span>
            <select id='timetype'>
              <option val='grow'>進行時間</option>
              <option val='down'>剩餘時間</option>
            </select>
            <input id='timeClock' type='text' value="00:00" readonly pattern="[0-9]{2}:[0-9]{2}" maxlength="5" placeholder="mm:ss"/>
          </div>
          <div id='setting' class="fontStyle" style="height:36px;">
            <span id='hintLebel'>提示倒數：</span>
            <!-- <div id='hintTime' contenteditable="true" onkeypress="return (this.innerText.length <= 5)">00:00</div> -->
            <input id="hintTime" type='text' value='10' maxlength=2  pattern="^[0-9]{1,2}$" placeholder="ss" onblur="numChange(this)"/>秒
          </div>
          <div id='setting_send' class="fontStyle" style="height:36px;">
            <span id='sendLebel'>再次答題倒數：</span>
            <!-- <div id='sendTime' contenteditable="true">00:00</div> -->
            <input id="sendTime" type='text' value='10' maxlength=2  pattern="^[0-9]{1,2}$" placeholder="ss" onblur="numChange(this)"/>秒
          </div>
          <hr/>
          <div class="fontStyle" style="font-size: 16px">遊戲製作完成需要以下條件：
            <br>1. 請至少完成1題
            <br>2. 請輸入答案
          </div>
        </div>
      </div>
      <div id='bottomBar' stage='stagelist'>
        <div id="leftAns" style="display: none;">
          <div id="isHintBtn" style="margin-right: 18px;"><span>製作提示頁</span></div>
          <span></span>
          <div id='ansArea'>
            <input id='ansFill' placeholder="最多10個字" maxlength="10"></input>
          </div>
          <!-- <input id='ans' type='text' placeholder="在此輸入答案" maxlength="10"></input> -->
          <div id="changeImg" onclick="upload_by_eachQuiz()"><img src="images/changeImg.svg" style="top: 7px;position: relative;"><span>更換圖片</span></div>
        </div>
        <span></span>
        <div id="nextStep" onclick="openMenu()" style="display: none;">回上一頁</div>
      </div>
    <!-- <div id='bottomBar' stage='stagelist'>
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
      <div id='sendBtn' stage='stagelist' onclick='openMenu()'>
        <div id='isSendBtn'>關卡</div>
        <div id='setting_send'>
          <span id='sendLebel'>設定答題倒數</span>
          <input id="sendTime" type='text' value='15' maxlength=2  pattern="^[0-9]{1,2}$" placeholder="ss" onblur="numChange(this)"/>
        </div>
      </div>
    </div>

    <div id='level_NextBtn'>
      <div id='nextBtn'  disabled="disabled"></div>
    </div>
    <div id='level_PrevBtn'>
      <div id='prevBtn'></div>
    </div> -->
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
    <div id='bottomOfText'>
      <div>本平台感謝臺南市資訊教育輔導團楊易霖、陳秀梅老師協助製作</div>
      <div>本平台相關智慧財產權為宏鼎資訊股份有限公司所有</div>
    </div>
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
//  小幫手
$('#iamlittlehelp').click(function() {
  if($('#hintbox').height()==0){
    $('#hintbox').height('140px');
    $('#hintbox').css('box-shadow', '0px 0px 10px #404041');
  }
  else{
    $('#NObtn_x').click();
  }
  $('#NObtn_x').click(function() {
    $('.hintBtn').unbind('click');
    $('#hintbox').height(0);
    $('#hintbox').css('box-shadow', 'none');
  })
});
function download(){
  window.open(location.origin+'/game/game_platform/ppt/helper.pdf');
}
var authUserRole = "<%=userRole%>";
var nowNumber;
var file_array_list = new Array();
var editMode = false;
var gameid = "";
var startTime = new Date().getTime();
var modeType = "";
var isShare = 1;
if('<%=schoolID%>' == 'CGES'){
  isShare = 0;
}
// alert("domID "+'<%=domID%>'+" gameName "+'<%=gameName%>');
$(function() {
  gameid = S4()+S4();
  $('body').attr('gameid',gameid);
  $('#reEditCode>span').text(gameid);
  
  if(parseInt('<%=oxNum%>')>=parseInt('<%=totalNum%>') && '<%=type%>'!='money' && location.search.match('new')!= null){
    iTS5Dialog.myOnlyMsg2('您的遊戲數已達上限!!',function(){
      location.replace('advancedEdit.jsp');
    });
  }

  //解決ipad 螢幕底部多20px 問題
  if(navigator.userAgent.match(/iPad;/i) && !window.navigator.standalone) {
    $('html').addClass('ipad ios7');
    var mainHeight = window.innerHeight ? window.innerHeight:$(window).height();
    mainHeight = mainHeight-41;
    $(".fullmain").css('height',mainHeight+'px');
  }

  if(location.search.substr(1).split('&')[0].length>0){
    //  有參數近來
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
  // menu bar
  $('#step1').bind('click',stage1);
  $('#step2').bind('click',stage2);
  $('#step3').bind('click',stage3);
  //stage1 :
  $('#importEditCode').bind('click', reloadEditCode);
  $('#myuploadimg_intro').bind('change',upload_by_intro);
  $('.fullmain[stage="1"] #changeImg').bind('click', removeImg_intro);
  $('.fullmain[stage="1"] #nextStep').bind('click', stage2);
  // $('#imgActive').bind('click', removeImg_intro);
  // $('.fullmain[stage="1"] #nextBtn').bind('click', stage1_to_stage2);

  //stage2 :
  $('.myuploadimg_helper').bind('change',upload_by_helper);
  $('.fullmain[stage="2"] #changeImg').bind('click', removeImg_helper);
  $('.fullmain[stage="2"] #nextStep').bind('click', stage3);
  // $('.imgActive').bind('click', removeImg_helper);
  // $('.imgDel').bind('click', deleteImg_helper);
  // $('.fullmain[stage="2"] #prevPage').bind('click', prevPage);
  // $('.fullmain[stage="2"] #nextPage').bind('click', nextPage);
  // $('.fullmain[stage="2"] #nextBtn').bind('click', stage2_to_stage3);
  // $('.fullmain[stage="2"] #prevBtn').bind('click', stage2_to_stage1);

  //$('.fullmain[stage="2"] #aboutGameText').bind('blur',reTextTitle);

  //stage3 :
//  $('.fullmain[stage="3"] #aboutGameText').bind('blur',reTextTitle2);
  $('.fullmain[stage="3"] #menuBtn').bind('click', openMenu);
  $('.fullmain[stage="3"] .level').bind('click', whenClickLevel);
  $('.fullmain[stage="3"] .deleteBtn').bind('click', whenClickRemoveLevel);
  $('.fullmain[stage="3"] #addImg').bind('click', upload_by_eachQuiz);
  $('.fullmain[stage="3"] #hintImgList').bind('click', showHintBox);
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
function stage1(){
  var nowLink = $('link[rel="stylesheet"]').attr('href');
  $('link[rel="stylesheet"][href="'+nowLink+'"]').attr('href', '../css/game/intro.css');  
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
  $('link[rel="stylesheet"][href="'+nowLink+'"]').attr('href', '../css/game/helper.css'); 
  init_stage2();
  controlArrow();
  // change menu color
  $(".step").removeClass("stepUse");
  $("#step2").addClass("stepUse");
  $(".helper").removeClass("clickNow");
  $("#helper1").addClass("clickNow");
  $(".imgbox").removeClass("click");
  $(".fullmain[stage='2'] .imgbox").addClass("click");
  // 說明頁
  // setTimeout(function(){
  //   if ( $("#typeDom1").attr("type") != "hasimg" ) {
  //     $('#bg2Up,#bg2Down').show();
  //   }
  // },100);
  

}
function stage3(){
  var nowLink = $('link[rel="stylesheet"]').attr('href');
  $('link[rel="stylesheet"][href="'+nowLink+'"]').attr('href', '../css/game/main.css');
  init_stage3();
  checkCanGoNextStage();
  // change menu color
  $(".step").removeClass("stepUse");
  $("#step3").addClass("stepUse");
  // $("#quizList").removeClass("click");
  openMenu();
  // $(".fullmain[stage='3'] #quizList").addClass("click");
}
/*function stage1_to_stage2() {
  $('link[rel="stylesheet"][href="../css/game/intro.css"]').attr('href', '../css/game/helper.css');
//  $('link[rel="stylesheet"][href="css/intro.css"]').remove();
//  $('head').append("<link rel='stylesheet' href='css/helper.css'></link>");
  init_stage2();
  controlArrow()
}
function stage2_to_stage1() {
  $('link[rel="stylesheet"][href="../css/game/helper.css"]').attr('href', '../css/game/intro.css');
//  $('head').append("<link rel='stylesheet' href='css/intro.css'></link>");
//  $('link[rel="stylesheet"][href="css/helper.css"]').remove();

}
function stage2_to_stage3() {
  $('link[rel="stylesheet"][href="../css/game/helper.css"]').attr('href', '../css/game/main.css');
//  $('link[rel="stylesheet"][href="css/helper.css"]').remove();
//  $('head').append("<link rel='stylesheet' href='css/main.css'></link>");
  init_stage3();
  checkCanGoNextStage();
//  var k = $(".fullmain[stage='2'] #aboutGameText").text();
//  $(".fullmain[stage='3'] #aboutGameText").text(k);
}
function stage3_to_stage4() {
  $('link[rel="stylesheet"][href="../css/game/main.css"]').attr('href', '../css/game/end.css');
  $('#loserPage').show();
  console.log("123");
}
function stage3_to_stage2() {
  $('link[rel="stylesheet"][href="../css/game/main.css"]').attr('href', '../css/game/helper.css');
}
*/
var getBeforeGameData;
function loadGameData(){
  $.get( "/iTS5/service/file/game/"+gameid+"/data.txt" ,function(result){
    getBeforeGameData = $.parseJSON(result);

    //置換圖片
    //封面頁
    var imgURL01 = "/iTS5/service/file/game/"+gameid+"/"+getBeforeGameData.fileList[0];
    $('.fullmain[stage="1"] #cardimg').css('background-image','url("'+imgURL01+'")');
    $('.fullmain[stage="1"] #typeDom').attr('type','hasimg');
    // $('.fullmain[stage="1"] #nextBtn').removeAttr('disabled');
    $('#step2').removeAttr('disabled').removeClass("stepClose");
    $('.fullmain[stage="1"] #bottomFun').css('display','inherit');
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
      $('#step3').removeAttr('disabled').removeClass("stepClose");
      $('.fullmain[stage="2"] #bottomFun').css('display','inherit');
    }
    
    if(getBeforeGameData.fileList[2] != null) {
      var imgURL03 = "/iTS5/service/file/game/"+gameid+"/"+getBeforeGameData.fileList[2];
      $('.fullmain[stage="2"] #cardimg2').css('background-image','url("'+imgURL03+'")');
      $('.fullmain[stage="2"] #typeDom2').attr('type','hasimg');
      $('.fullmain[stage="2"] #imgArea').attr('p2','true');
      file_array_list[2] = {};
      file_array_list[2].finalName = getBeforeGameData.fileList[2];
      file_array_list[2].imageUrl = imgURL03;
      helper_plus();
    }
    if(getBeforeGameData.fileList[3] != null) {
      var imgURL04 = "/iTS5/service/file/game/"+gameid+"/"+getBeforeGameData.fileList[3];
      $('.fullmain[stage="2"] #cardimg3').css('background-image','url("'+imgURL04+'")');
      $('.fullmain[stage="2"] #typeDom3').attr('type','hasimg');
      $('.fullmain[stage="2"] #imgArea').attr('p3','true');
      file_array_list[3] = {};
      file_array_list[3].finalName = getBeforeGameData.fileList[3];
      file_array_list[3].imageUrl = imgURL04;
      helper_plus();
    }
    //遊戲頁
    //getBeforeGameData.finalData = $.parseJSON(getBeforeGameData.finalData);
    //getBeforeGameData.finalData = getBeforeGameData.finalData;

    for(var gg = 0; gg<getBeforeGameData.finalData.length; gg++){

      var tempimg = "/iTS5/service/file/game/"+gameid+"/"+getBeforeGameData.fileList[4-0+gg*2];

      file_array_list[4-0+gg*2] = {};
      file_array_list[4-0+gg*2].imageUrl = tempimg;
      file_array_list[4-0+gg*2].quizAns = decodeURI( getBeforeGameData.finalData[gg].ans );

      // 放置關卡題目圖
      $('.fullmain[stage="3"] #level'+(gg+1)+' .cover').css('background-image','url('+tempimg+')').show();

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
    $('#gN').val(decodeURI(getBeforeGameData.gameName));
    //determine timetype 
    if (timetype == 'b' || $('#timeClock').val() != '00:00') {
      $($('#timetype option')[1]).attr('selected', true);
      $('#timeClock').prop('readonly', false).css({'background': '#DFE0E1','border':'0.5px solid #808080'});
    }
    //設定過關或失敗圖片
    //新增判斷
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
  // gradeSelectbindDomain();
  $("#dd option[value='"+loadT+"']").prop('selected', true);
  $("#aa>option[value='"+loadA+"']").prop('selected', true);
  // 顯示某地區
  citySelectbindArea();
  $("#cc option[value='"+loadC+"']").prop('selected', true);
  // 備註
  $('#remarkC>input').val('<%=remarkContent%>');

 // $('#examtitle>input').val("<%=gameName%>");  
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
  // if ($('#aboutGame>input').val().length != 0) {
  if ($('#gN').val().length != 0) {
    $('#examtitle>input').val($('#gN').val());
  }
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
var remark;
function startSave(){
  title = $('#examtitle>input').val();
  remark = $('#remarkC>input').val();
  if ($('#gN').val().length == 0) {
    $('#aboutGame>input').val(title);
  }
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
                gtype:'hard',
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
                remark:remark,
                isShare,isShare
               },
          }).done(function(evt){
              evt = evt.trim();
              console.log(evt);
              //相當於要進行存檔
              alertMsgSaveStart.toggle();
              //開始上傳檔案
              onSaveTime_uploadImg(0, $('body').attr('gameid'));
              // 計算關卡數、題示數
              var levelCount = 0;
              var hintCount = 0;
              var second = 0;
              var minute = 0;
               xapiData.extensions = [];

              for (var i = 4; i <=15; i++) {
                // 關卡數
                if (i%2 == 0 && file_array_list[i] != undefined) {
                  levelCount++;
                }else if(i%2 != 0 && file_array_list[i] != undefined){
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
              xapiData.objType = "oxHoliyo";
              xapiData.verb = "saved";
              xapiData.description = modeType+"-"+year+"-"+semester+"-"+subject+"-"+grade+"-"+area+"-"+counties;
              xapiData.description2 = modeType+"-"+dom;

              xapiData.extensions = [levelCount,hintCount,minute+":"+second];
              xAPIinit(xapiData);
          });

  iTS5Dialog.myWaitMsg("存檔中...", function(){
       //教案儲存中請稍等
    xhr.abort();
    
  });
  
}
function cancelSave(){
  $('#studen_stat_table').hide();
}
// 平台不需要再儲存遊戲名稱&作者
// var alertMsgSave = new DialogFx( $('#somedialog4')[0] , {'onCloseDialog': function(){
//  //相當於要進行存檔
//  alertMsgSaveStart.toggle();
//  //開始上傳檔案
//  onSaveTime_uploadImg(0, $('body').attr('gameid'));
//  console.log("Sava...");
// }});

//為了safari看不懂this.responseURL
var tempI;
function onSaveTime_uploadImg(i, id){
  tempI=i;
  if(i>=file_array_list.length){
    //$('progress').attr('value',90);
    onSaveManifest();
    $('#somedialog5 button').click();
    return;
  }


  var imgName = "img";
  // if(i<10){
  //  imgName = "img0" +i ;
  // }
  // else {
    imgName = "img" +i ;
//  }
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

    if(i==17 && file_array_list[i] != undefined){
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
          "/game/game_platform/images/logo/logo_animated_bigpic.png\n"+
          "/game/game_platform/images/background/bg3.png\n"+
          "/game/game_platform/edit/images/play_bg.png\n"+
          "/game/game_platform/edit/images/play_button_V2.png\n"+
          "/game/game_platform/edit/images/play_level_no.png\n"+
          "/game/game_platform/edit/images/play_time.svg\n"+
          "/game/game_platform/edit/images/play_after_ans.png\n"+
          "/game/game_platform/edit/images/play_close_after_ans.svg\n"+
          "/game/game_platform/edit/images/play_close_game_over.svg\n"+
          "/game/game_platform/images/logo/icon.png\n";
          // "/game/game_platform/edit/images/fullimg.png\n";

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
    console.log('done!!!!!!!!!!!!!!!!!!!!!!!!!!');
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

  var getURL = "/game/game_platform/edit/play3.jsp?id="+$('body').attr('gameid');
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
      var getAnsHerfStr = fullToHalf(file_array_list[k*2+4].quizAns.toLowerCase());
      var getAnsMD5 = CryptoJS.MD5(getAnsHerfStr).toString();
      getData =  getData  + "."+ getAnsLength + "-" +getAnsMD5;

      finalData[k] = {"leng":getAnsLength,"ans": encodeURI(file_array_list[k*2+4].quizAns) };
    }
  }
  finalSaveData.finalData = finalData;

  //var getTitle = $('#aboutGameText').text();
  var getTitle = $('#gN').val();
  if(getTitle == "") {
    getTitle = "新遊戲";
  }
  finalSaveData.title = encodeURI(getTitle);

//  getData = getData;
  getURL = getURL + getData;
//  finalData = JSON.stringify(finalData);

  var getFileExtension = "";
  var alphaBit =    ['x'  ,'o'  ,'n'  ,'u'  ,'v'   ,'c'  ,'e'  ];
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

  //thisQrcode.makeCode(temp+tmpe2);
//$('#qrcode').css('background-image','url("'+tmp+tmp2+'")');
  $('#qrcode>img').attr('src',tmp+tmp2);
  $('#qrcode>canvas').remove();
  $('#qrcode>img').css('display','');
  $('#qrcode>img').css('visibility','visible');

  $('#somedialog6 #startPlay>a').attr('href',getURL);

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
  // 檢查
  var promptText = "<div>存檔完畢，以下內容尚未完成</div>";
  // 判斷說明頁完成與否
  if (file_array_list.length <= 1) {
    promptText = promptText+"<div>說明頁未完成</div><div>題目未完成</div>";
  }else if (file_array_list.length <= 2) {
    promptText = promptText+"<div>題目未完成</div>";
  }else if (file_array_list.length <= 16) {
    // 判斷關卡完成與否
    var noAns = "";
    for (var i = 4; i <= file_array_list.length; i += 2) {
      if (file_array_list[i] != undefined){
        if(file_array_list[i].quizAns == undefined || file_array_list[i].quizAns == ""){
          noAns = noAns + " " + (i/2 -1);
        }
      }
    }
    console.log('noans'+noAns);
    if (noAns != "") {
      promptText = promptText + "<div>未輸入答案第" + noAns + " 題答案</div>"; 
    }else{
      promptText = "<div>存檔完畢</div>";
    }
  }else{
    promptText = "<div>存檔完畢</div>";
  }
  iTS5Dialog.myHtmlObject({'html':promptText,
                           'type':'Alert',
                           'width':'360px', 
                           'title':'系統訊息'});
  //相當於要進行存檔
  //是否顯示QRcode
  // if(file_array_list[16] != undefined && file_array_list[17] != undefined){
  
  // iTS5Dialog.myAlert('存檔完畢');
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
//  getData = getData;
  getURL = getURL + getData;
  finalData = JSON.stringify(finalData);


  var getFileExtension = "";
  var alphaBit =    ['x'  ,'o'  ,'n'  ,'u'  ,'v'   ,'c'  ,'e'  ];
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
  
//  setTimeout(function(){
//    $('#qrcode').css('background-image','url("'+$('#qrcode>img').attr('src')+'")');
//  },300);
  
  console.log("End Sava Dialog");
}});
var thisQrcode = new QRCode($('#qrcode')[0]);
var alertMsgShowQrcode = new DialogFx( $('#somedialog6')[0] , {'onCloseDialog': function(){
  //相當於要進行存檔
  iTS5Dialog.myAlert('存檔完畢');
  console.log("start Sava Dialog");
}});
// function stage4_to_stage5() {
//  console.log("edit OVER!");
//  alertMsgSave.toggle();
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
      $('.fullmain[stage="1"] #cardimg').css({'background-image':'url('+e.target.result+')'});
      $('.fullmain[stage="1"] #typeDom').attr('type', 'hasimg');
      objectID = guid();
      //file_array_list.push(files);
      file_array_list[0]=files;

      // $('.fullmain[stage="1"] #nextBtn').removeAttr('disabled');
      // show bottom & next btn can use
      $('.fullmain[stage="1"] #bottomFun').css('display','inherit');
      $('#step2').removeAttr("disabled").removeClass('stepClose');
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
      $('#cardimg'+nowNumber).css({'background-image':'url('+e.target.result+')'});
      $('.fullmain[stage="2"] #typeDom'+nowNumber).attr('type', 'hasimg');
      $('.fullmain[stage="2"] #imgArea').attr('p'+nowNumber,'true');
      objectID = guid();
      file_array_list[parseInt(nowNumber)]=files;
      
      controlArrow();
      // show bottom & next btn can use
      $('.fullmain[stage="2"] #bottomFun').css('display','inherit');
      $('#step3').removeAttr("disabled").removeClass('stepClose');
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

//  file_array_list[parseInt(nowNumber)]=undefined;
  controlArrow();
}
function changePage(evt){
  $('.helper').removeClass('clickNow');
  nowNumber = $('.fullmain[stage="2"] .nowPoint').attr('no');
  nextNumber = evt.id.substr(-1);
  $('#helper'+nextNumber).addClass('clickNow');
  
  if(nowNumber <= 3){
    $('.fullmain[stage="2"] .imgBox[no="'+parseInt(nowNumber)+'"]').css('display','none');
    $('.fullmain[stage="2"] .imgBox[no="'+nextNumber+'"]').css({'display':'flex','display':'-moz-box', 'display':'-webkit-box','display':'-webkit-flex'});
    //$('.fullmain[stage="2"] .imgBox[no="'+nextNumber+'"]').css('display','-webkit-box');
    $('.fullmain[stage="2"] .imgBox[no="'+parseInt(nowNumber)+'"]').removeClass('nowPoint');
    $('.fullmain[stage="2"] .imgBox[no="'+nextNumber+'"]').addClass('nowPoint');

    nowNumber=$('.nowPoint').attr('no');
    controlArrow();
  }
  // delete btn can't use
  if (nextNumber == 1) {
    $('#helper_less').hide();
  }else{
    $('#helper_less').show();
  }
}
// 說明頁新增
function helper_plus(){
  var heplerNum = $('#helperBtn>span').length - 2;
  if (heplerNum < 3) {
    $('#helper'+heplerNum).after('<span id="helper'+(heplerNum-0+1)+'" class="helper" onclick="changePage(this)"></span>');
    if (heplerNum == 2) {
      $('#helper_plus').hide();
    }
  }
}
// 說明頁刪除
function helper_less(){
  var heplerNum = $('#helperBtn>span').length - 2;
  var currentNum = $('#helperBtn>span.clickNow').attr('id').substr(-1);
  if (heplerNum == 3 && currentNum == 2) {
    $('.helper.clickNow').next().remove();
  }else{
    $('#helperBtn>span.clickNow').remove();
    $('#helper'+(currentNum-1)).click();
  }
  $('#helper_plus').show();
}
function deleteImg_helper(){
  //$('.nowPoint .cardimg').removeAttr('style');
  iTS5Dialog.myConfirm("確定刪除?",function(){
    $('.fullmain[stage="2"] #typeDom'+nowNumber).attr('type', 'noimg');
    $('.fullmain[stage="2"] #imgArea').attr('p'+nowNumber,false);
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
      $('#cardimg'+(nowNumber-0+1)).css('background-image','url("")');
    }else{
      file_array_list[parseInt(nowNumber)] = null;
      $('#cardimg'+nowNumber).css('background-image','url("")');
    }
    controlArrow();
    helper_less();
  })
}
function select_change(){
  if($(event.target).prop('value') == "剩餘時間") {
    $('#timeClock').prop('readonly', false);
    $('#timeClock').val("60:00").css({'background': '#DFE0E1','border':'0.5px solid #808080'});
  }
  else {
    $('#timeClock').prop('readonly', true).val("00:00").css({'background': 'transparent','border':'transparent'});
  }
}
function checkTimeFormat(){
  var isValid = this.value.search(new RegExp($(this).attr('pattern')));
 var inputTime = this;
  if(isValid<0){
    // $('#alertMsg').text('時間設定錯誤');
    // alertMsg.toggle();
    // this.focus();
    iTS5Dialog.myAlert('時間設定錯誤',function(){
      inputTime.focus();  
    });
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
/*function prevPage(){
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
*/
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
  $('#levelBox').css('visibility','visible');
  $('#quizImg').css('visibility', 'hidden');
  $('#quizList').css({'overflow-y':'auto','margin-top':'85px'});
  showGoStage();

  //修改底部按鈕狀態
  $('#bottomBar').attr('stage','stagelist').hide();
  $('#sendBtn').attr('stage','stagelist');

  //儲存作答紀錄
  var quizIndex = ($('#quizImg').attr('itemno')- 0)*2 + 3 - 1;
  if(file_array_list[quizIndex] != undefined){
    file_array_list[quizIndex].quizAns = $('#ansArea').attr('ansstring');
  }

  // 判斷題目&答案是否完成
  if ( $('.level.open').last().attr('itemno') == $('#quizImg').attr('itemno') && $('#ansArea').attr('length') != 0 ) {
    $('.lock').first().removeClass('lock').addClass('open');
  }
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
  
  if( $(clickObject).hasClass('none') ){
    $(clickObject).removeClass('none');
    $('.level.hide').first().removeClass('hide').addClass('none');

    // var itemno = $(event.target).attr('itemno');
    var itemno = $(clickObject).attr('itemno');
    if(itemno == 1) {
      $($('.level')[0]).removeClass('lock').addClass('open');
    }
    var realFileIndex = (itemno - 0)*2 + 3 - 1;
    if(file_array_list[realFileIndex - 2] != undefined && $(clickObject).hasClass('lock') && file_array_list[realFileIndex - 2].quizAns != undefined && file_array_list[realFileIndex - 2].quizAns != ""){
      $('.level.lock').first().removeClass('lock').addClass('open');
    }
  }
  else if( $(clickObject).hasClass('lock') ){

  }
  else if( $(clickObject).hasClass('open') ){
    $('#levelBox').css('visibility','hidden');
    $('#quizImg').css('visibility', 'visible');
    $('#quizList').css({'overflow':'hidden','margin-top':'0px'});

    // var itemno = $(event.target).attr('itemno');
    var itemno = $(clickObject).attr('itemno');
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
      $('#leftAns').show();
      $('#addNewImg').hide();
      $('#addbox').css('border','none')
    }
    else {
      $('#leftAns').hide();
      $('#addNewImg').show();
      $('#addbox').css('border','1px dashed #58595B');
      $('#addImg').attr('style','').attr('type','noimg');
      $('#ansArea').attr('ansstring', '');
      setAns('');
    }

    hideGoStage();

    $('#quizList>#quizImg').css('height',$(window).height()-41+"px");
    $('#quizList>#quizImg').css('top','41px');
    //修改底部按鈕狀態
    $('#bottomBar').attr('stage','onequiz').css('display','inherit');
    $('#sendBtn').attr('stage','onequiz');
    // show bottom
    $('.fullmain[stage="3"] #bottomBar[stage="onequiz"] #nextStep').show();
    $('#levelTitle').text("題目"+$(clickObject).attr('itemno'));
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
  $('.fullmain[stage="3"] #level'+itemIndex+' .cover').css({'background-image':'url("")'}).hide();
  var fileIndex = ( itemIndex - 0) *2 + 3 -1;
  if(file_array_list[fileIndex] != undefined) {
    file_array_list.splice(fileIndex, 2);
    file_array_list.splice(14, 0, undefined, undefined);
    // $('.level.open').last().removeClass('open').addClass('lock');
    // 縮圖移至前一個位置
    for (var i = fileIndex; i <= 14; i+=2) {
      if (file_array_list[i] != undefined) {
        var itemNewIndex = (i-2)/2;
        var nextCover = $('.fullmain[stage="3"] #level'+(itemNewIndex-0+1)+' .cover').css('background-image');
        $('.fullmain[stage="3"] #level'+itemNewIndex+' .cover').css('background-image', nextCover).show();
        $('.fullmain[stage="3"] #level'+(itemNewIndex-0+1)+' .cover').css('background-image','url("")').hide();
      }
    }
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
      $('.fullmain[stage="3"] #quizImg #addImg').css({'background-image':'url('+e.target.result+')'});
      $('.fullmain[stage="3"] #level'+$('#quizImg').attr('itemno')+' .cover').css({'background-image':'url('+e.target.result+')'}).show();
      $('.fullmain[stage="3"] #quizImg #addImg').attr('type', 'hasimg');
      objectID = guid();
      //file_array_list.push(files);
      file_array_list[itemIndex] = files;
      file_array_list[itemIndex].imageUrl = e.target.result;

      // if($('.level.open').last().attr('itemno') == $('#quizImg').attr('itemno'))
      //   $('.lock').first().removeClass('lock').addClass('open');
      $('#leftAns').show();
      $('#addNewImg').hide();
      $('#addbox').css('border','none');
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
    //  $('body').append("<input type='file' id='forSelectHintFile' onchange='selectNewHintfile()'>");
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
      // $('div#hintImgList[type="hasimg"] #changeHintImg').css('display','');
      $('#somedialog #bottomFun').css('display','inline-table');
      $('#somedialog #hintImg').hide();
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
        // show bottom
        $('#somedialog #bottomFun').hide();
        $('#somedialog #hintImg').show();
      }
      else {
        // show bottom
        $('#somedialog #bottomFun').css('display','inline-table');
        $('#somedialog #hintImg').hide();

        $('#hintImgList').css('background-image',"url('"+file_array_list[hintIndex].imageUrl+"')");
        $('#hintImgList').attr('type', 'hasimg');
        $('div#hintImgList[type="hasimg"] #changeHintImg').css('display','');
        dlg.toggle(); 
      }
      $('#somedialog #bottomFun>#nextStep').bind('click',function(){
        $('#somedialog #bottomFun>#nextStep').unbind('click');
        dlg.toggle();
      });
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
    location.replace('advancedEdit.jsp');
  })
}
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