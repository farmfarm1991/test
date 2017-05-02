<%
String id = request.getParameter("id");
%>
<html manifest="/iTS5/service/file/game/<%=id%>/play.manifest">
<head>
<link rel="icon" href="/game/game_platform/images/logo/icon.png" type="image/png"/>
<link rel="icon" href="http://203.69.207.170/favicon.png" type="image/png"/>
<meta name="viewport" content="width=device-width,maximum-scale=1.0, minimum-scale=1.0 , user-scalable=no" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Holiyo</title>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<link rel="stylesheet" href="../css/game/end.css"></link>
<link rel="stylesheet" href="../css/game/main.css"></link>
<link rel="stylesheet" href="../css/game/helper.css"></link>
<link rel="stylesheet" href="../css/game/intro.css" ></link>

<link rel="stylesheet" type="text/css" href="../css/game/normalize.css" />
<!-- common styles -->
<link rel="stylesheet" type="text/css" href="../css/game/dialog.css" />
<!-- individual effect -->
<link rel="stylesheet" type="text/css" href="../css/game/dialog-cathy.css" />
<script type="text/javascript" src="../js/modernizr.custom.js"></script>
<script type="text/javascript" src="../js/classie.js"></script>
<script type="text/javascript" src="../js/dialogFx.js"></script>
<script type="text/javascript" src="../js/md5.js"></script>
<!-- <script type="text/javascript" src="../js/fastclick.js"></script> -->
<style>
body{
	overflow:hidden;
	margin: 0;
	font-family: 微軟正黑體;
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}
.fullmain {
	height:100%;
	-webkit-box-sizing:border-box;
	   -moz-box-sizing:border-box;
	        box-sizing:border-box;
	display: none;
}
#imgArea {
	height: 100%;
	/*background-image: url("images/bground_right.png"),url("images/bground_left.png") ,url("images/_background.png");*/
	background-image: url("images/play_bg.png");
    /*background-position-x: 100%,0%,50%;
    background-position-y: -25%,100%,50%;
    -webkit-background-size: 250px, 200px, cover;
            background-size: 250px, 200px, cover;*/
    background-size: cover;
	/*background-color: #E5D1AA;*/
	background-repeat: no-repeat;
	/*padding: 10px 30px 20px;*/
	-webkit-box-sizing:border-box;
	   -moz-box-sizing:border-box;
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
	        -webkit-box-pack: center;
	           -moz-box-pack: center;
	        justify-content: center;
    -webkit-box-align: center;
	-webkit-align-items: center;
	   -moz-box-align: center;
	        align-items: center;
	background-color: #000000;
}
#bottomBar[stage="stagelist"]{
	display: none;
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
/*logo*/
.logoBackground{      
	background-image: url("../images/background/bg3.png");
	width: 100%;
	height: 100%;
	background-repeat: no-repeat;/*
	background-position-x: 100%,0%,50%;      
	background-position-y: -25%,100%,50%;      */
	/*background-size: 250px, 200px, cover;   */
	background-size:cover; 
	background-color: inherit;
	-webkit-filter: blur(0px);
	z-index: 1000;
	position: absolute;
}
.logo{
	height: 400px;
	width: 400px;
    position: absolute;
    top: calc(50% - 400px);
    left: calc(50% - 200px);
    z-index: 1001;
    background-image: url("../images/logo/logo_animated_bigpic.png");
    animation: slidein 2s steps(11) infinite;
    -webkit-animation: slidein 2s steps(11) infinite;
    background-size: inherit;
    background-repeat: no-repeat;
    background-position-y: 5%;
    background-position: inherit;
}
.logotext{
	font-size: 28px;
    text-align: center;
    border-top: 1px solid white;
    border-bottom: 1px solid white;
    position: absolute;
    bottom: -80px;
    width: 100%;
    line-height: 50px;
}
.logotext:after{
	content: '';
	position: absolute;
	width: 100%;
    border-top: 1px solid black;
    border-bottom: 1px solid black;
    left: 0px;
    height: 100%;
}
.logotext1{
	font-size: 15px;
    text-align: center;
    position: absolute;
    bottom: -140px;
    width: 100%;
    line-height: 50px;
    font-weight: bold;
}
@keyframes slidein {
	70% {
		background-position-x: 0px; 
	}
	100% { 
		background-position-x: -4400px; 
	}
}
#aboutGameText{
	text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}
