function loadInClassTeacherData(classId) {
	beginInClassLoadingAnimation();
	$.ajax({
		url: SERVER_PATH+'service/info/getClassTeachersInfoByClassId/'+classId,
		error: function(xhr) {
		     alert('loadInClassTeacherData Ajax request 發生錯誤');
		     endInClassLoadingAnimation();
		},
		success: function(response) {
			displayInClassPersonInfoBox(response);
			endInClassLoadingAnimation();
    	}
  	});
};
function loadAllTeacherData(classId) {debugger;
	beginAllClassLoadingAnimation();
	$.ajax({
		url: SERVER_PATH+'service/info/getSchoolTeacherInfo/'+SCHOOL_NAME,
		error: function(xhr) {
		     alert('loadAllClassTeacherData Ajax request 發生錯誤');
		     endAllClassLoadingAnimation();
		},
		success: function(response) {debugger;
			displayAllPersonInfoBox(response);
			endAllClassLoadingAnimation();
    	}
  	});
};



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
};
function loadAllStudentData(classId) {
	beginAllClassLoadingAnimation();
	$.ajax({
		url: SERVER_PATH+'service/info/getSchoolStudentInfo/'+SCHOOL_NAME,
		error: function(xhr) {
		     alert('loadAllClassStudentData Ajax request 發生錯誤');
		     endAllClassLoadingAnimation();
		},
		success: function(response) {
			displayAllPersonInfoBox(response);
			endAllClassLoadingAnimation();
    	}
  	});
};

//Class Info List處理
function loadAllClassInfo() {debugger;

	$.ajax({
		url: SERVER_PATH+'service/info/getClassInfo/'+SCHOOL_NAME,
		error: function(xhr) {
		     alert('loadAllClassInfo Ajax request 發生錯誤');
		},
		success: function(response) {
			if(response.data!=undefined){
				displayAllClassInfoBox(response);
			}

			setClassUIListener();
    	}
  	});
};


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
			success: function(response) {debugger
				updatingDataCount--;
				if(updatingDataCount==0){
					endInClassLoadingAnimation();
				}
	    	}
	  	});
	}
};