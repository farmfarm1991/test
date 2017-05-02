var nowInclassPersonId=new Array();
var newInsertCount = 0;

// 教室列表點擊
function setClassUIListener() {
	var classroomSet = $(".ul-wrap-classroom li");
	classroomSet.click(function() {
		classroomSet.removeClass("selected-classroom");
		$(this).addClass("selected-classroom");
		delegateLoadingDataMethod();
		
	});
};

function cancelAllCheckBoxListener() {
	$("li :checkbox").unbind();
};

function setCheckboxListener() {
	var checkboxOfInClassPerson = $(".in-class-person-list :checkbox");
	var checkboxOfAllPerson = $(".all-person-list :checkbox");
	checkboxOfInClassPerson.unbind();
	checkboxOfInClassPerson.change(function() {
		var isChecked = $(this).prop("checked");
		if(isChecked){

		}else{
			var removeTarget = $(this).parent().parent();
			removeInClassPerson(removeTarget);
		}
	});
	checkboxOfAllPerson.unbind();
	checkboxOfAllPerson.change(function() {
		console.log("!!!");
		var isChecked = $(this).prop("checked");
		if(isChecked){
			var addTarget = $(this).parent().parent();
			addInClassPerson(addTarget);
			//第一次加入學生時將老師加入班級
			// if(!($(".all-person-list li :checkbox").last().prop("checked")) && $(".in-class-person-list li").last().attr('account') != $('#navbar').attr('userid').split('-')[1]){
			// 	addInClassPerson2($(".all-person-list li").last());
			// 	$(".all-person-list li :checkbox").last().prop('checked',true)
			// }
		}else{
			var removeTarget = $(this).parent().parent();
			removeInClassPerson(removeTarget);
		}
	});
};

function removeInClassPerson(removeTarget) {
	var targetId = removeTarget.find(".account").text();

	var tempArray = new Array();
	$.each(nowInclassPersonId,function(index,value) {
		if(targetId==value){

		}else{
			tempArray.push(value);
		}
	});
	nowInclassPersonId = tempArray;
	$(".in-class-person-list li[account="+targetId+"]").remove();
	updateInClassData(targetId);
	markPersonInClass();
};

function addInClassPerson(addTarget) {
	var targetId = addTarget.find(".account").text();
	var index = "new"+newInsertCount;
	newInsertCount++;
	var userId = addTarget.find(".account").text();
	var password = addTarget.find(".password").text();
	var userName = addTarget.find(".person-name").text();
	var email = addTarget.find(".email").text();
	prependInClassPersonInfoBox(index,userId,password,userName,email);
	nowInclassPersonId.push(targetId);
	updateInClassData(targetId);
	markPersonInClass();
};

function addInClassPerson2(addTarget) {
	var targetId = addTarget.find(".account").text();
	var index = "new"+newInsertCount;
	newInsertCount++;
	var userId = addTarget.find(".account").text();
	var password = addTarget.find(".password").text();
	var userName = addTarget.find(".person-name").text();
	var email = addTarget.find(".email").text();
	appendInClassPersonInfoBox(index,userId,password,userName,email);
	nowInclassPersonId.push(targetId);
	updateInClassData(targetId);
	markPersonInClass();
};

function delegateLoadingDataMethod() {
	var isSelectClass =false;
	var tabState = $(".selected-tab").attr("id");
	var classId = $(".selected-classroom").attr("classid");
	if(classId!=undefined){
		isSelectClass =true;
	}
	if(tabState=="teacher-tab"){
			
			if(isSelectClass){
				// displayInClassPersonInfoBox(classId);		
				loadInClassTeacherData(classId);
			}
			loadAllTeacherData();
		}else if(tabState=="student-tab"){
			
			if(isSelectClass){
				loadInClassStudentData(classId);
			}
			loadAllStudentData();
		}else{

	}
	newInsertCount = 0;
};

