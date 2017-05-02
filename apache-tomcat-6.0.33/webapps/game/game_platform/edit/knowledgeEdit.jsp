<!DOCTYPE html>
<%@include file="../navbar_t2.jsp"%>
<%
String userRole = auth.getMainRoleID();
String userloadlink = userRole.equals("student")?"ByStudentID":"ByTeacherID";
String userID = auth.getUserID();
String userName = auth.getUserName();
//System.out.println("firstEdit "+userRole+userID+userName);

%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="user-scalable=0">
<script type="text/javascript" src="../../js/xml2json.js" ></script>
<script type="text/javascript" src="../../js/iTS5Dialog.js"></script>
<link rel="stylesheet" href="firstEdit.css"></link>
<html>
<body>
<div class="fullmain">
	<div id="studen_stat_table">
		<div id="maskpage"></div>
		<div>
			<div id="stuListbox">
				<div class='text' id="titlename1">指派班級</div>
				<div id="allclass"></div>
				<div class='choicebox'>
					<div class='btn text' id="OKbtn">確定</div>
					<div class='btn text' id="NObtn">取消</div>
				</div>
			</div>
			<div id='msg' class='isConfirm'>
					<div class='text' id="titlename2"></div>
					<div id="msgMain"></div>
					<div class='choicebox'>
						<div class='btn text' id="OKbtn2">確定</div>
						<div class='btn text' id="NObtn2">取消</div>
					</div>
			</div>
		</div>
	</div>
	<div id="wrapper" class="main menuClose">
		<div class="list" style='height:100%;'>
			<div class="scroll">
			<div class="outside">
			</div>
			</div>
		</div>
	
		<div id='gototop'></div>
		<div class="navbar-state-top itsnavbar itsSearchBar">
			<span id="searchBarFirstItem">
				<button type="button" id="myGame" class="choice text">我的作品</button>
				<button type="button" id="hotGame" class="nochoice text">雲端作品庫</button>
			</span>
			<span id="jsp"></span>
		</div>
	</div>
