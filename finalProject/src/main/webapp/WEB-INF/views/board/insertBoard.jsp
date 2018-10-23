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
	
	
	<!-- summernote -->
	<link href="${contextPath }/resources/css/summernote.css" rel="stylesheet">
	<script src="${contextPath }/resources/js/summernote.js"></script>


	<!-- 추가  -->
	

	<link href="${contextPath }/resources/fonts/css/font-awesome.min.css" rel="stylesheet">
	<link href="${contextPath }/resources/css/editor/external/google-code-prettify/prettify.css" rel="stylesheet">
	<link href="${contextPath }/resources/css/editor/index.css" rel="stylesheet">
	<!-- select2 -->
  	<link href="${contextPath }/resources/css/select/select2.min.css" rel="stylesheet">
	
	
	


	

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
									<h3>부서 게시판</h3>
								</div>
								<div class="col-md-6">

								</div>
							</div>

							<div class="col-md-12 col-sm-12 col-xs-12">
								<div id='calendar'></div>
							</div>

							<div class="clearfix">
							<!-- 시작 -->
						  <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>${sessionScope.loginUser.depName}  <small>${sessionScope.loginUser.empName}  ${sessionScope.loginUser.jobName}</small></h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                     <!-- start form for validation -->
                  <form id="demo-form" data-parsley-validate action="writeBoard.bo" method="post" enctype="multipart/form-data">
                    <label for="fullname">제목 :</label>
                    <input type="text" id="boardTitle" class="form-control" name="boardTitle" required /><br>
                
	                <label>첨부파일 : &nbsp; </label><input multiple="multiple" type="file" name="file" size=40>
         
						<br><br>
						<textarea id="summernote" name="boardContent" required>
							
						</textarea>
						
	                  	<br><br>
	                  	<input type="hidden" name="empNo" value="${sessionScope.loginUser.empNo}"/>
	                  	<input type="hidden" name="depName" value="${sessionScope.loginUser.depName}"/>
	                  	<button type="submit" id='Enrollment' class="btn btn-primary" style="width:400px; float:right;">게시글 작성</button>
                        <br/>
                        
						
                        <script type="text/javascript">

                        <%-- 	$(function(){
		                		$.ajax({ 
		                            data : {
		                            	num:
		                            },
		                            type : "POST",
		                            url : "<%= request.getContextPath() %>/SellerFundingUsedCheck",
		                            success : function(data) {
		                            	if(data > 0){
		                            		$('.fundLabel').css('display','none');
		                            		$('#insertBak').css('display','none');
		                            		$('#typeSpan').append('<br><b><label style="color:red; text-decoration: underline;">귀하의 경우 펀딩상품이 존재하므로 펀딩상품을 작성하실수 없습니다.</label></b>');
		                            	}else{
		                            		
		                            	}
		                            },
		                            error:function(request,status,error){
		                            }
		
		                        });  
                        	})
                        
                        	$('.typeLabel').click(function(){
                        		$('.typeLabel').css('color','#73879c').css('border','none');
                        		$(this).css('color','#73879c').css('border','solid').css('border-style','inset');
                        		
                        		if($(this).text() == '상시 판매 상품'){
                        			$('#insertBak').prop('disabled',true);
                        			$('#insertBak').text('상시 판매 상품은 밭면적을 입력 할 필요 없습니다.').css('background','red');
                        			$('#count').val('').prop('readonly',false);
                        			$('#read').val('food');
                        		}else{
                        			$('#insertBak').prop('disabled',false);
                        			$('#insertBak').text('농가 면적 기입').css('background','green');
                        			$('#count').val('펀딩의 경우 농가면적 작성시 작성한 갯수만큼 수량으로 들어갑니다.').prop('readonly',true);
                        			$('#read').val('');
                        		}
                        	})
                        	
         				    function popupOpen()
					        {
								var popUrl = "<%=request.getContextPath() %>/views/common/InsertFarmAreaPopup.jsp";	//팝업창에 출력될 페이지 URL
								var popOption = "width=1050, height=600, resizable=no, scrollbars=no, status=no,location=no;";    //팝업창 옵션(optoin)
					            window.name = "parentForm";
					            window.open(popUrl,"", popOption);    
					        }

                        	function changeBtn(){
                        		$('#insertBak').text('농가 면적 입력 완료').css('background','blue');
                        	}
					        
					        $(function(){
					        	console.log($("input[name$='productType']").val());

					        	$('#thumbnail').css('display', 'inline-block');
					        	
					        	$('#Enrollment').click(function(){
					        		
					        		if($('#proName').val() == ''){
					        			alert('상품이름의 작성해주세요.');
					        			return false;
					        		} 
									if($('#price').val() == ''){
										alert('상품의 가격을 작성해주세요.');
					        			return false;
									}
									if($('#count').val() == ''){
										alert('상품의 수량을 작성해주세요.');
					        			return false;
					        		}
					        		
					        		if($('#read').val() == ''){
					        			alert('농가 면적을 기입해야 합니다.');
					        		}else{
					        			if( $("#thumbnail").val() != '' ){
					        				var ext = $('#thumbnail').val().split('.').pop().toLowerCase();
				        				      if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
				        						 alert('이미지 파일만 업로드 할수 있습니다.');
				        				      }else{
							        			$('#demo-form').submit();
				        				      }
				        				}else{
				        					alert('썸네일 이미지를 올리셔야합니다.');
				        				}
					        			
					        		}
					        	});
					        }) --%>
						</script>
						
                  </form>
                  <br>
                  <!-- end form for validations -->
                 

                </div>
              </div>
            </div>
          </div>
        </div>
        
							
							
							<!-- 끝 -->
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
				/footer content
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
	<%-- <script type="text/javascript" src="${contextPath }/resources/js/gauge/gauge.min.js"></script>
	<script type="text/javascript" src="${contextPath }/resources/js/gauge/gauge_demo.js"></script> --%>
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

	<!-- 추가  -->
	
 
 
  <!-- pace -->
  <script src="${contextPath }/resources/js/pace/pace.min.js"></script>
  
  <!-- form validation -->
  <script src="${contextPath }/resources/js/validator/validator.js"></script>

