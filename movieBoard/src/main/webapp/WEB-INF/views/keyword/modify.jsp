<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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
  <link rel="stylesheet" type="text/css" href="../assets/pages/keyword/css/style.css">
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
                      <h4>키워드수정</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="../dashBoard/dashBoard_main">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="../keyword/keyword">키워드관리</a></li>
                        <li class="breadcrumb-item"><a href="#!">키워드수정</a></li>
                      </ul>
                    </div>
                  </div>
                  <div class="page-body">
                    <div class="row">
                      <div class="col-md-12">
                        <table class="table table-columned table-lg f-16 result">
                          <thead>
                            <tr class="bg-inverse">
                              <th width="5%" class="text-center">컨텐츠명</th>
                              <th width="5%" class="text-center">CP사</th>
                            </tr>
                          </thead>
                          <tbody class="text-center bg-white">
                            <tr>
                              <td>${keyword_main}
                                <div class="label-main">
                                  <label class="label label-success">관리</label>
                                </div>
                                <!-- <div class="label-main">
                                  <label class="label label-danger">비관리</label>
                                </div> -->
                              </td>
                              <td>${company_name}</td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                      <div class="col-md-12">
                          <div class="card">
                            <div class="card-block table-border-style">
                              <div class="table-responsive">
                                <table class="table table-columned table-striped">
                                  <thead>
                                    <tr>
                                      <th></th>
                                      <th>검색어</th>
                                      <th>제외검색어</th>
                                      <th>영화구분</th>
                                      <th>작업</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <th scope="row" class="centerTh">입력</th>
                                      <td>
                                        <input type="text" class="form-control" id="pSearch"/>
                                        <span class="messages"><p class="text-danger error m-b-0"></p></span>
                                      </td>
                                      <td>
                                        <input type="text" class="form-control" id="dSearch"/>
                                        <span class="messages"><p class="text-danger error m-b-0"></p></span>
                                      </td>
                                      <td>
                                        <div class="form-radio">
                                          <div class="radio radiofill radio-primary radio-inline">
                                            <label>
                                              <input type="radio" name="property" value="movie" data-bv-field="member">
                                              <i class="helper"></i>영화
                                            </label>
                                          </div>
                                          <div class="radio radiofill radio-primary radio-inline">
                                            <label>
                                              <input type="radio" name="property" value="actor" data-bv-field="member">
                                              <i class="helper"></i>배우
                                            </label>
                                          </div>
                                          <div class="radio radiofill radio-primary radio-inline">
                                            <label>
                                              <input type="radio" name="property" value="etc" data-bv-field="member">
                                              <i class="helper"></i>기타
                                            </label>
                                          </div>
                                        </div>
                                      </td>
                                      <td><button class="btn btn-success btn-sm" id="insertKeywordBtn"><i class="icofont icofont-plus" style="margin-right:0"></i></button></td>
                                    </tr>
                                    <c:forEach items="${keywordList}" var="keyword" varStatus="index">
                                    <tr>
                                      <th scope="row"class="centerTh">${index.count}</th>
                                      <td ><c:if test="${keyword.keyword_property == '포함'}">${keyword.keyword}</c:if></td>
                                      <td><c:if test="${keyword.keyword_property == '제외'}">${keyword.keyword}</c:if></td>
                                      <td>${keyword.keyword_type}</td>
                                      <td><button class="remove_keyword btn btn-danger btn-sm"><i class="icofont icofont-garbage" style="margin-right:0"></i></button></td>
                                    </tr>
                                    </c:forEach>
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
  <script type="text/javascript" src="../assets/pages/keyword/script2.js"></script>
  <!-- sweet alert modal.js intialize js -->
  <!-- modalEffects js nifty modal window effects -->
  <script type="text/javascript" src="../assets/js/modalEffects.js"></script>
  <script type="text/javascript" src="../assets/js/classie.js"></script>
  <!-- classie js -->
  <script type="text/javascript" src="../bower_components/classie/classie.js"></script>
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

		// 삭제 버튼 클릭시
		$(".remove_keyword").on("click", function(event){

			var div = event.target.parentNode;

			console.log(div);
			console.log(div.type);

			if(div.type == 'submit'){
				console.log("button click...");
				div = div.parentNode;
			}

			var tr = div.parentNode;
			console.log(tr.children);

			var td = tr.children[1];
			console.log(td);

			var keyword_main = td.childNodes[0];


			if(keyword_main == undefined){
				td = tr.children[2];
				console.log(td);

				keyword_main = td.childNodes[0];

			}

			console.log(keyword_main.data);

			$.ajax({

				type : "POST",
			  	url : "removeKeyword",
		 	  	dataType : "text",
		 	  	data : {keyword : keyword_main.data}

			});

			setTimeout(function(){ location.reload(); }, 1000);
		});


		// 추가 버튼 클릭시
		$("#insertKeywordBtn").on("click", function(){

			var pSearch = $("#pSearch").val();

			var dSearch = $("#dSearch").val();


			if(pSearch != ''){
				$.ajax({

					type : "POST",
				  	url : "insertKeyword",
			 	  	dataType : "json",
			 	  	data : {keyword_main : '${keyword_main}', keyword : pSearch, keyword_property : '포함',
			 	  			keyword_type : getType()}

				});
			}

			if(dSearch != ''){
				$.ajax({

					type : "POST",
				  	url : "insertKeyword",
			 	  	dataType : "json",
			 	  	data : {keyword_main : '${keyword_main}', keyword : dSearch, keyword_property : '제외',
			 	  			keyword_type : getType()}

				});

			}


			setTimeout(function(){ location.reload(); }, 1000);
		});

	});// end ready...


	function getType(){

		if($("input[name=property]:checked")[0] == undefined){

			return '';
		}else{

			var type = $("input[name=property]:checked")[0].value;

			if(type == 'movie'){
				return '영화';
			}

			if(type == 'actor'){
				return '배우';
			}
			if(type == 'etc'){
				return '기타';
			}

		}

	}


</script>

</html>
