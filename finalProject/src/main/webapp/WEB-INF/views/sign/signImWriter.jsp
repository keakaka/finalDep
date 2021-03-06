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

	<title>DBDBDep!</title>

	<!-- Bootstrap core CSS -->
	<link href="${contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${contextPath }/resources/fonts/css/font-awesome.min.css" rel="stylesheet">
	<link href="${contextPath }/resources/css/animate.min.css" rel="stylesheet">
	<!-- Custom styling plus plugins -->
	<link href="${contextPath }/resources/css/custom.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/maps/jquery-jvectormap-2.0.3.css" />
	<link href="${contextPath }/resources/css/icheck/flat/green.css" rel="stylesheet" />
	<script src="${contextPath }/resources/js/jquery.min.js"></script>
	<link href="${contextPath }/resources/js/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath }/resources/js/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath }/resources/js/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath }/resources/js/datatables/fixedHeader.bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath }/resources/js/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="${contextPath }/resources/js/datatables/scroller.bootstrap.min.css" rel="stylesheet" type="text/css" />
	
</head>


<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">

					<jsp:include page="../common/sidebar.jsp"/>


			<!-- page content -->
      <div class="right_col" role="main">
        <div class="">
          <div class="page-title">
            <div class="title_left">
              <h3> 기안함 </h3>
            </div>

            <div class="title_right">
              <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
              </div>
            </div>
          </div>
          <div class="clearfix"></div>

          <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>내가 올린 문서</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <table id="datatable" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                        <th>문서번호</th>
                        <th>제목</th>
                        <th>기안자</th>
                        <th>작성일자</th>
                        <th>결재상태<small>(진행상태 클릭)</small></th>
                        <th>문서 보기</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="d" items="${list}">
                    	<tr>
                    		<td>${d.docNo }</td>
                    		<td>${d.docTitle }</td>
                    		<td>${d.writer }</td>
                    		<td>${d.writeDate }</td>
                    		<c:if test="${d.appStatus > 0 && d.appReject == 0}">
                    			<td><a data-toggle="modal" data-target=".bs-example-modal-lg" class="showAppProg" style="cursor:pointer">결재 진행중</a></td>
                    		</c:if>
                    		<c:if test="${d.appStatus < 1 && d.appReject == 0}">
                    			<td><a data-toggle="modal" data-target=".bs-example-modal-lg" class="showAppProg" style="cursor:pointer">결재 완료</a></td>
                    		</c:if>
                    		<c:if test="${d.appReject > 0}">
                    			<td><a data-toggle="modal" data-target=".bs-example-modal-lg" class="showAppProg" style="cursor:pointer">결재 반려</a></td>
                    		</c:if>
                    		<td align="center"><button type="button" class="btn btn-default btn-xs showDoc">문서 보기</button></td>
                    	</tr>
					</c:forEach> 
                      
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
           </div>
           <!-- Large modal -->

                <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">결재 진행 상태 보기</h4>
                      </div>
                      <div class="modal-body">
                        <div class="col-md-12 col-sm-12 col-xs-12">
		              		<div class="x_panel">
		                  <table class="table table-bordered appProg">
		                    <thead>
		                    </thead>
		                    <tbody>
		                    </tbody>
		                  </table>
				              </div>
				            </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                      </div>

                    </div>
                  </div>
                </div>
           
           <script>
            	$(function(){
            		$(".showAppProg").click(function(){
            			var docNo = $(this).parent().parent().children('td').eq(0).text();
            			
            			$.ajax({
            				url : "showAppProg.sg",
            				data : {docNo:docNo},
            				success : function(data){
            					var $appProg = $(".appProg");
            					$appProg.html('');
            					var $tr = $("<tr>");
            					var $writer = $('<td align="center" style="font-weight:bold;">').text('결재자');
            					$tr.append($writer);
            					$.each(data, function(index, val){
									var $td = $("<td align='center'>").text(decodeURIComponent(val.writer));
									$tr.append($td);
								});
								
            					var $tr2 = $("<tr>");
            					var $status = $('<td align="center" style="font-weight:bold;">').text('결재상태');
            					$tr2.append($status);
            					$.each(data, function(index, val){
            						var status = "";
            						console.log("val stats : " + val.approvalStatus);
            						if(val.approvalStatus == 'AP1'){
            							status = '결재 대기중';
            						}else if(val.approvalStatus == 'AP2'){
            							status = '승인';
            						}else if(val.approvalStatus == 'AP3'){
            							status = '반려';
            						}
									var $td = $("<td align='center'>").text(status);
									$tr2.append($td);
								});
            					var $tr3 = $("<tr>");
            					var $date = $('<td align="center" style="font-weight:bold;">').text('결재일자');
            					$tr3.append($date);
            					$.each(data, function(index, val){
            						var date = decodeURIComponent(val.approvalDate);
            						if(date == "null"){
            							date = "-";
            						}
									var $td = $("<td align='center'>").text(date);
									$tr3.append($td);
								});
            					var $tr4 = $("<tr>");
            					var $reason = $('<td align="center" style="font-weight:bold;">').text('사유');
            					$tr4.append($reason);
            					$.each(data, function(index, val){
            						var reason = decodeURIComponent(val.appReason);
            						if(reason == "null"){
            							reason = "-";
            						}
									var $td = $("<td align='center'>").text(reason);
									$tr4.append($td);
								});
            					
								$appProg.append($tr);
								$appProg.append($tr2);
								$appProg.append($tr3);
								$appProg.append($tr4);
            				},
            				error : function(){
            					console.log('error');
            				}
            			});
            		});
            	});
            </script>
            <script>
            	$(function(){
            		$(".showDoc").click(function(){
            			var docNo = $(this).parent().parent().children('td').eq(0).text();
            			var url = "showDoc.sg?docNo="+docNo;
            			var popupOption = "width = " + 1000 + ", height = " + 500;
            			window.open(url, "", popupOption);
            		});
            	});
			</script>
            
				<!-- footer content -->

				<footer>
				
					<div class="copyright-info">
						<p class="pull-right">DBDBDep - B오전 Final Project by 
						<a href="http://www.iei.or.kr/main/main.kh?src=overture&kw=003DFA&gclid=Cj0KCQjw9ZDeBRD9ARIsAMbAmoZTJZP5ENi7OkIuimgnF0lSAzQFJc29u1JYoV58VDyCQIAEFRCY9SEaAr4hEALw_wcB">KH Academy</a>
						</p>
					</div>
					<div class="clearfix"></div>
				</footer>
				<!-- /footer content -->
			</div>
			<!-- /page content -->

		</div>
		</div>
            </div>
            </div>
	</div>

	<div id="custom_notifications" class="custom-notifications dsp_none">
		<ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
		</ul>
		<div class="clearfix"></div>
		<div id="notif-group" class="tabbed_notifications"></div>
	</div>
	
	
	
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
    <!-- Datatables-->
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
    
	<script src="${contextPath }/resources/js/bootstrap.min.js"></script>
	<!-- gauge js -->
	<script type="text/javascript" src="${contextPath }/resources/js/gauge/gauge.min.js"></script>
	<script type="text/javascript" src="${contextPath }/resources/js/gauge/gauge_demo.js"></script>
	<!-- bootstrap progress js -->
	<script src="${contextPath }/resources/js/nicescroll/jquery.nicescroll.min.js"></script>
	<!-- icheck -->
	<script src="${contextPath }/resources/js/icheck/icheck.min.js"></script>

	<script src="${contextPath }/resources/js/custom.js"></script>

	
	<!-- /footer content -->
</body>

</html>
