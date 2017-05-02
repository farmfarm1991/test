<%@ page import="java.sql.SQLException" %>
<%@ page import="flex.dao.DBManger" %>
<%@ page import="flex.dao.DBUtils" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
String type = request.getParameter("type");
String returnStr = "";

try {
	if(type.equals("updateClass")) {
		String classID = request.getParameter("classID");
		String className = request.getParameter("className");
		String sYear = request.getParameter("sYear");
		String sOrder = request.getParameter("sOrder");
		String sGradeID = request.getParameter("sGradeID");

		returnStr = classID+"*"+className+"*"+sYear+"*"+sOrder+"*"+sGradeID;

		flex.ro.AccountService as = new flex.ro.AccountService();
		flex.object.nadmin.ClassProfile cp = new flex.object.nadmin.ClassProfile();
		cp.setClassID(classID);
		cp.setClassName(className);
		cp.setsYear(sYear);
		cp.setsOrder(sOrder);
		cp.setGradeID(sGradeID);

		as.updateClass2(classID, cp);
	}
	else if(type.equals("updateUser")){
		String userName = request.getParameter("userName");
		String userPassword = request.getParameter("userPassword");
		String userEmail = request.getParameter("userEmail");
		String userId = request.getParameter("userId");
		String userSchoolId = request.getParameter("userSchoolId");

		returnStr = userName+"*"+userPassword+"*"+userEmail+"*"+userId;

		String SQL_updateUaerInfo = "update user set userName=?, userPwd=?, email=? where userID=?";

		DBManger db = DBUtils.getDBManger();
		Connection conn = db.connWrite();
		try {
			PreparedStatement pStatement =  conn.prepareStatement(SQL_updateUaerInfo);
			pStatement.setString(1, userName);
			pStatement.setString(2, userPassword);
			pStatement.setString(3, userEmail);
			pStatement.setString(4, userSchoolId+"-"+userId);
			pStatement.executeUpdate();
			pStatement.close();

		}
		catch (SQLException e){
			e.printStackTrace();
		}
	}
}
catch (Exception e){
	e.printStackTrace();
}

%>
<%=returnStr%>