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
}
.list{
	height: 100%;
	padding-bottom: 42px;
	-webkit-box-sizing: border-box;
  		   -moz-box-sizing: border-box;
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

.scroll::-webkit-scrollbar {
	width: 5px;
}
.scroll::-webkit-scrollbar-thumb {
	width: 5px;
	border-radius: 5px;
	background-color: rgba(0,0,0,0.498);
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
	/*min-width: 370px;*/
	bottom: 25px;
	position: relative;
	overflow-y: auto;
	overflow-x: hidden;
	-webkit-overflow-scrolling: touch;  
	margin-top: 10px;
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
	    padding-bottom: 200px;
}
.square{
	height: 360px;
	width: 230px;
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

.fontResize {
    position: absolute;
    top: 125px;
    height: 235px;
    width: 100%;
    background-color: rgba(255,255,255,0.8);
    line-height: 35px;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}
.content {
    font-size: 15px;
    background: white;
    height: 165px;
    word-wrap: break-word;
    white-space: pre-line;
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
	background: lightblue;
}
.buttonResize {
    width: 100%;
    height: 30px;
    background-color: #ededed;
    line-height: 30px;
    position: absolute;
    bottom: 0;
}
#imgAdjust{
	background-size: cover;
	width: 100%;
	height: 125px;
	position: absolute;
	background-repeat: no-repeat;
}
.singUp{
	right: 10px;
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
				<div class="scroll">
				<div class="outside">
				</div>
				</div>
			</div>
			<div id='gototop'></div>
			<div class="navbar-state-top itsnavbar itsSearchBar">
				<jsp:include page="../module/getdomain_forList.jsp" />
			</div>
		</div>
	</div>		
</body>
<script>
$(document).ready(function(){
	// navbar filter hid
	$('#gradeID').parent().css('display','none');
	$('#domain').parent().css('display','none');

	// show view
	displayViewContent();
});
//以下進入篩選功能
$("#area").change(function(){
	displayViewContent();	
});

$("#city").change(function(){
	displayViewContent();
});
var oldFliter = "a%,c%";
var newFliter='';
//紀錄目前篩選器
function getfilterKey(){
	var a = $("#area").val();
	newFliter = a;
	var temp = "";
	if(a == "a%"){
		a="";
	} else {
		temp = a;
	}

	var c = $("#city").val();
	newFliter = newFliter+","+c;
	if(c == "c%") {
		c = "";
	} else if(temp.length == 0) {
		temp = c;
	} else {
		temp = temp+","+c;
	}

	var g = $("#gradeID").val();
	newFliter = newFliter+","+g;
	if(g == "g%"){
		g = "";
	} else if(temp.length == 0) {
		temp = g;
	} else {
		temp = temp+","+g;	
	}
	
	var t = $("#domain").val();
	newFliter = newFliter +","+t;
	if(t =="t%"){
		t = "";
	} else if (temp.length == 0){
		temp = t;
	} else {
		temp = temp +","+t;
	}
	

	if(temp.length == 0 ) {
		temp = "nofilter";
		hasfilter = false;
	}

	return temp;
}
function displayViewContent(){
	// 清除畫面
	$('.square').remove();
	var filterKey = getfilterKey();

	var titleArray = [];
	var gameTxtArray = [];
	var urlArray = [];
	var areaArray = [];
	var cityArray = [];

	titleArray[0] = "奪命記憶 Deja Vu";
	gameTxtArray[0] = "世界頂級的生技公司 Particle S，其生化部門一夕間消失無蹤，正當外界臆測著各種可能性時，一封神秘的信件邀請你來到這間酒吧，而這封信的寄件人，竟然就是你自己？！被隱藏的真實，等你來挖掘！";
	urlArray[0] = "https://play.niceday.tw/product/221";
	areaArray[0] = "1";
	cityArray[0] = "22";

	titleArray[1] = "創世紀 - 古文明逃脫";
	gameTxtArray[1] = "傳說世紀聖殿中存放著能創造文明的強大聖器 - Red Sun，而『娜迪雅』星球資源即將使用殆盡，我們必須找到聖器來延續『娜迪雅』的文明！正逢百年難遇的九星連珠，聖殿將會開啟 80 分鐘，之後便會關閉。";
	urlArray[1] = "https://play.niceday.tw/product/1344";
	areaArray[1] = "3";
	cityArray[1] = "81";

	titleArray[2] = "穿越時空的冒險鉅作！";
	gameTxtArray[2] = "來自世界各地的探險家，紛紛冒險進入地下城，卻接續地離奇消失，地下城也從此失去蹤跡？這座傳說中的神秘的地下城，蘊藏著巨大能量，每扇門背後，都是不同的時空環境。";
	urlArray[2] = "https://play.niceday.tw/product/287";
	areaArray[2] = "4";
	cityArray[2] = "23";

	titleArray[3] = "紅衣小女孩";
	gameTxtArray[3] = "十七年前，一起深山失蹤案引發社會關注，輿論指向救難隊能力不足，導致一位小女孩意外身亡。如今，為了拯救闖入山區的阿偉與奶奶 ，你們克服心魔，再次披上救難隊服...你想忘記她。但她，還不願放過你！！"
	urlArray[3] = "https://play.niceday.tw/product/1161";
	areaArray[3] = "5";
	cityArray[3] = "82";

	for (var i = 0; i < titleArray.length; i++) {
		var template =	"<div class='square'>"+
						"<div class='label3' id='store"+i+"' area='"+areaArray[i]+"' city='"+cityArray[i]+"'>"+
							"<div class='pictureResize'><span id='imgAdjust'/></div>"+
							"<div class='fontResize'>"+
								"<div class='title'>"+titleArray[i]+"</div>"+
								"<div class='content'>"+gameTxtArray[i]+
							"</div>"+
							"<div class='buttonResize'>"+
								"<btn class='singUp'>"+
									"<a href='"+urlArray[i]+"' target='blank'>"+
									"<img src='../images/tools/edit.svg'> 我想體驗</btn>"+
								"</div>"+
						"</div>"+
					"</div>";
		var imgUrl = "img/storeImg"+[i+1]+".png";

		//篩選
		if($('#area option:selected').val()==areaArray[i] || $('#area option:selected').val()=='a%'){
			if($('#city option:selected').val()==cityArray[i] || $('#city option:selected').val()=='c%'){
				//產生畫面
				$('.outside').append(template);
			}
		}
		$('#store'+[i]+' #imgAdjust').css('background-image','url('+imgUrl+')');
	}
	// add new tab
	$('#store0>.pictureResize').prepend('<span id="newImg"></span>');
	$('#store1>.pictureResize').prepend('<span id="newImg"></span>');

	if($('.square').length <= 0 && newFliter !="a%,c%"){debugger;
		iTS5Dialog.myAlert("查無資料", function() {
			var domainArray = oldFliter.split(',');
			$("select#area").val(domainArray[0]);
			citySelectbindArea();
			$("select#city").val(domainArray[1]);
			displayViewContent();

		});
		return;
	}
	//紀錄上一次篩選
	oldFliter = newFliter;

	resize();
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
	return 400*y+90;
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
	}else if ($('.navbar').hasClass('menuOpen') && $window.width() > 620) {
		resize();
	}

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