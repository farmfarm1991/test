<%
String id = request.getParameter("id");
%>
<html manifest="/iTS5/service/file/game/<%=id%>/play.manifest">
<head>
<link rel="icon" href="/game/game_platform/images/logo/icon.png" type="image/png"/>
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
	background-image: url("images/newImg/background.png");
	background-repeat: no-repeat;
	background-size: cover;
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
	/*background-image: url("images/bground_right.png"),url("images/bground_left.png") ,url("images/_background.png");
    background-position-x: 100%,0%,50%;
    background-position-y: -25%,100%,50%;
    -webkit-background-size: 250px, 200px, cover;
            background-size: 250px, 200px, cover;
	background-color: #E5D1AA;*/
	/*background-repeat: no-repeat;*/
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
	background-color: #E5D1AA;
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
	background-image: url("images/newImg/background.png");
	/*background-image: url("images/bground_right.png"),url("images/bground_left.png") ,url("images/_background.png");*/
	width: 100%;
	height: 100%;
	background-repeat: no-repeat;
	/*background-position-x: 100%,0%,50%;      
	background-position-y: -25%,100%,50%;   */   
	background-size:cover;      
	/*background-color: #E5D1AA;*/
	/*-webkit-filter: blur(12px);*/
	z-index: 1000;
	position: absolute;
}
.logo{
	width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    z-index: 1001;
    background-image: url("img/basic_chance.png");
    background-size: 45%;
    background-repeat: no-repeat;
    background-position: 50%;
}
#aboutGameText{
	text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}
#banner {
	border-radius: 50%;
	width: 59px;
	height: 59px;
	/*background: #000;*/
	overflow: hidden;
	-webkit-backface-visibility: hidden;
	-webkit-transform: translate3d(0, 0, 0);
	top: 6px;
    left: -3px;
	position: relative;
	/*zoom: 0.45;*/
}

#banner .fill {
	-webkit-animation-iteration-count: 1;
	-webkit-animation-timing-function: cubic-bezier(.2, .6, .8, .4);
	-webkit-animation-duration: 10s;
	-webkit-animation-fill-mode: forwards;
}

#banner .waveShape {
	-webkit-animation-name: waveAction;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
	-webkit-animation-duration: 0.5s;
	width: 300px;
	height: 150px;
	fill: #04ACFF;
	margin-top: -2px;
}

@-webkit-keyframes fillAction {
  0% {
    -webkit-transform: translate(0, 65px);
  }
  100% {
    -webkit-transform: translate(0, -5px);
  }
}

