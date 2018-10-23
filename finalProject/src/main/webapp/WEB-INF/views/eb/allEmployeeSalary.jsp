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

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js" integrity="sha384-FzT3vTVGXqf7wRfy8k4BiyzvbNfeYjK+frTVqZeNDFl8woCbF0CYG6g2fMEFFo/i" crossorigin="anonymous"></script>

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
															급여이력조회 <small>회계담당자</small>
														</h2>

														<div class="clearfix"></div>
													</div>


													<div id="search-select">
														<select id="departmentType">
															<option id="web-font" value="D.DEP_ID">부서명</option>
															<option id="web-font" value="'D1'">비서</option>
															<option id="web-font" value="'D2'">인사관리</option>
															<option id="web-font" value="'D3'">보안</option>
															<option id="web-font" value="'D4'">재무</option>
															<option id="web-font" value="'D5'">경영기획</option>
															<option id="web-font" value="'D6'">전략기획</option>
															<option id="web-font" value="'D7'">IT</option>
															<option id="web-font" value="'D8'">마케팅</option>
															<option id="web-font" value="'D9'">품질관리</option>
															<option id="web-font" value="'D10'">영업</option>
															<option id="web-font" value="'D11'">시설관리</option>
															<option id="web-font" value="'D12'">연구개발</option>
															<option id="web-font" value="'D13'">고객서비스</option>
															<option id="web-font" value="'D14'">법무</option>
														</select> 
														<select id="jobType">
															<option id="web-font" value="J.JOB_CODE">직급</option>
															<option id="web-font" value="'J1'">회장</option>
															<option id="web-font" value="'J2'">사장</option>
															<option id="web-font" value="'J3'">전무</option>
															<option id="web-font" value="'J4'">상무</option>
															<option id="web-font" value="'J5'">부장</option>
															<option id="web-font" value="'J6'">차장</option>
															<option id="web-font" value="'J7'">과장</option>
															<option id="web-font" value="'J8'">대리</option>
															<option id="web-font" value="'J9'">주임</option>
															<option id="web-font" value="'J10'">사원</option>
														</select>
														
														<label>사원이름</label>
														<input type="text" id="empNameBox" name="empNameBox"> 
													
														<select id="dateType">
															<option id="web-font" value="S.INCOME_DATE">년도</option>
															<option id="web-font" value="'2018%'">2018</option>
															<option id="web-font" value="'2017%'">2017</option>
															<option id="web-font" value="'2016%'">2016</option>
															<option id="web-font" value="'2015%'">2015</option>
															<option id="web-font" value="'2014%'">2014</option>
															<option id="web-font" value="'2013%'">2013</option>
															<option id="web-font" value="'2012%'">2012</option>
															<option id="web-font" value="'2011%'">2011</option>
															<option id="web-font" value="'2010%'">2010</option>
														</select>
														<!-- <select id="quarter">
															<option id="web-font">분기</option>
															<option id="web-font">1분기</option>
															<option id="web-font">2분기</option>
														</select> -->

														<button onclick="searchBtn()" class="btn btn-primary" style="background-color:#2a3f54;">검색</button>

													</div>


													<div class="x_content">

														<table id="datatable"
															class="table table-striped table-bordered">
															<thead>
																<tr>
																	<th>부서명</th>
																	<th>직급</th>
																	<th>사원명</th>
																	<!-- <th>기본급<br>불러오기</th> -->
																	<th>입금일</th>
																	<th>기본급</th>
																	<th>정기상여금</th>
																	<th>비과세수당</th>
																	<th>국민연금</th>
																	<th>건강보험</th>
																	<th>장기요양</th>
																	<th>고용보험</th>
																	<th>실지급액</th>
																</tr>
															</thead>
															<tbody style="font-size: 18px;">
															
															</tbody>
														</table>
													</div>
												</div>

												<form id="excelUploadForm" name="excelUploadForm"
													enctype="multipart/form-data" method="post"
													action="" role="form">

													<div class="contents">
														<div>첨부파일은 한개만 등록 가능합니다.</div>

														<dl class="vm_name">
															<dt class="down w90">첨부 파일</dt>
															<dd>
																<input type="file" id="excelFile" name="excelFile" 
																multiple data-show-upload="false" data-show-caption="true"/>
															</dd>
														</dl>
													</div>

													<div class="bottom">
														<button type="button" id="excelImportBtn" class="btn btn-primary"
															onclick="excelCheck();" style="background-color:#2a3f54;">추가
														</button>
														<!-- <input type="submit" value="업로드"/> -->
													</div>
												</form>
												<script>
												function checkFileType(filePath) {
									                var fileFormat = filePath.split(".");
									                if(fileFormat.indexOf("xls") > -1){
									                	return true;
									                }
									                else if (fileFormat.indexOf("xlsx") > -1) {
									                    return true;
									                } else {
									                    return false;
									                }
									 
									            }

												function excelCheck() {
									                var file = $("#excelFile").val();
									                if (file == "" || file == null) {
									                    alert("파일을 선택해주세요.");
									                    return false;
									                } else if (!checkFileType(file)) {
									                    alert("엑셀 파일만 업로드 가능합니다.");
									                    return false;
									                }
									                
									                var fileFormat = file.split(".");
									                var fileType = fileFormat[1];
									 
									                if(confirm("업로드 하시겠습니까?")) {
									                	
									                	$("#excelUploadForm").attr("action","excelUploadAjax.me");
									                    var options = {
									                        success : function(data) {
									                            alert("업로드가 완료되었습니다.");
									                            console.log(data);
									                            console.log(typeof(data));
									                            
									                            $("#datatable tbody").html('');
									                            
									                            list = JSON.parse(data);
									                            console.log(list);
									                            
									                            var str = '<tr>';
									                            $.each(list, function(i){
									                            	str += '<td>' + list[i].depName + '</td><td>' + list[i].jobName + '</td><td>'
									                            	+ list[i].empName + '</td><td>' + list[i].incomeDate + '</td><td>' + list[i].basePay 
									                            	+ '</td><td>' + list[i].regularBonus + '</td><td>' + list[i].taxFreeAlw + '</td><td>'
									                            	+ list[i].nationalPension + '</td><td>' + list[i].healthIns + '</td><td>' + list[i].longtermcareIns
									                            	+ '</td><td>' + list[i].employeeIns + '</td><td>' + list[i].totalSalary + '</td>';
									                            	str += '</tr>';
									                            })
									                            $("#datatable tbody").append(str);
									                        },
									                        type : "POST",
									                        data : {"excelType" : fileType},
									                    };
									                    $("form").ajaxSubmit(options);
									                    
									     
									                }
									            }
												
												function searchBtn() {
													var depType = $("#departmentType option:selected").val();
													console.log(depType);
													var jobType = $("#jobType option:selected").val();
													console.log(jobType);
													var dateType = $("#dateType option:selected").val();
													console.log(dateType);
													var nameType = $("#empNameBox").val();
													
													if(nameType == ''){
														nameType = "E.EMP_NAME";
													}else{
														nameType = "'%" + nameType + "%'";
													}
													console.log(nameType);
													
													$.ajax({
														type : "post",
														url : "selectSearchCondition.me",
														data : {depType:depType, jobType:jobType, dateType:dateType, nameType:nameType},
														dataType : "json",
														success : function(data) {
															console.log(data);
															console.log(typeof data);
															
															$("#datatable tbody").html('');
															
															var list = data;
															
															var str = '<tr>';
								                            $.each(list, function(i){
								                            	str += '<td>' + list[i].depName + '</td><td>' + list[i].jobName + '</td><td>'
								                            	+ list[i].empName + '</td><td>' + list[i].incomeDate + '</td><td>' + list[i].basePay 
								                            	+ '</td><td>' + list[i].regularBonus + '</td><td>' + list[i].taxFreeAlw + '</td><td>'
								                            	+ list[i].nationalPension + '</td><td>' + list[i].healthIns + '</td><td>' + list[i].longtermcareIns
								                            	+ '</td><td>' + list[i].employeeIns + '</td><td>' + list[i].totalSalary + '</td>';
								                            	str += '</tr>';
								                            })
								                            $("#datatable tbody").append(str);
														}
													})
												}
												</script>


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
