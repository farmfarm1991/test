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



//Class Info List處理
function loadAllClassInfo() {
	beginClassLoadingAnimation();
	$.ajax({
		url: SERVER_PATH+'service/info/getClassInfo/'+SCHOOL_NAME,
		error: function(xhr) {
		     alert('loadAllClassInfo Ajax request 發生錯誤');
		     endClassLoadingAnimation();
		},
		success: function(response) {
			if(response.data!=undefined){
				displayAllClassInfoBox(response);
			}
			endClassLoadingAnimation();
			
			
    	}
  	});
};

function loadAllTeacherData() {
	beginTeacherLoadingAnimation();
	$.ajax({
		url: SERVER_PATH+'service/info/getSchoolTeacherInfo/'+SCHOOL_NAME,
		error: function(xhr) {
		     alert('loadAllClassTeacherData Ajax request 發生錯誤');
		     endTeacherLoadingAnimation();
		},
		success: function(response) {
			displayAllTeacherInfoBox(response);
			endTeacherLoadingAnimation();
    	}
  	});
};

function loadAllStudentData() {
	beginStudentLoadingAnimation();
	$.ajax({
		url: SERVER_PATH+'service/info/getSchoolStudentInfo/'+SCHOOL_NAME,
		error: function(xhr) {
		     alert('loadAllClassStudentData Ajax request 發生錯誤');
		     endStudentLoadingAnimation();
		},
		success: function(response) {
			displayAllStudentInfoBox(response);
			endStudentLoadingAnimation();
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
			url: SERVER_PATH+'service/info/updateClassWithUser/'+classId+'/'+userId,
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
};


// /service/info/updateUser/{userID}/{mainRoleID}/{userName}/{userPwd}/{email}/{schoolID}/
// /service/info/createUser/{userID}/{mainRoleID}/{userName}/{userPwd}/{email}/{schoolID}/
// /service/info/removeUser/{userID}/

function creatUserAccount(userId,role,userName,password,email) {
	// beginStudentLoadingAnimation();
	$.ajax({
		url: SERVER_PATH+'service/info/createUser/'+SCHOOL_NAME+'-'+userId+'/'+role+'/'+userName+'/'+password+'/'+email+'/'+SCHOOL_NAME+'/',
		error: function(xhr) {
		     alert('creatUserAccount Ajax request 發生錯誤');
		     // endStudentLoadingAnimation();
		},
		success: function(response) {
			console.log("YES");
			if(role=="teacher"){
				prependTeacherInfoBox(userId,password,userName,email);
			}else if(role=="student"){
				prependStudentInfoBox(userId,password,userName,email);
			}
			resetConsoleForm();
			hideEditConsole();

			// displayAllStudentInfoBox(response);
			// endStudentLoadingAnimation();
    	}
  	});
};
var removeUserCount = 0;
function removeUserAccount(userId) {
	// beginStudentLoadingAnimation();
	removeUserCount++;
	$.ajax({
		url: SERVER_PATH+'service/info/removeUser/'+SCHOOL_NAME+'-'+userId+'/',
		error: function(xhr) {
		     alert('removeUserAccount Ajax request 發生錯誤');
		     removeUserCount--;
		     if(removeUserCount==0){
		     	loadAllTeacherData();
				loadAllStudentData();
		     }
		     // endStudentLoadingAnimation();
		},
		success: function(response) {
		     removeUserCount--;
		     if(removeUserCount==0){
		     	loadAllTeacherData();
				loadAllStudentData();
		     }			
			hideEditConsole();

			// displayAllStudentInfoBox(response);
			// endStudentLoadingAnimation();
    	}
  	});
};
// service/info/createClass/{schoolID}/{class_year}/{class_semester}/{class_grade}/{class_index}
// 還沒好 等我一下
// service/info/removeClass/{classID}
function creatClassroom(role,className,year,grade,semester) {
	$.ajax({
		url: SERVER_PATH+'service/info/createClass/'+SCHOOL_NAME+'/'+year+'/'+semester+'/'+grade+'/'+className,
		error: function(xhr) {
		     alert('creatClassroom Ajax request 發生錯誤');
		     // endStudentLoadingAnimation();
		},
		success: function(response) {
			var classId = response.str;
			prependClassInfoBox(classId,grade,className,year,semester);
			resetClassConsoleForm() 
			hideClassEditConsole();

			// displayAllStudentInfoBox(response);
			// endStudentLoadingAnimation();
    	}
  	});
	
};
var removeClassroomCount=0;
function removeClassroom(classId) {
		removeClassroomCount++;
	$.ajax({
		url: SERVER_PATH+'service/info/removeClass/'+classId,
		error: function(xhr) {
		     alert('removeClassroom Ajax request 發生錯誤');
		     removeClassroomCount--;
		     // endStudentLoadingAnimation();
		     if(removeClassroomCount==0){
		     	loadAllClassInfo();
		     }
		},
		success: function(response) {
			removeClassroomCount--;
			if(removeClassroomCount==0){
		     	loadAllClassInfo();
		     }
			// displayAllStudentInfoBox(response);
			// endStudentLoadingAnimation();
    	}
  	});
	
};

function getAccountImportFilePreviewJSON(file,filename) {
	    var fileForm = new FormData();
		fileForm.append('filepath', file);
		var fileFormRequest = new XMLHttpRequest();
		fileFormRequest.open("POST",SERVER_PATH+
			"service/file/UploadExcelParserFile?filepath="+filename+"&schoolID="+SCHOOL_NAME, true);
		fileFormRequest.send(fileForm);
		// fileFormRequest.addEventListener("loadend", loadDocEnd, false);

		// function loadDocEnd(event) {
		// 	debugger
		// };
		
		fileFormRequest.onload = function ( event ) { 
                displayPreview(JSON.parse(this.response));
                
        }; 
        fileFormRequest.onloadstart = function ( event ) { 
                
        }; 
        fileFormRequest.onloadend = function ( event ) { 
            // alert( "載入完成" ); 
            
        }; 

};

function creatAccountFromImportFile(file,filename,role) {
	    var fileForm = new FormData();
		fileForm.append('filepath', file);
		var fileFormRequest = new XMLHttpRequest();
		fileFormRequest.open("POST",SERVER_PATH+
			"service/file/UploadExcelParserFileAndAddIt/?filepath="+filename+"&role="+role+"&schoolID="+SCHOOL_NAME, true);
		fileFormRequest.send(fileForm);
		// fileFormRequest.addEventListener("loadend", loadDocEnd, false);

		// function loadDocEnd(event) {
		// 	debugger
		// };
		fileFormRequest.onreadystatechange = function() {
		    if (fileFormRequest.readyState == 4) {
		    	if(role=="teacher"){
		    		loadAllTeacherData();
		    	}else if(role="student"){
		    		loadAllStudentData();
		    	}else{
		    		alert("role error");
		    	}
		        disableImportButton();
		    }
		}
		fileFormRequest.onload = function ( event ) { 
                emptyPreview();
                
        }; 
        fileFormRequest.onloadstart = function ( event ) { 
                alert( "開始載入" ); 
        }; 
        fileFormRequest.onloadend = function ( event ) { 
            // alert( "載入完成" ); 
        }; 

};



