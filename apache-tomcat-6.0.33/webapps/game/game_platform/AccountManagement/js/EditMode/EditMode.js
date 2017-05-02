function setListener() {
	setClassButtonListener();
	setTeacherButtonListener();
	setStudentButtonListener();
};
var classButtonState = false;
function setClassButtonListener() {
	$(".classroom-add-button").hover(function() {
		$(this).attr("src","image/icon/add2.png");
	},function() {
		$(this).attr("src","image/icon/add.png");
	});





	$(".classroom-add-button").click(function() {
		showClassEditConsole("create");

	});


	$(".classroom-delete-button").click(function() {
		if(!classButtonState){
			$(this).addClass("delete-buttton-onclick");
			$(this).text("確認刪除");
			$(".class-check-box").fadeIn("slow");
		}else{
			$(this).removeClass("delete-buttton-onclick");
			$(this).text("刪除模式");
			var classList = $(".ul-wrap-classroom li");
			var checkedSet = classList.find("input:checkbox");
			$.each(checkedSet,function(index,obj) {
				isChecked = $(obj).prop("checked");
				if(isChecked){
					var classId = $(obj).parent().parent().parent().attr("classid");
					removeClassroom(classId);
				}

			});

			$(".class-check-box").hide();

		}

		classButtonState = (classButtonState)?false:true;

	});
};
var teacherButtonState = false;
function setTeacherButtonListener() {
	$(".teacher-add-button").hover(function() {
		$(this).attr("src","image/icon/add2.png");
	},function() {
		$(this).attr("src","image/icon/add.png");
	});

	$(".teacher-add-button").click(function() {
		showEditConsole("create","teacher");

	});

	$(".teacher-import-button").click(function() {
		showImportConsole("teacher");
		emptyPreview();
	});


	$(".teacher-delete-button").click(function() {
		if(!teacherButtonState){
			$(this).addClass("delete-buttton-onclick");
			$(this).text("確認刪除");
			$(".teacher-checkbox").fadeIn("slow");
		}else{
			$(this).removeClass("delete-buttton-onclick");
			$(this).text("刪除模式");
			var teacherList = $(".ul-wrap-teacher li");
			var checkedSet = teacherList.find("input:checkbox");
			$.each(checkedSet,function(index,obj) {
				isChecked = $(obj).prop("checked");
				if(isChecked){
					var account = $(obj).parent().parent().attr("account");
					removeUserAccount(account);
				}

			});

			$(".teacher-checkbox").hide();

		}

		teacherButtonState = (teacherButtonState)?false:true;

	});
};
var studentButtonState = false;
function setStudentButtonListener() {
	$(".student-add-button").hover(function() {
		$(this).attr("src","image/icon/add2.png");
	},function() {
		$(this).attr("src","image/icon/add.png");
	});
	$(".student-add-button").click(function() {
		showEditConsole("create","student");

	});
	$(".student-import-button").click(function() {
		showImportConsole("student");
		emptyPreview();
	});
	$(".student-delete-button").click(function() {
		if(!studentButtonState){
			$(this).addClass("delete-buttton-onclick");
			$(this).text("確認刪除");
			$(".student-checkbox").fadeIn("slow");
		}else{
			$(this).removeClass("delete-buttton-onclick");
			$(this).text("刪除模式");
			var studentList = $(".ul-wrap-student li");
			var checkedSet = studentList.find("input:checkbox");
			$.each(checkedSet,function(index,obj) {
				isChecked = $(obj).prop("checked");
				if(isChecked){
					var account = $(obj).parent().parent().attr("account");
					removeUserAccount(account);
				}

			});
			$(".student-checkbox").hide();
		}

		studentButtonState = (studentButtonState)?false:true;

	});
};





