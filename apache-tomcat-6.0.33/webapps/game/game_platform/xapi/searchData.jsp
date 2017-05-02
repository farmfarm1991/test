<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.UUID" %>
<%@ page import="flex.dao.DBManger" %>
<%@ page import="flex.dao.DBUtils" %> 
<%@ page contentType="text/html;charset=UTF-8" %>
<%
String type = request.getParameter("type");
String xapiGetKey="";
int xapiCount=0;
if(type.equals("getLRSAccount")){
	String SQL_getLRSKey = "select xapi_lrsconfig.acount,xapi_lrsconfig.pw from xapi_lrsconfig "+
							"where xapi_lrsconfig.serverIP like ? ";
	try {
		DBManger db = DBUtils.getDBManger();
		Connection conn = db.connWrite();
		PreparedStatement pStatement = conn.prepareStatement(SQL_getLRSKey);

		String url=request.getRequestURL().toString();
		String serverIP;
		url = url.substring(url.indexOf("//")+"//".length());
		if(url.indexOf(":")!=-1){	
			//System.out.println("serverIP~~~~~~~~~~//~~~~"+url.substring(0,url.indexOf(":")));
			serverIP=url.substring(0,url.indexOf(":"));
		}
		else{
			//System.out.println("serverIP~~~~~~~~~~//~~~~"+url.substring(0,url.indexOf("/")));
			serverIP=url.substring(0,url.indexOf("/"));
		}
		pStatement.setString(1,"%"+serverIP+"%"); 
		ResultSet rs = pStatement.executeQuery();
		while(rs.next()){
			String acount = rs.getString("acount");
			String pw = rs.getString("pw");
			xapiGetKey = acount+","+pw;
			xapiCount++;
		}
		pStatement.close();
		if(xapiCount==0){
			xapiGetKey="7E1838AE5B0697803CD7"+","+"77F2C14BE7AF175557A7";
		}
	} catch (NumberFormatException e) {
		System.out.println(e.getMessage());	
	} catch (SQLException e) {
		System.out.println(e.getMessage());
	}
}
%>
<%=xapiGetKey%>