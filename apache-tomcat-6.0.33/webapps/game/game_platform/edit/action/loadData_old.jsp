<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="flex.dao.DBManger" %>
<%@ page import="flex.dao.DBUtils" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
	String userName = request.getParameter("userName");
	String gtype = request.getParameter("gtype");
	String schoolID = request.getParameter("schoolID");
	System.out.println("!!!!!!!!"+schoolID);
	String planFlag = request.getParameter("planFlag");
	int flag = Integer.parseInt(planFlag);

	DBManger db = DBUtils.getDBManger();
	Connection conn = db.connWrite();
	Connection connR = db.connRead();

	String output ="";
	if (flag == 0) {
		System.out.println("\n"+userName+":"+gtype);
		String SQL_select_easyGameEdit = "select * from game_basicinfo left join game_class on game_basicinfo.gameID = game_class.gameID where creator=? && gtype=? order by updateTime desc";
		try {
		 	PreparedStatement pStatement = conn.prepareStatement(SQL_select_easyGameEdit);
		 	pStatement.setString(1,userName);
		 	pStatement.setString(2,gtype);
		 	
		 	ResultSet rs = pStatement.executeQuery();
			while(rs.next()){
		 		String gameID = rs.getString("gameID");
		 		String gameName = rs.getString("gameName");
		 		String unitID = rs.getString("unitID");
		 		String creator = rs.getString("creator");
		 		String imgPath = rs.getString("imgPath");
		 		String playURL = rs.getString("playURL");
		 		String isShare = rs.getString("isShare");
		 		String time = rs.getString("updateTime");
		 		String gid = rs.getString("classID");
		 		String creatorName = rs.getString("creatorName");
		 		String schoolYear = rs.getString("schoolYear");
		 		String semester = rs.getString("semester");
		 		String subject = rs.getString("subject");
		 		String grade = rs.getString("grade");
		 		String area = rs.getString("area");
		 		String counties = rs.getString("counties");

		 		output = output+"@Data||"+gameID+"|||"+gameName+"|||"+unitID+"|||"+creator+"|||"+imgPath+"|||"+playURL+"|||"+isShare+"|||"+time+"|||"+gid+"|||"+creatorName+"|||"+schoolYear+"|||"+semester+"學期|||"+subject+"|||"+grade+"|||"+area+"|||"+counties;
		 		//System.out.print("!!!!!!!!!"+creatorName);
		 	}
		 	pStatement.close();
			} catch (NumberFormatException e) {
			 	System.out.println(e.getMessage());	
			} catch (SQLException e) {
			 	System.out.println(e.getMessage());
			}
		
	}else if (flag == 1) {
		System.out.println(userName+"熱門遊戲庫");
		String SQL_hotMovie = "select * from game_basicinfo where gtype=? order by shareTime desc";
		//String SQL_hotMovie = "select game_basicinfo.*, user.schoolID "+
		//						"from game_basicinfo "+
		//						"left join user "+
		//						"on game_basicinfo.creator = user.userID "+
		//						"where schoolID=? && gtype=? order by updateTime desc";
		try {
		 	PreparedStatement pStatement = conn.prepareStatement(SQL_hotMovie);
		 	//pStatement.setString(1,schoolID);
		 	pStatement.setString(1,gtype);

		 	ResultSet rs = pStatement.executeQuery();
			while(rs.next()){
		 		String gameID = rs.getString("gameID");
		 		String gameName = rs.getString("gameName");
		 		String unitID = rs.getString("unitID");
		 		String creator = rs.getString("creator");
		 		String imgPath = rs.getString("imgPath");
		 		String playURL = rs.getString("playURL");
		 		String isShare = rs.getString("isShare");
		 		String time = rs.getString("updateTime");
		 		String shareTime = rs.getString("shareTime");
		 		String creatorName = rs.getString("creatorName");
		 		String schoolYear = rs.getString("schoolYear");
		 		String semester = rs.getString("semester");
		 		String subject = rs.getString("subject");
		 		String grade = rs.getString("grade");
		 		String area = rs.getString("area");
		 		String counties = rs.getString("counties");
		 		
		 		output = output+"@Data||"+gameID+"|||"+gameName+"|||"+unitID+"|||"+creator+"|||"+imgPath+"|||"+playURL+"|||"+isShare+"|||"+time+"|||"+shareTime+"|||"+creatorName+"|||"+schoolYear+"|||"+semester+"學期|||"+subject+"|||"+grade+"|||"+area+"|||"+counties;
		 		//System.out.print("!!!!!!!!!"+output);
		 	}
		 	pStatement.close();
			} catch (NumberFormatException e) {
		//		log.error(e.getMessage(), e);
			 	System.out.println(e.getMessage());	
			} catch (SQLException e) {
		//	 	log.error(e.getMessage(), e);
			 	System.out.println(e.getMessage());
			}
	}else if(flag == 2){
		System.out.println("student!!");
		String SQL_select_easyGameEditForStu = "select game_basicinfo.*,A.classID,A.userID "
												+"from game_basicinfo "
												+"left join "
												+"(select game_class.*,userRole.userID "
												+"from game_class "
												+"left join "
												+"(select user_role.userID, user_class.classID "
												+"from user_role "
												+"left join user_class "
												+"on user_role.userID = user_class.userID "
												+"where user_role.roleID = 'student')as userRole "
												+"on game_class.classID = userRole.classID) as A "
												+"on game_basicinfo.gameID = A.gameID "
												+"where A.userID = ? && game_basicinfo.gtype = ? "
												+"order by game_basicinfo.updateTime desc";
		try {
		 	PreparedStatement pStatement = conn.prepareStatement(SQL_select_easyGameEditForStu);
		 	pStatement.setString(1,userName);
		 	pStatement.setString(2,gtype);
		 	
		 	ResultSet rs = pStatement.executeQuery();
			while(rs.next()){
		 		String gameID = rs.getString("gameID");
		 		String gameName = rs.getString("gameName");
		 		String unitID = rs.getString("unitID");
		 		String creator = rs.getString("creator");
		 		String imgPath = rs.getString("imgPath");
		 		String playURL = rs.getString("playURL");
		 		String time = rs.getString("updateTime");
		 		String creatorName = rs.getString("creatorName");
		 		String schoolYear = rs.getString("schoolYear");
		 		String semester = rs.getString("semester");
		 		String subject = rs.getString("subject");
		 		String grade = rs.getString("grade");
		 		String area = rs.getString("area");
		 		String counties = rs.getString("counties");

		 		output = output+"@Data||"+gameID+"|||"+gameName+"|||"+unitID+"|||"+creator+"|||"+imgPath+"|||"+playURL+"|||"+time+"|||"+creatorName+"|||"+schoolYear+"|||"+semester+"學期|||"+subject+"|||"+grade+"|||"+area+"|||"+counties;
		 		//System.out.print("!!!!!!!!!"+output);
		 	}
		 	pStatement.close();
			} catch (NumberFormatException e) {
			 	System.out.println(e.getMessage());	
			} catch (SQLException e) {
			 	System.out.println(e.getMessage());
			}
												
	}
%><%=output%>