function displayAllClassInfoBox(response) {
	var data = new Array();
	(!response.data.length)?
		data[0] =  response.data:
		data = response.data;
	$(".ul-wrap-classroom").empty();
	$.each(data,function(index,classInfo) {
		var classId = classInfo.class_id;
		var className = classInfo.class_name;
		var classYear = classInfo.class_year;
		var classSemester = classInfo.class_semester;
		var classGrade = classInfo.class_grade;
		var classIndex = classInfo.class_index;
		appendClassInfoBox(index,classId,className,classYear,classSemester);

	});
	$(document).on('click','.class-edit-button',function() {
		var obj   = $(this);
		showClassEditConsole("edit", obj);
	});
	$(document).on('click','.teacher-edit-button',function() {
		var obj   = $(this);
		showEditConsole("edit","teacher", obj)
	});
	$(document).on('click','.student-edit-button',function() {
		var obj   = $(this);
		showEditConsole("edit","student", obj)
	});

};
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

	var class_li_pattern = "<li class='li-wrap-classroom list-high-light' classid="+classId+
								" grade='"+grade+"' classYear='"+classYear+"' classSemester='"+classSemester+"' className='"+className+"'>"+
				"<div class='class-info-box'>"+
					"<div class='class-check-box'>"+
						"<input  type='checkbox' id="+checkboxIndex+" name="+checkboxIndex+" />"+
						"<label for="+checkboxIndex+"><span></span></label>"+
					"</div>"+
					"<div class='class-info'>"+
						"<div class='class-name'>"+grade+"年"+className+"班</div>"+
						"<div class='class-other-info'>"+
							"<div class='grade-year'>"+classYear+"年</div>"+
							"<div class='semester'>"+classSemester+"學期</div>"+
						"</div>"+
					"</div>"+
					"<div class='class-edit-button'>...</div>"+
				"</div>"+
			"</li>";
	$(".ul-wrap-classroom").prepend($(class_li_pattern));


};

function appendClassInfoBox(index,classId,className,classYear,classSemester) {
	var checkboxIndex = "cc"+index;
	var tempClassSemester = classSemester;
	var grade = className.split('年')[0];
	var onlyClassName = className.split('班')[0].split('年')[1];

	if(classSemester==0){
		classSemester="整";
	}else if(classSemester==1){
		classSemester="上";
	}else if(classSemester==2){
		classSemester="下";
	}else{
		classSemester="整";
	}

	var class_li_pattern = "<li class='li-wrap-classroom' classid="+classId+
								" grade='"+grade+"' classYear='"+classYear+"' classSemester='"+tempClassSemester+"' className='"+onlyClassName+"'>"+
				"<div class='class-info-box'>"+
					"<div class='class-check-box'>"+
						"<input  type='checkbox' id="+checkboxIndex+" name="+checkboxIndex+" />"+
						"<label for="+checkboxIndex+"><span></span></label>"+
					"</div>"+
					"<div class='class-info'>"+
						"<div class='class-name'>"+className+"</div>"+
						"<div class='class-other-info'>"+
							"<div class='grade-year'>"+classYear+"年</div>"+
							"<div class='semester'>"+classSemester+"學期</div>"+
						"</div>"+
					"</div>"+
					"<div class='class-edit-button'>...</div>"+
				"</div>"+
			"</li>";
	$(".ul-wrap-classroom").append($(class_li_pattern));
};

function displayAllTeacherInfoBox(response) {
	var data = new Array();
	if(response.data==undefined){
		$(".ul-wrap-teacher").empty();
	}else{
		(!response.data.length)?
		data[0] =  response.data:
		data = response.data;
		$(".ul-wrap-teacher").empty();
		$.each(data,function(index,personInfo) {
			var email= personInfo.email;
			var userId= personInfo.user_id;
			var password= personInfo.userPwd;
			var userName= personInfo.user_name;
			appendAllTeacherInfoBox(index,userId,password,userName,email);
		});

	}
};
var prependTeacherCount=0;
function prependTeacherInfoBox(userId,password,userName,email) {
	var checkboxIndex = "ntcc"+prependTeacherCount;
	prependTeacherCount++;
	var person_li_pattern = 
		"<li class='list-high-light' account="+userId+">"+
			"<div class='teacher-checkbox'>"+
				"<input type='checkbox' id="+checkboxIndex+" name="+checkboxIndex+" />"+
				"<label for="+checkboxIndex+"><span></span></label>"+
			"</div>"+
			"<div class='teacher-info-box'>"+
				"<div class='teacher-name'>"+userName+"</div>"+
				"<div class='teacher-other-info'>"+
					"<div class='account'>"+userId+" / "+password+"</div>"+
					"<div class='email'>"+((email==undefined)?"無email資料":email)+"</div>"+
				"</div>"+
			"</div>"+
			"<div class='teacher-edit-button'>...</div>"+
		"</li>"

	$(".ul-wrap-teacher").prepend($(person_li_pattern));
	
};

