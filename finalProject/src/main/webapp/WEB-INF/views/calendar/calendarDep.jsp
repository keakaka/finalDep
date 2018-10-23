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
<link rel="stylesheet" href="${ contextPath }/resources/Remodal-1.1.1/dist/remodal.css">
<link rel="stylesheet" href="${ contextPath }/resources/Remodal-1.1.1/dist/remodal-default-theme.css">


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
.modal-dialog {
    width: 443px;
    margin: 195px auto;
}
.col-sm-3 {
    width: 12%;
}
.form-horizontal .control-label {
    padding-top: 60px;
}

input::placeholder {
  color: #efefef;
  font-style: italic;
}

.white{
  color: #fff;
}

a:hover{
	cursor:pointer;
}
#descr2 {
    resize: none;
    border: none;
    background: #f5f5f5;
    padding: 10px;
    height: 100px;
    width: 300px;
    word-break: break-all;
    border-style: none;
}

</style>

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
											<h3>Calendar</h3>
										</div>
										<div class="col-md-6"></div>
									</div>
									<div class="" role="tabpanel" data-example-id="togglable-tabs">
										<div class="col-md-12 col-sm-12 col-xs-12">
											<div class="btn-group" role="group"
											aria-label="Button group with nested dropdown">
											<div class="btn-group" role="group">
												<div class="dropdown">
													
													<button id="depName"class="btn btn-default dropdown-toggle"
														type="button" data-toggle="dropdown">부서일정
														<span class="caret"></span>
													</button>
													<ul id="test" class="dropdown-menu">
													<c:forEach var="d" items="${depList }">
														<%-- <input type="hidden" id="depName" value="${d.depName }"></input> --%>
														<li><a onclick="test('${d.depName}');" value="${d.depId }">${d.depName }</a></li>
													</c:forEach>
													</ul>
													
													</div>
													
												</div>
										</div>
											<div id="myTabContent" class="tab-content">
												<div id="tab_conten1" style="padding: 10px;"></div>
												<div id="calendarArea">
													<div id='calendar'></div>
												</div>
											</div>
										</div>

										<div class="clearfix"></div>
									</div>
									
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

			<!-- Start Calender modal -->
			<div id="CalenderModalNew" class="modal fade" tabindex="-1"
				role="dialog" aria-hidden="true"
				aria-labelledby="my80sizeCenterModalLabel">

				<div class="modal-dialog modal-lg">
					<div class="modal-content" style="width:500px;">

						<div id="modal-header" class="modal-header">
						
							<%-- <div id="dropdown" class="dropdown">
								<button id="depName" class="btn btn-default dropdown-toggle"
									type="button" data-toggle="dropdown">
									부서일정 <span class="caret"></span>
								</button>
								<ul id="dropdown-menu2" class="dropdown-menu">
									<c:forEach var="d" items="${depList }">
										<li><a id="dep" value="${d.depId }">${d.depName }</a></li>
									</c:forEach>
								</ul>
							</div> --%>
							<div id="noDep" style="font-size:1.5em; font-weight:bold;"></div>
							<div class="form-group">
								
									<div class="col-sm-9" style="padding:5px;">
										<input type="text" class="form-control" id="title"style="border:none; font-size:13pt; font-weight:bold;"
											name="title" placeholder="일정 제목을 입력하세요.">
									</div>
								</div>
								
						</div>
						<div class="modal-body">
							<div id="testmodal" style="padding: 5px 20px;">
								<form id="antoform" class="form-horizontal calender" role="form">

									<%-- <div class="form-group">
										<label class="col-sm-3 control-label">날짜 </label>
										
										<c:set var="list" items="${cList}" varStatus = 'status'>
										<div class="col-sm-9"
											style="height: 30px; padding-top:7px; align-items: center; justify-content: left;">
											<p class="date" id="nows" name="nows"></p></div>
										</c:set>
										
									</div> --%>
									<script>
										//날짜교체 - 클릭시 해당 메소드 호출
										 function onchangeDay(yy, mm, dd, e) {
											$("#nows").html(yy + "년 " + mm + "월 "+ dd + "일");
										} 
									</script>

									<%--<div class="form-group">
										<label class="col-sm-3 control-label">게시자 </label>
										<div class="col-sm-9" id="loginName"
											style="height: 30px; padding-top:7px;" value="${ sessionScope.loginUser.empName }">
											${ sessionScope.loginUser.empName } </div>
										
									</div>--%>

									<!-- <div class="form-group">
										<label class="col-sm-3 control-label">참석자 </label>
										<div class="col-sm-9"
											style="height: 33px; display: flex; align-items: center; justify-content: left;">
											<div class="input-group" style="width: 200px; margin-top:9px;">
													<span class="input-group-btn">
														<input type="text" name="name" id="attName" class="form-control"
															   style="border:none;" placeholder="참석자를 검색하세요.">
														<button type="button" class="btn btn-info btn-xs" style="margin-top:5px; margin-left:5px;" onclick="searchAtt();">참석자 검색하기</button>
													</span>
											</div>
											<script>
												function searchAtt(){
													var attName = $('#attName').val();
													console.log(attName);
													
													$.ajax({
														url:"searchAttName.ca",
														type:'post',
														dataType:"text",
														data:{attName:attName},
														success:function(data){
															console.log(data);
															
															/* console.log(data.empName);
															var e = $(data).find('empName');
															$("#dataArea").html(e); */
														},
														error:function(data){
															console.log("error");
														},
														
													});
												}
											</script>
										</div>
											
										</div> -->
										<%-- <div class="form-group" style="width:60%; float:right; margin-right:170px; margin-top:10px;">
											<table class="table table-striped responsive-utilities jambo_table bulk_action">
												<thead>
													<tr class="headings">
														<th></th>
														<th class="column-title">부서명</th>
														<th class="column-title">이름</th>
														<th class="column-title">직위</th>
														<th class="column-title">직책</th>
														<th></th>
													</tr>
												</thead>
												
												<tbody>
													<c:forEach var="list" items="${addressBookList}" varStatus = 'status'>
														<tr class="even pointer">
															<td class="a-center" style="width:85px;"><input type="checkbox" 
																name="check" class="flat" value="${list.empNo}"></td>
															<input type="hidden" name="loginNo"
																value="${ sessionScope.loginUser.empNo }">
															<td width="254">${list.depName}</td>
															<td width="200">${list.empName}</td>
															<td width="190">${list.jobName}</td>
															<td width="200">${list.positionName}</td>
															<td><a href="#/comments-o"><i class="fa fa-comments-o fa-lg"></i></a></td>
														</tr>
													</c:forEach>
												</tbody>

											</table>
											<div>
												 <button type="button"  class="btn btn-dark btn-xs" onclick="checkboxArr();">참석자에 추가하기</button>
											</div>
										</div> --%>
										<div class="form-group" id="memo">
										<label class="col-sm-3 control-label">메모</label>
										<div class="col-sm-9">
											<textarea id="content" name="content"
												style="border:none; padding:10px; background:#f5f5f5; min-height: 120px; width: 300px;"></textarea>
										</div>
									</div>
									</div>
									
								</form>
								<div align="right">
									
									<button id="addCal" type="button" style="border:none;" class="btn btn-primary antosubmit">
										일정 추가</button>
									<a href="calendarDep.ca" id="close" class="btn btn-default">취소</a>
								</div>
								<script>
								
								$("#CalenderModalNew").click(function(){
									 var loginUserDepName = "${loginUser.depName}";
									 var depName = dName;
									 console.log(loginUserDepName);
									 console.log(depName);
									 
									 if(!(loginUserDepName == depName)){
										 $("#noDep").html("※다른 부서에 일정을 추가할 수 없습니다.");
										 $("#noDep").show();
										 $("#addCal").hide();
										 $("#testmodal").hide();
										 $("#title").hide();
									 }else{
										 $("#noDep").hide();
										 $("#addCal").show();
										 $("#memo").show();
										 $("#title").show();
									 }
									
								});
								</script>
							</div>
						</div>
						

						<div id="fc_create" data-toggle="modal"
							data-target="#CalenderModalNew"></div>
						<div id="fc_edit" data-toggle="modal"
							data-target="#CalenderModalEdit"></div>
					</div>
				</div>
			</div>
			
		<!-- 수정 페이지 -->
		<div id="CalenderModalNew2" class="modal fade" tabindex="-1"
				role="dialog" aria-hidden="true"
				aria-labelledby="my80sizeCenterModalLabel">

				<div class="modal-dialog modal-lg">
					<div class="modal-content" style="width:500px;">

						<div id="modal-header" class="modal-header">
							
								<div class="form-group">
									<div class="col-sm-9" style="padding:5px;">
										<input type="text" class="form-control" id="title22"style="border:none; font-size:13pt; font-weight:bold;"
											name="title22">
										<div id="title33"></div>
									</div>
								</div>
								
						</div>
						<div class="modal-body">
							<div id="testmodal" style="padding: 5px 20px;">
								<form id="antoform" class="form-horizontal calender" role="form">

									<%-- <div class="form-group">
										<label class="col-sm-3 control-label">날짜 </label>
										
										<c:set var="list" items="${cList}" varStatus = 'status'>
										<div class="col-sm-9"
											style="height: 30px; padding-top:7px; align-items: center; justify-content: left;">
											<p class="date" id="nows" name="nows"></p></div>
										</c:set>
										
									</div> --%>
									

									<%-- <div class="form-group">
										<label class="col-sm-3 control-label">게시자 </label>
										<div class="col-sm-9" id="loginName"
											style="height: 30px; padding-top:7px;" value="${ sessionScope.loginUser.empName }">
											${ sessionScope.loginUser.empName } </div>
									</div> --%>

									<!-- <div class="form-group">
										<label class="col-sm-3 control-label">참석자 </label>
										<div class="col-sm-9"
											style="height: 33px; display: flex; align-items: center; justify-content: left;">
											<div class="input-group" style="width: 200px; margin-top:9px;">
													<span class="input-group-btn">
														<input type="text" name="name" id="attName" class="form-control"
															   style="border:none;" placeholder="참석자를 검색하세요.">
														<button type="button" class="btn btn-info btn-xs" style="margin-top:5px; margin-left:5px;" onclick="searchAtt();">참석자 검색하기</button>
													</span>
											</div>
											<script>
												function searchAtt(){
													var attName = $('#attName').val();
													console.log(attName);
													
													$.ajax({
														url:"searchAttName.ca",
														type:'post',
														dataType:"text",
														data:{attName:attName},
														success:function(data){
															console.log(data);
															
															/* console.log(data.empName);
															var e = $(data).find('empName');
															$("#dataArea").html(e); */
														},
														error:function(data){
															console.log("error");
														},
														
													});
												}
											</script>
										</div>
											
										</div> -->
										<%-- <div class="form-group" style="width:60%; float:right; margin-right:170px; margin-top:10px;">
											<table class="table table-striped responsive-utilities jambo_table bulk_action">
												<thead>
													<tr class="headings">
														<th></th>
														<th class="column-title">부서명</th>
														<th class="column-title">이름</th>
														<th class="column-title">직위</th>
														<th class="column-title">직책</th>
														<th></th>
													</tr>
												</thead>
												
												<tbody>
													<c:forEach var="list" items="${addressBookList}" varStatus = 'status'>
														<tr class="even pointer">
															<td class="a-center" style="width:85px;"><input type="checkbox" 
																name="check" class="flat" value="${list.empNo}"></td>
															<input type="hidden" name="loginNo"
																value="${ sessionScope.loginUser.empNo }">
															<td width="254">${list.depName}</td>
															<td width="200">${list.empName}</td>
															<td width="190">${list.jobName}</td>
															<td width="200">${list.positionName}</td>
															<td><a href="#/comments-o"><i class="fa fa-comments-o fa-lg"></i></a></td>
														</tr>
													</c:forEach>
												</tbody>

											</table>
											<div>
												 <button type="button"  class="btn btn-dark btn-xs" onclick="checkboxArr();">참석자에 추가하기</button>
											</div>
										</div> --%>
										<div class="form-group">
										<label class="col-sm-3 control-label">메모</label>
										<div class="col-sm-9">
											<textarea id="content22" name="content22"
												style="border:none; padding:10px; background:#f5f5f5; min-height: 120px; width: 300px;"></textarea>
										</div>
									</div>
									</div>
									<input type="hidden" name="updateId" id="updateId">
									
								</form>
								<div align="right">
									<button type="button" onclick="update(); "style="border:none;" class="btn btn-primary antosubmit">
										 수정 완료</button>
									<a href="calendar.ca" class="btn btn-default">취소</a>
								</div>
								<script>
								
								</script>
							</div>
						</div>

						<div id="fc_create" data-toggle="modal"
							data-target="#CalenderModalNew"></div>
						<div id="fc_update" data-toggle="modal"
							data-target="#CalenderModalNew2"></div>
						<div id="fc_edit" data-toggle="modal"
							data-target="#CalenderModalEdit"></div>
					</div>
				</div>
		

		<!-- 상세보기 페이지 -->
		<div id="CalenderModalEdit" class="modal fade" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content" style="width:500px;">

						<div class="modal-header" style="background:#3a87ad;">
							<div style="width: 100%" align="right">
								
								<input type="hidden" id="empno" name="empno">
									<div>
									<div align="left" style="float:left; width:250px;"><i class="fa fa-user white fa-2x"></i>&nbsp;<input type="text"id="empname" name="empname" style="font-size:15px; border:none; color:white; background:#3a87ad;" readonly></div>
									<div style="width:150px;">
									<a id="updateC" style="margin-right: 7px; margin-top: 2px;">
									<i class="fa fa-edit white fa-2x" data-dismiss="modal" onclick="updateC();"></i></a>
									<a id="deleteC" style="margin-right: 10px;">
									<i class="fa fa-trash white fa-2x" onclick="deleteC();"></i></a>
									</div>
									</div>
							<script>
								
								
							</script>
							</div>
							
							
							
							<div align="center">
							<h4><input type="text" class="modal-title" id="title2"style="background:#3a87ad; color:white; font-weight:bold; border:none; text-align:center;"
												name="title2" readonly></h4>
							</div>
							
						</div>
						<div class="modal-body">
							<div class="modal-body">
								<div id="testmodal" style="padding: 5px 20px;">
									<form id="antoform" class="form-horizontal calender"
										role="form">
										
										<input type="hidden" id="id" name="id">
										
										<!-- <div class="form-group">
											<label class="col-sm-3 control-label">날짜 </label>
											<div class="col-sm-9" style="height: 30px; display: flex; align-items: center; justify-content: left;">
												
											</div>
										</div> -->

										<!-- <div class="form-group">
											<label class="col-sm-3 control-label">게시자 </label>
											<div class="col-sm-9"
												style="height: 30px; display: flex; align-items: center; justify-content: left;">
												</div>
										</div> -->

										<!-- <div class="form-group">
											<label class="col-sm-3 control-label">참석자 </label>
											<div id="attSearchDiv2" class="col-sm-9"
												style="width: 300px; height: 100px;"></div>
										</div> -->



										<div class="form-group">
											<label class="col-sm-3 control-label">메모</label>
											<div class="col-sm-9">
												<textarea id="descr2" name="descr" style="height:150px;"
													
													readonly></textarea>
											</div>
										</div>

									</form>
								</div>
							</div>
							<hr />
							<div align="right">
								<button type="button" class="btn btn-primary"
									data-dismiss="modal" style="border:none;">닫기</button>
							</div>
						
					</div>
						 <input type="hidden" id="closeM" class="btn btn-default antoclose" data-dismiss="modal"></input>
						<script>
						//일정 수정 모달창으로 이동
						function updateC(){
							console.log("수정");
							var id = $("#id").val();
							
							$.ajax({
								url:"updateModalCalendar.ca",
								type:'post',
								data:{id:id},
								success:function(data){
									$('#fc_update').click();
									
									var result = data.c2;
									
									var updateId = result.scheduleNo;
									var empNo = result.empNo;
									var updateTitle = result.scheduleTitle;
									var updateContent = result.scheduleContent;
									
									
									console.log(updateId);
									console.log(empNo);
									console.log(updateTitle);
									console.log(updateContent);
									
									$('input[name=title22]').attr('value',updateTitle);
									/* $('input[name=content33]').attr('value',updateContent); */
									$("#content22").val(updateContent);
									$('input[name=updateId]').attr('value',updateId);
									
									
								},
								error:function(data){
									console.log("error");
								},
								
							});
							
							
						}
						
						//일정 수정 완료
						function update(){
							console.log("수정 완료 버튼 클릭");
							
							var title2 = document.getElementById('title22').value;
				            var content2 = document.getElementById('content22').value;
				            var updateId = document.getElementById('updateId').value;
				            
				            console.log(title2);
				            console.log(content2);
				            console.log(updateId);
				            
				            $.ajax({
								url:"updateCalendar.ca",
								type:'post',
								data:{title:title2,
									  content:content2,
									  updateId:updateId},
								success:function(data){
									window.location = "calendarDep.ca";
									
								},
								error:function(data){
									console.log("error");
								},
								
							});
				            
						}
						
						
						//일정 삭제
						function deleteC(){
								var id = $("#id").val();
								console.log(id);
								
								$.ajax({
									url:"deleteCalendar.ca",
									type:'post',
									data:{id:id},
									success:function(data){
										
										window.location = "calendarDep.ca";
										
									},
									error:function(data){
										console.log("error");
									},
									
								});
								
							
						}
						
						</script>
					</div>
				</div>
				
			</div>
		
		<!-- /상세보기 페이지 -->

	</div>
	</div>
	</div>

	<!-- <div id="fc_create" data-toggle="modal" data-target="#CalenderModalNew"></div>
	<div id="fc_edit" data-toggle="modal" data-target="#CalenderModalEdit"></div> -->

	<!-- End Calender modal -->
	<script src="${contextPath }/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath }/resources/js/moment/moment.min.js"></script>
	<script src="${contextPath }/resources/js/calendar/fullcalendar.min.js"></script>
	<!-- gauge js -->
	<%-- <script type="text/javascript"
		src="${contextPath }/resources/js/gauge/gauge.min.js"></script>
	<script type="text/javascript"
		src="${contextPath }/resources/js/gauge/gauge_demo.js"></script> --%>
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
	<script>window.jQuery || document.write('<script src="../../../libs/jquery/dist/jquery.min.js"><\/script>')</script>


