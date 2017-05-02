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
<link rel="stylesheet" href="freeType.css"></link>
<style>
btn.changeName{
	width: 85px;
}	
</style>
<html>
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
					<div id="payType_table"></div>
					<div id="upgrade_text">
						<div class='text' id="upgradetext">月租 $420</div>
						<div class='text' id="upgradetext">半年 $2520</div>
						<div class='text' id="upgradetext">一年 $4200</div>
					</div>
					<span id="upgrade_table">
						<a href="http://www.pcstore.com.tw/hdtedu/M24731205.htm" class='btn text' id="upgrade" target="_blank">立即升級</a>
						<a href="http://www.pcstore.com.tw/hdtedu/M24731626.htm" class='btn text' id="upgrade" target="_blank">立即升級</a>
						<a href="http://www.pcstore.com.tw/hdtedu/M24731852.htm" class='btn text' id="upgrade" target="_blank">立即升級</a>
					</span>
				<!-- 	<div id="copyrightT" style="bottom: 0px;">本平台感謝台南市資訊教育輔導團楊易霖、陳秀梅老師協助製作     本平台軟體相關智慧財產權為宏鼎資訊股份有限公司所有</div> -->
				</div>
				</div>
			</div>
		
			<div id='gototop'></div>
				<div class="navbar-state-top itsnavbar itsSearchBar">
					<!-- <span class="specborder">
						<select id="gtype" class="sixfilter">
							<option value="t%" class='text' id='allarea'>所有類型</option>
							<option value='1'>精選</option>
							<option value='2'>校園</option>
							<option value='3'>推理</option>
							<option value='4'>童話</option>
							<option value='5'>遊戲</option>
						</select>
					</span> -->
				</div>
		</div>
	</div>	
</body>
<script type="text/javascript">
var auth_userID = '<%=userID%>';
var auth_getMainRoleID = '<%=userRole%>';
$(document).ready(function(){
	// loadGameData();
});
function loadGameData(){
	$('.square').remove();
	debugger;
	iTS5Dialog.myWaitMsg('讀取資料中');
	var template =	"<div class='square'>"+
						"<div class='label3' id='gtype000' creator='' unitID='000' gtype='0'>"+
							"<div class='pictureResize'><span id='imgAdjust'/></div>"+
							"<div class='buttonResize'>"+
								"<btn class='changeName' onclick='openAlert()'>"+
										"<img src='../images/tools/edit.svg'> 了解詳情</btn></div>"+
						"</div>"+
					"</div>"+
					"<div class='square'>"+
						"<div class='label3' id='gtype001' creator='' unitID='001' gtype='1'>"+
							"<div class='pictureResize'><span id='imgAdjust'/></div>"+
							"<div class='buttonResize'>"+
								"<btn class='changeName' url='http://www.pcstore.com.tw/hdtedu/M24731205.htm' onclick='viewHandle(this)'>"+
										"<img src='../images/tools/edit.svg'> 立即申請</btn></div>"+
						"</div>"+
					"</div>"+
					"<div class='square'>"+
						"<div class='label3' id='gtype002' creator='' unitID='002' gtype='2'>"+
							"<div class='pictureResize'><span id='imgAdjust'/></div>"+
							"<div class='buttonResize'>"+
								"<btn class='changeName' url='http://www.pcstore.com.tw/hdtedu/M24731626.htm' onclick='viewHandle(this)'>"+
										"<img src='../images/tools/edit.svg'> 立即申請</btn></div>"+
						"</div>"+
					"</div>"+
					"<div class='square'>"+
						"<div class='label3' id='gtype003' creator='' unitID='003' gtype='3'>"+
							"<div class='pictureResize'><span id='imgAdjust'/></div>"+
							"<div class='buttonResize'>"+
								"<btn class='changeName' url='http://www.pcstore.com.tw/hdtedu/M24731852.htm' onclick='viewHandle(this)'>"+
										"<img src='../images/tools/edit.svg'> 立即申請</btn></div>"+
						"</div>"+
					"</div>";
	//產生畫面
	$('.outside').append(template);
	$('#gtype000>.pictureResize>#imgAdjust').css('background-image','url("img/program/00.png")');
	$('#gtype001>.pictureResize>#imgAdjust').css('background-image','url("img/program/01_400.png")');
	$('#gtype002>.pictureResize>#imgAdjust').css('background-image','url("img/program/02_2400.png")');
	$('#gtype003>.pictureResize>#imgAdjust').css('background-image','url("img/program/03_4000.png")');
	
	iTS5Dialog.myCloseMsg();
	resize();
	//$(window).resize(resize);
	iTS5Dialog.myCloseMsg();
	
}