@-webkit-keyframes waveAction {
  0% {
    -webkit-transform: translate(-150px, 0);
  }
  100% {
    -webkit-transform: translate(0, 0);
  }
}
/* chance play css */
#typeDom[type='hasimg'] #cardimg,.imgBox>div[type='hasimg'] .cardimg{
	-webkit-box-shadow: none;
}
#intro_NextBtn>#nextBtn,#helper_NextBtn>#nextBtn,#level_NextBtn>#nextBtn{
    width: 90px;
    height: 90px;
    background-image: url(../edit/images/newImg/nextbtn.png);
    background-position-x: 0px;
    background-position-y: 0px;
    zoom: 0.8;
	transform: scale(1);
    margin-right: 0px; 
    margin-top: 0px; 
}
#helper_PrevBtn>#prevBtn,#level_PrevBtn>#prevBtn,#end_PrevBtn>#prevBtn{
    width: 70px;
    height: 70px;
    background-image: url(../edit/images/newImg/playBtn.png);
    background-position-x: -80px;
    background-position-y: 0px;
    transform: rotate(180deg);
    zoom: 0;
}
#nextBtn:hover, #prevBtn:hover{
	cursor:pointer;
	/*border:1px solid #92D050;*/
	border-radius:0px;
	-webkit-box-shadow:none;
}
div#bottombar {
    width: 100%;
    position: fixed;
    height: 70px;
    bottom: 0px;
    background: #fafafa;
    z-index: 1;
}
div#explain {
	height: 70px;
    position: fixed;
    left: calc(50% - 85px);
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: horizontal;
    -webkit-box-direction: normal;
        -ms-flex-direction: row;
            flex-direction: row;
    z-index: 1;
    bottom: 0px;
}
.page {
    width: 60px;
    height: 60px;
    border-radius: 60px;
    -webkit-box-flex: 1;
        -ms-flex: 1;
            flex: 1;
    margin: 0px 15px;
    /*box-shadow: 2px 2px 5px #606060;*/
    cursor: pointer;
    line-height: 70px;
    text-align: center;
    color: white;
    background-size: 240px 360px;
    position: relative;
    top: 5px;
}
.titleT{
    height: 70px;
    font-size: 20px;
    line-height: 70px;
    color: #424242;
    left: calc(50% - 150px);
    position: relative;
}
#p1{
  background-image: url(../edit/images/newImg/button.png);
  background-position-y: -120px;
}
#p2,#p2.show.close{
  background-image: url(../edit/images/newImg/button.png);
  background-position-x: -60px;
  background-position-y: -120px;
}
#p3,#p3.show.close{
  background-image: url(../edit/images/newImg/button.png);
  background-position-x: -120px;
  background-position-y: -120px;
}
#p1.show{
  background-position-y: 120px;
}
#p2.show{
  background-position-x: -60px;
  background-position-y: 120px;
}
#p3.show{
  background-position-x: -120px;
  background-position-y: 120px;
}
#p1.use{
  background-position-y: 60px;
  margin-left: 10px;
}
#p2.use{
  background-position-x: -60px;
  background-position-y: 60px;
  margin-left: 10px;
}
#p3.use{
  background-position-x: -120px;
  background-position-y: 60px;
  margin-left: 10px;
}
#p2.none,#p3.none{
	display: none;
}
#helper_NextBtn,#helper_PrevBtn{
	height: calc(100% - 70px);
}
.cardimg{
	height: calc(100% - 70px);
    top: 0px;
    position: absolute
}
/* main */
#topBar{
	width: 100%;
	border-radius: 0px;
}
div#aboutTime{
	left: calc(50% - 65px);
	width: 0;
	max-width: none;
}
div#aboutTime:after{
  	background-image: url(../edit/images/newImg/tool.png);
  	height: 40px;
  	width: 40px;
  	zoom: 0;
  	top: 10px;
  	left: calc(50% - 80px);
    background-position-y: -5px;
    pointer-events: none;
}
input#timeClock{
	top: 17px;
	position: absolute;
	/*left: 20px;*/
	font-size: 23px;
	font-weight: bold;
	width: 90px;
}
div#aboutSetting{
    position: absolute;
    width: 40px;
    left: calc(50% + 65px);
}
@media screen and (max-width: 640px){
	#aboutTime:after {
	    display: block; 
	}
}
#aboutSetting>#menuBtn{
  	background-image: url(../edit/images/newImg/tool.png);
	background-repeat: no-repeat;
	height: 36px;
	width: 17px;
	border-radius: 70px;
	cursor: pointer;
	background-position-x: -81px;
	background-position-y: -7px;
    margin-top: 12px;
    -webkit-background-size:inherit;
}
.hideBar{
	width: 36px;
    /*height: 120px;*/
    position: absolute;
    /*right: -12px;*/
    border-radius: 0px 0px 40px 40px;
    top: 30px;
	background:linear-gradient(top,#ffffff,rgba(245, 245, 245, 0.55));    
	background:-webkit-linear-gradient(top,#ffffff,rgba(245, 245, 245, 0.55));
    padding: 2px;
    /*opacity: 0.8;*/
    animation-duration: 0.5s;
    z-index: -1;
    /*border: 1px solid;*/
}
.hideBtn {
    width: 30px;
    height: 30px;
    /*opacity: 0.3;*/
    border-radius: 50px;
    margin: 20px 0px 0px 3px;
    cursor: pointer;
    display: none;
    background-image: url('../edit/images/newImg/toolbtn.png');
}
#menu2{
	background-position-x: -30px;
}
#somedialog_3 .dialog__content {
    width: 80%;
    height: 70%;
    font-size: 11px;
}
div#eContent {
    margin-top: 170px;
    line-height: 40px;
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
	margin: 0px 20px;
	-webkit-box-pack: flex-end;
	-webkit-justify-content: flex-end;
	   -moz-box-pack: flex-end;
	        justify-content: flex-end;
	-webkit-box-align: center;
	-webkit-align-items: center;
	   -moz-box-align: center;
	        align-items: center;
	background-image: url('../edit/images/newImg/levelbtn.png');
	background-position-x :0px; 
	background-position-y :-130px;
	width: 130px;
	height: 130px;
	zoom: 1;
}
.level.open {
	cursor: pointer;
}

.level.open[itemno='1'] {
	/*background-image: url('../images/level1.png');*/
}
.level.open[itemno='2'] {
	/*background-image: url('../images/level2.png');*/
	background-position-x: -130px;
}
.level.open[itemno='3'] {
	/*background-image: url('../images/level3.png');*/
	background-position-x: -260px;
}
.level.open[itemno='4'] {
	/*background-image: url('../images/level4.png');*/
	background-position-x: -390px;
}
.level.open[itemno='5'] {
	/*background-image: url('../images/level5.png');*/
	background-position-x: -520px;
}
.level.open[itemno='6'] {
	/*background-image: url('../images/level6.png');*/
	background-position-x: -650px;
}
.level.lock{
	/*background-image: url('../images/levellock.png');*/
	background-position-x: -780px;
}