</div> 		
</body>
<script type="text/javascript">
var auth_userID = '<%=userID%>';
var auth_getMainRoleID = '<%=userRole%>';
var auth_userName = '<%=userName%>';
var showHot = false;
$(document).ready(function(){
	$('#myGame').click();

	// 針對FB、Google+使用者
	// if ( auth_getMainRoleID == 'external' ) {
	// 	$($('.itsnavbar')[1]).hide();
	// }
});
var oldFliter = "a%,c%,g%,t%";
var newFliter='';
//紀錄目前篩選器
function getfilterKey(){
	var a = $("#area").val();
	newFliter = a;
	var temp = "";
	if(a == "a%"){
		a="";
	} else {
		temp = a;
	}

	var c = $("#city").val();
	newFliter = newFliter+","+c;
	if(c == "c%") {
		c = "";
	} else if(temp.length == 0) {
		temp = c;
	} else {
		temp = temp+","+c;
	}

	var g = $("#gradeID").val();
	newFliter = newFliter+","+g;
	if(g == "g%"){
		g = "";
	} else if(temp.length == 0) {
		temp = g;
	} else {
		temp = temp+","+g;	
	}
	
	var t = $("#domain").val();
	newFliter = newFliter +","+t;
	if(t =="t%"){
		t = "";
	} else if (temp.length == 0){
		temp = t;
	} else {
		temp = temp +","+t;
	}
	

	if(temp.length == 0 && showHot == false) {
		temp = "nofilter";
		hasfilter = false;
	}

	return temp;
}
// 所有遊戲數 
var gamelistLength = 0;
// 完成遊戲數
var gameCompleteLength = 0;
function loadGameData(){
	gameCompleteLength = 0;
	var againGameID;
	$('.square').remove();
	iTS5Dialog.myWaitMsg('讀取資料中');
	var addTemplate = "<div class='square'>"+
							"<div id='addbtn' onclick='addGame()'></div>"+
					  "</div>";
	$('.outside').html(addTemplate);
	
	$.ajax({
		type:'GET',
		url:'action/loadData.jsp',
		data:{
			"userName" : '<%=userID%>',
			"planFlag" : 0,
			"gtype":'knowledge'
		}
	}).done(function(evt){
		var filterKey = getfilterKey();
		if(evt == undefined || evt == null || evt == "null"){
			//讀取資料錯誤,1秒內後重讀
			setTimeout("loadGameData()", parseInt(Math.random()*1000));
		}else{
			// debugger;
			var gameList = evt.trim();
			gameList = gameList.split('@Data||');
			for (var i = 1; i < gameList.length; i++) {
				var gameID = gameList[i].split('|||')[0];
				var gameName = gameList[i].split('|||')[1];
				var unitID = gameList[i].split('|||')[2];
				var creator = gameList[i].split('|||')[3];
				var imgURL = gameList[i].split('|||')[4];
				var playURL = gameList[i].split('|||')[5];
				var isShare = gameList[i].split('|||')[6];
				var time = gameList[i].split('|||')[7].split(" ")[0];
				var gid = gameList[i].split('|||')[8];
				var creatorName = gameList[i].split('|||')[9];
				var schoolYear = gameList[i].split('|||')[10];
				var semester = gameList[i].split('|||')[11];
				var subject = gameList[i].split('|||')[12];
				var grade = gameList[i].split('|||')[13];
				var area = gameList[i].split('|||')[14];
				var counties = gameList[i].split('|||')[15];
				var viewNum = gameList[i].split('|||')[16];
				var gameOldID = gameList[i].split('|||')[17];

				// 判斷gameID是否重複
				if (gameID == againGameID) {
					// console.log(gameID+gid);
					// 班級id加入tag
					var gameGid = $('#'+gameID).attr('gid');
					$('#'+gameID).attr('gid',gameGid+","+gid);
				}else{
					// console.log(madeTime);
					imgURL = location.protocol+"//"+location.host+"/iTS5/service/file/game/"+gameID+"/"+imgURL;

					var loadG = unitID.substring(unitID.indexOf('g')+1,unitID.indexOf('s'));
					var loadT = unitID.substring(unitID.indexOf('t')+1,unitID.indexOf('a'));
					var loadA = unitID.substring(unitID.indexOf('a')+1,unitID.indexOf('c'));
					var loadC = unitID.substring(unitID.indexOf('c')+1,unitID.indexOf('@'));

					var shard_text = "分享至雲端";
					var template =	"<div class='square'>"+
										"<div class='label3' id='"+gameID+ "' creator='"+creator+"' unitID='"+unitID+"' time='"+time+"' gid='"+gid+"' creatorName='"+creatorName+"' schoolYear='"+schoolYear+"' semester='"+semester+"' subject='"+subject+"' grade='"+grade+"' area='"+area+"' counties='"+counties+"' viewNum='"+viewNum+"'>"+
											"<div class='pictureResize'><span id='imgAdjust'/></div>"+
											"<div class='creatorName'>"+creatorName+"</div>"+
											"<div class='textResize'>"+gameName+"</div>"+
											"<div class='buttonResize'>"+
												"<img id='detail' src='../images/tools/detail.svg' onclick='openDetail(this)'>"+
												"<btn class='assign' onclick='assignHandle(this)'>"+
														"<img src='../images/tools/giveclass-1.svg'> 指派</btn>"+
												"<btn class='play' url='"+playURL+"' onclick='viewHandle(this)'>"+
														"<img src='../images/tools/play.svg'> 試玩</btn>"+
												"<btn class='edit' onclick='editHandle(this)'>"+
													"<img src='../images/tools/edit.svg'> 編輯</btn>"+
												"<span class='veiwText'><img src='../images/tools/view.svg'> "+viewNum+"</span>"+
											"</div>"+
											"<div class='isshare' text='"+shard_text+"' onclick='shareHandle(this)'></div>"+
											"<div class='deletebtn' onclick='deleteGame(this)'></div>"+
										"</div>"+
									"</div>";
					//篩選
					if($('#area option:selected').val()==loadA || $('#area option:selected').val()=='a%'){
						if($('#city option:selected').val()==loadC || $('#city option:selected').val()=='c%'){
							if($('#gradeID option:selected').val()==loadG || $('#gradeID option:selected').val()=='g%'){
								if($('#domain option:selected').val()==loadT || $('#domain option:selected').val()=='t%'){
									//產生畫面
									$('.outside').append(template);
									gameCompleteLength++;
									// 判斷遊戲是否製作完成
									if (playURL != "null") {
										var fe = playURL.split("&fe=")[1];
										fe = fe.substring(fe,fe.indexOf('&title'));
										var levelNum = Math.ceil( ( fe.length-4 ) / 2 ); // (總長度-封面加說明)/2(題目+提示)
										// 判斷答案選項數
										var options = playURL.split("&options=")[1];
										options = options.substring(options,options.indexOf('@@@&time'));
										var optionsArray = options.split('@@@');
										// 判斷選項X4
										var optionFlag = true;
										for (var a = 0; a < optionsArray.length; a++) {
											eachAns = optionsArray[a].split(",").filter(function(n){return n});
											if (eachAns.length != 4) {
												optionFlag = false;
											}
										}
									}
									//刪除存檔失敗遊戲
									debugger
									if( $('#'+gameID+' .play').attr('url')=="null" ){
										$('#'+gameID).parent().remove();
									}else if(levelNum != optionsArray.length && !optionFlag ){
										//刪除未完成遊戲
										$('#'+gameID+' .play').hide();
										$('#'+gameID+' .isshare').hide();
										gameCompleteLength--;	
									}
								}
							}
						}
					}
					if(gameOldID != "null"){
						$('#'+gameID+' .edit').hide();
						$('#'+gameID+' .isshare').hide();
					}

					// 新增圖片連結
					$('#'+gameID+'>.pictureResize>#imgAdjust').css('background-image','url('+imgURL+')');

					if (isShare == 1) {
						var shard_text = "取消分享至雲端";
						$('#'+gameID+'>.isshare').addClass('ishotGame').attr('text',shard_text);
					};

					againGameID = gameID;
				}
			};
			if($('.square').length-1 <= 0 && newFliter !="a%,c%,g%,t%"){
				iTS5Dialog.myAlert("查無資料", function() {
					var domainArray = oldFliter.split(',');
					$("select#area").val(domainArray[0]);
					citySelectbindArea();
					$("select#city").val(domainArray[1]);
					$("select#gradeID").val(domainArray[2]);
					//domainSelectbindGrade();
					$("select#domain").val(domainArray[3]);
					// if (oldFliter !="a%,c%,g%,t%" && newFliter!='') {
						loadGameData();
					// };

				});
				return;
			}

			// 針對FB、Google+使用者頁面調整
			// if ( auth_getMainRoleID == 'external' ) {
			// 	$('.assign').css('display','none');
			// 	$('.isshare').css('display','none');
			// }

			//紀錄上一次篩選
			oldFliter = newFliter;
			resize();
			iTS5Dialog.myCloseMsg();
			$('.oneclass').remove();
			// 讀取班級資訊
			getClassInfo();
			// 變更遊戲數
			// if("<%=utype%>"!="money")
				// updateGameNum();
		}
	})
	
}
// 雲端庫
function loadHotGame(){
	iTS5Dialog.myWaitMsg('讀取資料中');

	var userName = '<%=userID%>';
	// 清除畫面
	$('.square').remove();
	$.ajax({
		type:'GET',
		url:'action/loadData.jsp',
		data:{
			"planFlag" : 1,
			"gtype":'knowledge',
			'schoolID':'<%=school_id%>'
		}
	}).done(function(evt){
		var filterKey = getfilterKey();
		if(evt == undefined || evt == null || evt == "null"){
			//讀取資料錯誤,1秒內後重讀
			setTimeout("loadHotGame()", parseInt(Math.random()*1000));
		}else {
			// debugger;
			var gameList = evt.trim();
			gameList = gameList.split('@Data||');

			for (var i = 1; i < gameList.length; i++) {
				var gameID = gameList[i].split('|||')[0];
				var gameName = gameList[i].split('|||')[1];
				var unitID = gameList[i].split('|||')[2];
				var creator = gameList[i].split('|||')[3];
				var imgURL = gameList[i].split('|||')[4];
				var playURL = gameList[i].split('|||')[5];
				var isShare = gameList[i].split('|||')[6];
				var time = gameList[i].split('|||')[7].split(" ")[0];
				var shareTime = gameList[i].split('|||')[8].split(" ")[0];
				var creatorName = gameList[i].split('|||')[9];
				var schoolYear = gameList[i].split('|||')[10];
				var semester = gameList[i].split('|||')[11];
				var subject = gameList[i].split('|||')[12];
				var grade = gameList[i].split('|||')[13];
				var area = gameList[i].split('|||')[14];
				var counties = gameList[i].split('|||')[15];
				var viewNum = gameList[i].split('|||')[16];
				
				imgURL = location.protocol+"//"+location.host+"/iTS5/service/file/game/"+gameID+"/"+imgURL;
				
				var loadG = unitID.substring(unitID.indexOf('g')+1,unitID.indexOf('s'));
				var loadT = unitID.substring(unitID.indexOf('t')+1,unitID.indexOf('a'));
				var loadA = unitID.substring(unitID.indexOf('a')+1,unitID.indexOf('c'));
				var loadC = unitID.substring(unitID.indexOf('c')+1,unitID.indexOf('@'));

				if (isShare == 1 && showHot) {
					var shard_text = "取消分享至雲端";
					var template =	"<div class='square'>"+
										"<div class='label3' id='"+gameID+ "' creator='"+creator+"' unitID='"+unitID+"' time='"+time+"' shareTime='"+shareTime+"' creatorName='"+creatorName+"' schoolYear='"+schoolYear+"' semester='"+semester+"' subject='"+subject+"' grade='"+grade+"' area='"+area+"' counties='"+counties+"' viewNum='"+viewNum+"'>"+
											"<div class='pictureResize'><span id='imgAdjust'/></div>"+
											"<div class='creatorName'>"+creatorName+"</div>"+
											"<div class='textResize'>"+gameName+"</div>"+
											"<div class='buttonResize'>"+
												"<img id='detail' src='../images/tools/detail.svg' onclick='openDetail(this)'>"+
												"<btn class='play' url='"+playURL+"' onclick='viewHandle(this)'>"+
														"<img src='../images/tools/play.svg'> 試玩</btn>"+
												"<btn class='edit' onclick='editHandle(this)'>"+
													"<img src='../images/tools/edit.svg'> 編輯</btn>"+
												"<span class='veiwText'><img src='../images/tools/view.svg'> "+viewNum+"</span>"+
											"</div>"+
											"<div class='isshare ishotGame' text='"+shard_text+"' onclick='shareHandle(this)'></div>"+
										"</div>"+
									"</div>";
					
					//篩選
					if($('#area option:selected').val()==loadA || $('#area option:selected').val()=='a%'){
						if($('#city option:selected').val()==loadC || $('#city option:selected').val()=='c%'){
							if($('#gradeID option:selected').val()==loadG || $('#gradeID option:selected').val()=='g%'){
								if($('#domain option:selected').val()==loadT || $('#domain option:selected').val()=='t%'){
									//產生畫面
									$('.outside').append(template);
									//刪除未完成遊戲
									// if($('#'+gameID+' .play').attr('url').split('&')[2].length < 27){
									// 	$('#'+gameID+' .play').hide();
									// 	$('#'+gameID+' .isshare').hide();
									// }
								}
							}
						}
					}
					
					// 新增圖片連結
					$('#'+gameID+'>.pictureResize>#imgAdjust').css('background-image','url('+imgURL+')');
				}
				// 不為創建者
				if (userName != creator ) {
					// debugger
					// 隱藏編輯名稱
					$('#'+gameID+'>.buttonResize>.edit').hide();
					$('#'+gameID+'>.isshare').addClass('notmy');
					$('#'+gameID+'>.isshare').attr('text','');
					$('#'+gameID+'>.buttonResize').append("<btn class='collect' onclick='collect(this)'>"+
															"<img src='../images/tools/getit.svg'>收藏</btn>");
				}
			}
		}
		iTS5Dialog.myCloseMsg();
		//之後再修改只有一筆資料時，進行篩選問題
		if($('.square').length <= 0 && newFliter !="a%,c%,g%,t%"){
			iTS5Dialog.myAlert("查無資料", function() {
				var domainArray = oldFliter.split(',');
				$("select#area").val(domainArray[0]);
				citySelectbindArea();
				$("select#city").val(domainArray[1]);
				$("select#gradeID").val(domainArray[2]);
				//domainSelectbindGrade();
				$("select#domain").val(domainArray[3]);
				
				loadHotGame();
				
			});
			return;
		}
		//紀錄上一次篩選
		oldFliter = newFliter;	
		resize();
	});
}
var fullClassList_withNameAndID='';
var classList = [];
function getClassInfo(){
	if(auth_getMainRoleID=="teacher" || auth_getMainRoleID=="external") {
		sessionStorage.removeItem('fullClassList-'+auth_userID+"-"+location.host);
		$.get("/iTS5/service/info/getClassInfoByTeacher/"+auth_userID+"?breakCache="+Math.random(), function(result){
			// console.log(result);
			if(result == undefined){
				//showMessage("連線失敗");
				return;
			}
			if(result.data==undefined)
			{
				// getallplanlist();
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

				if($.cookie('leng') == 'zh-TW'){
					$('#allclass').append("<div class='oneclass' id='"+thisClassID+"'><input  type='checkbox' name='size' value='"+tci+"'>"+classList[ci].class_name+"</div>");
				}
				else// if($.cookie('leng') == 'en-US')
				{
					thisClassName = thisClassName.slice(0,-1).replace('年','-');
					$('#allclass').append("<div class='oneclass' id='"+thisClassID+"'><input  type='checkbox' name='size' value='"+tci+"'>"+thisClassName+"</div>");
				}
			}
			sessionStorage.setItem('fullClassList-'+auth_userID+"-"+location.host, fullClassList_withNameAndID);
		});
	}
}
function addGame(){
	if("<%=utype%>"!="money"){
		var maxLength =$('#first_edit .funcText>span').text().split("/")[1].split(' ')[0];
		maxLength = parseInt(maxLength);
		if (gamelistLength >= maxLength) {
			iTS5Dialog.myAlert("您的作品數已達上限");
			return;
		}
	}
	location.replace('create_K.jsp?new');
}

