<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.dep.facing.model.vo.*"%>
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
									<h3>사내메일</h3>
								</div>
								<div class="col-md-6">

								</div>
							</div>

							<div class="col-md-12 col-sm-12 col-xs-12">
								<div id='calendar'></div>
							</div>

							<div class="clearfix">
						<form id="setRows">	   
            <!-- ====================================== -->	
							
							
			<div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2><i class="fa fa-bars"></i> Tabs <small>Float right</small></h2>
         
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <div class="" role="tabpanel" data-example-id="togglable-tabs">
                    <ul id="myTab1" class="nav nav-tabs bar_tabs right" role="tablist">
                      <li role="presentation" class=""><a href="${contextPath }/facingReceiveList.ms?loginUser=${sessionScope.loginUser.empNo}" id="home-tabb" role="tab"  aria-controls="home" aria-expanded="true">받은쪽지함</a>
                      </li>
                      <li role="presentation" class="active"><a href="${contextPath }/facinglist.ms?loginUser=${sessionScope.loginUser.empNo}"  role="tab" id="profile-tabb"  aria-controls="profile" aria-expanded="false">보낸쪽지함</a>
                      </li> 
                    
                     
                      </script>
                      <li role="presentation" class=""><a href="${contextPath }/facinginsertSelect.ms?loginUser=${sessionScope.loginUser.empNo}" role="tab" id="profile-tabb3"  aria-controls="profile" aria-expanded="false">쪽지보내기</a>
                      </li>
                    </ul>
                    
                    <div id="myTabContent2" class="tab-content">
                    
                      <div role="tabpanel" class="tab-pane fade active in" id="tab_content11" aria-labelledby="home-tab">
                     <div class="col-md-18 col-sm-18 col-xs-18">
              <div class="x_panel">
                <div class="x_title">
                  <h2>보낸쪽지함 <small>Users</small></h2>
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

                        <!-- <table id="datatable-keytable" class="table table-striped table-bordered"> -->
                        <table id="datatable-keytable" class="table table-striped">
                          <thead>
                            <tr>
                            
                              <th>날짜</th>
                              <th>받은사람</th>
                              <th>제목</th>
                              <th>받은날짜</th>
                              <th>삭제</th>
                            </tr>
                          </thead>

					
                          <tbody>
                          <c:forEach var="f" items="${FacingList}">
                            <tr>
                              <input type="hidden" value="${f.facingNo}" class="facingNo"/>
                              <td>${f.writeDate}</td> 
                              <td>${f.empName}</td>
                              <%-- <td><a href="${ contextPath }/facingSelectOne.ms?facingNo=${f.facingNo}">${f.facingTitle}</a></td> --%>
                              <td><a data-toggle="modal" data-target=".bs-example-modal-lg" class="showFacing" style="cursor:pointer">${f.facingTitle }</a></td>
                              <td>${f.facingContents }</td>
                              <td><button class="btn btn-round btn-default" type="button" onclick="updateFacing(${f.facingNo})"/>삭제하기</td>
                            </tr>
  							</c:forEach>
                                                     
                          </tbody>
                        </table>
                        
                        <div class="btnContent">
<script>
	$(function(){
		$('.showFacing').click(function(){
			var facingNo = $(this).parent().parent().children('input').val();
			console.log('클릭' + facingNo);
			
			$.ajax({
				url : "facingSelectOne.ms",
				data : {facingNo:facingNo},
				success : function(data){
					console.log('empName = ' + data.empName);
					console.log('content : ' + data.facingContents);
					var $div = $('.facingDiv');
					var $writer = $('#fullname');
					var $title = $('#email');
					var $content = $('#facingContent');
					var $fileNo = $('.fileNo');
					var $fileName = $('.fileName');
					var $oriName = $('.oriName');
					var $modiName = $('.modiName');
					$oriName.val(data.oriFileName);
					$modiName.val(data.modiFileName);
					$writer.val(data.empName);
					$title.val(data.facingTitle);
					$content.html(data.facingContents);
					$fileNo.val(data.facingNo);
					$fileName.text(data.oriFileName);
					
				},
				error : function(){
					console.log('error');
				}
			});
		});
	});
	
</script>
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
                           <form id="returnFacing">
                          <div class="x_panel facingDiv" style="overflow:auto; height:200px;">
                          
                          <input type="hidden" value="" class="oriName"/>
                          <input type="hidden" value="" class="modiName"/>
                          <input type="text" id="fullname" class="form-control" name="fullname" value='' required readonly/>
                          <input type="email" id="email" class="form-control" name="email" value='' data-parsley-trigger="change" required readonly />
                          <textarea id="facingContent" required="required" class="form-control" name="message" readonly></textarea>
                          
                          <button type="button" class="btn btn-primary fileName" type="button"></button>
                          </div>
                          </form>
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
						$('.fileName').click(function(){
							var oriName = $(this).parent().children('.oriName').val();
							var modiName = $(this).parent().children('.modiName').val();
							$.ajax({
								url : "facingDown.ms",
								data : {oriName:oriName, modiName:modiName},
								success : function(data){
									console.log('data : ' + data);
									console.log('fileName : ' + data.fileName);
									var blob=new Blob([data]);
	            	                var link=document.createElement('a');
	            	                link.href=window.URL.createObjectURL(blob);
	            	                link.download=oriName;
	            	                link.click();
								},
								error : function(){
									console.log('error');
								}
							});
							
						});
					});
				</script>
                        
                      </div>
                    </div>
                  </div>
                </div>

                </div>
                </div>
                </div>
                
            <!--     ======================================================== -->
                      </div>
                    
                    </div>
                  </div>

                </div>
              </div>
              </form>
            </div>
            
            <!-- ====================================== -->	
							
							
							
							
							
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
        <!-- 삭제하기 -->
<script>

function updateFacing(num){
	//var facingNo = $("#facingNo").val();
	var facingNo = num;
	/* var userNo = num2;
	console.log(typeof userNo);
	 */
	$.ajax({
		url:"updateFacing.ms",
		type:"post",
		data:
		{facingNo:facingNo,
	/* 	userNo:userNo	
	 */	},
		
		success:function(data){
					
			console.log("리스트값"+facingNo);
		 	alert("성공!" + userNo);
	
 			window.location = "facinglist.ms?loginUser="+userNo;
			
			/* if(data.length > 0){
			
			/* $("#datatable-keytable").html(""); */
			/* var $table = $("#datatable-keytable tbody");
			 
				

		for(var i = 0; i < data.length; i++){
				fcNo = data[i].num;
				console.log(fcNo);
				$table += "<tr>";
				$table += "<td>" + data[i].writeDate + "</td>";
				$table += "<td>" + data[i].empName + "</td>";
				$table += "<td onclick='detailFacing("+fcNo+");'>"+data[i].facingtitle+"</td>";
				$table += "<td>" + data[i].facingContents +"</td>";
				$table += "<td><button class='btn btn-round btn-default' type='button' onclick='updateFacing("+num+","+num2+");'>삭제하기</td>";
				$table += "</tr>";
			
                 
			}
				$("#datatable-keytable").append($table);
			} */
			
		},
		error:function(){
			console.log("에러!")
		}
	});
	
	return false;
}

/* function sibal(userNo)
{
	return loacation.href="${contextPath}/facingSelectOne.ms?facingNo="+userNo;
	
} */




</script>
	
	<!-- /footer content -->
</body>

</html>
