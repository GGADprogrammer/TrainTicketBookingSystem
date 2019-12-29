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

<title>车票信息查询</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>layui/css/layui.css">
<link rel="stylesheet" href="css/public.css" media="all">
<%-- <script type="text/javascript" src="<%=basePath %>js/layui.all.js"></script> --%>
<link rel="stylesheet" href="css/layuimini.css" media="all">
<script src="<%=basePath%>layui/layui.all.js"></script>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/cstype.css">
<link href="<%=basePath%>css/jquery.ui.core.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/jquery.ui.datepicker.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/jquery.ui.theme.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/mytable.css">
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.ui.core.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery.ui.datepicker.js"></script>
<script type="text/javascript">
	//查询
	function hpbt(id, flgs) {
		<c:if test="${empty userid}">
		alert("请登录.");
		</c:if>
		<c:if test="${not empty userid}">
		$.ajax({
			url : 'HandlePiaoSvlt',
			type : 'post',
			data : {
				"idi" : id,
				"flgs" : flgs
			},
			dataType : 'json',
			success : function(data) {
				alert(data.msg);
				if (data.dt == 1) {
					window.location.href = "Init?flgs=1&tname=dpiao";
				}
			}
		});
		</c:if>
	}
	window.onload = function() {
		$("#con").css("height", $(document).height() - 185);
	}
</script>

</head>

<body>
	<center>
		<table cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td id="con" align="center" valign="top"
					style="color:#3f3f3f;padding-top: 10px;background-image: url('<%=basePath%>img/bj.jpg');">
					<table>
						<tr>
							<td align="center" style="font-weight: bold; width: 1000px;">
								订票信息列表
								<hr>
							</td>
						</tr>
						<tr>
							<td align="center" valign="top">
								<div id="nrdiv">
								    <table class="layui-table" lay-even="" lay-skin="row">
										<colgroup>
											<col width="80px">
											<col width="80px">
											<col width="100px">
											<col width="100px">
											<col width="80px">
											<col width="60px">
											<col width="100px">
											<col width="100px">
											<col width="100px">
											<col width="80">
											<col width="80">
										</colgroup>
										<thead>
											<tr>
												<th><center>车次</center></th>
												<th><center>火车类型</center></th>
												<th><center>始发站</center></th>
												<th><center>终点站</center></th>
												<th><center>发车时间</center></th>
												<th><center>票价</center></th>
												<th><center>车厢座号</center></th>
												<th><center>车票类型</center></th>
												<th><center>有效时间</center></th>
												<th><center>状态</center></th>
												<th><center>操作</center></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="a" items="${alist}">
												<tr>
													<td>${a.tname }</td>
													<td>${a.traintype }</td>
													<td>${a.szdname}</td>
													<td>${a.ezdname }</td>
													<td>${a.stime }</td>
													<td>${a.pval }</td>
													<td>${a.cxzh }</td>
													<td>${a.ptype }</td>
													<td>${a.yxsj }</td>
													<td>${a.lyflag }</td>
												
													<td><center>
															<a  class="layui-btn layui-btn-xs layui-btn-danger data-count-delete"
																href="javascript:delbt('${ac.id }');">删除</a>
														</center></td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
									<%-- <table border="0" cellpadding="0" cellspacing="0"
										class="mytable">
										<tr>
											<td colspan="11" align="center"></td>
										</tr>
										<c:if test="${not empty alist}">
											<tr bgcolor="#4a4a4a">
												<!-- 
	    									<td width="50px"  style="color:white;">ID</td>
	    									 -->
												<th width="80px" style="color: white;">车次</th>
												<th width="80px" style="color: white;">火车类型</th>
												<th width="100px" style="color: white;">始发站</th>
												<th width="100px" style="color: white;">终点站</th>
												<th width="80px" style="color: white;">发车时间</th>
												<th width="60px" style="color: white;">票价</th>
												<th width="100px" style="color: white;">车厢座号</th>
												<th width="100px" style="color: white;">车票类型</th>
												<th width="100px" style="color: white;">有效时间</th>
												<th width="80px" style="color: white;">状态</th>
												<th style="color: white;">操作</th>
											</tr>
										</c:if>
										<!-- 
    								 -->
										<c:forEach var="a" items="${alist}">
											<tr>
												<!-- 
    										<td width="50px"  >${a.id }</td>
    										 -->
												<td width="80px">${a.tname }</td>
												<td width="80px">${a.traintype }</td>
												<td width="100px">${a.szdname}</td>
												<td width="100px">${a.ezdname }</td>
												<td width="80px">${a.stime }</td>
												<td width="60px">${a.pval }</td>
												<td width="100px">${a.cxzh }</td>
												<td width="100px">${a.ptype }</td>
												<td width="100px">${a.yxsj }</td>
												<td width="100px">${a.lyflag }</td>
												<td><a class="layui-btn layui-btn-xs data-count-edit"
													href="javascript:hpbt('${a.id}','del');">删除</a></td>
												<td>
	    										<input type="button" value="删除" onclick="hpbt('${a.id}','del');" onmouseover="this.style.backgroundColor='red';" onmouseout="this.style.backgroundColor='';"/>
    										</td>
											</tr>
										</c:forEach>
									</table> --%>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<div style="display: none;">
			<form id="ckf" action="CusCkSvlt" method="post">
				<input type="hidden" id="sql" name="sql" value="" /> <input
					type="hidden" id="flgs" name="flgs" value="1" />
			</form>
		</div>
	</center>
</body>
</html>