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
  <script type="text/javascript">
  function AddNum(obj) {
      var n = obj.value;
      var reg = /(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})/;
      n += '';
      while (reg.test(n))
         n = n.replace(reg, '$1' + '-' + '$2' + '-' + '$3' + ' ' + '$4' + ':' + '$5' + ':');
      obj.value = n;
   }
  </script>
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
                      <h4>언론사 댓글 등록</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="../dashBoard/dashBoard_main">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">언론사관리</a></li>
                        <li class="breadcrumb-item"><a href="#!">언론사 댓글 등록</a></li>
                      </ul>
                    </div>
                  </div>
                  <div class="col-lg-12">
                        <div class="card">
	                    <div class="card-header">
		                    <h5 class="card-header-text m-b-10"></h5>
		                    <form action="/media/replyAddOk">
		                    <div class="form-group row">
                                <label class="col-sm-2 col-form-label">*회사명</label>
                                <div class="col-sm-10">
                                  <select name="company_name" class="form-control" id="selectCompany">
                                    <c:forEach items="${companyList}" var="company">
                                    <option value="${company.company_name}">${company.company_name}</option>
                                    </c:forEach>
                                  </select>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">*메인 키워드</label>
                                <div class="col-sm-10">
                                  <input type="text" class="form-control" name="title_key">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">*키워드</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="keyword">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">*기사 제목</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="media_title">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">*URL</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="url" id="url">
                                    <div style="height: 10px;"></div>
                                    <button id="checkMainBtn" type="button"
										class="btn btn-sm btn-inverse alert-prompt"
										onclick="_gaq.push(['_trackEvent', 'example', 'try', 'alert-prompt']);">
										<i class="icofont icofont icofont-ui-check"></i> 중복체크
									</button>
                                </div>
                              </div>							
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">언론사</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="media_name">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">기자</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="reporter_name">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">*날짜</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="writeDate" onkeyup="AddNum(this)">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">*유형</label>
                                <div class="col-sm-10">
                                    <div class="col-sm-5">
                                        <div class="form-radio">
                                          <div class="radio radio-inline">
                                            <label>
                                              <input type="radio" name="news_type" value="A" checked="checked">
                                              <i class="helper"></i>A형
                                            </label>
                                          </div>
                                          <div class="radio radio-inline">
                                            <label>
                                              <input type="radio" name="news_type" value="B" checked="checked">
                                              <i class="helper"></i>B형
                                            </label>
                                          </div>
                                        </div>
                                      </div>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">*상태</label>
                                <div class="col-sm-10">
                                    <div class="col-sm-5">
                                        <div class="form-radio">
                                          <div class="radio radio-inline">
                                            <label>
                                              <input type="radio" name="news_state" value="1" checked="checked">
                                              <i class="helper"></i>On
                                            </label>
                                          </div>
                                          <div class="radio radio-inline">
                                            <label>
                                              <input type="radio" name="news_state" value="2" checked="checked">
                                              <i class="helper"></i>Off
                                            </label>
                                          </div>
                                        </div>
                                      </div>
                                      <br>
                                      <input type="submit" value="등록" class="submit btn btn-primary m-b-0">
                                	</form>
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
  <script type="text/javascript" src="../assets/pages/keyword/script.js"></script>
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
		
		document.querySelector('.alert-prompt').onclick = function(){
		    swal({
		      title: "✓ URL 중복체크",
		      text: "URL를 입력해주세요.",
		      type: "input",
		      showCancelButton: true,
		      closeOnConfirm: false,
		      inputValue:$("#url").val(),
		      inputPlaceholder: "url 입력"
		    }, function (inputValue) {
		    	
		    	$.ajax({

					type : "POST",
				  	url : "checkUrl",
			 	  	dataType : "text",
			 	  	data : {url : inputValue},
			  	  	success : function(data){
			  	  	if (inputValue === false){
				        swal.showInputError("url를 다시 입력해 주세요.");
				        return false;
				      }
				      if (inputValue == ""){
				        swal.showInputError("url를 다시 입력해 주세요.");
				        return false;
				      }
				      if (data != 0) {
				        swal.showInputError("url이 중복됩니다. 다시 입력해 주세요.");
				        return false
				      }
				      
				      $("#url").val(inputValue);
				      $("#keywordCheck").val("true");
				      $("#url").removeClass("form-control-danger");
				      $("#url").siblings().children("p").text("");
				      swal("중복확인!", inputValue+"는 사용가능한 url입니다.", "success");
			  	  	}
				});
		      
		    });
		  };
		
	}); // end ready...

</script>

</html>
