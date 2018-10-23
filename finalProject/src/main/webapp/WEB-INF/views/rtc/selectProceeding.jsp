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

	<title>DBDBDep! </title>

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
              <h3> 회의록 보기 </h3>
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
                  <h2>저장한 회의록</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                <input type="hidden" value="${loginUser.empNo }" class="empNo">
                  <table id="datatable" class="table table-striped table-bordered">
                   <thead>
                      <tr>
                        <th>회의록 번호</th>
                        <th>참석한 방 이름</th>
                        <th>저장일자</th>
                        <th>회의록 보기</th>
                        <th>삭제</th>
                      </tr>
                    </thead>
                    <tbody>
						<c:forEach var="d" items="${list}">
                    	<tr>
                    		<td>${d.proceedNo }</td>
                    		<td>${d.roomName }</td>
                    		<td>${d.saveDate }</td>
                    		<td align="center"><a data-toggle="modal" data-target=".bs-example-modal-lg" class="showProceeding" style="cursor:pointer">회의록 보기</a></td>
                    		<td align="center"><button type="button" class="btn btn-default btn-xs deleteProceeding">삭제</button></td>
                    		<input type="hidden" value="${d.roomContent }" class="contentValue">
                    	</tr>
					</c:forEach> 
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            </div>
           <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">저장내용 보기</h4>
                      </div>
                      <div class="modal-body">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                        	<form id="saveProceeding">
		              		<div class="x_panel proceedDiv" style="overflow:auto; height:200px;">
				              </div>
				              </form>
				            </div>
                      </div>
                      <div class="modal-footer">
                      	<button type="button" class="btn btn-default saveProceeding">파일로 저장</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                      </div>

                    </div>
                  </div>
                </div>
            <script>
            	$(function(){
            		$(".showProceeding").click(function(){
            			roomName = $(this).parent().parent().children('td').eq(1).text();
            			var $div = $('.proceedDiv');
            			$div.html('');
            			var $td = $('<td>');
            			$content = $(this).parent().parent().children('.contentValue').val();
            			var $pre = $('<pre style="overflow:auto;">').html($content);
            			$td.append($pre);
            			$div.append($pre);
            		});
            	});
            	$(function(){
            		$(".saveProceeding").click(function(){
            			var text = $content;
            			console.log(text);
            			$.ajax({
            				url : "saveProceeding.rtc",
            				data : {text:text, roomName:roomName},
            				type : "POST",
            				success : function(data){
            					console.log(data);
            					var blob=new Blob([data]);
            	                var link=document.createElement('a');
            	                link.href=window.URL.createObjectURL(blob);
            	                link.download=roomName+".txt";
            	                link.click();
            				},
            				error : function(){
            					console.log('세이브에러');
            				}
            			});
            			
            		});
            	});
            	
            	$(function(){
            		$(".deleteProceeding").click(function(){
            			var proceedNo = $(this).parent().parent().children('td').eq(0).text();
            			var empNo = $('.empNo').val();
            			var check = confirm('회의록을 삭제하시겠습니까?');
            			if(check == true){
            				$.ajax({
                				url : "deleteProceeding.rtc",
                				data : {proceedNo:proceedNo, empNo:empNo},
                				type : "POST",
                				success : function(data){
                					if(data > 0){
                						alert('회의록을 삭제했습니다.');
                						location.href="selectProceeding.rtc?empNo="+empNo;
                					}else{
                						alert('회의록 삭제에 실패했습니다.');
                					}
                				},
                				error : function(){
                					console.log('error');
                				}
                			});
            			}
            			
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
