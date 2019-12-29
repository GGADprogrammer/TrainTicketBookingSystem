<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%if(request.getAttribute("vip")==null)request.getRequestDispatcher("/CkVipSvlt").forward(request, response); %>
<!DOCTYPE html>
<html>
<head>
<title>Train</title>

<script type="application/x-javascript">
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 




</script>
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="css/style3.css" type="text/css" rel="stylesheet" media="all">
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" />
<link type="text/css" rel="stylesheet" href="css/JFFormStyle-1.css" />

<script src="js/jquery.min.js"></script>
<script src="js/modernizr.custom.js"></script>
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet">
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>


<script src="js/menu_jquery.js"></script>
<script defer src="js/jquery.flexslider.js"></script>
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
<script src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="/js/jquery.form.js"></script>
<!-- <script type="text/javascript" src="/js/jquery-1.8.0.min.js"></script>  -->
<script type="text/javascript" src="/js/jquery-1.8.0.min.js"></script>

<script async src="js/flatpickr.js"></script>
<link rel="stylesheet" id=cal_style type="text/css"
	href="css/flatpickr.min.css">

<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,700,500italic,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>


<script type="text/javascript">
	$(document).ready(
			function() {
				$('#horizontalTab').easyResponsiveTabs({
					type : 'default',
					width : 'auto',
					fit : true
				});
				document.getElementById("ckyxsj").flatpickr({
					minDate : "today",
					dateFormat: "Y.m.d",
				});

				document.getElementById("dateFormatComposer").addEventListener(
						"keyup",
						function(e) {
							formatOutput.textContent = fpInstance.formatDate(
									e.target.value, now);
						});

			});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#horizontalTab').easyResponsiveTabs({
			type : 'default',
			width : 'auto',
			fit : true
		});
	});
	function openwin() { 
		window.open ("changePwd.jsp", "newwindow", "height=300, width=400, top=250 , left=500, toolbar=no,menubar=no, scrollbars=no, resizable=no, location=no, status=no") 
		//写成一行 
	} 
</script>

<!--//pop-up-->
<script type="text/javascript">
	$(function() {
		SyntaxHighlighter.all();
	});
	$(window).load(function() {
		$('.flexslider').flexslider({
			animation : "slide",
			start : function(slider) {
				$('body').removeClass('loading');
			}
		});
	});
</script>

<script type="text/javascript">


	//查询
	function cktj() {
		
		var saddr = $("#cksaddr").val();
		var eaddr = $("#ckeaddr").val();
		var yxsj = $("#ckyxsj").val();
		if (saddr == "" || eaddr == "" || yxsj == "") {
			alert("请输入正确的查询信息");
			return;
		}

		//当前时间
		var ndate = new Date();
		var sj = yxsj.replace(/\./g, "/");
		//用户所选时间
		var cdate = new Date(sj);
		if (ndate > cdate) {
			$("#ckyxsj").val("");
			alert("请选择正确的时间");
			return;
		}
		var sqls = "select tmp.*,zdname as eaddr,tname,traintype from (select piao.*,zdname as saddr from piao,zhandian where piao.szdid=zhandian.id and yxsj='"
				+ yxsj
				+ "' and zdname like '%"
				+ saddr
				+ "%') tmp,zhandian,traininfo where tmp.tid=traininfo.id and tmp.ezdid=zhandian.id and zdname like '%"
				+ eaddr + "%' and tmp.id not in(select pid from dpiao)";
		/* alert(sqls); */
		$("#sql").val(sqls);

		<%-- document.getElementById("mainf").src="<%=basePath%>CusCkSvlt?sql=sqls&flgs=1";  --%>
	    $("#ckf").submit();
	    
	/* 	name="sql" value="" /> <input
							type="hidden" id="flgs" name="flgs" value="1" */
	<%-- 	document.getElementById("mainf").contentWindow.location.reload(true);
		document.getElementById("mainf").src="<%=basePath%>CusCkSvlt?sql=sqls"; --%>
			<%-- "<%=basePath%>Init?flgs=1&tname=admin"; --%>
	}
	function dpbt(pid) {
		if (pid == "" || pid == null) {
			return;
		}
		<c:if test="${empty userid}">
		alert("请登录.");
		</c:if>
		<c:if test="${not empty userid}">
		$.ajax({
			type : 'post',
			url : 'DpSvlt',
			data : {
				"pid" : pid
			},
			dataType : 'json',
			success : function(data) {
				if (data.msg == 1) {
					alert("订票成功。");
					window.location.href = "CusCkSvlt";
				} else {
					alert(data.msg);
				}
			}
		});
		</c:if>
	}
	window.onload = function() {
		$("#con").css("height", $(document).height() - 185);
	}
	/***
	 **/
	$(function() {
		$("#ckyxsj").datepicker();
	});
	
	function beVip(){
		var userid=$("#userid").val();
		if (userid != "") {
			alert("确认加入会员");
			$.ajax({
				url : 'RegMember',
				type : 'post',
				data : {
					userid :userid,
					level:"1"
				},
				dataType : 'json',
				success : function(data) {
					if (data.msg == 1) {
						window.location.href = "/hcdpSys/index.jsp";
						alert("恭喜你成为黄金会员！");
					} else {
						alert(data.msg);
					}
				}
			});

		}
	}
	
	function upLevel(){
		var userid=$("#userid").val();
		if (userid != "") {
			alert("确认加入会员");
			$.ajax({
				url : 'RegMember',
				type : 'post',
				data : {
					userid :userid,
					level:"2"
				},
				dataType : 'json',
				success : function(data) {
					if (data.msg == 1) {
						window.location.href = "/hcdpSys/index.jsp";
						alert("恭喜你成为白金会员！");
					} else {
						alert(data.msg);
					}
				}
			});

		}
	}
