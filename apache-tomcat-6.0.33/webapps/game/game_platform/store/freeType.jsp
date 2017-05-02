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
				</div>
				</div>
			</div>
		
			<div id='gototop'></div>
				<div class="navbar-state-top itsnavbar itsSearchBar">
					<span class="specborder">
						<select name="workFilter" id="workFilter" class="sixfilter">
							<option value="t%" class='text' id='allarea'>所有類型</option>
							<option value='1'>精選</option>
							<!-- <option value='2'>校園</option>
							<option value='3'>推理</option>
							<option value='4'>童話</option>
							<option value='5'>遊戲</option> -->
						</select>
					</span>
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
	loadGameData();
});
var oldFliter = "t%";
var newFliter='';
//紀錄目前篩選器
function getfilterKey(){
	var t = $("#workFilter").val();
	newFliter = t;
	var temp = "";
	if(t == "t%"){
		t="";
	} else {
		temp = t;
	}

	if(temp.length == 0) {
		temp = "nofilter";
		hasfilter = false;
	}

	return temp;
}
function loadGameData(){
	$('.square').remove();
	debugger;
	iTS5Dialog.myWaitMsg('讀取資料中');
	var filterKey = getfilterKey();
	var template =	"<div class='square'>"+
						"<div class='label3' id='gtype001' creator='' unitID='001' workFilter='1'>"+
							"<div class='pictureResize'><span id='imgAdjust'/></div>"+
							"<div class='textResize'>free_01</div>"+
							"<div class='buttonResize'>"+
								//"<btn class='changeName' url='' onclick='viewHandle(this)'>"+
										//"<img src='../images/tools/play.svg'> 觀看</btn>"+
								"<btn class='changeName' url='' onclick='dowload(this)'>"+
										"<img src='../images/tools/download.svg'></btn></div>"+
						"</div>"+
					"</div>";
	//產生畫面
	$('.outside').append(template);
	//var count = $('.label3').length;
	for(i = 0; i < $('.label3').length; i++){
		if($($('.label3')[i]).attr('workFilter') != $('#workFilter option:selected').val() && $('#workFilter option:selected').val() != 't%'){
			$($('.label3')[i]).parent().remove();
			//label3被移除一個，需要將i-1才會抓到正確的下一個label3
			i--;
		}
	}
	$('#gtype001>.pictureResize>#imgAdjust').css('background-image','url("http://www.holiyo.com.tw/game/game_platform/ppt/free_01.jpg")');
	
	iTS5Dialog.myCloseMsg();
	if($('.square').length <= 0 && newFliter !="t%"){
		iTS5Dialog.myAlert("查無資料", function() {
			$("select#workFilter").val(oldFliter);
			loadGameData();
		});
		return;
	}
	//紀錄上一次篩選
	oldFliter = newFliter;
	resize();
	//$(window).resize(resize);
	iTS5Dialog.myCloseMsg();
	
}

function viewHandle(evt){
	// debugger;
	if(evt.parentElement.parentElement.id == 'gtype001'){
		location.replace(location.origin+'/game/game_platform/store/play.jsp?id=263e7549&data=a00002015.1-c4ca4238a0b923820dcc509a6f75849b.1-c81e728d9d4c2f636f067f89cc14862c.1-eccbc87e4b5ce2fe28308fd9f2a7baf3.1-a87ff679a2f3e71d9181a67b7542122c.1-e4da3b7fbbce2345d7772b0674a318d5.1-1679091c5a880faf6fb5e6087eb1b2dc&fe=uuuuuuuuuuuuuuuuuu&title=free_01');
	}else if(evt.parentElement.parentElement.id == 'gtype002'){
		// location.replace(location.origin+'/game/game_platform/store/play.jsp?id=f1c9db04&data=a00002015.1-c4ca4238a0b923820dcc509a6f75849b&fe=nn--n-----------nn&title=20160307');
	}
}
function dowload(evt){
	// if(evt.parentElement.parentElement.id == 'gtype001' && auth_getMainRoleID !='external'){
	window.open(location.origin+'/game/game_platform/ppt/Holiyo遊戲版型_精選(HDT).pptx');
	// }else if(auth_getMainRoleID =='external'){
	// 	iTS5Dialog.myAlert('免費帳號不提供下載喔!!');
	// }
}
//以下進入篩選功能
$("#workFilter").change(function(){
	loadGameData();
});

var orginLeft = 0;
function getLeftVaule(x){
	outsideW = $window.width();
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

	orginLeft = (outsideW-(276*num+30*(num-1)))/2;
	return 306*x+orginLeft ;
}
function getTopVaule(y){
	return 256*y+53+35;
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
			// 新增版權說明文字
			/*if (i == row-1 && j == num-1) {
				var copyTop = getTopVaule(i+1);
				var copyClass = 'top:'+copyTop+'px';
				$('.scroll').css('overflow','auto');
				// 畫面調整
				if (copyTop + 226 + 15 < $('.outside').height() ) {
					copyClass = 'bottom:0px';
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