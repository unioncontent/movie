<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <title>OverWare</title>
    <!-- HTML5 Shim and Respond.js IE9 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="Phoenixcoded">
    <meta name="keywords" content=", Flat ui, Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="Phoenixcoded">
    <!-- Favicon icon -->
	<!-- <link rel="shortcut icon" href="../assets/images/favicon.ico" type="image/x-icon"> -->
    <link rel="icon" href="../assets/images/favicon.ico" type="image/x-icon">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="../../bower_components/bootstrap/css/bootstrap.min.css">
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="../assets/icon/themify-icons/themify-icons.css">
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="../assets/icon/icofont/css/icofont.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    <!-- color .css -->
    <link rel="stylesheet" type="text/css" href="../assets/css/color/color-1.css" id="color"/>
    <!-- 추가 -->
    <style>
      #link:hover{
        text-decoration: underline;
      }
    </style>

</head>

<body class="fix-menu">
	<!-- <div><font size="5">&nbsp;IMAGE SERVER</font></div> -->
    <section class="login p-fixed d-flex text-center bg-primary common-img-bg">
        <!-- Container-fluid starts -->
        <div class="container-fluid auth-body">
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->
                    <div class="login-card card-block auth-body">
                        <form class="md-float-material" action="<c:url value= 'loginAction'/>" method="post" id="loginForm">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="text-center">
                                <!-- <img src="../assets/images/auth/logo.png" alt="logo.png"> -->
                            </div>
                            <div class="auth-box">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <!-- <h3 class="text-left txt-primary">Sign In</h3> -->
                                        <img src="../assets/images/overware_logo.png" alt="logo.png" style="width: 250px; height: 45px;">
                                    </div>
                                </div>
                                <hr/>
                                <div class="input-group m-b-10">
                                    <input name ="username" type="email" class="form-control" placeholder="ID">

                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <input onkeyup="enter_login();" name = "password" type="password" class="form-control" placeholder="Password">
                                    <span class="md-line"></span>
                                </div>
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                      <button id='loginBtn' type="button" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20"
                                      onclick="login();" >Sign in</button>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                  <div class="col-md-10">
                                    <a id="link" href="http://unionc.co.kr/unionc/ow/index.html" target="_blank"><p class="text-inverse text-left m-b-0">© Union Contents.</p></a>
                                    <p class="text-inverse text-left m-b-0">TEL : 070-7700-1555</p>
                                    <p class="text-inverse text-left m-b-0">ADRESS : 서울시 서초구 서초대로25길 6 3층</p>
                                    <p class="text-inverse text-left">
                                    <a id="link" href="../notice/privacy" target="_blank" style="color: #34495e">개인정보처리방침</a>
                                    <font style="color: #34495e;">|</font>
                                    <a id="link" href="../notice/terms" target="_blank" style="color: #34495e"> 서비스약관</a></p>     
                                    </div>
                                  </div>
                                </div>
                            </div>
                        </form>
                        <!-- end of form -->
                    </div>
                    <!-- Authentication card end -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
    <!-- Warning Section Starts -->
    <!-- Older IE warning message -->
    <!--[if lt IE 9]>
      <div class="ie-warning">
        <h1>Warning!!</h1>
        <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
        <div class="iew-container">
          <ul class="iew-download">
            <li>
              <a href="http://www.google.com/chrome/">
                <img src="../assets/images/browser/chrome.png" alt="Chrome">
                <div>Chrome</div>
              </a>
            </li>
            <li>
              <a href="https://www.mozilla.org/en-US/firefox/new/">
                <img src="../assets/images/browser/firefox.png" alt="Firefox">
                <div>Firefox</div>
              </a>
            </li>
            <li>
              <a href="http://www.opera.com">
                <img src="../assets/images/browser/opera.png" alt="Opera">
                <div>Opera</div>
              </a>
            </li>
            <li>
              <a href="https://www.apple.com/safari/">
                <img src="../assets/images/browser/safari.png" alt="Safari">
                <div>Safari</div>
              </a>
            </li>
            <li>
              <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                <img src="../assets/images/browser/ie.png" alt="">
                <div>IE (9 & above)</div>
              </a>
            </li>
          </ul>
        </div>
        <p>Sorry for the inconvenience!</p>
      </div>
    <![endif]-->
    <!-- Warning Section Ends -->

    <!-- Required Jquery -->
    <script type="text/javascript" src="../bower_components/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="../bower_components/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../bower_components/tether/dist/js/tether.min.js"></script>
    <script type="text/javascript" src="../bower_components/bootstrap/js/bootstrap.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="../bower_components/jquery-slimscroll/jquery.slimscroll.js"></script>
    <!-- modernizr js -->
    <script type="text/javascript" src="../bower_components/modernizr/modernizr.js"></script>
    <script type="text/javascript" src="../bower_components/modernizr/feature-detects/css-scrollbars.js"></script>
    <!-- i18next.min.js -->
    <script type="text/javascript" src="../bower_components/i18next/i18next.min.js"></script>
    <script type="text/javascript" src="../bower_components/i18next-xhr-backend/i18nextXHRBackend.min.js"></script>
    <script type="text/javascript" src="../bower_components/i18next-browser-languagedetector/i18nextBrowserLanguageDetector.min.js"></script>
    <script type="text/javascript" src="../bower_components/jquery-i18next/jquery-i18next.min.js"></script>
    <!-- Custom js -->
    <script type="text/javascript" src="../assets/js/script.js"></script>
</body>

<script type="text/javascript">


	$(document).ready(function(event){



	});

	function login(){
		$('#loginForm').submit();
	}


	function enter_login(){
		if(event.keyCode == 13){

			login();
			//$("loginBtn").trigger("click");
		}
	}


</script>

</html>
