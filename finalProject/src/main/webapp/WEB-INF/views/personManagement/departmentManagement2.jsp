<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.dep.personManagement.model.vo.*"%>
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
	
	
  <link href="${contextPath }/resources/js/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
  <link href="${contextPath }/resources/js/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="${contextPath }/resources/js/datatables/fixedHeader.bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="${contextPath }/resources/js/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="${contextPath }/resources/js/datatables/scroller.bootstrap.min.css" rel="stylesheet" type="text/css" />

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
					<div class="col-md-18 col-sm-18 col-xs-18">
						<div class="dashboard_graph">

							<div class="row x_title">
								<div class="col-md-6">
									<h3>부서별 근태현항</h3>
								</div>
								<div class="col-md-6">

								</div>
							</div>

							<div class="col-md-18 col-sm-18 col-xs-18">
								<div id='calendar'></div>
							</div>


<!-- ---------------------------------------------------------------------------------- -->

			<div class="clearfix">				
				<div class="x_panel">
                <div class="x_title">
                  <h2><i class="fa fa-bars"></i> Tabs <small>Float left</small></h2>
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


                  <div class="" role="tabpanel" data-example-id="togglable-tabs">
                    <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                      <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">진급</a>
                      </li>
                      <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">퇴사</a>
                      </li>
                      <li role="presentation" class=""><a href="#vaction.pm" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">휴가</a>
                      </li>
                      <li role="presentation" class=""><a href="#tab_content4" role="tab" id="profile-tab3" data-toggle="tab" aria-expanded="false">부서이동</a>
                      </li>
                       <li role="presentation" class=""><a href="departmentManagement.pm" role="tab" id="profile-tab4" data-toggle="tab" aria-expanded="false">근태관리</a>
                      </li>
                      
                    </ul>
                    <div id="myTabContent" class="tab-content">
                    
              		<!--진급 -->
                      <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                          <div class="col-md-18 col-sm-18 col-xs-18">
              <div class="x_panel">
                <div class="x_title">
                  <h2>promotion <small>Users</small></h2>
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a href="#"><i class="fa fa-chevron-up"></i></a>
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
                    <li><a href="#"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="row">
                    <div class="col-sm-12">
                      <div class="card-box table-responsive">
                        <p class="text-muted font-13 m-b-30">
                        </p>

                        <table id="datatable-keytable" class="table table-striped table-bordered">
                          <thead>
                            <tr>
                              <th>사원명</th>
                              <th>부서</th>
                              <th>직책</th>
                              <th>진급직책</th>
                              <th>진급날짜</th>
                              <th>수정</th>
                              
                            </tr>
                          </thead>


                          <tbody>
                            <tr>
                              <td>Brielle Williamson</td>
                              <td>Integration Specialist</td>
                              <td>New York</td>
                              <td><text></text></td>
                              <td>2012/12/02</td>
                              <td><button type="button" class="btn btn-round btn-default">입력</button></td>
                            </tr>
                          
                           
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>

                </div>
                      </div> 
                      
                      <!-- 퇴사 -->
       <!--       <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">         				
	        -->
                      </div>
               <!--        휴가 
                      <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                       
                      </div>
                      부서이동 
                      <div role="tabpanel" class="tab-pane fade" id="tab_content4" aria-labelledby="profile-tab">
                    
                      </div> -->
                    </div>
                  </div>
							
                <!-- 클리어 -->
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

	<script src="${contextPath }/resources/js/custom.js"></script>
	   <script src="js/pace/pace.min.js"></script>
        <script type="text/javascript">
          $(document).ready(function() {
            $('#datatable').dataTable();
            $('#datatable-keytable').DataTable({
              keys: true
            });
            $('#datatable-responsive').DataTable();
            $('#datatable-scroller').DataTable({
              ajax: "${contextPath }/resources/js/datatables/json/scroller-demo.json",
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
	
	<!-- /footer content -->
</body>

</html>
