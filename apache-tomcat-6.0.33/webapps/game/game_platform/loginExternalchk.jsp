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
// Calendar calendar = Calendar.getInstance();
// Date Now = calendar.getTime();
// //設定轉換文字的格式
// SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd' 'HH:mm:ss.SS");
// //日期轉成字串
// String dateTime = simpleDateFormat.format(Now);

Date date = new Date();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

String exUserName = request.getParameter("exUserName");
String exUserEmail = request.getParameter("exUserEmail");
String exUserPic = "";
exUserPic = request.getParameter("exUserPic");
if(exUserPic==null){
	exUserPic="../images/menu/woman.png";
}
String exUserID = request.getParameter("exUserID");
String source_type=null;
String user_id = "";
String user_name = "";
System.out.println("exUserName: "+exUserName+" exUserEmail: "+exUserEmail+" exUserPic: "+exUserPic);
String school_id = "";
school_id = request.getParameter("school_id");
System.out.println("school_id!!!!!!!! "+school_id);
String data_line = "";
String type = "openid";
String inviteCode = "";
String mal = "female";
String mainRoleID = request.getParameter("mainRoleID");
String schoolName = request.getParameter("schoolName");
if(exUserID != null && (exUserEmail.equals("")|| exUserEmail.equals("NA"))){
	exUserEmail = exUserID.substring(0,16)+"@erroremail.com";
}

