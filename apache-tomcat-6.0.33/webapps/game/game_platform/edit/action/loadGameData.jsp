<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="flex.dao.DBManger" %>
<%@ page import="flex.dao.DBUtils" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "org.json.JSONArray" %>
<%@ page import = "org.json.JSONException" %>
<%@ page import = "org.json.JSONObject" %>
<%@ page import = "java.net.URI" %>
<%@ page import = "java.net.URLEncoder" %>

<%
	response.setHeader("Access-Control-Allow-Origin","*");
	String keyword = request.getParameter("keyword");
	System.out.println("keyword "+keyword);
	String output ="";
	DBManger db = DBUtils.getDBManger();
	Connection conn = db.connWrite();
	Connection connR = db.connRead();
	JSONObject inJsonObj=new JSONObject();
	JSONArray aJsonObj=new JSONArray();

	// String nickNameSQL ="";
	// String classifySQL ="";
	String keywordSQL ="";

	// keyword
	if (keyword.equals("null")) {
		keywordSQL = " && gameName is not null ";
	}else{
		keywordSQL = " && gameName like '%"+keyword+"%' or creatorName like '%"+keyword+"%' ";
	}
	// 縣市
	// if (key_city.equals("all") ) {
	// 	nickNameSQL = " && nickName is not null ";
	// }else{
	// 	nickNameSQL = " && nickName = '"+key_city+"'";

	// }
	// // 領域
	// if (key_classifyID.equals("all") ) {
	// 	classifySQL = " && classifyID is not null ";
	// }else{
	// 	classifySQL = " && classifyID = '"+key_classifyID+"'";
	// }
	
	//String SQL_select_easyGameEdit = "select game_basicinfo.* , school_category.nickName ,map_domain.classifyID "+
										//"from game_basicinfo "+
										//"left join school_category "+
										//"on game_basicinfo.counties = school_category.name "+
										//"left join map_domain "+
										//"on game_basicinfo.subject = map_domain.domain_name "+
										//"where gtype='easy' && isShare='1' order by updateTime desc";

	//String SQL_select_easyGameEdit = "select tempA.*,map_domain.classifyID "+
									//	"from( "+
										//	"select game_basicinfo.* , school_category.nickName , "+
										//	"SUBSTRING_INDEX(SUBSTRING_INDEX(game_basicinfo.unitID,'t',-1),'a',1)as U "+
										//	"from game_basicinfo "+
									//		"left join school_category "+
										//	"on game_basicinfo.counties = school_category.name "+
										//")as tempA "+
										//"left join map_domain on map_domain.domain_code=tempA.U "+
										//"where gtype='easy' && isShare='1' by updateTime desc";
	String SQL_select_easyGameEdit ="select tempA.*,map_domain.classifyID from(	select game_basicinfo.* , school_category.nickName , SUBSTRING_INDEX(SUBSTRING_INDEX(game_basicinfo.unitID,'t',-1),'a',1)as U from game_basicinfo left join school_category	on game_basicinfo.counties = school_category.name )as tempA left join map_domain on map_domain.domain_code=tempA.U where isShare='1'"+keywordSQL+"order by updateTime desc";
	System.out.println("OOOOOOOOOOOOOOOO "+SQL_select_easyGameEdit);
	try {
	 	PreparedStatement pStatement = conn.prepareStatement(SQL_select_easyGameEdit);
	 
	 	//pStatement.setString(2,gtype);
	 	
	 	ResultSet rs = pStatement.executeQuery();
		while(rs.next()){
			inJsonObj=new JSONObject();
	 		String gameID = rs.getString("gameID");
	 		String gameName = rs.getString("gameName");
	 		String unitID = rs.getString("unitID");
	 		String creator = rs.getString("creator");
	 		String imgPath = rs.getString("imgPath");
	 		String playURL = rs.getString("playURL");
	 		String playNum = rs.getString("playNum");
	 		String utime = rs.getString("updateTime");
	 		String stime = rs.getString("shareTime");
	 		String creatorName = rs.getString("creatorName");
	 		String schoolYear = rs.getString("schoolYear");
	 		String semester = rs.getString("semester");
	 		String subject = rs.getString("subject");
	 		String grade = rs.getString("grade");
	 		String area = rs.getString("area");
	 		String counties = rs.getString("counties");
	 		// join
	 		String nickName = rs.getString("nickName");
	 		String classifyID = rs.getString("classifyID");
	 		if(playURL.indexOf(".") < 0 || (playURL.indexOf(".") >= 0 && playURL.indexOf(".0") >= 0)){
			}else{
				inJsonObj.put("BookName", gameName).put("BookUrl", "http://holiyo.tn.edu.tw"+playURL).put("Count", playNum).put("AuthorName", creatorName).put("CoverUrl", "http://holiyo.tn.edu.tw/iTS5/service/file/game/tn/"+gameID+"/"+imgPath).put("Grade", grade).put("Classify", classifyID).put("PublicationDate", stime).put("Country", nickName);
				//.put("qrCode", "http://www.qr-code-generator.com/phpqrcode/getCode.php?cht=qr&chl="+java.net.URLEncoder.encode("http://holiyo.tn.edu.tw"+playURL, "UTF-8"))
				aJsonObj.put(inJsonObj);
			}
			System.out.println("url "+java.net.URLDecoder.decode(playURL, "UTF-8"));

	 	}
	 	output= aJsonObj.toString();
	 	pStatement.close();
	} catch (NumberFormatException e) {
	 	System.out.println(e.getMessage());	
	} catch (SQLException e) {
	 	System.out.println(e.getMessage());
	}
%><%=output%>