<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
  <!-- Required Fremwork -->
  <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/css/bootstrap.min.css">
  <!-- themify-icons line icon -->
  <link rel="stylesheet" type="text/css" href="../assets/icon/themify-icons/themify-icons.css">
  <!-- ico font -->
  <link rel="stylesheet" type="text/css" href="../assets/icon/icofont/css/icofont.css">
  <!-- flag icon framework css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/flag-icon/flag-icon.min.css">
  <!-- Menu-Search css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/menu-search/css/component.css">
  <!-- Horizontal-Timeline css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/dashboard/horizontal-timeline/css/style.css">
  <!-- font awesome -->
  <link rel="stylesheet" type="text/css" href="../assets/icon/font-awesome/css/font-awesome.css">
  <!-- Date-range picker css  -->
  <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- sweet alert framework -->
  <link rel="stylesheet" type="text/css" href="../bower_components/sweetalert/dist/sweetalert.css">
  <!-- Style.css -->
  <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/pages/sns/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/picker.css">
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

      <nav class="navbar header-navbar pcoded-header" header-theme="theme4">
        <div class="navbar-wrapper">
          <div class="navbar-logo">
            <a class="mobile-menu" id="mobile-collapse" href="#!">
              <i class="ti-menu"></i>
            </a>
            <a class="mobile-search morphsearch-search" href="#">
              <i class="ti-search"></i>
            </a>
            <a href="dashboard.html">
              <img class="img-fluid" src="../assets/images/logo.png" alt="Theme-Logo" />
            </a>
            <a class="mobile-options">
              <i class="ti-more"></i>
            </a>
          </div>
          <div class="navbar-container container-fluid">
            <div>
              <ul class="nav-left">
                <li>
                  <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                </li>
              </ul>
              <ul class="nav-right">
                <li class="user-profile header-notification">
                  <a href="#!">
                      <img src="../assets/images/user.png" alt="User-Profile-Image">
                      <span>Union</span>
                      <i class="ti-angle-down"></i>
                  </a>
                  <ul class="show-notification profile-notification">
                      <li>
                          <a href="#!">
                              <i class="ti-settings"></i> Settings
                          </a>
                      </li>
                      <li>
                          <a href="user-profile.html">
                              <i class="ti-user"></i> Profile
                          </a>
                      </li>
                      <li>
                          <a href="email-inbox.html">
                              <i class="ti-email"></i> My Messages
                          </a>
                      </li>
                      <li>
                          <a href="auth-lock-screen.html">
                              <i class="ti-lock"></i> Lock Screen
                          </a>
                      </li>
                      <li>
                          <a href="#!">
                              <i class="ti-layout-sidebar-left"></i> Logout
                          </a>
                      </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </nav>
      <div class="pcoded-main-container">
        <div class="pcoded-wrapper">
          <!-- right menu start -->
          <nav class="pcoded-navbar" pcoded-header-position="relative">
            <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
            <div class="pcoded-inner-navbar main-menu">
              <div class="">
                <div class="main-menu-header">
                  <img class="img-40" src="../assets/images/user.png" alt="User-Profile-Image">
                  <div class="user-details">
                    <span id="more-details">Union<i class="ti-angle-down"></i></span>
                  </div>
                </div>

                <div class="main-menu-content">
                  <ul>
                    <li class="more-details">
                      <a href="user-profile.html"><i class="ti-user"></i>View Profile</a>
                      <a href="#!"><i class="ti-settings"></i>Settings</a>
                      <a href="#!"><i class="ti-layout-sidebar-left"></i>Logout</a>
                    </li>
                  </ul>
                </div>
              </div>
              <ul class="pcoded-item pcoded-left-item">
                <li class="">
                  <a href="dashboard.html">
                    <span class="pcoded-micon"><i class="ti-home"></i></span>
                    <span class="pcoded-mtext" data-i18n="nav.dash.main">대시보드</span>
                    <span class="pcoded-mcaret"></span>
                  </a>
                </li>
                <li class="">
                  <a href="period.html">
                    <span class="pcoded-micon"><i class="ti-bar-chart-alt"></i></span>
                    <span class="pcoded-mtext">통계보고서</span>
                    <span class="pcoded-mcaret"></span>
                  </a>
                </li>
                <li class="pcoded-hasmenu">
                  <a href="javascript:void(0)" data-i18n="nav.advance-components.main">
                    <span class="pcoded-micon"><i class="ti-world"></i></span>
                    <span class="pcoded-mtext">포털관리</span>
                    <span class="pcoded-mcaret"></span>
                  </a>
                  <ul class="pcoded-submenu">
                    <li class="">
                      <a href="mngNaver.html" data-i18n="nav.advance-components.draggable">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">네이버관리</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                    <li class=" ">
                      <a href="mngViral.html" data-i18n="nav.advance-components.grid-stack">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">바이럴관리</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                  </ul>
                </li>
                <li class="pcoded-hasmenu  active pcoded-trigger">
                  <a href="javascript:void(0)" data-i18n="nav.advance-components.main">
                    <span class="pcoded-micon"><i class="ti-facebook"></i></span>
                    <span class="pcoded-mtext">SNS관리</span>
                    <span class="pcoded-mcaret"></span>
                  </a>
                  <ul class="pcoded-submenu">
                    <li class=" ">
                      <a href="mngFaceBook.html" data-i18n="nav.advance-components.draggable">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">페이스북관리</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                    <li class=" ">
                      <a href="mngTwitter.html" data-i18n="nav.advance-components.grid-stack">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">트위터관리</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                    <li class=" ">
                      <a href="mngInstagram.html" data-i18n="nav.advance-components.grid-stack">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">인스타그램관리</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                  </ul>
                </li>
                <li class="pcoded-hasmenu">
                  <a href="javascript:void(0)" data-i18n="nav.advance-components.main">
                    <span class="pcoded-micon"><i class="ti-notepad"></i></span>
                    <span class="pcoded-mtext">언론사관리</span>
                    <span class="pcoded-mcaret"></span>
                  </a>
                  <ul class="pcoded-submenu">
                    <li class=" ">
                      <a href="mngNews.html" data-i18n="nav.advance-components.draggable">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">언론사 기사글 관리</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                    <li class=" ">
                      <a href="mngPress.html" data-i18n="nav.advance-components.grid-stack">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">기자관리</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                  </ul>
                </li>
                <li class="pcoded-hasmenu">
                  <a href="javascript:void(0)" data-i18n="nav.advance-components.main">
                    <span class="pcoded-micon"><i class="ti-harddrives"></i></span>
                    <span class="pcoded-mtext">운영관리</span>
                    <span class="pcoded-mcaret"></span>
                  </a>
                  <ul class="pcoded-submenu">
                    <li class=" ">
                      <a href="mngCompany.html" data-i18n="nav.advance-components.draggable">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">거래처관리</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                    <li class=" ">
                      <a href="mngMonitoring.html" data-i18n="nav.advance-components.grid-stack">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">모니터링현황</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                  </ul>
                </li>
                <li class="">
                  <a href="mngKeyword.html" data-i18n="nav.advance-components.main">
                    <span class="pcoded-micon"><i class="ti-ink-pen"></i></span>
                    <span class="pcoded-mtext">키워드관리</span>
                    <span class="pcoded-mcaret"></span>
                  </a>
                </li>
                <li class="">
                  <a href="mngExtract.html" data-i18n="nav.advance-components.main">
                    <span class="pcoded-micon"><i class="ti-search"></i></span>
                    <span class="pcoded-mtext">추출글관리</span>
                    <span class="pcoded-mcaret"></span>
                  </a>
                </li>
                <li class="pcoded-hasmenu">
                  <a href="javascript:void(0)" data-i18n="nav.advance-components.main">
                    <span class="pcoded-micon"><i class="ti-filter"></i></span>
                    <span class="pcoded-mtext">분류글관리</span>
                    <span class="pcoded-mcaret"></span>
                  </a>
                  <ul class="pcoded-submenu">
                    <li class=" ">
                      <a href="mngClassifiCation1.html" data-i18n="nav.advance-components.draggable">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">좋은글</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                    <li class=" ">
                      <a href="mngClassifiCation2.html" data-i18n="nav.advance-components.grid-stack">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">나쁜글</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                    <li class=" ">
                      <a href="mngClassifiCation3.html" data-i18n="nav.advance-components.grid-stack">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">관심글</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                    <li class=" ">
                      <a href="mngClassifiCation3.html" data-i18n="nav.advance-components.grid-stack">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">기타</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                    <li class=" ">
                      <a href="mngClassifiCation4.html" data-i18n="nav.advance-components.grid-stack">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">삭제</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                  </ul>
                  <li class="">
                    <a href="mngAllList.html" data-i18n="nav.advance-components.main">
                      <span class="pcoded-micon"><i class="ti-menu"></i></span>
                      <span class="pcoded-mtext">전체글관리</span>
                      <span class="pcoded-mcaret"></span>
                    </a>
                  </li>
                </li>
              </ul>
            </div>
          </nav>
          <!-- right menu end -->
          <div class="pcoded-content">
            <div class="pcoded-inner-content">
              <div class="main-body">
                <div class="page-wrapper">
                  <div class="page-header">
                    <div class="page-header-title">
                      <h4>페이스북관리</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="dashboard.html">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">SNS관리</a></li>
                        <li class="breadcrumb-item"><a href="#!">페이스북관리</a></li>
                      </ul>
                    </div>
                  </div>
                  <!-- Page-body start -->
                  <div class="page-body">
                    <div class="row">
                      <!-- data setting start -->
                      <div class="col-md-7">
                        <select name="select" class="col-md-1 form-control form-control-inverse m-b-10 p-r-5 f-left">
                          <option value="opt1">회사</option>
                        </select>
                        <select name="select" class="col-md-1 form-control form-control-inverse m-b-10 p-r-5 f-left" id="keyword">
                          <option value="opt1">키워드</option>
                        </select>
                      </div>
                      <div class="col-md-5">
                        <!-- date picker start -->
                        <div class="row">
                          <div class="btn-group float-right m-b-10 p-l-15 p-r-10" role="group">
                            <button id="toDay" type="button" class="btn btn-inverse btn-sm waves-effect waves-light">당일</button>
                            <button id="yesterDay" type="button" class="btn btn-inverse btn-sm waves-effect waves-light">전일</button>
                            <button id="week" type="button" class="btn btn-inverse btn-sm waves-effect waves-light">최근7일</button>
                            <button id="month" type="button" class="btn btn-inverse btn-sm waves-effect waves-light">최근30일</button>
                          </div>
                          <div class="input-group float-right date col p-l-15 p-r-15 m-b-10">
                            <input type="text" id="fromDate" class="form-control form-control-inverse" value="">
                            <span class="input-group-addon bg-inverse">
                              <span class="icofont icofont-ui-calendar"></span>
                            </span>
                          </div>
                        </div>
                        <!-- date picker end -->
                      </div>
                      <!-- data setting end -->
                      <!-- 그래프 start -->
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            <h5 class="card-header-text">
                              <i class="icofont icofont-chart-line m-r-5"></i>
                             	 페이스북 그래프
                            </h5>
                            <div class="card-header-right">
                              <i class="icofont icofont-rounded-down"></i>
                              <i class="icofont icofont-refresh"></i>
                            </div>
                          </div>
                          <div class="card-block">
                            <!-- chart start -->
                            <div id="line-chart1"></div>
                            <!-- chart end -->
                          </div>
                        </div>
                      </div>
                      <!-- 그래프 end -->
                      <!-- table start -->
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            
                                <select id= "selectPerPageNum" name="select" class="col-sm-1 form-control form-control-inverse m-r-10 m-b-10 p-r-5 f-left list-select">
                                  <option id= "10" >10</option>
                                  <option id = "50">50</option>
                                  <option id = "100">100</option>
                                </select>
                                <select id = "selectSearchType" name="select" class="col-sm-1 form-control form-control-inverse m-r-10 m-b-10 f-left search-select">
                                  <option id="t" value="t">제목</option>
                                  <option id="c">게시글</option>
                                </select>
                                <div class="col-sm-3 input-group input-group-button input-group-inverse p-l-0 p-r-0 m-b-10 f-left btn-select">
                                  <input id="keywordInput" type="text" class="form-control" placeholder="">
                                  <span class="input-group-addon" id="basic-addon1">
                                    <button id="keySearchBtn" class=" btn btn-inverse">검색</button>
                                  </span>
                                </div>
                              <button class="btn btn-warning f-right alert-confirm" onclick="_gaq.push(['_trackEvent', 'example', 'try', 'alert-confirm']);"><i class="icofont icofont-file-excel"></i>EXCEL</button>
                          </div>
                          <div class="card-block">
                            <div class="table-responsive">
                              <table class="table table-bordered">
                                <thead>
                                  <tr>
                                    <th width="5%">NO</th>
                                    <th width="10%">등록날짜</th>
                                    <th width="5%">키워드</th>
                                    <th width="30%">제목</th>
                                    <th width="5%">글쓴이</th>
                                    <th width="5%">좋아요</th>
                                    <th width="5%">공유</th>
                                    <th width="5%">댓글</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <c:forEach items="${facebookList}" var="snsVO">
                                    <tr>
                                      <th scope="row">${snsVO.sns_idx}</th>
                                      <td>${snsVO.writeDate}</td>
                                      <td>${snsVO.keyword}</td>
                                      <td><a href="${snsVO.url}" target="_blank">${snsVO.sns_title}</a></td>
                                      <td>${snsVO.sns_writer}</td>
                                      <td>${snsVO.like_cnt}</td>
                                      <td>${snsVO.share_cnt}</td>
                                      <td>${snsVO.reply_cnt}</td>
                                    </tr>
                                  </c:forEach>
                                </tbody>
                              </table>
                              <ul class="pagination float-right">
                              
								<c:if test="${pageMaker.prev}">
                                <li class="page-item">
                                  <a class="page-link" href="facebook${pageMaker.makeSearch(pageMaker.startPage - 1) }" aria-label="Previous">&laquo;
                                    <span aria-hidden="true">«</span>
                                    <span class="sr-only">Previous</span>
                                  </a>
                                </li>
                                </c:if>
                                
                                <c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li class="page-item active" 
								  <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a class="page-link" href="facebook${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
								</c:forEach>
							
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                <li class="page-item">
                                  <a class="page-link" href="facebook${pageMaker.makeSearch(pageMaker.endPage +1) }" aria-label="Next">&raquo;
                                    <span aria-hidden="true">»</span>
                                    <span class="sr-only">Next</span>
                                  </a>
                                </li>
                                </c:if>
                              </ul>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- table end -->
                  </div>
                  <!-- Page-body end -->
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
  <!-- Bootstrap date-time-picker js -->
  <script type="text/javascript" src="../assets/pages/advance-elements/moment-with-locales.min.js"></script>
  <!-- Date-range picker js -->
  <script type="text/javascript" src="../bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
  <!-- classie js -->
  <script type="text/javascript" src="../bower_components/classie/classie.js"></script>
  <!-- sweet alert js -->
  <script type="text/javascript" src="../bower_components/sweetalert/dist/sweetalert.min.js"></script>
  <script type="text/javascript" src="../assets/pages/news/script.js"></script>
  <!-- Morris Chart js -->
  <script src="../bower_components/raphael/raphael.min.js"></script>
  <script src="../bower_components/morris.js/morris.js"></script>
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
  <script src="../assets/pages/sns/script.js"></script>
  <script src="../assets/pages/picker.js"></script>
