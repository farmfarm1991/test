<%@ include file = "chkAuth.jsp"%>
<%
System.out.println("in navbar_t2.jsp");
/*

navbar包含預載CSS 以及會用到的js library
不需要特別放置位置 瀏覽器會自己調整tag應該要在的位置

*/
// 原本在chkAuth
// String pURL = request.getRequestURL().toString();
// //String domain_url = pURL.substring(0,pURL.lastIndexOf("/iTS5/"));
// pURL = pURL.substring(0,pURL.lastIndexOf("/game/")+6);
// String domain_url = pURL.substring(0,pURL.lastIndexOf("/game/")+5);
%>
<%@ include file = "../js/importjs.jsp"%>
<!-- xapi -->
<%@ include file = "tin.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>   
<%
	String school_id = (String)session.getAttribute("school_id");
	String school_name = (String)session.getAttribute("school_name");
	String roleName = (String)session.getAttribute("role_name");
	String imgPath = (String)session.getAttribute("img_path");
	String user_email = (String)session.getAttribute("user_email");
	String date_line = (String)session.getAttribute("date_line");
	String utype = (String)session.getAttribute("type");
	String inviteCode = (String)session.getAttribute("inviteCode");
	String login_time = (String)session.getAttribute("loginTime");
	String mal = (String)session.getAttribute("mal");
	System.out.println("utype: "+utype);

	String sessionId = (String) application.getAttribute(auth.getUserID());

	if (null == sessionId || !sessionId.equals(session.getId()))  //this browser session Id
	{
		session.setAttribute("user", null);
		%>
		<script>
			//alert("你的帳號已在其他機器登入");
			document.location.href ="<%=domain_url%>game_platform/error.jsp?eid=doubleLogin";
		</script>
		<%
	}


%>

<!--boostrap css-->
<link href="<%=pURL%>css/jquery-ui.css"/>
<link href="<%=pURL%>bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link rel="icon" href="<%=pURL%>game_platform/images/logo/icon.png" type="image/png"/>
<!-- <link href="http://hdtech.com.tw/favicon.ico?v=14.05.02" rel="Shortcut Icon" type="image/x-icon"> -->
<title>Holiyo</title>

<!--self script-->
<script type="text/javascript">

</script>  

<!--self css-->
<style type="text/css">
*{
	font-family:Helvetica Neue, Microsoft JhengHei !important;
}
html{
	width: 100%;
	overflow: hidden;
}
body{
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-o-user-select: none;
	user-select: none;
/*	overflow: hidden;*/
	/*width: 100%;*/
	height: 100%;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	position: fixed;
	width: 100%;
	border: 0;
	background: transparent;
}

.naviBtn {
	padding: 8px 18px;
	cursor: pointer;
}
.pull-right {
	display: inline-block;
	margin: 0px 111px 0px 0px;
	font-size: 22px;
	line-height: 42px;
	/*cursor: pointer;*/
	float: right;
}
.pull-right>span>img {
    width: 25px;
    vertical-align: top;
    margin-top: 8px;
	cursor: pointer;
}
.brand{
	font-family: 'DFKai-sb';
}
.navbar{
	top:0px;
	position:absolute;
	width:100%;
	z-index: 10;
	left:240px;
	/*-webkit-box-shadow: -4px 0px 8px rgba(0,0,0,0.5);*/
	/*box-shadow: -4px 0px 8px rgba(0,0,0,0.5);*/
    box-shadow: 0px 3px 3px #666600;
    -webkit-box-shadow: 0px 3px 3px #666600;
}

#blockLien{
	border-left: 2px solid #FFF;
	height: 20px;
	display: inline-block;
	margin: -5px 0px;
}

