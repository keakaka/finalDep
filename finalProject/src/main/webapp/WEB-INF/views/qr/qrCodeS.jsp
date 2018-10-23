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
	
	<script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
	<script src="${contextPath }/resources/js/webqr.js"></script>
	<script src="${contextPath }/resources/js/llqrcode.js"></script>
	

  <meta name="description" content="QR Code scanner" />
  <meta name="keywords" content="qrcode,qr code,scanner,barcode,javascript" />
  <meta name="language" content="English" />
  <meta name="copyright" content="Lazar Laszlo (c) 2011" />
  <meta name="Revisit-After" content="1 Days"/>
  <meta name="robots" content="index, follow"/>
  <meta http-equiv="Content-type" content="text/html;charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Web QR</title>

<style type="text/css">
body{
    width:100%;
    text-align:center;
}
img{
    border:0;
}
#main{
    margin: 15px auto;
    background:white;
    overflow: auto;
	width: 100%;
}
#header{
    background:white;
    margin-bottom:15px;
}
#mainbody{
    background: white;
    width:100%;
	display:none;
}
#footer{
    background:white;
}
#v{
    width:320px;
    height:240px;
}
#qr-canvas{
    display:none;
}
#qrfile{
    width:320px;
    height:240px;
}
#mp1{
    text-align:center;
    font-size:35px;
}
#imghelp{
    position:relative;
    left:0px;
    top:-160px;
    z-index:100;
    font:18px arial,sans-serif;
    background:#f0f0f0;
	margin-left:35px;
	margin-right:35px;
	padding-top:10px;
	padding-bottom:10px;
	border-radius:20px;
}
.selector{
    margin:0;
    padding:0;
    cursor:pointer;
    margin-bottom:-5px;
}
#outdiv
{
    width:320px;
    height:240px;
	border: solid;
	border-width: 3px 3px 3px 3px;
}
#result{
    border: solid;
	border-width: 1px 1px 1px 1px;
	padding:20px;
	width:70%;
}

ul{
    margin-bottom:0;
    margin-right:40px;
}
li{
    display:inline;
    padding-right: 0.5em;
    padding-left: 0.5em;
    font-weight: bold;
    border-right: 1px solid #333333;
}
li a{
    text-decoration: none;
    color: black;
}

#footer a{
	color: black;
}
.tsel{
    padding:0;
}

</style>

	
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-24451557-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

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
									
								</div>
								<div class="col-md-6">

								</div>
							</div>

							<div class="col-md-12 col-sm-12 col-xs-12">
								<div id='calendar'></div>
							</div>
							<!-- 여기부터 -->
														
							<div class="clearfix">
							<div id="main">
<div id="header">
<div style="position:relative;top:+20px;left:0px;"><!-- <g:plusone size="medium"></g:plusone> --></div>
<p id="mp1">
출석체크
</p>
<!-- <ul>
<li><a href="index.html">Scan</a></li>
<li><a href="create.html">Create</a></li>
<li><a href="about.html">About</a></li>
<li style="border: medium none;"><a href="contact.html">Contact</a></li>
</ul> -->
</div>
<div id="mainbody">
<table class="tsel" border="0" width="100%">
<tr>
<td valign="top" align="center" width="50%">
<table class="tsel" border="0">
<tr>
<!-- <td><img class="selector" id="webcamimg" src="vid.png" onclick="setwebcam()" align="left" /></td> -->
<!-- <td><img class="selector" id="qrimg" src="cam.png" onclick="setimg()" align="right"/></td></tr>
 --><tr><td colspan="2" align="center">
<div id="outdiv">
</div>
<br>
<br>
</td>
</tr>
</table>
</td>
</tr>

<tr><td colspan="3" align="center">
<!-- <img src="down.png"/> -->
</td></tr>
<tr><td colspan="3" align="center">
<div id="result" class="resultTest"></div>
<script>
	$(function(){
		$('.resultTest').change(function(){
			console.log('test');
		});
	});
	$(function(){
		$('.resultTest').click(function(){
			console.log('click');
		});
	});
	/* $("body").on('DOMSubtreeModified', "mydiv", function() {
	    alert('changed');
	}); */
</script>
</td></tr>
</table>
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- webqr_2016 -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-8418802408648518"
     data-ad-slot="2527990541"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
</div>&nbsp;
<div id="footer">
<!-- <img style="position:relative;top:0px;left:0px;margin:0;padding:0;" src="comodo_secure_seal_100x85_transp.png"/>
 --><h5 align="center">Copyright &copy; 2011 <a target="_blank" href="http://www.lazarsoft.info">Lazar Laszlo</a></h5>
</div>
</div>
<canvas id="qr-canvas" width="800" height="600"></canvas>
<script type="text/javascript">load();</script>
							
						
							</div>
							<!-- 여기까지 -->							
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

	
	<!-- /footer content -->
</body>

</html>
