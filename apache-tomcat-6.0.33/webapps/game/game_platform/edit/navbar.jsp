<%@ include file = "../chkAuth.jsp"%>
<%
System.out.println("in plan/navbar.jsp");
/*

navbar包含預載CSS 以及會用到的js library
不需要特別放置位置 瀏覽器會自己調整tag應該要在的位置

*/
%>
<%@ include file = "../js/importjs.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" %>   
<%
	String school_id = (String)session.getAttribute("school_id");
	String school_name = (String)session.getAttribute("school_name");
	String roleName = (String)session.getAttribute("role_name");

%>
<!--boostrap css-->
<link href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>
<link href="<%=pURL%>bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="<%=pURL%>./favicon.ico?v=12.2" rel="Shortcut Icon" type="image/x-icon">
<title>iTS 5</title>
<!--self script-->
<script type="text/javascript">

</script>  

<!--self css-->
<style type="text/css">
body{
/*	overflow: hidden;
	width: 100%;*/
}

.naviBtn {
	margin: 4px 18px;
	cursor: pointer;
}
.brand{
	font-family: 'DFKai-sb';
}
.navbar{
	top:0px;
	position:absolute;
	width:100%;
	z-index: 10;
/*	left:240px;*/
}

#blockLien{
	border-left: 2px solid #FFF;
	height: 20px;
	display: inline-block;
	margin: -5px 0px;
}

.menuClose {
	width : 100%;
/*	-webkit-transform: translateX(-240px);*/
	transition: all 240ms ease-out;
}
.menuOpen {
	width : 100%;
/*	-webkit-transform: none;*/
	transition: all 240ms ease-out;
}
.menuClose >div>span>.menu-trigger>img {

}



.naviMenu, .naviSearch, .naviTools, .naviHot, .naviLayout{
	display: inline-block;
}
.itsnavbar{
	-webkit-border-radius: 0px;
	   -moz-border-radius: 0px;
	        border-radius: 0px;
	border: 0px;
/*	border-bottom: 1px solid #d4d4d4;*/
	padding: 0px;
}
.itstopbar{
	background-color: #A8D066;
	background-image:-webkit-linear-gradient(top,#B4D467,#9DCC66);
	background-image:   -moz-linear-gradient(top,#B4D467,#9DCC66);
	background-image:	 -ms-linear-gradient(top,#B4D467,#9DCC66);
	background-image:		 linear-gradient(top,#B4D467,#9DCC66);	
	border-bottom: 1px solid #8AC562;
	min-height: 41px;
}
.pull-middle {
	margin-left: 		 calc(50% - 78px);
	margin-left: 	-moz-calc(50% - 78px);
	margin-left: -webkit-calc(50% - 78px);
}
.fullmenu{
	width: 240px;
	float: left;
	background-color: cornflowerblue;
	height: 100%;
	position: absolute;
	top: 0px;
	z-index: 0;
	overflow: auto;
/*	padding: 10px 10px;*/
	max-height: 574px;
}
/*.ma::-webkit-scrollbar{
	width:10px;
}
.ma::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
    border-radius: 10px;
}
 
.ma::-webkit-scrollbar-thumb {
    border-radius: 10px;
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5); 
}
*/
.main{
	z-index: 2;
	background-color:#DCDCDC;
	position: absolute;
/*	height: calc(100% - 96px);
	height: -webkit-calc(100% - 96px);
*/	width: 100%;
/*	left:240px;*/
	height:100%;
}


/***/
.ma{
/*	height: calc(100% - 10px);*/
	height:100%;
	overflow:auto;
	background-color: #EDEDED;
}
@media all and (max-width: 818px) {
	.itstopbar {
		background-image: none;
	}
	.fullmenu {
		max-height: 414px;
	}
}
</style>

<!--navbar+menu-->
<header class="navbar">
	<div class="navbar-inner navbar-state-top itsnavbar itstopbar">
		<span class="pull-left">
			<span id="menuTrigger" onClick="back()" class="menu-trigger naviMenu">
				<img class="naviBtn" src="<%=pURL%>game_platform/images/naviBar/return.svg"/>
			</span>
			<!--<span id="blockLien"></span>-->
		</span>
<!--		<span >
			<img class="naviBtn" src="<%=pURL%>images/icon/iTSLogo_32X32.png"/>
		</span>
-->		<span class="pull-right">
<!--			<a id="layoutTrigger" href="#layout" class="layout-trigger naviLayout">
				<img class="naviBtn" src="<%=pURL%>images/naviBar/layout_1.png"/>
			</a>
-->			<span id="searchTrigger" onClick="save()" class="search-trigger naviSearch">
				<img class="naviBtn" src="img/save.svg"/>
			</span>		
		</span>
	</div>
</header>
<script>
function back() {
	if(location.pathname == "/game/game_platform/edit/create.jsp") {
		if(location.search == "?type=otherview") {
			location.replace('../plan/preClass.jsp');
		}
		else
			location.replace('../edit/firstEdit.jsp');
	}
	else {
		location.replace('../edit/firstEdit.jsp');
	}
}

</script>