.dialog__content>div {
    position: absolute;
    top: 10px;
    right: -25px;
}
#dialogbg2 {
    width: 200px;
    height: 200px;
    position: absolute;
    background-image: url(../edit/images/play_no_tips.png);
    right: 0px;
    bottom: 0px;
}
#dialogbg3{
	width: 210px;
    height: 240px;
    position: absolute;
    background-image: url('../edit/images/play_after_ans.png');
    right: 0px;
    bottom: 0px;
}
#dialogbg4{
	width: 210px;
    height: 240px;
    position: absolute;
    background-position-x: 210px;
    background-image: url('../edit/images/play_after_ans.png');
    right: 0px;
    bottom: 0px;
}
#dialogbg5{
	width: 500px;
    height: 510px;
    position: absolute;
    background-image: url('../edit/images/play_game_over.png');
    right: 0px;
    bottom: 0px;
    padding-bottom: 35px;
    background-repeat: no-repeat;
}
#alertMsg{
	position: absolute;
    width: 100%;
    top: 25%;
}
#alertMsg3{
	position: absolute;
    width: 100%;
    top: 25%;
}
#alertMsg4{
	position: absolute;
    width: 100%;
    top: 25%;
}
#alertMsg5{
	position: absolute;
    width: 100%;
    top: 60%;
    color: #DFE0E1;
}
.fullmain[stage='1'] #nextBtn{
	background-image: url(../edit/images/play_button_V2.png);
    background-position-x: 0px;
    background-position-y: 0px;
    zoom: 1;
    width: 60px;
    height: 130px;
}
.fullmain[stage='1'] #nextBtn:hover{
	background-position-y: -130px;
}
.level {
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: flex;
	width: 75%;
	height: 100%;
	position: relative;
	/*background-image: url('../images/level.png');*/
	background-repeat: no-repeat;
	/*background-size: contain;*/
	background-position: 50%;
	margin: 0px auto;
	-webkit-box-pack: flex-end;
	-webkit-justify-content: flex-end;
	   -moz-box-pack: flex-end;
	        justify-content: flex-end;
	-webkit-box-align: center;
	-webkit-align-items: center;
	   -moz-box-align: center;
	        align-items: center;


	background-image: url('../edit/images/play_level_no.png');
	background-position-x :0px; 
	background-position-y :0px;
	width: 200px;
	height: 200px;
}
.level.open[itemno='1'] {
	/*background-image: url('../images/level1.png');*/
}
.level.open[itemno='2'] {
	/*background-image: url('../images/level2.png');*/
	background-position-x: -200px;
}
.level.open[itemno='3'] {
	/*background-image: url('../images/level3.png');*/
	background-position-x: -400px;
}
.level.open[itemno='4'] {
	/*background-image: url('../images/level4.png');*/
	background-position-x: -600px;
}
.level.open[itemno='5'] {
	/*background-image: url('../images/level5.png');*/
	background-position-x: -800px;
}
.level.open[itemno='6'] {
	/*background-image: url('../images/level6.png');*/
	background-position-x: -1000px;
}
.level.open.clear{
	background-position-x: -1200px;
}
.level.open[itemno='1']:not(.clear):hover{
	background-position-y: -200px;
}
.level.open[itemno='2']:not(.clear):hover{
	background-position-x: -200px;
	background-position-y: -200px;
}
.level.open[itemno='3']:not(.clear):hover{
	background-position-x: -400px;
	background-position-y: -200px;
}
.level.open[itemno='4']:not(.clear):hover{
	background-position-x: -600px;
	background-position-y: -200px;
}
.level.open[itemno='5']:not(.clear):hover{
	background-position-x: -800px;
	background-position-y: -200px;
}
.level.open[itemno='6']:not(.clear):hover{
	background-position-x: -1000px;
	background-position-y: -200px;
}
#game_title{
	position: absolute;
    width: 100%;
    color: white;
    top: 30px;
    text-align: center;
    font-size: 30px;
}
#number{
	position: absolute;
    color: white;
    top: 10px;
    text-align: center;
    left:10px;
    font-size: 18px;
    visibility:hidden;
    line-height:40px;
}
#time_icon {
    background-image: url(../edit/images/play_time.svg);
    position: absolute;
    width: 150px;
    height: 45px;
    background-color: transparent;
    top: 60%;
    text-align: center;
    font-size: 30px;
    left: calc(50% - 150px);
    color: white;
    background-repeat: no-repeat;
    padding-left: 65px;
    line-height: 39px;
}
input#timeClock {
    background-color: transparent;
    border: none;
    font-family: "Courier";
    width: 100%;
    text-align: center;
    color: white;
    position: absolute;
    top: 60%;
    line-height: 42px;
    font-size: 30px;
    left: 110px;
}
#bottomBar {
	background-color: transparent;
	max-width: 100%;
	width: 640px;
	height: 60px;
	margin: 0px auto;
	/*border-radius: 25px 25px 0px 0px;
	-webkit-box-shadow: 2px 2px 5px gray;
	        box-shadow: 2px 2px 5px gray;*/
	z-index: 50;
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: flex;
	bottom:0px;
	display: block;
}
div#ansArea {
	-webkit-box-flex: 1;
	-webkit-flex: 1;
	   -moz-box-flex: 1;
	        flex: 1;
	width: 100%;
	height: 100%;
	position: relative;
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: flex;
	-webkit-justify-content: center;
	        -webkit-box-pack: center;
	           -moz-box-pack: center;
	        justify-content: center;
	-webkit-box-align: center;
	-webkit-align-items: center;
	   -moz-box-align: center;
	        align-items: center;
	-webkit-flex-wrap: wrap;
	        flex-wrap: wrap;
}
input#ansFill {
	height: 100%;
	-webkit-box-flex: 1;
	-webkit-flex: 1;
	   -moz-box-flex: 1;
	        flex: 1;
	width: 100%;
	border: none;
	font-size: 30px;
	color: transparent;
	background-color: transparent;
	position: absolute;
	-webkit-box-sizing: border-box;
	   -moz-box-sizing: border-box;
	        box-sizing: border-box;
	left:0px;
	padding:0px 20px;
	font-family: monospace,"微軟正黑體";
	text-align: center;
	margin: 0px 0px 0px 0px;
}
div#ansArea[length='0']>#ansFill {
	color: white;
	-webkit-box-shadow: none;
	        box-shadow: none;
}
input#ansFill:focus {
	color: white;
	-webkit-box-shadow: none;
	        box-shadow: none;
	outline:none;
}
.oneword {
	width: 35px;
	background: -webkit-linear-gradient(top,#c6c5c5,#6b6b6b);
	border: 0.5px solid #6f6f6f;
    border-radius: 3px;
    box-shadow: inherit;
    font-size: 25px;
    color: #404041;
}
.oneWord_title{
	font-size: 20px;
	color: #DEF0E1;
}
#sendBtn1{
	position: absolute;
	border: 0.5px solid #231F20;
    border-radius: 3px;
	right: calc(5% + 63px);
	bottom: 10px;
	width: 60px;
	height: 36px;
	cursor: pointer;
	background-repeat: no-repeat;
    background-position: 50%;
}
#menuBtn1{
	position: absolute;
	border: 0.5px solid #231F20;
	background: -webkit-linear-gradient(top,#808080 0%,#404041 100%);
    border-radius: 0px 3px 3px 0px;
	right: 5%;
	bottom: 10px;
	width: 60px;
	height: 36px;
	cursor: pointer;
	font-size: 16px;
    color: #DFE0E1;
    line-height: 38px;
    text-align: center;
}
#isSendBtn{
	font-size: 16px;
	color: #DFE0E1;
	background: -webkit-linear-gradient(top,#C53333 0%,#663333 66.7%);
	line-height: 36px;
	height: 36px;
    border-radius: 3px 0px 0px 3px;
}
#HintBtn1{
	position: absolute;
    border-radius: 3px;
	left: 5%;
	bottom: 10px;
	width: 100px;
	height: 36px;
	cursor: pointer;
	font-size: 16px;
    color: #DFE0E1;
    line-height: 38px;
    text-align: center;
    pointer-events:none;
}
#explain{
	position: absolute;
	bottom: 20px;
	left: calc(50% - 10px);
	z-index: 1;
}
.page {
    width: 20px;
    height: 20px;
    -webkit-box-flex: 1;
        -ms-flex: 1;
            flex: 1;
    cursor: pointer;
    position: relative;
    top: 5px;
    float: left;
}
#p1{
  background-image: url(images/play_button_V2.png);
  background-position-x: -270px;
}
#p2{
  background-image: url(images/play_button_V2.png);
  background-position-x: -270px;
}
#p3{
  background-image: url(images/play_button_V2.png);
  background-position-x: -270px;
}
#p1.use{
  background-position-x: -250px;
}
#p2.use{
  background-position-x: -250px;
}
#p3.use{
  background-position-x: -250px;
}
#stageSelect{
	position: absolute;
	top:90%;
    left:calc(50% - 62.5px);
}
#prevStage2, #nextStage2{
	width: 120px;
    height: 36px;
	border-radius: 2px;
	background: -webkit-linear-gradient(top,#808184 0%,#404041 100%);
    z-index: 99;
    color: #FFFFFF;
    text-align:center;
    line-height: 36px;
    font-size: 20px;
	/*opacity: 0.6;*/
	cursor: pointer;
}
@media all and (max-height: 800px) {
	.logo{
		zoom:0.6;
		padding-top: 120px;
		background-origin: content-box;
	}
}
@media all and (max-width: 550px) {
	#levelbox[style="visibility: hidden;"]~#time_icon{
		display: none;
	}
	#menuBtn1{
		right: 0%;
	}
	#sendBtn1{
		right: calc(0% + 60px);
	}
	.oneWord_title{
		display: none;
	}
}

</style>
</head>
<body>
	<div class='fullmain' stage="1">
		<div class='logoBackground'></div>
		<div class="logo">
			<div class="logotext">Easy Holiyo</div>
			<div class="logotext1">載入中，請稍後</div>
		</div>
		<!-- <div class="logo" onclick='startGame()'></div> -->
		<div id='loadingWait'>
			<div class="loader">
				<!-- <div class="timerWrap">
					<svg version="1.1" viewBox="131.623 175.5 120 160" preserveAspectRatio="xMinYMin meet" class="timer">
						<path fill="#FFFFFF" d="M212.922,255.45l36.855-64.492c1.742-3.069,1.742-6.836-0.037-9.896c-1.783-3.06-5.037-4.938-8.581-4.938
					h-99.158c-3.524,0-6.797,1.878-8.569,4.938c-1.773,3.06-1.792,6.827-0.03,9.896l36.846,64.491l-36.845,64.492
					c-1.762,3.068-1.743,6.836,0.03,9.896c1.772,3.061,5.044,4.938,8.569,4.938h99.158c3.544,0,6.798-1.878,8.581-4.938
					c1.779-3.06,1.779-6.827,0.037-9.896L212.922,255.45z M142.001,324.86l39.664-69.41l-39.664-69.41h99.158l-39.663,69.41
					l39.663,69.41H142.001z"></path>
					</svg>
				</div> -->
			</div>
		</div>
		<div id='imgArea'>
			<!-- <div class='text' id='uploadTitle'>上傳起始頁</div> -->
			<div id='imgbox'>
				<div id="typeDom" type='noimg' style="z-index:-1;">
					<div id='uploadbtn'>
						<div id='imgActive'></div>
						<input type='file' id='myuploadimg_intro'></input>
					</div>
					<sdiv id='cardimg'></sdiv>
				</div>
			</div>
			<div id='intro_NextBtn'>
				<div id='nextBtn'></div>
			</div>
		</div>
		
	</div>
	<div class="fullmain" stage="2" style='display:none'>
		<div id='imgArea' p1='false' p2='false' p3='false'>
			<div id="aboutGame" style='display:none'>
				<div id="aboutGameText" class='single-line'> </div>
			</div>
			<div id="nextPage" class="pagebtn" style="display: none">下一頁</div>
			<div id="prevPage" class="pagebtn" style="display: none">上一頁</div>
			<div id="explain">
		        <div id="p1" class="page use"></div>
		        <div id="p2" class="page" style="display: none"></div>
		        <div id="p3" class="page" style="display: none"></div>
		    </div>
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
		</div>
	</div>
	<div class="fullmain" stage="3" style='display:none'>
		<div id="somedialog" class="dialog">
			<div class="dialog__overlay"></div>
			<div class="dialog__content">
				<h2>
					<div id='hintImgList' type='noImg'></div>
				</h2>
				<div><button class="action" data-dialog-close></button></div>
			</div>
		</div>
		<div id="somedialog2" class="dialog">
			<div class="dialog__overlay"></div>
			<div class="dialog__content">
				<h2>
					<div id='alertMsg'>請先建立題目</div>
					<div id="dialogbg2"></div>
				</h2>
				<div><button class="action" data-dialog-close></button></div>
			</div>
		</div>
		<div id="somedialog3" class="dialog">
			<div class="dialog__overlay"></div>
			<div class="dialog__content">
				<h2>
					<div id='alertMsg3'>請先建立題目</div>
					<div id='dialogbg3'></div>
				</h2>
				<div><button class="action" data-dialog-close></button></div>
			</div>
		</div>
		<div id="somedialog4" class="dialog">
			<div class="dialog__overlay"></div>
			<div class="dialog__content">
				<h2>
					<div id='alertMsg4'>請先建立題目</div>
					<div id='dialogbg4'></div>
				</h2>
				<div><button class="action" data-dialog-close></button></div>
			</div>
		</div>
		<div id="somedialog5" class="dialog">
			<div class="dialog__overlay"></div>
			<div class="dialog__content">
				<h2>
					<div id='alertMsg5'>恭喜你！闖關成功！</div>
					<div id='dialogbg5'></div>
				</h2>
				<div><button class="action" data-dialog-close></button></div>
			</div>
		</div>

		<div id='imgArea'>
			<div id='topBar' style="display: none;">
				<div id='aboutTime'>
					<select id='timetype' disabled="disabled">
						<option val='grow'>進行時間</option>
						<option val='down'>剩餘時間</option>
					</select>
					<!-- <input id='timeClock' type='text' value="00:00" readonly pattern="[0-9]{2}:[0-9]{2}" maxlength="5" placeholder="mm:ss" time="0"/> -->
				</div>

				<div id="aboutGame">
					<div id="aboutGameText" class='single-line' > </div>
				</div>

				<div id='aboutSetting'>
					<div id='menuBtn'></div>
				</div>
			</div>
			<div id='quizList'>
				<div id='quizImg'>
					<div id='addImg' type='noimg'></div>
				</div>
				<div id='number'>題目</div>
				<div id='game_title'></div>
				<div id='levelBox'>
					<div>
						<div class="level open" id="level1" itemno="1"></div>
						<div class="level lock hide" id="level2" itemno="2"></div>
						<div class="level lock hide" id="level3" itemno="3"></div>
					</div>
					<div>
						<div class="level lock hide" id="level4" itemno="4"></div>
						<div class="level lock hide" id="level5" itemno="5"></div>
						<div class="level lock hide" id="level6" itemno="6"></div>
					</div>
				</div>
				<div id='time_icon'>進行時間：</div>
				<input id='timeClock' type='text' value="00:00" readonly pattern="[0-9]{2}:[0-9]{2}" maxlength="5" placeholder="mm:ss" time="0"/>
				<div id="stageSelect" style="display: flex;">
					<div id="prevStage2" style="margin-right: 10px;">回說明頁</div>
					<div id="nextStage2" style="display: none;">回結束頁</div>
				</div>
