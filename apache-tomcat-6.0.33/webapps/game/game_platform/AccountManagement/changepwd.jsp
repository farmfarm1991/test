<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.math.BigInteger" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="flex.dao.DBManger" %>
<%@ page import="flex.dao.DBUtils" %>
<%
flex.object.nadmin.User auth = (flex.object.nadmin.User)session.getAttribute("user");
flex.object.nadmin.SchoolProfile schoolProfile = auth.getLoginSchool();
String schoolID = schoolProfile.getSchoolID();

String userPwd = auth.getUserPwd();
System.out.println(" old PW is: "+userPwd);
MessageDigest md = MessageDigest.getInstance("MD5");
byte[] barr = md.digest(userPwd.getBytes());
BigInteger number = new BigInteger(1, barr);
String hashtext = number.toString(16);
while(hashtext.length()<32){
	hashtext="0"+hashtext;
}
String oldPwd_withMD5 = request.getParameter("opwdmd5");
String newPwd = request.getParameter("npwd");
int checkOK = 0;
if(oldPwd_withMD5.isEmpty() || newPwd.isEmpty()) {
	//給予的值有誤
	System.out.println("input val error");
}
else if(oldPwd_withMD5.equals(hashtext)){
	//傳遞進來的密碼與使用者密碼相同
	//檢查新密碼是否符合
	if(newPwd.length()>20){
		//密碼過長
	}
	else if(!newPwd.matches("[a-zA-Z0-9]+")){
		//密碼字元並非只有英文數字
	}
	else {
		//通過檢查，開始更改密碼
		String userID = auth.getUserID();
		System.out.println(userID+" ready to change PW: "+newPwd);

		String SQL_updatePwd =
			 "UPDATE user SET user.userPwd = ? WHERE  userID = ? LIMIT 1;";
		try {
			DBManger db = DBUtils.getDBManger();
			Connection conn = db.connWrite();
			PreparedStatement pStatement = conn.prepareStatement(SQL_updatePwd);
			pStatement.setString(1, newPwd);
			pStatement.setString(2, userID);
			pStatement.executeUpdate();
			pStatement.close();

			auth.setUserPwd(newPwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}


		checkOK = 1;
	}
}
else {
	System.out.println("oldPwd_withMD5 is "+oldPwd_withMD5);
	System.out.println("hashtext is "+hashtext);
}
%>
<%=checkOK%>