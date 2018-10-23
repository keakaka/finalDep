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

										<div class="col-md-6" style="width: 100%;">

											<div class="col-md-12 col-sm-12 col-xs-12">
												<div class="x_panel">
													<div class="x_title">
														<h2 style="font-weight:bold; overflow:visible;">
															휴가내용조회 <small>${loginUser.empName }</small>
														</h2>

														<div class="clearfix"></div>
													</div>
													<div class="x_content">

														<!-- modals -->
														<!-- Large modal -->
														<!-- <button type="button" class="btn btn-primary"
															data-toggle="modal" data-target=".bs-example-modal-lg">휴가신청</button>

														<div class="modal fade bs-example-modal-lg" tabindex="-1"
															role="dialog" aria-hidden="true">
															<div class="modal-dialog modal-lg">
																<div class="modal-content">

																	<div class="modal-header">
																		<button type="button" class="close"
																			data-dismiss="modal">
																			<span aria-hidden="true">×</span>
																		</button>
																		<h4 class="modal-title" id="myModalLabel">휴가신청</h4>
																	</div>
																	<div class="modal-body">
																		<table>
																			<tr>
																				<th>휴가종류</th>
																				<th>사유</th>
																				<th>시작일시</th>
																				<th>종료일시</th>
																			</tr>
																			<tr>
																				<td>
																					<select id="vacationKind">
																					<option id="VT">---</option>
																					<option id="VT1" value="VT1">연가</option>
																					<option id="VT2" value="VT2">공가</option>
																					<option id="VT3" value="VT3">병가</option>
																					<option id="VT4" value="VT4">특별휴가</option>
																					<option id="VT5" value="VT5">반가</option>
																					</select>
																				</td>
																				<td><input type="text" id="vacReason" name="vacReason"></td>
																				<td><input type="date" id="vacStartdate" name="vacStartdate"></td>
																				<td><input type="date" id="vacEnddate" name="vacEnddate"></td>
																			</tr>
																		</table>
																	</div>
																	
																	
																	<div class="modal-footer">
																		<button type="button" class="btn btn-default"
																			data-dismiss="modal">닫기</button>
																		<button type="button" class="btn btn-primary" onclick="apply()">신청하기</button>
																	</div>

																</div>
															</div>
														</div> -->
														
																	<!-- <script>
																		function apply(){
																			/* $("#vacationKind").on("change", function(){
																				console.log($(this).val());
																				var vacKind = $(this).val();
																			}); */
																			var empNo = ${loginUser.empNo};
																			console.log(empNo);
																			var vacKind = $("#vacationKind option:selected").val();
																			console.log(vacKind);
																			var vacReason = $("#vacReason").val();
																			console.log(vacReason);
																			var vacStartdate = $("#vacStartdate").val();
																			console.log(vacStartdate);
																			var vacEnddate = $("#vacEnddate").val();
																			console.log(vacEnddate);
																			location.href="updateMyVacation.me?empNo=" + empNo + "&vacKind=" + vacKind + "&vacReason=" + vacReason + "&vacStartdate=" + vacStartdate + "&vacEnddate=" + vacEnddate;
																			
																		}
																	</script> -->

														<table id="datatable"
															class="table table-striped table-bordered">
															<thead>
																<tr>
																	<th>순번</th>
																	<th>휴가종류</th>
																	<th>사유</th>
																	<th>시작일시</th>
																	<th>종료일시</th>
																</tr>
															</thead>


															<tbody style="font-size: 18px;">
																<c:forEach items="${myVacationRecordList }" var="myVacationRecord">
																	<tr>
																		<td>${myVacationRecord.vacNo }</td>
																		<td>${myVacationRecord.vacType }</td>
																		<td>${myVacationRecord.vacReason }</td>
																		<td>${myVacationRecord.vacStartdate }</td>
																		<td>${myVacationRecord.vacEnddate }</td>
																	</tr>
																</c:forEach>
																<!-- <tr>
																	<td>번호</td>
																	<td>날짜</td>
																	<td>Tiger Nixon</td>
																	<td>System Architect</td>
																	<td>종료일시</td>
																</tr>
																<tr>
																	<td>번호</td>
																	<td>날짜</td>
																	<td>Garrett Winters</td>
																	<td>Accountant</td>
																	<td>종료일시</td>
																</tr>
																<tr>
																	<td>번호</td>
																	<td>날짜</td>
																	<td>Ashton Cox</td>
																	<td>Junior Technical Author</td>
																	<td>종료일시</td>
																</tr>
																<tr>
																	<td>번호</td>
																	<td>날짜</td>
																	<td>Cedric Kelly</td>
																	<td>Senior Javascript Developer</td>
																	<td>종료일시</td>
																</tr>
																<tr>
																	<td>번호</td>
																	<td>날짜</td>
																	<td>Airi Satou</td>
																	<td>Accountant</td>
																	<td>종료일시</td>
																</tr> -->

															</tbody>
														</table>
													</div>
												</div>
											</div>

										</div>
									</div>

									<div class="col-md-12 col-sm-12 col-xs-12">
										<div id='calendar'></div>
									</div>

									<div class="clearfix"></div>
								</div>
							</div>

						</div>
						<br />
						<!-- footer content -->

						<footer>
							<div class="copyright-info">
								<p class="pull-right">
									Gentelella - Bootstrap Admin Template by <a
										href="https://colorlib.com">Colorlib</a>
								</p>
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
</body>

</html>
