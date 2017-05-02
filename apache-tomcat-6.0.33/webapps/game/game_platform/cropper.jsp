<%@ page import="java.awt.image.BufferedImage"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.IOException"%>
<%@ page import="javax.imageio.ImageIO"%>
<%@ page import="java.io.ByteArrayInputStream"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="flex.dao.DBManger" %>
<%@ page import="flex.dao.DBUtils" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%!public String cropImage(int x, int y, int w, int h, String f, String userID, String fileDIR) {
		String absolutePath = fileDIR+"/userPhoto/"+userID+"/";
		System.out.println("***********absolutePath: "+absolutePath);
		try {
			String base64Image = f.split(",")[1];
			byte[] imageBytes = javax.xml.bind.DatatypeConverter.parseBase64Binary(base64Image);
			BufferedImage originalImgage = ImageIO.read(new ByteArrayInputStream(imageBytes));
			//File outputfile = new File(absolutePath + "originalImgage.jpg");
			
			//ImageIO.write(originalImgage, "jpg", outputfile);
			//System.out.println("Original image dimension: "+originalImgage.getWidth()+"x"+originalImgage.getHeight());
			float imageWidth = Integer.parseInt(f.split(",")[2]);
			float imageHeight = Integer.parseInt(f.split(",")[3]);
			float widthRadio = originalImgage.getWidth()/imageWidth;
			float heightRadio = originalImgage.getHeight()/imageHeight;
			System.out.println("**************widthRadio: "+(originalImgage.getWidth()/imageWidth));
			BufferedImage SubImgage = originalImgage.getSubimage(Math.round(x*widthRadio), Math.round(y*heightRadio), Math.round(w*widthRadio), Math.round(h*heightRadio));
			System.out.println("x*widthRadio: "+x*widthRadio+", y*heightRadio: "+y*heightRadio+", w*widthRadio: "+w*widthRadio+", h*heightRadio: "+h*heightRadio);
			System.out.println("Cropped image dimension: "+SubImgage.getWidth()+"x"+SubImgage.getHeight());
			widthRadio = SubImgage.getWidth()/w;
			heightRadio = SubImgage.getHeight()/h;
			File outputfile2 = new File(absolutePath + "croppedImage.jpg");
			if(!outputfile2.exists())
			{
			    outputfile2.getParentFile().mkdirs();
			    try {
			        outputfile2.createNewFile();
			    } catch (IOException e) {
			        // TODO Auto-generated catch block
			        e.printStackTrace();
			    }
			}
			ImageIO.write(SubImgage, "jpg", outputfile2);
			
			System.out.println("Image cropped successfully: "+outputfile2.getPath());
			
			return "/userPhoto/"+userID+"/"+outputfile2.getName();
		} catch (IOException e) {
			e.printStackTrace();
			return "";
		}
	}%>
<%
	// System.out.println("***********start: ");
	// System.out.println("***********y: "+request.getParameter("w"));
	// System.out.println("***********x: "+Integer.parseInt(request.getParameter("x")));
	int x = Integer.parseInt(request.getParameter("x"));
	int y = Integer.parseInt(request.getParameter("y"));
	int w = Integer.parseInt(request.getParameter("w"));
	int h = Integer.parseInt(request.getParameter("h"));
	String fileDIR = application.getInitParameter("fileDIR"); 
	String f = request.getParameter("f");
	String userID = request.getParameter("userID");
	String absolutePath = cropImage(x, y, w, h, f, userID, fileDIR);
	System.out.println("***********fileDIR: "+fileDIR);
	DBManger db = DBUtils.getDBManger();
	Connection conn = db.connWrite();
	Connection connR = db.connRead();

	String SQL_update_game = "update user set identity_picture_path = ? where userID= ?";
	try{
		PreparedStatement pStatement2 = conn.prepareStatement(SQL_update_game);
		pStatement2.setString(1,absolutePath);
		pStatement2.setString(2,userID);

		pStatement2.executeUpdate();
		pStatement2.close();
	} catch (SQLException e) {
	 	System.out.println(e.getMessage());
	}

	String preURL = request.getRequestURL().toString();
	System.out.print(preURL);
	session.setAttribute("img_path", absolutePath);
	preURL = preURL.substring(0,preURL.lastIndexOf("/"));
	response.sendRedirect(preURL+"/edit/firstEdit.jsp");
%>