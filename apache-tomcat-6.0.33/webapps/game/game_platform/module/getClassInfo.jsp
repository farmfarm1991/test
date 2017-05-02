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
String returnResult = "";
System.out.print("userID: "+userID);
String SQL_get_full_domain = "select user_class.userID,user_class.classID,groupinfo.* "+
							 "from user_class "+
							 "left join groupinfo "+
							 "on user_class.classID=groupinfo.gID "+
							 "where userID = ? ";
try {
	DBManger db = DBUtils.getDBManger();
	Connection conn = db.connWrite();
	PreparedStatement pStatement = conn.prepareStatement(SQL_get_full_domain);
	pStatement.setString(1, userID);
	ResultSet rs = pStatement.executeQuery();
	while(rs.next()){
		String classID = rs.getString("classID");
		String gradeID = rs.getString("gradeID");
		String gName = rs.getString("gName");
		String sYear = rs.getString("sYear");
		returnResult=returnResult+"@Data||"+classID+"|||"+gradeID+"|||"+gName+"|||"+sYear;
		System.out.println("returnResult: "+returnResult);	
	}
	pStatement.close();
} catch (SQLException e) {
	e.printStackTrace();
}
%>
<%=returnResult%>