function editHandle(evt){
	var gameID = evt.parentElement.parentElement.id;
	location.replace('create_K.jsp?edit='+gameID);
}
function viewHandle(evt){
	var gameID = evt.parentElement.parentElement.id;
	var playurl = $(evt).attr('url');
	window.open(location.origin+playurl);

	if ($('#'+gameID+' .isshare').hasClass('notmy')) {
		$.ajax({
			type:'POST',
			url:'action/savegame.jsp',
			data:{
				gameid:gameID,
				type:'view'
			}
		}).done(function(evt){
			evt = evt.trim();
			console.log(evt);
		})
	}
}
function collect(evt){
	var gameID = evt.parentElement.parentElement.id;
	var gameUserID = $(evt).parent().parent().attr('creator');
	if ("<%=utype%>"!="money") {
		var maxLength =$('#first_edit .funcText>span').text().split("/")[1].split(' ')[0];
		maxLength = parseInt(maxLength);
	}
	if ( auth_getMainRoleID == 'external' ) {
		iTS5Dialog.myAlert('免費帳號不提供收藏喔!!');
	}else{
		if ("<%=utype%>"!="money" && gamelistLength>=maxLength) {
			iTS5Dialog.myAlert("您的作品數已達上限");
		}else{
			$.ajax({
				type:'POST',
				url:'/iTS5/service/holiyo/copyGame',
				data:{
					id:gameID,
					userID:auth_userID,
					userName:auth_userName
				}
			}).done(function(evt){
				console.log(evt);
				$.ajax({
					type:'POST',
					url:'action/savegame.jsp',
					data:{
						gameid:gameID,
						newID:evt,
						creator:gameUserID,
						type:'collect'
					}
				}).done(function(evt){
					evt = evt.trim();
					console.log(evt);
					
					iTS5Dialog.myAlert("收藏成功",function(){
						location.reload();
					});
				})
			})
		}
	}
}
function deleteGame(evt){
	var gameSquare = evt.parentElement.parentElement;
	var gameid = evt.parentElement.id;
	var msgText = "是否確定要刪除?";
	iTS5Dialog.myConfirm(msgText,function(){
		$.ajax({
			type:'POST',
			url:'action/savegame.jsp',
			data:{
				gameid:gameid,
				type:'delete'
			}
		}).done(function(evt){	
			evt = evt.trim();
			console.log(evt);
			gameSquare.remove();
			resize();
			if("<%=utype%>"!="money"){
				updateGameNum();
			}
			location.reload();
		})
	});
}
var nowclickExamis;
function assignHandle(evt){
	$('#studen_stat_table').show();
	var gameid = evt.parentElement.parentElement.id;
	// 判斷遊戲是否製作完成
	var fe = $('#'+gameid+' .play').attr('url').split("&fe=")[1];
	fe = fe.substring(fe,fe.indexOf('&title'));
	if (fe.length == 18) {		
		if ($('.noClass').length ==1 ) {
			$('.noClass').remove();
			$('#NObtn').show();
			$('#OKbtn').text("確定")
		}

		var gid = $('#'+gameid).attr('gid');  //之後加班級id

		for(var i = 0; i<classList.length; i++){
			$($('.oneclass>input')[i]).attr('checked', false);

			//檢查gid與class_id相同
			if(gid.indexOf(classList[i].class_id)>=0) {
				$($('.oneclass>input')[i]).prop('checked', 'true');
			}
		}

		$('#OKbtn').bind('click', changeGID);
		$('#NObtn').bind('click', cancel);

		function changeGID(evt){
			$('#OKbtn').unbind('click', changeGID);
			$('#NObtn').unbind('click', cancel);
			var gidString = "";
			var trueOrFalse = "";
			// checked
			for (var i = 0; i < $('.oneclass').length; i++) {
				if ($($('.oneclass>input')[i]).prop('checked') == true){
					trueOrFalse = ",true";
				}else{
					trueOrFalse = ",false";
				}
					var gid = $('.oneclass')[i].id+trueOrFalse;

					$.ajax({
						type:'POST',
						async:false,
						url:'action/savegame.jsp',
						data:{
							gameid:gameid,
							gid:gid,
							type:'insertClass'
						}
					}).done(function(evt){	
						// evt = evt.trim();
						// console.log(evt);
						if (gidString == '' && trueOrFalse == ",true") {
							gidString = $('.oneclass')[i].id;
						}else if (trueOrFalse == ",true"){
							gidString = gidString+","+$('.oneclass')[i].id;
						}
						$('#'+gameid).attr('gid',gidString);
					})
				
			}
		
			$('#studen_stat_table').hide();
		}
	}else{
		$('.noClass').remove();
		$('#OKbtn').text("關閉")
		$('#OKbtn').bind('click', cancel);
		$('#NObtn').hide();
		$('#allclass').append('<div class="noClass">請完成遊戲再指派</div>')
	}
	function cancel(evt){
		$('#OKbtn').unbind('click', changeGID);
		$('#NObtn').unbind('click', cancel);
		$('#studen_stat_table').hide();
	}
}
function openDetail(evt){
	var id = evt.parentElement.parentElement.id;
	var years = $('#'+id).attr('schoolYear');
	var grade = $('#'+id).attr('grade');
	var order = $('#'+id).attr('semester');
	var domain = $('#'+id).attr('subject');
	var area = $('#'+id).attr('area');
	var city = $('#'+id).attr('counties');
	var gameName = $('#'+id+'>.textResize').text();
	var time = $('#'+id).attr('time');
	var userName =  $('#'+id).attr('creatorName');
	var viewCount = $('#'+id).attr('viewNum');
	
	// qrcode
	var qrcodeImg = '';
	//var tmp = "http://api.qrserver.com/v1/create-qr-code/?size=500x500&data=";
	var tmp = "http://www.qr-code-generator.com/phpqrcode/getCode.php?cht=qr&chl=";
	var tmp2 = encodeURIComponent(location.origin+$('#'+id+' .play').attr('url'));
	qrcodeImg = tmp+tmp2;
	
	var detailTemp = '<div style="width:90%;padding-left: 5%;">\
						<div id="contentName">遊戲名稱\
						<span style="margin-left: 20px;font-weight: bold;">'+gameName+'</span></div>\
						<table id="tableStyle">\
							<tr>\
							<td>年度</td>\
							<td style="padding-left:0;">'+years+'</td>\
							<td>學期</td>\
							<td style="padding-left:0;">'+order+'</td>\
							</tr>\
							<tr>\
							<td>年級</td>\
							<td style="padding-left:0;">'+grade+'</td>\
							<td>領域</td>\
							<td style="padding-left:0;">'+domain+'</td>\
							</tr>\
							<tr>\
							<td>地區</td>\
							<td style="padding-left:0;">'+area+'</td>\
							<td>縣市</td>\
							<td style="padding-left:0;">'+city+'</td>\
							</tr>\
						</table>\
						<div id="bottomText">\
							<div id="leftQrcode">\
								<img src='+qrcodeImg+' style="height:100%;cursor:pointer;">\
							</div>\
							<div id="rightText">\
								<div style="text-align: start;padding-left: 16px;">製作者\
									<span style="margin-left: 32px;white-space: nowrap;">'+userName+'</span></div>\
								<div style="text-align: start;padding-left: 1px;">製作日期\
									<span style="margin-left: 32px;">'+time+'</span></div>\
								<div style="text-align: start;padding-left: 1px;">瀏覽人氣\
									<span style="margin-left: 32px;">'+viewCount+'</span></div>\
							</div>\
						</div>\
					</div>\
					';


	iTS5Dialog.myHtmlObject({'html':detailTemp,
							 'type':'Alert',
							 'width':'500px', 
							 'height': '450px',
							 'title':'詳細資料'
							});
	$('#myMsgMain').css({'display':'inline-block','height':'78.6%','width':'100%','flex':'1','-webkit-box-flex':'1;','-webkit-flex':'1','-ms-flex':'1'});
	$('.isAlert').css({'display':'-webkit-box','display':'-webkit-flex','display':'-ms-flexbox','display':'flex','-webkit-box-orient': 'vertical','-webkit-box-direction': 'normal','-webkit-flex-direction': 'column','-ms-flex-direction': 'column','flex-direction': 'column'});
	$($('.isAlert>.choicebox>.sysinfo')[0]).text("關閉").css("width","20%");
	$('#tableCell .choicebox>#OKBtn').css('width','200px');
	$('#tableCell #closeBtn').css({'margin-left':'470px'});

	// 判斷遊戲是否製作完成
	var fe = $('#'+id+' .play').attr('url').split("&fe=")[1];
	fe = fe.substring(fe,fe.indexOf('&title'));
	var levelNum = Math.ceil( ( fe.length-4 ) / 2 ); // (總長度-封面加說明)/2(題目+提示)
	// 判斷答案選項數
	var options = $('#'+id+' .play').attr('url').split("&options=")[1];
	options = options.substring(options,options.indexOf('@@@&time'));
	var optionsArray = options.split('@@@');
	// 判斷選項X4
	var optionFlag = true;
	for (var i = 0; i < optionsArray.length; i++) {
		eachAns = optionsArray[i].split(",").filter(function(n){return n});
		if (eachAns.length != 4) {
			optionFlag = false;
		}
	}
	if ( levelNum == optionsArray.length && optionFlag) {
		setTimeout(function(){ 
			$('#leftQrcode').append("<span class='enlarge'>點我放大</span>");
		 }, 600);
		$('#bottomText img').bind('click',showQrcode);
	}else{
		qrcodeImg = "img/no_qrcode.svg";
		$('#bottomText img').attr("src",qrcodeImg);
		$('#bottomText img').css('cursor','default');
	}

	//hotgame
	/*if ($('#hotGame').attr('class') == 'choice') {
		var shareTime = $('#'+id).attr('shareTime');
		$($('#bottomText>div')[1]).append('<div style="text-align: start;padding-left: 1px;">分享日期'+
										'<span style="margin-left: 36px;">'+shareTime+'</span></div>');
	}*/

	// 針對FB、Google+使用者
	// if ( auth_getMainRoleID == 'external' ) {
	// 	// 六資訊隱藏
	// 	$('#tableStyle').hide();

	// 	$($('#rightText>div')[0]).hide();
	// 	$($('#rightText>div')[1]).css({'text-align':'center','margin-top':'4px','padding-left':'25px'});
	// 	$('#bottomText').css({'display':'block','margin-top':'5px'});
	// 	$('#leftQrcode').css('height','220px');
	// 	$('#qrImg').css({'left':'-165px','top':'50px'});
	// }

}
function showQrcode(url){
	var imgUrl = $(url.target).attr('src');
	console.log(imgUrl);
	$('body').append("<div id='bigQrcodeBg' onclick='cancelImg()'><img src="+imgUrl+" style='cursor:pointer;'></div>");

	// 顯示比例
	var tempZoom = Math.min($('body').width(),$('body').height());
	tempZoom = tempZoom/500;
	$('#bigQrcodeBg').attr('style','-webkit-transform:scale('+tempZoom+');-moz-transform:scale('+tempZoom+'); transform:scale('+tempZoom+');');
	$('#bigQrcodeBg').css('display','block');
}
function cancelImg(){
	$('#bigQrcodeBg').remove();
}
function shareHandle(evt){
	var gameid = evt.parentElement.id;
	// var youtubeID = $(evt).parent().attr('youtubeID');

	if($(evt).css('cursor') == "not-allowed")
		return;

	if($(evt).hasClass('ishotGame')){
		$(evt).removeClass('ishotGame');
		$(evt).attr('text','分享至雲端');
		
		$.ajax({
			type: 'post',
			url: 'action/isShare.jsp',
			data:{
				gameid: gameid,
				isShare: 0,
				type:'setShare'
			},
			success: function(evt) {
				evt = evt.trim();
				console.log(evt);
				console.log("設定取消雲端成功");
			}
		});
	}
	else {
		$(evt).addClass('ishotGame');
		$(evt.parentElement.parentElement).addClass('hot');
		$(evt).attr('text','取消分享至雲端');
		$.ajax({
			type: 'post',
			url: 'action/isShare.jsp',
			data:{
				gameid: gameid,
				isShare: 1,
				userID:auth_userID,
				type:'setShare'
			},
			success: function(evt) {
				evt = evt.trim();
				console.log(evt);
				console.log("設定雲端成功");
				if (evt=="sharepoint") {
					iTS5Dialog.myAlert("獲得點數50!");
				}
				
			}
		});
	}
}