<script src="${ contextPath }/resources/Remodal-1.1.1/dist/remodal.js"></script>

<script>
var dName;

function test(depName){
	console.log(depName);
	dName = depName;
}




function startCal(){
	
	  var date = new Date();
	  var d = date.getDate();
	  var m = date.getMonth();
	  var y = date.getFullYear();
	  var started;
	  var categoryClass;

	  var calendar = $('#calendar').fullCalendar({
		  
		
	    header: {
	      left: 'prev,next today',
	      center: 'title',
	      right: 'month,agendaWeek,agendaDay'
	    },
	    selectable: true,
	    selectHelper: true,
	    select: function(start, end) {
	      $('#fc_create').click();


	      started = start;
	      ended = end

	      $(".antosubmit").on("click", function() {
	    	  
				
				var sDateFormat = moment(start, 'YYYY-MM-DD');
	            var eDateFormat = moment(end, 'YYYY-MM-DD');
	              
	            var sDate = sDateFormat.format('YYYY-MM-DD');
	            var eDate = eDateFormat.format('YYYY-MM-DD');

	            console.log(sDate);
	            console.log(eDate);
	            
	            var title2 = document.getElementById('title').value;
	            var content2 = document.getElementById('content').value;
	            /* depNo = 'null'; */
				
				$.ajax({
					url:"insertCalendar.ca",
					type:'post',
					data:{title:title2,
						  content:content2,
						  depNo:depNo,
						  sDate:sDate,
						  eDate:eDate},
					success:function(data){
						var next = data.next;
						var empNo2 = data.empNo2;
						var empName2 = data.empName2;
						console.log(next);
						console.log(empNo2);
						console.log(empName2);
						
						
						window.location = "calendarDep.ca";
						
						
						console.log("success");
					},
					error:function(data){
						console.log("error");
					},
					
				});
				
	        var title = $("#title").val();
	        
	        if (end) {
	          ended = end
	        }
	        categoryClass = $("#event_type").val();

	        if (title) {
	          calendar.fullCalendar('renderEvent', {
	              title: title,
	              start: started,
	              end: end
	            },
	            true // make the event "stick"
	          );
	        }
	        $('#title').val('');
	        calendar.fullCalendar('unselect');

	        $('.antoclose').click();

	        return false;
	      });
	    },
	    
	    eventClick: function(calEvent, jsEvent, view) {
	
	      $('#fc_edit').click();
	      $('#title2').val(calEvent.title);
	      $('#descr2').val(calEvent.content);
	      $('#id').val(calEvent.id);
	      $('#empno').val(calEvent.empno);
	      $('#empname').val(calEvent.empname);
	      
	      
	      empnoValue = $("#empno").val();
	      empnameValue = $("#empname").val();
	      loginUserEmpNo = ${loginUser.empNo};
	      console.log(empnoValue);
	      console.log(loginUserEmpNo);
	      console.log(empnameValue);
		  if(empnoValue != loginUserEmpNo){
			  $("#updateC").hide();
			  $("#deleteC").hide();
		  }else{
			  $("#updateC").show();
			  $("#deleteC").show();
		  }
		  
	      
	      
	      categoryClass = $("#event_type").val();

	      $(".antosubmit2").on("click", function() {
	        calEvent.title = $("#2").val();
	        calEvent.content = $("#2").val();
	        calEvent.id = $("#2").val();
	        calEvent.empno = $("#2").val();
	        calEvent.empname = $("#2").val();

	        calendar.fullCalendar('updateEvent', calEvent);
	        $('.antoclose2').click();
	      });
	      
	      calendar.fullCalendar('unselect');
	    },
	    editable: true,
	    
	  });
	  
	}

