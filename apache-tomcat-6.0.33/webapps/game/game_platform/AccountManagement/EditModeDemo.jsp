<%@ include file = "chkAuth.jsp"%>
<%
flex.object.nadmin.SchoolProfile schoolProfile = auth.getLoginSchool();
String schoolID = schoolProfile.getSchoolID();
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title type='<%=schoolID%>'>iTS5 系統管理 </title>

	<link rel="stylesheet" href="css/EditModeDemo.css">
	<link rel="stylesheet" href="css/LoadingAnimationForEditMode.css">
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
	<script src="js/ServerConfig.js?sid=<%=schoolID%>"></script>
	<script src="js/DataAccessForEditMode.js"></script>
	<script src="js/EditMode/EditMode.js"></script>
	<script type="text/javascript">
	$().ready(
	function() {
loadAllClassInfo();
loadAllTeacherData();
loadAllStudentData();

setListener();

$("#testbtn").click(function() {
	$(".loading-animation").show();
	setCheckboxListener();
});


	}
	);


	</script>	
</head>
<body>
<div class="wrap">
	<div id='navbar'>
		<a onclick="back()">
			<img class="naviBtn" src="../images/naviBar/return.svg">
		</a>
	</div>
	<div class="classroom-list-wrap">
		<div id="classroom-list-title">班級列表
		<img class="classroom-add-button" src="image/icon/add.png" alt="">
		<div class="classroom-delete-button">刪除模式</div>
		<div class="loading-animation">
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
		<ul class="ul-wrap-classroom">
			<!-- <li class="li-wrap-classroom" classid="">
				<div class="class-info-box">
					<div class="class-check-box">
						<input  type="checkbox" id="cc1" name="cc" />
						<label for="cc1"><span></span></label>
					</div>
					<div class="class-info">
						<div class="class-name">一年一班</div>
						<div class="class-other-info">
							<div class="grade-year">102年</div>
							<div class="semester">第一學期</div>

						</div>
					</div>
					<div class="class-edit-button">
							...
					</div>
				</div>
			</li> -->
			
			
		</ul>
		
	</div>
	<div class="teacher-list-wrap">
		<div id="teacher-list-title">老師列表
		<img class="teacher-import-button" src="image/icon/import.png" alt="">
		<img class="teacher-add-button" src="image/icon/add.png" alt="">
		<div class="teacher-delete-button">刪除模式</div>
		<div class="loading-animation">
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
		<ul class="ul-wrap-teacher">
			<!-- <li account="LittleMin">
				<div class="teacher-checkbox">
					<input type="checkbox" id="tcc1" name="tcc" />
					<label for="tcc1"><span></span></label>
				</div>
				<div class="teacher-info-box">
					<div class="teacher-name">小明姜姜</div>
					<div class="teacher-other-info">
						<div class="account">LittleMin</div>
						<div class="email">lm@hdtech.com.tw</div>
					</div>
				</div>
				<div class="teacher-edit-button">
					...
				</div>
			</li> -->

		</ul>
		
	</div>
	<div class="student-list-wrap">
		<div id="student-list-title">學生列表
		<img class="student-import-button" src="image/icon/import.png" alt="">
		<img class="student-add-button" src="image/icon/add.png" alt="">
		<div class="student-delete-button">刪除模式</div>
		<div class="loading-animation">
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
		<ul class="ul-wrap-student">

		</ul>

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
<script>
	$(".class_console").submit(function(event) {
		var grade = $(".class_console .grade_field").val();
		var className=$(".class_console .name_field").val();
		var year=$(".class_console .year_field").val();
		var semester=$(".class_console .semester_field").val();
		if($(".class_console").attr('mode') == 'create') {
			var role=$(".class_console").attr("role");
			
			event.preventDefault();
			creatClassroom(role,className,year,grade,semester);
		}
		else if($(".class_console").attr('mode') == 'edit') {
			event.preventDefault();
			$.ajax({
				url: 'update.jsp',
				data:{  "sGradeID": grade,
						"className":className,
						"sYear":year,
						"sOrder":semester,
						"classID":gid,
						'type':'updateClass',
						},
			})
			.done(function( data ) {
				var temp = data.trim().split('*');
				var id = temp[0];
				var semester = ["整學期","上學期","下學期"]
				for(var i = 0; i<$('.li-wrap-classroom').length; i++){
					if($($('.li-wrap-classroom')[i]).attr('classid') == id){
						$($('.li-wrap-classroom')[i]).attr('classname', temp[1]);
						$($('.li-wrap-classroom')[i]).attr('classyear', temp[2]);
						$($('.li-wrap-classroom')[i]).attr('classsemester', temp[3]);
						$($('.li-wrap-classroom')[i]).attr('grade', temp[4]);

						$($('.li-wrap-classroom')[i]).find('.class-name').text(temp[4]+"年"+temp[1]+"班");
						$($('.li-wrap-classroom')[i]).find('.grade-year').text(temp[2]+"年");
						$($('.li-wrap-classroom')[0]).find('.semester').text(semester[temp[3]]);
					}
				}
				$(".class-edit-console-mask").hide();
			})

		}
	});


	$(".class_console .cancel_button").click(function() {
		$(".class-edit-console-mask").hide();
	});
	
