<script type="text/javascript" src="../js/jquery.min.js" ></script>
<script type="text/javascript" src="../js/jquery.cookie.js" ></script>
<script>
var GET_LRS_TYPEFLAG=true;//true-透過sql查詢所屬key;false-透過字串
var GET_LRS_ENDPOINT='http://140.92.88.147:80/visca/TCAPI/';
var GET_LRS_USER;
var GET_LRS_PASSWORD;
//debugger
if(!GET_LRS_TYPEFLAG){
	GET_LRS_USER='7E1838AE5B0697803CD7';
	GET_LRS_PASSWORD='77F2C14BE7AF175557A7';
	sessionStorage.setItem('xapilrsconfig',GET_LRS_USER+','+GET_LRS_PASSWORD);
}
else{
	if(sessionStorage.getItem('xapilrsconfig')!=null){
		GET_LRS_USER=sessionStorage.getItem('xapilrsconfig').split(',')[0];
		GET_LRS_PASSWORD=sessionStorage.getItem('xapilrsconfig').split(',')[1];
	}
	else{
		//session查無資料只好再查sql抓所屬的LRS帳密
		$.ajax({
			type: 'GET',
			url:"/game/game_platform/xapi/searchData.jsp?type=getLRSAccount"
			//tempchkAuth.jsp?stat=userprofile
		}).done(function(result){
			GET_LRS_USER=result.trim().split(',')[0];
			GET_LRS_PASSWORD=result.trim().split(',')[1];
			//將value塞入session內
			sessionStorage.setItem('xapilrsconfig',GET_LRS_USER+','+GET_LRS_PASSWORD);

		}).error(function(result){
			GET_LRS_USER="7E1838AE5B0697803CD7";
			GET_LRS_PASSWORD="77F2C14BE7AF175557A7";
			//將value塞入session內
			sessionStorage.setItem('xapilrsconfig',GET_LRS_USER+','+GET_LRS_PASSWORD);
		});

	}
}	
//VisCa
//var GET_LRS_ENDPOINT='http://140.92.88.147:80/visca/TCAPI/';
//var GET_LRS_USER='DF392858C33FA774769B';
//var GET_LRS_PASSWORD='C89C34E538962FF76AF8';


//Irene的測試帳號/密碼
//DF392858C33FA774769B/C89C34E538962FF76AF8
// var GET_LRS_ENDPOINT='http://140.92.88.147/mLRSTest/TCAPI/';
// var GET_LRS_USER='DF392858C33FA774769B';
// var GET_LRS_PASSWORD='C89C34E538962FF76AF8';
</script>