.level.none {
	/*background-image: url('../images/adding.png');*/
	/*background-color: rgba(255,255,255,0);*/
	cursor: pointer;
	background-position-x: -1040px;
    /*background-position-y: -130px;*/
}
.level.none.open {
	/*background-image: url('../images/adding.png');*/
	/*background-color: rgba(255,255,255,0);*/
	cursor: pointer;
	background-position-x: -1040px;
    /*background-position-y: -350px;*/
}
@media screen and (min-width: 500px) {
	.level{
		zoom: 1;
	}
}
@media screen and (max-width: 500px) {
	.level{
		zoom: 0.8;
	}
}
@media screen and (max-width: 400px) {
	.level{
		zoom: 0.6;
	}
}
@media screen and (max-width: 300px) {
	.level{
		zoom: 0.25;
	}
}
@media screen and (max-height: 500px) {
	.level{
		zoom: 1;
	}
}
@media screen and (max-height: 450px) {
	.level{
		zoom: 0.8;
	}
}
@media screen and (max-height: 400px) {
	.level{
		zoom: 0.47;
	}
}
@media screen and (max-height: 300px) {
	.level{
		zoom: 0.37;
	}
}
.oneWord {
	width: 60px;
	height: 60px;
	font-size: 26px;
	line-height: 60px;
	text-align: center;
	position: relative;
	font-family: "微軟正黑體";
    margin: -3.5px;
	pointer-events: none;
	background-image: url('../edit/images/newImg/ansbtn.png');
	background-color:transparent;
	border: 0px;
	-webkit-box-shadow:none;
}
.oneWord:before{
	content: none;
}
#bottomBar,#bottomArea {
	background-color: rgba(245, 245, 245, 0.8);
	width: 100%;
	height: 70px;
	margin: 0px auto;
	border-radius: 0px;
	-webkit-box-shadow: 2px 2px 5px gray;
	        box-shadow: 2px 2px 5px gray;
	z-index: 50;
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: flex;
	bottom:0px;
	position:absolute;
}
#hint2{
	position: relative;
	width: 80px;
	height: 100%;
	display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-flex: 1;
    -ms-flex: 1;
            flex: 1;
    -webkit-box-pack: end;
    -ms-flex-pack: end;
    justify-content: flex-end;
}
#hint2:before {
	content: "";
	width: 64px;
	height: 64px;
	position: absolute;
	display: block;
	border-radius: 50%;
	/*-webkit-box-shadow: 0px 0px 1px 2px #18D4FF;
	        box-shadow: 0px 0px 1px 2px #18D4FF;*/
	pointer-events: none;
	z-index: 1;
	/*background-color: white;*/
	width: 65px;
	height: 65px;
	top: 3px;
	right: 0px;
	background-image: url('../edit/images/newImg/hintans.png');
	background-position-x: -65px;
}
.done#hint2:before{
	background-position-x: -130px;
}
#bg3Down{
	background-image: url(../edit/images/newImg/bgcenter.png);
	width: 660px;
	height: 280px;
    position: absolute;
    bottom: 0px;
    left: calc(50% - 330px);
    background-position-y: 280px;
}
div#ansArea {
	-webkit-box-flex: 2;
	-webkit-flex: 2;
	   -moz-box-flex: 2;
	        flex: 2;
	width: 530px;
	height: 40px;
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
	/*-webkit-flex-wrap: wrap;
	        flex-wrap: wrap;*/
    /*background: #cccccc;*/
    margin: 15px;
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
}
#sendBtn{
	position: relative;
	width: 80px;
	height: 100%;
	display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-flex: 1;
    -ms-flex: 1;
            flex: 1;
}
#sendBtn:after{
	content: "";
	width: 65px;
	height: 65px;
	position: absolute;
	display: block;
	border-radius: 50%;
	pointer-events: none;
	top: 3px;
	z-index: 1;
	background-image: url('../edit/images/newImg/hintans.png');
	background-position-x: 455px;
	background-position-y: 0px;
	zoom: 0;
}
.sendLock#sendBtn:after{
	background-position-x: 130px;
}
#isSendBtn{
	height: 59px;
    width: 59px;
    left: 18px;
    top: 5px;
    border-radius: 59px;
}
#isHintBtn {
	width: 59px;
    height: 59px;
    border-radius: 65px;
	position: relative;
	top: 5px;
	left: -2px;
	line-height: 23px;
	text-align: center;
	font-size: 23px;
	display: none;
	z-index: 5;
	cursor: pointer;
}
.level.open.clear:before{
	background-image: url('../edit/images/newImg/ansCheck.png');
	width: 109px;
	height: 109px;
	background-position-x: 0px;
	background-position-y: 0px;
    margin-right: 10px;
}
div#addImg{
	margin-top: -5px;
}
/* hint */
.dialog.dialog--open h2, .dialog.dialog--open button{
    margin: -6px 30px;
}
@-webkit-keyframes hintRotate {
  0% {
    -webkit-transform: rotateY(0deg);
  }
  100% {
    -webkit-transform: rotateY(360deg);
  }
}
.dialog__content>h2:before{
	content: "";
}
#somedialog .dialog__content:before{
	content: "提示";
	position: absolute;
	left: 0px;
	top: -35px;
	color: white;
	z-index: 4;
	font-size: 25px;
}
/*寬度大於高度*/
@media (orientation:landscape){
	div#addImg {
	-webkit-background-size: auto calc(100% - 130px);
	        background-size: auto calc(100% - 130px);
	}
}
div#addImg{
	-webkit-box-shadow: none;
	box-shadow: none;
}
/* 過關 */
#clearValue,#restart{
	background-image: url(../edit/images/newImg/endIcon.png);
    height: 70px;
    width: 70px;
    position: absolute;
    left: 25%;
    background-position-x: -80px;
    bottom: 20px;
}
div#clearTimeValue,#restartValue{
    left: 125%;
    position: relative;
    letter-spacing: -3px;
    font-weight: bold;
    top: 20px;
}
.fullmain[stage="4"] #bottomBar{
	height: 120px;
}
#restart{
	left: 55%;
    background-position-x: -5px;
    cursor: pointer;
}
#restartValue{
    width: 95px;
    color: black;
    font-weight: normal;
    font-size: 23px;
    letter-spacing: normal;
}
#end_PrevBtn>#prevBtn{
    position: absolute;
    top: calc(50% - 120px + 35px);
    -webkit-background-size:inherit;
}
#winerImg{
    height: calc(100% - 120px);
}
</style>
</head>
<body>
	<div class='fullmain' stage="1">
		<div class='logoBackground'></div>
		<div class="logo"></div>
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
		<div id="bottombar">
	      <span class="titleT">說明頁</span>
	      <div id="explain">
	        <div id="p1" class="page show use"></div>
	        <div id="p2" class="page show none" disabled="disabled"></div>
	        <div id="p3" class="page show none" disabled="disabled"></div>
	      </div>
	    </div>
		<div id='imgArea' p1='false' p2='false' p3='false'>
			<div id="aboutGame" style='display:none'>
				<div id="aboutGameText" class='single-line'> </div>
			</div>
			<!-- <div id="nextPage" class="pagebtn">下一頁</div>
			<div id="prevPage" class="pagebtn">上一頁</div> -->
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
    	<div id="bg3Down"></div>
		<div id="somedialog" class="dialog">
			<div class="dialog__overlay"></div>
			<div class="dialog__content" style="perspective: 1000px;">
				<h2>
					<div class='hintImgList' hint="1">
						<div class='showhint' type='noImg'></div>
						<div id="chance"></div>
						<div id="chanceBack"></div>
					</div>
					<div class='hintImgList' hint="2">
						<div class='showhint' type='noImg'></div>
						<div id="fortune"></div>
						<div id="fortuneBack"></div>
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
				<div><button class="action" data-dialog-close>Close</button></div>
			</div>
		</div>
		<div id="somedialog3" class="dialog">
			<div class="dialog__overlay"></div>
			<div class="dialog__content">
				<h2>
					<div id='alertMsg3'>請先建立題目</div>
				</h2>
				<div><button class="action" data-dialog-close>Close</button></div>
			</div>
		</div>
		<div id="somedialog_3" class="dialog">
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
		<div id="somedialog4" class="dialog">
			<div class="dialog__overlay"></div>
			<div class="dialog__content">
				<h2>
					<div id='alertMsg4'>請先建立題目</div>
				</h2>
				<div><button class="action" data-dialog-close>Close</button></div>
			</div>
		</div>

		<div id='imgArea'>
			<div id='topBar'>
				<div id='aboutTime'>
					<select id='timetype' disabled="disabled" style="display: none;">
						<option val='grow'>進行時間</option>
						<option val='down'>剩餘時間</option>
					</select>
					<input id='timeClock' type='text' value="00:00" readonly pattern="[0-9]{2}:[0-9]{2}" maxlength="5" placeholder="mm:ss" time="0"/>
				</div>

				<!-- <div id="aboutGame">
					<div id="aboutGameText" class='single-line' > </div>
				</div> -->

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
					<div id='addImg' type='noimg'></div>
				</div>
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
				<div id='hint2' cd='cding'>
					<div id="banner">
					    <div class="fill">
					      <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="300px" height="300px" viewBox="0 0 300 300" enable-background="new 0 0 300 300" xml:space="preserve">
					        <path fill="#04ACFF" class="waveShape" d="M300,300V2.5c0,0-0.6-0.1-1.1-0.1c0,0-25.5-2.3-40.5-2.4c-15,0-40.6,2.4-40.6,2.4
						c-12.3,1.1-30.3,1.8-31.9,1.9c-2-0.1-19.7-0.8-32-1.9c0,0-25.8-2.3-40.8-2.4c-15,0-40.8,2.4-40.8,2.4c-12.3,1.1-30.4,1.8-32,1.9
						c-2-0.1-20-0.8-32.2-1.9c0,0-3.1-0.3-8.1-0.7V300H300z" />
					      </svg>
					    </div>
					</div>
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
						<span id='isHintBtn' data-dialog="somedialog" class="trigger" ready="no" style="color:white;"></span>
						<div id='setting'>
							<span id='hintLebel'>設定提示倒數</span>
							<!-- <div id='hintTime' contenteditable="true" onkeypress="return (this.innerText.length <= 5)">00:00</div> -->
							<input id="hintTime" type='text' value='30' maxlength=2  pattern="^[0-9]{1,2}$" placeholder="ss"/>
						</div>
					</div>
				</div>
				<div id='ansArea'>
					<input id='ansFill' maxlength="10"></input>
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
				<div id='sendBtn'>
					<div id='isSendBtn'></div>
					<div id='setting_send' style="display:none">
						<span id='sendLebel'>設定答題倒數</span>
						<!-- <div id='sendTime' contenteditable="true">00:00</div> -->
						<input id="sendTime" type='text' value='15' maxlength=2  pattern="^[0-9]{1,2}$" placeholder="ss"/>
					</div>
				</div>
			</div>

			<div id='level_NextBtn' style="display: none;">
				<div id='nextBtn'  disabled="disabled"></div>
			</div>
			<div id='level_PrevBtn'>
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
					<div id='clearValue'>
						<div id='clearTimeValue'></div>
					</div>
					<div id='restart'>
						<div id='restartValue'>再玩一次</div>
					</div>
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
// 	$('.logo').fadeOut(2000,function(){