</script>


<div class="person-edit-console-mask">
	<form class="console" mode="create" role="teacher">
		<div class="title_bar">
			 新增老師帳號
		</div>
		<div class="edit-name in-console-div">
			姓名:
			<input class="name_field" type="text" name="name_field"  value="" maxlength="10" required>
		</div>
		<div class="edit_id in-console-div">
			帳號:
			<input class="id_field" type="text" name="id_field" value="" maxlength="12" required>
		</div>
		<div class="edit_password in-console-div">
			密碼:
			<input class="password_field" type="text" name="password_field" value="" maxlength="16" required>
		</div>
		<div class="edit_email in-console-div">
			Email:
			<input class="email_field" type="email" name="email_field" value="" maxlength="100" required>
		</div>
		<div class="operation_bar">
			
			<input class="add_button" type="submit" value="新增">
			<div class="cancel_button">取消</div>

		</div>
	</form>
</div>

<script>
	$(".console").submit(function(event) {
		var userId=$(".console .id_field").val();
		var role=$(".console").attr("role");
		var userName=$(".console .name_field").val();
		var password=$(".console .password_field").val();
		var email=$(".console .email_field").val();
		event.preventDefault();

		if($(this).attr('mode') == 'create') {
			creatUserAccount(userId,role,userName,password,email);
		}
		else if($(this).attr('mode') == 'edit'){
			$.ajax({
				url: 'update.jsp',
				data:{  "type": "updateUser",
						"userName":userName,
						"userPassword":password,
						"userEmail":email,
						"userId":userId,
						"userSchoolId":$.cookie('school_id'),
						},
			})
			.done(function( data ) {
				var _userName = data.trim().split('*')[0];
				var _userPass = data.trim().split('*')[1];
				var _userEmail = data.trim().split('*')[2];
				var _userId = data.trim().split('*')[3];
				var _userRole = $(".console").attr("role");
				$('li[account='+_userId+']').find('.'+_userRole+'-name').text(_userName);
				$('li[account='+_userId+']').find('.account').text(_userId+" / "+_userPass);
				$('li[account='+_userId+']').find('.email').text(_userEmail);

				$(".person-edit-console-mask").hide();
			})

		}
	});

	$(".console .cancel_button").click(function() {
		$(".person-edit-console-mask").hide();
	});
	
</script>