.menuClose {
	width : 100%;
	-webkit-transform: translateX(-240px);
	-webkit-transition: all 240ms ease-out;
	-moz-transform: translateX(-240px);
	-moz-transition: all 240ms ease-out;
	-ms-transform: translateX(-240px);
	-ms-transition: all 240ms ease-out;
	transition: all 240ms ease-out;
}
.menuOpen {
	width : 100%;
	-webkit-transform: none;
	-webkit-transition: all 240ms ease-out;
	-moz-transform: none;
	-moz-transition: all 240ms ease-out;
	-ms-transform: none;
	-ms-transition: all 240ms ease-out;
	transition: all 240ms ease-out;
}
.menuClose >div>span>.menu-trigger>img {

}

.naviMenu{
	/*display: inline-block;*/
}

.naviMenu, .naviSearch, .naviTools, .naviHot, .naviLayout{
/*	display: inline-block;*/
}
.itsnavbar{
	-webkit-border-radius: 0px;
	   -moz-border-radius: 0px;
	        border-radius: 0px;
	border: 0px;
/*	border-bottom: 1px solid #d4d4d4;*/
	padding: 0px;
	-webkit-box-shadow: -4px 0px 8px rgba(0,0,0,0.5);
	box-shadow: -4px 0px 8px rgba(0,0,0,0.5);
}
.itstopbar{
	/*background: #462301;*/
	background:-webkit-linear-gradient(top,#CCCC99,#8B9983);
	background:	-moz-linear-gradient(top,#CCCC99,#8B9983);
	background:	-ms-linear-gradient(top,#CCCC99,#8B9983);
	background:		 linear-gradient(top,#CCCC99,#8B9983);
	border-bottom: 1px solid #8B9983;
	min-height: 41px;
	width: 100%;
}
.pull-middle {
	margin-left: 		 calc(50% - 78px);
	margin-left: 	-moz-calc(50% - 78px);
	margin-left: -webkit-calc(50% - 78px);
}
.fullmenu{
	width: 240px;
	float: left;
	background-color: cornflowerblue;
	height: 100%;
	position: absolute;
	top: 0px;
	z-index: 0;
	overflow: auto;
/*	padding: 10px 10px;*/
/*	max-height: 574px;*/
}
.ma::-webkit-scrollbar{
	width:0px;
}
.ma::-webkit-scrollbar-track {
    /*-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); */
/*	background-color: transparent;*/
}
 
.ma::-webkit-scrollbar-thumb {
 /*	border-radius: 10px;
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5); */
    width: 0px;
 /*	border-radius: 3px;*/
    background-color: rgba(0,0,0,0.498);
}

.main{
	z-index: 2;
	background-color:#C6C6C6;
	position: absolute;
/*	height: calc(100% - 96px);
	height: -webkit-calc(100% - 96px);
*/	width: 100%;
	left:240px;
	height:100%;
	-webkit-box-shadow: -4px 0px 8px rgba(0,0,0,0.5);
	box-shadow: -4px 0px 8px rgba(0,0,0,0.5);
}


/***/
.ma{
/*	height: calc(100% - 10px);*/
	height:100%;
	overflow:auto;
	background: -webkit-linear-gradient(left,#CCCC99,#8B9983);
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	padding-bottom: 20px;
}

@media all and (min-width: 100%) {
	.menuClose, .menuOpen {
		width: calc(100% - 240px);
		-webkit-transform: translateX(0px);
		-moz-transform: translateX(0px);
		-ms-transform: translateX(0px);
	}
}

.bridmenuButton{
    width: 70px;
    height: 70px;
    margin-left: 4px;
    margin-right: 4px;
    /*background-image: -webkit-gradient(linear, left top, right bottom, color-stop(0, #FFA2A1), color-stop(0.35, #FFBEBD), color-stop(1, #FFE5E5));*/
    float: left;
    font-size:32px; 
    text-align:center;  
    line-height: 70px;
    color: black;
    /*border:1px solid #be4b48;*/
}

.footerButton{
    float: left;
    width: 33%;
    height: 40px;
    text-align: center;
    font-size: 20px;
    line-height: 40px;
    cursor: pointer;
}
.submenuButtonColor{
    background-image: -webkit-gradient(linear, left top, right bottom, color-stop(0, #C9B5E8), color-stop(0.35, #D9CBEE), color-stop(1, #F0EAF9));
}
.submenuFreeButton{
    height: 200px;
    width: 300px;    
    margin-left: 50px;    
    margin-right: 50px;
}

.footerButtonClicked{
    background-image: -webkit-gradient(linear, left top, right bottom, color-stop(0, #DAFDA7), color-stop(0.35, #E4FDC2), color-stop(1, #F5FFE6));
    border:1px solid #98b954;
}
.footerButtonUnClicked{
    background-image: -webkit-gradient(linear, left top, right bottom, color-stop(0, #BCBCBC), color-stop(0.35, #D0D0D0), color-stop(1, #EDEDED));
    border:1px solid black;
}
.marginLeft1px{
    margin-left:-1px;
}
.closeButtonLine
{
    height: 5%;
    text-align: right;
}
.bridmenu
{
    height: 30%;
}
.submenu
{
    height: 55%;
}
.footer
{
    height: 10%;
}
.displayNone
{
    display: none;
}
.submenuFreeButtonUp
{
    text-align:center;
    font-size: 70pt;
    height: 100px;
    line-height: 100px;
}
.submenuFreeButtonDown
{
    text-align:center;   
    font-size: 20pt;    
    height: 100px;    
    line-height: 100px;
}
.submenuEnjoyButton
{
    height: 200px;    
    width: 150px;    
    margin-left: 25px;    
    margin-right: 25px;    
    float: left;
}
.submenuEnjoyButtonUp
{
    text-align:center;    
    font-size: 50px;    
    height: 100px;    
    line-height: 100px;
}
.submenuEnjoyButtonDown
{
    text-align: center;          
    font-size: 20px;    
    height: 100px;    
    line-height: 100px;
}
.submenuProButtonLayout
{
    height: 100px;
    width: 400px;
}
.submenuProButton{
    height: 80px;
    width: 80px;
    margin-left: 10px;
    margin-right: 10px;
    float: left;
    line-height: 80px;
    text-align: center;
}
.popWin{
    position:absolute; 
    height:400px;     
    width: 400px;    
    left: 50%;    
    top:50%; 
    margin-top:-200px;    
    margin-left: -200px;    
    background: #4f81bd;
}
.popWinMask
{
    background: rgba(95, 158, 160, 0.89);    
    position: fixed;    
    width: 100%;    
    height: 100%;    
    top: 0px;    
    left: 0px;    
    opacity: 0.5;    
    /* display: none; */            
}

/*for hint icon*/
#hintbox {
	position: fixed;
	right: 70px;
	top: 95px;
	margin-top: -45px;
	height: 0;
	max-height: none;
	background: #e6e7e9;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: none;
	z-index: 49;
	display: -webkit-flex;
	display: flex;
	-webkit-flex-direction: column;
	flex-direction: column;
	-webkit-transition: all 200ms ease-out;
	transition: all 200ms ease-out;
	color: #404041;
}
#titlename4 {
	border-bottom: 1px solid #AFAFAF;
	text-align: center;
	font-size: 18px;
	line-height: 48px;
	height: 48px;
	background: #BBBABA;
	border-radius: 6px 6px 0px 0px;
	color: black;
	border-bottom: 2px solid #AFAFAF;
}
#allvideo {
	width: 250px;
	padding-top: 20px;
	padding-bottom: 20px;
	overflow: auto;
	-webkit-flex:1 ;
	flex: 1;
	overflow: auto;
	text-align: center;
}
.hintVideo {
	margin: 10px 20px 25px;
	/*display: -webkit-flex;
	display: flex;*/
	/*cursor: pointer;*/
	text-align: center;
}
.hintVideo>div {
	font-size: 20px;
	line-height: 30px;
	/*display: -webkit-flex;
	display: flex;
	-webkit-align-items: center;
	align-items: center;
	padding: 10px;*/
}
.hintBtn {
    margin: 0px 10px;
    width: 50px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    vertical-align: middle;
    box-shadow: rgba(255, 255, 255, 0.2) 0px 1px 0px inset, rgba(0, 0, 0, 0.0470588) 0px 1px 2px;
    border: 1px solid rgb(184, 185, 187);
    text-shadow: none;
    box-sizing: content-box;
    background: -webkit-linear-gradient(top, rgb(207, 208, 210), rgb(137, 138, 140));
}
.hintBtn:hover{
	background:-webkit-linear-gradient(top,#707173,#48484a);
	color:white;
}
#allvideo::-webkit-scrollbar{
	width: 5px;
}
#allvideo::-webkit-scrollbar-thumb {
	width: 5px;
	background-color: rgba(0,0,0,0.498);
}
span.eduText {
    float: left;
    margin-right: 45px;
    font-size: 16px;
    color: #404041;
    letter-spacing: 2px;
}
</style>


<div class="fullmenu">
	<div class="ma">
		<%@ include file = "menu.jsp"%>
	</div>
</div>
<header class="navbar menuClose">
	<div class="navbar-inner navbar-state-top itsnavbar itstopbar">
		<span class="pull-left">
			<span id="menuTrigger" href="#menu" class="menu-trigger naviMenu">
				<!--
				<img class="naviBtn" src="<%=pURL%>images/naviBar/menu_3.png"/>
				-->
				<img class="naviBtn" src="<%=pURL%>game_platform/images/menu/banner_btn01.svg"/>
				
			</span>
		</span>
		<span class="pull-right">
			<span id='iamlittlehelp'>
				<img src="<%=pURL%>game_platform/images/menu/banner_btn02.svg" />
			</span>
<!--			<a id="layoutTrigger" href="#layout" class="layout-trigger naviLayout">
				<img class="naviBtn" src="<%=pURL%>images/naviBar/layout_1.png"/>
			</a>
			<a id="searchTrigger" href="#search" class="search-trigger naviSearch">
				
				<img class="naviBtn" src="<%=pURL%>images/naviBar/search.svg"/>
			</a>
-->
			<span class="eduText" style="cursor: default;">♦ 教育版 ♦</span>
		</span>
	</div>
</header>
<div id="hintbox">
	<!-- <div class="text" id="titlename4">Holiyo小幫手</div> -->
	<div id="allvideo">
		<div class="hintVideo" id='downloadhelper'>
			<div>觀看使用手冊</div>
		</div>
		<div class="btn hintBtn text" id="OKbtn_x" onclick="download()">觀看</div>
		<div class="btn hintBtn text" id="NObtn_x">取消</div>
	</div>
</div>
<script>
$(document).ready(function(){
	if ($window.width() > 1026) {
		menu_open();
	}
});

$(window).resize(function(event){
	if ($window.width() < 1026) {
		menu_close();
	}else{
		menu_open();
	}
});
function download(){
	window.open(location.origin+'/game/game_platform/ppt/Holiyo密逃遊戲翻轉平台使用手冊_2016NOV(HDT).pdf');
	$('#hintbox').toggle();
	// var fid = event.currentTarget.id;
	// if(fid == 'downloadhelper'){
	// 	window.open(location.origin+'/game/game_platform/ppt/helper.pdf');
	// }else if(fid == 'downloadfree'){
	// 	window.open(location.origin+'/game/game_platform/ppt/free_01.pptx');
	// }
}

	window.history.forward(1);
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
		});
		$('#OKbtn_x').click(function() {
			$('.hintBtn').unbind('click');
			$('#hintbox').height(0);
			$('#hintbox').css('box-shadow', 'none');
		});
	});

	$('#menuTrigger')[0].addEventListener('touchstart', menu_click, false);
	$('#menuTrigger')[0].addEventListener('click', menu_click, false);	
	function menu_click(evt){
		if($('body').scrollLeft()==240) {
			$('body').animate({scrollLeft:0},240);
			return;
		}

		if(evt.type=="click"){
		//	$('.navbar').css({'position':'absolute'});
		}
		else if(evt.type=="touchstart"){
		//	$('.navbar').css({'position':'absolute'});
			evt.preventDefault();  
			evt.stopPropagation(); 
		}

		if($('.navbar').hasClass('menuClose') ) {
			menu_open();
		}
		else if($('.navbar').hasClass('menuOpen')){
			menu_close();
		}
			
		
	}

	function menu_open() {
		$('.navbar').switchClass('menuClose', 'menuOpen', 200);
		$('.main').switchClass('menuClose', 'menuOpen', 200);
		$('#iamlittlehelp').css('padding-right','240px');
		$('#shareSelect').css('padding-right', '240px');
		$('.rect').css('margin-right', '240px');
	}
	function menu_close() {
		$('.navbar').switchClass('menuOpen', 'menuClose', 200);
		$('.main').switchClass('menuOpen', 'menuClose', 200);
		$('#iamlittlehelp').css('padding-right','0px');
		$('#shareSelect').css('padding-right', '0px');
		$('.rect').css('margin-right', '0px');
	}




//	$('#searchTrigger').click(search_open);
//	$('#toolsTrigger').click(tools_open);

	function search_open(){
		var isOpen = $('.itsSearchBar').css('display');
		if(isOpen=='none') {
			$('.itsToolBar').hide(20, function(){
				$('.itsSearchBar').show(200);
			});
		}
		else if(isOpen=='block') {
			$('.itsSearchBar').hide(200);
		}
	}
	function tools_open() {
		var isOpen = $('.itsToolBar').css('display');
		if(isOpen=='none') {
			$('.itsSearchBar').hide(20, function(){
				$('.itsToolBar').show(200);
			});
		}
		else if(isOpen=='block') {
			$('.itsToolBar').hide(200);
		}
	}
	var aa=0;
	var bb=0;
	var wait;
	var conutAC = new Array();
	window.onscroll = function(evt){
		if(bb==0){
			bb=1;
			wait = setInterval('waitonscrollstop()',100);
		}
		if(aa==0) {
			var count = $('body').scrollLeft();
			conutAC.push(count);
		}
		console.log('aa:'+aa+" , bb:"+bb);
	}
	var tempCountAClast=-1;
	function waitonscrollstop() {
		if(conutAC.length==1)
			return;
		console.log('a:tempCountAClast:'+tempCountAClast+" , conutAC:"+conutAC);
		if(tempCountAClast!=conutAC[conutAC.length-1]) {
			tempCountAClast=conutAC[conutAC.length-1];
		}
		else{
			clearTimeout(wait);
			console.log('b:tempCountAClast:'+tempCountAClast+" , conutAC:"+conutAC);
			aa=1;
			if(conutAC[0]<conutAC[conutAC.length-1]) {	//拖曳開的過程
				if(conutAC[conutAC.length-1]<120)		//拖曳不到一半
					$('body').animate({scrollLeft:0},$('body').scrollLeft(), function(){aa=0;bb=0});
				else
					$('body').animate({scrollLeft:240},240 - $('body').scrollLeft(), function(){aa=0;bb=0});
			}
			else{
				if(conutAC[conutAC.length-1]>=120)		//拖曳不到一半
					$('body').animate({scrollLeft:240},240 - $('body').scrollLeft(), function(){aa=0;bb=0});
				else
					$('body').animate({scrollLeft:0},$('body').scrollLeft(), function(){aa=0;bb=0});
			}
			conutAC = new Array();
		}
	}
</script>
