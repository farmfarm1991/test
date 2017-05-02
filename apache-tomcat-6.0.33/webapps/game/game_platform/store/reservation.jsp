<!DOCTYPE html>
<%@include file="../navbar_t2.jsp"%>
<%
String userRole = auth.getMainRoleID();
String userloadlink = userRole.equals("student")?"ByStudentID":"ByTeacherID";
String userID = auth.getUserID();
String userName = auth.getUserName();

%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="user-scalable=0">
<script type="text/javascript" src="../../js/xml2json.js" ></script>
<script type="text/javascript" src="../../js/iTS5Dialog.js"></script>
<script type="text/javascript" src="js/html2canvas.js"></script>
<link rel="stylesheet" href="freeType.css"></link>
<head>
<style type="text/css">
@viewport{
	user-zoom: fixed;
}
body{
	padding-top: 42px;
	overflow: hidden;
	min-width: 620px;	
}
.main{
	/*top: 23px;*/
	background-color: #F1DFCF;
}
.list{
	height: 100%;
	padding-bottom: 42px;
		box-sizing: border-box;
}
.itsSearchBar{
	min-height: 36px;
	/*padding-top: 18px;*/
	padding-left: 20px;
	background-color: #F8F8F8;
	position: absolute; 
	top: 0px !important;
	width: 100%;
	transition: all 200ms ease-out;
	-webkit-transition: all 200ms ease-out;
	-webkit-box-shadow: 4px 0px 8px rgba(0,0,0,0.5);
	box-shadow: 4px 0px 8px rgba(0,0,0,0.5);
	z-index: 1;
}
.specborder{
	border-radius: 3px;
	margin: 6px;
	display: inline-block;
	position: relative;
}
.specborder:before{
	content:"";
	width: 0px;
	height: 0px;
	position: absolute;
	top: 11px;
	/*margin-left:102px;*/
	border-top: 9px solid black;
	border-left: 5px solid transparent;
	border-right: 5px solid transparent;
	pointer-events:none;
	right:12px;
}
.specborder:after {
	/*content: "";*/
	width: 1px;
	height: 28px;
	top:7px;
	position: absolute;
	background: #CFCFCF;
	margin-left: 91px;
	pointer-events:none;
}

