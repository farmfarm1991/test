<%@ include file = "../../chkAuth.jsp"%>
<%
flex.object.nadmin.SchoolProfile schoolProfile = auth.getLoginSchool();
String schoolID = schoolProfile.getSchoolID();
String userRole = auth.getMainRoleID();
String userID = auth.getUserID();
String userName = auth.getUserName();
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title type='CGES'>Holiyo 系統管理</title>
	<link rel="shortcut icon" href="../../images/logo/logo.png"/>
	<link rel="stylesheet" href="css/ChangeModeDemo.css">
	<link rel="stylesheet" href="css/LoadingAnimation.css">
	<link rel="stylesheet" href="css/scrollbar.css">

<style>
#testbtn{
	position:fixed;
	top:0px;
	right:0px;
	background:yello;
}
#class-addbtn{
	margin: 0px 5px;
	cursor: pointer;
}
</style>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="js/jquery.tinysort.min.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js" ></script>
	<script src="js/ServerConfig.js"></script>
	<script src="js/DataAccessForChangeMode.js"></script>
	
	<script src="js/ChangeMode/ChangeMode.js"></script>
	<script src="js/filter.js"></script>
	<script type="text/javascript">
	var auth_userID = "<%=userID%>";
	var fullClassList_withNameAndID = "";
	var classList = [];
	$().ready(
	function() {
		$.get("/iTS5/service/info/getClassInfoByTeacher/"+auth_userID+"?breakCache="+Math.random(), function(result){
			if(result == undefined){
				//showMessage("連線失敗");
				return;
			}
			if(result.data==undefined)
			{
				return;
			}
			(!result.data.length)? classList[0] = result.data : classList = result.data;

			for(var ci = 0; ci<classList.length; ci++){
				var tci = ci+1;
				var thisClassName = classList[ci].class_name;
				var thisClassID = classList[ci].class_id;

				if(fullClassList_withNameAndID == ""){
					//第一次建立className全域變數
					fullClassList_withNameAndID = thisClassID+","+thisClassName;
				}
				else {
					fullClassList_withNameAndID = fullClassList_withNameAndID +";"+thisClassID+","+thisClassName;
				}
			}
			sessionStorage.setItem('fullClassList-'+auth_userID+"-"+location.host, fullClassList_withNameAndID);
		});
		loadAllClassInfo();
		delegateLoadingDataMethod();
		//老師頁面與學生頁面切換
		 var tabSet = $(".tab-host li");
		 tabSet.click(function() {
		 	tabSet.removeClass("selected-tab");
		 	$(this).addClass("selected-tab");
		 	var groupName=$(".selected-tab").attr("name");
		 	$(".all-person-title-text").text("全校"+groupName);
		 	delegateLoadingDataMethod();
		 });


	// $("#testbtn").click(function() {
	// 	$(".loading-animation").show();
	// 	// $.tinysort.defaults.attr = 'sort';
	// 	fireSearchAccountAndName();
	// });
	setSearchHoverListener();
	
	$(".search_field").keyup(function() {
		console.log("change>>sort!!")
		fireSearchAccountAndName();
	});
	}
);


	</script>	
</head>
<body>
<div id='navbar' userid='<%=userID%>'>
	<a onclick="back()">
		<img class="naviBtn" src="../../images/naviBar/return.svg">
	</a>
