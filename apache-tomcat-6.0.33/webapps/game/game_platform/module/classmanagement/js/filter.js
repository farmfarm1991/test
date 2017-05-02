function fireSearchAccountAndName() {
	resetSort();
	$.tinysort.defaults.order = 'asc';
	$.tinysort.defaults.case = false;
	var text = $(".search .search_field").val();
	$(".all-person-list li").filter("[account*="+text+"]").css("background","rgba(255,255,255,0.3)").attr("sort","1");
	$(".all-person-list li").filter("[name*="+text+"]").css("background","rgba(255,255,255,0.3)").attr("sort","1");
	$(".all-person-list li").tsort('',{attr:'sort',order:'asc'},'',{attr:'account',order:'asc'});

};
function resetSort() {
	$(".all-person-list li").css("background","rgba(255,255,255,0)").attr("sort","2");
};


