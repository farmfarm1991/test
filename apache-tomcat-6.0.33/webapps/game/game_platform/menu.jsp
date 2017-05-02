<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.math.BigInteger" %>
<%@ page import="flex.object.nadmin.User" %>
<%
String prelocation = request.getRequestURL().toString();
prelocation = prelocation.substring(0,prelocation.lastIndexOf("/game/")+6);

flex.object.nadmin.SchoolProfile schoolProfile = auth.getLoginSchool();
String schoolID = schoolProfile.getSchoolID();
// System.out.println("----------");
// System.out.println(auth.getUserID());
// System.out.println("----------");
String userPwd = auth.getUserPwd();
String nopwd = "false";
if(userPwd == null){
	userPwd = "no_pwd";
	nopwd = "true";
}
MessageDigest md = MessageDigest.getInstance("MD5");
byte[] barr = md.digest(userPwd.getBytes());
BigInteger number = new BigInteger(1, barr);
String hashtext = number.toString(16);

while(hashtext.length()<32){
	hashtext="0"+hashtext;
}
%>
<script type="text/javascript" src="<%=prelocation%>game_platform/js/jquery-circle-progress-1.2.0/dist/circle-progress.js"></script>
<script type="text/javascript" src="<%=prelocation%>game_platform/js/md5.js"></script>
<script type="text/javascript" src="<%=prelocation%>js/iTS5Dialog.js"></script>
<script src="../js/jquery.Jcrop.js"></script>
<!--  <head> -->
<link rel="stylesheet" type="text/css" href="<%=prelocation%>game_platform/css/demo.css" />
<link rel="stylesheet" type="text/css" href="<%=prelocation%>game_platform/css/style.css" />
<link rel="stylesheet" href="<%=prelocation%>game_platform/css/jquery.Jcrop.css">

<!--  </head> -->
<!--  <body> -->

<div style="height:185px">
	<div class="photoIcon">
		<div id="userIcon"></div>
	</div>
	<!-- <input accept="image/*" id="uploadImage" type="file"> -->
  	<!-- <img id="userIconLoad" src=""> -->
  	<!-- <form name="myForm" action="/game/game_platform/cropper.jsp" method="post" onsubmit="return checkCoordinates();">
		<input type="hidden" name="x" value=""/>
		<input type="hidden" name="y" value=""/>
		<input type="hidden" name="w" value=""/>
		<input type="hidden" name="h" value=""/>
		<input type="hidden" name="f" value=""/>
		<input type="hidden" name="userID" value="<%=auth.getUserID()%>"/>
		<input type="submit" value="Crop Image"/>
	</form> -->
  	<div style="font-size: 20px;color: #404041;text-align: center;"><%=auth.getUserName()%></div>
	<div id="features">
		<div id="leftPoint">
			<div class="pointImg"></div>
			<div class="pointText"></div>
		</div>
		<div id="rightPoint" onclick="showCode()" style="cursor:pointer">
			<div class="pointImg" style="background-position-x: -40px;"></div>
			<div class="pointText">集道鮮師</div>
		</div>
		<div class="circle"></div>
	</div>
	<!-- <div id="myacc" class="topbox text">我的帳號</div> -->
	<!-- <div id="userbox">
		<div id="userPhoto" style="cursor:pointer"><img src="<%=imgPath%>"></div>
		<div id="userconfig">
			<div id="userName"><%=auth.getUserName()%></div>
			<div id="endTime"></div>
			<%
				if(nopwd == "false"){
			%>
					<div id="changePwd"><img src="<%=prelocation%>game_platform/images/menu/Holiyo point-point.svg" width="23px"></div>
			<%
				}
			%>
		</div>
	</div> -->
</div>
 <section class="ac-container">
	<div class="bigtitle">
		<input id="ac-1" name="accordion-1" type="checkbox" checked />
		<label for="ac-1">密逃遊戲</label>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/edit/firstEdit.jsp">
			<div id="first_edit" class="onefunc">
				<div class="funcImg newImg">
					<!-- <img src="<%=prelocation%>game_platform/images/menu/firstEdit.svg"/> -->
				</div>
				<div class="funcText text">Easy Holiyo
					<span style='float:right'></span>
				</div>
			</div>
		</a>
		</article>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/edit/advancedEdit.jsp">
			<div id="high_edit" class="onefunc">
				<div class="funcImg newImg" style="background-position-x: -40px;">
					<!-- <img src="<%=prelocation%>game_platform/images/menu/advancedEdit.svg"/> -->
				</div>
				<div class="funcText text">圈叉 Holiyo
					<span style='float:right'></span>
				</div>
			</div>
		</a>
		</article>
		<article class="ac-small" style="display: none">
			<a href="<%=prelocation%>game_platform/edit/chanceEdit.jsp">
			<div id="chance_edit" class="onefunc">
				<div class="funcImg"><img src="<%=prelocation%>game_platform/images/menu/advancedEdit.svg"/></div>
				<div class="funcText text">Chance Holiyo
					<span style='color:red;float:right'></span>
				</div>
			</div>
		</a>
		</article>
		<article class="ac-small" style="display: none">
			<a href="<%=prelocation%>game_platform/edit/knowledgeEdit.jsp">
			<div id="knowledge_edit" class="onefunc">
				<div class="funcImg"><img src="<%=prelocation%>game_platform/images/menu/advancedEdit.svg"/></div>
				<div class="funcText text">知識咖 Holiyo
					<span style='color:red;float:right'></span>
				</div>
			</div>
		</a>
		</article>
	</div>
	<!-- <div class="bigtitle">
		<input id="ac-2" name="accordion-1" type="checkbox" checked/>
		<label for="ac-2">密逃作品</label>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/edit/firstWork.jsp">
			<div id="first_works" class="onefunc">
				<div class="funcImg"><img src="<%=prelocation%>game_platform/images/menu/firstWork.svg"/></div>
				<div class="funcText text">easy Holiyo作品
					<span style='color:red;float:right'></span>
				</div>
			</div>
		</a>
		</article>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/edit/advancedWork.jsp">
			<div id="high_works" class="onefunc">
				<div class="funcImg"><img src="<%=prelocation%>game_platform/images/menu/advancedWork.svg"/></div>
				<div class="funcText text">OX Holiyo作品
					<span style='color:red;float:right'></span>
				</div>
			</div>
		</a>
		</article>
	</div> -->
	<div class="bigtitle" style="padding-bottom:3px">
		<input id="ac-3" name="accordion-1" type="checkbox" checked/>
		<label for="ac-3">福利中心</label>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/store/freeType.jsp">
			<div id="free_type" class="onefunc">
				<div class="funcImg newImg" style="background-position-x: -80px;">
					<!-- <img src="<%=prelocation%>game_platform/images/menu/freeType.svg"/> -->
				</div>
				<div class="funcText text">遊戲版型下載</div>
			</div>
		</a>
		</article>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/store/payType.jsp">
			<div id="pay_type" class="onefunc">
				<div class="funcImg newImg" style="background-position-x: -120px;">
					<!-- <img src="<%=prelocation%>game_platform/images/menu/buyType.svg"/> -->
				</div>
				<div class="funcText text">付費升級方案</div>
			</div>
		</a>
		</article>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/store/buyType.jsp">
			<div id="buy_type" class="onefunc">
				<div class="funcImg newImg" style="background-position-x: -160px;">
					<!-- <img src="<%=prelocation%>game_platform/images/menu/Holiyo point-point.svg"/> -->
				</div>
				<div class="funcText text">兌換購買區</div>
			</div>
		</a>
		</article>
		<!-- <article class="ac-small">
			<a href="<%=prelocation%>game_platform/store/reservation.jsp">
			<div id="reservation" class="onefunc">
				<div class="funcImg"><img src="<%=prelocation%>game_platform/images/menu/reservation.svg"/></div>
				<div class="funcText text">Holiyo預約</div>
			</div>
		</a>
		</article>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/store/store.jsp">
			<div id="store" class="onefunc">
				<div class="funcImg"><img src="<%=prelocation%>game_platform/images/menu/store.svg"/></div>
				<div class="funcText text">蜜桃店</div>
			</div>
		</a>
		</article> -->
	</div>
	<div class="bigtitle" style="padding-bottom:3px">
		<input id="ac-4" name="accordion-1" type="checkbox" checked/>
		<label for="ac-4">關於Holiyo</label>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/store/freeType.jsp">
			<div id="free_type" class="onefunc">
				<div class="funcImg newImg" style="background-position-x: -80px;">
					<!-- <img src="<%=prelocation%>game_platform/images/menu/freeType.svg"/> -->
				</div>
				<div class="funcText text">版本資訊</div>
			</div>
		</a>
		</article>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/store/payType.jsp">
			<div id="pay_type" class="onefunc">
				<div class="funcImg newImg" style="background-position-x: -120px;">
					<!-- <img src="<%=prelocation%>game_platform/images/menu/buyType.svg"/> -->
				</div>
				<div class="funcText text">問題回報</div>
			</div>
		</a>
		</article>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/store/buyType.jsp">
			<div id="buy_type" class="onefunc">
				<div class="funcImg newImg" style="background-position-x: -160px;">
					<!-- <img src="<%=prelocation%>game_platform/images/menu/Holiyo point-point.svg"/> -->
				</div>
				<div class="funcText text">許願池</div>
			</div>
		</a>
		</article>
	</div>
	<div id="logout" class="onefunc" class="onefunc" style="cursor: pointer;">
		<div class="funcText text" id='d-a'>登出</div>
	</div>
	<div id="logoImg" onclick="openlink('http://blog.hdtedu.com/');" style="cursor: pointer;"></div>
	<!-- <div>
		<input id="ac-4" name="accordion-1" type="checkbox" checked disabled="true" />
		<label for="ac-4" style="background-image: none;">系統</label>
		<article class="ac-small" style="display:none">
			<a href="<%=prelocation%>game_platform/module/classmanagement/ChangeMode.jsp">
				<div id="class_list" class="onefunc">
					<div class="funcImg"><img src="<%=prelocation%>game_platform/images/menu/classlist.svg"/></div>
					<div class="funcText text" id='d-z'>班級清單</div>
				</div>
			</a>
		</article>
		<article class="ac-small" onclick="showCode()" style="cursor:pointer">
				<div id="invitecode" class="onefunc noShowClass">
					<div class="funcImg"><img src="<%=prelocation%>game_platform/images/menu/point.svg"/></div>
					<div class="funcText text" id="code">集道鮮師</div>
				</div>
		</article>
		<article class="ac-small" style="cursor:pointer">
				<div id="logout" class="onefunc">
					<div class="funcImg"><img src="<%=prelocation%>game_platform/images/menu/logout.svg"/></div>
					<div class="funcText text" id='d-a'>登出</div>
				</div>
			</a>
		</article>
	</div> -->
