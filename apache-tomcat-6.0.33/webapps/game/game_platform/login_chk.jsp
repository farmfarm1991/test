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
<%@ page import="javax.servlet.http.Cookie" %>
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
String img_path = "";
String type = "";
String inviteCode = "";
String mal = "female";
String guid = "";

DBManger db = DBUtils.getDBManger();
Connection conn = db.connWrite();

String SQL_select_school = "select * from user left join user_auto_login on user_auto_login.userID = user.accountID where accountID = ? ";
String SQL_update_userType = "update user set type = ? where userID = ? ";
String SQL_insert_user_auto_login = "INSERT INTO `user_auto_login` (userID, GUID, endTime, enter_IP) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE endTime = ? ";
String SQL_select_user_auto_login = "select * from `user_auto_login` where GUID = ? ";

//String SQL_insert_user_auto_login = "INSERT INTO `igcs`.`user_auto_login` (`userID`, `GUID`) VALUES (?, ?); ";
try {
 	PreparedStatement pStatement = conn.prepareStatement(SQL_select_school);
 	pStatement.setString(1,user_id);
 	Cookie cookies[] = request.getCookies();

 	ResultSet rs = pStatement.executeQuery();
 	System.out.println("enter");
	while(rs.next()){
		if (cookies!=null){
			for(int i=0;i<cookies.length;i++ ){
				String cookieName = "guid";
				Cookie cookie = cookies[i];
				String edate = sdf.format((date.getTime()+7*24*60*60*1000));
				String enter_ip = "";
				String end_Time = "";
				if (cookieName.equals(cookie.getName())){
					//System.out.println("ininininininininininin"+cookie.getValue());
					PreparedStatement pStatement1 = conn.prepareStatement(SQL_select_user_auto_login);
 					pStatement1.setString(1,cookie.getValue());
 					ResultSet rs1 = pStatement1.executeQuery();
 					while(rs1.next()){
	 					enter_ip = rs1.getString("enter_IP");
	 					end_Time = rs1.getString("endTime");
 					}
 					pStatement1.close();
					if(user_pwd.equals(rs.getString("userPwd"))){//第一次記住我
						PreparedStatement pStatement2 = conn.prepareStatement(SQL_insert_user_auto_login);
					 	pStatement2.setString(1,user_id);
					 	pStatement2.setString(2,cookie.getValue());
					 	pStatement2.setString(3,edate);
					 	pStatement2.setString(4,ipAddress);
					 	pStatement2.setString(5,edate);
					 	pStatement2.executeUpdate();
						pStatement2.close();
					}else if(user_pwd.equals(cookie.getValue()) && ipAddress.equals(enter_ip) && sdf.parse(end_Time).after(date)){
						user_pwd = rs.getString("userPwd");
						PreparedStatement pStatement2 = conn.prepareStatement(SQL_insert_user_auto_login);
						pStatement2.setString(1,user_id);
					 	pStatement2.setString(2,cookie.getValue());
					 	pStatement2.setString(3,edate);
					 	pStatement2.setString(4,ipAddress);
					 	pStatement2.setString(5,edate);
					 	pStatement2.executeUpdate();
						pStatement2.close();
					}
				}
			}
		}
		user_email = rs.getString("email");
		//if(!rs.getString("type").equals("openid")){
 		school_id = rs.getString("schoolID");
 		endTime = rs.getString("endTime");
 		img_path = rs.getString("identity_picture_path");
 		type = rs.getString("type");
 		inviteCode = rs.getString("inviteCode");
 		mal = rs.getString("mal");
 		System.out.println("!!!!!!!!!!!!!!!!!!mal: "+mal);
 		String userPwd = rs.getString("userPwd");
 		Date end_Time = sdf.parse(endTime);
 		long s = date.getTime()-end_Time.getTime();
 		if(s>0){
 			//resultStr = "dayline";
			//school_id = "";
			// 付費期限到期轉為免費帳號
			if (!type.equals("free") && !type.equals("openid")){
				type = "free";
				try{
 					PreparedStatement pStatement2 = conn.prepareStatement(SQL_update_userType);
 					pStatement2.setString(1,type);
 					pStatement2.setString(2,school_id+"-"+user_id);
					pStatement2.executeUpdate();

					pStatement2.close();
				} catch (SQLException e) {
				 	System.out.println(e.getMessage());
				}
			}
			if(school_id.equals("TEST")){
				resultStr = "dayline";
				school_id = "";
			}
 		}
 		if(!userPwd.equals(user_pwd)){
			resultStr = "pwderror";
		}
 		//}
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
			}else if(resultStr == "pwderror"){
				gotoPage = "error.jsp?eid=pwderror";
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
		session.setAttribute("img_path", img_path);
		session.setAttribute("user_email", user_email);
		session.setAttribute("date_line", endTime);
		session.setAttribute("loginTime", sdf.format(date));
		session.setAttribute("type", type);
		session.setAttribute("inviteCode", inviteCode);
		session.setAttribute("mal", mal);
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