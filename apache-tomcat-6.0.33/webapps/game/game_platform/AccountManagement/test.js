else if (fileType == "application/msword" || fileType == "application/vnd.openxmlformats-officedocument.wordprocessingml.document") {
console.log('this is word');
objectID = guid();

myWaitMsg("文件上傳中");
var oMyForm = new FormData();
oMyForm.append('filepath', eachfile);
var oReq = new XMLHttpRequest();
oReq.open("POST", "<%=domain_url%>/service/file/UploadDocFile/?planID="+planID+"&objectID="+objectID, true);
oReq.send(oMyForm);
oReq.addEventListener("loadend", loadDocEnd, false);
function loadDocEnd(e) {
myAlert("文件上傳成功");
var num = parseInt(0+""+e.target.response);
if(num!=0){
for(var i =0; i<num; i++){
var thisimgsrc = "<%=domain_url%>/service/file/pageDatas/"+planID+"/docs/"+objectID+"/img"+i+".png";
$("#fileImgList").append("<div class=\"eachFileImg\">"+
"<img id='"+S4()+"' src="+thisimgsrc+">"+
"</div>");
$('.eachFileImg').draggable({
revert: "invalid",
helper: function (event, ui){
return $($(this).clone()).css('position', 'fixed');
},
});
}
}

}
}