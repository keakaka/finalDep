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

<!-- font-awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">

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

<!--[if lt IE 9]>
	<script src="../assets/js/ie8-responsive-file-warning.js"></script>
	<![endif]-->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<style>

#myImage {
    width: 500px;
}

#updateImg {
	text-align: center;
	width: 273px;
    margin-left: auto;
    margin-right: auto;
}

#userPhoto {
	/* width : 250px;
	height : 320px; */
    width: 340px;
    height: 500px;
} 

#uploadBtn:hover{
	cursor:pointer;
}

#normalInfo {
    margin-top: 70px;
    font-size: 1.3em;
}

#updateBtn {
	margin-left: 300px;
    margin-top: 20px;
    background-color: #2a3f54;
}

#findFile {
	width:200px;
	display:inline-block;
	color: #333a5c;
}

</style>
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
												마이페이지 <small>내 정보</small>
											</h3>

											<!-- <div id="content"> -->
											<!-- 이미지 변경 -->
											<div id="myImage">
											<form id="fileForm" action="updateMyImage.me" method="post" enctype="multipart/form-data">
												<img src="${contextPath }/resources/uploadFiles/${sessionScope.loginUser.modiFileName}" alt="..." class="img-circle profile_img" id="userPhoto">
												<div id="updateImg">
													<br>
													<input type="file" name="findFile" id="findFile">
													<!-- <button type="button" onclick="imageUpdate()">업로드</button> -->
													<i id="uploadBtn" class="fas fa-file-upload fa-2x" onclick="imageUpdate()"></i>
												</div>
											</form>
											</div>

										</div>
										<div class="col-md-6">
											<div id="normalInfo">
												<form id="myInfo" class="form-horizontal form-label-left"
													method="post">
													<div id="info1">
														<h4 style="color: #34495E;"></h4>

														<%-- <div>
															<label for="empNo">사원번호</label>
															<input type="text" id="empNo" name="empNo"
																   value="${loginUser.empNo }" readonly>
														</div> --%>

														<div class="form-group">
															<label class="control-label col-md-3 col-sm-3 col-xs-12"
																for="empId">아이디</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input type="text" id="empId" name="empId"
																	value="${loginUser.empId }" readonly
																	class="form-control col-md-7 col-xs-12">
															</div>
														</div>


														<div class="form-group">
															<label class="control-label col-md-3 col-sm-3 col-xs-12"
																for="empPwd">비밀번호 </label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input type="password" id="empPwd" name="empPwd"
																	class="form-control col-md-7 col-xs-12">
															</div>
														</div>

														<div class="form-group">
															<label class="control-label col-md-3 col-sm-3 col-xs-12"
																for="empName">이름</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input type="text" id="empName" name="empName"
																	value="${loginUser.empName }"
																	class="form-control col-md-7 col-xs-12">
															</div>
														</div>

														<div class="form-group">
															<label for="depName"
																class="control-label col-md-3 col-sm-3 col-xs-12">
																부서 </label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input type="text" id="depName" name="depName"
																	class="form-control col-md-7 col-xs-12" readonly
																	value="${loginUser.depName }">
															</div>
														</div>

														<div class="form-group">
															<label for="jobName"
																class="control-label col-md-3 col-sm-3 col-xs-12">직급</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input type="text" id="jobName" name="jobName"
																	class="form-control col-md-7 col-xs-12"
																	value="${loginUser.jobName }" readonly>
															</div>
														</div>

														<div class="form-group">
															<label class="control-label col-md-3 col-sm-3 col-xs-12"
																for="phone">연락처(휴대폰) </label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input type="text" id="phone" name="phone"
																	value="${loginUser.phone }"
																	class="form-control col-md-7 col-xs-12">
																<!-- 핸드폰 번호 공개여부 설정 -->
																<c:if test="${loginUser.phoneReveal  == 'Y' }">
																공개<input type="checkbox" id="phoneReveal"
																	name="phoneReveal" size="5" checked="checked">
																</c:if>
																<c:if test="${loginUser.phoneReveal  == 'N' }">
																공개<input type="checkbox" id="phoneReveal"
																	name="phoneReveal" size="5">
																</c:if>
															</div>
														</div>



														<div class="form-group">
															<label class="control-label col-md-3 col-sm-3 col-xs-12"
																for="emergencyPhone">비상연락처 </label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input type="text" id="emergencyPhone"
																	name="emergencyPhone"
																	value="${loginUser.emergencyPhone }"
																	class="form-control col-md-7 col-xs-12">
															</div>
														</div>

														<div class="form-group">
															<label for="email"
																class="control-label col-md-3 col-sm-3 col-xs-12">
																이메일 </label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input id="email"
																	class="form-control col-md-7 col-xs-12" type="email"
																	value="${loginUser.email }" name="email">
															</div>
														</div>

														<div class="form-group">
															<label class="control-label col-md-3 col-sm-3 col-xs-12"
																for="address">주소 </label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input type="text" id="address" name="address"
																	value="${loginUser.address }"
																	class="form-control col-md-7 col-xs-12">
															</div>
														</div>

														<%-- <div>
															<label for="salary">기본급</label>
															<input type="text" id="salary" name="salary"
																   value="${loginUser.salary }" readonly>
														</div> --%>
														<div class="form-group">
															<label for="hireDate"
																class="control-label col-md-3 col-sm-3 col-xs-12">입사일</label>
															<div class="col-md-6 col-sm-6 col-xs-12">
																<input id="hireDate" name="hireDate"
																	class="form-control col-md-7 col-xs-12" type="text"
																	value="${loginUser.hireDate }" readonly>
															</div>
														</div>

													</div>

													<!-- <button type="submit">수정하기</button> -->
													<!-- <button type="button" id="updateBtn" onclick="check()">수정확인</button> -->
													<button type="button" class="btn btn-primary" id="updateBtn" onclick="check()">수정확인</button>
													<!-- <input type="submit" value="수정"> -->
												</form>

												<script>
												
													function check(){
														var empId=$("#empId").val();
														var empPwd=$("#empPwd").val();
														var empName=$("#empName").val();
														var phone=$("#phone").val();
														
														var check;
														if($("#phoneReveal").is(":checked")){
															check = 1;
														}
														else{
															check = 0;
														}
														
														
														var emergencyPhone=$("#emergencyPhone").val();
														var email=$("#email").val();
														var address=$("#address").val();
														
														if(empPwd == ""){
															alert("비밀번호를 입력해주세요.");
														}
														else{
															$.ajax({
																type : "post",
																url : "updateMyInfo.me",
																data : {empId:empId, empPwd:empPwd, empName:empName, phone:phone,
																	check:check, emergencyPhone:emergencyPhone, email:email, address:address},
																dataType : "json",
																success : function(data) {
																	console.log(data);
																	console.log(typeof data);
																	if(!data){
																		alert("비밀번호가 올바르지 않습니다.");
																	}
																	else{
																		alert("수정이 완료되었습니다.");
																	}
																},
																error : function(data) {
																	console.log(data);
																}
															});
														}
													}
													
													function imageUpdate(){
														
														var formData = new FormData($("#fileForm")[0]);
														
														$.ajax({
															type : "post",
															url : "updateMyImage.me",
															data : formData,
															processData: false,
															contentType: false,
															dataType : "text",
															success : function(data) {
																alert("파일 업로드가 완료되었습니다.");
																console.log(data);
																$("#userPhoto").attr("src", "/dep/resources/uploadFiles/" + data);
																
															},
															error : function(data) {
																alert("파일 업로드에 실패하였습니다.");
																console.log(data);
															}
														});
													}
													
												</script>

											</div>
										</div>
									</div>

									<div class="col-md-12 col-sm-12 col-xs-12">
										<div id='calendar'></div>
									</div>

									<div class="clearfix"></div>
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


	<!-- /footer content -->
</body>

</html>
