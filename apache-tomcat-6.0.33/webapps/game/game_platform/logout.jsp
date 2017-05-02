<%@ include file = "tin.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>   
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="flex.dao.DBManger" %>
<%@ page import="flex.dao.DBUtils" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%
Calendar cal = Calendar.getInstance();
// String login_time = (String)session.getAttribute("loginTime");
//System.out.println("@@@@@ cal "+cal);
// 取得現在時間
Date date = new Date();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
SimpleDateFormat sdf2=new SimpleDateFormat("HH:mm:ss");
// 取得user ID
String user_name = "";
flex.object.nadmin.User auth = (flex.object.nadmin.User)session.getAttribute("user");
if(auth != null){
	user_name = auth.getUserID();
	String source_type = (String)session.getAttribute("source_type");
	String login_time = (String)session.getAttribute("loginTime");
	String school_id = (String)session.getAttribute("school_id");
	String[] account = user_name.split("-");
	for (int i = 1; i < account.length; i++){
		System.out.println(account[i]);
		user_name = account[i];
	}
	
	// 計算登入/登出時間差
	Date loginTime = sdf.parse(login_time);
	long gap = (date.getTime()-loginTime.getTime())/1000;
	int gapTime = (int)gap;
	// set 型態為int
	cal.set(0,0,0,0,0,gapTime);
	// System.out.println("!!!!!!!!!!!!!!!!!!gap: "+gap+" "+gapTime+" "+sdf2.format(cal.getTime()));

	//抓使用者IP，for登入錯誤記錄用
	String ipAddress = request.getHeader("X-FORWARDED-FOR");  
	if (ipAddress == null) {  
		ipAddress = request.getRemoteAddr();  
	}
	// System.out.println("!!!!!!!!!!!!!!!!!!data: "+school_id+" "+ user_name+" "+ipAddress);

	String SQL_choiceQid  = "INSERT INTO login_fail_record (`schoolID`, `userID`, `login_stat`, `enter_time`, `enter_IP`, `timeGap`) VALUES ('"+school_id+"', '"+user_name+"', 'logout', '"+sdf.format(date)+"', '"+ipAddress+"','"+sdf2.format(cal.getTime())+"')";
	try {
			DBManger db = DBUtils.getDBManger();
			Connection conn = db.connWrite();
			PreparedStatement pStatement = conn.prepareStatement(SQL_choiceQid);

			pStatement.executeUpdate();
			pStatement.close();
		} catch (NumberFormatException e) {
			System.out.println(e.getMessage());	
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	source_type = source_type+"x";

}
// System.out.println("ssssssssssssssssssss user_name "+user_name); 





session.setAttribute("user", null);
session.setAttribute("type", null);
String s = request.getParameter("s");
if(s==null)
	s="x";
// xapi need data
String type = request.getParameter("type");
String source = request.getParameter("source");
System.out.println("@@@@@ logout "+type+", "+source);

// String preURL = request.getRequestURL().toString();
// System.out.print(preURL);
// preURL = preURL.substring(0,preURL.lastIndexOf("/game/")+6)+"/game_platform/";

if(s.equals("tainanSchool")) {
	//response.sendRedirect(pURL+"login.html");
}
else{
%>
<script>
console.log("<%=user_name%>");
if ("<%=user_name%>" != "") {
	var xapiData = {};
	var objectSource = "<%=source%>";
	var objType = "<%=type%>";
	var objTime = "<%=sdf2.format(cal.getTime())%>";
	xapiData.objType = objType
	xapiData.objectSource = objectSource;
	xapiData.verb = "Log Out";
	xapiData.objTime = objTime;
	xAPIinit(xapiData);
}else{
	location.replace("login.html");
}

</script>
<%
	//response.sendRedirect(preURL);
}
%>