<%@ page import="java.lang.Integer" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="flex.dao.DBManger" %>
<%@ page import="flex.dao.DBUtils" %>
<%
String schoolID = (String) session.getAttribute("school_id");
String domainIdArray = "";
String domainNameArray = "";
String domainType2Array = "";
String stageArray = "";
String[] stagePostChar = { "", "st", "nd", "rd", "th", "th", "th", "th", "th", "th", "th", "th", "th" };
String[] stageName = { "", "1年級", "2年級", "3年級", "4年級", "5年級", "6年級", "7年級", "8年級", "9年級", "10年級", "11年級", "12年級" };

String SQL_get_school_stage = "select * from school_grade_map left join edu_stage on school_grade_map.gradeName = edu_stage.stageID Where school_grade_map.schoolID = ? order by school_grade_map.`order` ";
try {
	DBManger db = DBUtils.getDBManger();
	Connection conn = db.connWrite();
	PreparedStatement pStatement = conn.prepareStatement(SQL_get_school_stage);
	pStatement.setString(1, schoolID);
	ResultSet rs = pStatement.executeQuery();
	while (rs.next()) {
		if (!stageArray.contains(rs.getString("grade")) && !(rs.getString("stageID")).equals("其他"))
			stageArray = stageArray.concat(rs.getString("grade") + ",");
	}
	pStatement.close();
} catch (SQLException e) {
	e.printStackTrace();
}

String data = "";
try {
	DBManger db = DBUtils.getDBManger();
	Connection conn = db.connRead();
	PreparedStatement pStatement = conn
			.prepareStatement("select * from school_grade_map where school_grade_map.schoolID=? order by school_grade_map.`order`");
	pStatement.setString(1, schoolID);
	ResultSet rs = pStatement.executeQuery();
	while (rs.next()) {
		data = data.concat(rs.getString("gradeName") + ",");
	}
	pStatement.close();
} catch (SQLException e) {
	e.printStackTrace();
}
// System.out.println(data);
String[] gradeName = data.split(",");
try {
	DBManger db = DBUtils.getDBManger();
	Connection conn = db.connRead();
	PreparedStatement pStatement = conn
			.prepareStatement("select * from map_domain where map_domain.type = '台南' order by map_domain.order");
	ResultSet rs = pStatement.executeQuery();
	while (rs.next()) {
		String domainID = rs.getString("domain_code");
		String domainName = rs.getString("domain_name");
		String domainType2 = rs.getString("type2");
		if (domainIdArray == "" && domainNameArray == "") {
			domainIdArray = domainID;
			domainNameArray = domainName;
			domainType2Array = domainType2;
		} else {
			domainIdArray = domainIdArray + "," + domainID;
			domainNameArray = domainNameArray + ","
					+ domainName;
			domainType2Array = domainType2Array + ","
					+ domainType2;
		}
	}
	//System.out.println("domainType2Array "+domainType2Array);
	pStatement.close();
} catch (SQLException e) {
	e.printStackTrace();
}
	
String areaIDArray = "";
String areaNameArray = "";
String areaTypeArray = "";
String areaOrderArrary = "";
String SQL_get_school_category = "select * from school_category where layer=1 order by school_category.`order`";
try {
	DBManger db = DBUtils.getDBManger();
	Connection conn = db.connWrite();
	PreparedStatement pStatement = conn.prepareStatement(SQL_get_school_category);

	ResultSet rs = pStatement.executeQuery();
	while(rs.next()){
		String areaID = rs.getString("id");
		String areaName = rs.getString("name");
		String areaType = rs.getString("type");
		String areaOrder = rs.getString("order");

		if(areaIDArray == "" && areaNameArray == "" && areaTypeArray == "" && areaOrderArrary == ""){
			areaIDArray = areaID;
			areaNameArray = areaName;
			areaTypeArray = areaType;
			areaOrderArrary = areaOrder;
		}
		else {
			areaIDArray = areaIDArray + "," + areaID;
			areaNameArray = areaNameArray + "," + areaName;
			areaTypeArray = areaTypeArray + "," + areaType;
			areaOrderArrary = areaOrderArrary + "," + areaOrder;
		}

	}
	//System.out.println("areaTypeArray "+areaTypeArray+" areaOrderArrary "+areaOrderArrary);
	pStatement.close();
} catch (SQLException e) {
	e.printStackTrace();
}
%>

