<%@ page contentType="text/html;charset=UTF-8" %>   
<%
String pages = request.getParameter("login");
String type = request.getParameter("type");
System.out.println("pages"+pages);
//讀取留下來的學校ID
//使用冒號串接學校名字
//如果有兩筆以上就用逗號串接
String s = "CGES:宏鼎學校";
if(pages==null) {
	pages = "null";
	s = "";
}
if(type==null)
	type = "null";
	
//取決於要留下來的語系
String l = "zh-TW,zh-CN,en-US,ja-JP";

//持有的模組
String m = "plan,quiz,assesment,homework";

if(pages.equals("tainanSchool")) {
    s = "JLJH,FHJH,CG,WHJH,0410test,TN,YAES,HMPS,TNCG,SB";
}
else if(pages.equals("otherSchool")) {
    s = "GHPS,SMPS,DPPS,JSES,SKES,JEES,LCVS";
}
else if(pages.equals("taipeiSchool")) {
    s = "OJAJH,PCSH,PYPS";
}
else if(pages.equals("hsinchuSchool")) {
	s = "SMJH,CCN,CKSH,HSPS";
}
else if(pages.equals("yilanSchool")) {
	s = "YLP,YLSJ,YLS";
}
else if(pages.equals("yunlinSchool")) {
	s = "YLC,CKES,TLES";
}
else if(pages.equals("JPS")) {
	s = "JPS";
}
else if(pages.equals("CNS")) {
	s = "CNS";
}
else if(pages.equals("NESH")) {
	s = "NESH";
}
else if(pages.equals("NLIGH")) {
	s = "NLIGH";
}
else if(pages.equals("COACH")) {
	s = "COACH";
}
else if(pages.equals("Hitachi")) {
	s = "Hitachi";
}
else if(pages.equals("MLPP")) {
	s = "MLPP";
}
else if(pages.equals("default")) {
	l = "zh-TW";
}else if(pages.equals("TEST")) {
	l = "zh-TW";
}

String  returnValue;

if(type.equals("school_language")){
	returnValue = s+"|"+l;
}
else 
	returnValue = s;
%>
<%=returnValue%>
