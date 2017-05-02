function loadInClassTeacherData(classId) {
	beginInClassLoadingAnimation();
	$.ajax({
		url: SERVER_PATH+'service/info/getClassTeachersInfoByClassId/'+classId,
		async: false,
		error: function(xhr) {
		     alert('loadInClassTeacherData Ajax request 發生錯誤');
		     endInClassLoadingAnimation();
		},
		success: function(response) {
			if(response.data.length != undefined){
				for(var i = 0;i<response.data.length;i++){
					if(response.data[i].user_id == $('#navbar').attr('userid').split('-')[1]){
				 		displayInClassPersonInfoBox3(response.data[i]);
					}
				}
			}else if(response.data != undefined){
				if(response.data.user_id == $('#navbar').attr('userid').split('-')[1]){
				 		displayInClassPersonInfoBox3(response.data);
					}
			}
			endInClassLoadingAnimation();
    	}
  	});
}
var temp;
function loadAllTeacherData(classId) {
	beginAllClassLoadingAnimation();
	$.ajax({
		async: false,
		url: SERVER_PATH+'service/info/getSchoolTeacherInfo/'+SCHOOL_NAME,
		error: function(xhr) {
		     alert('loadAllClassTeacherData Ajax request 發生錯誤');
		     endAllClassLoadingAnimation();
		},
		success: function(response) {
			for(var i = 0;i<response.data.length;i++){
				if(response.data[i].user_id == $('#navbar').attr('userid').split('-')[1]){
			 		displayInClassPersonInfoBox2(response.data[i]);
				}
			}
			endAllClassLoadingAnimation();
    	}
  	});
}
function loadInClassStudentData(classId) {
	beginInClassLoadingAnimation();
	$.ajax({
		url: SERVER_PATH+'service/info/getClassStudentsInfoByClassId/'+classId,
		error: function(xhr) {
		     alert('loadInClassStudentData Ajax request 發生錯誤');
		     endInClassLoadingAnimation();
		},
		success: function(response) {
			displayInClassPersonInfoBox(response);
			endInClassLoadingAnimation();
    	}
  	});
}
function loadAllStudentData(classId) {
	beginAllClassLoadingAnimation();
	$.ajax({
		url: SERVER_PATH+'service/info/getSchoolStudentInfo/'+SCHOOL_NAME,
		async: false,
		error: function(xhr) {
		     alert('loadAllClassStudentData Ajax request 發生錯誤');
		     endAllClassLoadingAnimation();
		},
		success: function(response) {
			displayAllPersonInfoBox(response);
			endAllClassLoadingAnimation();
    	}
  	});
}
//Class Info List處理
function loadAllClassInfo() {
	$.ajax({
		type:'GET',
		url: '../getClassInfo.jsp',
		data:{
			'userID': $('#navbar').attr('userid')
		},
		error: function(xhr) {
		     alert('loadAllClassInfo Ajax request 發生錯誤');
		},
		success: function(response) {
			debugger;
			if(response!=undefined){
				response = response.trim();
				response = response.slice(7,response.length).split('@Data||');
				displayAllClassInfoBox(response);
			}
			setClassUIListener();
    	}
  	});
}
var updatingDataCount = 0;
function updateInClassData(userId) {
	var classId = $(".selected-classroom").attr("classid");
	if(classId){
		beginInClassLoadingAnimation();
		updatingDataCount++;
		$.ajax({
			url: SERVER_PATH+'service/info/updateClassWithUser/'+classId+'/'+SCHOOL_NAME+'-'+userId,
			error: function(xhr) {
			     alert('updateInClassData Ajax request 發生錯誤');
			     endInClassLoadingAnimation();
			},
			success: function(response) {
				updatingDataCount--;
				if(updatingDataCount==0){
					endInClassLoadingAnimation();
				}
	    	}
	  	});
	}
}

function creatClassroom(role,className,year,grade,semester) {
	$.ajax({
		url: SERVER_PATH+'service/info/createClass/'+SCHOOL_NAME+'/'+year+'/'+semester+'/'+grade+'/'+className,
		async: false,
		error: function(xhr) {
		     alert('creatClassroom Ajax request 發生錯誤');
		     // endStudentLoadingAnimation();
		},
		success: function(response) {
			var classId = response.str;
			addTeacherInClass(classId);
			prependClassInfoBox(classId,grade,className,year,semester);
			resetClassConsoleForm();
			hideClassEditConsole();

			// displayAllStudentInfoBox(response);
			// endStudentLoadingAnimation();
    	}
  	});	
}

function addTeacherInClass(classId){
	$.ajax({
		url:'../addInClass.jsp',
		async:false,
		data:{
			'classID': classId,
			'userID': $('#navbar').attr('userid')
		},
		error: function(xhr) {
		     alert('addTeacherInClass Ajax request 發生錯誤');
		     // endStudentLoadingAnimation();
		},
		success: function(response) {
			console.log('addTeacherInClass success!!');
    	}
  	});
}

var prependClassCount=0;
function prependClassInfoBox(classId,grade,className,classYear,classSemester) {
	var checkboxIndex = "ncc"+prependClassCount;
	prependClassCount++;

	if(classSemester==0){
		classSemester="整";
	}else if(classSemester==1){
		classSemester="上";
	}else if(classSemester==2){
		classSemester="下";
	}else{
		classSemester="整";
	}
			
	var class_li_pattern = "<li class='li-wrap-classroom' classid='"+classId+"'>"+
				"<div class='class-info-box'>"+
					"<div class='class-name'>"+grade+"年"+className+"班</div>"+
					"<div class='class-other-info'>"+
						"<div class='grade-year'>"+classYear+"年</div>"+
						"<div class='student-number'></div>"+
					"</div>"+
				"</div>"+
			"</li>";
	$(".ul-wrap-classroom").prepend($(class_li_pattern));
	
	$($('.li-wrap-classroom[classId='+classId+']')).click(function() {
		$(".ul-wrap-classroom li").removeClass("selected-classroom");
		$(this).addClass("selected-classroom");
		delegateLoadingDataMethod();
		
	});
}

function resetClassConsoleForm() {
	$(".class_console").each(function(){
		this.reset();
	});
}

function hideClassEditConsole() {
	$(".class-edit-console-mask").hide();
}