<div class="import_console_mask" role="">
	<div class="import_console">
		<div class="title_bar">
			 批次匯入老師帳號
		</div>
		<div class="left_page">
			<div class="tips">
			請依照範例上傳Excel檔案(
			<div class="text_red">.xls </div>
			)
			
			</div>
			<div class="display_table">
				<div>
				<img class="import_example"src="image/import_example.png" alt="">
				</div>
				<div>
					<input id="file_selector" type="file" value=""/>
				</div>
			</div>
			
			
		</div>
		<div class="right_page import_preview">
			<div class="">
				預覽頁面
			</div>
			<table border=1>
				<tbody>
					<tr><th style='width:20%'>帳號</th><th style='width:20%'>姓名</th><th style='width:20%'>密碼</th><th style='width:40%'>Email</th></tr>
				</tbody>
			 </table>
		</div>
		
			

		
		

		<div class="operation_bar">
			<!-- <input class="add_button" type="submit" value="批次匯入"> -->
			<div class="add_button">批次匯入</div>
			<div class="cancel_button">取消</div>
		</div>
		
	</div>

</div>





<script>
var fileName;
var filenameExtension;
var fileSize;
var fileType;
var file;
$(".import_console .cancel_button").click(function() {
		$(".import_console_mask").hide();
		resetInputFile();
		
});

disableImportButton();

$("input[type=file]").bind("change",function(event) {
	if (event.target.files.length > 0) {
		fileName = event.target.files[0].name;
		filenameExtension = fileName.split(".")[1];
    	fileSize = event.target.files[0].size;
    	fileType = event.target.files[0].type;
    	file = event.target.files[0];
    	if(filenameExtension=="xls"){
    		getAccountImportFilePreviewJSON(file,fileName);

    	}else{
    		alert("請選擇正確的檔案格式!");
    	}


	}else{

	}

});
function showImportConsole(role) {
	$(".import_console_mask").show();
	$(".import_console_mask").attr("role",role);
	var title = (role=="teacher")? "批次匯入老師帳號":"批次匯入學生帳號"
	$(".import_console .title_bar").text(title);
};

function displayPreview(JSONData) {
	// $(".import_console").addClass("in_preview");
	// $(".right_page").show();
	enableImportButton();
	var insertTable = $(".import_preview table tbody");
	var error=0;
	emptyPreview();
	$.each(JSONData.data,function(index,userInfo) {
		if(userInfo.stat=="ok"){
			var user_id = userInfo.user_id;
			var user_name = userInfo.user_name;
			var userPwd = userInfo.userPwd;
			var email = userInfo.email;
			insertTable.append("<tr>");
			insertTable.append("<td>"+user_id+"</td>");
			insertTable.append("<td>"+user_name+"</td>");
			insertTable.append("<td>"+userPwd+"</td>");
			insertTable.append("<td>"+((email==undefined)?"無":email)+"</td>");
			insertTable.append("</tr>");
		}else{
			error++;
			insertTable.append("<tr>");
			insertTable.append("<td style='font-size:12px' class=text_red colspan=4>"+userInfo.stat+"</td>");
			insertTable.append("</tr>");
		}


	});


	
};

function setImportButtonListener() {
	$(".import_console .add_button").click(function() {
		$(".import_console_mask").hide();
		creatAccountFromImportFile(file,fileName,$(".import_console_mask").attr("role"));
		
	});
};



function disableImportButton(){
	console.log("disableImportButton");

	var importButton = $(".import_console .add_button");
	importButton.unbind("click");
	importButton.unbind('mouseenter mouseleave');
	importButton.text("批次匯入(必需選擇檔案)");
	importButton.css("background","rgba(50,50,50,0.8)");
};
function enableImportButton(){
	setImportButtonListener();
	var importButton = $(".import_console .add_button");
	importButton.text("批次匯入");
	importButton.css("background","rgba(34 ,139, 34,0.5)");
	importButton.hover(function() {
		importButton.css("background","rgba(34 ,139, 34,0.8)");
	},function() {
		importButton.css("background","rgba(34 ,139, 34,0.5)");
	});
};
function resetInputFile() {
	var control = $("input[type=file]");
	control.replaceWith( control = control.clone( true ) );
};
function emptyPreview() {

	
	var insertTable = $(".import_preview table tbody");
	insertTable.empty();
	insertTable.append("<tr><th style=width:20%>帳號</th><th style=width:20%>姓名</th><th style=width:20%>密碼</th><th style=width:40%>Email</th></tr>");
};

</script>
</div>	
</body>
</html>