<!DOCTYPE html>
<%@include file="../navbar_t2.jsp"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="flex.dao.DBManger" %>
<%@ page import="flex.dao.DBUtils" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
String userRole = auth.getMainRoleID();
String userloadlink = userRole.equals("student")?"ByStudentID":"ByTeacherID";
String userID = auth.getUserID();
String userName = auth.getUserName();

DBManger db = DBUtils.getDBManger();
Connection conn = db.connWrite();
Connection connR = db.connRead();
String output = "";
String SQL_select_exchange = "select * from game_exchange where game_exchange.`show`='1' order by orderNum desc";
try {
 	PreparedStatement pStatement = conn.prepareStatement(SQL_select_exchange);
 	ResultSet rs = pStatement.executeQuery();
	while(rs.next()){
 		String orderNum = rs.getString("orderNum");
 		String title = rs.getString("title");
 		String pointUrl = rs.getString("pointUrl");
 		String pointNum = rs.getString("pointNum");
 		String cardUrl = rs.getString("cardUrl");
 		String productType = rs.getString("productType");
 		String buyType = rs.getString("buyType");
 		String img = rs.getString("img");
 		String detailImg = rs.getString("detailImg");

 		output = output+"@Data||"+orderNum+"|||"+title+"|||"+pointUrl+"|||"+pointNum+"|||"+cardUrl+"|||"+productType+"|||"+buyType+"|||"+img+"|||"+detailImg;
 		//System.out.print("!!!!!!!!!"+creatorName);
 	}
 	pStatement.close();
	} catch (NumberFormatException e) {
	 	System.out.println(e.getMessage());	
	} catch (SQLException e) {
	 	System.out.println(e.getMessage());
	}

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
	min-width: 300px;	
}
.list{
	height: 100%;
	padding-bottom: 42px;
	box-sizing: border-box;
}
/* fitter bar */
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
.riverbox {
	overflow-y: auto;
	overflow-x: hidden;
	margin: 0px;
	height: 100%;
	list-style-type: none;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding-top: 68px;
	padding-bottom: 20px;
	-webkit-overflow-scrolling: touch;
}
.scroll::-webkit-scrollbar {
	width: 5px;
}
.scroll::-webkit-scrollbar-thumb {
	width: 5px;
	border-radius: 5px;
	background-color: rgba(0,0,0,0.498);
}

.formapuse{
	height: 60px;
	background-color: transparent;
	box-shadow: none;
}
#gototop {
	position: absolute;
	bottom: 52px;
	right: 10px;
	width: 50px;
	height: 50px;
	background: aquamarine;
	background: url('img/totop.svg');
	background-repeat: no-repeat;
	display: none;
	cursor: pointer;
}
#searchBarFirstItem, #layoutBtn{
	margin-left:20px;
	display: inline-block;
	vertical-align: middle;
	border-radius: 3px;
}

/*書籤牆 CSS */
.scroll{
	height: 100%;
	width: 100%;
	min-width: 370px;
	position: relative;
	overflow-y: auto;
	overflow-x: hidden;
	-webkit-overflow-scrolling: touch;
}
.outside{
	/*background-color: #ccc;*/
	height: 100%;
	width: 90%;
	/*position: fixed;*/
	position: absolute;
	padding-top: 0px;
	padding-left: 50px;
	/*box-sizing: border-box;*/
}
.square{
	height: 250px;
	width: 220px;
	position: absolute;
	float: left;
	background-color: white;
	/*margin: 10px;*/
	transition-duration:0.4s;
	transition-property:transfrom,opacity;	
	transition: all 300ms ease-out;
}
.square>div{
	text-align: left;
}
.square>img{
	margin-left:48px;
}

.label3 {
    position: relative;
    height: 100%;
    width: 100%;
    box-shadow: 3px 3px 7px rgba(20%,20%,40%,0.3);
}

