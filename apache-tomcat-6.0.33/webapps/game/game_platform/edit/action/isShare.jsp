<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="flex.dao.DBManger" %>
<%@ page import="flex.dao.DBUtils" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,java.text.SimpleDateFormat" %>
<%

	String gameID = request.getParameter("gameid");
	String userID = request.getParameter("userID");
	String type = request.getParameter("type");


	String isShare = request.getParameter("isShare");
	//取得現在日期時間
	Calendar calendar = Calendar.getInstance();
	Date Now = calendar.getTime();
	//設定轉換文字的格式
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd' 'HH:mm:ss.SS");
	//日期轉成字串
	String dateTime = simpleDateFormat.format(Now);
	
	DBManger db = DBUtils.getDBManger();
	Connection conn = db.connWrite();
	Connection connR = db.connRead();
	String resultStr = "";
	if (type.equals("setShare")) {
		System.out.println("enter");
		int shareNum = Integer.parseInt(isShare);
		String SQL_isShare = "update game_basicinfo set isShare =?, shareTime=? where gameID=?";
		String SQL_select_notmygame = "select count(*) from game_basicinfo where gameID = ? && gameOldID is null";
		String SQL_select_userIDpointdetail = "select count(*) from game_point_detail where userID = ? && item='share'";
		String SQL_select_gameIDpointdetail = "select count(*) from game_point_detail where gameID = ? && item='share'";
		String SQL_updatepoint = "update user set score = score+50 where userID = ?";
		String SQL_insert_pointdetail = "insert into game_point_detail values('share',?,50,?,now())";

		try {
		 	PreparedStatement pStatement1 = conn.prepareStatement(SQL_isShare);
		 	pStatement1.setInt(1,shareNum);
		 	pStatement1.setString(2,dateTime);
		 	pStatement1.setString(3,gameID);
		 	pStatement1.executeUpdate();
			System.out.println("sharepoint count: "+shareNum);

		 	/*if(shareNum==1){
			 	pStatement1 = conn.prepareStatement(SQL_select_notmygame);
			 	pStatement1.setString(1,gameID);
			 	ResultSet rs = pStatement1.executeQuery();
				while(rs.next()){
				 	int num = rs.getInt("count(*)");
				 	if(num==1){
					 	pStatement1 = conn.prepareStatement(SQL_select_userIDpointdetail);
					 	pStatement1.setString(1,userID);
					 	rs = pStatement1.executeQuery();
						while(rs.next()){
					 		num = rs.getInt("count(*)");
					 		if(num<5){
					 			pStatement1 = conn.prepareStatement(SQL_select_gameIDpointdetail);
							 	pStatement1.setString(1,gameID);
							 	rs = pStatement1.executeQuery();
							 	while(rs.next()){
							 		num = rs.getInt("count(*)");
							 		if(num==0){
							 			pStatement1 = conn.prepareStatement(SQL_updatepoint);
					 					pStatement1.setString(1,userID);
			 							pStatement1.executeUpdate();

							 			pStatement1 = conn.prepareStatement(SQL_insert_pointdetail);
					 					pStatement1.setString(1,userID);
							 			pStatement1.setString(2,gameID);
			 							pStatement1.executeUpdate();
			 							resultStr = "sharepoint";
							 		}
							 	}
					 		}
					 	}
				 	}
			 	}
		 	}*/
		 	pStatement1.close();
			} catch (SQLException e) {
			 	System.out.println(e.getMessage());
			}
	
	}
%><%=resultStr%>