<%@ page pageEncoding="utf-8" import="flex.object.nadmin.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>  
<%
System.out.println("in tin.jsp");
String ownID = "";
String ownName = "";
String ownEmail = "";
String ownSchoolID = "";
String ownSchoolName = "";
flex.object.nadmin.User own = (flex.object.nadmin.User)session.getAttribute("user");
// System.out.println("in tin.jsp own "+own);
if (own != null) {
	ownID = own.getUserID();
	ownName = own.getUserName();
	ownEmail = own.getEmail();
	flex.object.nadmin.SchoolProfile schoolData = own.getLoginSchool();
	ownSchoolID = schoolData.getSchoolID();
	ownSchoolName = schoolData.getSchoolName();
	System.out.println("@@@ "+ownID+"@@@ "+ownName+"@@ "+ownEmail+" @@ "+ownSchoolID+" @@ "+ownSchoolName);
}
String preURL = request.getRequestURL().toString();
// System.out.println("11111"+preURL);
preURL = preURL.substring(0,preURL.lastIndexOf("/game/")+6)+"game_platform/";
// System.out.println("22222 "+preURL);

%>
<script type="text/javascript" src="<%=preURL%>xapi/cryptojs_v3.1.2.min.js"></script>
<script type="text/javascript" src="<%=preURL%>xapi/verbs.js"></script>
<script type="text/javascript" src="<%=preURL%>xapi/xapistatement.js"></script>
<script type="text/javascript" src="<%=preURL%>xapi/xapiwrapper.js"></script>
<!-- <script type="text/javascript" src="xapi/moment.js"></script> -->
<script>
if ("<%=ownID%>" != "") {
	var userID = "<%=ownID%>";
	var userName = "<%=ownName%>";
	var userMail = "<%=ownEmail%>";
	var schoolID = "<%=ownSchoolID%>";
	var schoolName = "<%=ownSchoolName%>";
}
var tempObjName,userVerb,roleType;
function xAPIinit(user){
	userVerb = user.verb;
	if (user.objectSource != "money") {
		roleType = "openID";
	}else{
		roleType = "money";
	}
	////////////////////////////////////包裝statement內容

	if (userVerb == "logged-in" || userVerb == "Log Out") {
		tempObjName = "Holiyo_TN";
	}else{
		tempObjName = user.objectName;
	}

	var objectContent =
	{
		'id': location.origin+'/game/game_platform/'+user.objType+'/'+user.objectSource, //URI型態─範例:1.課堂名稱/教案ID 2.使用者角色
		'definition':{
			//assessment、course、application
			'type':'http://adlnet.gov/expapi/activities/'+user.objType, //活動
			'name':{
				'en-US':tempObjName //放教案,考卷,題目之名稱
			}
		}
	}
	var stmt = new ADL.XAPIStatement(
		//email一定要為______@___.___
		//總共三個參數Agent、Verb、object
		new ADL.XAPIStatement.Agent('mailto:'+userMail, userName), //使用者userID
		ADL.verbs[userVerb],objectContent //動作
	);
	stmt.generateId();
	stmt.context = {
		'platform':location.origin+'/gmae/game_platform',         //平台	
		'extensions': {
	    	//兩個資訊1.校ID-校名 2.角色
	    	'http://id.tincanapi.com/extension/tags':[
	    		schoolID+'-'+schoolName,roleType
	    	]
		}
	};
	if (user.description != undefined && user.description2 == undefined) {
		console.log("description");
		stmt.object.definition['description']={'en-US':user.description};
	}
	if (user.description2 != undefined) {
		console.log("description2");
		stmt.object.definition['description']={'en-US':user.description2,'zh-TW':user.description};
	}
	if (user.extensions != undefined) {
		console.log("extensions");
		stmt.object.definition['extensions'] = {'http://id.tincanapi.com/extension/tags':user.extensions};	
	}
	if (user.objTime != undefined) {
		console.log("extensions");
		stmt.object.definition['extensions'] = {'http://id.tincanapi.com/extension/duration':user.objTime};	
	}
	sendxAPI(stmt);
}
function sendxAPI(stmt){
	//檢查帳號資料
	// chechkLRSConfig();

	// 傳送LRS認證
	ADL.XAPIWrapper.changeConfig({
		'endpoint': 'http://140.92.88.147:80/visca/TCAPI/',
		'user': '1BC7A3920368D3670E6D',
		'password': '588811CC989D47A637A0'
	});

	ADL.XAPIWrapper.sendStatement(stmt,function(res,obj){
		// alert("respose:"+obj.id+";status:"+res.status);		//xAPI語法不論正確與否送出的status值,最後要拿掉
		console.log("respose:"+obj.id+";status:"+res.status);
		// 清除登入cookie
		if (userVerb == "logged-in")
			$.cookie("tin", null, { path: '/game/game_platform' });
		if (userVerb == "returned")
			$.cookie('verbReturned-'+userID, null, { path: '/game' });
		
	});
	if (userVerb == "Log Out"){
		setTimeout(function(){location.replace(location.origin+'/game/game_platform/login.html');},300);
	}
	// status 200 正常
	// status 500 網路問題

	// var o = document.getElementById('output');			   //這一行拿掉可以讓登入登出時不會顯示xapi碼
	//o.innerText = JSON.stringify(stmt, null, '    ');
}

</script>