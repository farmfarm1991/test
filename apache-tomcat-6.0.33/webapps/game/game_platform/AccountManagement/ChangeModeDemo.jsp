<%@ include file = "chkAuth.jsp"%>
<%
flex.object.nadmin.SchoolProfile schoolProfile = auth.getLoginSchool();
String schoolID = schoolProfile.getSchoolID();
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title type='<%=schoolID%>'>iTS5 系統管理</title>

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
</style>

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="js/jquery.tinysort.min.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js" ></script>
	<script src="js/ServerConfig.js"></script>
	<script src="js/DataAccessForChangeMode.js"></script>
	<script src="js/ChangeMode/ChangeMode.js"></script>
	<script src="js/filter.js"></script>
	<script type="text/javascript">
	$().ready(
	function() {
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

	$('#selectAll').click(function (evt){
		$('.all-person-list').find('input:not(":checked")').click();
	});

	}
);


	</script>	
</head>
<body>
<div id='navbar'>
	<a onclick="back()">
		<img class="naviBtn" src="../images/naviBar/return.svg">
	</a>
</div>
<div class="wrap">
	<div class="classroom-list-wrap">
		<div id="classroom-list-title">班級列表</div>
		<ul class="ul-wrap-classroom">
<!-- 			<li class="li-wrap-classroom" classid="">
				<div class="class-info-box">
					<div class="class-name">一年一班</div>
					<div class="class-other-info">
						<div class="grade-year">102年</div>
						<div class="student-number">26人</div>
					</div>
					
				</div>
			</li> -->
		</ul>

	</div>
	<div class="person-list-wrap">
		<div class="area-for-tab">
			<div id="toolbar">
				<img src="image/icon/information.png" title="Information" alt="information">
				<img onClick="javascript:history.back(1)" src="image/icon/logout.png" title="Logout" alt="logout">
			</div>
			<div id="testbtn"></div>
			
			
			<ul class="tab-host">
				<li class="selected-tab" id="teacher-tab" name="老師">老師頁面</li>
				<li id="student-tab" name="學生">學生頁面</li>
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
				<ul class="in-class-person-list">
<!-- 					<li account="LittleMin">
						<div class="person-checkbox">
							<input type="checkbox" id="cc1" name="cc" />
							<label for="cc1"><span></span></label>
						</div>
						<div class="person-name">小明</div>
						<div class="person-info-box">
							<div class="account-info">
								<div class="account">LittleMin</div>
								<div class="float-left">&nbsp;/&nbsp;</div>
								<div class="password">1234512345</div>
							</div>
							<div class="email">lm@hdtech.com.tw</div>
						</div>
						<div class="edit-button">
							...
						</div>
					</li> -->
				</ul>
				</div>
			</div>
			<div class="all-person">
				<div class="all-person-title">
					<div id="selectAll">全選</div>
					<div class="all-person-title-text">全校老師</div>
					<div class="search">
						<div class="left"></div>
						<input class="search_field" type="text" value="" onfocus="" onblur="onblurSearch()" placeholder="查詢名稱或帳號">
						<div class="right"></div>
					</div>
   
					<div class="loading-animation" id="allclass-loading-animation">
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
				<div class="all-person-list-wrap">
				<ul class="all-person-list">
					
				</ul>
				</div>
			</div>

		</div>

	</div>
</div>	
</body>
</html>