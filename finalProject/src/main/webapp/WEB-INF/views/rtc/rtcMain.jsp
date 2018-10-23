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
<style>
.whov:hover { background-color: #00695c!important; }
.view {
	background-position: center center;
	background-repeat: no-repeat;
	height: 500px;
}
.secondbase {
    background-color: rgba(255,255,255,.6); 
    margin-top: -90px;
}
.jarallax {
	height:50em;
}

@import url('https://fonts.googleapis.com/css?family=PT+Sans');
.btn {
  display: inline-block;
  background: transparent;
  text-transform: uppercase;
  font-weight: 500;
  font-size: 1.5em;
  font-style: normal;
  letter-spacing: 0.3em;
  color: white;
  border-radius: 0;
  padding: 18px 80px 20px;
  transition: all 0.7s ease-out;
  background-image: linear-gradient(to right, #2b5876 0%, #4e4376 51%, #2b5876 100%);
  margin-top:17% !important;
  background-position: 1% 50%;
  background-size: 300% 300%;
  text-decoration: none;
  margin: 0.625rem;
  border: none;
  border: 1px solid rgba(223,190,106,0.3);
}

.btn:hover {
  color: #fff;
  border: 1px solid rgba(223,190,106,0);
  color: #fff;
  background-position: right center;
}
</style>
</head>


<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">

					<jsp:include page="../common/sidebar.jsp"/>


			<!-- page content -->
			<input type="hidden" value="${loginUser.empName }" id="empName"/>
			<input type="hidden" value="${loginUser.empNo }" id="empNo"/>
			
			<div class="right_col" role="main">
			
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="dashboard_graph">

							<div class="row x_title">
								<div class="col-md-6">
									<h3>화상회의</h3>
								</div>
								<div class="col-md-6">
			
								</div>
							</div>
 
 

							<div class="col-md-12 col-sm-12 col-xs-12">
    <div class="collapse navbar-collapse " id="navbarSupportedContent">
    </div>
    <div class="view hm-white-light jarallax" data-jarallax='{"speed": 0.2}' data-jarallax-video="https://youtu.be/Yn8yGje-6sk?t=12">
            <div class="full-bg-img">
                <div class="container flex-center">
                    <div class="row">
                        <div class="col-md-12 wow fadeIn">
                            <div class="text-center text-danger">
                            	<button onclick="rtcOpen();" class="btn">방 만들기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button onclick="openTest();" class="btn">방 참여하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<hr>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/popper.min.js"></script>
    <script src="https://mdbootstrap.com/previews/docs/latest/js/bootstrap.min.js"></script>
    <script src="https://mdbootstrap.com/previews/docs/latest/js/mdb.min.js"></script>
    <script src="https://mdbootstrap.com/previews/docs/latest/js/jarallax.js"></script>
    <script src="https://mdbootstrap.com/previews/docs/latest/js/jarallax-video.js"></script>
    <script>
        new WOW().init();
    </script> 
							</div>
							

							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<br />
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
	<input type="hidden" value="${loginUser.empName }" id="empName"/>
	<div id="custom_notifications" class="custom-notifications dsp_none">
		<ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
		</ul>
		<div class="clearfix"></div>
		<div id="notif-group" class="tabbed_notifications"></div>
	</div>

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

	<script>
		function rtcOpen(){
			var empName = $("#empName").val();
			var empNo = $("#empNo").val();
			var roomId = prompt('방 제목을 입력하세요');
			if(roomId != null){
				var url1 = "https://192.168.20.218:55555?id="+roomId+"&no="+empNo+"&empName="+empName;    //팝업창 페이지 URL
				var url = encodeURI(url1);
			    var popupOption= "width="+ 1200 +", height="+ 800 + ", fullscreen=yes";    //팝업창 옵션(option)
			    window.open(url,'DBDBDep 화상회의 시스템', popupOption);
			}
		}
		function openTest(){
			var empName = $("#empName").val();
			var empNo = $("#empNo").val();
			var roomId = prompt('방 제목을 입력하세요');
			if(roomId != null){
				var url="https://192.168.20.218:55555?id="+roomId+"&no="+empNo+"&empName="+empName+"#/room/"+roomId;
				var popupOption= "width="+ 1200 +", height="+ 800;    //팝업창 옵션(option)
				window.open(url,"",popupOption);
			}
			
		}
	</script>

</body>

</html>
