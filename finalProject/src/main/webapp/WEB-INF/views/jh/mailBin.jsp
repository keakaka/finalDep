<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Gentallela Alela! |</title>

<!-- Bootstrap core CSS -->

<link href="${contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet">

<link href="${contextPath }/resources/fonts/css/font-awesome.min.css"
	rel="stylesheet">
<link href="${contextPath }/resources/css/animate.min.css"
	rel="stylesheet">

<!-- Custom styling plus plugins -->
<link href="${contextPath }/resources/css/custom.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${contextPath }/resources/css/maps/jquery-jvectormap-2.0.3.css" />
<link href="${contextPath }/resources/css/icheck/flat/green.css"
	rel="stylesheet" />
<link href="${contextPath }/resources/css/floatexamples.css"
	rel="stylesheet" type="text/css" />
<link href="${contextPath }/resources/css/calendar/fullcalendar.css"
	rel="stylesheet">
<link
	href="${contextPath }/resources/css/calendar/fullcalendar.print.css"
	rel="stylesheet" media="print">
<script src="${contextPath }/resources/js/jquery.min.js"></script>
<script src="${contextPath }/resources/js/nprogress.js"></script>

<!--[if lt IE 9]>
	<script src="../assets/js/ie8-responsive-file-warning.js"></script>
	<![endif]-->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>


<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">

					<jsp:include page="../common/sidebar.jsp" />


					<!-- page content -->
					<div class="right_col" role="main">

						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">
								<div class="dashboard_graph">

									<div class="row x_title">
										<div class="col-md-6">
											<h3>
												휴지통 <small>0/0</small>
											</h3>
										</div>
										<div class="col-md-6"></div>
									</div>

									<div class="col-md-12 col-sm-12 col-xs-12">
										<div id='calendar'></div>
									</div>
									<!-- 여기서부터 내용시작 -->
									<!-- <div class="clearfix">받은 편지함</div> -->
									<div>
										<form action="recieveedMail.ma" method="post">
											<div>
												<input type="button" name="delete" value="삭제">
												<input type="text" placeholder="메일검색하기"> 
												<input type="button" name="go" value="검색">
											</div>
											<table
												class="table table-striped responsive-utilities jambo_table bulk_action">
												<thead>
													<tr class="headings">
														<th><input type="checkbox" id="check-all"
															class="flat"></th>
														<th class="column-title">부서명</th>
														<th class="column-title">보낸사람</th>
														<th class="column-title">제목</th>
														<th class="column-title">시간</th>
														<th class="column-title">크기</th>
														<th class="bulk-actions" colspan="7"><a class="antoo"
															style="color: #fff; font-weight: 500;">선택 개수 ( <span
																class="action-cnt"> </span> ) <i
																class="fa fa-chevron-down"></i>
														</a></th>
													</tr>
												</thead>

												<tbody>
													<tr class="even pointer">
														<td class="a-center "><input type="checkbox"
															class="flat" name="table_records"></td>
														<td class=" ">인사과</td>
														<td class=" ">인사과장</td>
														<td class=" ">입사 환영문</td>
														<td class=" ">May 23, 2014 11:30:12 PM</td>
														<td class=" ">23kb</td>
													</tr>
													<tr class="odd pointer">
														<td class="a-center "><input type="checkbox"
															class="flat" name="table_records"></td>
														<td class=" ">경리부</td>
														<td class=" ">경리단장</td>
														<td class=" ">급여지급 안내서</td>
														<td class=" ">May 23, 2014 11:30:12 PM</td>
														<td class=" ">28kb</td>
													</tr>
												</tbody>

												<!-- 받은 메일 리스트 불러오기 -->
												<%--  <% for(Email e : list){ %>
										<tr>
										<td><div class="content"><input type="checkBox"></div>
										<td><div class="content"><%=e.getSender()%></div></td>
										<td><div class="content"><%=e.getEmailTitle()%></div></td>
										<td><div class="content"><%=e.getEmailTime()%></div></td>
										<td><div class="content"><%=e.getEmailSize()%></div></td>
										</tr>
										<% } %> --%>
											</table>
										</form>
									</div>
								</div>

							</div>

						</div>
						<br />
						<!-- footer content -->

						<footer>
							<div class="copyright-info">
								<p class="pull-right">Day By Day Between Departments</p>
							</div>
							<div class="clearfix"></div>
						</footer>
						<!-- /footer content -->
					</div>
					<!-- /page content -->

				</div>

			</div>

			<div id="custom_notifications" class="custom-notifications dsp_none">
				<ul class="list-unstyled notifications clearfix"
					data-tabbed_notifications="notif-group">
				</ul>
				<div class="clearfix"></div>
				<div id="notif-group" class="tabbed_notifications"></div>
			</div>

			<script src="${contextPath }/resources/js/bootstrap.min.js"></script>
			<script src="${contextPath }/resources/js/moment/moment.min.js"></script>
			<script
				src="${contextPath }/resources/js/calendar/fullcalendar.min.js"></script>
			<!-- gauge js -->
			<script type="text/javascript"
				src="${contextPath }/resources/js/gauge/gauge.min.js"></script>
			<script type="text/javascript"
				src="${contextPath }/resources/js/gauge/gauge_demo.js"></script>
			<!-- chart js -->
			<script src="${contextPath }/resources/js/chartjs/chart.min.js"></script>
			<!-- bootstrap progress js -->
			<script
				src="${contextPath }/resources/js/progressbar/bootstrap-progressbar.min.js"></script>
			<script
				src="${contextPath }/resources/js/nicescroll/jquery.nicescroll.min.js"></script>
			<!-- icheck -->
			<script src="${contextPath }/resources/js/icheck/icheck.min.js"></script>
			<!-- daterangepicker -->
			<script type="text/javascript"
				src="${contextPath }/resources/js/moment/moment.min.js"></script>
			<script type="text/javascript"
				src="${contextPath }/resources/js/datepicker/daterangepicker.js"></script>

			<script src="${contextPath }/resources/js/custom.js"></script>


			<!-- /footer content -->
</body>

</html>
