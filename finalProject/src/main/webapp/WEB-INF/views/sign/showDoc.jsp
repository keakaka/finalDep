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
	<script src="${contextPath }/resources/js/jquery.min.js"></script>
	<style>
		#title {
			align:center;
			width:100%;
			height:80px;
			text-align:center;
			border:2px solid black;
			font-size:40pt;
			background-color:#2d4c6e;
			color:white;
		}
		#content {
			align:center;
			width:100%;
			height:350px;
			border:2px solid black;
			overflow:auto;
		}
	</style>
</head>


<body>
	<input type="hidden" value="${d.originFileName }" class="fileTest">
	<div id="title">${d.signTitle }</div>
	<div id="content">${d.signContent }</div>
	<c:choose>
		<c:when test="${!empty d.originFileName }">
			<div id="fileName"><label>첨부파일 다운로드</label>&nbsp;&nbsp;<a href="signFileDownload.sg?docNo=${d.docNo }">${d.originFileName }</a></div>
		</c:when>
		<c:otherwise>
			<div id="fileName"><label>첨부파일 다운로드</label>&nbsp;&nbsp;<small>첨부 파일이 없습니다.</small></div>
		</c:otherwise>
	</c:choose>




	<script src="${contextPath }/resources/js/bootstrap.min.js"></script>
	<!-- bootstrap progress js -->
	<script src="${contextPath }/resources/js/progressbar/bootstrap-progressbar.min.js"></script>
	<script src="${contextPath }/resources/js/nicescroll/jquery.nicescroll.min.js"></script>
</body>
  
  
</html>