</section>
 <!-- </body> -->
<script>
var jcropApi;
var base64str;
var uploadImageWidth;
var uploadImageHeight;
function setCoordinates(c) {
	//alert("x " + c.x + " y " + c.y);
	//alert("w " + c.w + " h " + c.h);
	document.myForm.x.value = c.x;
	document.myForm.y.value = c.y;
	document.myForm.w.value = c.w;
	document.myForm.h.value = c.h;
	document.myForm.f.value = base64str+','+uploadImageWidth+','+uploadImageHeight;
	console.log("x: "+c.x+" y: "+c.y+" w: "+c.w+" h: "+c.h+" f: "+document.myForm.f.value);
};
function checkCoordinates() {
	if (document.myForm.x.value == "" || document.myForm.y.value == "") {
		alert("Please select a crop region");
		return false;
	} else {
		return true;
	}
};
function readImage(input) {
	if (jcropApi != undefined)
		jcropApi.destroy();
	if ( input.files && input.files[0] ) {
		var FR= new FileReader();
		var reader = new FileReader();
		FR.onload = function(e) {
			var fileSize=e.total;
			if(fileSize>1048576){
				iTS5Dialog.myAlert('檔案大小過大，上傳失敗');
				$('#closeBtn').bind('click',function(){
					$('.choicebox #NObtn2').click();
				})
				return;
			}
			//e.target.result = base64 format picture
			$('#userIconLoad').attr( "src", e.target.result );
			base64str = $('#userIconLoad').attr( "src" );
			debugger
			uploadImageWidth = $('#userIconLoad').width();
			uploadImageHeight = $('#userIconLoad').height();
			$('#userIconLoad').Jcrop({
				allowSelect: true,
				aspectRatio:1,
				onSelect : setCoordinates,
				setSelect: [ 0,0,80,80 ]
			}, function() {
				jcropApi = this;
				$('.jcrop-holder').css({'margin-top':'50px'});
				debugger
				if(uploadImageHeight >= uploadImageWidth || (uploadImageWidth>uploadImageHeight && uploadImageWidth < $($('.jcrop-holder img')[1]).css('max-width').split('px')[0])){
					$('.jcrop-holder').css({'left':'calc( 50% - '+($('.jcrop-holder img').width() / 2)+'px)'});
				}
			});
		};
		FR.readAsDataURL( input.files[0] );
	}
}

