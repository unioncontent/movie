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
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="description" content="Phoenixcoded">
  <meta name="keywords" content="flat ui, admin , Flat ui, Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
  <meta name="author" content="Phoenixcoded">
  <!-- Favicon icon -->
  <link rel="icon" href="../assets/images/favicon.ico" type="image/x-icon">
  <!-- Google font-->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
  <!--  Fremwork -->
  <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/css/bootstrap.min.css">
  <!-- themify-icons line icon -->
  <link rel="stylesheet" type="text/css" href="../assets/icon/themify-icons/themify-icons.css">
  <!-- ico font -->
  <link rel="stylesheet" type="text/css" href="../assets/icon/icofont/css/icofont.css">
  <!-- Select 2 css -->
  <link rel="stylesheet" href="../bower_components/select2/dist/css/select2.min.css" />
  <!-- Menu-Search css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/menu-search/css/component.css">
  <!-- Horizontal-Timeline css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/dashboard/horizontal-timeline/css/style.css">
  <!-- Style.css -->
  <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/pages/news/css/style.css">
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
                      <h4>기자관리</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="../dashBoard/dashBoard_main">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">언론사관리</a></li>
                        <li class="breadcrumb-item"><a href="#!">기자관리</a></li>
                      </ul>
                    </div>
                  </div>
                  <div class="page-body">
                    <div class="row">
                      <div class="col-lg-12">
                        <!-- Form Inputs card start -->
                        <div class="card">
                            <div class="card-header">
                                <h5><font style="font-weight: bold; color: black;">기자등록</font></h5>
                                <span>* 항목은 필수 입력입니다.</span>
                                <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                </div>
                            </div>
                            <div class="card-block">
                                <form id="insertForm" action="/media/pressInsert" method="post">
                                  <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    							  <input type="hidden" name="_csrf_header" value="${_csrf.headerName}"/>
                                  <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">* 언론사명</label>
                                    <div class="col-sm-5">
                                        <input name = "reporter_media_name" type="text" class="form-control" id="newsNewName1" placeholder="언론사명">
                                          <span class="messages"><p class="text-danger error"></p></span>
                                        <span class="messages"><p class="text-danger error"></p></span>
                                    </div>
                                  </div>
                                  <div class="form-group row">
                                      <label class="col-sm-2 col-form-label">* 기자명</label>
                                      <div class="col-sm-5">
                                          <input name = "reporter_name" type="text" class="form-control" id="pressName" >
                                          <span class="messages"><p class="text-danger error"></p></span>
                                      </div>
                                  </div>
                                  <div class="form-group row">
                                      <label class="col-sm-2 col-form-label">부서명</label>
                                      <div class="col-sm-5">
                                          <input name = "reporter_part_name" type="text" class="form-control">
                                          <span class="messages"><p class="text-danger error"></p></span>
                                      </div>
                                  </div>
                                  <div class="form-group row">
                                      <label class="col-sm-2 col-form-label">이메일</label>
                                      <div class="col-sm-5">
                                          <input name="reporter_email" type="email" class="form-control">
                                          <span class="messages"><p class="text-danger error"></p></span>
                                      </div>
                                  </div>
                                  <div class="form-group row">
                                      <label class="col-sm-2 col-form-label">연락처</label>
                                      <div class="col-sm-5">
                                          <input name="reporter_phoneNum" type="text" class="form-control mob_no" data-mask="9999-999-999">
                                          <span class="messages"><p class="text-danger error"></p></span>
                                      </div>
                                  </div>
                                  <div class="form-group row">
                                      <label class="col-sm-2 col-form-label">메모</label>
                                      <div class="col-sm-5">
                                          <input name="reporter_memo" type="text" class="form-control">
                                          <span class="messages"><p class="text-danger error"></p></span>
                                      </div>
                                  </div>
                                  <div class="row">
                                      <label class="col-sm-2"></label>
                                      <div class="col-sm-10">
                                          <button id="insertBtn" type="submit" class="btn btn-primary m-b-0">등록</button>
                                      </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- Form Inputs card end -->
                        <!-- table card start -->
                        <div class="card">
                          <div class="card-header">
                            <h3 class="card-header-text f-left m-t-15 m-b-15"><font style="font-weight: bold; color: black;">기자리스트</font></h3>
                            <div class="">
                              <div class="col-md-6 p-r-0 f-right press-setting">
                                <div class="col-sm-5 input-group input-group-button input-group-inverse p-l-0 p-r-0 m-b-10 m-l-10 f-right btn-select">
                                  <input id="keywordInput" type="text" class="form-control" placeholder="">
                                  <span class="input-group-addon" id="basic-addon1">
                                    <button id="searchBtn" class="btn btn-inverse">검색</button>
                                  </span>
                                </div>
                                <select id = "selectSearchType" name="select" class="col-sm-2 form-control form-control-inverse m-l-10 m-b-10 f-right search-select">
                                  <option value="t">기자명</option>
                                  <option value="c">언론사명</option>
                                </select>
                                <select id="selectPerPageNum" name="select" class="col-sm-1 form-control form-control-inverse m-l-10 m-b-10 p-r-5 f-right  list-select">
                                  <option value="10">10</option>
                                  <option value="30">30</option>
                                  <option value="50">50</option>
                                  <option value="100">100</option>
                                </select>
                              </div>
                            </div>
                          </div>
                          <div class="card-block table-border-style table-responsive">
                              <table class="table table-bordered table-sm">
                              <c:if test="${empty reporterList}">
	                                    <tbody>
	                                     <tr>
	                                     <td style="vertical-align:middle;" align="center" height="150px"><h5>등록된 기자가 없습니다.</h5></td>
	                                     </tr>
	                                     </tbody>
	                           </c:if>
	                           <c:if test="${!empty reporterList}">
                                <thead>
                                  <tr>
                                    <th width="5%">NO</th>
                                    <th width="5%">언론사명</th>
                                    <th width="5%">검색언론사명</th>
                                    <th width="5%">기자명</th>
                                    <th width="10%">이메일</th>
                                    <th width="10%">연락처</th>
                                    <th width="5%">기자ID</th>
                                    <th width="5%">부서</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <c:forEach items="${reporterList}" var="reporterList" varStatus="index">
                                  <tr>
                                    <th>${totalCount -index.count +1 -minusCount}</th>
                                    <td>${reporterList.reporter_media_name}</td>
                                    <td>${reporterList.reporter_media_name}</td>
                                    
                                    <td>${reporterList.reporter_name}</td>
                                    <td>
                                    ${reporterList.reporter_email}
                                    </td>
                                    <td>
                                    ${reporterList.reporter_phoneNum}
                                    </td>
                                    <td>
                                    ${reporterList.reporter_part_name}
                                    </td>
                                    <td></td>
                                  </tr>
                                  </c:forEach>
                                </tbody>
                                <tfoot>
                                  <tr>
                                    <td colspan="8">
                                      <ul class="pagination float-right">
                                       <c:if test="${pageMaker.prev}">
                                         <li class="page-item">
                                           <a class="page-link" href="press${pageMaker.makeSearch(pageMaker.startPage - 1) }" aria-label="Previous">&laquo;
                                             <span aria-hidden="true"></span>
                                             <span class="sr-only">Previous</span>
                                           </a>
                                         </li>
                                       </c:if>

                                       <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                                         <li class= "${pageMaker.cri.page == idx? 'active':''} page-item">
                                           <a class="page-link" href="press${pageMaker.makeSearch(idx)}">${idx}</a>
                                         </li>
                                       </c:forEach>

                                       <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                         <li class="page-item">
                                           <a class="page-link" href="press${pageMaker.makeSearch(pageMaker.endPage +1) }" aria-label="Next">&raquo;
                                             <span aria-hidden="true"></span>
                                             <span class="sr-only">Next</span>
                                           </a>
                                         </li>
                                       </c:if>
                                     </ul>
                                    </td>
                                  </tr>
                                </tfoot>
                                </c:if>
                              </table>
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


  <!--  Jquery -->
  <script type="text/javascript" src="../bower_components/jquery/dist/jquery.min.js"></script>
  <script type="text/javascript" src="../bower_components/jquery-ui/jquery-ui.min.js"></script>
  <script type="text/javascript" src="../bower_components/tether/dist/js/tether.min.js"></script>
  <script type="text/javascript" src="../bower_components/bootstrap/js/bootstrap.min.js"></script>
  <!-- jquery slimscroll js -->
  <script type="text/javascript" src="../bower_components/jquery-slimscroll/jquery.slimscroll.js"></script>
  <!-- modernizr js -->
  <script type="text/javascript" src="../bower_components/modernizr/modernizr.js"></script>
  <script type="text/javascript" src="../bower_components/modernizr/feature-detects/css-scrollbars.js"></script>
  <!-- classie js -->
  <script type="text/javascript" src="../bower_components/classie/classie.js"></script>
  <!-- Select 2 js -->
  <script type="text/javascript" src="../bower_components/select2/dist/js/select2.full.min.js"></script>
  <!-- i18next.min.js -->
  <script type="text/javascript" src="../bower_components/i18next/i18next.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-xhr-backend/i18nextXHRBackend.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-browser-languagedetector/i18nextBrowserLanguageDetector.min.js"></script>
  <script type="text/javascript" src="../bower_components/jquery-i18next/jquery-i18next.min.js"></script>
  <!-- Custom js -->
  <script type="text/javascript" src="../assets/js/script.js"></script>
  <script type="text/javascript" src="../assets/pages/news/script2.js"></script>
  <script src="../assets/js/pcoded.min.js"></script>
  <script src="../assets/js/demo-12.js"></script>
  <script src="../assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
  <script src="../assets/js/jquery.mousewheel.min.js"></script>
</body>

<script type="text/javascript">

	$(document).ready(function(){

		// 검색 버튼 클릭시
		$("#searchBtn").on("click", function(){
			searchList();
		});

		/* // 등록 버튼 클릭시
		$("#insertBtn").on("click", function(){
			$("#insertForm").submit();
		}); */


	}); // end ready...

	function searchList(event) {

		var makeQeury = '${pageMaker.makeQuery(1)}'.slice(0, -2);

		self.location = "press"
					  + makeQeury + $('#selectPerPageNum option:selected').val()
					  + "&searchType=" + $("#selectSearchType option:selected").val()
					  + "&keyword=" + $('#keywordInput').val();
	}

</script>

</html>
