$(document).ready(function(){
	$("#ht").click(function(){
		$("#d1").hide();
		$("#d2").show();
	});
	
	$("#hd").click(function(){
		$("#d2").hide();
		$("#d1").show();
	});
	
	$("h3").click(function(){
		$("#lguname").val("");
		$("#lgupassword").val("");
	});
	
	$(".img-responsive").click(function(){
		$("#d2").hide();
		$("#d1").hide();
		$("#d3").show();
		/*$("body").css("background","url(../images/back.jpg)");*/
	})
	
	$("#hs").click(function(){
		$("#d1").show();
		$("#d2").hide();
		$("#d3").hide();
	})
});
