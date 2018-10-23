<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="dashboard_graph">

							<div class="row x_title">
								<div class="col-md-6">
									<h3>인사관리 <small>사원정보입력</small></h3>
								</div>
								<div class="col-md-6">

								</div>
							</div>

							<div class="col-md-12 col-sm-12 col-xs-12">
								<div id='calendar'></div>
							</div>

							<div class="clearfix"></div>
							<!-- start  -->
							 <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
          <!--       <div class="x_title">
                  <h2>Form Design <small>different form elements</small></h2>
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
                </div> -->
                <div class="x_content">
                  <br />
                  <form data-parsley-validate class="form-horizontal form-label-left" action="memberInsert.me" method="post" encType="multipart/form-data">

                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">이름 <!-- <span class="required">*</span> -->
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="empName" name="empName" required="required" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                	
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">생년월일 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="birthDate" name="birthDate" required="required" placeholder="ex> 901101"
                        class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">E-Mail</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input id="email" name="email" class="form-control col-md-7 col-xs-12" 
                        placeholder="ex> finalProject@gmail.com"type="text" required="required">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">H.P
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input id="phone" name="phone" class="date-picker form-control col-md-7 col-xs-12" 
                        placeholder="ex> 010-8777-2333 -> 01087772333" required="required" type="text">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input id="checkPhoneAg"  type="checkbox" value="Y" name="phoneReveal" onclick="oneCheck(this);" checked>
                        <label for="checkPhoneAg">공개</label>&nbsp;
                         <input id="checkPhoneNAg"  type="checkbox" value="N" name="phoneReveal" onclick="oneCheck(this);">
                        <label for="checkPhoneNAg">비공개</label>
                      </div>
                    </div>
                    <script>
                    function oneCheck(val) {

            			var obj = document.getElementsByName("phoneReveal");
            			

            			for (var i = 0; i < obj.length; i++) {

            				if (obj[i] != val) {

            					obj[i].checked = false;

            				}
            			}
            		}
                    </script>
                     <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">비상연락처 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="emergencyPhone" name="emergencyPhone" 
                        placeholder="ex> 010-8777-2333 -> 01087772333" required="required" 
                        class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">주소 
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="address" name="address" required="required"class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">급여
                      </label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="salary" name="salary" placeholder="ex> 350만원 -> 3500000" required="required" class="form-control col-md-7 col-xs-12">
                      </div>
                    </div>
                  	   <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">부서</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <select class="form-control" name="depId" required="required">
                          <option>부서를 선택하세요</option>
                          <c:forEach var='d' items="${deplist }">
                          <option value="${d.depId }">${d.depName }</option>
                          </c:forEach>
                        </select>
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">직급</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <select class="form-control" name="jobCode" required="required">
                          <option>직급을 선택하세요</option>
                          <c:forEach var='j' items="${joblist }">
                          <option value="${j.jobCode }">${j.jobName }</option>
                          </c:forEach>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12" required="required">직책</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                        <select class="form-control" name="positionNo">
                          <option>직책을 선택하세요</option>
                          <c:forEach var='p' items="${polist }">
                          <option value="${p.positionNo }">${ p.positionName }</option>
                          </c:forEach>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">서명</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="file" id="signature" name="signature" style="margin-top:5px;" required="required">
                      </div>
                    </div>
                 
                  <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12">사진</label>
                      <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="file" id="photo" name="photo" style="margin-top:5px;" required="required">
                      </div>
                    </div>
                     


				<div class="ln_solid"></div>
                    <div class="form-group">
                      <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <button type="reset" class="btn btn-primary">Cancel</button>
                        <button type="submit" class="btn btn-success">Submit</button>
                      </div>
                    </div>

                  </form>
                </div>
              </div>
            </div>
          </div>
							
							
							<!-- end  -->
							
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

	<script src="${contextPath }/resources/js/custom.js"></script>

<!-- /input tags -->
<!-- form validation -->
<script type="text/javascript">
  $(document).ready(function() {
    $.listen('parsley:field:validate', function() {
      validateFront();
    });
    $('#demo-form .btn').on('click', function() {
      $('#demo-form').parsley().validate();
      validateFront();
    });
    var validateFront = function() {
      if (true === $('#demo-form').parsley().isValid()) {
        $('.bs-callout-info').removeClass('hidden');
        $('.bs-callout-warning').addClass('hidden');
      } else {
        $('.bs-callout-info').addClass('hidden');
        $('.bs-callout-warning').removeClass('hidden');
      }
    };
  });

  $(document).ready(function() {
    $.listen('parsley:field:validate', function() {
      validateFront();
    });
    $('#demo-form2 .btn').on('click', function() {
      $('#demo-form2').parsley().validate();
      validateFront();
    });
    var validateFront = function() {
      if (true === $('#demo-form2').parsley().isValid()) {
        $('.bs-callout-info').removeClass('hidden');
        $('.bs-callout-warning').addClass('hidden');
      } else {
        $('.bs-callout-info').addClass('hidden');
        $('.bs-callout-warning').removeClass('hidden');
      }
    };
  });
  try {
    hljs.initHighlightingOnLoad();
  } catch (err) {}
</script>

	
	<!-- /footer content -->
</body>

</html>
