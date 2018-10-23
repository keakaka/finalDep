<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Meta, title, CSS, favicons, etc. -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Gentallela Alela! | </title>

	<!-- Bootstrap core CSS -->

	<link href="${contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">

	<link href="${contextPath }/resources/fonts/css/font-awesome.min.css" rel="stylesheet">
	<link href="${contextPath }/resources/css/animate.min.css" rel="stylesheet">

	<!-- Custom styling plus plugins -->
	<link href="${contextPath }/resources/css/custom.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/maps/jquery-jvectormap-2.0.3.css" />
	<link href="${contextPath }/resources/css/icheck/flat/green.css" rel="stylesheet" />
	<link href="${contextPath }/resources/css/floatexamples.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath }/resources/css/calendar/fullcalendar.css" rel="stylesheet">
  	<link href="${contextPath }/resources/css/calendar/fullcalendar.print.css" rel="stylesheet" media="print">
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

					<jsp:include page="../common/sidebar.jsp"/>


			<!-- page content -->
			<div class="right_col" role="main">

				<div class="row">
					<div class="col-md-20 col-sm-20 col-xs-20">
						<div class="dashboard_graph">

							<div class="row x_title">
								<div class="col-md-6">
									<h3>부서별 퇴사자 현황</h3>
								</div>
								<div class="col-md-6">
								
								</div>
							</div>

							<div class="col-md-18 col-sm-18 col-xs-20">
								<div id='calendar'></div>
							</div>

							<div class="clearfix">
							
            <div class="col-md-20 col-sm-20 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                <select id="depList">
                  	<option>부서</option>
                    <c:forEach var='d' items="${deplist }">
                    <option>${d.depName }</option>
                    </c:forEach>
                    
				  </select>
				  <select id="year">
				  <option>년도</option>
				 <c:forEach var="a"  begin="1950" end="2018" step="1">
				  <option>${a}</option>
				  </c:forEach>
				  </select>
				  <select id="day">
				  <option>월</option>
                 	<option>01</option>
                  	<option>02</option>
                  	<option>03</option>
                  	<option>04</option>
                  	<option>05</option>
                  	<option>06</option>
                  	<option>07</option>
                  	<option>08</option>
                  	<option>09</option>
                  	<option>10</option>
                  	<option>11</option>
                  	<option>12</option>
				  </select>
                
                  <div id="test1"></small></div>
<!--        <button id="testB">테스트</button>
<script>
	$(function(){
		var test1 = $('#test1');
		$('#testB').click(function(){
			test1.html('추가');
		});
	});
	$(function(){
		var test1 = $('#test1');
		test1.change(function(){
			console.log('11111');
		});
	});
</script>            -->
                  
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Settings 1</a>
                        </li>
                        <li><a href="#">Settings 2</a>
                        </li>
                      </ul>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <table class="table table-hover">
                    <thead>
                          <tr>
                          	  <th>부서</th>	
                              <th>사원번호</th>
                              <th>사원명</th>
                              <th>직급</th>
                              <th>입사일</th>
                              <th>퇴사일</th>     
                            </tr>
                          </thead>

                          <tbody class="workingList">
                    	  </tbody>
                  </table>

                </div>
              </div>
            </div>
							
							
							</div>
						</div>
					</div>

				</div>
				<br />
				<!-- footer content -->

				<footer>
					<div class="copyright-info">
						<p class="pull-right">Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>		
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
		<ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
		</ul>
		<div class="clearfix"></div>
		<div id="notif-group" class="tabbed_notifications"></div>
	</div>

	</div>
	</div>
	
	<script>
	$(function(){
		$("#depList").change(function(){
			var depName = $("#depList option:selected").val();
			console.log(depName);
			$.ajax({
				url : "depleaveList.pm",
				data : {depName : depName},
				success : function(data){
					console.log(data);
					var $tbody = $('.workingList');
					$tbody.html("");
					var i = 0;
					$.each(data, function(index, val){
					
						var $tr = $("<tr role='row' class='odd'>");
						var $depName = $('<td>').text(decodeURIComponent(val.depName));
						var $empNo = $('<td>').text(decodeURIComponent(val.empNo));
						var $empName = $('<td>').text(decodeURIComponent(val.empName));
						var $jobName = $('<td>').text(decodeURIComponent(val.jobName));
						var $hireDate = $('<td>').text(decodeURIComponent(val.hireDate));
						var $leaveDate = $('<td>').text(decodeURIComponent(val.leaveDate));
						
						$tr.append($depName);
						$tr.append($empNo);
						$tr.append($empName);
						$tr.append($jobName);
						$tr.append($hireDate);
						$tr.append($leaveDate);
						$tbody.append($tr);
					});	
					},
					error : function(){
					
					}
					});

			});
	});
	
	$(function(){
		$("#day").change(function(){
			var day = $("#day option:selected").val();
			var depName = $("#depList option:selected").val();
			var year = $("#year option:selected").val();
			console.log(depName);
			console.log(day);
			console.log(year);
			$.ajax({
				url : "depleavedayList.pm",
				data : {day : day, 
					depName : depName,
					year : year},
				
				success : function(data){
					var $tbody = $('.workingList');
					$tbody.html("");
					var i = 0;
					$.each(data, function(index, val){
					
						var $tr = $("<tr role='row' class='odd'>");
						var $depName = $('<td>').text(decodeURIComponent(val.depName));
						var $empNo = $('<td>').text(decodeURIComponent(val.empNo));
						var $empName = $('<td>').text(decodeURIComponent(val.empName));
						var $jobName = $('<td>').text(decodeURIComponent(val.jobName));
						var $hireDate = $('<td>').text(decodeURIComponent(val.hireDate));
						var $leaveDate = $('<td>').text(decodeURIComponent(val.leaveDate));
						
						$tr.append($depName);
						$tr.append($empNo);
						$tr.append($empName);
						$tr.append($jobName);
						$tr.append($hireDate);
						$tr.append($leaveDate);
						$tbody.append($tr);
					});	
					},
					error : function(){
					
					}
					});

			});
	});

	</script>
	<script src="${contextPath }/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath }/resources/js/moment/moment.min.js"></script>
	<script src="${contextPath }/resources/js/calendar/fullcalendar.min.js"></script>
	<!-- gauge js -->
	<script type="text/javascript" src="${contextPath }/resources/js/gauge/gauge.min.js"></script>
	<script type="text/javascript" src="${contextPath }/resources/js/gauge/gauge_demo.js"></script>
	<!-- chart js -->
	<script src="${contextPath }/resources/js/chartjs/chart.min.js"></script>
	<!-- bootstrap progress js -->
	<script src="${contextPath }/resources/js/progressbar/bootstrap-progressbar.min.js"></script>
	<script src="${contextPath }/resources/js/nicescroll/jquery.nicescroll.min.js"></script>
	<!-- icheck -->
	<script src="${contextPath }/resources/js/icheck/icheck.min.js"></script>
	<!-- daterangepicker -->
	<script type="text/javascript" src="${contextPath }/resources/js/moment/moment.min.js"></script>
	<script type="text/javascript" src="${contextPath }/resources/js/datepicker/daterangepicker.js"></script>

	<script src="${contextPath }/resources/js/custom.js"></script>

	
	<!-- /footer content -->
</body>

</html>
