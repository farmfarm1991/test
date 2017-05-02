<%@ page contentType="text/html;charset=UTF-8" %>   
<%@ page import="java.net.*" %>
<%@ page import="java.util.*" %>
<%@ page import="flex.object.nadmin.User" %>
<%@ page import="flex.ro.AccountService" %>
<%@ page import="java.Exception.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="flex.dao.DBManger" %>
<%@ page import="flex.dao.DBUtils" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
//抓使用者IP，for登入錯誤記錄用
String ipAddress = request.getHeader("X-FORWARDED-FOR");  
if (ipAddress == null) {  
	ipAddress = request.getRemoteAddr();  
}
Date date = new Date();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

// String school_id = request.getParameter("schoolSelect");	
String user_id = request.getParameter("user_id");
String user_name = request.getParameter("user_name");
String user_pwd = request.getParameter("user_pwd");
String school_name = request.getParameter("school_name");
String source_type = request.getParameter("source_type");
String user_email = "";
String school_id = "";
String resultStr = "123";
String endTime = "";

DBManger db = DBUtils.getDBManger();
Connection conn = db.connWrite();

String SQL_select_school = "select * from user where accountID=? ";
try {
 	PreparedStatement pStatement = conn.prepareStatement(SQL_select_school);
 	pStatement.setString(1,user_id);

 	ResultSet rs = pStatement.executeQuery();
 	System.out.println("enter");
	while(rs.next()){
		user_email = rs.getString("email");
 		school_id = rs.getString("schoolID");
 		endTime = rs.getString("endTime");
 		Date end_Time = sdf.parse(endTime);
 		long s = date.getTime()-end_Time.getTime();
 		System.out.println("!!!!!!!!!!!!!!!!!!s: "+s);
 		if(s>0){
 			resultStr = "dayline";
			school_id = "";
 		}
 	}
 	pStatement.close();
	} catch (NumberFormatException e) {
	 	System.out.println(e.getMessage());	
	} catch (SQLException e) {
	 	System.out.println(e.getMessage());
	}

//else if(source_type.equals("iTS5")) {

	flex.object.nadmin.User user = new flex.object.nadmin.User();
	user.setUserID(school_id+"-"+user_id);
	user.setUserPwd(user_pwd);

	String gotoPage = "index.jsp";
	try{
		AccountService as = new AccountService();
		//flex.object.nadmin.User u = as.authenticate(school_id, user);
		flex.object.nadmin.User u = new flex.object.nadmin.User();

		if(source_type==null) {
			u = as.authenticate(school_id, user);
		}
		else if( source_type.equals("fb") ||
			source_type.equals("google") ||
			source_type.equals("ischool") ||
			source_type.equals("llanWeb") ){
			u = as.authenticateWithoutPW(school_id, user);
		}


		System.out.println("u "+u);
		String SQL_choiceQid;
		//String gotoPage = "index.jsp";
		if(u==null){
			//如果登入失敗，要送紀錄給DB
			SQL_choiceQid  = "INSERT INTO login_fail_record(schoolID, userID, login_stat, enter_password, enter_time, enter_IP) "+
			"VALUES ('"+school_id+"', '"+user_id+"', 'false', '"+user_pwd+"', '"+sdf.format(date)+"', '"+ipAddress+"') ";
			if(resultStr == "dayline"){
				gotoPage = "error.jsp?eid=dayline";
			}else{
				gotoPage = "error.jsp?eid=authError";
			}
		}else{
			//如果登入成功，要送紀錄給DB
			SQL_choiceQid  = "INSERT INTO login_fail_record(schoolID, userID, login_stat, enter_password, enter_time, enter_IP) "+
			"VALUES ('"+school_id+"', '"+user_id+"', 'true', '"+user_pwd+"', '"+sdf.format(date)+"', '"+ipAddress+"') ";
			
			if(u.getMainRoleID().equals("eduAdmin")) {
				gotoPage = "choice.jsp";
			}
			else if(!u.getMainRoleID().equals("student") && !u.getMainRoleID().equals("teacher") && !u.getMainRoleID().equals("external")){
				gotoPage = "error.jsp?eid=roleError";
			}
		}
		//連接資料庫，將登入stat記錄到DB
		try {
			//DBManger db = DBUtils.getDBManger();
			//Connection conn = db.connWrite();
			PreparedStatement pStatement = conn.prepareStatement(SQL_choiceQid);

			pStatement.executeUpdate();
			pStatement.close();
		} catch (NumberFormatException e) {
		//	log.error(e.getMessage(), e);
			System.out.println(e.getMessage());	
		} catch (SQLException e) {
		//	log.error(e.getMessage(), e);
			System.out.println(e.getMessage());
		}
		String roleName = u.getMainRoleID();
		
		application.setAttribute(u.getUserID() , session.getId());
		session.setAttribute("user", u);
		session.setAttribute("school_id", school_id);
		session.setAttribute("school_name", school_name);
		session.setAttribute("role_name", roleName);
		session.setAttribute("img_path", "");
		session.setAttribute("user_email", user_email);
		session.setAttribute("date_line", endTime);
		if( source_type.equals("fb") ||
			source_type.equals("google") ||
			source_type.equals("ischool") ||
			source_type.equals("llanWeb") ){
			session.setAttribute("source_type", source_type);
		}
	}
	catch(Exception e){}
	String preURL = request.getRequestURL().toString();
	System.out.print(preURL);
	preURL = preURL.substring(0,preURL.lastIndexOf("/game_platform/")+15);
	response.sendRedirect(preURL+gotoPage);
//}
%>
<%=resultStr%>