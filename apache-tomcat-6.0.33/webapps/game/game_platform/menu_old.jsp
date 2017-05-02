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
<script type="text/javascript" src="<%=prelocation%>game_platform/js/md5.js"></script>
<script type="text/javascript" src="<%=prelocation%>js/iTS5Dialog.js"></script>
<!--  <head> -->
<link rel="stylesheet" type="text/css" href="<%=prelocation%>game_platform/css/demo.css" />
<link rel="stylesheet" type="text/css" href="<%=prelocation%>game_platform/css/style.css" />

<!--  </head> -->
<!--  <body> -->
 <div style="height:110px">
	<!-- <div id="myacc" class="topbox text">我的帳號</div> -->
	<div id="userbox">
		<div id="userPhoto"  ><img src="<%=prelocation%>game_platform/images/menu/woman.png"/></div>
		<div id="userconfig">
			<!-- <div class='text' id="userRole">老師</div> -->
			<div id="userName"><%=auth.getUserName()%></div>
			<div id="endTime"></div>
			<%
				if(nopwd == "false"){
			%>
					<div id="changePwd">修改資料</div>
			<%
				}
			%>
		</div>
	</div>
</div>
 <section class="ac-container">
	<div class="bigtitle">
		<input id="ac-1" name="accordion-1" type="checkbox" checked />
		<label for="ac-1">遊戲製作</label>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/edit/firstEdit.jsp">
			<div id="first_edit" class="onefunc">
				<div class="funcImg"><img src="<%=prelocation%>game_platform/images/menu/firstEdit.svg"/></div>
				<div class="funcText text">easy Holiyo</div>
				<!--做教案-->
			</div>
		</a>
		</article>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/edit/advancedEdit.jsp">
			<div id="high_edit" class="onefunc">
				<div class="funcImg"><img src="<%=prelocation%>game_platform/images/menu/advancedEdit.svg"/></div>
				<div class="funcText text">OX Holiyo</div>
				<!--編題目-->
			</div>
		</a>
		</article>
			
	</div>
	<div class="bigtitle">
		<input id="ac-2" name="accordion-1" type="checkbox" checked/>
		<label for="ac-2">密逃作品</label>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/edit/firstWork.jsp">
			<div id="first_works" class="onefunc">
				<div class="funcImg"><img src="<%=prelocation%>game_platform/images/menu/firstWork.svg"/></div>
				<div class="funcText text">easy Holiyo作品</div>
				<!--做教案-->
			</div>
		</a>
		</article>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/edit/advancedWork.jsp">
			<div id="high_works" class="onefunc">
				<div class="funcImg"><img src="<%=prelocation%>game_platform/images/menu/advancedWork.svg"/></div>
				<div class="funcText text">OX Holiyo作品</div>
				<!--編題目-->
			</div>
		</a>
		</article>
	</div>
	<div class="bigtitle" style="padding-bottom:4px">
		<input id="ac-3" name="accordion-1" type="checkbox" checked/>
		<label for="ac-3">創客商店</label>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/store/freeType.jsp">
			<div id="free_type" class="onefunc">
				<div class="funcImg"><img src="<%=prelocation%>game_platform/images/menu/freeType.svg"/></div>
				<div class="funcText text">遊戲版型下載</div>
				<!--做教案-->
			</div>
		</a>
		</article>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/store/payType.jsp">
			<div id="pay_type" class="onefunc">
				<div class="funcImg"><img src="<%=prelocation%>game_platform/images/menu/buyType.svg"/></div>
				<div class="funcText text">資費方案</div>
				<!--做教案-->
			</div>
		</a>
		</article>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/store/buyType.jsp">
			<div id="buy_type" class="onefunc">
				<div class="funcImg"><img src="<%=prelocation%>game_platform/images/menu/buyType.svg"/></div>
				<div class="funcText text">周邊採購</div>
				<!--編題目-->
			</div>
		</a>
		</article>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/store/reservation.jsp">
			<div id="reservation" class="onefunc">
				<div class="funcImg"><img src="<%=prelocation%>game_platform/images/menu/reservation.svg"/></div>
				<div class="funcText text">Holiyo研習活動預約</div>
				<!--做教案-->
			</div>
		</a>
		</article>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/store/store.jsp">
			<div id="store" class="onefunc">
				<div class="funcImg"><img src="<%=prelocation%>game_platform/images/menu/store.svg"/></div>
				<div class="funcText text">蜜桃店</div>
				<!--編題目-->
			</div>
		</a>
		</article>
	</div>
	<div>
		<input id="ac-4" name="accordion-1" type="checkbox" checked disabled="true" />
		<label for="ac-4" style="background-image: none;">系統</label>
		<article class="ac-small" style="display:none">
			<a href="<%=prelocation%>game_platform/module/classmanagement/ChangeMode.jsp">
				<div id="class_list" class="onefunc">
					<div class="funcImg"><img src="<%=prelocation%>game_platform/images/menu/classlist.svg"/></div>
					<div class="funcText text" id='d-z'>班級清單</div>
					<!--班級清單-->
				</div>
			</a>
		</article>
		<article class="ac-small">
			<a href="<%=prelocation%>game_platform/logout.jsp">
				<div class="onefunc">
					<div class="funcImg"><img src="<%=prelocation%>game_platform/images/menu/logout.svg"/></div>
					<div class="funcText text" id='d-a'>登出</div>
					<!--登出-->
				</div>
			</a>
		</article>
	</div>