.textResize {
    position: absolute;
    bottom: 0px;
    height: 30px;
    width: calc(100% - 10px);
    background-color:#58595B;
    color: #E6E7E8;
    font-size: 14px;
    line-height: 30px;
    font-weight: normal;
    padding: 0px;
    text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	padding-left: 10px;
}
.content {
    font-size: 15px;
    background: white;
    height: 165px;
    word-wrap: break-word;
    white-space: pre;
    line-height: 23px;
    margin: 0 10px 0 10px;
}

.title {
	font-size: 20px;
    position: relative;
    margin: 0px 10px 0  10px;
    text-align: center;
    font-weight: bold;
}
.pictureResize,.pictureResize>img{
	width: 100%;
	height: 125px;
	background: white;
}
.buttonResize{
    width: 50%;
    height: 30px;
    background-color: transparent;
    line-height: 30px;
    position: absolute;
    bottom: -30px;
    color: #404041;
    /*display: flex;
    justify-content: flex-end;*/
}
.buttonResize[type='point']{
	float: left;
	border-right: 0.5px solid #404041;
}
.buttonResize[type='card']{
	left: 50%;
}
.buttonResize[type='point'] a{
	display: block;
	width: 110px;
	text-align: center;
}
.buttonResize[type='card'] a{
	display: block;
	width: 110px;
	text-align: center;
}
#imgAdjust{
	background-size: contain;
	background-position-x:50%;
	width: 100%;
	height: 220px;
	position: absolute;
	background-repeat: no-repeat;
	background-position: 50%;
}
.singUp{
	position: absolute;
}
a:hover{
	/*color: #ededed;*/
	text-decoration: none;
}

#newImg{
	left: -3px;
    top: -3px;
    position: absolute;
    width: 100%;
    height: 50%;
    z-index: 1;
    background-image: url(img/new.svg);
    background-repeat: no-repeat;
}
.main{
	background-color: #F1DFCF;
}
/*#point{
	left: 15px;
}
#money{
	left: 80px;
}
#card{
	right: 20px;
}*/
/*.pageS{
	box-shadow: 1px 2px 4px gray;
	border: 1px solid beige;
}*/
.rect {
	position: fixed;
	display: inline-block;
	background-color: rgba(201, 140, 84, 0.5);
	width: 40px;
	height: 5px;
	margin: 8px;
	border-radius: 4px;
}
.rect>p{
	margin-top: -35px;
}
.rect-indicator {
	background-color: rgb(180, 120, 65);
}
@media all and (max-width: 740px) {
	.specborder{
		margin:6px -3px;
	}
	#searchbarfirstitem {
		margin-left: 1px;
	}
	.sixfilter{
		width: 120px;
	}
	.itsSearchBar{
		display: -webkit-box;
		/*-webkit-box-pack:center;*/
	}
}
/* dialog scroll */
#myMsgMain::-webkit-scrollbar {
	width: 5px;
}
#myMsgMain::-webkit-scrollbar-thumb {
	width: 5px;
	border-radius: 5px;
	background-color: rgba(0,0,0,0.498);
}
</style>
</head>
<body>
	<div class="fullmain">
		<div id="studen_stat_table">
			<div id="maskpage"></div>
			<div>
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
				<div class="scroll">
					<div class="outside">
					</div>
				</div>
			</div>
			<div id='gototop'></div>
			<div class="navbar-state-top itsnavbar itsSearchBar">
				<span class="specborder">
					<select id="gtype" class="sixfilter">
						<option value="t%" class='text' id='allarea'>全部商品總覽</option>
						<option value='1'>主題包</option>
						<option value='2'>教具</option>
						<option value='3'>禮券</option>
						<option value='4'>周邊</option>
						<option value='5'>硬體</option>
						<option value='6'>文具</option>
					</select>
				</span>
				<span class="specborder">
					<select id="buyType" class="sixfilter">
						<option value="m%" class='text' id='allbuy'>採購方式</option>
						<option value='1'>點數兌換</option>
						<!-- <option value='2'>現金</option> -->
						<option value='3'>老師好站</option>
					</select>
				</span>
				<button class="pointbtn" style="display: none; right: 40px; position: absolute; top: 8px; width: 121px; height: 28px; border-radius: 3px; border: 1px solid #CFCFCF; background-image: -webkit-gradient(linear, left top, left bottom, from(#FFF), to(#F4F4F4)); background: -webkit-linear-gradient(top, #FFF 0%,#F4F4F4 100%);" onclick="pointCode()">輸入兌換碼</button>
			</div>
		</div>
	</div>		