</body>

  
  <script type="text/javascript" language="javascript">

  	
  $(document).ready(function(){
	  
	  
	  var date = getDate("week");
  	  var startDate = date.startDate;
  	  var endDate = date.endDate;
  	
  	  ajaxGraph(startDate, endDate);
	  
	  
	//최신순 함수 빼놓음
		var newest = function(event) {
			
			var makeQeury = '${pageMaker.makeQuery(1)}'.slice(0,-2);
			
			self.location = "facebook"
						+ makeQeury 
						+ $('#selectPerPageNum option:selected').val()
						+ "&searchType=" 
						+ $("#selectSearchType option:selected").val()
						+ "&keyword="
						+ $('#keywordInput').val(); 
		}
		

    $('#keySearchBtn').on("click", function(event){
    	console.log("searchBtn click....");
    	
  		console.log($('#selectSearchType option:selected').val());
  		
  		newest();
  		
  		  /* $(function(){ $("#listButton").click(function(){
  			$.ajax({
  				type: 'post' ,
  				url: '/list.html' ,
  				dataType : 'html' ,
  				success: function(data) {
  					$("#listDiv").html(data); 
  					}
  				});	
  			})	  
  		})*/

     });
    
    
    
    
    // 당일 클릭시
    $('#toDay').on("click", function(){
    	console.log("toDay clicked....");
    	var date = getDate("toDay");
    	var endDate = date.endDate;
    	
    	ajaxGraph(endDate, endDate);
    });

    $('#yesterDay').on("click", function(){
    	console.log("yesterDay clicked....");
    	var date = getDate("yesterDay");
    	var startDate = date.startDate;
    	var endDate = date.endDate;
    	
    	ajaxGraph(startDate, endDate);
    });
   
    $('#week').on("click", function(){
    	console.log("week clicked....");
    	var date = getDate("week");
    	var startDate = date.startDate;
    	var endDate = date.endDate;
    	
    	ajaxGraph(startDate, endDate);
    })
    
    $('#month').on("click", function(){
    	console.log("month clicked....");
    	var date = getDate("month");
    	var startDate = date.startDate;
    	var endDate = date.endDate;
    	
    	ajaxGraph(startDate, endDate);
    })
    
    
    // 캘린더 클릭시
    $('#fromDate').on('apply.daterangepicker', function(ev, picker) { 
    	   var startDate = picker.startDate.format('YYYY-MM-DD'); 
    	   var endDate = picker.endDate.format('YYYY-MM-DD'); 
    	
    	   ajaxGraph(startDate, endDate);
		    	
    	
    }); // end

	
    function ajaxGraph(startDate, endDate){
    	$.ajax({
            
            type : "POST",
        	  url : "graph",
         	  dataType : "json",
         	  data : {startDate : startDate, endDate : endDate},
          	error : function(){
              	alert('graphPOST ajax error....');
          	},
          	success : function(data){
          		
          		var script = "[";
          		
          		for(var i = 0; i < data.length; i++){
          			console.log(data[i]);
          			script += '{"period":' + '"' + data[i].writeDate + '",'+ '"l1"'+ ':' + data[i].likeCount + ","+ '"l2"' + ':' + data[i].shareCount + ","+ '"l3"' + ':' + data[i].replyCount + "},";
          			
          			if(i == data.length-1){
          				script =  script.substr(0, script.length-1);
          				script += "]";
          			}
          		}
          		console.log(script);
          		
          		// to json
          		var jsonScript = JSON.parse(script);
          		
          		lineChart(jsonScript);
          		
          	} 
      	});
    }
	
    
    function getDate(type){
    	console.log("TYPE : " + type);
    	var date = new Date();
   	 
   	 	var month = date.getMonth()+1;
   	 	var day = date.getDate();
   	 	var year = date.getFullYear();
   	 
   	 	var endDate = year + "-" + month + "-" + day;
   	 	var startDate;
   	 	
   	 	if(type == "yesterDay"){
   	 		var calcDate = day-1;
   	 		startDate = year + "-" + month + "-" + calcDate;
   	 		
   	 	}else if(type == "month"){
   	 		var calcDate = month-1;
   	 		startDate = year + "-" + calcDate + "-" + day;
   	 		
   	 	}else if(type == "week"){
   	 		var calcDate = day-7;
   	 		startDate = year + "-" + month + "-" + calcDate;
   	 	}

   	 	return {
   	 		startDate : startDate,
   	 		endDate : endDate
   	 	}
   	 	
    }
    
   	// 그래프 함수
    function lineChart(data){
		// 그래프 초기화
		$('#line-chart1').children().remove();
		
		window.lineChart = Morris.Line({
		      element: 'line-chart1',
		      data: data,
		      xkey: 'period',
		      redraw: true,
		      ykeys: ['l1', 'l2', 'l3'],
		      hideHover: 'auto',
		      labels: ['좋아요', '공유', '댓글'],
		      lineColors: ['#fb9678', '#7E81CB', '#01C0C8']
		  });
	}
    
    
  }); // end ready....
  	

  </script>
</html>