var loginTime = '<%=login_time%>';
// 使用期限
var date_line = '<%=date_line%>';
var dateline = date_line.split(' ')[0].split('-');
date_line = dateline[0]-1911 +'年'+dateline[1]+'月'+dateline[2]+'日';debugger
if ("<%=utype%>" == "money") {
	var dateLine = '<%=date_line%>';
	dateLine = new Date(dateLine).getTime();
	todayTime = new Date().getTime();
	var gap_time = parseInt(dateLine) - parseInt(todayTime);
	if (gap_time/(24*60*60*1000) < 8　&& $.cookie('dateline') == null) {
		var temp = "<div>您的使用期限即將到期("+date_line+")</div>"+
					"<div>如想續購可至「付費升級方案」選擇</div>";
		iTS5Dialog.myHtmlObject({'html':temp,
								 'type':'Confirm',
								 'width':'400px', 
								 'title':'系統訊息'
								});
		$($('.isAlert>.choicebox>.sysinfo')[0]).text("前往升級").bind('click',function(){
			location.replace("../store/payType.jsp")
		});
		$($('.isAlert>.choicebox>.sysinfo')[1]).text("關閉");
		var date = new Date();
		date.setTime(date.getTime() + (2 * 60 * 60* 1000));
		$.cookie('dateline', 'true', { path:'/game',expires: date});
	}
}
var xapiData = {};
var objectSource = "";
var objType = "";
var imgpath = "<%=imgPath%>";
if(imgpath == "null"){
	imgpath = '../images/menu/bar_user.png'
}
// $('#userIcon').css('background-image','url('+imgpath+')');
$(document).ready(function(){
	debugger
	if("<%=utype%>"=="openid" || "<%=utype%>"=="free"){
		getGameNum();
	}
	// userIcon
	debugger
	if (imgpath.lastIndexOf('woman.png') < 0 && imgpath.lastIndexOf('man.png') >= 0) {
		$('#userIcon').css('background-position-x','-80px');
	}else if(imgpath.lastIndexOf('croppedImage') >= 0){
		$('#userIcon').css({'background':'url(/iTS5/service/file'+imgpath+')','background-size':'cover','height':'80px','width':'80px','border-radius': '40px','margin-top':'5px'});
	}
	
	if ("<%=utype%>"=="openid") {
		if (imgpath.search("google") > 0) {
			xapiData.objectSource = "G+";
		}else if (imgpath.search("fbcdn") > 0) {
			xapiData.objectSource = "FB";
		}else if ($.cookie("source") != null) {
			xapiData.objectSource = $.cookie("source");
		}else{
			xapiData.objectSource = "noImg";
		}
		xapiData.objType = "applicationF";
	}else{
		xapiData.objectSource = "money";
		xapiData.objType = "applicationM";
	}
	// xAPI login send
	if ($.cookie("tin") == "1") {
		xapiData.verb = "logged-in";
		
		xAPIinit(xapiData);
	}/*
	// back
	else if ($.cookie('verbReturned-<%=auth.getUserID()%>') != null) {
		var data = $.cookie('verbReturned-<%=auth.getUserID()%>');
		// json轉為object
		data = JSON.parse(data);
		xAPIinit(data);
	}*/
	$('#logout').bind('click',function(){
		var temp = document.createElement("form");
		temp.action = "<%=prelocation%>game_platform/logout.jsp";
		temp.method = "post";
		temp.style.display = "none";
		// for (var x in data) {
			var opt = document.createElement("textarea");
			var opt1 = document.createElement("textarea");
			opt.name = "type";
			opt.value = xapiData.objType;
			opt1.name = "source";
			opt1.value = xapiData.objectSource;
			// alert(opt.name)
			temp.appendChild(opt);
			temp.appendChild(opt1);
		// }
		document.body.appendChild(temp);

		temp.submit();
		// return temp;
		// location.replace("logout.jsp");
		// xapiData.verb = "Log Out";
		
		// xAPIinit(xapiData);
	})
})
// $.ajax({
// 	type:'GET',
// 	url:"<%=prelocation%>game_platform/edit/action/savegame.jsp",
// 	data:{
// 		creator:"<%=auth.getUserID()%>",
// 		type:"firstLogin"
// 	}
// }).done(function(evt){
// 	console.log(evt);
// 	// $.ajax({
// 	// 	type:'GET',
// 	// 	url:"<%=prelocation%>game_platform/edit/action/loadData.jsp",
// 	// 	data:{
// 	// 		userID:"<%=auth.getUserID()%>",
// 	// 		planFlag:"8"
// 	// 	}
// 	// }).done(function(evt){
// 	// 	$('#newscore').text(evt.trim());
// 	// 	$('#changePwd').html('<img src="<%=prelocation%>game_platform/images/menu/Holiyo point-point.svg" width="23px"> '+evt.trim());
// 	// })
// })
$.ajax({
	type:'GET',
	url:"<%=prelocation%>game_platform/edit/action/loadData.jsp",
	data:{
		userID:"<%=auth.getUserID()%>",
		planFlag:"8"
	}
}).done(function(evt){
	$('#newscore').text(evt.trim());
	// $('#changePwd').html('<img src="<%=prelocation%>game_platform/images/menu/Holiyo point-point.svg" width="23px"> '+evt.trim());
	$('#leftPoint>.pointText').text(evt.trim());
})

//alert(($('#userName').text()).visualLength());

