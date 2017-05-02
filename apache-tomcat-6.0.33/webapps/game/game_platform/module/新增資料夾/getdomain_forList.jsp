<%@ page import="java.lang.Integer" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="flex.dao.DBManger" %>
<%@ page import="flex.dao.DBUtils" %>
<%
String schoolID = (String)session.getAttribute("school_id");
String domainIdArray = "";
String domainNameArray = "";
String domainType2Array = "";
String stageArray = "";
String[] stagePostChar = { "", "st", "nd", "rd", "th", "th", "th", "th", "th", "th", "th", "th", "th" };
String[] stageName = {"", "1年級", "2年級", "3年級", "4年級", "5年級", "6年級", "7年級", "8年級", "9年級", "10年級", "11年級", "12年級"};
String data = "";
// 雲端作品庫能篩選所有年級、領域
String filter = request.getParameter("filter");
System.out.println("filter " + filter);

String SQL_get_school_stage = "select * from school_grade_map left join edu_stage on school_grade_map.gradeName = edu_stage.stageID Where school_grade_map.schoolID = ? order by school_grade_map.`order` ";
try {
	DBManger db = DBUtils.getDBManger();
	Connection conn = db.connWrite();
	PreparedStatement pStatement = conn.prepareStatement(SQL_get_school_stage);
	if(filter.equals("1")){
		pStatement.setString(1, "CGES");
	}else{
		pStatement.setString(1, schoolID);
	}	ResultSet rs = pStatement.executeQuery();
	while (rs.next()) {
	System.out.println("data"+rs.getString("grade"));
		if (!stageArray.contains(rs.getString("grade")))
			stageArray = stageArray.concat(rs.getString("grade") + ",");
		data = data.concat(rs.getString("gradeName") + ",");
	}
	pStatement.close();
} catch (SQLException e) {
	e.printStackTrace();
}