function displayInClassPersonInfoBox(response) {
	var data = new Array();
	if(response.data==undefined){
		$(".in-class-person-list").empty();
		nowInclassPersonId = new Array();
		markPersonInClass();
	}else{
		(!response.data.length)?
		data[0] =  response.data:
		data = response.data;
		$(".in-class-person-list").empty();
		nowInclassPersonId = new Array();
		$.each(data,function(index,personInfo) {

			var email= personInfo.email;
			var userId= personInfo.user_id;
			var password= personInfo.userPwd;
			nowInclassPersonId[index] = userId;

			var userName= personInfo.user_name;
			appendInClassPersonInfoBox(index,userId,password,userName,email);
		});
		//之前加老師班級的方法
		// var classId = $(".selected-classroom").attr("classid");
		// loadInClassTeacherData(classId);
		markPersonInClass();
	}
	
};

function displayInClassPersonInfoBox2(response) {
	var data = new Array();
	if(response==undefined){
		$(".in-class-person-list").empty();
		nowInclassPersonId = new Array();
		markPersonInClass();
	}else{
		//$(".in-class-person-list").empty();
		//nowInclassPersonId = new Array();
		var ss = $(".all-person-list li").length;
		var email= response.email;
		var userId= response.user_id;
		var password= response.userPwd;
		//nowInclassPersonId[ss] = userId;

		var userName= response.user_name;
		appendAllPersonInfoBox(ss,userId,password,userName,'T');
		markPersonInClass();
	}
	
};

function displayInClassPersonInfoBox3(response) {
	var data = new Array();
	if(response==undefined){
		$(".in-class-person-list").empty();
		nowInclassPersonId = new Array();
		markPersonInClass();
	}else{
		//$(".in-class-person-list").empty();
		//nowInclassPersonId = new Array();
		var ss = $(".in-class-person-list li").length;
		var email= response.email;
		var userId= response.user_id;
		var password= response.userPwd;
		//nowInclassPersonId[ss] = userId;

		var userName= response.user_name;
		appendInClassPersonInfoBox(ss,userId,password,userName,'T');
		markPersonInClass();
	}
	
};

function appendInClassPersonInfoBox(index,userId,password,userName,email) {
	var checkboxIndex = "cc"+index;
	var person_li_pattern = 
		"<li account="+userId+">"+
			"<div class='person-checkbox'>"+
				"<input type='checkbox' id="+checkboxIndex +" name="+checkboxIndex+" />"+
				"<label for="+checkboxIndex +"><span></span></label>"+
			"</div>"+
			"<div class='person-name'>"+userName+"</div>"+
			"<div class='person-info-box'>"+
				"<div class='account-info'>"+
					"<div class='account'>"+userId+"</div>"+
					"<div class='float-left'>&nbsp;/&nbsp;</div>"+
					"<div class='password'>"+password+"</div>"+
				"</div>"+
				"<div class='email'>"+((email==undefined)?"無email資料":email)+"</div>"+
			"</div>"+
			// "<div class='edit-button'>...</div>"+
		"</li>";

	$(".in-class-person-list").append($(person_li_pattern));
	
};

function prependInClassPersonInfoBox(index,userId,password,userName,email) {
	var checkboxIndex = "cc"+index;
	var person_li_pattern = 
		"<li class='list-high-light' sort='0' account="+userId+">"+
			"<div class='person-checkbox'>"+
				"<input type='checkbox' id="+checkboxIndex +" name="+checkboxIndex+" />"+
				"<label for="+checkboxIndex +"><span></span></label>"+
			"</div>"+
			"<div class='person-name'>"+userName+"</div>"+
			"<div class='person-info-box'>"+
				"<div class='account-info'>"+
					"<div class='account'>"+userId+"</div>"+
					"<div class='float-left'>&nbsp;/&nbsp;</div>"+
					"<div class='password'>"+password +"</div>"+
				"</div>"+
				"<div class='email'>"+((email==undefined)?"無email資料":email)+"</div>"+
			"</div>"+
			// "<div class='edit-button'>...</div>"+
		"</li>";

	$(".in-class-person-list").prepend($(person_li_pattern));
	setCheckboxListener();
};

function displayAllPersonInfoBox(response) {
	var data = new Array();
	if(response.data==undefined){
		$(".all-person-list").empty();
	}else{
		(!response.data.length)?
		data[0] =  response.data:
		data = response.data;
		$(".all-person-list").empty();
		$.each(data,function(index,personInfo) {
			var email= personInfo.email;
			var userId= personInfo.user_id;
			var userName= personInfo.user_name;
			var password = personInfo.userPwd;
			appendAllPersonInfoBox(index,userId,password,userName,email);
		});
		//loadAllTeacherData();
		markPersonInClass();
	}
};