</section>
 <!-- </body> -->
<script>
var date_line = '<%=date_line%>';
var dateline = date_line.split(' ')[0].split('-');
date_line = dateline[0]+'年'+dateline[1]+'月'+dateline[2]+'日';

var oldpwdMD5 = "<%=hashtext%>";
$('.onefunc').click(function(evt){
	$('.selectfunc').removeClass('selectfunc');
	$(evt.currentTarget).addClass('selectfunc');
})
$('#changePwd').bind('click', function(){
	console.log('click!!!!');
	$('#stuListbox').hide();

	if($('#changePwdBox').length<1){
		$('#maskpage+div').append(  "<div id='changePwdBox'>"+
										"<div class='text' id='changePwdLabel'>修改密碼</div>"+
										"<div id='changePano'>"+
											"<div><span>Email</span><input type='text' value='<%=user_email%>' disabled='disabled'></div>"+
											"<div><span>舊密碼</span><input type='password' autocomplete='off'></div>"+
											"<div><span>新密碼</span><input type='password' autocomplete='off'></div>"+
											"<div><span>確認密碼</span><input type='password' autocomplete='off'></div>"+
											"<div id='pwdInfo'>密碼僅能使用英文以及數字，並小於20字<br >新密碼確認信將會寄信到你輸入的Email內</div>"+
										"</div>"+
										"<div class='choicebox changePwdChoice'>"+
											"<div class='btn text' id='OKbtn2'>確定</div>"+
											"<div class='btn text' id='NObtn2'>取消</div>"+
										"</div>"+
									"</div>");
		$('.changePwdChoice>#NObtn2').bind('click', function() {
			$('#studen_stat_table').hide();
			$('#changePwdBox').hide();
			$('#stuListbox').show();
			$("input[type='password']").val("");
		});

		$('.changePwdChoice>#OKbtn2').bind('click', function() {
			console.log("確定更改密碼");
			var em = $("input[type='text']")[0];
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
				$('#studen_stat_table').hide();
				$('#changePwdBox').hide();
				$('#stuListbox').show();
				$("input[type='password']").val("");
				//關閉顯示密碼視窗
				//開啟系統訊息
				$('#stuListbox').hide();
				$('#msg').show();
				$('#msg').attr('class', 'isWaitMsg');
				$('#msgMain').text('密碼修改中...');
				$('#studen_stat_table').show();

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
				}).done(function(e) {debugger;
					if(e == "done"){
						//正常修改密碼成功
/*
						$('#msg').attr('class', 'isOnlyMsg');
						$('#msgMain').text('請至Email確認資料修改');
						
			
						setTimeout(function(){
							$('#studen_stat_table').hide();
							$('#msg').hide();
							$('#stuListbox').show();
						},3000);
*/
						$('#studen_stat_table').hide();
						$('#msg').hide();
						$('#stuListbox').show();
						iTS5Dialog.myAlert("請至Email收信進行確認資料修改，在Email尚未確認前，密碼將還是舊密碼。");
					}
					else {
						//修改密碼失敗
/*
						$('#msg').attr('class', 'isOnlyMsg');
						$('#msgMain').text('密碼修改失敗');
						setTimeout(function(){
							$('#studen_stat_table').hide();
							$('#msg').hide();
							$('#stuListbox').show();
						},500);
*/
						$('#studen_stat_table').hide();
						$('#msg').hide();
						$('#stuListbox').show();
						iTS5Dialog.myAlert("密碼修改失敗");
					}
					/*
					console.log("完成修改密碼");
					var rs = e.trim();
					if(rs == 1) {
						//正常修改密碼成功

						$('#msg').attr('class', 'isOnlyMsg');
						$('#msgMain').text('密碼修改完畢');
						
			
						setTimeout(function(){
							$('#studen_stat_table').hide();
							$('#msg').hide();
							$('#stuListbox').show();
						},500);
	
						oldpwdMD5 = CryptoJS.MD5(p2).toString();
					}
					else{
						//修改密碼失敗
						$('#msg').attr('class', 'isOnlyMsg');
						$('#msgMain').text('密碼修改失敗');
						setTimeout(function(){
							$('#studen_stat_table').hide();
							$('#msg').hide();
							$('#stuListbox').show();
						},500);
					}
					*/
				})
			}
		});
	}
	else {
		$('#pwdInfo').html("密碼僅能使用英文以及數字，並小於20字<br >新密碼確認信將會寄信到你輸入的Email內");
	}
	$('#changePwdBox').show();
	$('#studen_stat_table').css('display','block');
});
// 移除模組
if("<%=roleName%>"=="student") {
	$('#userRole').attr('id', 'userRoleS').text("學生");
	$('#first_edit').parent().parent().parent().remove();
	$('#free_type').parent().parent().parent().remove();
	$('#class_list').parent().parent().remove();

	//學生不會有班級管理
	$('#class_list').parent().remove();

	//學生更改shareroom超連結
	//
	var temphref = "https://www.shareroom.net/shareroom/formAction.php?action=emailEnter&fetch=meeting_id%3D2288%3Buser_id%3D-1%3Buser_type%3D2";
	$('#highPrga_label+div.itemfunc>a').attr('href', temphref);
}
else if("<%=roleName%>"=="teacher") {
	$('#userRole').attr('id', 'userRoleT').text("創客");
	$('#endTime').css({'font-size':'12px','position':'relative','top':'5px'}).text('到期日:'+date_line);
	$('#buy_type').parent().parent().remove();
	// $('#reservation').parent().parent().remove();
	$('#store').parent().parent().remove();
	//$('#post_exam').parent().attr('href', "<%=prelocation%>module/assessment/postClass_teach.jsp");
	//$('#post_hw').parent().attr('href', "<%=prelocation%>module/homework/postClass_teach.jsp");
	// $('#post_plan').parent().remove();
	// $('#b-c_stu').parent().parent().remove();
}
else if("<%=roleName%>"=="external") {
	$('#userRole').attr('id', 'userRoleT').text("創客");
	$('#buy_type').parent().parent().remove();
	// $('#reservation').parent().parent().remove();
	$('#store').parent().parent().remove();
	$('#userconfig').css({'padding':'30px 0px'});
	$('#userPhoto>img').attr({'src':'<%=imgPath%>','width':'60px'});
	$('#changePwd').css({'font-size':'12px','cursor':'auto'}).text('到期日:'+date_line).unbind('click');
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

var school_id = $.cookie('school_id');

/**第一次語系變化*/
var changeLeng = $.cookie('leng');
testLang(changeLeng);

setTimeout("$('.bigtitle').addClass('motion')",10);
 </script>
 </html>