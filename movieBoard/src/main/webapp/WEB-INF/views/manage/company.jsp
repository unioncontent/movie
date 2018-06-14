<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <meta name="_csrf" content="${_csrf.token}" />
  <!-- default header name is X-CSRF-TOKEN -->
  <meta name="_csrf_header" content="${_csrf.headerName}"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="description" content="Phoenixcoded">
  <meta name="keywords" content="flat ui, admin , Flat ui, Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
  <meta name="author" content="Phoenixcoded">
  <!-- Favicon icon -->
  <link rel="icon" href="../assets/images/favicon.ico" type="image/x-icon">
  <!-- Google font-->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
  <!-- Required Fremwork -->
  <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/css/bootstrap.min.css">
  <!-- themify-icons line icon -->
  <link rel="stylesheet" type="text/css" href="../assets/icon/themify-icons/themify-icons.css">
  <!-- ico font -->
  <link rel="stylesheet" type="text/css" href="../assets/icon/icofont/css/icofont.css">
  <!-- sweet alert framework -->
  <link rel="stylesheet" type="text/css" href="../bower_components/sweetalert/dist/sweetalert.css">
  <!-- animation nifty modal window effects css -->
  <link rel="stylesheet" type="text/css" href="../assets/css/component.css">
  <!-- Menu-Search css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/menu-search/css/component.css">
  <!-- Horizontal-Timeline css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/dashboard/horizontal-timeline/css/style.css">
  <!-- Style.css -->
  <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/pages/company/css/style.css">
  <!--color css-->
  <link rel="stylesheet" type="text/css" href="../assets/css/color/color-1.css" id="color" />
  <link rel="stylesheet" type="text/css" href="../assets/css/linearicons.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/simple-line-icons.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/ionicons.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/jquery.mCustomScrollbar.css">
</head>

