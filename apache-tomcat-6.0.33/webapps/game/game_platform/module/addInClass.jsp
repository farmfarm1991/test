<%@ page import="java.lang.Integer" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="flex.dao.DBManger" %>
<%@ page import="flex.dao.DBUtils" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
String userID = request.getParameter("userID");
String classID = request.getParameter("classID");
String returnResult = "";
String SQL_get_full_domain = "insert into user_class (userID, classID) "+
							 "values(?, ?) ";
try {
	DBManger db = DBUtils.getDBManger();
	Connection conn = db.connWrite();
	PreparedStatement pStatement = conn.prepareStatement(SQL_get_full_domain);
	pStatement.setString(1, userID);
	pStatement.setString(2, classID);
	pStatement.executeUpdate();
	System.out.println("DATA: "+userID+classID);
	pStatement.close();
} catch (SQLException e) {
	e.printStackTrace();
}
%>