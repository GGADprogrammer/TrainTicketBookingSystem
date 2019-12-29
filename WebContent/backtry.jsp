
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>车票信息查询</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>css/cstype.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>WEB-INF/lib/layui/css/layui.css">

<%-- <script type="text/javascript" src="<%=basePath %>js/layui.all.js"></script> --%>

<script src="<%=basePath %>WEB-INF/lib/layui/layui.all.js"></script>

</head>

<body>
	
	<ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo"
		style="margin-right: 10px;">
		<li class="layui-nav-item layui-nav-itemed"><a
			href="javascript:;">默认展开</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="javascript:;">选项一</a>
				</dd>
				<dd>
					<a href="javascript:;">选项二</a>
				</dd>
				<dd>
					<a href="javascript:;">选项三</a>
				</dd>
				<dd>
					<a href="">跳转项</a>
				</dd>
			</dl></li>
		<li class="layui-nav-item"><a href="javascript:;">解决方案</a>
			<dl class="layui-nav-child">
				<dd>
					<a href="">移动模块</a>
				</dd>
				<dd>
					<a href="">后台模版</a>
				</dd>
				<dd>
					<a href="">电商平台</a>
				</dd>
			</dl></li>
		<li class="layui-nav-item"><a href="">云市场</a></li>
		<li class="layui-nav-item"><a href="">社区</a></li>
	</ul>

	

</body>
</html>