<div id='selectYS'>
	<div class='text' id='year_label'>年度</div>
	<select id="yy">
		<option value='0' class='text' id="allyears_label" onclick='returnyear(103)'>所有年度</option>
		<option value="y105" class='text'></option>
		<!-- <option value='106'>2017</option> -->
	</select>
	<div class='text' id='order_label'>學期</div>
	<select id="ss">
		<option value='0' class='text' id='allorder_label'>所有學期</option>
		<option value='1' class='text' id='1st_order_label'>上</option>
		<option value='2' class='text' id='2nd_order_label'>下</option>
	</select>
</div>

<div id='selectGD'>
	<div class='text' id='grade_label'>年級</div>
	<select id="gg">
		<option value='0' class='text' id='allgrade_label'>所有年級</option>
<%
//System.out.println("stageArray:"+stageArray);
for(int j = 0; j<stageArray.split(",").length; j++){
	String aa = stageArray.split(",")[j];
	int tempNumber = Integer.parseInt(aa);
	String tempChar = stagePostChar[tempNumber];
	String tempGradeName = stageName[tempNumber];
%>
		<option value="<%=tempNumber%>" class='text' id='<%=tempNumber%><%=tempChar%>_grade_label'><%=tempGradeName%></option><%
}
%>
		<option value="99" class='text' id='any_grade_label'>不限年級</option>
	</select>
	<div class='text' id='domain_label'>領域</div>
	<select id="dd">
		<option value='0' class='text' id='alldomain_label'>所有領域</option>
<%
String preSelected = "";
for(int i = 0; i<domainIdArray.split(",").length; i++){
	String tempID = domainIdArray.split(",")[i];
	String tempName = domainNameArray.split(",")[i];
	String domainType2 = domainType2Array.split(",")[i];
	String idName = "";

	/*if(domainType2.equals("國小")){
		idName = "Elementary_label";
	}else if(domainType2.equals("國中")){
		idName = "Junior_label";
	}else if(domainType2.equals("高中")){
		idName = "Senior_label";
	}else if(domainType2.equals("高職")){
		idName = "Vocational_label";
	}else if(domainType2.equals("其他")){
		idName = "Other_lable";
	}

	if(preSelected.equals(""))
	{
%>
		<optgroup label="<%=domainType2%>" id="<%=idName%>">
<%
	}
	else if(!domainType2.equals(preSelected))
	{
%>
		</optgroup><optgroup label="<%=domainType2%>" id="<%=idName%>">
<%
	}
	preSelected = domainType2;*/
%>
	<option value='<%=tempID%>' class='newDomain text <%=idName%>' id='<%=tempID%>_label'><%=tempName%></option>
<%
}
%>

	<!-- </optgroup> -->
	</select>
</div>
<div id='selectAC'>
	<div class='text' id='area'>地區</div>
	<select id="aa">
		<option value='0' class='text' id="allarea">所有地區</option>
		<option value='1'>北部</option>
		<option value='2'>中部</option>
		<option value='3'>南部</option>
		<option value='4'>東部</option>
		<option value='5'>外島</option>
	</select>
<div class='text' id='city'>縣市</div>
	<select id="cc">
		<option value='0' class='text' id='allcity'>所有縣市</option>
<%
String lastSelected = "";
for(int i = 0; i<areaIDArray.split(",").length; i++){
	String areaID = areaIDArray.split(",")[i];
	String areaName = areaNameArray.split(",")[i];
	String areaType = areaTypeArray.split(",")[i];
	String areaOrder = areaOrderArrary.split(",")[i];
	String idName ="";

	if(areaType.equals("北部")){
		idName = "North_label";
	}else if(areaType.equals("中部")){
		idName = "Central_label";
	}else if(areaType.equals("南部")){
		idName = "South_label";
	}else if(areaType.equals("東部")){
		idName = "East_label";
	}else if(areaType.equals("外島")){
		idName = "OutlyingIslands_label";
	}
	if(lastSelected.equals(""))
	{
%>
		<optgroup label="<%=areaType%>" id="<%=idName%>" class='removeTag'>
<%
	}
	else if(!areaType.equals(lastSelected))
	{
%>
		</optgroup><optgroup label="<%=areaType%>" id="<%=idName%>" class='removeTag'>
<%
	}
	lastSelected = areaType;
%>
	<option value='<%=areaID%>' class='newDomain text' id='<%=idName%>'><%=areaName%></option>
<%
}
%>
	</optgroup>
	</select>