var oldpwdMD5 = "<%=hashtext%>";
$('.onefunc').click(function(evt){
	if (!$(evt.currentTarget).hasClass("noShowClass")) {
		$('.selectfunc').removeClass('selectfunc');
		$(evt.currentTarget).addClass('selectfunc');
	}
	
})
// $('#userPhoto').bind('click', function(){
$('#userIcon').bind('click', function(){
	console.log('click!!!!');
	if($('#changeFormBox').length<1){
		var _img = "<%=imgPath%>";
		debugger
		if(_img =="null" || _img.lastIndexOf('/images/menu') >= 0){
			_img = "../images/menu/bar_user.png";
		}else{
			_img = "/iTS5/service/file<%=imgPath%>";
		}
		var dataText = "<div id='changeFormPano'>"+
							"<div class='titleText'>會員資料</div>"+
							"<table>"+
								"<tr>"+
								   "<td width='60px'>姓名</td>"+
								   "<td colspan='2'><input type='text' value='<%=auth.getUserName()%>' maxlength=20 style='width: 205px;height:30px;margin-bottom:0px;background: #E6E7E8;border: 1.05px solid #808081;margin-left: -10px;'></td>"+
								 "</tr>"+
								 "<tr style='height: 40px;'>"+   
								   "<td>帳號</td>"+
								   "<td colspan='2' style='line-height: 25px;width:201px;word-break: break-all;text-align:left;'><%=user_email%></td>"+
								 "</tr>"+
								 "<tr style='height: 40px;line-height: 40px;'>"+
								   "<td>密碼</td>"+
								   "<td colspan='2' style='display: table;margin-top: 4px;'>"+
								   		"<span type='btn' onclick='editPassword(\"password\")' id='modify_pwd'>修改密碼</span>"+
								   	"</td>"+
								 "</tr>"+
								 "<tr id='dateline' style='height: 40px;line-height: 40px;'>"+
								 	"<td colspan='2' style='text-align: left;padding-left: 15px;'>付費到期日</td>"+
								   	"<td style='display: table;margin-left: -190px;color: #A72430;'>"+date_line+"</td>"+
								"</tr>"+
								"<tr>"+
									"<td>性別</td>"+
									"<td colspan='3' style='display: table-cell;position: relative;'>"+
								   		"<div style='float:left;'>"+
								   			"<input type='radio' name='mal' value='female' style='margin-right: 10px;margin-top: 0px;position: relative;left:7px;zoom: 1.3;'>女"+
								   		"</div>"+
								   		"<div style='float:left;'>"+
								   			"<input type='radio' name='mal' value='male' style='margin-right: 10px;margin-top: 0px;position: relative;left:7px;zoom: 1.3;'>男"+
								   		"</div>"+
								   	"</td>"+
								"</tr>"+
								"<tr>"+
								 	"<td colspan='3'>"+
								 	"<div id='_img' style='background: url("+_img+");background-size: cover; height: 80px; width: 80px; border-radius: 40px;margin-top: 20px; margin-left:45px;float:left;'>"+
								 	"</div>"+
								 	"<div class='btn text' style='padding: 4px 10px;height: 20px;line-height: 20px;position: relative;cursor: pointer;background: -webkit-linear-gradient(top, rgb(208, 210, 211), rgb(128, 129, 132));border-radius: 4px;overflow: hidden;display: inline-block;top:45px;text-shadow:none;'>更新大頭貼<input accept='image/*' id='uploadImage' type='file' style='opacity:0;position:absolute;right: 0;top: 0;cursor: pointer;'></div>"+
								 	"</td>"+
								"</tr>"+
							"</table>"+
						"</div>";
		iTS5Dialog.myHtmlObject({'html':dataText,
								 'type':'Confirm',
								 'width':'320.5px', 
								 'height': '450.5px',
								 'okbtn':'確定修改',
								 'nobtn':'取消'
								});
		$('#tableCell #OKBtn').css('margin-left','0px').hover(function(evt){$(this).css('margin-left','0px')});
		$('#tableCell #NOBtn').css('margin-right','0px').hover(function(evt){$(this).css('margin-right','0px')});
		$('#myMsgMain').css('border-radius','5px');
		$('#tableCell .choicebox').css({'position':'relative','bottom': '60px'});
		$('htmlobject').css({'position': 'relative', 'top': '-50px'});
		$('#tableCell #closeBtn').remove();
		$('#tableCell .choicebox').css({'padding': '0px'});
		debugger
		if(_img == "../images/menu/bar_user.png"){
			$('#_img').css('background-size','inherit');
		}

		if ("<%=utype%>" == "openid" || "<%=utype%>" == "free") {
			// open id 沒有修改資料功能
			$($('#changeFormPano>table tr')[2]).remove();
			$('#changeFormPano>table').height(250);
			$('#dateline').remove();
		};
		$("#uploadImage").change(function(){
			$('#userIconLoad').remove();
			editPassword("image");
			$('#changePano').after('<img id="userIconLoad" src="" style="max-width:320px;max-height:250px;">');
			readImage( this );
		});
		// userIcon
		var imgSrc = "<%=imgPath%>";
		// if (imgSrc.lastIndexOf('woman.png') < 0) {
		// 	$('#userIcon').css('background-position-x','-80px');
		// }

		if('<%=mal%>' == 'female'){
			$($('#changeFormPano input[type=radio]')[0]).attr('checked','true');
		}else{
			$($('#changeFormPano input[type=radio]')[1]).attr('checked','true');
		}
		$('#tableCell #OKBtn').bind('click', function(evt) {
			console.log("確定更改密碼");
			// var em = $("#changeFormPano input[type='text']").val();
			var em = $(evt.target).parent().parent().find('#changeFormPano input[type=text]').val();
			var mal= $(evt.target).parent().parent().find('#changeFormPano input[type=radio]:checked').val();
			var img_Path = '';
			var userid = '<%=auth.getUserID()%>';

			if(em ==""){
				$('#formInfo').text("請輸入姓名");
			}
			else{
				if(mal=='female' && imgSrc.lastIndexOf('woman.png') <= 0 && imgSrc.lastIndexOf('man.png') >= 0){
					img_Path = '../images/menu/woman.png';
				}else if(mal=='male' && imgSrc.lastIndexOf('woman.png') >= 0){
					img_Path = '../images/menu/man.png';
				}else{
					img_Path = imgSrc;
				}
				$('#formInfo').text("資料確認中");
				iTS5Dialog.myWaitMsg('資料修改中...');
				$.ajax({
					type: 'GET',
					url:'<%=prelocation%>game_platform/edit/action/loadData.jsp',
					data:{
						'planFlag':3,
						'userName':em,
						'img_Path':img_Path,
						'userID':userid,
						'mal':mal
					}
				}).done(function(e) {
					if(e.trim() == "done"){
						iTS5Dialog.myAlert("您的修改設定已完成，會於下次登入時產生。");
						$('#tableCell .isAlert #myMsgMain').css('padding','0px 70px');
					}
					else {
						iTS5Dialog.myAlert("資料修改失敗");
					}
				})
				$('#formInfo').text("");
			}
		});
	}
});
function editPassword(buttonType){
	$('#NOBtn').click();
	$('#changePwdBox').remove();
	if($('#changePwdBox').length<1){
		$('#studen_stat_table').show();
		
		$('#changeFormBox').hide();
		if(buttonType == "password"){
			$('#maskpage+div').append(  "<div id='changePwdBox'>"+
											"<div class='text' id='changePwdLabel'>修改密碼</div>"+
											"<div id='changePano'>"+
												"<div><span>Email</span><input type='text' id=userEmail value='<%=user_email%>' disabled='disabled'></div>"+
												"<div><span>舊密碼</span><input type='password' autocomplete='off'></div>"+
												"<div><span>新密碼</span><input type='password' autocomplete='off'></div>"+
												"<div id='newPInfo'>限20字內（英文及數字）</div>"+
												"<div><span>確認密碼</span><input type='password' autocomplete='off'></div>"+
												"<div id='pwdInfo'>新密碼確認信將會寄到您輸入的Email。</div>"+
											"</div>"+
											"<div class='choicebox changePwdChoice'>"+
												"<div class='btn text' id='OKbtn2'>確定修改</div>"+
												"<div class='btn text' id='NObtn2'>取消</div>"+
											"</div>"+
										"</div>");
			$('.choicebox >#NObtn2').bind('click', function() {
				$('#studen_stat_table').hide();
				$('#changePwdBox').hide();
				// $('#changeFormBox').show();
				$("input[type='password']").val("");
				$('#userIcon').click();
			});
			var mydialogStr = $('#changePwdBox').html();
			$('.choicebox >#OKbtn2').bind('click', function() {

				console.log("確定更改密碼");
				var em = $("input#userEmail")[0];
				var p1 = $($("input[type='password']")[0]).val();
				var p2 = $($("input[type='password']")[1]).val();
				var p3 = $($("input[type='password']")[2]).val();
				var regularCheck = /^[A-Za-z0-9]+$/;

				if($(em).val() ==""){
					$('#pwdInfo').text("請輸入Email");
				}
				else if(!em.validity.valid) {
					$('#pwdInfo').text("Email格式錯誤");
				}
				else if(p1 == "") {
					$('#pwdInfo').text("請輸入舊密碼");
				}
				else if(CryptoJS.MD5(p1).toString() != oldpwdMD5) {
					$('#pwdInfo').text("舊密碼不正確");
				}
				else if(p2 == "") {
					$('#pwdInfo').text("請輸入新密碼");
				}
				else if(p2.length>20){
					$('#pwdInfo').text("密碼長度過長");
				}
				else if(p2.search(regularCheck) == -1) {
					//表示密碼中有其他符號
					$('#pwdInfo').text("密碼格式不正確，只能英文和數字");
				}
				else if(p2 != p3) {
					$('#pwdInfo').text("確認密碼未與新密碼相同");
				}
				else{
					$('#pwdInfo').text("密碼確認中");
					$('#changePwdBox').hide();
					$("input[type='password']").val("");
					//關閉顯示密碼視窗
					//開啟系統訊息
					$('#stuListbox').hide();
					$('#msg').show();
					$('#msg').attr('class', 'isWaitMsg');
					$('#msgMain').text('密碼修改中...');

					$.ajax({
						type: 'post',
						url:'/iTS5/service/ResetAccount/v3',
						dataType:'text',
						data:{
							'userID':'<%=auth.getUserID()%>',
							'userPassword':CryptoJS.MD5(p1).toString()+p2,
							'userEmail':$(em).val(),
							'name':'holiyo'
						}
					}).done(function(e) {
						if(e == "done"){
							$('#msg').hide();
							iTS5Dialog.myAlert("請至Email收信進行確認資料修改，在Email尚未確認前，密碼將還是舊密碼。");
							$('#changeFormBox').show();
						}
						else {
							$('#msg').hide();
							iTS5Dialog.myAlert("密碼修改失敗");
						}
					})
				}
			});
			
		}else{
			$('#maskpage+div').append(  "<div id='changePwdBox' style='height:420px;'>"+
											"<div class='text' id='changePwdLabel'>修改大頭照</div>"+
											"<div id='changePano'>"+
											"</div>"+
											"<div class='choicebox changePwdChoice' style='padding-right: 25px;'>"+
											"<form id='myPhoto' name='myForm' action='/game/game_platform/cropper.jsp' method='post' onsubmit='return checkCoordinates();' style='margin:0;'>"+
												"<input type='hidden' name='x' value=''/>"+
												"<input type='hidden' name='y' value=''/>"+
												"<input type='hidden' name='w' value=''/>"+
												"<input type='hidden' name='h' value=''/>"+
												"<input type='hidden' name='f' value=''/>"+
												"<input type='hidden' name='userID' value='<%=auth.getUserID()%>'/>"+
												"<input class='btn text' type='submit' id='myPhotoBtn' value='確認修改' style='display:none'>"+
											"</form>"+
											"<div class='btn text' id='OKbtn2'>確定修改</div>"+
											"<div class='btn text' id='NObtn2'>取消</div>"+
											"</div>"+
										"</div>");
				//$('#changePwdBox').css('width',$('#userIconLoad').width());
				$('.choicebox').css('height','105px');
				$('.choicebox >#OKbtn2').bind('click', function() {
					iTS5Dialog.myConfirm('大頭照更換後將無法復原，確定要更換?',function(){
						$( "#myPhotoBtn" ).click();
					});
					$('#tableCell #closeBtn').remove();
				});
				$('.choicebox >#NObtn2').bind('click', function() {
					$('#studen_stat_table').hide();
					$('#changePwdBox').hide();
					// $('#changeFormBox').show();
					$("input[type='password']").val("");
					$('#userIcon').click();
				});
		}
	}
	else {
		$('#pwdInfo').html("密碼僅能使用英文以及數字，並小於20字<br >新密碼確認信將會寄信到你輸入的Email內");
	}
}
// 移除模組
if("<%=utype%>"=="money"){
	$('#endTime').css({'font-size':'12px','position':'relative','top':'5px'}).text('到期日:'+date_line);
}
if("<%=roleName%>"=="student") {
	// $('#userRole').attr('id', 'userRoleS').text("學生");
	// $('#first_edit').parent().parent().parent().remove();
	// $('#free_type').parent().parent().parent().remove();
	// $('#class_list').parent().parent().remove();

	// //學生不會有班級管理
	// $('#class_list').parent().remove();

	// //學生更改shareroom超連結
	// //
	// var temphref = "https://www.shareroom.net/shareroom/formAction.php?action=emailEnter&fetch=meeting_id%3D2288%3Buser_id%3D-1%3Buser_type%3D2";
	// $('#highPrga_label+div.itemfunc>a').attr('href', temphref);
	$('#userRole').attr('id', 'userRoleT').text("創客");
	//$('#endTime').css({'font-size':'12px','position':'relative','top':'5px'}).text('到期日:'+date_line);
	// $('#buy_type').parent().parent().remove();
	$('#reservation').parent().parent().remove();
	$('#store').parent().parent().remove();
}
else if("<%=roleName%>"=="teacher") {
	$('#userRole').attr('id', 'userRoleT').text("創客");
	//$('#endTime').css({'font-size':'12px','position':'relative','top':'5px'}).text('到期日:'+date_line);
	// $('#buy_type').parent().parent().remove();
	$('#reservation').parent().parent().remove();
	$('#store').parent().parent().remove();
	//$('#chance_edit').parent().parent().remove();
	//$('#knowledge_edit').parent().parent().remove();
	$('#invitecode').parent().remove();
}
else if("<%=roleName%>"=="external") {
	$('#userRole').attr('id', 'userRoleT').text("創客");
	//$('#buy_type').parent().parent().remove();
	$('#reservation').parent().parent().remove();
	$('#store').parent().parent().remove();
	$('#userconfig').css({'padding':'25px 0px'});
	$('#userPhoto>img').attr({'src':'<%=imgPath%>','width':'60px'});
	//$('#changePwd').css({'font-size':'12px','cursor':'auto'}).text('').unbind('click');
	$('#userPhoto').css({'cursor':'auto'}).unbind('click');
}