// 			$('.logoBackground').css('-webkit-filter','blur(0px)');
// 			$('.logoBackground').css('display','none');
// 			$('#bottomOfText').show();
// 		});
// }
var gameID = "<%=id%>";
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
	if (feValue.substring(feValue,feValue.indexOf('&title')).length != 24) {
		alert("此遊戲未製作完成");
		return;
	}else{
		//初始畫面延遲兩秒後淡出
		setTimeout(function (){
			$('.logo').fadeOut(2000,function(){
				$('.logoBackground').css('-webkit-filter','blur(0px)');
				$('.logoBackground').css('display','none');
				$('#bottomOfText').show();
				$('#typeDom').css('z-index','0');
			});
		},1500);
	}

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
	$('.fullmain[stage="1"] #nextBtn').bind('click', stage1_to_stage2);

	//stage2 :
	$('.fullmain[stage="2"] #prevPage').bind('click', prevPage);
	$('.fullmain[stage="2"] #nextPage').bind('click', nextPage);
	$('.fullmain[stage="2"] #nextBtn').bind('click', stage2_to_stage3);
	$('.fullmain[stage="2"] #prevBtn').bind('click', stage2_to_stage1);
	$('.fullmain[stage="2"] .page').bind('click', decidePage);
	

	//stage3 :
  	$('.fullmain[stage="3"] #menuBtn').bind('click', showHideBar);
	$('.fullmain[stage="3"] #menu1').bind('click', openMenu);
	$('.fullmain[stage="3"] #menu2').bind('click', openExplain);
	$('.fullmain[stage="3"] .level').bind('click', whenClickLevel);
	$('.fullmain[stage="3"] #nextBtn').bind('click', stage3_to_stage4);
	$('.fullmain[stage="3"] #prevBtn').bind('click', stage3_to_stage2);
	$('.fullmain[stage="3"] #isSendBtn').bind('click', checkAnsIsCurrect)

	//stage4 :
	$('.fullmain[stage="4"] #nextBtn').bind('click', stage4_to_stage5);
	$('.fullmain[stage="4"] #prevBtn').bind('click', stage4_to_stage3);
	$('.fullmain[stage="4"] #restart').bind('click', restartPlay);
});