function viewHandle(evt){
	// window.open(' http://goo.gl/forms/DPrrjXOmZg');
	var openUrl = $(evt).attr('url');
	window.open(openUrl);
}
function openAlert(evt){
	debugger;
	
	var detailTemp = '<div style="width:100%;height:99%;background-image: url('+'img/program/alert2.png'+');background-size: contain;">\
					</div>\
					';


	iTS5Dialog.myHtmlObject({'html':detailTemp,
							 'type':'Alert',
							 'width':'740px', 
							 'height': '480px',
							 'title':'方案說明'
							});
	$('#myMsgMain').css({'display':'inline-block','height':'78.6%','width':'100%','flex':'1','-webkit-box-flex':'1;','-webkit-flex':'1','-ms-flex':'1'});
	$('.isAlert').css({'display':'-webkit-box','display':'-webkit-flex','display':'-ms-flexbox','display':'flex','-webkit-box-orient': 'vertical','-webkit-box-direction': 'normal','-webkit-flex-direction': 'column','-ms-flex-direction': 'column','flex-direction': 'column'});
	$($('.isAlert>.choicebox>.sysinfo')[0]).text("關閉").css("width","20%");
	$('#tableCell .choicebox>#OKBtn').css('width','200px');
	$($('.isAlert>.choicebox>.sysinfo')[0]).bind('click',function(){
		$('#myGame').click();
	})
	var date = new Date();
	date.setTime(date.getTime() + (2 * 60 * 60* 1000));
	$.cookie('fixed', 'true', { path:'/game',expires: date});
}
var orginLeft = 0;
function getLeftVaule(x){
	outsideW = $window.width();
	if ( $('header').hasClass('menuOpen') ) {
		outsideW = outsideW-240;
	}
	num=outsideW/306;
	if(num<1){
		num=Math.ceil(num);
	}else{
		num=parseInt(num);
	}

	orginLeft = (outsideW-(276*num+30*(num-1)))/2;
	return 306*x+orginLeft ;
}
function getTopVaule(y){
	return 256*y+53+15;
}
var oldScrollTop = 0;
var outsideW;
function resize(){
	outsideW = $window.width();
	//menu width
	if ( $('header').hasClass('menuOpen') ) {
		outsideW = outsideW-240;
	}
	num=outsideW/306;
	//取個數，屬於第幾個
	if(num<1){
		num=Math.ceil(num);
	}else{
		num=parseInt(num);
	}
	numLength=$('.square').length;
	row=numLength/num;
	row=Math.ceil(row);//取行數，屬於第幾排

	for(i=0;i<row;i++){ 
		for(j=0;j<num;j++){
			$($('.square')[i*num+j]).attr('style','top:'+getTopVaule(i)+'px; left:'+getLeftVaule(j)+'px;');
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
// scroll
var oldScrollWidth;
function menuWidthIsOpen(){
	if ($window.width() < 1026 && $('.navbar').hasClass('menuOpen')) {
		$('.scroll').width($('.scroll').width()-240+'px');
		$('#gototop').css('right','250px');
	}else{
		$('.scroll').width('100%');
		$('#gototop').css('right','10px');
	}
	if ($('.navbar').hasClass('menuClose') && $window.width() > 420) {
		resize();
	}else if ($('.navbar').hasClass('menuOpen') && $window.width() > 660) {
		resize();
	}
}
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