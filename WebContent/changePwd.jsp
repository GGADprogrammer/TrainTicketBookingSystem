<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>修改登录密码</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>layui/css/layui.css">
<link rel="stylesheet" href="css/public.css" media="all">
<%-- <script type="text/javascript" src="<%=basePath %>js/layui.all.js"></script> --%>
<link rel="stylesheet" href="css/layuimini.css" media="all">
<script src="<%=basePath%>layui/layui.all.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript">
	function tjbt() {
		var op = $("#opwd").val();
		var np = $("#npwd").val();
		var dnp = $("#dnpwd").val();
		if (op == "") {
			alert("旧密码不为空。");
			return;
		}
		if (np == "") {
			alert("新密码不能为空。");
			return;
		}
		if (np != dnp) {
			alert("两次密码输入不一致。");
			return;
		}
		$.ajax({
			url : 'ChangePwd',
			type : 'post',
			data : {
				opwd : op,
				npwd : np
			},
			dataType : 'json',
			success : function(data) {
				alert(data.msg);
			}
		});
	}
</script>
</head>

<body>
	<center>
		<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center" style="font-weight: bold;" colspan="2" height="20px" width="40px">
					修改登录密码
					<hr />
				</td>
			</tr>
			
			<tr>
			<td align="center">
				<form class="layui-form layui-form-pane" action="">
				<center>
					<div class="layui-form-item">
						<div >
							<label class="layui-form-label">oldpwd</label>
							<div class="layui-input-inline">
								<input type="text" id="opwd" name="opwd"
									autocomplete="off" class="layui-input">
							</div>
						</div>
						<div >
							<label class="layui-form-label">newpwd</label>
							<div class="layui-input-inline">
								<input type="text" id="npwd" name="npwd"
									autocomplete="off" class="layui-input">
							</div>
						</div>
						<div >
							<label class="layui-form-label" >repeat</label>
							<div class="layui-input-inline">
								<input type="text" id="dnpwd" name="dnpwd" 
									autocomplete="off" class="layui-input">
							</div>
							
						</div>
						
						
					</div>
					<div>
							<a class="layui-btn layui-btn-lg"onclick="tjbt();">提交</a> 
					</div>
					</center>
				</form>
				</td>
				<!-- <td width="150px">输入原密码：</td>
				<td><input type="text" id="opwd" name="opwd" /></td>
			</tr>
			<tr>
				<td colspan="2" height="20px" width="400px">
					<hr />
				</td>
			</tr>
			<tr>
				<td width="150px">输入新密码：</td>
				<td><input type="text" id="npwd" name="npwd" /></td>
			</tr>
			<tr>
				<td colspan="2" height="20px" width="400px">
					<hr />
				</td>
			</tr>
			<tr>
				<td width="150px">再次输入新密码：</td>
				<td><input type="text" id="dnpwd" name="dnpwd" /></td> -->
			<!-- </tr>
			<tr>
				<td colspan="2" height="20px" width="400px">
					<hr />
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2" height="20px" width="400px"><input
					type="button" value="提 交" onclick="tjbt();" /></td> -->
			</tr>
		</table>
	</center>
</body>
</html>