$(document).ready(function(){
	var title = 'test';
	depNo = 'D0';
	
	 $.ajax({
		url:"calendarList.ca",
		type:"post",
		data:{title:title,
			  depNo:depNo},
		success:function(data){
			var result = data.cList;
			
			$.each(result, function(i){
	              var event={empname:result[i].empName, id:result[i].scheduleNo, empno:result[i].empNo, title: result[i].scheduleTitle, content:result[i].scheduleContent, 
	            		  start:result[i].scheStartDate, end:result[i].scheEndDate};
	               
	               
	               $('#calendar').fullCalendar('renderEvent', event, true);
					
	            });

		},
		error:function(data){
			console.log("실패");
		}
	});
});

$(window).load(function() {
		 
		 /* startCal(); */
    
    });
  </script>
  
  <script>
									
									
									
									$('.dropdown-menu li > a').on('click', function() {
										$(this).parents(".dropdown").find('.btn').html($(this).text() + ' <span class="caret"></span>');
									    depNo = $(this).attr('value');
									    
									    console.log("dep : " + depNo);
									    
									    title = 'test'; 
									    	
									    $.ajax({
											url:"calendarList.ca",
											type:'post',
											data:{title:title,
												depNo:depNo},
											success:function(data){
												
												$("#calendar").remove();
												
												var area = document.getElementById('calendarArea');
												
												var div1 = document.createElement('div');
												div1.setAttribute("id", "calendar");
												
												area.append(div1);
												
												startCal(depNo);
												
												var result = data.cList;
												/* console.log("test1:"+title); */
												
												$.each(result, function(i){
										              var event={empname:result[i].empName, empno:result[i].empNo, schetype:result[i].scheType, id:result[i].scheduleNo, title: result[i].scheduleTitle, content:result[i].scheduleContent, 
										            		  start:result[i].scheStartDate, end:result[i].scheEndDate};
										               
										               
										               $('#calendar').fullCalendar('renderEvent', event, true);

										               /* calendar.fullCalendar('renderEvent', {
																title : result[i].scheduleTitle,
																content : result[i].scheduleContent,
																start : result[i].scheStartDate,
																end : result[i].scheEndDate
															}, true // make the event "stick"
															); */
														
										            });
												
											},
											error:function(data){
												console.log("error");
											},
											
										});
									});
									
									
									
									</script>
  
  

</body>


</html>