<body>
  <!-- Pre-loader start -->
  <div class="theme-loader">
    <div class="ball-scale">
      <div></div>
    </div>
  </div>
  <!-- Pre-loader end -->

  <div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
    <div class="pcoded-container navbar-wrapper">
      <jsp:include page='../include/header.jsp' />
      <div class="pcoded-main-container">
        <div class="pcoded-wrapper">
          <!-- left menu start -->
          <jsp:include page='../include/side.jsp' />
          <!-- left menu end -->
          <div class="pcoded-content">
            <div class="pcoded-inner-content">
              <div class="main-body">
                <div class="page-wrapper">
                  <div class="page-header">
                    <div class="page-header-title">
                      <h4>거래처관리</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="../dashBoard/dashBoard_main">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">운영관리</a></li>
                        <li class="breadcrumb-item"><a href="#!">거래처관리</a></li>
                      </ul>
                    </div>
                  </div>
                  <div class="page-body">
                    <div class="row">
                      <div class="col-lg-12">
                        <!-- Form Inputs card start -->
                        <div class="card">
                            <div class="card-header">
                                <h5><font style="font-weight: bold; color: black;">거래처등록</font></h5>
                                <span>* 항목은 필수 입력입니다.</span>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block">
                                <form action="/manage/companyInsert" method="post">
                                  <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    							  <input type="hidden" name="_csrf_header" value="${_csrf.headerName}"/>
                                  <div class="form-group row">
                                      <label class="col-sm-2 col-form-label">* 회사분류</label>
                                      <div class="col-sm-5">
                                        <div class="form-radio">
                                          <div class="radio radio-inline">
                                            <label>
                                              <input type="radio" name="radio" checked="checked">
                                              <i class="helper"></i>Client
                                            </label>
                                          </div>
                                        </div>
                                        <span class="messages"><p class="text-danger error"></p></span>
                                      </div>
                                  </div>
                                  <div class="form-group row">
                                      <label class="col-sm-2 col-form-label">* 회사명</label>
                                      <div class="col-sm-5">
                                          <input name = "company_name" type="text" class="form-control" id="company">
                                          <span class="messages"><p class="text-danger error"></p></span>
                                      </div>
                                  </div>
                                  <div class="form-group row">
                                      <label class="col-sm-2 col-form-label">* 아이디</label>
                                      <div class="col-sm-5">
                                        <input name = "user_ID" type="text" class="form-control" id="id">
                                        <input type="hidden" id="idCheck"/>
                                        <span class="messages"><p class="text-danger error"></p></span>
                                      </div>
                                      <div class="col-sm-1 btn-check">
                                        <button id="idCheck" type="button" class="btn btn-md btn-inverse alert-prompt" onclick="_gaq.push(['_trackEvent', 'example', 'try', 'alert-prompt']);">
                                          <i class="icofont icofont-user-alt-3"></i>
                                          중복체크
                                        </button>
                                      </div>
                                  </div>
                                  <div class="form-group row">
                                      <label class="col-sm-2 col-form-label">* 비밀번호</label>
                                      <div class="col-sm-5">
                                          <input name = "user_PW" type="password" class="form-control" id="pw">
                                          <span class="messages"><p class="text-danger error"></p></span>
                                      </div>
                                  </div>
                                  <div class="form-group row">
                                      <label class="col-sm-2 col-form-label">* 대표자명</label>
                                      <div class="col-sm-5">
                                          <input name = "company_licensee" type="text" class="form-control" id="licensee">
                                          <span class="messages"><p class="text-danger error"></p></span>
                                      </div>
                                  </div>
                                  <div class="form-group row">
                                      <label class="col-sm-2 col-form-label">* 주소</label>
                                      <div class="col-sm-5">
                                          <input type="text" class="form-control" id="location">
                                          <span class="messages"><p class="text-danger error"></p></span>
                                      </div>
                                  </div>
                                  <div class="form-group row">
                                      <label class="col-sm-2 col-form-label">e-mail</label>
                                      <div class="col-sm-5">
                                          <input name = "user_email" type="email" class="form-control">
                                      </div>
                                  </div>
                                  <div class="form-group row">
                                      <label class="col-sm-2 col-form-label">* 연락처 (- 없이 입력해주세요)</label>
                                      <div class="col-sm-5">
                                          <input name = "user_phoneNum" type="text" class="form-control mob_no" data-mask="9999-999-999" id="phone">
                                          <span class="phoneNumber"><p class="text-danger error"></p></span>
                                      </div>
                                  </div>
                                  <div class="form-group row">
                                      <label class="col-sm-2 col-form-label">회사로고</label>
                                      <div class="col-sm-5">
                                          <input name = "thumbnail" type="image" class="form-control">
                                      </div>
                                  </div>
                                  <div class="row">
                                      <label class="col-sm-2"></label>
                                      <div class="col-sm-5">
                                          <button id = "insertBtn" type="submit" class="btn btn-primary m-b-0">등록</button>
                                      </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- Form Inputs card end -->
                        <!-- table card start -->
                        <div class="card">
                            <div class="card-header">
                              <h5 class="card-header-text"><font style="font-weight: bold; color: black;">거래처리스트</font></h3>
                            </div>
                            <div class="card-block table-border-style">
                              <div class="table-responsive">
                                <table class="table table-bordered table-sm">
                                  <thead>
                                    <tr>
                                      <th width="5%">NO</th>
                                      <th width="5%">회사명</th>
                                      <th width="5%">ID</th>
                                      <th width="5%">PW</th>
                                      <th width="5%">대표자명</th>
                                      <th width="10%">연락처</th>
                                      <th width="5%">담당자</th>
                                      <th width="10%">이메일</th>
                                      <th width="10%">주소</th>
                                      <th width="5%">로고</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                  	<c:forEach items="${userList}" var="userVO">
                                  	  <tr>
                                      <th scope="row">${userVO.user_idx}</th>
                                      <td>${userVO.company_name}</td>
                                      <td>${userVO.user_ID}</td>
                                      <td>${userVO.user_PW}</td>
                                      <td>${userVO.company_licensee}</td>
                                      <td>${userVO.user_phoneNum}</td>
                  					  <td>${userVO.user_name}</td>
                                      <td>
                                      ${userVO.user_email}
                                      </td>
                                      <td>
                                      ${userVO.company_location}
                                      </td>
                                      <td>
                                    </td>
                                    </tr>
                                  	</c:forEach>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                        </div>
                        <!-- table card end -->
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
  <!-- sweet alert js -->
  <script type="text/javascript" src="../bower_components/sweetalert/dist/sweetalert.min.js"></script>
  <script type="text/javascript" src="../assets/pages/company/script.js"></script>
  <!-- classie js -->
  <script type="text/javascript" src="../bower_components/classie/classie.js"></script>
  <!-- i18next.min.js -->
  <script type="text/javascript" src="../bower_components/i18next/i18next.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-xhr-backend/i18nextXHRBackend.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-browser-languagedetector/i18nextBrowserLanguageDetector.min.js"></script>
  <script type="text/javascript" src="../bower_components/jquery-i18next/jquery-i18next.min.js"></script>
  <!-- Custom js -->
  <script type="text/javascript" src="../assets/js/script.js"></script>
  <script src="../assets/js/pcoded.min.js"></script>
  <script src="../assets/js/demo-12.js"></script>
  <script src="../assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
  <script src="../assets/js/jquery.mousewheel.min.js"></script>
</body>

<script type="text/javascript">

	//ajax 보안
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");

	$(function() {
    	$(document).ajaxSend(function(e, xhr, options) {
        	xhr.setRequestHeader(header, token);
    	});
	});


	$(document).ready(function(){
		var company_name = $("#company").val();
		console.log("company_name: " + company_name);

		var user_ID = $("#id").val();
		console.log("user_ID: " + user_ID);

		var user_PW = $("#pw").val();

		var company_licensee = $("#licensee").val();


		/* $("#idCheck").on("click", function(){
			console.log("중복체크 클릭");

			var $user_ID = $("#id").val();



		}); // end idCheck click... */

	}); // end ready...

</script>


</html>