<!--
				<table id='levelBox'>
					<tr id='line1'>
						<td>
							<div class='level open' id='level1' itemno="1">
								<div class="deleteBtn"></div>
							</div>
						</td>
						<td>
							<div class='level lock none' id='level2' itemno="2">
								<div class="deleteBtn"></div>
							</div>
						</td>
						<td>
							<div class='level lock hide' id='level3' itemno="3">
								<div class="deleteBtn"></div>
							</div>
						</td>
					</tr>
					<tr id='line2'>
						<td>
							<div class='level lock hide' id='level4' itemno="4">
								<div class="deleteBtn"></div>
							</div>
						</td>
						<td>
							<div class='level lock hide' id='level5' itemno="5">
								<div class="deleteBtn"></div>
							</div>
						</td>
						<td>
							<div class='level lock hide' id='level6' itemno="6">
								<div class="deleteBtn"></div>
							</div>
						</td>
					</tr>
				</table>
-->
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
						<span id='isHintBtn' data-dialog="somedialog" class="trigger" ready="no">創建提示</span>
						<div id='setting'>
							<span id='hintLebel'>設定提示倒數</span>
							<!-- <div id='hintTime' contenteditable="true" onkeypress="return (this.innerText.length <= 5)">00:00</div> -->
							<input id="hintTime" type='text' value='30' maxlength=2  pattern="^[0-9]{1,2}$" placeholder="ss"/>
						</div>
					</div>
				</div>
				<div id='ansArea'>
					<input id='ansFill' maxlength="10"></input>
					<span class='oneWord_title'>作答：</span>
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
				<div id='sendBtn1'>
					<div id='isSendBtn'>確定</div>
					<div id='setting_send' style="display:none">
						<span id='sendLebel'>設定答題倒數</span>
						<!-- <div id='sendTime' contenteditable="true">00:00</div> -->
						<input id="sendTime" type='text' value='15' maxlength=2  pattern="^[0-9]{1,2}$" placeholder="ss"/>
					</div>
				</div>
				<div id='HintBtn1'>需要提示？</div>
				<div id='menuBtn1' onclick="openMenu()">離開</div>
			</div>

			<div id='level_NextBtn' style="display: none;">
				<div id='nextBtn'  disabled="disabled"></div>
			</div>
			<div id='level_PrevBtn' style="display: none;">
				<div id='prevBtn'></div>
			</div>
		</div>
	</div>
	<div  class="fullmain" stage="4"  style='display:none'>
		<div id='imgArea' type='showWiner'>
			<div id="winerPage" class="pagebtn" style='display:none'>切換為過關畫面</div>
			<div id="loserPage" class="pagebtn" style='display:none'>切換為失敗畫面</div>
			<div class='imgBox' no="1">
				<div id="winerImg" type='noimg'></div>
			</div>
			<div class='imgBox' no="2">
				<div id="loserImg" type='noimg'></div>
			</div>
			<div id='end_NextBtn'>
				<div id='nextBtn' disabled="disabled"></div>
			</div>
			<div id='end_PrevBtn'>
				<div id='prevBtn'></div>
			</div>
			<div id="bottomBar">
				<div id="clearTimeLabel">
					<span id='clearValue'>過關時間</span>: 
					<span id='clearTimeValue'>00:00</span>
				</div>
			</div>
	<!-- 		<div id='bottomOfText'>
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
</body>
<script type="text/javascript" src="../../js/jquery.cookie.js" ></script>
<script>
$('link[rel="stylesheet"][href="../css/game/helper.css"]').remove();
$('link[rel="stylesheet"][href="../css/game/main.css"]').remove();
$('link[rel="stylesheet"][href="../css/game/end.css"]').remove();
var nowNumber;
var getID = location.href.split('?')[1].split('&')[0].split('=')[1];
var data = location.href.split('?')[1].split('&')[1].split('=')[1];
// 判斷網址有誤
if (location.href.split('?')[1].split('&')[2] == undefined) {
	alert("網址錯誤!!")
}else{
	var fe = decodeURI(location.href.split('?')[1].split('&')[2].split('=')[1]);
}
var title = decodeURI(location.href.split('?')[1].split('&')[3].split('=')[1]);
//data: a00001505.4-MD5.A-MD5.1-MD5.4-MD5.A-MD5.1-MD5
//進行或倒帶 [a, b]
//倒數時間 0000s
//提示索 15s
//答題鎖 05s
//第一題答案文字數  3-47bce5c74f589f4867dbd57e9ca9f808(答案:aaa)
//第二題答案文字數  A-d2f2297d6e829cd3493aa7de4416a18f(答案:eee) [A表示長度為10]
//:
//第六題答案文字數  1-MD5(答案)
var alphaBit =		['x'  ,'o'  ,'n'  ,'u'  ,'v'   ,'c'  ,'e'  ];
var parallelArray = ["PNG","png","jpg","JPG","jpeg","gif","bmp"];
var file_array_list = new Array();
// function startGame(){
// 		debugger
	// $('.logo').fadeOut(2000,function(){
	// 		$('.logoBackground').css('-webkit-filter','blur(0px)');
	// 		$('.logoBackground').css('display','none');
	// 		$('#bottomOfText').show();
	// 		$('#typeDom').css('z-index','0');
	// 	});
