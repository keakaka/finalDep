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

<title>일정 관리</title>

<link href="${contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet">

<link href="${contextPath }/resources/fonts/css/font-awesome.min.css"
	rel="stylesheet">
<link href="${contextPath }/resources/css/animate.min.css"
	rel="stylesheet">

<link href="${contextPath }/resources/css/custom.css" rel="stylesheet">
<link href="${contextPath }/resources/css/icheck/flat/green.css"
	rel="stylesheet">

<link href="${contextPath }/resources/css/calendar/fullcalendar.css"
	rel="stylesheet">
<link
	href="${contextPath }/resources/css/calendar/fullcalendar.print.css"
	rel="stylesheet" media="print">

<script src="${contextPath }/resources/js/jquery.min.js"></script>


</head>
<style>
#attSearch {
	width: 500px;
}

#attSearchDiv {
	margin-left: 140px;
}

#attSearchDiv2 {
	margin-top: 7px;
}

#modal-dialog {
	width: 550px;
}
</style>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">

					<jsp:include page="../common/sidebar.jsp" />


					<!-- page content -->
					<div class="right_col" role="main" align="center">
						<div class="content" style="width: 60%;">
							<div class="header">
								<h4 class="modal-title">참석자 검색</h4>
							</div>
							<div class="body">
								<div class="row">
									<div class="col-md-12 col-sm-12 col-xs-12">
										<div class="x_content">
											<br />
											<div class="col-md-12 col-sm-12 col-xs-12">
												<div class="x_content" align="left">
													<form action="searchAttName.ca" method="post"
														name="name_search_form"
														onsubmit="return nameSearchFormCheck()">
														<div class="input-group" style="width: 200px;">
															<input type="text" name="name"
																class="form-control btn-round"> <span
																class="input-group-btn"> <input type="submit"
																class="btn btn-round btn-info" value="검색">
															</span>
														</div>
													</form>
													<table
														class="table table-striped responsive-utilities jambo_table bulk_action">
														<thead>
															<tr class="headings">
																<th class="column-title">추가</th>
																<th class="column-title">부서명</th>
																<th class="column-title">이름</th>
																<th class="column-title">직위</th>
																<th class="column-title">직책</th>
																<th class="column-title">전화번호</th>
																<th class="column-title">메일 주소</th>

																<th class="bulk-actions" colspan="7"><a
																	class="antoo" style="color: #fff; font-weight: 500;">Bulk
																		Actions ( <span class="action-cnt"> </span> ) <i
																		class="fa fa-chevron-down"></i>
																</a></th>
															</tr>
														</thead>

														<tbody>
															<c:forEach var="list" items="${addressBookList}"
																varStatus='status'>
																<tr class="even pointer">
																	<td class="a-center" style="width: 85px;"><input
																		type="checkbox" name="check" class="flat"
																		value="${list.empNo}"></td>
																	<input type="hidden" name="loginNo"
																		value="${ sessionScope.loginUser.empNo }">
																	<td width="254">${list.depName}</td>
																	<td width="200">${list.empName}</td>
																	<td width="190">${list.jobName}</td>
																	<td width="200">${list.positionName}</td>
																	<td width="320">${list.phone}</td>
																	<td>${list.email}</td>
																	<td><a href="#/comments-o"><i
																			class="fa fa-comments-o fa-lg"></i></a></td>
																</tr>
															</c:forEach>
														</tbody>

													</table>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
							<div align="right">
								<button type="button" class="btn btn-primary">참석자에 추가하기</button>
								<button type="button" class="btn btn-default"
									data-toggle="modal" data-target="#myModal">취소</button>
							</div>
						</div>
					<br><br><br><br><br><br><br>
					<footer>
						<div class="copyright-info">
							<p class="pull-right">
								Gentelella - Bootstrap Admin Template by <a
									href="https://colorlib.com">Colorlib</a>
							</p>
						</div>
						<div class="clearfix"></div>
					</footer>
					</div>
					
					<!-- /page content -->
					
				</div>

			</div>



			<!-- Start Calender modal -->


		</div>
	</div>
	</div>

	<div id="fc_create" data-toggle="modal" data-target="#CalenderModalNew"></div>
	<div id="fc_edit" data-toggle="modal" data-target="#CalenderModalEdit"></div>

	<!-- End Calender modal -->
	<script src="${contextPath }/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath }/resources/js/moment/moment.min.js"></script>
	<script src="${contextPath }/resources/js/calendar/fullcalendar.min.js"></script>
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

	<!-- flot js -->
	<!--[if lte IE 8]><script type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->
	<script type="text/javascript"
		src="${contextPath }/resources/js/flot/jquery.flot.js"></script>
	<script type="text/javascript"
		src="${contextPath }/resources/js/flot/jquery.flot.pie.js"></script>
	<script type="text/javascript"
		src="${contextPath }/resources/js/flot/jquery.flot.orderBars.js"></script>
	<script type="text/javascript"
		src="${contextPath }/resources/js/flot/jquery.flot.time.min.js"></script>
	<script type="text/javascript"
		src="${contextPath }/resources/js/flot/date.js"></script>
	<script type="text/javascript"
		src="${contextPath }/resources/js/flot/jquery.flot.spline.js"></script>
	<script type="text/javascript"
		src="${contextPath }/resources/js/flot/jquery.flot.stack.js"></script>
	<script type="text/javascript"
		src="${contextPath }/resources/js/flot/curvedLines.js"></script>
	<script type="text/javascript"
		src="${contextPath }/resources/js/flot/jquery.flot.resize.js"></script>
	<script>
		$(window).load(function() {

			var date = new Date();
			var d = date.getDate();
			var m = date.getMonth();
			var y = date.getFullYear();
			var started;
			var categoryClass;

			var calendar = $('#calendar').fullCalendar({
				header : {
					left : 'prev,next today',
					center : 'title',
					right : 'month,agendaWeek,agendaDay'
				},
				
				dayClick: function(date, allDay, jsEvent, view) {
					
					   var yy=date.format("YYYY");
					   var mm=date.format("MM");
					   var dd=date.format("DD");
					   var e=date.format("e");
					   onchangeDay(yy,mm,dd,e);
				},

				
				selectable : true,
				selectHelper : true,
				select : function(start, end, allDay) {
					$('#fc_create').click();

					started = start;
					ended = end

					$(".antosubmit").on("click", function() {
						var title = $("#title").val();
						if (end) {
							ended = end
						}
						categoryClass = $("#event_type").val();

						if (title) {
							calendar.fullCalendar('renderEvent', {
								title : title,
								start : started,
								end : end,
								allDay : allDay
							}, true // make the event "stick"
							);
						}
						$('#title').val('');
						calendar.fullCalendar('unselect');

						$('.antoclose').click();

						return false;
					});
				},
				eventClick : function(calEvent, jsEvent, view) {
					/* alert(calEvent.title, jsEvent, view); */

					$('#fc_edit').click();
					$('#title2').val(calEvent.title);
					categoryClass = $("#event_type").val();
					$(".antosubmit2").on("click", function() {
						calEvent.title = $("#title2").val();

						calendar.fullCalendar('updateEvent', calEvent);
						$('.antoclose2').click();
					});
					calendar.fullCalendar('unselect');
				},
				editable : true,
				events : [ {
					title : 'All Day Event',
					start : new Date(y, m, 1),
				 	
				}, /*{
													   title: 'Long Event',
													   start: new Date(y, m, d - 5),
													   end: new Date(y, m, d - 2)
													 }, {
													   title: 'Meeting',
													   start: new Date(y, m, d, 10, 30),
													   allDay: false
													 }, {
													   title: 'Lunch',
													   start: new Date(y, m, d + 14, 12, 0),
													   end: new Date(y, m, d, 14, 0),
													   allDay: false
													 }, {
													   title: 'Birthday Party',
													   start: new Date(y, m, d + 1, 19, 0),
													   end: new Date(y, m, d + 1, 22, 30),
													   allDay: false
													 }, {
													   title: 'Click for Google',
													   start: new Date(y, m, 28),
													   end: new Date(y, m, 29),
													   url: 'http://google.com/'
													 }*/]
			});
		});
	</script>
</body>


</html>