String[] gradeName = data.split(",");
for (int i = 0; i < gradeName.length; i++) {
	if (!gradeName[i].equals("")) {
		try {
			DBManger db = DBUtils.getDBManger();
			Connection conn = db.connRead();
			PreparedStatement pStatement = conn
					.prepareStatement("select * from map_domain where map_domain.type2 = ? order by map_domain.`order`");
			pStatement.setString(1, gradeName[i]);
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
				//System.out.println("domainIdArray!!!!!"+domainType2Array);				
			}

			pStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

String olddomainIdArray = "";
String olddomainNameArray = "";
String olddomainType2Array = "";		
try {
			DBManger db = DBUtils.getDBManger();
			Connection conn = db.connRead();
			PreparedStatement pStatement = conn
					.prepareStatement("select * from map_domain where map_domain.type2 = '舊的' order by map_domain.`order`");
			ResultSet rs = pStatement.executeQuery();
			while (rs.next()) {
				String domainID = rs.getString("domain_code");
				String domainName = rs.getString("domain_name");
				String domainType2 = rs.getString("type2");
				if (olddomainIdArray == "" && olddomainNameArray == "") {
					olddomainIdArray = domainID;
					olddomainNameArray = domainName;
					olddomainType2Array = domainType2;
				} else {
					olddomainIdArray = olddomainIdArray + "," + domainID;
					olddomainNameArray = olddomainNameArray + ","
							+ domainName;
					olddomainType2Array = olddomainType2Array + ","
							+ domainType2;
				}
			}
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
<span class="specborder" style="display: none;">
	<select id="years" class="sixfilter" onclick='returnyear(103)'>
		<option value="y%" class='text' id='allyears'>所有年度</option>
		<option value="y105" class='text'></option>
		<!-- <option value="y106" class='text'></option> -->
	</select>
</span>
<span class="specborder" style="display: none;">
	<select id="sOrder" class="sixfilter">
		<option value="s%" class='text' id='allorder'>所有學期</option>
		<option value="s1" class='text' id='1st_order_label'>上學期</option>
		<option value="s2" class='text' id='2nd_order_label'>下學期</option>
	</select>
</span>
<span class="specborder">
	<select id="area" class="sixfilter">
		<option value="a%" class='text' id='allarea'>所有地區</option>
		<option value='1'>北部</option>
		<option value='2'>中部</option>
		<option value='3'>南部</option>
		<option value='4'>東部</option>
		<option value='5'>外島</option>
		<option value='6'>其他</option>
	</select>
</span>
<span class="specborder">
	<select id="city" class="sixfilter">
		<option value="c%" class='text' id='allcity'>所有縣市</option>
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
	}else if(areaType.equals("其他")){
		idName = "Other_label";
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
</span>
<span class="specborder">
	<select id="gradeID" class="sixfilter">
		<option value="g%" class='text' id='allgrade'>所有年級</option>
<%
for(int j = 0; j<stageArray.split(",").length; j++){
	String aa = stageArray.split(",")[j];
	int tempNumber = Integer.parseInt(aa);
	String tempChar = stagePostChar[tempNumber];
	String tempGradeName = stageName[tempNumber];
%>
		<option value="<%=tempNumber%>" class='text' id='<%=tempNumber%><%=tempChar%>_grade_label'><%=tempGradeName%></option><%
}
%>
	</select>
</span>
<span class="specborder">
	<select id="domain" class="sixfilter">
		<option value="t%" class='text' id='alldomain'>所有領域</option>
<%
String preSelected = "";

for(int i = 0; i<domainIdArray.split(",").length; i++){
	String tempID = domainIdArray.split(",")[i];
	String tempName = domainNameArray.split(",")[i];
	String domainType2 = domainType2Array.split(",")[i];
	String idName = "";
	if(domainType2.equals("國小")){
		idName = "Elementary_label";
	}else if(domainType2.equals("國中")){
		idName = "Junior_label";
	}else if(domainType2.equals("高中")){
		idName = "Senior_label";
	}else if(domainType2.equals("高職")){
		idName = "Vocational_label";
	}

	if(preSelected.equals(""))
	{
%>
		<optgroup label="<%=domainType2%>" id="<%=idName%>" class='removeTag'>
<%
	}
	else if(!domainType2.equals(preSelected))
	{
%>
		</optgroup><optgroup label="<%=domainType2%>" id="<%=idName%>" class='removeTag'>
<%
	}
	preSelected = domainType2;
%>
	<option value='<%=tempID%>' class='newDomain text <%=idName%> removeTag' id='<%=tempID%>_label'><%=tempName%></option>
<%
}
%>
	</optgroup>
	</select>
</span>


<script>
if($('#years>option').length>1){
	for(i=1;i<$('#years>option').length;i++){
		var yTemp=returnyear($($('#years>option')[i]).val().split('y')[1]);
		$($('#years>option')[i]).text(yTemp);
	}
}		
function returndom(d,plan_basicinfo_subject) {debugger;
	d = d.replace(/_+/,'');
	switch (d) {
<%
for(int i = 0; i<domainIdArray.split(",").length; i++){
	String tempID = domainIdArray.split(",")[i];
	String tempName = domainNameArray.split(",")[i];
%>
		case "<%=tempID%>": return "<span class='text' id='<%=tempID%>_label'><%=tempName%></span>";<%
}

for(int i = 0; i<olddomainIdArray.split(",").length; i++){
	String tempID = olddomainIdArray.split(",")[i];
	String tempName = olddomainNameArray.split(",")[i];
%>
		case "<%=tempID%>": return "<span class='text' id='<%=tempID%>_label'><%=tempName%></span>";<%
}
%>
		default:	return "<span class='text' >"+plan_basicinfo_subject+"</span>";
	}
}
function returndom(d) {
	d = d.replace(/_+/,'');
	switch (d) {
<%
for(int i = 0; i<domainIdArray.split(",").length; i++){
	String tempID = domainIdArray.split(",")[i];
	String tempName = domainNameArray.split(",")[i];
%>
		case "<%=tempID%>": return "<span class='text' id='<%=tempID%>_label'><%=tempName%></span>";<%
}
%>
<%
for(int i = 0; i<olddomainIdArray.split(",").length; i++){
	String tempID = olddomainIdArray.split(",")[i];
	String tempName = olddomainNameArray.split(",")[i];
%>
		case "<%=tempID%>": return "<span class='text' id='<%=tempID%>_label'><%=tempName%></span>";<%
}
%>
		default:	return "<span class='text' id='alldomain_label'>所有領域</span>";
	}
}
function returngrad(g){
	switch (g) {
<%
for(int i = 0; i<stageArray.split(",").length; i++){
	String aa = stageArray.split(",")[i];
	int tempNumber = Integer.parseInt(aa);
	String tempChar = stagePostChar[tempNumber];
	String tempGradeName = stageName[tempNumber];
%>
		case "<%=tempNumber%>": return "<span class='text' id='<%=tempNumber%><%=tempChar%>_grade_label'><%=tempGradeName%></span>";<%
}
%>
		default:	return "<span class='text' id='allgrade_label'>所有年級</span>";
	}
}

function returnorder(s) {
	switch (s) {
		case "1": return "<span class='text' id='1st_order_label'>上學期</span>";
		case "2": return "<span class='text' id='2nd_order_label'>下學期</span>";
		default:	return "<span class='text' id='allorder_label'>所有學期</span>";
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
</script>
<script>
$(document).ready(function(){
	translateOptgroup();
})
var areaThisSelected = "";
var areaPreSelected = "";
// 地區
$("#area").change(function(){citySelectbindArea()});
var allCityArray = $('#city>optgroup');
function citySelectbindArea(){
	var areaSelectedText = $('#area').val();
	//解決ipad 連動篩選問，將optgroup刪除再新增
	if(areaSelectedText == 'a%'){
		$('#city>optgroup').remove();
		$('#city').append(allCityArray);
		areaThisSelected = 0;

	}else if(["1"].indexOf(areaSelectedText)>-1){

		$('#city>optgroup').remove();
		$('#city').append(allCityArray[0]);
		areaThisSelected = 1;

	}else if(["2"].indexOf(areaSelectedText)>-1){
		$('#city>optgroup').remove();
		$('#city').append(allCityArray[1]);
		areaThisSelected = 2;

	}else if(["3"].indexOf(areaSelectedText)>-1){
		$('#city>optgroup').remove();
		$('#city').append(allCityArray[2]);
		areaThisSelected = 3;

	}else if(["4"].indexOf(areaSelectedText)>-1){
		$('#city>optgroup').remove();
		$('#city').append(allCityArray[3]);
		areaThisSelected = 4;
		
	}else if(["5"].indexOf(areaSelectedText)>-1){
		$('#city>optgroup').remove();
		$('#city').append(allCityArray[4]);
		areaThisSelected = 5;
	}else if(["6"].indexOf(areaSelectedText)>-1){
		$('#city>optgroup').remove();
		$('#city').append(allCityArray[5]);
		areaThisSelected = 6 ;
	}
	
	if(areaPreSelected != areaThisSelected)
	{
		$("#city").val('c%');
	}
	areaPreSelected = areaThisSelected;
	
}
// 年級
var preSelected = "";
var thisSelected = "";
$("#gradeID").change(function(){domainSelectbindGrade()});

var allDomainArray = $('#domain>optgroup');
function domainSelectbindGrade(){debugger;
	var text = $('#gradeID').val();
	for(var i = 0; i < allDomainArray.length ; i++){
		if(text=='g%')
		{
			$('#domain>optgroup').remove();
			$('#domain').append(allDomainArray);
			thisSelected=0;
		}
		else if(["1", "2", "3", "4","5", "6"].indexOf(text)>-1)
		{
			if( allDomainArray[i].id == 'Elementary_label' ){
				$('#domain>optgroup').remove();
				$('#domain').append(allDomainArray[i]);
				thisSelected=1;
			}
		}
		else if(["7", "8", "9"].indexOf(text)>-1)
		{
			if( allDomainArray[i].id == 'Junior_label' ){
				$('#domain>optgroup').remove();
				$('#domain').append(allDomainArray[i]);
				thisSelected=2;
			}
		}
		else if(["10", "11", "12"].indexOf(text)>-1)
		{
			$('#domain>optgroup').remove();
			if( allDomainArray[i].id == 'Senior_label' ){
				$('#domain').append(allDomainArray[i]);
			}
			else if ( allDomainArray[i].id == 'Vocational_label' ){
				if( i != 0 && allDomainArray[i-1].id == 'Senior_label'){
					$('#domain').append(allDomainArray[i-1]);
				}
				$('#domain').append(allDomainArray[i]);
			}
			thisSelected=3;
		}
		// $('#domain').append(allDomainArray[i+1]);
	}
	if(preSelected != thisSelected)
	{
		$("#domain").val('t%');
	}
	preSelected = thisSelected;
}

function ResetFunction(){
	$("#domain").val('t%');
	$("#gradeID").val('g%');   
	$("#years").val('y%');
	$("#sOrder").val('s%');
}

var ifSetDefaultHideAllOption = false;
function SetFunction(unitID){
		console.log(unitID);
		var one = unitID.substring(unitID.indexOf('y'),unitID.indexOf('g'));
		var two = unitID.substring(unitID.indexOf('g'),unitID.indexOf('s'))
		var three = unitID.substring(unitID.indexOf('s'),unitID.indexOf('t'))
		var four = unitID.substring(unitID.indexOf('t'),unitID.indexOf('@'))
	if(!ifSetDefaultHideAllOption)
	{
		$("#years option[id!='allyears']").hide();
		$("#sOrder option[id!='allorder']").hide();
		$("#gradeID option[id!='allgrade']").hide();
		$("#domain option[id!='alldomain']").hide();
		$("#domain").children("optgroup").hide();
		ifSetDefaultHideAllOption=true;
	}
	$("#years option[value='"+one+"']").show();
		$("#sOrder option[value='"+three+"']").show();
		$("#gradeID option[value='"+two+"']").show();
		$("#domain option[value='"+four+"']").removeClass('removeTag').show();	
	$("#domain option[value='"+four+"']").parent().removeClass('removeTag').show();
}
function translateOptgroup(){
	for(i=0;i<$('#domain optgroup').length;i++){
		$('#domain optgroup')[i].label=translate($.cookie('leng'), $('#domain optgroup')[i].id);
	}
}
//以下進入篩選功能
$("#area").change(function(){
	if ($('.choice').attr('id') == 'myGame') {
		showHot = false;
		loadGameData(showHot);
	}else{
		showHot = true;
		loadHotGame(showHot)
	}
	
});

$("#city").change(function(){
	if ($('.choice').attr('id') == 'myGame') {
		showHot = false;
		loadGameData(showHot);
	}else{
		showHot = true;
		loadHotGame(showHot)
	}
});
$("#gradeID").change(function(){
	if ($('.choice').attr('id') == 'myGame') {
		showHot = false;
		loadGameData(showHot);
	}else{
		showHot = true;
		loadHotGame(showHot)
	}
});
$("#domain").change(function(){
	if ($('.choice').attr('id') == 'myGame') {
		showHot = false;
		loadGameData(showHot);
	}else{
		showHot = true;
		loadHotGame(showHot)
	}
});
</script>