// }
var gameID = "<%=id%>";
var count = 0;
var tm = setInterval(countDown,1000);
clearInterval(tm);
$('#game_title').text(title);
$(function() {
	// 新增玩遊戲數
	if ($.cookie("playNum") == null) {
		$.ajax({
			type:'GET',
			url:'action/loadData.jsp',
			data:{
				"planFlag" : 5,
				"gameID":gameID,
			}
		}).done(function(evt){
			$.cookie("playNum",gameID);
			console.log(evt.trim());
		})
	}else if ($.cookie("playNum") != gameID) {
		$.ajax({
			type:'GET',
			url:'action/loadData.jsp',
			data:{
				"planFlag" : 5,
				"gameID":gameID,
			}
		}).done(function(evt){
			$.cookie("playNum",gameID);
			console.log(evt.trim());
		})
	};
	
	$('#bottomOfText').hide();
	// FastClick.attach(document.body);
	//解決ipad 螢幕底部多20px 問題
	if(navigator.userAgent.match(/iPad;.*CPU.*OS 7_\d/i) && !window.navigator.standalone) {
		$('html').addClass('ipad ios7');
	}
	// 製作是否完成
	var feValue = location.search.split('&fe=')[1];
	// if (feValue.substring(feValue,feValue.indexOf('&title')).length != 18) {
	// 	alert("此遊戲未製作完成");
	// 	return;
	// }else{
		//初始畫面延遲兩秒後淡出
		// setTimeout(function (){
		// 	$('.logo').fadeOut(2000,function(){
		// 		$('.logoBackground').css('-webkit-filter','blur(0px)');
		// 		$('.logoBackground').css('display','none');
		// 		$('#bottomOfText').show();
		// 		$('#typeDom').css('z-index','0');
		// 	});
		// },1500);
	// }

	if(getID.length != 5 && getID.length != 8){
		//表示提供的code是不正確的，顯示錯誤訊息
		alert("沒有該遊戲ID");
	}
	else {
		//表示有提供code是正確的
		//先載入第一頁確定code是否正確
		var img = $('<img id="img0" style="display:none">');
		img.bind('load',function() {
			//code確實存在圖片，開始配置每張圖片
			startLoadEachImg(0);
			startLoadAns();
			//$('#aboutGameText').text(title);
			$('#aboutGame>#aboutGameText').text(title);
		})
		img.bind('error',function(){
			alert("根本ID是錯誤的");
		});

		var thisFe = fe[0];
		var getFe = "PNG";
		for(var e = 0; e<alphaBit.length; e++){
			if(thisFe == alphaBit[e]){
				getFe = parallelArray[e];
				break;
			}
		}
		img.attr('src', '/iTS5/service/file/game/'+getID+'/img0.'+getFe);
	}















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

	//stage1 :
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
	$('.fullmain[stage="2"] .page').bind('click', decidePage);

	$('.fullmain[stage="2"] #aboutGameText').bind('blur',reTextTitle);
	

	//stage3 :
	$('.fullmain[stage="3"] #aboutGameText').bind('blur',reTextTitle2);
	$('.fullmain[stage="3"] #menuBtn').bind('click', openMenu);
	$('.fullmain[stage="3"] .level').bind('click', whenClickLevel);
	$('.fullmain[stage="3"] .deleteBtn').bind('click', whenClickRemoveLevel);
	//$('.fullmain[stage="3"] #addImg').bind('click', upload_by_eachQuiz);
	//$('.fullmain[stage="3"] #hintImgList').bind('click', showHintBox);
	$('.fullmain[stage="3"] #nextBtn').bind('click', stage3_to_stage4);
	$('.fullmain[stage="3"] #prevBtn').bind('click', stage3_to_stage2);
	$('#prevStage2').bind('click', stage3_to_stage2);
	$('#nextStage2').bind('click', stage3_to_stage4);
	$('.fullmain[stage="3"] #timetype').on('change', select_change );
	$('.fullmain[stage="3"] #timeClock').on('blur', checkTimeFormat );
	$('.fullmain[stage="3"] #hintTime').on('blur', checkTimeFormat );
	$('.fullmain[stage="3"] #sendTime').on('blur', checkTimeFormat );
	$('.fullmain[stage="3"] #isSendBtn').bind('click', checkAnsIsCurrect)

	//stage4 :
	//$('.fullmain[stage="4"] #loserPage').bind('click', change2LoserPage);
	//$('.fullmain[stage="4"] #WinerPage').bind('click', change2WinerPage);
	//$('.fullmain[stage="4"] .imgBox').bind('click', upload_WinorLose_Img);
	$('.fullmain[stage="4"] #nextBtn').bind('click', stage4_to_stage5);
	$('.fullmain[stage="4"] #prevBtn').bind('click', stage4_to_stage3);
});


function startLoadEachImg(i){
	if(i>=18){
		//所有圖片都讀取完畢囉
		//初始畫面延遲兩秒後淡出
		setTimeout(function (){
			$('.logo').fadeOut(2000,function(){
				$('.logoBackground').css('-webkit-filter','blur(0px)');
				$('.logoBackground').css('display','none');
				$('#bottomOfText').show();
				$('#typeDom').css('z-index','0');
			});
		},1500);
		
		//開啟遮罩片
		$('#loadingWait').remove();
		$('.fullmain').attr('style','');
		init_stage1();
		return;
	}
	if(fe[i] == "-"){
		startLoadEachImg(i + 1);
		return;
	}

	var getFe = "PNG";
	for(var e = 0; e<alphaBit.length; e++){
		
		if(fe[i] == alphaBit[e]){
			getFe = parallelArray[e];
			break;
		}
	}

	file_array_list[i] = {};
	file_array_list[i]['imageUrl'] = "/iTS5/service/file/game/"+getID+"/img"+i+"."+getFe;

	var img = $('<img id="img'+i+'" style="display:none">');
	img.bind('load',function() {
		var imgIndex = this.id.split('img')[1] - 0;
		startLoadEachImg(imgIndex + 1);
	})
	img.bind('error',function(){
		var imgIndex = this.id.split('img')[1] - 0;
		file_array_list[imgIndex] = undefined;
		startLoadEachImg(imgIndex + 1);
	});
	img.attr('src', '/iTS5/service/file/game/'+getID+'/img'+i+'.'+getFe);
}
var getQuizList = [];
function startLoadAns(){
	var getTimeType = data.split('.')[0].substr(0,1);
	var getFullTime = data.split('.')[0].substr(1,4);
	var getHintTime = data.split('.')[0].substr(5,2);
	var getLockTime = data.split('.')[0].substr(7,2);
	for(var i =1; i<data.split('.').length; i++) {
		var getOneQuiz = data.split('.')[i]
		var ansLength  = getOneQuiz.split('-')[0];
		if(ansLength == "A")
			ansLength = 10;
		var ansMD5  = getOneQuiz.split('-')[1];
		getQuizList.push({'ansLength':ansLength, 'ansMD5':ansMD5});
	}

	//設定是進行時間還是倒數時間
	if(getTimeType == "a") {
		$('#timetype>option')[0].selected = true;

	}
	else if(getTimeType == "b"){
		$('#timetype>option')[1].selected = true;
		var temp = [getFullTime.slice(0,2),':',getFullTime.slice(2)].join('');
		var mm = getFullTime.substr(0,2);
		var ss = getFullTime.substr(2,2);
		var time = parseInt(mm*60) + parseInt(ss);
		$('#timeClock').attr('time', time);
		$('#timeClock').val(temp);
		$('#time_icon').text('倒數計時：');
	}

	//設定提示倒數時間
	$('#hintTime').val(getHintTime);
	//設定答題鎖
	$('#sendTime').val(getLockTime);

}
function init_stage1(){
	var imgURL = file_array_list[0].imageUrl;
	$('.fullmain[stage="1"] #cardimg').css('background-image','url("'+imgURL+'")');
	$('.fullmain[stage="1"] #typeDom').attr('type','hasimg');
	//移除可以砍掉圖的按鈕
	$('.fullmain[stage="1"] #uploadbtn').remove();
	//開啟右側按鈕
	$('.fullmain[stage="1"] #nextBtn').removeAttr('disabled');
}

