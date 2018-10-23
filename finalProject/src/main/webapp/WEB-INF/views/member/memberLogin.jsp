<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@
    	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
     %>
<!DOCTYPE html>
<html lang="en">

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
  <link href="${contextPath }/resources/css/icheck/flat/green.css" rel="stylesheet">


  <script src="${contextPath }/resources/js/jquery.min.js"></script>

  <!--[if lt IE 9]>
        <script src="../assets/js/ie8-responsive-file-warning.js"></script>
        <![endif]-->

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

</head>

<body style="background:#F7F7F7;">

  <div class="">
    <a class="hiddenanchor" id="toregister"></a>
    <a class="hiddenanchor" id="tologin"></a>

    <div id="wrapper">
      <div id="login" class="animate form">
        <section class="login_content">
          <form name="loginCheck" action="login.me" method="post">
            <h1>DEP Login</h1>
            <div>
              <input type="text" class="form-control" placeholder="사원 ID를 입력하세요" name="empId" />
            </div>
            <div>
              <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="empPwd" />
            </div>
            <div>
              <a class="btn btn-default submit" href="#" onclick="javascript:document.loginCheck.submit();">Log in</a>
              <a class="reset_pass" href="#toregister">아이디/비밀번호 찾기</a>
            </div>
       
            
            <div class="clearfix"></div>
            <div class="separator">
			
             <!--  <p class="change_link">New to site?
                <a href="#toregister" class="to_register"> Create Account </a>
              </p> -->
              <div class="clearfix"></div>
              <br />
              <div>
                <h1>DEP GroupWare</h1>

                <p>©2018 All Rights Reserved. DBDBDEP final project!</p>
              </div>
            </div>
          </form>
          <!-- form -->
        </section>
        <!-- content -->
      </div>
      <div id="register" class="animate form">
        <section class="login_content">
          <form>
            <h1 style="font-size:20px;">아이디 / 비밀번호 찾기</h1>
            <div>
              <input type="text" class="form-control" placeholder="사원번호를 입력하세요" required="" />
            </div>
            <!-- <div>
              <input type="email" class="form-control" placeholder="Email" required="" />
            </div> -->
            <div>
              <input type="text" class="form-control" placeholder="사원 ID를 입력하세요" required="" />
            </div>
            <div>
              <a class="btn btn-default submit" href="index.jsp">아이디 / 비밀번호 찾기</a>
            </div>
            <div class="clearfix"></div>
            <div class="separator">

              <p class="change_link">아이디 / 비밀번호를 찾았습니다 &nbsp;
                <a href="#tologin" class="to_register"> Log in </a>
              </p>
              <div class="clearfix"></div>
              <br />
              <div>
                <h1>DEP GroupWare</h1>

                <p>©2018 All Rights Reserved. DBDBDEP final project!</p>
              </div>
            </div>
          </form>
          <!-- form -->
        </section>
        <!-- content -->
      </div>
    </div>
  </div>

</body>

</html>