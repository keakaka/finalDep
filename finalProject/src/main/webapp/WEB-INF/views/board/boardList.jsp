<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>final project</title>

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

<!-- CSS  -->
  <link href="${contextPath }/resources/js/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
  <link href="${contextPath }/resources/js/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="${contextPath }/resources/js/datatables/fixedHeader.bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="${contextPath }/resources/js/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="${contextPath }/resources/js/datatables/scroller.bootstrap.min.css" rel="stylesheet" type="text/css" />

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
												부서별 게시판
											</h3>
										</div>
										<div class="col-md-6"></div>
									</div>

									<div class="col-md-12 col-sm-12 col-xs-12">
										<div id='calendar'></div>
									</div>

									<div class="clearfix">
										<!-- 시작  -->

								<div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>${sessionScope.loginUser.depName}  <small>${sessionScope.loginUser.empName} ${sessionScope.loginUser.jobName}</small></h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="row">
                    <div class="col-sm-12">
                      <div class="card-box table-responsive" style="overflow-x:hidden;">
                        <!-- <p class="text-muted font-13 m-b-30">
                          KeyTable provides Excel like cell navigation on any table. Events (focus, blur, action etc) can be assigned to individual cells, columns, rows or all cells.
                        </p> -->

                  
                  <table id="datatable-fixed-header" class="table table-striped table-bordered table-hover"
                   style="text-align:center;">
                      <thead style="text-align:center;">
                            <tr>
                              <th style="width:80px; text-align:center;">게시글 번호</th>
                              <th style="text-align:center;">제목</th>
                              <th style="width:150px; text-align:center;">작성자</th>
                              <th style="width:150px; text-align:center;">작성일</th>
                              <th style="width:70px; text-align:center;">조회수</th>
                            </tr>
                          </thead>


                          <tbody>
                       		<c:forEach var='b' items="${blist}" varStatus='status'>
                       		<tr>                   
                              <td id="${b.boardNo}">${status.count}</td>
                              <td>${b.boardTitle}</td>
                               <td>${b.empName}</td>
                              <td>${b.boardDate }</td>
                              <td>${b.selectCount}</td>
                            </tr>
                            </c:forEach>   	
                          </tbody>
                  </table>
                  		<button type="button" class="btn btn-primary" style="float:right;"
                        		onclick="location.href='insertBoard.bo'">
                        <i class="fa fa-pencil"></i>&nbsp;게시글작성
                        </button>
                      </div>
                    </div>
                  </div>
                </div>

                </div>
                </div>
                
                <script>
                	$(function(){
                		$("#datatable-fixed-header").find("td").click(function(){
                			
                			var bid = $(this).parents().children("td").eq(0).attr('id');
                			
                			console.log(bid);
                			
                			location.href="selectOneBoard.bo?bid=" + bid;
                			
                		});
                		
                	});
                </script>

								<!-- 여기가 끝  -->
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
	<script src="${contextPath }/resources/js/calendar/fullcalendar.min.js"></script>
	<!-- gauge js -->
<%-- 	<script type="text/javascript"
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

	<script src="${contextPath }/resources/js/datatables/jquery.dataTables.min.js"></script>
	<script src="${contextPath }/resources/js/datatables/dataTables.bootstrap.js"></script>
	<script src="${contextPath }/resources/js/datatables/dataTables.buttons.min.js"></script>
	<script src="${contextPath }/resources/js/datatables/buttons.bootstrap.min.js"></script>
	<script src="${contextPath }/resources/js/datatables/jszip.min.js"></script>
	<script src="${contextPath }/resources/js/datatables/pdfmake.min.js"></script>
	<script src="${contextPath }/resources/js/datatables/vfs_fonts.js"></script>
	<script src="${contextPath }/resources/js/datatables/buttons.html5.min.js"></script>
	<script src="${contextPath }/resources/js/datatables/buttons.print.min.js"></script>
	<script src="${contextPath }/resources/js/datatables/dataTables.fixedHeader.min.js"></script>
	<script src="${contextPath }/resources/js/datatables/dataTables.keyTable.min.js"></script>
	<script src="${contextPath }/resources/js/datatables/dataTables.responsive.min.js"></script>
	<script src="${contextPath }/resources/js/datatables/responsive.bootstrap.min.js"></script>
	<script src="${contextPath }/resources/js/datatables/dataTables.scroller.min.js"></script>
	
	  <!-- pace -->
        <script src="${contextPath }/resources/js/pace/pace.min.js"></script>
        <script>
          var handleDataTableButtons = function() {
              "use strict";
              0 !== $("#datatable-buttons").length && $("#datatable-buttons").DataTable({
                dom: "Bfrtip",
                buttons: [{
                  extend: "copy",
                  className: "btn-sm"
                }, {
                  extend: "csv",
                  className: "btn-sm"
                }, {
                  extend: "excel",
                  className: "btn-sm"
                }, {
                  extend: "pdf",
                  className: "btn-sm"
                }, {
                  extend: "print",
                  className: "btn-sm"
                }],
                responsive: !0
              })
            },
            TableManageButtons = function() {
              "use strict";
              return {
                init: function() {
                  handleDataTableButtons()
                }
              }
            }();
        </script>
        <script type="text/javascript">
          $(document).ready(function() {
            $('#datatable').dataTable();
            $('#datatable-keytable').DataTable({
              keys: true
            });
            $('#datatable-responsive').DataTable();
            $('#datatable-scroller').DataTable({
              ajax: "js/datatables/json/scroller-demo.json",
              deferRender: true,
              scrollY: 380,
              scrollCollapse: true,
              scroller: true
            });
            var table = $('#datatable-fixed-header').DataTable({
              fixedHeader: true
            });
          });
          TableManageButtons.init();
        </script>
	
</body>



</html>