function startLoadEachImg(i){
	if(i>=24){
		//所有圖片都讀取完畢囉
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
	}

	//設定提示倒數時間
	$('#hintTime').val(getHintTime);
	$('#banner .fill').css('-webkit-animation-duration',getHintTime+'s');
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
	$('link[rel="stylesheet"][href="../css/game/main.css"]').attr('href', '../css/game/end.css');
	timeIsStop = true;

	if(file_array_list[22] != undefined) {
		$('#winerImg').css('background-image','url("'+file_array_list[22].imageUrl+'")');
		$('#winerImg').attr('type', 'hasimg')
	}
	if(file_array_list[23] != undefined) {
		$('#loserImg').css('background-image','url("'+file_array_list[23].imageUrl+'")');
		$('#loserImg').attr('type', 'hasimg')
	}

	//放置過關時間
	$('#clearTimeValue').append("<div>"+$('#timeClock').val()+"</div>");
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

function restartPlay(){
	location.reload();
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
			$('#p2').removeClass('none');

			if(file_array_list[3] != undefined){
				//第三頁有說明內容
				var imgURL = file_array_list[3].imageUrl;
				$('.fullmain[stage="2"] #cardimg3').css('background-image','url("'+imgURL+'")');
				$('.fullmain[stage="2"] #typeDom3').attr('type','hasimg');
				$('.fullmain[stage="2"] #imgArea').attr('p3','true');
				$('#p3').removeClass('none');
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
	if(file_array_list[7]!=undefined){
		$($('.level')[1]).removeClass('lock').addClass('open');
		$($('.level')[1]).removeClass('hide');
	}
	if(file_array_list[10]!=undefined){
		$($('.level')[2]).removeClass('lock').addClass('open');
		$($('.level')[2]).removeClass('hide');
	}
	if(file_array_list[13]!=undefined){
		$($('.level')[3]).removeClass('lock').addClass('open');
		$($('.level')[3]).removeClass('hide');
	}
	if(file_array_list[16]!=undefined){
		$($('.level')[4]).removeClass('lock').addClass('open');
		$($('.level')[4]).removeClass('hide');
	}
	if(file_array_list[19]!=undefined){
		$($('.level')[5]).removeClass('lock').addClass('open');
		$($('.level')[5]).removeClass('hide');
	}

	$('.fullmain[stage="3"] .deleteBtn').remove();
	$('#isHintBtn').css('line-height', '48px');


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
		stage3_to_stage4();
		$('.fullmain[stage="3"] #imgArea').addClass('fullClear');
		$('.fullmain[stage="4"] #imgArea').attr('type', 'showloser');
		$('#end_PrevBtn').hide();
		$('#clearTimeLabel').remove();
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


var alertMsg2 = new DialogFx( $('#somedialog3')[0] , {'onCloseDialog': function(){
	// $('#menuBtn').click();
	$('#level2').click();
}});
var alertMsg3 = new DialogFx( $('#somedialog4')[0] , {'onCloseDialog': function(){
	$('#sendBtn').attr('type', 'lock');
	setTimeout(function(){
		$('#sendBtn').attr('type', '');
		$('#sendBtn').removeClass("sendLock");
		// $('#isSendBtn').text("確定");
	}, parseInt($('#sendTime').val()) * 1000);
	$('#sendBtn').addClass("sendLock");
	// $('#isSendBtn').text("");
}});

function checkAnsIsCurrect() {
	var stuAns = $('#ansArea').attr('ansstring');
	var nowQuiz = $('#quizImg').attr('itemno') - 1;
	var getAnsHerfStr = fullToHalf(stuAns.toLowerCase());

	if( CryptoJS.MD5(getAnsHerfStr).toString() == getQuizList[nowQuiz].ansMD5 ) {
		console.log('這題答對啦');
		if(navigator.userAgent.match('HTC_Flyer')){
			alert('恭喜答對啦');
			getQuizList[nowQuiz].currect = "yes";
			$($('.level')[nowQuiz]).addClass('clear');
			// $('#menuBtn').click();
			$('#somedialog3 .action').bind('click',function(){
				openMenu();
			})
		}
		else{
			$('#alertMsg3').text('恭喜答對啦');
			getQuizList[nowQuiz].currect = "yes";
			$($('.level')[nowQuiz]).addClass('clear');
			alertMsg2.toggle();	
			
			$('#somedialog3 .action').bind('click',function(){
				openMenu();
			})
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
				// $('#isSendBtn').text("確定");
				$('#sendBtn').removeClass("sendLock");
			}, parseInt($('#sendTime').val()) * 1000);
			// 圖片更換為鎖
			$('#sendBtn').addClass("sendLock");
		}
		else{
			console.log('這題答錯啦');
			$('#alertMsg4').text('你答錯啦');
			getQuizList[nowQuiz].currect = "no";
			$($('.level')[nowQuiz]).removeClass('clear');
			alertMsg3.toggle();	
			$('#sendBtn').addClass("sendLock");
		}
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
	else if(nowNumber==1){
		$('.fullmain[stage="2"] #prevPage').css('display','none');
		if(p2Flag=='true'){
			$('.fullmain[stage="2"] #nextPage').css('display','');
		}
		else {
			$('.fullmain[stage="2"] #nextPage').css('display','none');
		}
	}
	else if(nowNumber==2){
		$('.fullmain[stage="2"] #prevPage').css('display','');
		if(p3Flag=='true'){
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
var alertExplain = new DialogFx( $('#somedialog_3')[0] )
function openExplain(){
  alertExplain.toggle();
}
function openMenu(){
	$('#levelBox').css('visibility','visible');
	$('#quizImg').css('visibility', 'hidden');
	$('#bg3Down').show();
	showGoStage();
	//關卡頁面的文字，開啟關卡頁時讓底部文字出現
	$('.fullmain[stage="3"] #bottomOfText').attr('style','');
	//修改底部按鈕狀態
	$('#bottomBar').attr('stage','stagelist');

	//儲存作答紀錄
	var quizIndex = ($('#quizImg').attr('itemno')- 0)*3 + 3 - 2;
	if(file_array_list[quizIndex] != undefined){
		file_array_list[quizIndex].quizAns = $('#ansArea').attr('ansstring');
	}
	// 清除提示setTimoOut
	clearTimeout(hintDone);
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
		$('.fullmain[stage="3"] #nextBtn').removeAttr('disabled');

		if($('#timetype>option:selected').attr('val') == 'down'){
			// $('#clearValue').append("<div>剩餘時間</div>");
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
		$('#bg3Down').hide();
		//關卡頁面的文字，開啟題目時候就不要出現底部文字
		$('.fullmain[stage="3"] #bottomOfText').css('display','none');
		var itemno = $(event.target).attr('itemno');
		$('#quizImg').attr('itemno', itemno);
		var realFileIndex = (itemno - 0)*3 + 3 - 2;
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
		}
		else {
			$('#addImg').attr('style','').attr('type','noimg');
			$('#ansArea').attr('ansstring', '');
			setAns('');
		}

		hideGoStage();

		//修改底部按鈕狀態
		$('#bottomBar').attr('stage','onequiz');

		hideTime();
		// 判斷遊戲是否結束
		if ( $($('.level')[itemno - 1]).hasClass('clear') ) {
			// stop animation
			$('#banner .fill').attr("style",null);
			$('#banner .waveShape').css({'animation-name':'none','-webkit-animation-name':'none'});
		}else{
			// start animation
			$('#banner .fill').css('-webkit-animation-name','fillAction');
		}
	}
	//css變更
	$('#quizList>#quizImg').css('height','100%');
	$('#quizList>#quizImg').css('top','0px');
	checkCanGoNextStage();
}
var hintDone;
function hideTime(){
	var itemno = $('#quizImg').attr('itemno')- 0;
	$('#hint2').removeClass('done');
	if($('.fullClear').length != 1) {
		clearTimeout(hintInterval);
		hintInterval = setTimeout(function(){
			$('#isHintBtn').attr('ready','yes');
			s1 = -5, s2=6.5;
		},($('#hintTime').val()-0)*1000);
		$('#isHintBtn').attr('ready','no');
		s1 = 15, s2=3;
	}
	else {
		$('#isHintBtn').attr('ready','yes');
		s1 = -5, s2=6.5;	
	}
	
	if( $($('.level')[itemno - 1]).hasClass('clear') ) { //該題過關
		$('.fullmain[stage="3"] #imgArea').addClass('thisClear');
		s1 = -5, s2=6.5;
		$('#isHintBtn').attr('ready','yes');
	}
	else {
		$('.fullmain[stage="3"] #imgArea').removeClass('thisClear');
		s1 = 15, s2=3;
		$('#isHintBtn').attr('ready','no');
	}
	var hintT = $('#hintTime').val();
	hintDone = setTimeout(function(){
		$('#hint2').addClass("done");
	},(hintT-0)*1000);
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
		file_array_list.splice(fileIndex, 2);
		$('.level.open').last().removeClass('open').addClass('lock');
	}
	checkCanGoNextStage();
	event.stopPropagation();
}

var s1 = 15;
var s2 = 3;

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
var dlg = new DialogFx( $('#somedialog')[0] )
var hintmsgnum = 0;
var oldhintIndex ;
$('#isHintBtn').bind( 'click', function () {
	var itemno = $('#quizImg').attr('itemno')- 0;
	var hintNum = itemno * 3 + 2;
	if(s1!=-5 && s2!=6.5)
		return;
	dlg.toggle();
	// 闖關後
	if ($($('.level')[itemno-1]).hasClass('clear')) {
		$('#chance,#chanceBack,#fortune,#fortuneBack').hide();
		hintImg1 = file_array_list[hintNum] == undefined ? "images/nohint.jpg" :file_array_list[hintNum].imageUrl;
		hintImg2 = file_array_list[hintNum+1] == undefined ? "images/nohint.jpg" :file_array_list[hintNum+1].imageUrl;
		$($('.showhint')[0]).css('background-image',"url("+hintImg1+")").attr('type', 'hasimg');
		$($('.showhint')[1]).css('background-image',"url("+hintImg2+")").attr('type', 'hasimg');
		$('.showhint').css({'transform': 'rotate3d(0,1,0,0deg)','-webkit-transform':'rotate3d(0,1,0,0deg)','opacity':'1'});
	}else{
		animationStart();
		setTimeout(animationEnd,4000);
		
		$('.hintImgList').css({'pointer-events':'auto'});
		$('#chance,#fortune').attr('style',null);
		// 提示訊息BTN
		$(".hintImgList").bind("click touchend",openHint);
		$(".hintImgList[hint='2']").bind("click touchend",openHint);
		// stop animation
		$('#banner .fill').css({'animation-name':'none','-webkit-animation-name':'none'});
		function openHint(evt){
			var hintIndex = ($('#quizImg').attr('itemno') - 0)*3 + 3 -1;
			var hintClick = $(evt.target).parent().attr('hint')-1;
			var randomNum = Math.round(Math.random());
			// console.log(randomNum);
			var hintImg = file_array_list[hintIndex+randomNum] == undefined? "images/nohint.jpg" : file_array_list[hintIndex+randomNum].imageUrl;

			// 延遲圖片出現
			setTimeout(function(){$($('.showhint')[hintClick]).css('background-image',"url("+hintImg+")");},300);
			$($('.showhint')[hintClick]).attr('type', 'hasimg');
			
			// animation
			var hideHover1 = evt.target.id.split('Back')[0];
			var hideHover2 = evt.target.id.split('Back')[0]+"Back";
			$('#'+hideHover1+',#'+hideHover2).css({'transform': 'rotate3d(0,1,0,-180deg)','-webkit-transform':'rotate3d(0,1,0,-180deg)','opacity':'0'});
			$($('.showhint')[hintClick]).css({'transform': 'rotate3d(0,1,0,0deg)','-webkit-transform':'rotate3d(0,1,0,-0deg)','opacity':'1'});
			$('.hintImgList').css('pointer-events','none');

			$($('#somedialog')[0]).find('.action').bind('click',function(){
				$(".hintImgList[hint='1']").unbind("click touchend",openHint);
				$(".hintImgList[hint='2']").unbind("click touchend",openHint);
				$('#chance,#chanceBack,#fortune,#fortuneBack').show();
				$('#chanceBack,#fortuneBack').attr('style','');
				$($('.showhint')[hintClick]).css('background-image',"");
				$($('.showhint')[hintClick]).attr('type', 'noimg');

				if ( !$($('.level')[itemno-1]).hasClass('clear') ) {
					// restart animation
					$('#banner .fill').css('-webkit-animation-name','fillAction');
					// 時間重新計算
					hideTime();
				}
			})
		}
	}
	// close
	$($('#somedialog')[0]).find('.action').bind('click',function(){
		$('.hintImgList').css('pointer-events','none');
	})

});
// hint animation start
function animationStart(){
	$('.hintImgList').css({'width':'90%','padding-bottom':'70%','transform':'none'});
	$('.hintImgList[hint="1"]').css({'left':'0px','transform':'translateZ(300px)'});
	$('.hintImgList[hint="2"]').css({'right':'0px','transform':'translateZ(-300px)'});
	$('#somedialog h2').css({'-webkit-animation': 'hintRotate 3s linear infinite','transform-style': 'preserve-3d','-webkit-animation-iteration-count': '2','width':'50%','left':'25%','top':'10%'});
}
// hint animation end
function animationEnd(){
	$('.hintImgList').css({'width':'42%','padding-bottom':'42%','transform':'none'});
	$('.hintImgList[hint="1"]').css('left','20px');
	$('.hintImgList[hint="2"]').css('right','20px');
	$('#somedialog h2').attr('style',null);
}


var alertMsg = new DialogFx( $('#somedialog2')[0] )

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