function appendAllTeacherInfoBox(index,userId,password,userName,email) {
	var checkboxIndex = "tcc"+index;

	var person_li_pattern = 
		"<li account="+userId+">"+
			"<div class='teacher-checkbox'>"+
				"<input type='checkbox' id="+checkboxIndex+" name="+checkboxIndex+" />"+
				"<label for="+checkboxIndex+"><span></span></label>"+
			"</div>"+
			"<div class='teacher-info-box'>"+
				"<div class='teacher-name'>"+userName+"</div>"+
				"<div class='teacher-other-info'>"+
					"<div class='account'>"+userId+" / "+password+"</div>"+
					"<div class='email'>"+((email==undefined)?"無email資料":email)+"</div>"+
				"</div>"+
			"</div>"+
			"<div class='teacher-edit-button'>...</div>"+
		"</li>"

	$(".ul-wrap-teacher").append($(person_li_pattern));
	
};

function displayAllStudentInfoBox(response) {
	var data = new Array();
	if(response.data==undefined){
		$(".ul-wrap-student").empty();
	}else{
		(!response.data.length)?
		data[0] =  response.data:
		data = response.data;
		$(".ul-wrap-student").empty();
		$.each(data,function(index,personInfo) {
			var email= personInfo.email;
			var userId= personInfo.user_id;
			var password= personInfo.userPwd;
			var userName= personInfo.user_name;
			appendAllStudentInfoBox(index,userId,password,userName,email);
		});

	}
};
var prependStudentCount=0;
function prependStudentInfoBox(userId,password,userName,email) {
	var checkboxIndex = "nscc"+prependStudentCount;
	prependStudentCount++;

	var person_li_pattern = 
		"<li class='list-high-light' account="+userId+">"+
			"<div class='student-checkbox'>"+
				"<input type='checkbox' id="+checkboxIndex+" name="+checkboxIndex+" />"+
				"<label for="+checkboxIndex+"><span></span></label>"+
			"</div>"+
			"<div class='student-info-box'>"+
				"<div class='student-name'>"+userName+"</div>"+
				"<div class='student-other-info'>"+
					"<div class='account'>"+userId+" / "+password+"</div>"+
					"<div class='email'>"+((email==undefined)?"無email資料":email)+"</div>"+
				"</div>"+
			"</div>"+
			"<div class='student-edit-button'>...</div>"+
		"</li>"

	$(".ul-wrap-student").prepend($(person_li_pattern));
	
};

function appendAllStudentInfoBox(index,userId,password,userName,email) {
	var checkboxIndex = "scc"+index;

	var person_li_pattern = 
		"<li account="+userId+">"+
			"<div class='student-checkbox'>"+
				"<input type='checkbox' id="+checkboxIndex+" name="+checkboxIndex+" />"+
				"<label for="+checkboxIndex+"><span></span></label>"+
			"</div>"+
			"<div class='student-info-box'>"+
				"<div class='student-name'>"+userName+"</div>"+
				"<div class='student-other-info'>"+
					"<div class='account'>"+userId+" / "+password+"</div>"+
					"<div class='email'>"+((email==undefined)?"無email資料":email)+"</div>"+
				"</div>"+
			"</div>"+
			"<div class='student-edit-button'>...</div>"+
		"</li>"

	$(".ul-wrap-student").append($(person_li_pattern));
	
};