.sixfilter{
	width: 121px;
	height: 28px;
	margin: 1px;
	overflow: hidden;
	-webkit-appearance: none;
	   -moz-appearance: none;
	font-size: 14px;
	line-height: 1;
	border-radius: 3px;
	border: 1px solid #CFCFCF;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#FFF), to(#F4F4F4));
	background: -webkit-linear-gradient(top, #FFF 0%,#F4F4F4 100%);
	background: -moz-linear-gradient(#FFF,#F4F4F4);
	padding-right: 5px; 
	text-indent: 0.01px; 
	text-overflow:'';
}
.sixfilter:focus {
	outline: 0px;
}
/*matedata*/
.riverbox {
	overflow-y: auto;
	overflow-x: hidden;
	margin: 18px 0 0 0;
	height: 100%;
	list-style-type: none;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	        box-sizing: border-box;
	padding-top: 68px;
	padding-bottom: 20px;
	-webkit-overflow-scrolling: touch;
}
.riverbox::-webkit-scrollbar {
	width: 5px;
}
.riverbox::-webkit-scrollbar-thumb {    
	width: 5px;
	border-radius: 5px;
	background-color: rgba(0,0,0,0.498);
}
.exampage, .formapuse {
	height: 215px;
	background-color: white;
	margin-bottom: 20px;
	font-size: 13px;
	-webkit-box-shadow: 3px 3px 5px -2px rgba(100,100,100,0.498039);
	box-shadow: 3px 3px 5px -2px rgba(100,100,100,0.498039);
	border-radius: 2px;
	text-align: right;
	width: 90%;
	max-width: 824px;
	margin-left: auto;
	margin-right: auto;
}
.inside {
	position: relative;
}
#matedata {
	position: absolute;
	left: 220px;
	right: 0px;
	margin: 12px 0px 28px 15px;
}
.toolbarx+img {
	width: 210px;
	height: 95px;
	position: absolute;
	top: 10px;
	left: 9px;
	/*clip: rect(30px, 210px, 125px ,0px);*/
	/*background-image: url('../../images/nopreview.png');*/
	-webkit-background-size: cover;
	        background-size: cover;
	background-position: 50%;
	border: none;
}
.toolbarx+div {
	width: 210px;
	height: 95px;
	position: absolute;
	top: 10px;
	left: 9px;
	/*clip: rect(30px, 210px, 125px ,0px);*/
	/*background-image: url('../../images/nopreview.png');*/
	-webkit-background-size: cover;
	        background-size: cover;
	background-position: 50%;
	border: none;
}
.content,.title,.subheading {
	font-size: 13px;
	text-align: left;
	color: black;
	line-height: 6px;
	overflow: hidden; 
	line-height: 23px;
	padding-right: 10px;
}
.content>img {
	margin-top: -4px;
}
.title{
	font-size: 19px;
	line-height: 30px;
	color: #282828;
	margin-top: -3px;
}
.subheading {
	color: #7F7F7F;
}
.toolbarx {
	width: 100%;
	background-color: rgb(247,248,248);
	height: 32px;
	position: absolute;
	top: 183px;
	overflow: hidden;
	left: auto;
	right: 0px;
	margin: 0px;
	padding: 0px;
	border-top: 1px solid rgb(220,221,221);
}
.toolbarx>span {
	/*width: 80px;*/
	min-width:80px;
	height: 100%;
	display: inline-block;
	text-align: center;
	line-height: 32px;
	color: rgb(116,115,116);
	cursor: pointer;
}
.toolbarx>span>.toolBtn,.toolbarx>span>span>.toolBtn {
	margin: -2px 5px 0px 0px;
}
.toolbarx > span:last-child {
	margin-right: 10px;
}
.toolbarx>span:active{
	background: #DCDDDD;
	background: -webkit-linear-gradient(top,#C9CAcA 0%, #FFF 100%);
	color:#3E2A39;
}

span#classNM {
	/*width: 160px;*/
	overflow: hidden;
	display: inline-block;
	/*height: 11px;*/
	text-overflow: ellipsis;
	vertical-align: top;
	margin-top: -3px;
	padding-top: 3px;
	padding-left: 3px;
}
.toolbarx+div.listImg{
	top: 0;
    left: 0;
    position: absolute;
    width: 215px;
    height: 183px;
    background-image: url(img/form1.jpg);
}
#newImg{
	left: -3px;
    top: -3px;
    position: absolute;
    width: 100%;
    height: 100%;
    z-index: 1;
    background-image: url(img/new.svg);
    background-repeat: no-repeat;
}
</style>
</head>
<body>
	<div class="fullmain">
	<div id="studen_stat_table">
		<div id="maskpage"></div>
			<div>
				<div id="stuListbox">
					<div class='text' id="titlename1">指派班級</div>
					<div id="allclass"></div>
					<div class='choicebox'>
						<div class='btn text' id="OKbtn">確定</div>
						<div class='btn text' id="NObtn">取消</div>
					</div>
				</div>
				<div id='msg' class='isConfirm'>
						<div class='text' id="titlename2"></div>
						<div id="msgMain"></div>
						<div class='choicebox'>
							<div class='btn text' id="OKbtn2">確定</div>
							<div class='btn text' id="NObtn2">取消</div>
						</div>
				</div>
			</div>
		</div>
		<div id="wrapper" class="main menuClose">
			<div class="list" style='height:100%;'>
				<ul class="riverbox">
					<li class="formapuse">
					</li>
				</ul>
			</div>
			<div id='gototop'></div>
			<div class="navbar-state-top itsnavbar itsSearchBar">
				<span class="specborder">
					<select id="category" class="sixfilter">
						<option value="c%" class="text" id="allarea">所有類型</option>
						<option value="1">體驗活動</option>
						<option value="2">主題研習</option>
						<option value="3">學生營隊</option>
						<option value="4">文教活動</option>
					</select>
				</span>
			</div>
		</div>