function appendAllPersonInfoBox(index,userId,password,userName,email) {
	var checkboxIndex = "acc"+index;

	var person_li_pattern = 
		"<li account="+userId+" sort='2' name="+userName+">"+
			"<div class='person-checkbox'>"+
				"<input type='checkbox' id="+checkboxIndex +" name="+userName+"/>"+
				"<label for="+checkboxIndex +"><span></span></label>"+
			"</div>"+
			"<div class='person-name'>"+userName+"</div>"+
			"<div class='person-info-box'>"+
				"<div class='account-info'>"+
					"<div class='account'>"+userId+"</div>"+
					"<div class='float-left'>&nbsp;/&nbsp;</div>"+
					"<div class='password'>"+password +"</div>"+
				"</div>"+
				"<div class='email'>"+((email==undefined)?"無email資料":email)+"</div>"+
			"</div>"+
			// "<div class='edit-button'>...</div>"+
		"</li>";

	$(".all-person-list").append($(person_li_pattern));
};


function isPersonInClass(id) {
	var result = false;
	$.each(nowInclassPersonId,function(index,value) {
		if(id==value){
			result = true;
		}
	});
	return result;
};

function markPersonInClass() {
	cancelAllCheckBoxListener();
	$(".in-class-person-list li input").prop("checked",true);
	var allPersonObjArray = $(".all-person-list li");
	allPersonObjArray.find("input").prop("checked",false);
	$.each(allPersonObjArray,function(index,obj) {
		var personId = $(obj).find(".account").text(); 
		if(isPersonInClass(personId)==true){
			$(obj).find("input").prop("checked",true);
		}
	});
	setCheckboxListener();
};

function displayAllClassInfoBox(response) {
	$(".ul-wrap-classroom").empty();
	for(i=0;i<response.length;i++){
		var classId = response[i].split('|||')[0];
		var className =response[i].split('|||')[1]+'年'+response[i].split('|||')[2]+'班';
		var classYear = response[i].split('|||')[3];
		appendClassInfoBox(classId,className,classYear);
	}
	$(".ul-wrap-classroom li").first().addClass("selected-classroom");
	delegateLoadingDataMethod();
};

function appendClassInfoBox(classId,className,classYear) {
	var class_li_pattern = "<li class=\"li-wrap-classroom\" classid=\""+classId+"\">"+
				"<div class=\"class-info-box\">"+
					"<div class=\"class-name\">"+className+"</div>"+
					"<div class=\"class-other-info\">"+
						"<div class=\"grade-year\">"+classYear+"年</div>"+
						"<div class=\"student-number\"></div>"+
					"</div>"+		
				"</div>"+
			"</li>";
	$(".ul-wrap-classroom").append($(class_li_pattern));

};

function beginInClassLoadingAnimation() {
	$("#inclass-loading-animation").show();
};

function endInClassLoadingAnimation() {
	$("#inclass-loading-animation").fadeOut( "slow" );
	// if($('.all-person-list .email').last().text()=='T'){
	// 	$('.all-person-list .email').last().parent().parent().css('display','none');
	// }
	// if($('.in-class-person-list .email').last().text()=='T'){
	// 	$('.in-class-person-list .email').last().parent().parent().css('display','none');
	// }
};

function beginAllClassLoadingAnimation() {
	$("#allclass-loading-animation").show();
};

function endAllClassLoadingAnimation() {
	$("#allclass-loading-animation").fadeOut( "slow" );
};

function getTabState(){
	return $(".selected-tab").attr("id");
}


function setSearchHoverListener() {
	$(".search").hover(function() {
		$(".search input").css("opacity",1);
		$(".search .left").css("opacity",1);
		$(".search .right").css("opacity",1);
		$(this).addClass("active");
		$('.search input').focus();
	})
};
function onblurSearch() {
	$(".search").removeClass("active");
	$(".search input").css("opacity",1);
	$(".search .left").css("opacity",1);
	$(".search .right").css("opacity",1);
	setTimeout(function() {
		$(".search input").css("opacity",0);
		$(".search .left").css("opacity",0);
		$(".search .right").css("opacity",0);

	}, 400);
};
function back() {
	location.replace('../choice.jsp');
};