// 變更遊戲數量
function updateGameNum(){
	gamelistLength = $('.label3').length;
	// 取的ox holiyo數
	var oxNumText = $('#high_edit .funcText>span').text();
    var oxNum = oxNumText.substring(oxNumText.indexOf('(')+2,oxNumText.indexOf('/'));
    var oxCNumText = $('#high_works .funcText>span').text();
    var oxCNum = oxNumText.substring(oxCNumText.indexOf('(')+2,oxCNumText.indexOf('/'));

    $.ajax({
		type: 'post',
		url: 'action/savegame.jsp',
		data:{
			creator: auth_userID,
			type:"numberGame",
			easyNum:gamelistLength,
			easyCNum:gameCompleteLength,
			oxNum:oxNum,
			oxCNum:oxCNum
		}
	}).done(function(result){
		result = result.trim();
		console.log("result "+result);
		var totalNum = $('#first_edit .funcText>span').text().split("/")[1];
		$('#first_edit .funcText>span').text("( "+gamelistLength+"/"+totalNum);
		$('#first_works .funcText>span').text("( "+gameCompleteLength+"/"+totalNum);
		
	})
}

/*處理是否點擊熱門或個人*/
$('#hotGame').click(function() {
	$('#hotGame').attr('class', 'choice');
	$('#myGame').attr('class', 'nochoice');
	// 恢復篩選
	$("select#area").val('a%');
	$("select#city").val('c%');
	$("select#gradeID").val('g%');
	$("select#domain").val('t%');

	showHot = true;
	$("#jsp").load("../module/getdomain_forList.jsp",{filter:"1"},function(){
		loadHotGame(showHot);

	});
});