</div>
<script>
if($('#yy>option').length>1){
	for(i=1;i<$('#yy>option').length;i++){
		var yTemp=returnyear($($('#yy>option')[i]).val().split('y')[1]);
		$($('#yy>option')[i]).text(yTemp);
	}
}	
function returnyear(y) {
	var lang = $.cookie('leng');
	if(lang =='zh-TW'){
		switch (y) {
			case "105": return "105";
			case "106": return "106";
			default:	return "<span class='text' id='allyears_label'>所有年度</span>";
		}
	}
	else{
		switch (y) {
			case "105": return "2016";
			case "106": return "2017";
			default:	return "<span class='text' id='allyears_label'>所有年度</span>";
		}
	}
}
var preSelected = "";
var thisSelected = "";
$(document).ready(function(){
	translateOptgroup();
})
var areaThisSelected = "";
var areaPreSelected = "";
// 地區
var allCityArray = $('#cc>optgroup');
$("#aa").change(function(){citySelectbindArea()});
function citySelectbindArea(){
	//解決ipad 連動篩選問題
	var areaSelectedText = $('#aa').val();
		
	if(areaSelectedText == '0'){
		$('#cc>optgroup').remove();2
		$('#cc').append(allCityArray);
		areaThisSelected = 0;

	}else if(["1"].indexOf(areaSelectedText)>-1){
		$('#cc>optgroup').remove();
		$('#cc').append(allCityArray[0]);
		areaThisSelected = 1;

	}else if(["2"].indexOf(areaSelectedText)>-1){
		$('#cc>optgroup').remove();
		$('#cc').append(allCityArray[1]);
		areaThisSelected = 2;

	}else if(["3"].indexOf(areaSelectedText)>-1){
		$('#cc>optgroup').remove();
		$('#cc').append(allCityArray[2]);
		areaThisSelected = 3;

	}else if(["4"].indexOf(areaSelectedText)>-1){
		$('#cc>optgroup').remove();
		$('#cc').append(allCityArray[3]);
		areaThisSelected = 4;
		
	}else if(["5"].indexOf(areaSelectedText)>-1){
		$('#cc>optgroup').remove();
		$('#cc').append(allCityArray[4]);
		areaThisSelected = 5;
	}

	if(areaPreSelected != areaThisSelected)
	{
		$("#cc").val('0');
	}
	areaPreSelected = areaThisSelected;
	
}
// grade
var allDomainArray = $('#dd>optgroup');
/*$("#gg").change(function(){gradeSelectbindDomain()});
function gradeSelectbindDomain(){
	$('#dd').val('0');
	var text = $('#gg').val();
	
	for(var i = 0; i < allDomainArray.length-1 ; i++){
		if(text=='0')
		{			
			$('#dd>optgroup').remove();
			$('#dd').append(allDomainArray);
			thisSelected=0;
		}
		else if(text>0&&text<7)
		{
			if( allDomainArray[i].id == 'Elementary_label' ){
				$('#dd>optgroup').remove();
				$('#dd').append(allDomainArray[i]);
				$('#dd').append(allDomainArray[allDomainArray.length-1]);
				thisSelected=1;
			}
		}
		else if(text>6&&text<10)
		{
			if( allDomainArray[i].id == 'Junior_label' ){
				$('#dd>optgroup').remove();
				$('#dd').append(allDomainArray[i]);
				$('#dd').append(allDomainArray[allDomainArray.length-1]);
				thisSelected=2;
			}
		}
		else if(text>9&&text<13)
		{
			$('#dd>optgroup').remove();
			if( allDomainArray[i].id == 'Senior_label' )
			$('#dd').append(allDomainArray[i]);
			else if ( i != 0 && allDomainArray[i].id == 'Vocational_label' ){
				if( i != 0 && allDomainArray[i-1].id == 'Senior_label'){
					$('#dd').append(allDomainArray[i-1]);
				}
				$('#dd').append(allDomainArray[i]);
			}
			$('#dd').append(allDomainArray[allDomainArray.length-1]);
			thisSelected=3;
		}
	}

	
	if(preSelected != thisSelected)
	{
		$("#dd").val('0');
	}
	preSelected = thisSelected;
	// translateOptgroup();
}*/
function translateOptgroup(){
	for(i=0;i<$('#dd optgroup').length;i++){
		$('#dd optgroup')[i].label=translate($.cookie('leng'), $('#dd optgroup')[i].id);
	}	
}
</script>