</body>
<script>
var output = "<%=output%>";
$(document).ready(function(){
	// navbar filter hid
	$('#gradeID').parent().css('display','none');
	$('#domain').parent().css('display','none');

	// show view
	displayViewContent(1);
});
var oldFliter = "t%,m%";
var newFliter='';
//紀錄目前篩選器
function getfilterKey(){
	var t = $("#gtype").val();
	var m = $("#buyType").val();
	newFliter = t;
	var temp = "";
	if(t == "t%"){
		t="";
	} else {
		temp = t;
	}
	newFliter = newFliter +","+m;
	if(m == "m%"){
		m="";
	} else {
		temp = temp+ "," + m;
	}

	if(temp.length == 0) {
		temp = "nofilter";
		hasfilter = false;
	}

	return temp;
}
function displayViewContent(num){
	// 清除畫面
	$('.square,.rect').remove();
	// 測試
	// var testTemp = '<div class="square"><div class="label3" id="store0" gtype="3" buytype="1,3"><div class="pictureResize"><span id="imgAdjust" onclick="productDetail(this)" img="null" style="cursor: pointer; background-image: url(img/test.JPG);"></span></div><div class="textResize">此為測試專區</div><div class="buttonResize" type="point"><btn id="point" class="singUp" style="cursor:default" onclick="xapiData(this)"><a href="https://docs.google.com/a/hdtech.com.tw/forms/d/e/1FAIpQLSd28XnUxkrbhgEq0YM0YgXGcmZGO_ld9Uwei5JosWZv2SibtA/viewform" target="blank" num="5,000"> 5,000點兌換</a></btn></div><div class="buttonResize" type="card"><btn id="card" class="singUp" style="cursor:default" onclick="xapiData(this)"><a href="http://www.pcstore.com.tw/hdtedu" target="blank"> 立即購買</a></btn></div></div></div>';
 // 	$('.outside').append(testTemp);
	
	var squarenum = 0;
	var filterKey = getfilterKey();
	var exchangeData = output.split("@Data||");
	var page = Math.ceil((exchangeData.length - 1) / 6);
	var pageNum = num;

	for (var i = 1; i < exchangeData.length; i++) {
		var titleArray = exchangeData[i].split("|||")[1];
		var urlArray = exchangeData[i].split("|||")[4];
		var gArray = exchangeData[i].split("|||")[5];
		var bArray = exchangeData[i].split("|||")[6];
		var pointArray = exchangeData[i].split("|||")[2];
		var pointNumA = exchangeData[i].split("|||")[3];
		var img = exchangeData[i].split("|||")[7];
		var detailImg = exchangeData[i].split("|||")[8];
		var template =	"<div class='square'>"+
						"<div class='label3' id='store"+i+"' gtype="+bArray+" buyType="+gArray+">"+
							"<div class='pictureResize'><span id='imgAdjust' onclick='productDetail(this)' img="+detailImg+" style='cursor:pointer;' /></div>"+
							"<div class='textResize'>"+titleArray+
							"</div>"+
							"<div class='buttonResize' type='point'></div><div class='buttonResize' type='card'></div>"+
						"</div>"+
					"</div>";
		var imgUrl = "img/"+img;

		var pointHref = "href="+pointArray+" target='_blank'";
		var showPointT = pointNumA+"點兌換";
		if (pointNumA == "null") {
			showPointT = "不提供點數兌換";
			pointHref = "";
		}
		var cardHref = "href="+urlArray+" target='_blank'";
		var showCardT = "立即購買";
		if (urlArray == "null") {
			showCardT = "不提供現金購買";
			cardHref = "";
		}
		var pointTemp = "<btn id='point' class='singUp' style='cursor:default' onclick='xapiData(this)'>"+
							"<a "+pointHref+" num='"+pointNumA+"'>"+
							" "+showPointT+"</a></btn>";
		// var moneyTemp = "<btn id='money' class='singUp' style='display:none' onclick='xapiData(this)'>"+
		// 					"<a href="+cashArray+" target='blank'>"+
		// 					" 現金</a></btn>";
		var cardTemp = "<btn id='card' class='singUp' style='cursor:default' onclick='xapiData(this)'>"+
							"<a "+cardHref+">"+
							" "+showCardT+"</a></btn>";

		//篩選
		if(gArray.split(',').some(function(value,index,array){return value == $('#buyType option:selected').val()?true:false}) || $('#buyType option:selected').val()=='m%'){
			if(bArray.split(',').some(function(value,index,array){return value == $('#gtype option:selected').val()?true:false}) || $('#gtype option:selected').val()=='t%'){
				// if($('.square').length < pageNum * 6){
				 	$('.outside').append(template);
				// }
				// squarenum++;
			}
		}
		$("#store"+i+" .buttonResize[type='point']").append(pointTemp);
		// $("#store"+i+" .buttonResize").append(moneyTemp);
		$("#store"+i+" .buttonResize[type='card']").append(cardTemp);

		$(".buttonResize[type='card'] a").hover(function(){
			$(event.target).text('[老師好站]');
			$(event.target.parentElement.parentElement).css('background-color','#929497');
			$(event.target).css('color','#E6E7E8');
		}, function(){
			var showCardT = "立即購買";
			if ($(event.target).attr('href') == undefined ) {
				showCardT = "不提供現金購買";
			}
			$(event.target).text(showCardT);
			$(event.target.parentElement.parentElement).css('background-color','transparent');
			$(event.target).css('color','#404041');
		});
		$(".buttonResize[type='point'] a").hover(function(){
			$(event.target).text('兌換');
			$(event.target.parentElement.parentElement).css('background-color','#929497');
			$(event.target).css('color','#E6E7E8');
		}, function(){
			var showPointT = $(event.target).attr('num')+"點兌換";
			if ($(event.target).attr('num') == "null") {
				showPointT = "不提供點數兌換";
			}
			$(event.target).text(showPointT);
			$(event.target.parentElement.parentElement).css('background-color','transparent');
			$(event.target).css('color','#404041');
		});

		// var filterGtype = gArray.split(',');
		// for (var a = 0; a < filterGtype.length; a++) {
		// 	if (filterGtype[a] == "1") {
		// 		$("#store"+i+" #point").css('display','');
		// 	}
		// 	// else if (filterGtype[a] == "2") {
		// 	// 	$("#store"+i+" #money").css('display','');
		// 	// }
		// 	else if (filterGtype[a] == "3") {
		// 		$("#store"+i+" #card").css('display','');
		// 	}
		// }
		// if (filterGtype.length == 2) {
		// 	$("#store"+i+" #point").css('left','70px');
		// 	$("#store"+i+" #card").css('right','20px');
		// }else{
		// 	if (filterGtype[0] == "1") {
		// 		$("#store"+i+" #point").css('right','20px');
		// 	}else if (filterGtype[0] == "3") {
		// 		$("#store"+i+" #card").css('right','20px');
		// 	}
		// }
		$('#store'+[i]+' #imgAdjust').css('background-image','url('+imgUrl+')');
	}
	// page = Math.ceil(squarenum / 6);

	// if(pageNum > 1){
	// 	for(var i = 0; i < (pageNum-1) * 6; i++){
	// 		$($('.square')[0]).remove();
	// 	}
	// }
	// for(var i = 1; i <= page; i++){
	// 	$('.outside').append("<div id='page"+i+"' class='rect' style='cursor:pointer;text-align:center;line-height:40px;font-size:20px;bottom:50px;right:"+parseInt((page-i+1)*40+5*(page-i))+"px;' onclick='displayViewContent("+i+")'><p>"+i+"</p></div>")
	// }
	// $('#page'+num).addClass('rect-indicator');

	if($('.square').length <= 0 && newFliter !="t%,m%"){
		iTS5Dialog.myAlert("查無資料", function() {
			$("select#gtype").val(oldFliter.split(',')[0]);
			$("select#buyType").val(oldFliter.split(',')[1]);
			displayViewContent(1);
		});
		return;
	}
	//紀錄上一次篩選
	oldFliter = newFliter;

	resize();
	//$(window).resize(resize);
}
function productDetail(evt){
	var imgName = $(evt).attr('img');
	var productTemp = "";
	if(imgName != "null"){
		productTemp = "<img src='img/detail/"+imgName+"' width=100%>";
	}else{
		imgName = $($(evt).css('background-image').split('/')).get(-1).split('"')[0];
		productTemp = "<img src='img/"+imgName+"' width=100%>"
	}
	iTS5Dialog.myHtmlObject({'html':productTemp,
							 'type':'Alert',
							 'width':'400px', 
							 'height': '400px',
							 'title':'官方公告'
							});
	$('#msg.isAlert').css({'background-color':'#FFFFFF','display':'flex'});
	$('#closeBtn').css({'margin-left':'350px','z-index':'1'});
	$('#myMsgMain').css({'background-color':'#FFFFFF','margin-top':'0px','overflow-x':'hidden','overflow-y':'auto','height':'100%','width':'100%'});
}
function xapiData(evt){
	var objectName,description,verb;
	var productID = evt.parentElement.parentElement.id;
	var formBtn = evt.textContent.trim();
	var productName = $('#'+productID+' .textResize').text();

	xapiData.objectName = productName;
	xapiData.description = formBtn;
	xapiData.verb = "purchased";
	xAPIinit(xapiData);
}
var orginLeft = 0;
function getLeftVaule(x){
	outsideW = $window.width();
	if ( $('header').hasClass('menuOpen') ) {
		outsideW = outsideW-240;
	}
	num=outsideW/270; 
	num=parseInt(num);//取個數，屬於第幾個

	orginLeft = (outsideW-(230*num+40*(num-1)))/2;
	return 270*x+orginLeft ;
}
function getTopVaule(y){
	return 310*y+90;
}
var oldScrollTop = 0;
var outsideW;
function resize(){
	outsideW = $window.width();
	//menu width
	if ( $('header').hasClass('menuOpen') ) {
		outsideW = outsideW-240;
	}
	num=outsideW/270; 
	num=parseInt(num);//取個數，屬於第幾個
	numLength=$('.square').length;
	row=numLength/num;
	row=Math.ceil(row);//取行數，屬於第幾排

	for(i=0;i<row;i++){ 
		for(j=0;j<num;j++){
			$($('.square')[i*num+j]).attr('style','top:'+getTopVaule(i)+'px; left:'+getLeftVaule(j)+'px;');
			// 新增版權說明文字
			/*if (i == row-1 && j == num-1) {
				var copyTop = getTopVaule(i+1);
				var copyClass = 'top:'+copyTop+'px';
				$('.scroll').css('overflow','auto');
				// 畫面調整
				if (copyTop + 226 + 15 < $('.outside').height() ) {
					copyClass = 'bottom:55px';
					$('.scroll').css('overflow','hidden');
				}
				$('#copyrightT').remove();
				$('.outside').append('<div id="copyrightT" style='+copyClass+'>本平台感謝台南市資訊教育輔導團楊易霖、陳秀梅老師協助製作     本平台軟體相關智慧財產權為宏鼎資訊股份有限公司所有</div>');
			}*/
		}
	}
	
}
/*畫面移動效果*/
window.onresize = function(event){
	// alert("change");
	menuWidthIsOpen();
	// resize();

}
$('.pull-left').bind('touchend click',function(){
	menuWidthIsOpen();
	// resize();
});
//以下進入篩選功能
$("#buyType").change(function(){
	displayViewContent(1);
});
$("#gtype").change(function(){
	displayViewContent(1);
});