$('#myGame').click(function() {
	$('#myGame').attr('class', 'choice');
	$('#hotGame').attr('class', 'nochoice');

	// 恢復篩選
	$("select#area").val('a%');
	$("select#city").val('c%');
	$("select#gradeID").val('g%');
	$("select#domain").val('t%');

	// showHot = false;
	$("#jsp").load("../module/getdomain_forList.jsp",{filter:"0"},function(){
		loadGameData();

	});

});
//以下進入篩選功能
$("#area").change(function(){
	if ($('.choice').attr('id') == 'myGame') {
		showHot = false;
		loadGameData(showHot);
	}else{
		showHot = true;
		loadHotGame(showHot)
	}
	
});

$("#city").change(function(){
	if ($('.choice').attr('id') == 'myGame') {
		showHot = false;
		loadGameData(showHot);
	}else{
		showHot = true;
		loadHotGame(showHot)
	}
});
$("#gradeID").change(function(){
	if ($('.choice').attr('id') == 'myGame') {
		showHot = false;
		loadGameData(showHot);
	}else{
		showHot = true;
		loadHotGame(showHot)
	}
});
$("#domain").change(function(){
	if ($('.choice').attr('id') == 'myGame') {
		showHot = false;
		loadGameData(showHot);
	}else{
		showHot = true;
		loadHotGame(showHot)
	}
});
var orginLeft = 0;
function getLeftVaule(x){
	outsideW = $window.width();
	if ( $('header').hasClass('menuOpen') ) {
		outsideW = outsideW-240;
	}
	num=(outsideW-100)/280; 
	num=parseInt(num);//取個數，屬於第幾個

	orginLeft = ((outsideW-100)-(260*num+20*(num-1)))/2;
	return 280*x+orginLeft+50 ;
}
function getTopVaule(y){
	return 229*y+90;
}
var oldScrollTop = 0;
var outsideW;
function resize(){
	outsideW = $window.width();
	//menu width
	if ( $('header').hasClass('menuOpen') ) {
		outsideW = outsideW-240;
	}
	num=(outsideW-100)/280; 
	num=parseInt(num);//取個數，屬於第幾個
	numLength=$('.square').length;
	row=numLength/num;
	row=Math.ceil(row);//取行數，屬於第幾排

	for(i=0;i<row;i++){ 
		for(j=0;j<num;j++){
			$($('.square')[i*num+j]).attr('style','top:'+getTopVaule(i)+'px; left:'+getLeftVaule(j)+'px;');
		}
	}
}
/*畫面移動效果*/
window.onresize = function(event){	
	menuWidthIsOpen();
}
$('.pull-left').bind('touchend click',function(){
	
	menuWidthIsOpen();
});

// var oldScrollWidth;
function menuWidthIsOpen(){
	
	if ($window.width() < 1026 && $('.navbar').hasClass('menuOpen')) {
		$('.scroll').width($('.scroll').width()-240+'px');
		$('#gototop').css('right','250px');
	}else{
		$('.scroll').width('100%');
		$('#gototop').css('right','10px');
	}
	if ($('.navbar').hasClass('menuClose') && $window.width() > 360) {
		resize();
	}else if ($('.navbar').hasClass('menuOpen') && $window.width() > 600) {
		resize();
	}

}
// scroll
$('#gototop').bind('click', function () {
	$('.scroll').scrollTop(0);
});
$('.scroll').scroll(function () {
	var newScrollTop = $('.scroll').scrollTop();
	if(newScrollTop>oldScrollTop) {
		$('.itsSearchBar').css('top', '-42px');
	}
	else
	{
		$('.itsSearchBar').css('top', '0px');
	}
	oldScrollTop = newScrollTop;
	if(newScrollTop >= 10){
		$('#gototop').show();
	}
	else if(newScrollTop < 10){
		$('#gototop').hide();
	}
});
</script>
</html>