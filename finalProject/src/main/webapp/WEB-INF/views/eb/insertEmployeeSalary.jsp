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

<!-- <link href="js/datatables/jquery.dataTables.min.css" rel="stylesheet"
	type="text/css" />
<link href="js/datatables/buttons.bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="js/datatables/fixedHeader.bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="js/datatables/responsive.bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="js/datatables/scroller.bootstrap.min.css" rel="stylesheet"
	type="text/css" /> -->

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
														<h2>
															휴가신청 <small>${loginUser.empName }</small>
														</h2>

														<div class="clearfix"></div>
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

			<!-- <!-- Datatables
			<script src="js/datatables/jquery.dataTables.min.js"></script>
			<script src="js/datatables/dataTables.bootstrap.js"></script>
			<script src="js/datatables/dataTables.buttons.min.js"></script>
			<script src="js/datatables/buttons.bootstrap.min.js"></script>
			<script src="js/datatables/jszip.min.js"></script>
			<script src="js/datatables/pdfmake.min.js"></script>
			<script src="js/datatables/vfs_fonts.js"></script>
			<script src="js/datatables/buttons.html5.min.js"></script>
			<script src="js/datatables/buttons.print.min.js"></script>
			<script src="js/datatables/dataTables.fixedHeader.min.js"></script>
			<script src="js/datatables/dataTables.keyTable.min.js"></script>
			<script src="js/datatables/dataTables.responsive.min.js"></script>
			<script src="js/datatables/responsive.bootstrap.min.js"></script>
			<script src="js/datatables/dataTables.scroller.min.js"></script>

			pace
			<script src="js/pace/pace.min.js"></script>
			<script>
				var handleDataTableButtons = function() {
					"use strict";
					0 !== $("#datatable-buttons").length
							&& $("#datatable-buttons").DataTable({
								dom : "Bfrtip",
								buttons : [ {
									extend : "copy",
									className : "btn-sm"
								}, {
									extend : "csv",
									className : "btn-sm"
								}, {
									extend : "excel",
									className : "btn-sm"
								}, {
									extend : "pdf",
									className : "btn-sm"
								}, {
									extend : "print",
									className : "btn-sm"
								} ],
								responsive : !0
							})
				}, TableManageButtons = function() {
					"use strict";
					return {
						init : function() {
							handleDataTableButtons()
						}
					}
				}();
			</script>
			<script type="text/javascript">
				$(document).ready(function() {
					$('#datatable').dataTable();
					$('#datatable-keytable').DataTable({
						keys : true
					});
					$('#datatable-responsive').DataTable();
					$('#datatable-scroller').DataTable({
						ajax : "js/datatables/json/scroller-demo.json",
						deferRender : true,
						scrollY : 380,
						scrollCollapse : true,
						scroller : true
					});
					var table = $('#datatable-fixed-header').DataTable({
						fixedHeader : true
					});
				});
				TableManageButtons.init();
			</script> -->
</body>

</html>