function beginClassLoadingAnimation() {
	$(".classroom-list-wrap .loading-animation").fadeIn("slow");
};

function endClassLoadingAnimation() {
	$(".classroom-list-wrap .loading-animation").hide();
};
function beginTeacherLoadingAnimation() {
	$(".teacher-list-wrap .loading-animation").fadeIn("slow");
};

function endTeacherLoadingAnimation() {
	$(".teacher-list-wrap .loading-animation").hide();
};
function beginStudentLoadingAnimation() {
	$(".student-list-wrap .loading-animation").fadeIn("slow");
};

function endStudentLoadingAnimation() {
	$(".student-list-wrap .loading-animation").hide();
};

function showEditConsole(mode,role, obj) {
	var title = "";
	var modeTitle = "";
	if(mode=="create"){
		modeTitle="新增";
	}else if(mode=="show"){
		modeTitle="瀏覽";
	}else if(mode=="edit"){
		modeTitle = "修改"
	}else{

	}

	if(role=="class"){
		title="班級";
	}else if(role=="teacher"){
		title="老師帳號";
	}else if(role=="student"){
		title="學生帳號";
	}else{

	}
	resetConsoleForm();

	$(".console .title_bar").text(modeTitle+title);
	$('form.console>.operation_bar>.add_button').prop('value', modeTitle);
	$(".console").attr("mode",mode);
	$(".console").attr("role",role);
	$(".person-edit-console-mask").fadeIn("fast");


	$('form[role='+role+']>.edit_id>.id_field').prop('readonly',false);
	if(obj){
		var _userName = obj.parents('li').find('.'+role+'-name').text();
		var _userAcc_and_Pw = obj.parents('li').find('.account').text().split(' / ');
		var _userEmail = obj.parents('li').find('.email').text();

		$('form[role='+role+']>.edit-name>.name_field').prop('value',_userName);
		$('form[role='+role+']>.edit_id>.id_field').prop('value',_userAcc_and_Pw[0]).prop('readonly',true);
		$('form[role='+role+']>.edit_password>.password_field').prop('value',_userAcc_and_Pw[1]);
		$('form[role='+role+']>.edit_email>.email_field').prop('value',_userEmail);
	}
};


function hideEditConsole() {
	$(".person-edit-console-mask").hide();
};
function resetConsoleForm() {
	$(".console").each(function(){
		this.reset();
	});
};
function hideClassEditConsole() {
	$(".class-edit-console-mask").hide();
};
function resetClassConsoleForm() {
	$(".class_console").each(function(){
		this.reset();
	});
};	
var gid ="";
function showClassEditConsole(mode, obj) {
	var type = "新增";

	if(obj){
		if(mode == 'edit'){
			var _grade = obj.parents('.li-wrap-classroom').attr('grade') - 1;
			var _classyear = obj.parents('.li-wrap-classroom').attr('classyear');
			var _classsemester = obj.parents('.li-wrap-classroom').attr('classsemester');
			var _classname = obj.parents('.li-wrap-classroom').attr('classname');
			gid = obj.parents('.li-wrap-classroom').attr('classid');

			
			$($('.grade_field>option')[_grade]).prop('selected',true);
			$('.class_console>.edit-name>.name_field').prop("value", _classname);
			$('.class_console>.edit_year>.year_field').prop("value", _classyear);
			$($('.semester_field>option')[_classsemester]).prop('selected',true);

			type = "修改";
			$(".class-edit-console-mask").fadeIn("fast");
		}
	}
	else if(mode == 'create') {
		type = "新增";
		$(".class-edit-console-mask").fadeIn("fast");
	}

	$(".class_console").attr('mode',mode);

	$('.class_console>.operation_bar>.add_button').attr('value', type);
	$('.class_console>.title_bar').text(type+"班級");
};

function back() {
	location.replace('../choice.jsp');
};