</div>
<div class="wrap">
	<div class="classroom-list-wrap">
		<div id="classroom-list-title">班級列表
			<span id='class-addbtn'><img src='image/icon/add.png'></span>
		</div>
		<ul class="ul-wrap-classroom"></ul>

	</div>
	<div class="person-list-wrap">
		<div class="area-for-tab">
			<div id="toolbar">
				<img src="image/icon/information.png" title="Information" alt="information">
				<img onClick="javascript:history.back(1)" src="image/icon/logout.png" title="Logout" alt="logout">
			</div>
			<div id="testbtn"></div>
			
			
			<ul class="tab-host">
				<li id="student-tab" name="學生" class="selected-tab">學生頁面</li>
				<!-- <li id="teacher-tab" name="老師">老師頁面</li> -->
			</ul>
		</div>
		<div class="person-list-inner-wrap">
			<div class="in-class-person">
				<div class="in-class-person-title">
					<div class="in-class-person-title-text">該班人員</div>
					<div class="loading-animation" id="inclass-loading-animation">
						<div class="f_circleG" id="frotateG_01">
						</div>
						<div class="f_circleG" id="frotateG_02">
						</div>
						<div class="f_circleG" id="frotateG_03">
						</div>
						<div class="f_circleG" id="frotateG_04">
						</div>
						<div class="f_circleG" id="frotateG_05">
						</div>
						<div class="f_circleG" id="frotateG_06">
						</div>
						<div class="f_circleG" id="frotateG_07">
						</div>
						<div class="f_circleG" id="frotateG_08">
						</div>
					</div>
				</div>
				<div class="in-class-person-list-wrap">
					<ul class="in-class-person-list"></ul>
				</div>
			</div>
			<div class="all-person">
				<div class="all-person-title">
					<div class="all-person-title-text">全校學生</div>
					<div class="search">
						<div class="left"></div>
						<input class="search_field" type="text" value="" onfocus="" onblur="onblurSearch()" placeholder="查詢名稱或帳號">
						<div class="right"></div>
					</div>
   
					<div class="loading-animation" id="allclass-loading-animation">
						<div class="f_circleG" id="frotateG_01"></div>
						<div class="f_circleG" id="frotateG_02"></div>
						<div class="f_circleG" id="frotateG_03"></div>
						<div class="f_circleG" id="frotateG_04"></div>
						<div class="f_circleG" id="frotateG_05"></div>
						<div class="f_circleG" id="frotateG_06"></div>
						<div class="f_circleG" id="frotateG_07"></div>
						<div class="f_circleG" id="frotateG_08"></div>
					</div>

				</div>
				<div class="all-person-list-wrap">
				<ul class="all-person-list">
					
				</ul>
				</div>
			</div>

		</div>

	</div>
</div>

<div class="class-edit-console-mask">
	<form class="class_console" mode="create" role="class">
		<div class="title_bar">
			 新增班級
		</div>
		
		<div class="edit-grade in-console-div">
			年級:
		<select class="grade_field" name="grade_field">
			<option value="1">1年級</option>
			<option value="2">2年級</option>
			<option value="3">3年級</option>
			<option value="4">4年級</option>
			<option value="5">5年級</option>
			<option value="6">6年級</option>
			<option value="7">7年級</option>
			<option value="8">8年級</option>
			<option value="9">9年級</option>
		</select>
		</div>
		<div class="edit-name in-console-div">
			班級:
			<input class="name_field" type="text" name="name_field"  value="" maxlength="5" required>
			班
		</div>
		<div class="edit_year in-console-div">
			年度:
			<input class="year_field" type="number" name="year_field" value="" min="90" max="9999" maxlength="4" required>
			年度
		</div>
		<div class="edit_semester in-console-div">
			學期:
			<select class="semester_field" name="semester_field">
				<option value="0">整學期</option>
				<option value="1">上學期</option>
				<option value="2">下學期</option>
			</select>
		</div>
		<div class="operation_bar">
			<input class="add_button" type="submit" value="新增">
			<div class="cancel_button">取消</div>
		</div>
	</form>
</div>
</body>
<script>
	$('#class-addbtn').click(function(event){
		$('.class-edit-console-mask').show();
	})
	$(".class_console").submit(function(event) {
		var role=$(".class_console").attr("role");
		var grade = $(".class_console .grade_field").val();
		var className=$(".class_console .name_field").val();
		var year=$(".class_console .year_field").val();
		var semester=$(".class_console .semester_field").val();
		event.preventDefault();
		creatClassroom(role,className,year,grade,semester);
		window.location.reload();
	});

	$(".class_console .cancel_button").click(function() {
		$(".class-edit-console-mask").hide();
	});
	
	function back(){
		location.href = location.origin+"/game/game_platform";
	}
</script>
</html>