　　</div> 		
</body>
<script>
$("#category").change(function(){
	loadData();
});
var oldFliter = "c%";
var newFliter='';

//紀錄目前篩選器
function getfilterKey(){
	var c = $("#category").val();
	newFliter = c;
	var temp = "";
	if(c == "c%"){
		c="";
	} else {
		temp = c;
	}

	return temp;
}
$(document).ready(function(){
	loadData();
});
var url ="http://goo.gl/forms/VjhQvRVNok";
function loadData(){
	$('.exampage').remove();
	var filter = getfilterKey();
	// var imgurl = "http://192.168.1.40:8080/game/game_platform/images/nopreview0.png";
	var imgurl = "img/form1.jpg@@@img/form2.jpg@@@img/form2.jpg@@@img/form3.jpg@@@img/form4.jpg@@@";
	var title = "校園密逃翻轉學堂@@@密逃翻轉教學應用@@@密逃翻轉課程實作@@@「解密逃、合作學」學生營隊/假日課程@@@密室逃脫主題活動";
	var secTitle = "Holiyo結合「遊戲式教學」、「合作學習」及「行動學習」，讓您體驗好玩的【密逃翻轉】教學活動 !! 一起來玩中學～@@@帶您體驗與瞭解，如何將Holiyo與『遊戲式教學』、『合作學習』及『行動學習』三項策略，與教學設計結合。@@@是想要做出一堂密逃翻轉課程及教材之教學者的專屬體驗與實作課！運用Holiyo，做出好玩的密逃遊戲翻轉教學活動～@@@可與校方合辦，藉由Holiyo與『遊戲式教學』、『合作學習』及『行動學習』三項教學策略，引導學生動腦、互動、討論及使用所學的學科知能。@@@配合合作之文社教單位機構，如歷史博物館、國立美術館、國家圖書館、科學教育館等展館，根據展期主題需求，客製設計在地社區文教密逃活動。";
	var time = "1小時@@@2小時@@@3小時@@@依需求而定@@@依需求而定";
	var location = "依場地需求安排";
	var people = "高中、國中、國小教師@@@高中、國中、國小教師@@@高中、國中、國小教師@@@高中、國中、國小學生@@@文社教單位機構之參觀一般民眾，或社區導覽觀光主題活動目標對象";
	var singUp = "請填單預約";
	var category = [1,2,2,3,4];

	for (var i= 0; i < 5; i++) {
		var temp = "<li class='exampage' style='width:100%' id="+i+" category="+category[i]+">"+
						"<div class='inside'>"+
							"<div id='matedata'>"+
								"<div class='title'>"+title.split('@@@')[i]+
									"<div class='subheading'>"+
									secTitle.split('@@@')[i]+"</div>"+
									"<div class='content'>"+
									"時間："+time.split('@@@')[i]+"<br>"+
									"地點："+location+"<br>"+
									"對象："+people.split('@@@')[i]+"<br>"+
									"報名時間："+singUp+"</div>"+
								"</div>"+
							"</div>"+
							"<div class='toolbarx'>"+
								"<span onclick='form()'>"+
									"<img class='toolBtn' src='../images/tools/edit.svg'>"+
									"<span class='text' id='edit_label'>我要報名</span>"+
								"</span>"+
							"</div>"+
							 "<div class='listImg'><span id='newImg'></span></div>"+
							"<div class='ishotplan' text='取消分享至雲端'></div>"+
						"</div>"+
					"</li>";
					//
		//篩選
		if($('#category option:selected').val() == category[i] || $('#category option:selected').val()=='c%'){
			//產生畫面
			$('.formapuse').append(temp);
		}
		$('#'+i+' .listImg').css('background-image','url('+imgurl.split('@@@')[i]+')');
	}
	if($('.exampage').length <= 0 && newFliter != 'c%'){
		iTS5Dialog.myAlert("查無資料", function() {
			$("select#category").val(oldFliter);
			loadData();
		});
		return;
	}
	//紀錄上一次篩選
	oldFliter = newFliter;

}
function form(){
	window.open(url);
}
</script>
</html>