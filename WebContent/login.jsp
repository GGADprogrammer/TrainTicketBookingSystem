<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<title>ChinaZ</title>
		<link href="css/style1.css" rel='stylesheet' type='text/css' />
		<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
		<script src="js/must.js" type="text/javascript"></script>
		<script type="text/javascript">
		    function rgcheck() {
		        var idcard = $("#rgidcard").val();
		        var password = $("#rgpassword").val();
		        var sname=$("#rgsname").val();
		        if (idcard == "" || password == ""||sname=="") {
		            alert("请输入完整的个人信息。");
		            return false;
		        }
		        $.ajax({
		        	url:'RegSvlt',
		        	type:'post',
		        	data:{rgidcard:idcard,rgpassword:password,rgsname:sname},
		        	dataType:'json',
		        	success:function(data){
		        		alert(data.msg);
		        	}
		        });
		        return true;
		    }
		    
			function lgtj(){
				
				var name=$("#lguname").val();
				var password=$("#lgupassword").val();
				/*alert(name+password);*/
				if(name==""||password==""){
					alert("账号和密码都不能为空。");
					return;
				}
				/*window.location.href="index.jsp";*/
				$.ajax({
					url:'LoginSvlt',
					data:{uname:name,upassword:password,utype:'cus'},
					type:'post',
					dataType:'json',
					success:function(data){
						if(data.msg==1){
							window.location.href="/hcdpSys/index.jsp";
						}else{
							alert(data.msg);
						}
					}
				});
			}
			function lgbt(){
		    	var un=$("#uname").val();
		    	var up=$("#upassword").val();
		    	if(un==""||up==""){
		    		alert("请输入账号密码.");
		    		return;
		    	}
		    	var ut=$("#utype").val();
		    	$.ajax({
		    		url:'LoginSvlt',
		    		type:'post',
		    		data:{uname:un,upassword:up,utype:ut},
		    		dataType:'json',
		    		success:function(data){
		    			if(data.msg==1){
		    				window.location.href="<%=basePath%>Back2.jsp";
		    			}else{
		    				alert(data.msg);
		    			}
		    		}
		    	});
		    }
		</script>
	</head>
	<body>

		
		<div class="app-location" id="d1">
			<h2>Welcome To TianXun</h2>
			<div class="line"><span></span></div>
			<div class="location"><img src="images/login5.png" class="img-responsive" alt="" /></div>
			<form class="denglu">

				<input type="text" id="lguname" class="required" value="身份证号码" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '身份证号码';}">
				<input type="password" id="lgupassword" class="required" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
				<div class="submit"><input type="button" onclick="lgtj();" value="Sign in"></div>

				<div class="new">
					<h3><a href="#">Reset your input</a></h3>
					<h4 id="ht"><a href="#">New here ? Sign Up</a></h4>
					<div class="clear"></div>
				</div>
			</form>
		</div>
		
		
		<div class="app-location" id="d2">
			<h2>Welcome To TianXun</h2>
			<div class="line"><span></span></div>
			<div class="location"><img src="images/login5.png" class="img-responsive" alt="" /></div>
			<form class="denglu">
		
				<form class="zhuce">
					<input type="text" id="rgidcard" class="required2" value="身份证号码" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '身份证号码';}">
					<input type="check" id="rgsname" class="required2" value="真实姓名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '真实姓名';}">
					<input type="password" id="rgpassword" class="required2" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
					<div class="submit"><input type="button" onclick="rgcheck();" value="Sign up"></div>
					
					<div class="new">
						<h4 id="hd"><a href="#">back</a></h4>
						
						
					</div>
				</form>
			</form>
		</div>
		
		<div class="app-location" id="d3">
			<h2>Administrator Mode</h2>
			<div class="line"><span></span></div>
			<div class="location"><img src="images/login5.png" class="img-responsive" alt="" /></div>
			<form class="denglu">
		
				<input type="text" id="uname"  class="required" value="用户名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '用户名';}">
				<input type="password" id="upassword" class="required" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
				<div class="submit"><input type="button" onclick="lgbt();" value="Sign in"></div>
		
				<div class="new">
					<h4 id="hs"><a href="#">back</a></h4>
					<div class="clear"></div>
				</div>
				<input type="hidden" id="utype" value="gly"/>
			</form>
		</div>
		
	</body>
</html>