function stage1_to_stage2() {
	$('link[rel="stylesheet"][href="../css/game/intro.css"]').attr('href', '../css/game/helper.css');
//	$('link[rel="stylesheet"][href="css/intro.css"]').remove();
//	$('head').append("<link rel='stylesheet' href='css/helper.css'></link>");
	init_stage2();
	controlArrow()
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
	var k = $(".fullmain[stage='2'] #aboutGameText").text();
	$(".fullmain[stage='3'] #aboutGameText").text(k);
	$.cookie('playNum',null);
}
var clearStage = 0;
function stage3_to_stage4() {
	// $('link[rel="stylesheet"][href="../css/game/main.css"]').attr('href', '../css/game/end.css');
	$('#nextStage2').css('display','');
	$('#stageSelect').css('left','calc(50% - 125px)')
	timeIsStop = true;
	if($('.fullmain[stage="4"] #imgArea').attr('type')=='showloser' &&  file_array_list[17] == null){
		$('#dialogbg5').css('background-position-x','-500px');
		$('#somedialog5 .dialog__content').css('background','-webkit-linear-gradient(-39.5deg,#58595B 0%,#404041 66.7%)');
		$('#alertMsg5').html('闖關失敗！請再接再厲<br>時間結束');
	}else if($('.fullmain[stage="4"] #imgArea').attr('type')=='showloser' &&  file_array_list[17] != null){
		$('#dialogbg5').css({'background-image':'url("'+file_array_list[17].imageUrl+'")','background-size':'contain','background-position':'50%','width':'100%','height':'100%','padding-bottom':'0px'});
		$('#somedialog5 .dialog__content').css({'background':'-webkit-linear-gradient(top,#C5C592,#849280','height':'500px','width':'850px'});
		 $('#alertMsg5').html('');
	}else if($('.fullmain[stage="4"] #imgArea').attr('type')=='showWiner' &&  file_array_list[16] != null){
		$('#dialogbg5').css({'background-image':'url("'+file_array_list[16].imageUrl+'")','background-size':'contain','background-position':'50%','width':'100%','height':'90%','padding-bottom':'0px','bottom':'inherit'});
		$('#somedialog5 .dialog__content').css({'background':'-webkit-linear-gradient(top,#C5C592,#849280','height':'500px','width':'850px'});
		if(getTimeType == 'a'){
			$('#alertMsg5').html('完成時間：' + $('#timeClock').val()).css({'top':'92%','z-index':'1'});
		}else{
			$('#alertMsg5').html('剩餘時間：' + $('#timeClock').val()).css({'top':'92%','z-index':'1'});
		}
	}else{
		var getTimeType = data.split('.')[0].substr(0,1);
		if(getTimeType == 'a'){
			$('#alertMsg5').html('恭喜你！闖關成功！<br>完成時間：' + $('#timeClock').val());
		}else{
			$('#alertMsg5').html('恭喜你！闖關成功！<br>剩餘時間：' + $('#timeClock').val());
		}
	}
	var alertMsg5 = new DialogFx( $('#somedialog5')[0] , {'onCloseDialog': function(){
		$('#menuBtn').click();
		$('#level_NextBtn').hide();
		$('#isSendBtn').unbind("click");
	}});
	alertMsg5.toggle();
	if(file_array_list[16] != undefined) {
		$('#winerImg').css('background-image','url("'+file_array_list[16].imageUrl+'")');
		$('#winerImg').attr('type', 'hasimg')
	}
	if(file_array_list[17] != undefined) {
		$('#loserImg').css('background-image','url("'+file_array_list[17].imageUrl+'")');
		$('#loserImg').attr('type', 'hasimg')
	}

	//放置過關時間
	$('#clearTimeValue').text($('#timeClock').val());
	//清除滑鼠手勢
	$('.fullmain[stage="4"] .imgBox').css('cursor', 'auto');

	console.log("123");
}
function stage3_to_stage2() {
	$('link[rel="stylesheet"][href="../css/game/main.css"]').attr('href', '../css/game/helper.css');
}
function stage4_to_stage5() {
	console.log("OVER");
}
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

	if(file_array_list[1] != undefined){
		//第一頁有說明內容
		var imgURL = file_array_list[1].imageUrl;
		$('.fullmain[stage="2"] #cardimg1').css('background-image','url("'+imgURL+'")');
		$('.fullmain[stage="2"] #typeDom1').attr('type','hasimg');
		$('.fullmain[stage="2"] #imgArea').attr('p1','true');

		if(file_array_list[2] != undefined){
			//第二頁有說明內容
			var imgURL = file_array_list[2].imageUrl;
			$('.fullmain[stage="2"] #cardimg2').css('background-image','url("'+imgURL+'")');
			$('.fullmain[stage="2"] #typeDom2').attr('type','hasimg');
			$('.fullmain[stage="2"] #imgArea').attr('p2','true');
			$('#p2').css('display','');
			$('#explain').css('left','calc(50% - 20px)');

			if(file_array_list[3] != undefined){
				//第三頁有說明內容
				var imgURL = file_array_list[3].imageUrl;
				$('.fullmain[stage="2"] #cardimg3').css('background-image','url("'+imgURL+'")');
				$('.fullmain[stage="2"] #typeDom3').attr('type','hasimg');
				$('.fullmain[stage="2"] #imgArea').attr('p3','true');
				$('#p3').css('display','');
				$('#explain').css('left','calc(50% - 30px)');
			}

		}
		else {
			//第二頁沒有值
			if(file_array_list[3] != undefined){
				//但是第三頁有說明內容
				file_array_list[2] = file_array_list[3];
				file_array_list[3] = undefined;

				var imgURL = file_array_list[2].imageUrl;
				$('.fullmain[stage="2"] #cardimg2').css('background-image','url("'+imgURL+'")');
				$('.fullmain[stage="2"] #typeDom2').attr('type','hasimg');
				$('.fullmain[stage="2"] #imgArea').attr('p2','true');
				$('#p2').css('display','');
				$('#explain').css('left','calc(50% - 20px)');
			}
		}

	}
	else {
		//說明頁第一頁是空的
		if(file_array_list[2] != undefined){
			//但是第二頁有值，移到第一頁來
			file_array_list[1] = file_array_list[2];
			file_array_list[2] = undefined;

			var imgURL = file_array_list[1].imageUrl;
			$('.fullmain[stage="2"] #cardimg1').css('background-image','url("'+imgURL+'")');
			$('.fullmain[stage="2"] #typeDom1').attr('type','hasimg');
			$('.fullmain[stage="2"] #imgArea').attr('p1','true');
		}
		else {
			//第二頁也沒有值
			if(file_array_list[3] != undefined) {
				//但是第三頁卻有值
				file_array_list[1] = file_array_list[3];
				file_array_list[3] = undefined;

				var imgURL = file_array_list[1].imageUrl;
				$('.fullmain[stage="2"] #cardimg1').css('background-image','url("'+imgURL+'")');
				$('.fullmain[stage="2"] #typeDom1').attr('type','hasimg');
				$('.fullmain[stage="2"] #imgArea').attr('p1','true');
			}
		}	

	}
	
	$('.fullmain[stage="2"] .uploadbtn').remove();



	nowNumber=$('.nowPoint').attr('no');
	$('.fullmain[stage="2"] #prevPage').css('display','none');
	$('.fullmain[stage="2"] #nextPage').css('display','none');
}
function init_stage3() {
	if(file_array_list[4]!=undefined) {
		$($('.level')[0]).removeClass('lock').addClass('open');
		$($('.level')[1]).removeClass('none');
	}
	if(file_array_list[6]!=undefined){
		$($('.level')[1]).removeClass('lock').addClass('open');
		$($('.level')[1]).removeClass('hide');
	}
	if(file_array_list[8]!=undefined){
		$($('.level')[2]).removeClass('lock').addClass('open');
		$($('.level')[2]).removeClass('hide');
	}
	if(file_array_list[10]!=undefined){
		$($('.level')[3]).removeClass('lock').addClass('open');
		$($('.level')[3]).removeClass('hide');
	}
	if(file_array_list[12]!=undefined){
		$($('.level')[4]).removeClass('lock').addClass('open');
		$($('.level')[4]).removeClass('hide');
	}
	if(file_array_list[14]!=undefined){
		$($('.level')[5]).removeClass('lock').addClass('open');
		$($('.level')[5]).removeClass('hide');
	}
	//修改time高度
	if($('.level.open').length >= 4){
		$('#time_icon').css('top','80%');
		$('#timeClock').css('top','80%');
	}
	for(var i = $('.level.open').length; i < 6; i++){
		$($('.level')[$('.level.open').length]).remove();
	}

	$('.fullmain[stage="3"] .deleteBtn').remove();
	$('#isHintBtn').text('提示').css('line-height', '48px');


	if(firstRun && $('#timetype>option:selected').attr('val') == "grow")
		TimeAdding("timeClock");
	else if (firstRun && $('#timetype>option:selected').attr('val') == "down") 
		TimeMinse("timeClock");
}
var firstRun = true;
var timeIsStop = false;
var lastSync = 0;
var firstTimeEnter = true;
function TimeAdding(dom){
	if(timeIsStop){
		return;
	}
	var getNowTime = $('#'+dom).attr('time');
	var getNowTimeString = formatTime(getNowTime);
	// $('#'+dom).attr('time', getNowTime - 0 + 1);
	// $('#'+dom).val(getNowTimeString);

	setTimeout( "TimeAdding('"+dom+"')", 1000);
	//解決休眠狀態無法計時
	var now = new Date().getTime();
	if (firstTimeEnter) {
		firstTimeEnter = false;
		lastSync = new Date().getTime();
	}else{
		if (now-lastSync != getNowTime) {
			// 毫秒換算成秒
			var timeDifference = Math.round((now-lastSync)/1000);
			$('#'+dom).attr('time', getNowTime - 0 + timeDifference);
			$('#'+dom).val(getNowTimeString);
			lastSync = new Date().getTime();
			firstRun = false;
		};
	}
	
	
}
function TimeMinse(dom){
	if(timeIsStop){
		return;
	}
	var getNowTime = $('#'+dom).attr('time');

	if(parseInt(getNowTime)<= 0){
		
		$('.fullmain[stage="3"] #imgArea').addClass('fullClear');
		$('.fullmain[stage="4"] #imgArea').attr('type', 'showloser');
		$('#end_PrevBtn').hide();
		$('#clearTimeLabel').remove();
		stage3_to_stage4();
		return;
	}

	var getNowTimeString = formatTime(getNowTime);
	// $('#'+dom).attr('time', getNowTime - 1);
	// $('#'+dom).val(getNowTimeString);

	setTimeout( "TimeMinse('"+dom+"')", 1000);

	//解決休眠狀態無法計時
	var now = new Date().getTime();
	var getNowTime = $('#'+dom).attr('time');
	if (firstTimeEnter) {
		firstTimeEnter = false;
		lastSync = new Date().getTime();
		
	}else{
		if (now-lastSync != getNowTime) {
			// 毫秒換算成秒
			var timeDifference = Math.round((now-lastSync)/1000);
			$('#'+dom).attr('time', getNowTime - timeDifference);
			$('#'+dom).val(getNowTimeString);
			lastSync = new Date().getTime();
			firstRun = false;
		};
	}
	
}