</script>
</head>
<body>

	<!--header-->
	<div class="header">
		<div class="container">
			<div class="header-grids">
				<div class="logo">
					<h1>
						<a href="index.html"><span>Train</span>System</a>
					</h1>
				</div>
				<!--navbar-header-->
				<!--提交查询  -->
				<!-- HAOQIGUAIAAAAA -->
				<div style="display: none;">
					<form id="ckf" action="CusCkSvlt" method="post" target="mainf">
						<!-- enctype="multipart/form-data" οnsubmit="return saveReport();" -->

						<input type="hidden" id="sql" name="sql" value="" /> <input
							type="hidden" id="flgs" name="flgs" value="1" />

					</form>
				</div>
				<iframe height="0px" width="0px" name="myframe" id="myframe"></iframe>

				<div class="header-dropdown">
					<div class="emergency-grid">
					<input type="hidden" id="userid" name="userid" value="${userid}"/>
						<ul>
						<li>欢迎您，&nbsp;</li>
							<li style="text-shadow: .2rem 0rem .5rem yellow,-.2rem 0rem .5rem yellow,0rem .2rem .5rem yellow,0rem -.2rem .5rem yellow;"><c:if test="${vip eq '普通用户'}">${vip} <button onclick="beVip()">加入会员</button>
							</c:if>
							<c:if test="${vip eq '黄金会员'}">${vip} <button onclick="upLevel()">升级白金会员</button>
							</c:if>
							<c:if test="${vip eq '白金会员'}">${vip} 
							</c:if>
							
							</li>
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="nav-top">
				<div class="top-nav">
					<span class="menu"><img src="images/menu.png" alt="" /></span>
					<ul class="nav1">
						<c:if test="${!empty userid}">
							<li class="active"><a href="index.jsp">查询</a></li>
							<li><a class="tp2" target="mainf" href="DpListSvlt">订单管理</a></li>


						</c:if>
					</ul>
					<div class="clearfix"></div>
					<script>
						$("span.menu").click(function() {
							$("ul.nav1").slideToggle(300, function() {
								// Animation complete.
							});
						});
					</script>

				</div>
				<div class="dropdown-grids">
					<div id="loginContainer">

						<c:if test="${empty userid}">
							<BR />
							 <a class="tp2" href="InitLoginSvlt?sflag=0"><span>登录</span></a> 


						</c:if>
						<c:if test="${!empty userid}">

							 <a class="tp2" href="LogoutSvlt?flag=cus"><span>注销</span></a> 
						</c:if>
					</div>




				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--//header-->
	<!-- banner -->
	<div class="banner trains-banner">
		<!-- container -->
		<div class="container">
			<div class="col-md-4 banner-left">
				<section class="slider2">
					<div class="flexslider">
						<ul class="slides">
							<li>
								<div class="slider-info">
									<img src="images/5.jpg" alt="">
								</div>
							</li>
							<li>
								<div class="slider-info">
									<img src="images/6.jpg" alt="">
								</div>
							</li>
							<li>
								<div class="slider-info">
									<img src="images/7.jpg" alt="">
								</div>
							</li>
							<li>
								<div class="slider-info">
									<img src="images/8.jpg" alt="">
								</div>
							</li>
							<li>
								<div class="slider-info">
									<img src="images/6.jpg" alt="">
								</div>
							</li>
						</ul>
					</div>
				</section>
				<!--FlexSlider-->
			</div>
			<div class="col-md-8 banner-right">
				<div class="sap_tabs">
					<div class="booking-info about-booking-info">
						<h2>Train Tickets Online</h2>
					</div>
					<div id="horizontalTab"
						style="display: block; width: 100%; margin: 0px;">
						<!---->
						<div class="facts about-facts train-facts">
							<div class="booking-form train-form">
								<link rel="stylesheet" href="css/jquery-ui.css" />
								<!---strat-date-piker---->
								<script>
									$(function() {
										$("#datepicker,#datepicker1")
												.datepicker();
									});
								</script>
								<!---/End-date-piker---->
								<!-- Set here the key for your domain in order to hide the watermark on the web server -->

								<div class="online_reservation">
									<div class="b_room">
										<div class="booking_room">
											<div class="reservation">
												<ul>
													<li class="span1_of_1 desti">
														<h5>出发地</h5>
														<div class="book_date">
															<form>
																<span class="glyphicon glyphicon-map-marker"
																	aria-hidden="true"></span> <input type="text"
																	placeholder=""
																	class="typeahead1 input-md form-control tt-input"
																	id="cksaddr" name="cksaddr">
															</form>
														</div>
													</li>
													<li class="span1_of_1 left desti">
														<h5>目的地</h5>
														<div class="book_date">

															<span class="glyphicon glyphicon-map-marker"
																aria-hidden="true"></span> <input type="text"
																placeholder=""
																class="typeahead1 input-md form-control tt-input"
																id="ckeaddr" name="ckeaddr" />

														</div>
													</li>
													<div class="clearfix"></div>
												</ul>
											</div>
											<div class="reservation">
												<ul>
													<li class="span1_of_1">
														<h5>时期</h5>
														<div class="book_date">


															<input placeholder=""
																class="typeahead1 input-md form-control tt-input"
																id="ckyxsj" name="ckyxsj" />

														</div>
													</li>

													<div class="clearfix"></div>
												</ul>
											</div>
											<div class="reservation">
												<ul>
													<li class="span1_of_3">
														<div class="date_btn">

															<input type="button" value="查  询" onclick="cktj();" />

														</div>
													</li>
													<div class="clearfix"></div>
												</ul>
											</div>
										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								<!---->
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<!-- //container -->
	</div>
	<!-- //banner -->
	<div class="move-text">
		<div class="marquee">
			欢迎使用第八组的火车订票系统<a href="signup.html">Here</a>
		</div>
		<script type="text/javascript" src="js/jquery.marquee.min.js"></script>
		<script>
			$('.marquee').marquee({
				pauseOnHover : true
			});
			//@ sourceURL=pen.js
		</script>
	</div>

	<!--iframe  -->
	<iframe height="570px" width=100% style="background-color: #f4f7f9;"
		id="mainf" name="mainf" src="CusCkSvlt" frameborder="0"
		style="margin: 0;padding: 0;width: 100%;height:100%; min-width: 600px;min-height: 500px;"></iframe>
	<!-- banner-bottom -->


	<div class="banner-bottom">
		<!-- container -->
		<div class="container">
			<div class="banner-bottom-info">
				<h3>Today's Top Deals</h3>
			</div>
			<div class="banner-bottom-grids">
				<div class="col-md-4 banner-bottom-grid">
					<div class="banner-bottom-middle">
						<a href="products.html"> <img src="images/train1.jpg" alt="">
							<div class="destinations-grid-info tours">
								<h5>Book your next Malaysia holiday!</h5>
								<p>Integer eget aliquam nibh. Donec blandit volutpat libero
									id lacinia</p>
								<p class="b-period">Book Period: Now - 7 September 2015 |
									Travel Period: Now - 31 October 2015</p>
							</div>
						</a>
					</div>
					<div class="choose">
						<div class="choose-info">
							<h4>Why Choose Us</h4>
						</div>
						<div class="choose-grids">
							<div class="choose-grids-info">
								<div class="choose-left">
									<h5>09</h5>
									<span>Million</span>
								</div>
								<div class="choose-right">
									<a href="single.html">Aliquam faucibus vehicula vulputate</a>
									<p>Maecenas euismod tortor a tristique convallis diam eros
										aliquam.</p>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="choose-grids-info">
								<div class="choose-left">
									<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
								</div>
								<div class="choose-right">
									<a href="single.html">Sed tincidunt consectetur augue</a>
									<p>Nulla bibendum libero in nunc eleifend tincidunt.
										Aliquam quis molestie lectus</p>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="choose-grids-info">
								<div class="choose-left">
									<h6>$</h6>
								</div>
								<div class="choose-right">
									<a href="single.html">Nullam et arcu interdum, accumsan
										justo</a>
									<p>Maecenas dapibus eu purus vel imperdiet. Maecenas
										cursus, arcu sed tempus</p>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 banner-bottom-grid">
					<div class="top-destinations-info">
						<h4>Railways Quick Links</h4>
					</div>
					<div class="customer-grid">
						<ul>
							<li><a href="#">Lorem ipsum dolor sit amet consectetur</a></li>
							<li><a href="#">Phasellus dignissim massa nisl et
									elementum</a></li>
							<li><a href="#">Aliquam suscipit diam eget dolor dapibus</a></li>
							<li><a href="#">Duis iaculis tristique mauris a aliquam</a></li>
							<li><a href="#"> Vestibulum porta lobortis risus quis
									egestas</a></li>
							<li><a href="#">Lorem ipsum dolor sit amet</a></li>
						</ul>
					</div>
					<div class="top-destinations-grids">
						<div class="top-destinations-info">
							<h4>Top Destinations</h4>
						</div>
						<div class="top-destinations-bottom">
							<div class="td-grids">
								<div class="col-xs-3 td-left">
									<img src="images/t1.jpg" alt="">
								</div>
								<div class="col-xs-7 td-middle">
									<a href="single.html">Donec libero id lacinia</a>
									<p>Dapibus eu purus vel libero in nunc</p>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</div>
								<div class="col-xs-2 td-right">
									<p>$190</p>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="td-grids">
								<div class="col-xs-3 td-left">
									<img src="images/t2.jpg" alt="">
								</div>
								<div class="col-xs-7 td-middle">
									<a href="single.html">Donec libero id lacinia</a>
									<p>Dapibus eu purus vel libero in nunc</p>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</div>
								<div class="col-xs-2 td-right">
									<p>$213</p>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="td-grids">
								<div class="col-xs-3 td-left">
									<img src="images/t3.jpg" alt="">
								</div>
								<div class="col-xs-7 td-middle">
									<a href="single.html">Donec libero id lacinia</a>
									<p>Dapibus eu purus vel libero in nunc</p>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</div>
								<div class="col-xs-2 td-right">
									<p>$176</p>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="td-grids">
								<div class="col-xs-3 td-left">
									<img src="images/t4.jpg" alt="">
								</div>
								<div class="col-xs-7 td-middle">
									<a href="single.html">Donec libero id lacinia</a>
									<p>Dapibus eu purus vel libero in nunc</p>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
								</div>
								<div class="col-xs-2 td-right">
									<p>$490</p>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 banner-bottom-grid">
					<div class="top-destinations-info">
						<h4>Customer Services</h4>
					</div>
					<div class="customer-grid">
						<div class="customer-left-grid">
							<div class="c-left-grids">
								<div class="c-left">
									<span class="glyphicon glyphicon-print" aria-hidden="true"></span>
								</div>
								<div class="c-right">
									<a href="#">Print E-Ticket</a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="c-left-grids">
								<div class="c-left">
									<span class="glyphicon glyphicon-road" aria-hidden="true"></span>
								</div>
								<div class="c-right">
									<a href="#">Road Status</a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="c-left-grids">
								<div class="c-left">
									<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
								</div>
								<div class="c-right">
									<a href="#">Manage Bookings</a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="c-left-grids">
								<div class="c-left">
									<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
								</div>
								<div class="c-right">
									<a onclick="openwin();">Change Password!</a>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="customer-left-grid">
							<div class="c-left-grids">
								<div class="c-left">
									<span class="glyphicon glyphicon-remove-circle"
										aria-hidden="true"></span>
								</div>
								<div class="c-right">
									<a href="#">Cancellation</a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="c-left-grids">
								<div class="c-left">
									<span class="glyphicon glyphicon-question-sign"
										aria-hidden="true"></span>
								</div>
								<div class="c-right">
									<a href="faqs.html">FAQs</a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="c-left-grids">
								<div class="c-left">
									<span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span>
								</div>
								<div class="c-right">
									<a href="#">Complaints</a>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="c-left-grids">
								<div class="c-left">
									<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
								</div>
								<div class="c-right">
									<a href="contact.html">Contact</a>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="news-grids">
						<div class="news-grids-info">
							<h4>Our Advantages</h4>
						</div>
						<div class="news-grids-bottom">
							<!-- date -->
							<div id="design" class="date">
								<div id="cycler">
									<div class="date-text"
										style="overflow: hidden; display: block; height: 2.79634272674464px; margin-top: 0px; margin-bottom: 0.575717620212133px; padding-top: 0px; padding-bottom: 0px;">
										<a href="single.html">July 08,2015</a>
										<p>Nullam non turpis sit amet metus tristique egestas et
											et orci.</p>
									</div>
									<div class="date-text"
										style="overflow: hidden; display: block;">
										<a href="single.html">February 15,2015</a>
										<p>Duis venenatis ac ipsum vel ultricies in placerat quam</p>
									</div>
									<div class="date-text"
										style="overflow: hidden; display: block;">
										<a href="single.html">January 15,2015</a>
										<p>Pellentesque ullamcorper fringilla ipsum, ornare
											dapibus velit volutpat sit amet.</p>
									</div>
									<div class="date-text"
										style="overflow: hidden; display: block;">
										<a href="single.html">September 24,2014</a>
										<p>In lobortis ipsum mi, ac imperdiet elit pellentesque
											at.</p>
									</div>
									<div class="date-text"
										style="overflow: hidden; display: block;">
										<a href="single.html">August 15,2015</a>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit.</p>
									</div>
								</div>
								<script>
									function cycle($item, $cycler) {
										setTimeout(cycle, 2000, $item.next(),
												$cycler);

										$item.slideUp(1000, function() {
											$item.appendTo($cycler).show();
										});

									}
									cycle($('#cycler div:first'), $('#cycler'));
								</script>
							</div>
							<!-- //date -->
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- //container -->
	</div>
	<!-- //banner-bottom -->
	<!-- footer -->
	<div class="footer">
		<!-- container -->
		<div class="container">
			<div class="footer-top-grids">
				<div class="footer-grids">
					<div class="col-md-3 footer-grid">
						<h4>Our Products</h4>
						<ul>
							<li><a href="index.html">Flight Schedule</a></li>
							<li><a href="flights-hotels.html">City Airline Routes</a></li>
							<li><a href="index.html">International Flights</a></li>
							<li><a href="hotels.html">International Hotels</a></li>
							<li><a href="bus.html">Bus Booking</a></li>
							<li><a href="index.html">Domestic Airlines</a></li>
							<li><a href="holidays.html">Holidays Trip</a></li>
							<li><a href="hotels.html">Hotel Booking</a></li>
						</ul>
					</div>
					<div class="col-md-3 footer-grid">
						<h4>Company</h4>
						<ul>
							<li><a href="about.html">About Us</a></li>
							<li><a href="faqs.html">FAQs</a></li>
							<li><a href="terms.html">Terms &amp; Conditions</a></li>
							<li><a href="privacy.html">Privacy </a></li>
							<li><a href="contact.html">Contact Us</a></li>
							<li><a href="#">Careers</a></li>
							<li><a href="blog.html">Blog</a></li>
							<li><a href="booking.html">Feedback</a></li>
						</ul>
					</div>
					<div class="col-md-3 footer-grid">
						<h4>Travel Resources</h4>
						<ul>
							<li><a href="holidays.html">Holidays Packages</a></li>
							<li><a href="weekend.html">Weekend Getaways</a></li>
							<li><a href="index.html">International Airports</a></li>
							<li><a href="index.html">Domestic Flights Booking</a></li>
							<li><a href="booking.html">Customer Support</a></li>
							<li><a href="booking.html">Cancel Bookings</a></li>
							<li><a href="booking.html">Print E-tickets</a></li>
							<li><a href="booking.html">Customer Forums</a></li>
							<li><a href="booking.html">Make a Payment</a></li>
							<li><a href="booking.html">Complete Booking</a></li>
							<li><a href="booking.html">Assurance Claim</a></li>
							<li><a href="booking.html">Retail Offices</a></li>
						</ul>
					</div>
					<div class="col-md-3 footer-grid">
						<h4>More Links</h4>
						<ul class="chf_footer_list">
							<li><a href="#">Flights Discount Coupons</a></li>
							<li><a href="#">Domestic Airlines</a></li>
							<li><a href="#">Indigo Airlines</a></li>
							<li><a href="#">Air Asia</a></li>
							<li><a href="#">Jet Airways</a></li>
							<li><a href="#">SpiceJet</a></li>
							<li><a href="#">GoAir</a></li>
							<li><a href="#">Air India</a></li>
							<li><a href="#">Domestic Flight Routes</a></li>
							<li><a href="#">Indian City Flight</a></li>
							<li><a href="#">Flight Sitemap</a></li>
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- news-letter -->
				<div class="news-letter">
					<div class="news-letter-grids">
						<div class="col-md-4 news-letter-grid">
							<p>
								Toll Free No : <span>1234-5678-901</span>
							</p>
						</div>
						<div class="col-md-4 news-letter-grid">
							<p class="mail">
								Email : <a href="mailto:info@example.com">mail@example.com</a>
							</p>
						</div>
						<div class="col-md-4 news-letter-grid">
							<form>
								<input type="text" value="Email" onfocus="this.value = '';"
									onblur="if (this.value == '') {this.value = 'Email';}"
									required=""> <input type="submit" value="Subscribe">
							</form>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<!-- //news-letter -->
			</div>
		</div>
		<!-- //container -->
	</div>
	<!-- //footer -->
	<div class="footer-bottom-grids">
		<!-- container -->
		<div class="container">
			<div class="footer-bottom-top-grids">
				<div class="col-md-4 footer-bottom-left">
					<h4>Download our mobile Apps</h4>
					<div class="d-apps">
						<ul>
							<li><a href="#"><img src="images/app1.png" alt="" /></a></li>
							<li><a href="#"><img src="images/app2.png" alt="" /></a></a></li>
							<li><a href="#"><img src="images/app3.png" alt="" /></a></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-4 footer-bottom-left">
					<h4>We Accept</h4>
					<div class="a-cards">
						<ul>
							<li><a href="#"><img src="images/c1.png" alt="" /></a></li>
							<li><a href="#"><img src="images/c2.png" alt="" /></a></a></li>
							<li><a href="#"><img src="images/c3.png" alt="" /></a></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-4 footer-bottom-left">
					<h4>Follow Us</h4>
					<div class="social">
						<ul>
							<li><a href="#" class="facebook"> </a></li>
							<li><a href="#" class="facebook twitter"> </a></li>
							<li><a href="#" class="facebook chrome"> </a></li>
							<li><a href="#" class="facebook dribbble"> </a></li>
						</ul>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="copyright">
					<p>
						Copyright &copy; 2015.Company name All rights reserved.<a
							target="_blank" href="http://www.moobnn.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<script defer src="js/jquery.flexslider.js"></script>
	<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
	<script src="js/jquery-ui.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript">
		$(function() {
			SyntaxHighlighter.all();
		});
		$(window).load(function() {
			$('.flexslider').flexslider({
				animation : "slide",
				start : function(slider) {
					$('body').removeClass('loading');
				}
			});
		});
		function saveReport() { 
			// jquery 表单提交 
			$("#ckf").ajaxSubmit(function(message) { 
			// 对于表单提交成功后处理，message为提交页面saveReport.htm的返回内容 
			System.out.println("555");
			}); 
			System.out.println("565");
			return false; // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转 
			}
	</script>



</body>
</html>