<script type="text/javascript">
        /* summernote에서 이미지 업로드시 실행할 함수 */
        function sendFile(file, editor) {
            // 파일 전송을 위한 폼생성
          data = new FormData();
           data.append("uploadFile", file);
           
	       //console.log(data);
             $.ajax({ // ajax를 통해 파일 업로드 처리
               data : data,
               type : "POST",
               url : "imgUpload.bo",
               cache : false,
               contentType : false,
               enctype: 'multipart/form-data',
               processData : false,
               success : function(data) { // 처리가 성공할 경우
                    // 에디터에 이미지 출력
                    console.log(data);
                 // $(editor).summernote('editor.insertImage', data);
                  $(editor).summernote('editor.insertImage', "/dep/resources/uploadFiles/"+ data);
               },
               error:function(request,status,error){
                  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                
               
               }

           }); 
       }
       
       
       function deleteFile(src) {
			
    	    $.ajax({
    	        data: {src : src},
    	        type: "POST",
    	        url: "imgDelete.bo", // replace with your url
    	        cache: false,
    	        success: function(data) {
    	            console.log(data);
    	            alert('삭제완료');
    	        }
    	    });
    	    
    	}
   </script>

		<script>
             $(document).ready(function() {
         	  	 var fileExtension = ['.jpg', '.png', '.jpeg', '.gif',];
                $('#summernote').summernote({ // summernote를 사용하기 위한 선언
                    height: 300,
                    lang: 'ko-KR',
                    toolbar: [
                        // [groupName, [list of button]]
                        ['style', ['bold', 'italic', 'underline', 'clear']],
                        ['font', ['strikethrough', 'superscript', 'subscript']],
                        ['fontsize', ['fontname', 'fontsize']],
                        ['color', ['color']],
                        ['para', ['ul', 'ol', 'paragraph']],
                        ['height', ['height']],
                        ['insert', ['picture', 'link', 'video', 'table', 'hr']]
                      ],
	                callbacks: { // 콜백을 사용
                        // 이미지를 업로드할 경우 이벤트를 발생
                   onImageUpload: function(files, editor, welEditable) {
                       //console.log(files);
                         
                         for (var i = files.length - 1; i >= 0; i--) {
                        	 
                         	for(var j = 0; j < fileExtension.length; j++){
                         		var extleng = files[i].name.length;
                         		var extdot = files[i].name.lastIndexOf('.');
                         		var ext = files[i].name.substring(extdot, extleng).toLowerCase();

                        		 //console.log(ext + ' / ' + fileExtension[j]) 
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
</body>

</html>