function upload_by_intro(evt){
	files = evt.target.files[0];//找到第一筆資料
	var eachfile = files;
	var fileExtension=$(files.name.split('.')).get(-1);//找檔案type;
	if(fileExtension =='PNG' || fileExtension =='JPG' || fileExtension =='BMP' ||
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
	if(fileExtension =='PNG' || fileExtension =='JPG' || fileExtension =='BMP' ||
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
	var fileclick = $('#myuploadimg');
	fileclick.replaceWith(fileclick=fileclick.clone(true))
	$('#imgbox>div').attr('type', 'noimg');
	$('#cardimg').attr('style','');
	file_array_list[0]=undefined;
	$('.fullmain[stage="1"] #nextBtn').attr('disabled', 'disabled');
}
function removeImg_helper(evnet){
	var fileclick = $('.imgBox[no="'+parseInt(nowNumber)+'"]').find('.myuploadimg');
	
	fileclick.replaceWith(fileclick=fileclick.clone(true));
	$('#typeDom'+nowNumber).attr('type', 'noimg');
	$('#cardimg'+nowNumber).attr('style','');
	//$('#typeDom'+nowNumber).find('.cardimg').attr('src','');
	$('#imgArea').attr('p'+nowNumber,'false');
	file_array_list[parseInt(nowNumber)]=undefined;
	controlArrow();
}
function select_change(){
	if($(event.target).prop('value') == "剩餘時間") {
		$('#timeClock').prop('readonly', false);
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

var alertMsg2 = new DialogFx( $('#somedialog3')[0] , {'onCloseDialog': function(){
	$('#menuBtn').click();
	$('#level2').click();
}});
var alertMsg3 = new DialogFx( $('#somedialog4')[0] , {'onCloseDialog': function(){
	// $('#sendBtn').attr('type', 'lock');
	// var count = $('#sendTime').val();
	// setTimeout(function(){
	// 	$('#isSendBtn').text("確定");
	// 	$('#isSendBtn').css('opacity','1');
	// 	$('#isSendBtn').bind('click', checkAnsIsCurrect);
	// 	count = $('#sendTime').val();
	// 	$('#sendBtn1').attr('style','');
	// }, parseInt($('#sendTime').val()) * 1000);
	// // $('#isSendBtn').text("");
	// $('#isSendBtn').unbind("click");
	// for (var i = 0; i < parseInt($('#sendTime').val()); i++) {
	// 	debugger
	// 	setTimeout(function(){
	// 		$('#sendBtn1').css('background-image','url(images/play_lock.svg)');
	// 		count--;
	// 		// $('#isSendBtn').text('倒數:'+count);
	// 		$('#isSendBtn').text("");
	// 		$('#isSendBtn').css('opacity','0.5');
	// 	}, parseInt(i) * 1000);
	// }
	$('#sendBtn').attr('type', 'lock');
	$('#sendBtn1').css('background-image','url(images/play_lock.svg)');
	$('#isSendBtn').text("");
	$('#isSendBtn').css('opacity','0.5');
	$('#isSendBtn').unbind("click");
	var count = $('#sendTime').val();
	setTimeout(function(){
		$('#isSendBtn').text("確定");
		$('#isSendBtn').css('opacity','1');
		$('#isSendBtn').bind('click', checkAnsIsCurrect);
		count = $('#sendTime').val();
		$('#sendBtn1').attr('style','');
	}, parseInt($('#sendTime').val()) * 1000);
}});

function checkAnsIsCurrect() {
	var stuAns = $('#ansArea').attr('ansstring');
	var nowQuiz = $('#quizImg').attr('itemno') - 1;
	var getAnsHerfStr = fullToHalf(stuAns.toLowerCase());

	if( CryptoJS.MD5(stuAns).toString() == getQuizList[nowQuiz].ansMD5 || CryptoJS.MD5(getAnsHerfStr).toString() == getQuizList[nowQuiz].ansMD5) {
		console.log('這題答對啦');
		if(navigator.userAgent.match('HTC_Flyer')){
			alert('恭喜答對啦');
			getQuizList[nowQuiz].currect = "yes";
			$($('.level')[nowQuiz]).addClass('clear');
			$('#menuBtn').click();
		}
		else{
			$('#alertMsg3').html('恭喜！<br>你答對了');
			getQuizList[nowQuiz].currect = "yes";
			$($('.level')[nowQuiz]).addClass('clear');
			alertMsg2.toggle();	
		}
	}
	else {
		if(navigator.userAgent.match('HTC_Flyer')){
			alert('你答錯啦');
			getQuizList[nowQuiz].currect = "no";
			$($('.level')[nowQuiz]).addClass('clear');
			$('#sendBtn').attr('type', 'lock');
			setTimeout(function(){
			$('#sendBtn').attr('type', '');
			$('#isSendBtn').text("確定");
			}, parseInt($('#sendTime').val()) * 1000);
			$('#isSendBtn').text("");
		}
		else{
			console.log('這題答錯啦');
			$('#alertMsg4').html('歐歐！<br>你答錯了');
			getQuizList[nowQuiz].currect = "no";
			$($('.level')[nowQuiz]).removeClass('clear');
			alertMsg3.toggle();	
		}
	}
	if ($('.fullmain[stage="3"]>#imgArea').hasClass('fullClear')) {
		$('#isSendBtn').css('pointer-events','none')
	}
//	debugger
}

function controlArrow(){
//控制箭號要不要顯示
	var nowNumber = $('.nowPoint').attr('no');
	var typeFlag=$('#typeDom'+nowNumber).attr('type');
	p1Flag=$('.fullmain[stage="2"] #imgArea').attr('p1');
	p2Flag=$('.fullmain[stage="2"] #imgArea').attr('p2');
	p3Flag=$('.fullmain[stage="2"] #imgArea').attr('p3');
	if(nowNumber>3){
		console.log("It's no possible!");
		return
	}
	// else if(nowNumber==1){
	// 	$('.fullmain[stage="2"] #prevPage').css('display','none');
	// 	if(p2Flag=='true'){
	// 		$('.fullmain[stage="2"] #nextPage').css('display','');
	// 	}
	// 	else {
	// 		$('.fullmain[stage="2"] #nextPage').css('display','none');
	// 	}
	// }
	// else if(nowNumber==2){
	// 	$('.fullmain[stage="2"] #prevPage').css('display','');
	// 	if(p3Flag=='true'){
	// 		$('.fullmain[stage="2"] #nextPage').css('display','');
	// 	}
	// 	else{
	// 		$('.fullmain[stage="2"] #nextPage').css('display','none');
	// 	}	
	// }
	// else if(nowNumber==3){
	// 	$('.fullmain[stage="2"] #prevPage').css('display','');
	// 	$('.fullmain[stage="2"] #nextPage').css('display','none');
	// }

	// if(p1Flag=='true' || p2Flag=='true' || p3Flag=='true'){
		$('.fullmain[stage="2"] #nextBtn').removeAttr('disabled');
	// }
	// else {
		// $('.fullmain[stage="2"] #nextBtn').attr('disabled', 'disabled');
	// }
}
function prevPage(){
	nowNumber=$('.nowPoint').attr('no');
	if(nowNumber<=3 && nowNumber>1){
		prevNumber=parseInt(nowNumber)-1;
		$('.fullmain[stage="2"] .imgBox[no="'+parseInt(nowNumber)+'"]').css('display','none');
		$('.fullmain[stage="2"] .imgBox[no="'+prevNumber+'"]').attr('style', "display:-webkit-flex,display:flex");
		$('.fullmain[stage="2"] .imgBox[no="'+parseInt(nowNumber)+'"]').removeClass('nowPoint');
		$('.fullmain[stage="2"] .imgBox[no="'+prevNumber+'"]').addClass('nowPoint');
		//debugger
		nowNumber=$('.nowPoint').attr('no');
		controlArrow();
	}
}

function nextPage(){
	nowNumber=$('.nowPoint').attr('no');
	nextNumber=parseInt(nowNumber)+1;

	if(nowNumber<3){
		$('.fullmain[stage="2"] .imgBox[no="'+parseInt(nowNumber)+'"]').css('display','none');
		$('.fullmain[stage="2"] .imgBox[no="'+nextNumber+'"]').attr('style', "display:-webkit-flex,display:flex");
		$('.fullmain[stage="2"] .imgBox[no="'+parseInt(nowNumber)+'"]').removeClass('nowPoint');
		$('.fullmain[stage="2"] .imgBox[no="'+nextNumber+'"]').addClass('nowPoint');

		nowNumber=$('.nowPoint').attr('no');
		controlArrow();
		//debugger
	}
}
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

function openMenu(){
	$('#levelBox').css('visibility','visible');
	$('#prevStage2').css('visibility','visible');
	$('#nextStage2').css('visibility','visible');
	$('#quizImg').css('visibility', 'hidden');
	$('#number').css('visibility', 'hidden');
	$('#game_title').css('top','30px');
	clearInterval(tm);
	$('#HintBtn1').text('需要提示？');
	$('#HintBtn1').css('opacity','1');
	$('#HintBtn1').css('pointer-events','auto');
	if($('.level.open').length >= 4){
		$('#time_icon').css({'top':'80%','left':'calc(50% - 150px)','right':'inherit','background-image':'url(../edit/images/play_time.svg)','font-size':'30px','line-height':'42px'});
		$('#timeClock').css({'top':'80%','left':'110px','right':'inherit','text-align':'center','font-size':'30px','line-height':'40px'});
	}else{
		$('#time_icon').css({'top':'60%','left':'calc(50% - 150px)','right':'inherit','background-image':'url(../edit/images/play_time.svg)','font-size':'30px','line-height':'42px'});
		$('#timeClock').css({'top':'60%','left':'110px','right':'inherit','text-align':'center','font-size':'30px','line-height':'40px'});
	}
	// showGoStage();
	// $('#level_PrevBtn').hide();
	//關卡頁面的文字，開啟關卡頁時讓底部文字出現
	$('.fullmain[stage="3"] #bottomOfText').attr('style','');
	//修改底部按鈕狀態
	$('#bottomBar').attr('stage','stagelist');

	//儲存作答紀錄
	var quizIndex = ($('#quizImg').attr('itemno')- 0)*2 + 3 - 1;
	if(file_array_list[quizIndex] != undefined){
		file_array_list[quizIndex].quizAns = $('#ansArea').attr('ansstring');
	}

	//是否顯示下一題
	checkCanGoNextStage();
}
function checkCanGoNextStage() {
	var a = $('.level:not(".none,.hide")').length;
	var allCurrect = true;
	for(var i = 0; i<a; i++) {
		if(getQuizList[i].currect == 'no' || getQuizList[i].currect == undefined){
			allCurrect = false;
		}
	}


	if(allCurrect && $('.fullClear').length<1){
		// $('.fullmain[stage="3"] #nextBtn').removeAttr('disabled');

		if($('#timetype>option:selected').attr('val') == 'down'){
			$('#clearValue').text("剩餘時間");
		}


		stage3_to_stage4();
		$('.fullmain[stage="3"] #imgArea').addClass('fullClear');
	}
	else if($('.fullClear').length == 1 && allCurrect){
		$('.fullmain[stage="3"] #nextBtn').removeAttr('disabled');
	}
	else {
		$('.fullmain[stage="3"] #nextBtn').attr('disabled', 'disabled');
		$('.fullmain[stage="3"] #nextBtn').parent().css('display', 'none');
	}
}
var hinttime ="";
var hintInterval = "";
function whenClickLevel(){
	var clickObject = event.currentTarget;
	if(	$(clickObject).hasClass('none') ){
		$(event.target).removeClass('none');
		$('.level.hide').first().removeClass('hide').addClass('none');

		var itemno = $(event.target).attr('itemno');
		if(itemno == 1) {
			$($('.level')[0]).removeClass('lock').addClass('open');
		}
	}
	else if( $(clickObject).hasClass('lock') ){

	}
	else if( $(clickObject).hasClass('open') ){
		$('#levelBox').css('visibility','hidden');
		$('#quizImg').css('visibility', 'visible');
		$('#prevStage2').css('visibility','hidden');
		$('#nextStage2').css('visibility','hidden');
		$('#game_title').css('top','10px');
		$('#time_icon').css({'top':'10px','left':'inherit','right':'70px','background-image':'url()','font-size':'18px','line-height':'39px'});
		$('#timeClock').css({'top':'10px','left':'inherit','right':'15px','text-align':'right','font-size':'18px','line-height':'37px'});
		//關卡頁面的文字，開啟題目時候就不要出現底部文字
		$('.fullmain[stage="3"] #bottomOfText').css('display','none');
		var itemno = $(event.target).attr('itemno');
		//題目x
		$('#number').text('題目'+itemno).css('visibility','visible');
		$('#quizImg').attr('itemno', itemno);
		var realFileIndex = (itemno - 0)*2 + 3 - 1;
		if(file_array_list[realFileIndex] != undefined) {
			//過去已經有上傳過圖片檔了
			$('#addImg').css('background-image', 'url('+file_array_list[realFileIndex].imageUrl+')');
			$('#addImg').attr('type','hasimg');

			if(file_array_list[realFileIndex].quizAns != undefined){
				$('#ansArea').attr('ansstring', file_array_list[realFileIndex].quizAns);

				$('#ansFill').attr('maxlength', getQuizList[itemno-1].ansLength);

				setAns(file_array_list[realFileIndex].quizAns);
			}
			else {
				$('#ansFill').attr('maxlength', getQuizList[itemno-1].ansLength);
				$('#ansArea').attr('ansstring', '');
				setAns('');
			}
			if (!$('.fullmain[stage="3"]>#imgArea').hasClass('fullClear') && !$(clickObject).hasClass('clear')) {
				count = $('#hintTime').val()-1;
				$('#HintBtn1').text('等待提示:'+count);
				$('#HintBtn1').css({'opacity':'0.5','pointer-events':'none'});
				tm = setInterval(countDown,1000);
			}else{
				clearInterval(tm);
				$('#HintBtn1').text('需要提示？');
				$('#HintBtn1').css('opacity','1');
				$('#HintBtn1').css('pointer-events','auto');
			}
		}
		else {
			$('#addImg').attr('style','').attr('type','noimg');
			$('#ansArea').attr('ansstring', '');
			setAns('');
		}

		hideGoStage();

		//修改底部按鈕狀態
		$('#bottomBar').attr('stage','onequiz');

		if($('.fullClear').length != 1) {
			hintInterval = setTimeout(function(){
				$('#isHintBtn').attr('ready','yes');
				clearInterval(tm);
				$('#HintBtn1').text('需要提示？');
				$('#HintBtn1').css('opacity','1');
				$('#HintBtn1').css('pointer-events','auto');
				s1 = -5, s2=6.5;
			},($('#hintTime').val()-1)*1000);
			$('#isHintBtn').attr('ready','no');
			s1 = 15, s2=3;
		}
		else {
			$('#isHintBtn').attr('ready','yes');
			clearInterval(tm);
			$('#HintBtn1').text('需要提示？');
			$('#HintBtn1').css('opacity','1');
			$('#HintBtn1').css('pointer-events','auto');
			s1 = -5, s2=6.5;	
		}
		
		if( $($('.level')[itemno - 1]).hasClass('clear') ) { //該題過關
			$('.fullmain[stage="3"] #imgArea').addClass('thisClear');
			s1 = -5, s2=6.5;
			$('#isHintBtn').attr('ready','yes');
			clearInterval(tm);
			$('#HintBtn1').text('需要提示？');
			$('#HintBtn1').css('opacity','1');
			$('#HintBtn1').css('pointer-events','auto');
		}
		else {
			$('.fullmain[stage="3"] #imgArea').removeClass('thisClear');
			s1 = 15, s2=3;
			$('#isHintBtn').attr('ready','no');
		}
	}
	//css變更
	$('#quizList>#quizImg').css('height','100%');
	$('#quizList>#quizImg').css('top','0px');
	checkCanGoNextStage();
}
function countDown(){
	count--;
	$('#HintBtn1').text('等待提示:'+count);
	$('#HintBtn1').css({'opacity':'0.5','pointer-events':'none'});
	if(count == 0){
		clearInterval(tm);
		$('#HintBtn1').text('需要提示？');
		$('#HintBtn1').css('opacity','1');
		$('#HintBtn1').css('pointer-events','auto');
	}
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
		$('.level.open').last().removeClass('open').addClass('lock');
	}
	checkCanGoNextStage();
	event.stopPropagation();
}

function upload_by_eachQuiz() {
	if($('#forSelectFile').length==0)
		$('body').append("<input type='file' id='forSelectFile' onchange='selectNewfile()'>");
	$('#forSelectFile').click();
}
function selectNewfile(evt){
	var  itemIndex = ( $('#quizImg').attr('itemno') - 0 )*2 + 3 - 1;
	files = event.target.files[0];//找到第一筆資料
	if(files == undefined){
		return;
	}

	var eachfile = files;
	var fileExtension=$(files.name.split('.')).get(-1);//找檔案type;
	if(fileExtension =='PNG' || fileExtension =='JPG' || fileExtension =='BMP' ||
		fileExtension =='png' || fileExtension =='jpg' || fileExtension =='bmp' || fileExtension =='gif') {
		var reader = new FileReader();
		reader.onload=function(e) {
			//$('#cardimg').attr('src', e.target.result);
			$('.fullmain[stage="3"] #quizImg>#addImg').css({'background-image':'url('+e.target.result+')','background-size':'contain','background-position':'50%','background-repeat':'no-repeat','height':'100%'});
			$('.fullmain[stage="3"] #quizImg>#addImg').attr('type', 'hasimg');
			objectID = guid();
			//file_array_list.push(files);
			file_array_list[itemIndex] = files;
			file_array_list[itemIndex].imageUrl = e.target.result;

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

		$('#m2>.ball_outside>.ball').css('transform','translate('+s1+'px, -5px) scale('+s2+')');
	}
	setTimeout('rotateBall()', 1000);
}
var s1 = 15;
var s2 = 3;

function showHintBox(){
	var  itemIndex = ( $('#quizImg').attr('itemno') - 0 )*2 + 3 ;
	if($('#forSelectHintFile').length==0)
		$('body').append("<input type='file' id='forSelectHintFile' onchange='selectNewHintfile()'>");
	$('#forSelectHintFile').click();




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
function selectNewHintfile(){
	var  itemIndex =  ( $('#quizImg').attr('itemno') - 0 )*2  + 3 ;
	files = event.target.files[0];//找到第一筆資料
	if(files == undefined){
		return;
	}
	var eachfile = files;
	var fileExtension=$(files.name.split('.')).get(-1);//找檔案type;
	if(fileExtension =='PNG' || fileExtension =='JPG' || fileExtension =='BMP' ||
		fileExtension =='png' || fileExtension =='jpg' || fileExtension =='bmp' || fileExtension =='gif') {
		var reader2 = new FileReader();
		reader2.onload=function(e) {
			//$('#cardimg').attr('src', e.target.result);
			$('.fullmain[stage="3"] #hintImgList').css({'background-image':'url('+e.target.result+')'});
			file_array_list[itemIndex] = files;
			file_array_list[itemIndex].imageUrl = e.target.result;
			$('.fullmain[stage="3"] #hintImgList').attr('type', 'hasimg')
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
			$('.oneWord_title').css('visibility','hidden');
			for(var i= 0; i<$('.oneWord').length; i++){
				$($('.oneWord')[i]).addClass('ishide');
			}
		}
	})
	$('#ansFill').bind('blur', function(){
		$('.oneWord_title').css('visibility','visible');
		var temp = $('#ansFill').val().trim();
		setAns(temp);
	})

function setAns(answer){
	$('#ansArea').attr('ansstring', answer);
	$('#ansArea').attr('length', answer.length);
	$('#ansArea>input').val(answer);

	var maxAnsLength = $('#ansFill').attr('maxlength');

	$('.oneWord').addClass('ishide');
	$('.oneWord').text('');
	for(var i= 0; i<maxAnsLength; i++){
		$($('.oneWord')[i]).removeClass('ishide');

		if(answer[i] != undefined){
			$($('.oneWord')[i]).text(answer[i]);
		}
	}
}

	//設定dialog可跳出
	var dlg = new DialogFx( $('#somedialog')[0] , {'onCloseDialog': function(){
		// var count = $('#hintTime').val();
		// setTimeout(function(){
		// 	$('#HintBtn1').text('需要提示？');
		// 	$('#HintBtn1').css('opacity','1');
		// 	$('#HintBtn1').css('pointer-events','auto');
		// }, parseInt($('#hintTime').val()) * 1000);
		// // $('#isSendBtn').text("");
		// $('#HintBtn1').css('pointer-events','none');
		// for (var i = 0; i < parseInt($('#hintTime').val()); i++) {
		// 	setTimeout(function(){
		// 		count--;
		// 		$('#HintBtn1').text('等待提示:'+count);
		// 		$('#HintBtn1').css('opacity','0.5');
		// 	}, parseInt(i) * 1000);
		// }
	}});
	var hintmsgnum = 0;
	var oldhintIndex ;
	$('#HintBtn1').bind( 'click', function () {
		// if(s1!=-5 && s2!=6.5)
		// 	return;
		var quizIndex = ($('#quizImg').attr('itemno') - 0)*2 + 3 - 1;
		if(file_array_list[quizIndex] == undefined){
			$('#alertMsg').text('請先建立題目');
			alertMsg.toggle();
			//alert("請先建立題目再建立提示");
		}
		else {
			var hintIndex = ($('#quizImg').attr('itemno') - 0)*2 + 3;
			if(navigator.userAgent.match('HTC_Flyer')){
				var hintmsg = ["你的載具不支援提示功能。╮(－_－)╭",
							   "此載具不支援提示功能\n跪求換新平板Orz",
							   "此載具不支援提示功能\n不支援!不支援!不支援! 不支援! (╯-_-)╯ ~╩╩",
							   "不支援，不要再按了\n◢▆▅▄▃ 崩╰(〒皿〒)╯潰 ▃▄▅▆◣"];
				
				if (hintIndex != oldhintIndex) {
					hintmsgnum = 0;
				};
				alert(hintmsg[hintmsgnum]);
				hintmsgnum++;
				oldhintIndex = hintIndex;
				if (hintmsgnum==4) {
					hintmsgnum--;
				};
			}
			else{
				if(file_array_list[hintIndex] == undefined){
					/*
					$('#hintImgList').attr('style','');
					$('#hintImgList').attr('type', 'noimg');
					dlg.toggle();
					*/
					$('#alertMsg').html('沒有提示喔!<br>(@˘ ₃˘@)');
					alertMsg.toggle();
				}
				else {
					$('#hintImgList').css('background-image',"url('"+file_array_list[hintIndex].imageUrl+"')");
					$('#hintImgList').attr('type', 'hasimg');
					dlg.toggle();	
				}
			}
		}
	});

	var alertMsg = new DialogFx( $('#somedialog2')[0] , {'onCloseDialog': function(){
		// var count = $('#hintTime').val();
		// setTimeout(function(){
		// 	$('#HintBtn1').text('需要提示？');
		// 	$('#HintBtn1').css('opacity','1');
		// 	$('#HintBtn1').css('pointer-events','auto');
		// }, parseInt($('#hintTime').val()) * 1000);
		// // $('#isSendBtn').text("");
		// $('#HintBtn1').css('pointer-events','none');
		// for (var i = 0; i < parseInt($('#hintTime').val()); i++) {
		// 	debugger
		// 	setTimeout(function(){
		// 		count--;
		// 		$('#HintBtn1').text('等待提示:'+count);
		// 		$('#HintBtn1').css('opacity','0.5');
		// 	}, parseInt(i) * 1000);
		// }
	}});

//開始轉盤
// rotateBall();


function change2LoserPage(){
	$('.fullmain[stage="4"]>#imgArea').attr('type','showLoser');
}
function change2WinerPage(){
	$('.fullmain[stage="4"]>#imgArea').attr('type','showWiner');
}
function upload_WinorLose_Img(){
	var switchID = $(event.currentTarget).attr('no');
	if($('input[type="file"]').length>1) {
		$('input[type="file"]').remove();
	}

	if(switchID == "1") {
		$('body').append("<input type='file' id='forSelectWinOrLoseFile' onchange='selectWinOrLoseFile()'>");
		$('#forSelectWinOrLoseFile').click();
	}
	else if(switchID == "2"){
		$('body').append("<input type='file' id='forSelectWinOrLoseFile' onchange='selectWinOrLoseFile()'>");
		$('#forSelectWinOrLoseFile').click();
	}
}
function selectWinOrLoseFile(){
	files = event.target.files[0];//找到第一筆資料
	if(files == undefined){
		return;
	}
	var eachfile = files;
	var fileExtension=$(files.name.split('.')).get(-1);//找檔案type;
	if(fileExtension =='PNG' || fileExtension =='JPG' || fileExtension =='BMP' ||
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
function formatTime(timeSec){
	//秒==> HH:MM:SS
	if(timeSec<= 0) {
		return "00:00";
	}
	else if(timeSec<30){
		$("#timer").css('color','red');
	}
	var sHH="00";	var sMM="00";	var sSS="00";
	var iHH = 0;	var iMM = 0;	var iSS = 0;

	iHH =  Math.floor(timeSec/3600);
	var rHH = timeSec % 3600;
	iMM =  Math.floor(rHH/60);
	iSS = rHH % 60;

	sHH = iHH+"";	sMM = iMM+"";	sSS = iSS+"";
	if(iHH<10){		sHH = "0"+iHH;	}
	if(iMM<10){		sMM = "0"+iMM;	}
	if(iSS<10){		sSS = "0"+iSS;	}

	return sMM+":"+sSS;
}
function compareStrings(str1,str2)
{
    if(str1.length == str2.length)
    {
        if( str1 == str2)
            return true;
        else
        {
            var halfStr1 = fullToHalf(str1);
            var halfStr2 = fullToHalf(str2);
            if(halfStr1 == halfStr2)
                return true;
            else
                return false;
        }
    }
    else
        return false;
}
//全形轉半形
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