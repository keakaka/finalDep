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

        <div class="">
          <div class="page-title">
            <div class="title_left">
              <h3>문서 기안</h3>
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
                  <h2>기안하기</small></h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <!-- Smart Wizard -->
                  <div id="wizard" class="form_wizard wizard_horizontal">
                    <ul class="wizard_steps">
                      <li>
                        <a href="#step-1">
                          <span class="step_no">1</span>
                          <span class="step_descr">
                                            	1. 작성 <br />
                                            <small>문서를 작성하세요</small>
                                        </span>
                        </a>
                      </li>
                      <li>
                        <a href="#step-2">
                          <span class="step_no">2</span>
                          <span class="step_descr">
                                            2. 결재선 관리<br />
                                            <small>결재선 및 수신참조자를 설정하세요</small>
                                        </span>
                        </a>
                      </li>
                    </ul>
                   <form class="form-horizontal form-label-left" id="signForm" action="insertSign.sg" method="post" enctype="multipart/form-data">
                   <input type="hidden" value="${loginUser.empNo }" name="empNo"/>
                    <div id="step-1">
						<h2 class="StepTitle">문서 작성</h2><br>
						
						<label align="center">문서 제목</label><br>
						<input type="text" name="signTitle" required style="width:70%;">
						<br><br>
						<label align="center">문서 내용</label><br>
						<textarea id="summernote" name="signContent" required>
							
						</textarea>
						<input type="file" name="signFile"/>
                    </div>
                    <div id="step-2">
                    <h2 class="StepTitle">결재선 지정<small>(결재 순서대로 추가해주세요)</small></h2>
                       <div class="clearfix"></div>

            <div class="col-md-12 col-sm-12 col-xs-16">
              <div class="x_panel">
                <div class="x_content">
                    <!-- required for floating -->
                    <!-- Nav tabs -->
                    <br><br>
                    
				<script>
					$(function(){
						$("#depList").change(function(){
							var depName = $("#depList option:selected").val();
							console.log(depName);
							$.ajax({
								url : "depEmpSelect.sg",
								data : {depName : depName},
								success : function(data){
									var $tbody = $('.depMemberList');
									$tbody.html("");
									var i = 0;
									$.each(data, function(index, val){
										var ename = decodeURIComponent(val.empName);
										var $tr = $("<tr role='row' class='odd'>");
										var $empNo = $('<td>').text(decodeURIComponent(val.empNo));
										var $empName = $('<td class="ename">').text(decodeURIComponent(val.empName));
										var $depName = $('<td>').text(decodeURIComponent(val.depName));
										var $jobName = $('<td>').text(decodeURIComponent(val.jobName));
										var $positionName = $('<td>').text(decodeURIComponent(val.positionName));
										var $appButton = $('<td>').html('<button type="button" class="btn btn-default btn-xs appBtn">결재선에 추가</button>');
										var $recButton = $('<td>').html('<button type="button" class="btn btn-default btn-xs recBtn">수신참조자에 추가</button>');
										var $hidden = $('<input type="hidden" value="'+ename+'">'); 
										
										$tr.append($hidden);
										$tr.append($empNo);
										$tr.append($empName);
										$tr.append($depName);
										$tr.append($jobName);
										$tr.append($positionName);
										$tr.append($appButton);
										$tr.append($recButton);
										$tbody.append($tr);
										
									})
										$(function(){
									        $(".appBtn").click(function(){
									        	
									        	var $appBody = $('.appTable');
									        	var $appTr = $('<tr role="row" class="odd">');
									        	var appName = $(this).parent().parent().children('input').val();
									        	var $appName = $('<td name="appList">').text(appName);
									        	var $appTd = $('<td align="center">');
									        	var $resetApp = $('<button type="button" class="btn btn-default btn-xs resApp">X</button>');
									        	var $empNo = $(this).parent().parent().children('td').eq(0).text();
									        	var $appHidden = $('<input type="hidden" value="'+$empNo+'" name="appList">'); 
									        	var appEno = new Array();
									        	var recEno = new Array();
									        	var appOverlap = true;
									        	var recOverlap = true;
									        	var selfOverlap = true;
									        	$('.recTable tr').each(function() {
									        	    recEno.push($(this).find("input").val());
									        	});
									        	$('.appTable tr').each(function() {
									        	    appEno.push($(this).find("input").val());
									        	});
									        	
									        	if($empNo == ${loginUser.empNo}){
									        		selfOverlap = false;
									        	}
									        	for(var i in appEno){
									        		if(appEno[i] == $empNo || appEno.length == 0){
									        			appOverlap = false;
									        		}else{
									        			appOverlap = true;
									        		}
									        	}
									        	for(var i in recEno){
									        		if(recEno[i] == $empNo || recEno.length == 0){
									        			recOverlap = false;
									        		}else{
									        			recOverlap = true;
									        		}
									        	}
									        	if(appOverlap == true && recOverlap == true && selfOverlap == true){
									        		$appTd.append($resetApp);
										        	$appTr.append($appName);
										        	$appTr.append($appTd);
										        	$appTr.append($appHidden);
										        	$appBody.append($appTr);
									        	}else if(appOverlap == false){
									        		alert('이미 결재선에 추가 된 사원입니다.');
									        	}else if(recOverlap == false){
									        		alert('이미 수신 참조된 사원입니다.');
									        	}else if(selfOverlap == false){
									        		alert('자기 자신은 추가할 수 없습니다.');
									        	}
									        	$(function(){
													$(".resApp").click(function(){
														var $thisAppTr = $(this).parent().parent('tr');
														$thisAppTr.remove();
													});
												});
									        });
								        });
									
										$(function(){
									        $(".recBtn").click(function(){
									        	var $recBody = $('.recTable');
									        	var $recTr = $('<tr role="row" class="odd">');
									        	var recName = $(this).parent().parent().children('input').val();
									        	var $recName = $('<td name="recList">').text(recName);
									        	var $recTd = $('<td align="center">');
									        	var $resetRec = $('<button type="button" class="btn btn-default btn-xs resRec">X</button>');
									        	var $empNo = $(this).parent().parent().children('td').eq(0).text();
									        	var $recHidden = $('<input type="hidden" value="'+$empNo+'" name="recList">'); 
									        	var appEno = new Array();
									        	var recEno = new Array();
									        	var appOverlap = true;
									        	var recOverlap = true;
									        	var selfOverlap = true;
									        	$('.recTable tr').each(function() {
									        	    recEno.push($(this).find("input").val());
									        	});
									        	$('.appTable tr').each(function() {
									        	    appEno.push($(this).find("input").val());
									        	});
									        	
									        	if($empNo == ${loginUser.empNo}){
									        		selfOverlap = false;
									        	}
									        	for(var i in appEno){
									        		if(appEno[i] == $empNo || appEno.length == 0){
									        			appOverlap = false;
									        		}else{
									        			appOverlap = true;
									        		}
									        	}
									        	for(var i in recEno){
									        		if(recEno[i] == $empNo || recEno.length == 0){
									        			recOverlap = false;
									        		}else{
									        			recOverlap = true;
									        		}
									        	}
									        	if(appOverlap == true && recOverlap == true && selfOverlap == true){
									        		$recTd.append($resetRec);
										        	$recTr.append($recName);
										        	$recTr.append($recTd);
										        	$recTr.append($recHidden);
										        	$recBody.append($recTr);
									        	}else if(appOverlap == false){
									        		alert('이미 결재선에 추가 된 사원입니다.');
									        	}else if(recOverlap == false){
									        		alert('이미 수신 참조된 사원입니다.');
									        	}else if(selfOverlap == false){
									        		alert('자기 자신은 추가할 수 없습니다.');
									        	}
									        	$(function(){
													$(".resRec").click(function(){
														var $thisRecTr = $(this).parent().parent('tr');
														$thisRecTr.remove();
													});
												});
									        });
									        	
								        });
										
										
										
								},
								error : function(){
									
								}
							});
							
						});
					});
					
			        
			        
			        
			        
			        
				</script>

                  <div class="col-xs-12">
                    <!-- Tab panes -->
                    <div class="tab-content">
                      <div class="tab-pane active" id="home">
                <div class="x_title">
                
                  <select id="depList">
                  	<option>====</option>
                  	<c:forEach var="d" items="${depList}">
                        <option>${d.depName}</option>
                   </c:forEach> 
				  </select>
				  <button type="button" onclick="resetApp();" class="btn btn-default btn-xs">결재선 및 수신 참조자 재설정</button>
				  <script>
				  	function resetApp(){
				  		var recTable = $('.recTable');
				  		var appTable = $('.appTable');
				  		var check = window.confirm('결재선과 수신 참조자를 초기화 하시겠습니까?');
				  		if(check == true){
					  		recTable.html("");
					  		appTable.html("");
				  		}else{
				  			
				  		}
				  	}
				  	
				  </script>
                  <div class="clearfix"></div>
                </div>
				
                <div class="clearfix"></div>

          <div class="row">
			
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_content">
                  
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                      	<th>사원번호</th>
                        <th>이름</th>
                        <th>부서명</th>
                        <th>직급</th>
                        <th>직책</th>
                        <th>결재선에 추가</th>
                        <th>수신 참조자에 추가</th>
                      </tr>
                    </thead>
                    <tbody class="depMemberList">
                    </tbody>
                  </table>
                  
                </div>
            <div class="col-xs-3">
            <table class="table table-bordered">
	      		<thead>
	               <tr>
	               	<th colspan="2">결&nbsp;&nbsp;재&nbsp;&nbsp;자</th>
	               </tr>
	             </thead>
	             <!-- <input type="hidden" name="appList" class="appList" value=""/> -->
	             <tbody class="appTable">
	             </tbody>
	        </table>
	        </div>
	        <div class="col-xs-3">
	        <table class="table table-bordered">
	      		<thead>
	               <tr>
	                <th colspan="2">수신참조자</th>
	               </tr>
	             </thead>
	             <!-- <input type="hidden" name="recList" class="recList" value=""/> -->
	             <tbody class="recTable">
	             </tbody>
	        </table>
	        </div>
            
            </div>
            </div>            
            </div>
            </div>
            </div>
            </div>
            </div>
            </div>
            </div>
                      
                    </div>
                    </form>
					</div>
            		</div>
                  </div>
                  <!-- End SmartWizard Content -->
                </div>
              </div>
            </div>
				<!-- footer content -->

				<footer>
					<div class="copyright-info">
						<p class="pull-right">DBDBDep - B오전 Final Project by <a href="http://www.iei.or.kr/main/main.kh?src=overture&kw=003DFA&gclid=Cj0KCQjw9ZDeBRD9ARIsAMbAmoZTJZP5ENi7OkIuimgnF0lSAzQFJc29u1JYoV58VDyCQIAEFRCY9SEaAr4hEALw_wcB">KH Academy</a>
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
	<script>
             $(document).ready(function() {
         	  	 var fileExtension = ['.jpg', '.png', '.jpeg', '.gif',];
                $('#summernote').summernote({ // summernote를 사용하기 위한 선언
                    height: 500,
                    lang: 'ko-KR',
                    toolbar: [
                        // [groupName, [list of button]]
                        ['style', ['bold', 'italic', 'underline', 'clear']],
                        ['font', ['strikethrough', 'superscript', 'subscript']],
                        ['fontsize', ['fontname', 'fontsize']],
                        ['color', ['color']],
                        ['para', ['ul', 'ol', 'paragraph']],
                        ['height', ['height']],
                        ['insert', ['table', 'hr']]
                      ],
	                callbacks: { // 콜백을 사용
                        // 이미지를 업로드할 경우 이벤트를 발생
                   onImageUpload: function(files, editor, welEditable) {
                       console.log(files);
                         
                         for (var i = files.length - 1; i >= 0; i--) {
                        	 
                         	for(var j = 0; j < fileExtension.length; j++){
                         		var extleng = files[i].name.length;
                         		var extdot = files[i].name.lastIndexOf('.');
                         		var ext = files[i].name.substring(extdot, extleng).toLowerCase();

                        		 console.log(ext + ' / ' + fileExtension[j]) 
                        	 if(ext == fileExtension[j]){
                     		  sendFile(files[i], this); 
                         	}
                            }
                         }
                  },
                  onMediaDelete : function(target) {
                      alert(target[0].src);
                      deleteFile(target[0].src);
                      console.log(target[0].src)
               }
            }});
         }); 


    </script>
	<link href="${contextPath }/resources/css/summernote.css" rel="stylesheet">
	<script src="${contextPath }/resources/js/summernote.js"></script>
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
	<!-- form wizard -->
  	<script type="text/javascript" src="${contextPath }/resources/js/wizard/jquery.smartWizard.js"></script>
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
	<!-- pace -->
        <script src="js/pace/pace.min.js"></script>
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
		<script>
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
	<!-- /footer content -->
</body>
<script type="text/javascript">
    $(document).ready(function() {
      // Smart Wizard
      $('#wizard').smartWizard();

      function onFinishCallback() {
        $('#wizard').smartWizard('showMessage', 'Finish Clicked');
        alert('Finish Clicked');
        console.log('클릭');
      }
    });

    $(document).ready(function() {
      // Smart Wizard
      $('#wizard_verticle').smartWizard({
        transitionEffect: 'slide'
      });

    });
  </script>
  
  
</html>
