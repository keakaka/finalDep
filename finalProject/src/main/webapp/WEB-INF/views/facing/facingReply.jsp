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
									<h3>사내메일</h3>
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
                  <h2>메일보내기 </h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                     <!-- start form for validation -->
                  <form id="demo-form" data-parsley-validate action="facingInsert.ms?loginUser=${sessionScope.loginUser.empNo}" method="post" enctype="multipart/form-data" autocomplete="off">
                  
                    <!-- <label for="price">보내는사람 * :</label>
                    <input type="text" id="price" class="form-control" name="price" data-parsley-trigger="change" required /><br>
                     -->
					<label for="count">받는사람 * :</label>
                    <input type="text" id="count" class="form-control" name="receive" value="${f.empName}" readonly/><br>
                    <label>제목</label><br>
                    
                    <div class="well">
                    	 <fieldset>
	                        <div class="control-group">
	                          <div class="controls">
	                            <div class="col-md-11 xdisplay_inputx form-group has-feedback">
	                              <input type="text" class="form-control has-feedback-left" name="title" id="single_cal1" placeholder="제목을 입력하세요" aria-describedby="inputSuccess2Status" >
	                              <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
	                              <span id="inputSuccess2Status" class="sr-only">(success)</span>
	                            </div>
	                          </div>
	                        </div>
	                      </fieldset>
	                    </div>
                    
						<label>내용</label>
						<textarea id="summernote" name="mailContent" required>
							
						</textarea>
						<input type="hidden" id='memberNo' name="memberNo" value="">
	                  	<label>썸네일 : &nbsp; </label><input id='thumbnail' multiple="multiple" type="file" name="file" size=40>
	                  	<br><br>
	                  	
	                  	<button type="submit" id='Enrollment' class="btn btn-primary" style="width:400px;">보내기</button>
                        <br/>
                        <input type='hidden' id='hid' name='hid' value=''>	<!-- 유저 아이디 -->
						<input type='hidden' id='read' name='attachNo' value='food'>			<!-- Attach id 번호 -->
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
           
	       console.log(data);
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
                  $(editor).summernote('editor.insertImage', data);
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
    	        url: "", // replace with your url
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
</body>

</html>
