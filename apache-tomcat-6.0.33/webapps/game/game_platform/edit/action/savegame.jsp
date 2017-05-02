<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="flex.dao.DBManger" %>
<%@ page import="flex.dao.DBUtils" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,java.text.SimpleDateFormat" %>
<%@ page import="java.lang.reflect.Array" %>
<%
	String gameID = request.getParameter("gameid");
	String type = request.getParameter("type");
	String gameName = request.getParameter("gameName");
	String creatorID = request.getParameter("creator");
	String creatorName = request.getParameter("creatorName");
	String gtype = request.getParameter("gtype");
	String imgPath = request.getParameter("imgPath");
	String remark = request.getParameter("remark");
	//System.out.println("imgPath "+imgPath);

	String dom = request.getParameter("dom");
	String schoolYear = request.getParameter("schoolYear");
	String semester = request.getParameter("semester");
	String subject = request.getParameter("subject");
	String grade = request.getParameter("grade");
	String area = request.getParameter("area");
	String counties = request.getParameter("counties");
	String isShare = request.getParameter("isShare");
	String code = request.getParameter("code");
	String update_type = "";
	String vgameID = "";
	String addpoint = request.getParameter("addpoint");
	//int add_point = Integer.parseInt(addpoint);
	
	System.out.println(gameID);
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
	// 新增遊戲
	if (type.equals("createNewGame")) {
		System.out.println("new");
		String SQL_insert_game ="insert into game_basicinfo (gameID, gameName, gtype, schoolYear, semester , subject, grade, area, counties, unitID, creator, creatorName, imgPath, updateTime, remark, isShare) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try{
			PreparedStatement pStatement = conn.prepareStatement(SQL_insert_game);
			pStatement.setString(1,gameID);
			pStatement.setString(2,gameName);
			pStatement.setString(3,gtype);
			pStatement.setString(4,schoolYear);
			pStatement.setString(5,semester);
			pStatement.setString(6,subject);
			pStatement.setString(7,grade);
			pStatement.setString(8,area);
			pStatement.setString(9,counties);
			pStatement.setString(10,dom);
			pStatement.setString(11,creatorID);
			pStatement.setString(12,creatorName);
			pStatement.setString(13,imgPath);
			pStatement.setString(14,dateTime);
			pStatement.setString(15,remark);
			pStatement.setString(16,isShare);

			pStatement.executeUpdate();
		 	pStatement.close();

		 	resultStr = "create success!!";
		 	} catch (SQLException e) {
			 	System.out.println(e.getMessage());
			}
	// 編輯遊戲
	}else if (type.equals("editGame")) {
		System.out.println("editGame");
		String SQL_update_game = "update game_basicinfo set	gameName = ? ,schoolYear = ? ,semester = ? ,subject = ? ,grade = ? ,area = ? ,counties = ? ,unitID = ? ,imgPath = ?, creator = ?, creatorName = ?, updateTime = ?, remark = ?, isShare = ? where gameID= ?";
//System.out.println(gameName+","+schoolYear+","+semester+","+subject+","+grade+","+area+","+counties+","+dom+","+gameID);
		try{
			PreparedStatement pStatement2 = conn.prepareStatement(SQL_update_game);
			pStatement2.setString(1,gameName);
			pStatement2.setString(2,schoolYear);
			pStatement2.setString(3,semester);
			pStatement2.setString(4,subject);
			pStatement2.setString(5,grade);
			pStatement2.setString(6,area);
			pStatement2.setString(7,counties);
			pStatement2.setString(8,dom);
			pStatement2.setString(9,imgPath);
			pStatement2.setString(10,creatorID);
			pStatement2.setString(11,creatorName);
			pStatement2.setString(12,dateTime);
			pStatement2.setString(13,remark);
			pStatement2.setString(14,isShare);
			pStatement2.setString(15,gameID);

			pStatement2.executeUpdate();
			pStatement2.close();
			} catch (SQLException e) {
			 	System.out.println(e.getMessage());
			}
	// 存取玩URL
	}else if (type.equals("saveURL")) {
		String playURL = request.getParameter("playURL");
		System.out.println("playURL: "+playURL);
		String SQL_update_url = "update game_basicinfo set playURL=? where gameID=?";
		try{
			PreparedStatement pStatement3 = conn.prepareStatement(SQL_update_url);
			pStatement3.setString(1,playURL);
			pStatement3.setString(2,gameID);
			
			pStatement3.executeUpdate();
			pStatement3.close();

			resultStr = "save url ok";
			} catch (SQLException e) {
			 	System.out.println(e.getMessage());
			}
	// 刪除遊戲
	}else if (type.equals("delete")) {
		System.out.println("delete "+gameID);
		String SQL_delete_game = "delete from game_basicinfo where gameID = ?";
		try{
			PreparedStatement pStatement4 = conn.prepareStatement(SQL_delete_game);
			pStatement4.setString(1,gameID);

			pStatement4.execute();
		 	pStatement4.close();

		 	resultStr = "delete OK";
		} catch (SQLException e) {
		 	System.out.println(e.getMessage());
		}
	// 指派 加入班級
	}else if (type.equals("insertClass")) {
		System.out.println("class");
		String gid = request.getParameter("gid");
		//int gidNum = gid.length();
		String choiceType = gid.split(",")[1];
		gid = gid.split(",")[0];
		
		//System.out.println("gid "+gid+" split "+choiceType);

		String SQL_select_gameClass = "select count(*) from game_class where gameID=? && classID=? ";
		try {
		 	PreparedStatement pStatement5 = conn.prepareStatement(SQL_select_gameClass);
		 	pStatement5.setString(1,gameID);
			pStatement5.setString(2,gid);

		 	ResultSet rs = pStatement5.executeQuery();
			while(rs.next()){
		 		int num = rs.getInt("count(*)");
		 		//System.out.println("num "+num+" choiceType "+choiceType.equals("true"));
				// 檢查是否已存在
				if(num < 1 && choiceType.equals("true")){
					System.out.println("insert class");
					String SQL_insert_class = "insert into game_class values(?,?)";
					try{
						PreparedStatement pStatement = conn.prepareStatement(SQL_insert_class);
						pStatement.setString(1,gameID);
						pStatement.setString(2,gid);

						pStatement.executeUpdate();
					 	pStatement.close();

					 	resultStr = "insert class OK";
					} catch (SQLException e) {
					 	System.out.println(e.getMessage());
					}
					//resultStr = "joined";
				}else if(num >= 1 && choiceType.equals("false")){
					System.out.println("delete class");
					String SQL_delete_class = "delete from game_class where gameID=? && classID=?";
					try{
						PreparedStatement pStatement = conn.prepareStatement(SQL_delete_class);
						pStatement.setString(1,gameID);
						pStatement.setString(2,gid);

						pStatement.execute();
					 	pStatement.close();

					 	resultStr = "delete class OK";
					} catch (SQLException e) {
					 	System.out.println(e.getMessage());
					}
				}
		 		resultStr = "nothing";
		 	}
		 	pStatement5.close();
			} catch (NumberFormatException e) {
			 	System.out.println(e.getMessage());	
			} catch (SQLException e) {
			 	System.out.println(e.getMessage());
			}
	// 觀看次數
	}else if (type.equals("view")) {
		System.out.println("viewNumber");
		String SQL_viewtNumAdd = "update game_basicinfo set viewNum = viewNum+1 where gameID = ?";
		try{
			PreparedStatement pStatement6 = conn.prepareStatement(SQL_viewtNumAdd);
			pStatement6.setString(1,gameID);
			pStatement6.executeUpdate();
		 	pStatement6.close();

		 	resultStr = "view number add OK";
		} catch (SQLException e) {
		 	System.out.println(e.getMessage());
		}
	// 收藏次數
	}else if (type.equals("collect")) {
		System.out.println("collectNumber");
		String newID = request.getParameter("newID");
		// 新增收藏次數
		String SQL_viewtNumAdd = "update game_basicinfo set collectNum = collectNum+1 where gameID = ?";
		// 將被收藏者gameID放入收藏者中
		String SQL_insertOldID = "update game_basicinfo set gameOldID = ? where gameID = ?";
		// 新增收藏記錄到game_point_detail表
		String SQL_insertpoint_detail = "insert into game_point_detail values('collect',?,10,?,now())";
		// 查詢gameID收藏次數
		String SQL_select_checkYourGame = "select count(*) from game_basicinfo where gameID = ? && gameOldID is null";
		String SQL_select_point_detail = "select count(*) from game_point_detail where userID = ? && item='collect' ";
		String SQL_select_GameNotCollect = "select count(*) from game_point_detail where gameID = ? && item='collect' ";
		String SQL_insert_point = "update user set score = score+10 where userID = ?";
		
		try{
			PreparedStatement pStatement6 = conn.prepareStatement(SQL_viewtNumAdd);
			pStatement6.setString(1,gameID);
			pStatement6.executeUpdate();

			pStatement6 = conn.prepareStatement(SQL_insertOldID);
			pStatement6.setString(1,gameID);
			pStatement6.setString(2,newID);
			pStatement6.executeUpdate();

			pStatement6 = conn.prepareStatement(SQL_select_point_detail);
			pStatement6.setString(1,creatorID);
			ResultSet rs = pStatement6.executeQuery();
			while(rs.next()){
		 		int num = rs.getInt("count(*)");
		 		if(num < 10){
		 			pStatement6 = conn.prepareStatement(SQL_select_checkYourGame);
					pStatement6.setString(1,gameID);
					rs = pStatement6.executeQuery();
					while(rs.next()){
				 		num = rs.getInt("count(*)");
				 		if(num==1){
				 			pStatement6 = conn.prepareStatement(SQL_select_GameNotCollect);
							pStatement6.setString(1,gameID);
							rs = pStatement6.executeQuery();
							while(rs.next()){
				 				num = rs.getInt("count(*)");
				 				if(num==0){
						 			pStatement6 = conn.prepareStatement(SQL_insertpoint_detail);
									pStatement6.setString(1,creatorID);
									pStatement6.setString(2,gameID);
									pStatement6.executeUpdate();
									pStatement6 = conn.prepareStatement(SQL_insert_point);
									pStatement6.setString(1,creatorID);
									pStatement6.executeUpdate();
								}
							}
				 		}
					}
		 		}
		 	}

			pStatement6.close();

		 	resultStr = "collect number add OK";
		} catch (SQLException e) {
		 	System.out.println(e.getMessage());
		}
	// 目前遊戲製作、限制份數
	}else if (type.equals("numberGame")) {
		System.out.println("update number game!!");
		String flag = request.getParameter("flag");
		String SQL_updateNumGame = "";
		String num = "";
		String cNum = "";
		if(flag.equals("easy")){
			System.out.println("easy number update");
			num = request.getParameter("easyNum");
			cNum = request.getParameter("easyCNum");
			SQL_updateNumGame = "update user set easyNum = ? ,easyCNum = ? where userID = ? ";
		}
		if(flag.equals("hard")){
			System.out.println("ox number update");
			num = request.getParameter("oxNum");
			cNum = request.getParameter("oxCNum");
			SQL_updateNumGame = "update user set oxNum = ? ,oxCNum = ? where userID = ? ";
		}

		try{
			PreparedStatement pStatement7 = conn.prepareStatement(SQL_updateNumGame);
			//System.out.println("update number game!! "+creatorID+easyNum+oxNum);

			pStatement7.setString(1,num);
			pStatement7.setString(2,cNum);
			pStatement7.setString(3,creatorID);
			pStatement7.executeUpdate();
		 	pStatement7.close();
		 	//System.out.println("????????????????? "+easyNum+" dddd "+oxNum);

		 	resultStr = "update number OK";
		} catch (SQLException e) {
		 	System.out.println(e.getMessage());
		}
	// 邀請碼
	}else if (type.equals("invite")) {
		System.out.println("invite!!");
		String inputcode = request.getParameter("inputCode");
		String usercode = request.getParameter("userCode");
		System.out.println("usercode "+usercode+" inputcode "+inputcode);
		// 判斷邀請碼是否存在user表
		String SQL_select_inviteCode = "select count(*) from game_invitecode where inviteCode= ? ";
		try {
		 	PreparedStatement pStatement8 = conn.prepareStatement(SQL_select_inviteCode);
		 	pStatement8.setString(1,inputcode);

		 	ResultSet rs = pStatement8.executeQuery();
			while(rs.next()){
		 		int num = rs.getInt("count(*)");
				// 檢查是否已存在，不是輸入自己的invite code
				if(num >= 6){
					resultStr = "limit";
				}else if(num < 6 && num >= 1 && !usercode.equals(inputcode)){
					System.out.println("insert class");
					// 檢查自己是否已輸入過了
					String SQL_select_gameinvitecode = "select count(*) from game_invitecode where inviteCode = ? && userID = ?";
					try {
					 	PreparedStatement pStatement = conn.prepareStatement(SQL_select_gameinvitecode);
					 	pStatement.setString(1,inputcode);
					 	pStatement.setString(2,creatorID);
					 	System.out.println("inputcode "+inputcode+" creatorID "+creatorID);

					 	ResultSet rs2 = pStatement.executeQuery();
						while(rs2.next()){
							int num2 = rs2.getInt("count(*)");
								System.out.println("num2num2 "+num2);

							// 已輸入invite code
							if(num2 == 1){
				 				resultStr = "存在";
							// 未輸入invite code
							}else if(num2 < 1){
								System.out.println("add invite sql!!");
								// 新增至 game_invitecode 表中
								String SQL_insert_class = "insert into game_invitecode values(?,?,?)";
								String SQL_checkTime = "update user set score = score+5 where userID = ?";
								String SQL_insert_point_detail = "insert into game_point_detail(item,userID,point,gameID,gainTime) values('invitecode',?,5,?,now())";


								//System.out.println("num2num2");
								try{
									PreparedStatement pStatement1 = conn.prepareStatement(SQL_insert_class);
									pStatement1.setString(1,inputcode);
									pStatement1.setString(2,creatorID);
									pStatement1.setString(3,creatorName);
									pStatement1.executeUpdate();
								 	
								 	pStatement1 = conn.prepareStatement(SQL_checkTime);
									pStatement1.setString(1,creatorID);
									pStatement1.executeUpdate();

									pStatement1 = conn.prepareStatement(SQL_insert_point_detail);
									pStatement1.setString(1,creatorID);
									pStatement1.setString(2,inputcode);
									pStatement1.executeUpdate();

								 	pStatement1.close();

								 	resultStr = "invite";
								} catch (SQLException e) {
								 	System.out.println(e.getMessage());
								}

							}
						}
				 	pStatement.close();
					} catch (SQLException e) {
					 	System.out.println(e.getMessage());
					}
				// invite code not found
				}else if(num <=0){
		 		 	resultStr = "不存在";
		 		// invite code is my
		 		}else{
		 			resultStr = "是我";
		 		}
		 	}
		 	pStatement8.close();
			} catch (SQLException e) {
			 	System.out.println(e.getMessage());
			}	
	}else if (type.equals("updateTotalnum")) {
		System.out.println("updateTotalnum");
		String SQL_viewtNumAdd = "update user set totalNum = totalNum+1 where inviteCode = ? && totalNum <15";
		try{
			PreparedStatement pStatement = conn.prepareStatement(SQL_viewtNumAdd);
			pStatement.setString(1,code);
			pStatement.executeUpdate();
		 	pStatement.close();

		 	resultStr = "totalNum number add OK";
		} catch (SQLException e) {
		 	System.out.println(e.getMessage());
		}
	// 目前遊戲製作、限制份數
	}else if (type.equals("updateTime")) {
		System.out.println("updateTime");
		//String SQL_check_updateTime = "select game_point_detail.gainTime from game_point_detail where userID = ? && item = 'checkTime' order by gainTime desc";
		String SQL_checkTime = "update user set checkTime = ?, score = score+5 where userID = ?";
		String SQL_score = "select user.score from user where userID = ?";
		String SQL_insert_pointdetail = "insert into game_point_detail values('checktime',?,5,?,now())";
		String SQL_select_point_detail = "select count(*) from game_point_detail where userID = ? && item='checktime' ";
		String SQL_update_score = "update user set score = score+? where userID = ?";
	 	String SQL_insert_point_checkTimeC = "insert into game_point_detail values(?,?,?,?,now())";
		String score = "";

		/*try{
			String score = "";
			PreparedStatement pStatement = conn.prepareStatement(SQL_check_updateTime);
			pStatement.setString(1,creatorID);
			ResultSet rs = pStatement.executeQuery();

			while(rs.next()){*/
			try{
				PreparedStatement pStatement = conn.prepareStatement(SQL_checkTime);
				pStatement.setString(1,dateTime);
				pStatement.setString(2,creatorID);
				pStatement.executeUpdate();

				pStatement = conn.prepareStatement(SQL_insert_pointdetail);
				pStatement.setString(1,creatorID);
				pStatement.setString(2,null);
				pStatement.executeUpdate();

				 // 額外獎勵
				/*pStatement = conn.prepareStatement(SQL_select_point_detail);
				pStatement.setString(1,creatorID);
				ResultSet rs = pStatement.executeQuery();
				while(rs.next()){
			 		int num = rs.getInt("count(*)");
			 		if(num==30){
			 			pStatement = conn.prepareStatement(SQL_update_score);
			 		 	pStatement.setInt(1,150);
			 		 	pStatement.setString(2,creatorID);
			 			pStatement.executeUpdate();

			 			pStatement = conn.prepareStatement(SQL_insert_point_checkTimeC);
			 		 	pStatement.setString(1,"checkTimeC");
			 		 	pStatement.setString(2,creatorID);
			 		 	pStatement.setInt(3,150);
			 		 	pStatement.setString(4,null);
			 			pStatement.executeUpdate();

			 			resultStr = resultStr + "score:checkTimeC";
			 		}
			 	}*/
		 	//}

			try {
			 	PreparedStatement pStatement1 = conn.prepareStatement(SQL_score);
			 	pStatement1.setString(1,creatorID);
			 	
			 	ResultSet rs = pStatement1.executeQuery();
				while(rs.next()){
			 		score = rs.getString("score");
			 		System.out.print("!!!!!!!!!"+score);
			 	}
			 	pStatement1.close();
			} catch (NumberFormatException e) {
			 	System.out.println(e.getMessage());	
			} catch (SQLException e) {
			 	System.out.println(e.getMessage());
			}
			pStatement.close();
		 	resultStr = "checkTime update ok score:"+score;
		} catch (SQLException e) {
		 	System.out.println(e.getMessage());
		}
	// 目前遊戲製作、限制份數
	}else if (type.equals("viewCount")) {
		System.out.println("viewCount");
		String SQL_select_viewNum = "select playNum, gameID from game_basicinfo where creator = ? && gameOldID is null";
		String SQL_select_viewCount = "select count(*) from game_point_detail where gameID = ? && item='viewCount'";
		String SQL_update_score = "update user set score = score+? where userID = ?";
		String SQL_insert_pointdetail = "insert into game_point_detail values(?,?,?,?,now())";
		try{
			PreparedStatement pStatement = conn.prepareStatement(SQL_select_viewNum);
			pStatement.setString(1,creatorID);
			ResultSet rs = pStatement.executeQuery();
			while(rs.next()){
			 	int playNum = rs.getInt("playNum");
			 	vgameID = rs.getString("gameID");
			 	System.out.println("vgameID "+vgameID);
			 	if(playNum>=100){
		 			
			 		pStatement = conn.prepareStatement(SQL_select_viewCount);
					pStatement.setString(1,vgameID);
					ResultSet rs1 = pStatement.executeQuery();
					while(rs1.next()){
				 		int num = rs1.getInt("count(*)");
				 		if(num==0){
				 			pStatement = conn.prepareStatement(SQL_update_score);
						 	pStatement.setInt(1,100);
						 	pStatement.setString(2,creatorID);
							pStatement.executeUpdate();

							pStatement = conn.prepareStatement(SQL_insert_pointdetail);
						 	pStatement.setString(1,"viewCount");
						 	pStatement.setString(2,creatorID);
						 	pStatement.setInt(3,100);
						 	pStatement.setString(4,vgameID);
							pStatement.executeUpdate();
				 		}
				 	}
			 	}
			 }
		 	pStatement.close();

		 	resultStr = "viewCount update ok";
		} catch (SQLException e) {
		 	System.out.println(e.getMessage());
		}
	}else if (type.equals("createPoint")) {
		System.out.println("createPoint");
		String SQL_select_createNew = "select count(*) from game_basicinfo where gameID = ? && gameOldID is null";
		String SQL_select_createPoint = "select count(*) from game_point_detail where gameID = ? && item='createPoint'";
		String SQL_select_createNewNum = "select count(*) from game_point_detail where userID = ? && item='createPoint'";		
		String SQL_update_score = "update user set score = score+? where userID = ?";
		String SQL_insert_pointdetail = "insert into game_point_detail values(?,?,?,?,now())";
		try{
			PreparedStatement pStatement = conn.prepareStatement(SQL_select_createNew);
			pStatement.setString(1,gameID);
			ResultSet rs = pStatement.executeQuery();
			while(rs.next()){
				int num = rs.getInt("count(*)");
				if(num==1){
					pStatement = conn.prepareStatement(SQL_select_createPoint);
					pStatement.setString(1,gameID);
					rs = pStatement.executeQuery();
					while(rs.next()){
						num = rs.getInt("count(*)");
						if(num==0){
							pStatement = conn.prepareStatement(SQL_select_createNewNum);
							pStatement.setString(1,creatorID);
							rs = pStatement.executeQuery();
							while(rs.next()){
								num = rs.getInt("count(*)");
		 						System.out.println("num:"+num);
								if(num<5){
									pStatement = conn.prepareStatement(SQL_update_score);
								 	pStatement.setInt(1,50);
								 	pStatement.setString(2,creatorID);
									pStatement.executeUpdate();

									pStatement = conn.prepareStatement(SQL_insert_pointdetail);
								 	pStatement.setString(1,"createPoint");
								 	pStatement.setString(2,creatorID);
								 	pStatement.setInt(3,50);
								 	pStatement.setString(4,gameID);
									pStatement.executeUpdate();
								}
							}
						}
					}
				}
			}
		 	pStatement.close();

		 	resultStr = "createPoint add OK";
		} catch (SQLException e) {
		 	System.out.println(e.getMessage());
		}
	// 目前遊戲製作、限制份數
	}else if (type.equals("firstLogin")) {
		System.out.println("firstLogin");
		String SQL_select_firstLoginPoint = "select count(*) from game_point_detail where userID = ? && item='firstLogin'";		
		String SQL_update_score = "update user set score = score+? where userID = ?";
		String SQL_insert_pointdetail = "insert into game_point_detail values(?,?,?,?,now())";
		try{
			PreparedStatement pStatement = conn.prepareStatement(SQL_select_firstLoginPoint);
			pStatement.setString(1,creatorID);
			ResultSet rs = pStatement.executeQuery();
			while(rs.next()){
				int num = rs.getInt("count(*)");
				if(num==0){
					pStatement = conn.prepareStatement(SQL_update_score);
				 	pStatement.setInt(1,5000);
				 	pStatement.setString(2,creatorID);
					pStatement.executeUpdate();

					pStatement = conn.prepareStatement(SQL_insert_pointdetail);
				 	pStatement.setString(1,"firstLogin");
				 	pStatement.setString(2,creatorID);
				 	pStatement.setInt(3,5000);
				 	pStatement.setString(4,null);
					pStatement.executeUpdate();
					resultStr = "firstLogin point add OK";
				}
			}
		 	pStatement.close();
		} catch (SQLException e) {
		 	System.out.println(e.getMessage());
		}
	// 目前遊戲製作、限制份數
	}else if (type.equals("addpoint")) {
		System.out.println("addpoint");
		int add_point = Integer.parseInt(addpoint);
		String SQL_update_score = "update user set score = score+? where userID = ?";
		String SQL_insert_pointdetail = "insert into game_point_detail values(?,?,?,?,now())";
		try{
			PreparedStatement pStatement = conn.prepareStatement(SQL_update_score);
		 	pStatement.setInt(1,add_point);
		 	pStatement.setString(2,creatorID);
			pStatement.executeUpdate();

			pStatement = conn.prepareStatement(SQL_insert_pointdetail);
		 	pStatement.setString(1,"pointCode");
		 	pStatement.setString(2,creatorID);
		 	pStatement.setInt(3,add_point);
		 	pStatement.setString(4,null);
			pStatement.executeUpdate();
			resultStr = "input code point add OK";
		 	pStatement.close();
		} catch (SQLException e) {
		 	System.out.println(e.getMessage());
		}
	}
	// if(!update_type.equals("")){
	// 	String SQL_update_score = "update user set score = score+? where userID = ?";
	// 	String SQL_insert_pointdetail = "insert into game_point_detail values(?,?,?,?,now())";
	// 	if(update_type.equals("checkTime")){
	// 		try {
	// 		 	PreparedStatement pStatement = conn.prepareStatement(SQL_update_score);
	// 		 	pStatement.setInt(1,150);
	// 		 	pStatement.setString(2,creatorID);
	// 			pStatement.executeUpdate();

	// 			pStatement = conn.prepareStatement(SQL_insert_pointdetail);
	// 		 	pStatement.setString(1,"checkTimeC");
	// 		 	pStatement.setString(2,creatorID);
	// 		 	pStatement.setInt(3,150);
	// 		 	pStatement.setString(4,null);
	// 			pStatement.executeUpdate();

	// 			resultStr = resultStr + "score:checkTimeC";

	// 		 	pStatement.close();
	// 		} catch (NumberFormatException e) {
	// 		 	System.out.println(e.getMessage());	
	// 		} catch (SQLException e) {
	// 		 	System.out.println(e.getMessage());
	// 		}
	// 	}
	// }
%>
<%=resultStr%>