function menuWidthIsOpen(){
	
	if ($window.width() < 1026 && $('.navbar').hasClass('menuOpen')) {
		$('.scroll').width($('.scroll').width()-240+'px');
		$('#gototop').css('right','250px');
	}else{
		$('.scroll').width('100%');
		$('#gototop').css('right','10px');
	}
	if ($('.navbar').hasClass('menuClose') && $window.width() > 360) {
		resize();
	}else if ($('.navbar').hasClass('menuOpen') && $window.width() > 600) {
		resize();
	}

}
function pointCode(){
	var detailTemp = '<div id="pointCode" style="width:90%;padding-left: 5%;text-align:left;line-height:100px;">\
						<div id="inputcode">輸入兌換碼：<input type="text" id="input_code"></div>\
					</div>\
					';


	iTS5Dialog.myHtmlObject({'html':detailTemp,
							 'type':'Confirm',
							 'width':'400px', 
							 'height': '200px',
							 'title':'輸入兌換碼'
							});
	$('#myMsgMain').css({'display':'inline-block',
						'height':'78.6%',
						'width':'100%',
						'flex':'1',
						'-webkit-box-flex':'1;',
						'-webkit-flex':'1',
						'-ms-flex':'1'});
	$('.isAlert').css({'display':'-webkit-box',
						'display':'-webkit-flex',
						'display':'-ms-flexbox',
						'display':'flex',
						'-webkit-box-orient': 'vertical',
						'-webkit-box-direction': 'normal',
						'-webkit-flex-direction': 'column',
						'-ms-flex-direction': 'column',
						'flex-direction': 'column'});
	var code = "";
	$('#input_code').blur(function(){
		code = $('#input_code').val();
	});
	$('.isAlert>.choicebox #OKBtn').bind('click',function(evt){
		console.log(code);
		$.ajax({
			type:"POST",
			url:"<%=prelocation%>game_platform/edit/action/loadData.jsp",
			data:{
				inputCode:code,
				planFlag:12
			}
		}).done(function(evt){
			var point = evt.trim();
			if(point == "isInput"){
				iTS5Dialog.myAlert('已使用過此兌換碼！',function(){
					pointCode();
				})
			}else if(point == ""){
				iTS5Dialog.myAlert('兌換碼錯誤！',function(){
					pointCode();
				})
			}else{
				$.ajax({
					type:"POST",
					url:"<%=prelocation%>game_platform/edit/action/savegame.jsp",
					data:{
						addpoint:point,
						creator:"<%=auth.getUserID()%>",
						type:'addpoint'
					}
				}).done(function(evt){
					iTS5Dialog.myAlert('兌換成功，獲得點數'+point,function(){
					})
				})
			}
		})
	})
}
// scroll
$('#gototop').bind('touchend click', function () {
	$('.scroll').scrollTop(0);
});
$('.scroll').scroll(function () {
	var newScrollTop = $('.scroll').scrollTop();
	if(newScrollTop>oldScrollTop) {
		$('.itsSearchBar').css('top', '-42px');
	}
	else
	{
		$('.itsSearchBar').css('top', '0px');
	}
	oldScrollTop = newScrollTop;
	if(newScrollTop >= 10){
		$('#gototop').show();
	}
	else if(newScrollTop < 10){
		$('#gototop').hide();
	}
});
</script>
</html>