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
	String planFlag = request.getParameter("planFlag");
	int flag = Integer.parseInt(planFlag);
	String img_Path = request.getParameter("img_Path");
	String userID = request.getParameter("userID");
	String userCode = request.getParameter("userCode");
	String order = request.getParameter("order");
	String inputCode = request.getParameter("inputCode");
	String mal = request.getParameter("mal");

	DBManger db = DBUtils.getDBManger();
	Connection conn = db.connWrite();
	Connection connR = db.connRead();

	String output ="";
	if (flag == 0) {
		System.out.println("\n"+userName+":"+gtype);
		String SQL_select_easyGameEdit = "select * from game_basicinfo left join game_class on game_basicinfo.gameID = game_class.gameID where creator=? && gtype=? order by updateTime desc";
		String SQL_select_oldGameID = "select * from game_basicinfo where gameID = ?";
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
		 		String playNum = rs.getString("playNum");
		 		String gameOldID = rs.getString("gameOldID");
		 		String collectNum = rs.getString("collectNum");
		 		if(gameOldID != "null"){
		 		System.out.print("!!!!!!!!!gameOldID: "+gameOldID);
		 			PreparedStatement pStatement1 = conn.prepareStatement(SQL_select_oldGameID);
		 			pStatement1.setString(1,gameOldID);
		 			ResultSet rs1 = pStatement1.executeQuery();
		 			while(rs1.next()){
		 				creatorName = rs1.getString("creatorName");
		 				creator = rs1.getString("creator");
		 			}
		 			pStatement1.close();
		 		}

		 		output = output+"@Data||"+gameID+"|||"+gameName+"|||"+unitID+"|||"+creator+"|||"+imgPath+"|||"+playURL+"|||"+isShare+"|||"+time+"|||"+gid+"|||"+creatorName+"|||"+schoolYear+"|||"+semester+"學期|||"+subject+"|||"+grade+"|||"+area+"|||"+counties+"|||"+playNum+"|||"+gameOldID+"|||"+collectNum;
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
		String SQL_hotMovie = "select * from game_basicinfo where gtype=? && isShare=1 order by "+order+" desc";
		System.out.println("\n"+SQL_hotMovie);
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
		 		String playNum = rs.getString("playNum");
		 		String collectNum = rs.getString("collectNum");
		 		
		 		output = output+"@Data||"+gameID+"|||"+gameName+"|||"+unitID+"|||"+creator+"|||"+imgPath+"|||"+playURL+"|||"+isShare+"|||"+time+"|||"+shareTime+"|||"+creatorName+"|||"+schoolYear+"|||"+semester+"學期|||"+subject+"|||"+grade+"|||"+area+"|||"+counties+"|||"+playNum+"|||"+collectNum;
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
												
	}else if (flag == 3){
		String SQL_select_updateInfo = "update user "
									  +"set userName = ?, identity_picture_path = ?, mal = ? "
									  +"where userID = ?";
		try {
		 	PreparedStatement pStatement = conn.prepareStatement(SQL_select_updateInfo);
		 	pStatement.setString(1,userName);
		 	pStatement.setString(2,img_Path);
		 	pStatement.setString(3,mal);
		 	pStatement.setString(4,userID);
		 	
		 	output = "done";
		 	pStatement.executeUpdate();
		 	pStatement.close();
		} catch (NumberFormatException e) {
		 	System.out.println(e.getMessage());	
		} catch (SQLException e) {
		 	System.out.println(e.getMessage());
		}
	}else if (flag == 4) {
		// 取得遊戲製作數量
		System.out.println("gain number!!");
		String SQL_select_number = "select * from user where user.userID = ?";
		try {
		 	PreparedStatement pStatement = conn.prepareStatement(SQL_select_number);
		 	pStatement.setString(1,userName);
		 	
		 	ResultSet rs = pStatement.executeQuery();
			while(rs.next()){
		 		String easyNum = rs.getString("easyNum");
		 		String oxNum = rs.getString("oxNum");
		 		String easyCompleteNum = rs.getString("easyCNum");
		 		String oxCompleteNum = rs.getString("oxCNum");
		 		String totalNum = rs.getString("totalNum");
		 		String inviteCode = rs.getString("inviteCode");

		 		output = easyNum+"|||"+easyCompleteNum+"|||"+oxNum+"|||"+oxCompleteNum+"|||"+totalNum+"|||"+inviteCode;
		 		System.out.print("!!!!!!!!!easyCnum "+output);
	 	}
	 	pStatement.close();
		} catch (NumberFormatException e) {
		 	System.out.println(e.getMessage());	
		} catch (SQLException e) {
		 	System.out.println(e.getMessage());
		}
	}else if (flag == 5) {
		System.out.println("game number 55555555555555");
		String gameID = request.getParameter("gameID");
		String SQL_update_playNum = "update game_basicinfo set playNum = playNum+1 where gameID = ?";
		try{
			PreparedStatement pStatement = conn.prepareStatement(SQL_update_playNum);
			pStatement.setString(1,gameID);
			pStatement.executeUpdate();
		 	pStatement.close();

		 	output = "play number add OK";
		} catch (SQLException e) {
		 	System.out.println(e.getMessage());
		}
	}else if (flag == 6) {
		String SQL_select_easyGameEdit = "select user.userName, game_invitecode.* "+
										"from game_invitecode "+
										"left join user "+
										"on game_invitecode.inviteCode = user.inviteCode "+
										"where game_invitecode.userID != ? && game_invitecode.inviteCode = ?";
		try {
		 	PreparedStatement pStatement = conn.prepareStatement(SQL_select_easyGameEdit);
		 	pStatement.setString(1,userID);
		 	pStatement.setString(2,userCode);
		 	
		 	ResultSet rs = pStatement.executeQuery();
			while(rs.next()){
		 		String inviteName = rs.getString("inviteName");

		 		output = output+inviteName+"|||";
				//System.out.print("!!!!!!!!!"+creatorName);
		 	}
		 	pStatement.close();
			} catch (NumberFormatException e) {
			 	System.out.println(e.getMessage());	
			} catch (SQLException e) {
			 	System.out.println(e.getMessage());
			}	
	}else if (flag == 7) {
		String SQL_select_easyGameEdit = "select user.checkTime from user where userID = ? ";
		try {
		 	PreparedStatement pStatement = conn.prepareStatement(SQL_select_easyGameEdit);
		 	pStatement.setString(1,userID);
		 	
		 	ResultSet rs = pStatement.executeQuery();
			while(rs.next()){
		 		String checkTime = rs.getString("checkTime");

		 		output = checkTime;
		 		//System.out.print("!!!!!!!!!"+output);
		 	}
		 	pStatement.close();
			} catch (NumberFormatException e) {
			 	System.out.println(e.getMessage());	
			} catch (SQLException e) {
			 	System.out.println(e.getMessage());
			}
	}else if (flag == 8) {
		String SQL_select_easyGameEdit = "select user.score from user where userID = ? ";
		try {
		 	PreparedStatement pStatement = conn.prepareStatement(SQL_select_easyGameEdit);
		 	pStatement.setString(1,userID);
		 	
		 	ResultSet rs = pStatement.executeQuery();
			while(rs.next()){
		 		String score = rs.getString("score");

		 		output = score;
		 		//System.out.print("!!!!!!!!!"+output);
		 	}
		 	pStatement.close();
			} catch (NumberFormatException e) {
			 	System.out.println(e.getMessage());	
			} catch (SQLException e) {
			 	System.out.println(e.getMessage());
			}
	}else if (flag == 9) {
		String SQL_select_easyGameEdit = "select count(*) from game_invitecode where inviteCode = ?";
		try {
		 	PreparedStatement pStatement = conn.prepareStatement(SQL_select_easyGameEdit);
		 	pStatement.setString(1,userCode);
		 	
		 	ResultSet rs = pStatement.executeQuery();
			while(rs.next()){
				int num2 = rs.getInt("count(*)");
				num2 = num2-1;

		 		output = Integer.toString(num2);
		 		//System.out.print("!!!!!!!!!"+output);
		 	}
		 	pStatement.close();
			} catch (NumberFormatException e) {
			 	System.out.println(e.getMessage());	
			} catch (SQLException e) {
			 	System.out.println(e.getMessage());
			}
	}else if (flag == 10) {
		String SQL_select_easyGameEdit = "select count(*) from game_invitecode where userID = ?";
		try {
		 	PreparedStatement pStatement = conn.prepareStatement(SQL_select_easyGameEdit);
		 	pStatement.setString(1,userID);
		 	
		 	ResultSet rs = pStatement.executeQuery();
			while(rs.next()){
				int num2 = rs.getInt("count(*)");
		 		output = Integer.toString(num2);
		 		//System.out.print("!!!!!!!!!"+output);
		 	}
		 	pStatement.close();
		} catch (NumberFormatException e) {
		 	System.out.println(e.getMessage());	
		} catch (SQLException e) {
		 	System.out.println(e.getMessage());
		}
	}else if(flag == 11){
		String SQL_select_itemCount = "select count(*) from game_point_detail where userID = ? && item =?";
		String[] item = {"collect","share","viewCount","createPoint"};
		for(int i=0;i<item.length;i++){
			try {
			 	PreparedStatement pStatement = conn.prepareStatement(SQL_select_itemCount);
			 	pStatement.setString(1,userID);
			 	pStatement.setString(2,item[i]);
			 	System.out.println("item: "+item[i]);

			 	
			 	ResultSet rs = pStatement.executeQuery();
				while(rs.next()){
					int num2 = rs.getInt("count(*)");
			 		output = output+"|||"+num2;
			 		System.out.print("!!!!!!!!!"+output);
			 	}
			 	pStatement.close();
			} catch (NumberFormatException e) {
			 	System.out.println(e.getMessage());	
			} catch (SQLException e) {
			 	System.out.println(e.getMessage());
			}
		}
	}else if(flag == 12){
		String SQL_select_pointCode = "select * from game_point_code where binary code = ?";
		String SQL_update_pointCode_isInput = "update game_point_code set isInput = 1 where binary code = ?";
		try {
		 	PreparedStatement pStatement = conn.prepareStatement(SQL_select_pointCode);
		 	pStatement.setString(1,inputCode);
		 	ResultSet rs = pStatement.executeQuery();
			while(rs.next()){
				int point = rs.getInt("point");
				int isInput = rs.getInt("isInput");
				String endTime = rs.getString("endTime");
				if(isInput == 0){
			 		output = ""+point+"|||"+endTime;
			 		System.out.print("!!!!!!!!!"+output);
			 		pStatement = conn.prepareStatement(SQL_update_pointCode_isInput);
			 		pStatement.setString(1,inputCode);
			 		pStatement.executeUpdate();
			 	}else{
			 		output = "isInput";
			 	}
		 	}
		 	pStatement.close();
		} catch (NumberFormatException e) {
		 	System.out.println(e.getMessage());	
		} catch (SQLException e) {
		 	System.out.println(e.getMessage());
		}
	}
%><%=output%>