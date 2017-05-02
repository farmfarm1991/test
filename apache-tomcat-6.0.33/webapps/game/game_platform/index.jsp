<%
	String preURL = "";
	try {
		preURL = request.getRequestURL().toString();
		System.out.println(preURL);

		preURL = preURL.substring(0,preURL.lastIndexOf("/game_platform/")+15);

		// xAPI login flag
		Cookie cookie_name =new Cookie("tin","1"); 
		response.addCookie(cookie_name); 

		System.out.println(" session "+session.isNew()+" AAAAAAAA");
	}
	catch (Exception e) {
		response.sendRedirect(preURL + "login.html");
	}
	//preURL = preURL.substring(0,preURL.lastIndexOf("/iTS5/")+6);
	response.sendRedirect(preURL + "edit/firstEdit.jsp");
	System.out.println(preURL + "edit/firstEdit.jsp!!!!!!!!!!!!!!!!!1");
%>