DBManger db = DBUtils.getDBManger();
Connection conn = db.connWrite();
String resultStr = "123";
	//搜尋在user表中是否存在該帳號
	String sql_searchUser_in_user
				= "Select * from user where email=?";
	//加入新帳號到user表
	String sql_createUser
				= "insert into user(userID, accountID, userName, userPwd, email, schoolID, mainRoleID, type, freeTime, identity_picture_path, endTime, checkTime, inviteCode) values(?, ?, ?, ?, ?, ?, ?, ?, now(), ?, ?, ?, ?)";
	//加入帳號角色關聯進入user_role表
	String sql_createUser_role
				= "insert into user_role(schoolID, roleID, userID) values(?, ?, ?)";
	String sql_createUser_inviteCode
				= "insert into game_invitecode(inviteCode, userID, inviteName) values(?, ?, ?)";
	String sql_createUser_school
				= "insert into school(schoolID, schoolName) values(?, ?)";
	String sql_createUser_school_grade_map
				= "insert into school_grade_map values(?, ?, ?)";
	String sql_createUser_checkschool
				= "select count(*) from school where schoolID = ?";
	try{
		PreparedStatement pStatement = conn.prepareStatement(sql_searchUser_in_user);
		
		pStatement.setString(1, exUserEmail);

		ResultSet rs = pStatement.executeQuery();
		int foundit = 0;
		while(rs.next()) {
			user_id = rs.getString("userID");
			user_name = rs.getString("userName");
			inviteCode = rs.getString("inviteCode");
			String schoolid = rs.getString("schoolID");
			String freeTime = rs.getString("freeTime");
			String pwd = rs.getString("userPwd");
			mal = rs.getString("mal");
			type = rs.getString("type");
			Date beginTime = sdf.parse(freeTime);
			long day = (date.getTime()-beginTime.getTime())/(24*60*60*1000);
			String edate = sdf.format((beginTime.getTime()+7*24*60*60*1000));
			String[] dataArray = edate.split(" ");
			data_line = dataArray[0];
			System.out.println("day!!!!!!!! "+day);
			if(day<0){
				resultStr = "dayline";
				school_id = "";
			}
			System.out.println("type123123132!!!"+type);
			if(!type.equals("openid") || (!school_id.equals(schoolid) && !schoolid.equals("EXTERNAL")) || (schoolid.equals("EXTERNAL") && !pwd.equals(exUserID))){
				System.out.println("schoolid!!!!!!!! "+!school_id.equals(schoolid));
				System.out.println("type!!!!!!!! "+type);

				resultStr = "E009";
				school_id = "";
			}else{
				school_id = schoolid;
			}
			//年底改回openid
			if(user_id.equals("114692-yilinteacher@tn.edu.tw") || user_id.equals("114677-hsiumei@tn.edu.tw") || user_id.equals("094628-kentxchang@gmail.com") || user_id.equals("080000-hsuliang@gmail.com")){
				type = "money";
			}
			System.out.println("type123123132!!!"+type);
			foundit = 1;
		}

		pStatement.close();
		System.out.println("foundit :"+foundit);
		
		if(foundit == 0 ){
			pStatement = conn.prepareStatement(sql_createUser);
			//(userID, userName, email, schoolID, mainRoleID)
			pStatement.setString(1, school_id+"-"+exUserEmail);
			pStatement.setString(2, exUserEmail);
			pStatement.setString(3, exUserName);
			pStatement.setString(4, exUserID);
			pStatement.setString(5, exUserEmail);
			pStatement.setString(6, school_id);
			pStatement.setString(7, mainRoleID);
			pStatement.setString(8, "openid");
			pStatement.setString(9, exUserPic);
			String edate = sdf.format((date.getTime()+7*24*60*60*1000));
			pStatement.setString(10, edate);
			String cdate = sdf.format((date.getTime()-24*60*60*1000));
			pStatement.setString(11, cdate);
			//亂數
			int[] word = new int[8];
			int mod;
			for(int i = 0; i < 5; i++){
				mod = (int)((Math.random()*7)%2);
				if(mod ==1){ //數字
					word[i]=(int)((Math.random()*10) + 48);
				}else{ //大寫英文
					word[i] = (char)((Math.random()*26) + 65);
				}
			}
			StringBuffer newPassword = new StringBuffer();
			for(int j = 0; j < 5; j++){
				newPassword.append((char)word[j]);
			}
			System.out.println("newPassword: "+newPassword);
			inviteCode = newPassword.toString();
			pStatement.setString(12, inviteCode);

			pStatement.executeUpdate();

			String[] dataArray = edate.split(" ");
			data_line = dataArray[0];
			//完成加入user

			pStatement = conn.prepareStatement(sql_createUser_role);
			//(schoolID, roleID, userID)
			pStatement.setString(1, school_id);
			pStatement.setString(2, mainRoleID);
			pStatement.setString(3, school_id+"-"+exUserEmail);

			pStatement.executeUpdate();
			//完成加入user_role

			pStatement = conn.prepareStatement(sql_createUser_inviteCode);
			pStatement.setString(1, inviteCode);
			pStatement.setString(2, school_id+"-"+exUserEmail);
			pStatement.setString(3, exUserName);
			pStatement.executeUpdate();
			if(!school_id.equals("EXTERNAL")){			
				pStatement = conn.prepareStatement(sql_createUser_checkschool);
				pStatement.setString(1, school_id);
				rs = pStatement.executeQuery();
				while(rs.next()){
				 	int num = rs.getInt("count(*)");
				 	if(num == 0){
				 		pStatement = conn.prepareStatement(sql_createUser_school);
						pStatement.setString(1, school_id);
						pStatement.setString(2, schoolName);
						pStatement.executeUpdate();

						pStatement = conn.prepareStatement(sql_createUser_school_grade_map);
						pStatement.setInt(1, 0);
						pStatement.setString(2, school_id);
						pStatement.setString(3, "國小");
						pStatement.executeUpdate();

						pStatement = conn.prepareStatement(sql_createUser_school_grade_map);
						pStatement.setInt(1, 1);
						pStatement.setString(2, school_id);
						pStatement.setString(3, "國中");
						pStatement.executeUpdate();

						pStatement = conn.prepareStatement(sql_createUser_school_grade_map);
						pStatement.setInt(1, 2);
						pStatement.setString(2, school_id);
						pStatement.setString(3, "高中");
						pStatement.executeUpdate();

						pStatement = conn.prepareStatement(sql_createUser_school_grade_map);
						pStatement.setInt(1, 3);
						pStatement.setString(2, school_id);
						pStatement.setString(3, "高職");
						pStatement.executeUpdate();

						pStatement = conn.prepareStatement(sql_createUser_school_grade_map);
						pStatement.setInt(1, 4);
						pStatement.setString(2, school_id);
						pStatement.setString(3, "其他");
						pStatement.executeUpdate();
				 	}
			 	}
			}
		}
	}catch(Exception e) {
		System.out.println("ohoh");
		System.out.println(e);
	}

	flex.object.nadmin.User user = new flex.object.nadmin.User();
	user.setUserID(school_id+"-"+exUserEmail);
	user.setUserPwd(exUserID);

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

		System.out.println("u: "+u);
		String SQL_choiceQid;
		//String gotoPage = "index.jsp";
		if(u==null){
			school_id = "EXTERNAL";
			//如果登入失敗，要送紀錄給DB
			SQL_choiceQid  = "INSERT INTO login_fail_record(schoolID, userID, login_stat, enter_password, enter_time, enter_IP) "+
			"VALUES ('"+school_id+"', '"+exUserEmail+"', 'false', '"+exUserID+"', '"+sdf.format(date)+"', '"+ipAddress+"') ";
			
			gotoPage = "error.jsp?eid=authError";
		}else{
			//如果登入成功，要送紀錄給DB
			SQL_choiceQid  = "INSERT INTO login_fail_record(schoolID, userID, login_stat, enter_password, enter_time, enter_IP) "+
			"VALUES ('"+school_id+"', '"+exUserEmail+"', 'true', '"+exUserID+"', '"+sdf.format(date)+"', '"+ipAddress+"') ";
			
			if(u.getMainRoleID().equals("eduAdmin")) {
				gotoPage = "choice.jsp";
			}
			else if(!u.getMainRoleID().equals("student") && !u.getMainRoleID().equals("teacher") && !u.getMainRoleID().equals("external")){
				gotoPage = "error.jsp?eid=roleError";
			}
		}
		//連接資料庫，將登入stat記錄到DB
		try {
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
		session.setAttribute("school_name", schoolName);
		session.setAttribute("role_name", roleName);
		session.setAttribute("img_path", exUserPic);
		session.setAttribute("user_email", exUserEmail);
		session.setAttribute("date_line", data_line);
		session.setAttribute("type", type);
		session.setAttribute("inviteCode", inviteCode);
		session.setAttribute("loginTime", sdf.format(date));
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
	System.out.println(preURL);
	preURL = preURL.substring(0,preURL.lastIndexOf("/game_platform/")+15);
	//response.sendRedirect(preURL+gotoPage);
%>
<%=resultStr%>
