<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>火车订票系统信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/cstype.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>layui/css/layui.css">

<%-- <script type="text/javascript" src="<%=basePath %>js/layui.all.js"></script> --%>
<link rel="stylesheet" href="css/layuimini.css" media="all">
<script src="<%=basePath%>layui/layui.all.js"></script>
</head>
<script type="text/javascript">
function test1(){
	document.getElementById("ifr").contentWindow.location.reload(true);
	document.getElementById("ifr").src="<%=basePath%>Init?flgs=1&tname=traininfo";
		                         
}
function test2(){
	document.getElementById("ifr").contentWindow.location.reload(true);
	document.getElementById("ifr").src="<%=basePath%>Init?flgs=1&tname=zhandian";
		                         
}
function test3(){
	document.getElementById("ifr").contentWindow.location.reload(true);
	document.getElementById("ifr").src="<%=basePath%>Init?flgs=1&tname=initxl";
		                         
}
function test4(){
	document.getElementById("ifr").contentWindow.location.reload(true);
	document.getElementById("ifr").src="<%=basePath%>Init?flgs=1&tname=admin";
		                         
}
function test5(){
	document.getElementById("ifr").contentWindow.location.reload(true);
	document.getElementById("ifr").src="<%=basePath%>Init?flgs=1&tname=cusinfo";
		                         
}
function test6(){
	document.getElementById("ifr").contentWindow.location.reload(true);
	document.getElementById("ifr").src="<%=basePath%>Init?flgs=1&tname=piao";
		                         
}
function test7(){
	document.getElementById("ifr").contentWindow.location.reload(true);
	document.getElementById("ifr").src="<%=basePath%>Init?flgs=1&tname=dpiao";
		                         
}
function test8(){
	document.getElementById("ifr").contentWindow.location.reload(true);
	document.getElementById("ifr").src="<%=basePath%>changePwd.jsp";
		                         
}
</script>
<!--  <img src="images/logo.png" height="75px" width="100px" alt="logo"> -->
<body class="layui-layout-body layuimini-all">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header header">
			<div class="layui-logo">火车票网上订票系统后台</div>
			<ul class="layui-nav layui-layout-right">



				<!-- <li class="layui-nav-item"><a href="login.jsp">回到首页</a></li> -->
				<li class="layui-nav-item layui-this "><a href="javascript:;">管理员</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="<%=basePath%>changePwd.jsp">修改密码</a>
						</dd>
						<dd>
							<a href="<%=basePath%>LogoutSvlt?flag=gly">退出登录</a>
						</dd>
					</dl></li>

			</ul>

		</div>
		<!-- 
	<ul class="layui-nav layui-bg-blue">
		<li class="layui-nav-item"><a href="">艳蓝导航</a></li>
		
			
 -->
		<!-- <table width="100%" height="100%" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="100%">
						<table width="100%" height="100%" border="0" cellspacing="0"
							cellpadding="0" style="background-repeat: repeat-x;">
							<tr>
								<td width="175" height="100%" valign="top">
									<table width="175"
								height="100%" border="0" cellspacing="0" cellpadding="0"> -->
		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll layui-left-menu">
				<ul
					class="layui-nav layui-nav-tree layui-inline layui-left-nav-tree layui-this">
					<!-- lay-filter="demo" -->
					<!-- style="margin-right: 10px;" -->
					<li class="layui-nav-item layui-nav-itemed"><a
						href="javascript:;">基本信息管理</a>
						<dl class="layui-nav-child">
							<dd onclick="test();">
								<a href="<%=basePath%>Init?flgs=1&tname=traininfo" target="page"> 火车信息管理</a>
								<!-- οnclick="ifr.window.location.reload()"  -->
							</dd>
							<dd>
								<a href="<%=basePath%>Init?flgs=1&tname=zhandian" target="page">站点信息管理</a>
							</dd>
							<dd>
								<a href="<%=basePath%>Init?flgs=1&tname=initxl" target="page">线路信息管理</a>
							</dd>

						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">用户信息管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="<%=basePath%>Init?flgs=1&tname=admin" target="page">管理员信息管理</a>
							</dd>
							<dd>
								<a href="<%=basePath%>Init?flgs=1&tname=cusinfo" target="page">旅客信息管理</a>
							</dd>

						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">车票信息管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="<%=basePath%>Init?flgs=1&tname=piao" target="page">车票信息管理</a>
							</dd>
							<dd>
								<a href="<%=basePath%>Init?flgs=1&tname=dpiao" target="page">订票信息管理</a>
							</dd>
						</dl></li>

				</ul>
			</div>
		</div>
		<div class="layui-body">
			<iframe id="ifr" src="<%=basePath%>Init?flgs=1&tname=admin"
				width="100%" height="100%" frameborder="0" scrolling="yes"
				name="page"> </iframe>
		</div>
		<!-- </td> -->
		<!-- 	</tr>
						</table>
					</td>
				</tr>
			</table> -->
		<%-- <table>
	 <tr>
	 
	

	<p class="layui-elem-quote">其实就是自定义了个“|”的分隔符，然后最后一项也可以点。</p> --%>
	</div>
	<script src="<%=basePath%>layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		layui.use('element', function() {
			var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

			//监听导航点击
			element.on('nav(demo)', function(elem) {
				//console.log(elem)
				layer.msg(elem.text());
			});
		});
	</script>
</body>
</html>