var nowURL = location.pathname;
nowURL = nowURL.substring(nowURL.substring(1).indexOf('/')+1);

switch(nowURL) {
	case "/index.jsp":
	case "/game_platform/edit/firstEdit.jsp":
		$('#first_edit').addClass('selectfunc');
		break;
	case "/game_platform/edit/advancedEdit.jsp":
		$('#high_edit').addClass('selectfunc');
		break;
	case "/game_platform/edit/chanceEdit.jsp":
		$('#chance_edit').addClass('selectfunc');
		break;
	case "/game_platform/edit/knowledgeEdit.jsp":
		$('#knowledge_edit').addClass('selectfunc');
		break;
	case "/game_platform/edit/firstWork.jsp":
		$('#first_works').addClass('selectfunc');
		break;
	case "/game_platform/edit/advancedWork.jsp":
		$('#high_works').addClass('selectfunc');
		break;
	case "/game_platform/store/freeType.jsp":
		$('#free_type').addClass('selectfunc');
		break;
	case "/game_platform/store/payType.jsp":
		$('#pay_type').addClass('selectfunc');
		break;
	case "/game_platform/store/buyType.jsp":
		$('#buy_type').addClass('selectfunc');
		break;
	case "/game_platform/store/reservation.jsp":
		$('#reservation').addClass('selectfunc');
		break;
	case "/game_platform/store/store.jsp":
		$('#store').addClass('selectfunc');
		break;
	default:
		console.log(0);
}
// 讀取遊戲數
function getGameNum(){
	var easyNum = 0;
	var oxNum = 0;
	var easyCompleteNum = 0;
	var oxCompleteNum = 0;
	var totalNum = 0;
	$.ajax({
		type: 'post',
		url: '<%=prelocation%>game_platform/edit/action/loadData.jsp',
		data:{
			userName: '<%=auth.getUserID()%>',
			planFlag: 4,
		}
	}).done(function(result){debugger
		result = result.trim();
		console.log("number "+result);
		easyNum = result.split("|||")[0];
		easyCompleteNum = result.split("|||")[1];
		oxNum = result.split("|||")[2];
		oxCompleteNum = result.split("|||")[3];
		totalNum = result.split("|||")[4];
		// 遊戲製作
		$('#first_edit .funcText>span').text("( "+easyNum+"/"+totalNum+" )");
		$('#high_edit .funcText>span').text("( "+oxNum+"/"+totalNum+" )");
		// 密逃作品
		$('#high_works .funcText>span').text("( "+oxCompleteNum+"/"+totalNum+" )");
		$('#first_works .funcText>span').text("( "+easyCompleteNum+"/"+totalNum+" )");

	})
}
function showCode(){
	var detailTemp = "<div style='background-image: url("+'../images/menu/bar_user.png'+");background-repeat: no-repeat;width: 33px;height: 33px;background-position-y: -80px;background-position-x: -40px;margin-left: 60px;position: absolute;'></div><span style='font-size:24px;color:#666633;position: absolute;margin-top: -1px;margin-left: -80px;'>多集，方為上道！</span>"+
						"<table id='pointTable' style='margin-top:15px'>"+
						"<td style='height: 20px;'></td>"+
						"<tr>"+
							"<td Rowspan=3 style='width:30%'><img src='../images/menu/Holiyo point-point.svg' style='margin-left: 15px;'></td><td style='float:left;height:20px'></td>"+
						"</tr>"+
						"<tr>"+
							"<td style='float:left;height:20px;line-height:25px;'>累積點數 <b id='newscore' style='color:#a72430'>0</b>點</td>"+
						"</tr>"+
						"<tr>"+
							"<td style='float:left;height:20px'></td>"+
						"</tr>"+
						"<tr><td style='padding-left:20px'><hr></td><td><hr style='margin-left:-2px;margin-right:20px'></td>"+
						"<tr>"+
							"<td Rowspan=3 style='width:30%'><img src='../images/menu/Holiyo point-login daily.svg' style='margin-left: 15px;'></td><td style='float:left;height:20px'>每日登入</td>"+
						"</tr>"+
						"<tr>"+
							"<td style='float:left;height:20px;color:#404041;font-size:15px'>每日登入送5點</td>"+
						"</tr>"+
						"<tr>"+
							"<td style='float:left;margin-bottom:5px'><button id='checktime' style='position: absolute;width: 85px;height: 60px;top: 124px;left: 261px;border-radius: 4px;line-height: 25px;cursor: pointer;font-size: 16px;color: #EBE7E8;vertical-align: middle;box-shadow: rgba(255, 255, 255, 0.2) 0px 1px 0px inset, rgba(0, 0, 0, 0.0470588) 0px 1px 2px;border: 1px solid #808080;margin-top: 10px;background:-webkit-linear-gradient(top, #808184 0%,#404041 100%);'>領取獎勵</button></td>"+
						"</tr>"+
						"<tr><td style='padding-left:20px'><hr></td><td><hr style='margin-left:-2px;margin-right:20px'></td>"+
						"</tr>"+
						"<tr>"+
							"<td Rowspan=3 style='width:30%'><img src='../images/menu/Holiyo point-invitation.svg' style='margin-left: 15px;'></td><td style='float:left;height:20px'>邀請5位朋友</td>"+
						"</tr>"+
						"<tr>"+
							"<td id='inviteNum' style='float:left;height:20px;color:#404041;font-size:15px'>邀請碼：<%=inviteCode%></td>"+
						"</tr>"+
						"<tr>"+
							
						"</tr>"+
						"<tr>"+
							"<td style='width:150px'></td><td><button id='invitebtn' style='position: absolute;width: 85px;height: 60px;top: 236px;left: 261px;border-radius: 4px;line-height: 25px;cursor: pointer;font-size: 16px;color: #EBE7E8;vertical-align: middle;box-shadow: rgba(255, 255, 255, 0.2) 0px 1px 0px inset, rgba(0, 0, 0, 0.0470588) 0px 1px 2px;border: 1px solid #808080;margin-top: 10px;background:-webkit-linear-gradient(top, #808184 0%,#404041 100%);'>邀請朋友</button></td>"+
						"</tr>"+
						"<tr><td style='padding-left:20px'><hr></td><td><hr style='margin-left:-2px;margin-right:20px'></td>"+
						"</tr>"+
						"<tr>"+
							"<td Rowspan=3 style='width:30%'><img src='../images/menu/Holiyo point-edit 5.svg' style='margin-left: 15px;'></td><td style='float:left;height:20px'>完成製作5份遊戲</td>"+
						"</tr>"+
						"<tr>"+		
						"</tr>"+
						"<tr>"+
							"<td style='float:left;height:45px;position:absolute;margin-top:-50px;'><div id='createpro' style='margin-top:-20px;padding-top:4px;padding-left:160px;background-image:url("+'../images/menu/progress.png'+");padding-right: 5px;background-repeat: no-repeat;background-position-x: 156px;'></div><div id='createprotext' style='position:relative;z-index:1;top:-65px;;color:#404041;font-size:14px;float:right;line-height:20px;width:50px;right:14.5px;'>完成度</div></td>"+
						"</tr>"+
						"<tr>"+
							"<td style='width:150px'></td><td style='float:left;font-size:15px;margin-top:-40px;color:#404041' >獎勵：50點/份</td>"+
						"</tr>"+
						// "<tr><td style='padding-left:20px'><hr></td><td><hr style='margin-left:-2px;margin-right:20px'></td>"+
						// "</tr>"+
						// "<tr>"+
						// 	"<td Rowspan=3 style='width:30%'><img src='../images/menu/Holiyo point-share 5.svg' style='margin-left: 15px;'></td><td style='float:left;height:20px'>分享遊戲5份</td>"+
						// "</tr>"+
						// "<tr>"+		
						// "</tr>"+
						// "<tr>"+
						// 	"<td style='float:left;height:45px'><div id='sharepro' style='margin-top:-20px;padding-top:4px;padding-left:160px;background-image:url("+'../images/menu/progress.png'+");padding-right: 5px;background-repeat: no-repeat;background-position-x: 156px;'></div><div id='shareprotext' style='position:relative;z-index:1;top:-65px;;color:#404041;font-size:14px;float:right;line-height:20px;width:50px;right:14.5px;'>完成度</div></td>"+
						// "</tr>"+
						// "<tr>"+
						// 	"<td style='width:150px'></td><td style='float:left;font-size:15px;margin-top:-40px;color:#404041' >獎勵：50點/份</td>"+
						// "</tr>"+
						"<tr><td style='padding-left:20px'><hr></td><td><hr style='margin-left:-2px;margin-right:20px'></td>"+
						"</tr>"+
						"<tr>"+
							"<td Rowspan=3 style='width:30%'><img src='../images/menu/Holiyo point-view count.svg' style='margin-left: 15px;'></td><td style='float:left;height:20px;width:111px;line-height:25px;'>10份遊戲人氣各達100人</td>"+
						"</tr>"+
						"<tr>"+		
						"</tr>"+
						"<tr>"+
							"<td style='float:left;height:45px;position:absolute;margin-top:-50px;'><div id='viewpro' style='margin-top:-20px;padding-top:4px;padding-left:160px;background-image:url("+'../images/menu/progress.png'+");padding-right: 5px;background-repeat: no-repeat;background-position-x: 156px;'></div><div id='viewprotext' style='position:relative;z-index:1;top:-65px;;color:#404041;font-size:14px;float:right;line-height:20px;width:50px;right:14.5px;'>完成度</div></td>"+
						"</tr>"+
						"<tr>"+
							"<td style='width:150px'></td><td style='float:left;font-size:15px;margin-top:-20px;color:#404041' >獎勵：100點/份</td>"+
						"</tr>"+
						"<tr><td style='padding-left:20px'><hr></td><td><hr style='margin-left:-2px;margin-right:20px'></td>"+
						"</tr>"+
						"<tr>"+
							"<td Rowspan=3 style='width:30%'><img src='../images/menu/Holiyo point-getit 10.svg' style='margin-left: 15px;'></td><td style='float:left;height:20px'>10份遊戲被收藏</td>"+
						"</tr>"+
						"<tr>"+
						"</tr>"+
						"<tr>"+
							"<td style='float:left;height:45px;position:absolute;margin-top:-50px;'><div id='collectpro' style='margin-top:-20px;padding-top:4px;padding-left:160px;background-image:url("+'../images/menu/progress.png'+");padding-right: 5px;background-repeat: no-repeat;background-position-x: 156px;'></div><div id='collectprotext' style='position:relative;z-index:1;top:-65px;;color:#404041;font-size:14px;float:right;line-height:20px;width:50px;right:14.5px;'>完成度</div></td>"+
						"</tr>"+
						"<tr>"+
							"<td style='width:150px'></td><td style='float:left;font-size:15px;margin-top:-40px;color:#404041' >獎勵：10點/份</td>"+
						"</tr>"+
						"<tr><td style='padding-left:20px'><hr></td><td><hr style='margin-left:-2px;margin-right:20px'></td>"+
						"<tr>"+
							"<td Rowspan=3 style='width:30%'><img src='../images/menu/Holiyo-point-exchange-code.svg' style='margin-left: 15px;'></td><td style='float:left;height:20px;margin-top: 10px;'>使用兌換碼</td>"+
						"</tr>"+
						"<tr>"+
						"</tr>"+
						"<tr>"+
							"<td style='float:left;margin-bottom:5px'><button id='pointcode' onclick='pointCode()' style='position: absolute;width: 85px;height: 60px;top: 690px;left: 261px;border-radius: 4px;line-height: 25px;cursor: pointer;font-size: 14px;color: #EBE7E8;vertical-align: middle;box-shadow: rgba(255, 255, 255, 0.2) 0px 1px 0px inset, rgba(0, 0, 0, 0.0470588) 0px 1px 2px;border: 1px solid #808080;margin-top: 10px;background:-webkit-linear-gradient(top, #808184 0%,#404041 100%);'>輸入兌換碼</button></td>"+
						"</tr>"+
						"<tr style='height:38px'></tr>"
						// "<tr><td style='padding-left:20px'><hr></td><td><hr style='margin-left:-2px'></td>"+
						// "<tr>"+
						// 	"<td Rowspan=3 style='width:150px'><img src='../images/menu/Holiyo point-exchange code.svg' style='margin-left: 15px;'></td><td style='float:left;height:20px'>使用兌換碼</td>"+
						// "</tr>"+
						// "<tr>"+
						// 	"<td style='float:left;height:20px;color:#404041;font-size:15px'>使用兌換碼</td>"+
						// "</tr>"+
						// "<tr>"+
						// 	"<td style='float:left;margin-bottom:5px'><button id='pointcode' onclick='pointCode() style='position: absolute;width: 85px;height: 60px;top: 825px;left: 261px;border-radius: 4px;line-height: 25px;cursor: pointer;font-size: 16px;color: #EBE7E8;vertical-align: middle;box-shadow: rgba(255, 255, 255, 0.2) 0px 1px 0px inset, rgba(0, 0, 0, 0.0470588) 0px 1px 2px;border: 1px solid #808080;margin-top: 10px;background:-webkit-linear-gradient(top, #808184 0%,#404041 100%);'>輸入兌換碼</button></td>"+
						// "</tr>"+
					"</table>";

	iTS5Dialog.myHtmlObject({'html':detailTemp,
							 'type':'Alert',
							 'width':'400px', 
							 'height': '500px',
							 'title':'多集，方為上道!'
							});
	$('#closeBtn').css('margin-left','355px');
	$('#myMsgMain').css({'display':'inline-block',
						'height':'78.6%',
						'width':'100%',
						'flex':'1',
						'-webkit-box-flex':'1;',
						'-webkit-flex':'1',
						'-ms-flex':'1',
						'margin':'0px'});
	$('.isAlert').css({'display':'-webkit-box',
						'display':'-webkit-flex',
						'display':'-ms-flexbox',
						'display':'flex',
						'-webkit-box-orient': 'vertical',
						'-webkit-box-direction': 'normal',
						'-webkit-flex-direction': 'column',
						'-ms-flex-direction': 'column',
						'flex-direction': 'column'});
	$('#checktime').css({'color':'#404041','background':'-webkit-linear-gradient(top, #eaeaf0 0%,#b0b0b0 100%)','cursor':'default'}).text('已領取');
	$('#invitebtn').click(function(){
		checkCode();
	})
	$.ajax({
		type:'GET',
		url:"<%=prelocation%>game_platform/edit/action/loadData.jsp",
		data:{
			userID:"<%=auth.getUserID()%>",
			planFlag:"8"
		}
	}).done(function(evt){
		$('#newscore').text(evt.trim());
		$('#changePwd').html('<img src="<%=prelocation%>game_platform/images/menu/Holiyo point-point.svg" width="23px"> '+evt.trim());
	})

	$.ajax({
		type:'GET',
		url:"<%=prelocation%>game_platform/edit/action/loadData.jsp",
		data:{
			userCode:"<%=inviteCode%>",
			planFlag:"9"
		}
	}).done(function(evt){
		//$('#inviteNum').html('完成度：'+evt.trim()+'/5(邀請碼<b style="color:#984807"><%=inviteCode%></b>)');
		$('#codepro').val(evt.trim());
	})

	$.ajax({
		type:'GET',
		url:"<%=prelocation%>game_platform/edit/action/loadData.jsp",
		data:{
			userID:"<%=auth.getUserID()%>",
			planFlag:"7"
		},
		async:false
	}).done(function(evt){
		evt = evt.trim();
		// var nowDate = new Date().toLocaleDateString();
		// var udate = evt.split(' ').splice('');
		var month = evt.split('-')[1];
		var day = evt.split('-')[2].split(' ')[0];
		var nowDate = new Date();
		var nowMonth = nowDate.getMonth()+1;
		var nowDay = nowDate.getDate();
		if(nowMonth != month || nowDay != day){
			$('#checktime').css({'color':'#EBE7E8','background':'-webkit-linear-gradient(top, #808184 0%,#404041 100%)'}).text('領取獎勵');
			$('#checktime').bind('click',function(){
				$.ajax({
					type:'POST',
					url:"<%=prelocation%>game_platform/edit/action/savegame.jsp",
					data:{
						creator:"<%=auth.getUserID()%>",
						type:"updateTime"
					}
				}).done(function(evt){
					debugger;
					$('#newscore').text(evt.split('score:')[1]);
					$('#changePwd').html('<img src="<%=prelocation%>game_platform/images/menu/Holiyo point-point.svg" width="23px"> '+evt.split('score:')[1]);
					iTS5Dialog.myAlert("簽到成功!", function() {
						/*if(evt.split('score:')[2]=='checkTimeC'){
							iTS5Dialog.myAlert("登入30天!獲得150點!", function(){
								$('#invitecode').click();
							});
						}else{
							$('#invitecode').click();
						}*/
						$('#invitecode').click();
						showCode();
					})
				})
			})
		}else{
			$('#checktime').css({'color':'#404041','background':'-webkit-linear-gradient(top, #eaeaf0 0%,#b0b0b0 100%)','cursor':'default'}).text('已領取');;
			console.log('已簽到');
		}
	})
	$($('.isAlert>.choicebox>.sysinfo')[0]).text("關閉").css({'background-color':'#c79463','border':'1px solid #ad835c','width':'100px'});
	//瀏覽數
	$.ajax({
		type:'POST',
		url:'<%=prelocation%>game_platform/edit/action/savegame.jsp',
		data:{
			creator:"<%=auth.getUserID()%>",
			type:'viewCount'
		}
	})
	//完成
	$.ajax({
		url:'<%=prelocation%>game_platform/edit/action/loadData.jsp',
		type:'get',
		data:{
			planFlag:11,
			userID:"<%=auth.getUserID()%>"
		}
	}).done(function(evt){
		debugger
		evt = evt.trim();
		$('#collectprotext').html('完成度 '+(evt.split('|||')[1]/10)*100+'%');
		$('#collectpro').circleProgress({
			lineCap: 'round',
			startAngle: -1.57,
		    value: parseInt(evt.split('|||')[1])/10,
		    size: 70,
		    thickness: 70 / 20,
		    emptyFill: "#404041",
		    animation: {
		    	duration: 3000,
		    },
		    fill: {
		      gradient: ["#F5F5F5"],
		    }
		  });
		$('#shareprotext').html('完成度 '+(evt.split('|||')[2]/5)*100+'%');
		$('#sharepro').circleProgress({
			lineCap: 'round',
			startAngle: -1.57,
		    value: parseInt(evt.split('|||')[2])/5,
		    size: 70,
		    thickness: 70 / 20,
		    emptyFill: "#404041",
		    animation: {
		    	duration: 3000,
		    },
		    fill: {
		      gradient: ["#F5F5F5"],
		    }
		  });
		$('#viewprotext').html('完成度 '+(evt.split('|||')[3]/10)*100+'%');
		$('#viewpro').circleProgress({
			lineCap: 'round',
			startAngle: -1.57,
		    value: parseInt(evt.split('|||')[3])/10,
		    size: 70,
		    thickness: 70 / 20,
		    emptyFill: "#404041",
		    animation: {
		    	duration: 3000,
		    },
		    fill: {
		      gradient: ["#F5F5F5"],
		    }
		  });
		$('#createprotext').html('完成度 '+(evt.split('|||')[4]/10)*100+'%');
		$('#createpro').circleProgress({
			lineCap: 'round',
			startAngle: -1.57,
		    value: parseInt(evt.split('|||')[4])/10,
		    size: 70,
		    thickness: 70 / 20,
		    emptyFill: "#404041",
		    animation: {
		    	duration: 3000,
		    },
		    fill: {
		      gradient: ["#F5F5F5"],
		    }
		  });
	})
}
function checkCode(){
	var inviteName="";
	var count = 0;
	var h = "250px";
	$.ajax({
		url:'<%=prelocation%>game_platform/edit/action/loadData.jsp',
		type:'get',
		data:{
			planFlag:6,
			userCode:"<%=inviteCode%>",
			userID:"<%=auth.getUserID()%>"
		},
		async:false
	}).done(function(evt){
		evt = evt.trim();
		var nameList = evt.split('|||');
		for(i=0;i<nameList.length-1;i++){
			inviteName = inviteName + '<div style="padding-right:15px;text-align:center">'+nameList[i]+'</div>';
			count++;
		}
		switch(count){
			case 0:
			h = "280px";
			break;
			case 1:
			h = "280px";
			break;
			case 2:
			h = "320px";
			break;
			case 3:
			h = "360px";
			break;
			case 4:
			h = "400px";
			break;
			case 5:
			h = "440px";
			break;
			default:
			h = "440px";
		}
	})
	var detailTemp = '<div id="invitedetail" style="width:90%;padding-left: 5%;text-align:left;line-height:40px;">\
						<div id="content">\
							<div>你的邀請碼：<span id="userCode">'+"<%=inviteCode%>"+'</span></div>\
						</div>\
						<div id="inputcode">輸入邀請碼：<input type="text" id="invite" placeholder="只能輸入一次邀請碼"></div>\
						<div>已邀請朋友：</div>'+inviteName+'\
					</div>\
					';


	iTS5Dialog.myHtmlObject({'html':detailTemp,
							 'type':'Confirm',
							 'width':'400px', 
							 'height': h,
							 'title':'邀請碼詳細資料'
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
	$($('.isAlert>.choicebox>.sysinfo')[0]).text("送出");
	debugger;
	if(count==0)
	$('#invitedetail').append('<div style="color:#964508;text-align:center">快把邀請碼分享給好友吧!!</div>');
	var code = "";
	$('#invite').blur(function(){
		code = $('#invite').val();
	});
	$.ajax({
		url:'<%=prelocation%>game_platform/edit/action/loadData.jsp',
		type:'get',
		data:{
			planFlag:10,
			userID:"<%=auth.getUserID()%>"
		},
	}).done(function(evt){
		evt = evt.trim();
		if(evt>=2){
			$('#inputcode').css('display','none');
			$($('.isAlert>.choicebox>.sysinfo')[0]).remove();
			$($('.isAlert>.choicebox>.sysinfo')[0]).text('關閉');
		}
	})
	$('.isAlert>.choicebox #NOBtn').bind('click',function(evt){
		showCode();
	})
	$('.isAlert>.choicebox #OKBtn').bind('click',function(evt){
		console.log(code);
		$.ajax({
			type:"POST",
			url:"<%=prelocation%>game_platform/edit/action/savegame.jsp",
			data:{
				userCode:"<%=inviteCode%>",
				creator:"<%=auth.getUserID()%>",
				creatorName:"<%=auth.getUserName()%>",
				inputCode:code,
				type:"invite"
			}
		}).done(function(evt){
			evt = evt.trim();
			if(evt == 'invite'){
				iTS5Dialog.myAlert("輸入成功!", function() {
					updateTotalnum(code);
				});
			}else{
				if(evt == 'limit'){
					iTS5Dialog.myAlert("此邀請碼已達上限!",function(){
						checkCode();
					});
				}else if(evt == '存在'){
					iTS5Dialog.myAlert("已輸入過此邀請碼!",function(){
						checkCode();
					});
				}else if(evt == '不存在'){
					iTS5Dialog.myAlert("此邀請碼不存在!",function(){
						checkCode();
					});
				}else if(evt == '是我'){
					iTS5Dialog.myAlert("這是自己的邀請碼!",function(){
						checkCode();
					});
				}
			}
		})
	})
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
	$('#closeBtn').css('margin-left','355px')
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
			debugger
			evt = evt.trim();
			var point = evt.split('|||')[0];
			var endTime = evt.split('|||')[1];
			endTime = new Date(endTime).getTime();
			var nowTime = new Date().getTime();
			if(point == "isInput"){
				iTS5Dialog.myAlert('此兌換碼已被使用！',function(){
					pointCode();
				})
			}else if(point == ""){
				iTS5Dialog.myAlert('兌換碼錯誤！',function(){
					pointCode();
				})
			}else if(point != "" && endTime < nowTime){
				iTS5Dialog.myAlert('兌換碼已過期！',function(){
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
	$('.isAlert>.choicebox #NOBtn,#closeBtn').bind('click',function(evt){
		showCode();
	})
}
function updateTotalnum(code){
	$.ajax({
		type:'POST',
		url:"<%=prelocation%>game_platform/edit/action/savegame.jsp",
		data:{
			code:code,
			type:"updateTotalnum"
		}
	}).done(function(evt){
		console.log(evt);
		showCode();
	})
}
function openlink(str){
	window.open(str);
}
$(window).on('beforeunload', function (e) {
    debugger
});
var school_id = $.cookie('school_id');

/**第一次語系變化*/
var changeLeng = $.cookie('leng');
testLang(changeLeng);

setTimeout("$('.bigtitle').addClass('motion')",10);
 </script>
 </html>