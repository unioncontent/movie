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
  <!-- Menu-Search css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/menu-search/css/component.css">
  <!-- Horizontal-Timeline css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/dashboard/horizontal-timeline/css/style.css">
  <!-- sweet alert framework -->
  <link rel="stylesheet" type="text/css" href="../bower_components/sweetalert/dist/sweetalert.css">
  <!-- font awesome -->
  <link rel="stylesheet" type="text/css" href="../assets/icon/font-awesome/css/font-awesome.css">
  <!-- Date-range picker css  -->
  <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- jquery timepicker css -->
  <link rel="stylesheet" href="../bower_components/jquery-timepicker-1.3.5/jquery.timepicker.min.css">
  <!-- Redial css -->
  <link rel="stylesheet" href="../assets/pages/chart/radial/css/radial.css" type="text/css" media="all">
  <!-- Style.css -->
  <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/pages/viral/css/style.css">
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
          <!-- left menu start -->
          <nav class="pcoded-navbar">
            <div class="pcoded-inner-navbar main-menu">
              <div class="">
                <div class="main-menu-header">
                  <img class="img-50" src="../assets/images/avatar-blank.png" alt="User-Profile-Image">
                  <div class="user-details">
                    <span id="more-details">Union</span>
                  </div>
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
                <li class="pcoded-hasmenu active pcoded-trigger">
                  <a href="javascript:void(0)">
                    <span class="pcoded-micon"><i class="ti-world"></i></span>
                    <span class="pcoded-mtext">포털관리</span>
                    <span class="pcoded-mcaret"></span>
                  </a>
                  <ul class="pcoded-submenu">
                    <li class="">
                      <a href="mngNaver.html">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">네이버관리</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                    <li class=" ">
                      <a href="mngViral.html">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">바이럴관리</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                  </ul>
                </li>
                <li class="pcoded-hasmenu">
                  <a href="javascript:void(0)">
                    <span class="pcoded-micon"><i class="ti-facebook"></i></span>
                    <span class="pcoded-mtext">SNS관리</span>
                    <span class="pcoded-mcaret"></span>
                  </a>
                  <ul class="pcoded-submenu">
                    <li class=" ">
                      <a href="mngFacebook.html">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">페이스북관리</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                    <li class=" ">
                      <a href="mngTwitter.html">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">트위터관리</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                    <li class=" ">
                      <a href="mngInstagram.html">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">인스타그램관리</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                  </ul>
                </li>
                <li class="pcoded-hasmenu">
                  <a href="javascript:void(0)">
                    <span class="pcoded-micon"><i class="ti-notepad"></i></span>
                    <span class="pcoded-mtext">언론사관리</span>
                    <span class="pcoded-mcaret"></span>
                  </a>
                  <ul class="pcoded-submenu">
                    <li class=" ">
                      <a href="mngNews.html">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">언론사 기사글 관리</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                    <li class=" ">
                      <a href="mngPress.html">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">기자관리</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                  </ul>
                </li>
                <li class="pcoded-hasmenu">
                  <a href="javascript:void(0)">
                    <span class="pcoded-micon"><i class="ti-harddrives"></i></span>
                    <span class="pcoded-mtext">운영관리</span>
                    <span class="pcoded-mcaret"></span>
                  </a>
                  <ul class="pcoded-submenu">
                    <li class=" ">
                      <a href="mngCompany.html">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">거래처관리</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                    <li class=" ">
                      <a href="monitoring.html">
                        <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                        <span class="pcoded-mtext">모니터링현황</span>
                        <span class="pcoded-mcaret"></span>
                      </a>
                    </li>
                  </ul>
                </li>
                <li class="">
                  <a href="mngKeyword.html">
                    <span class="pcoded-micon"><i class="ti-ink-pen"></i></span>
                    <span class="pcoded-mtext">키워드관리</span>
                    <span class="pcoded-mcaret"></span>
                  </a>
                </li>
                <li class="">
                  <a href="mngExtract.html">
                    <span class="pcoded-micon"><i class="ti-search"></i></span>
                    <span class="pcoded-mtext">추출글관리</span>
                    <span class="pcoded-mcaret"></span>
                  </a>
                </li>
                <li class="">
                  <a href="mngClassifiCation.html" data-i18n="nav.advance-components.main">
                    <span class="pcoded-micon"><i class="ti-filter"></i></span>
                    <span class="pcoded-mtext">분류글관리</span>
                    <span class="pcoded-mcaret"></span>
                  </a>
                </li>
                <li class="">
                  <a href="mngAllList.html" data-i18n="nav.advance-components.main">
                    <span class="pcoded-micon"><i class="ti-menu"></i></span>
                    <span class="pcoded-mtext">전체글관리</span>
                    <span class="pcoded-mcaret"></span>
                  </a>
                </li>
              </ul>
            </div>
          </nav>
          <!-- left menu end -->
          <div class="pcoded-content">
            <div class="pcoded-inner-content">
              <div class="main-body">
                <div class="page-wrapper">
                  <div class="page-header">
                    <div class="page-header-title">
                      <h4>평점관리</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="dashboard.html">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="mngViral.html">바이럴관리</a></li>
                        <li class="breadcrumb-item"><a href="#!">평점관리</a></li>
                      </ul>
                    </div>
                  </div>
                  <!-- page-body start -->
                  <div class="page-body">
                    <div class="row">
                      <!-- data setting start -->
                      <div class="col-md-6">
                        <select name="select" class="col-md-1 form-control form-control-inverse m-b-10 p-r-5 f-left">
                          <option>회사</option>
                        </select>
                        <select name="select" class="col-md-1 form-control form-control-inverse m-b-10 p-r-5 f-left select-left">
                          <option>키워드</option>
                        </select>
                      </div>
                      <div class="col-md-5">
                        <!-- date picker start -->
                        <div class="row">
                          <div class="btn-group float-right m-b-10 p-l-15 p-r-10" role="group">
                            <button type="button" class="btn btn-inverse btn-sm waves-effect waves-light">당일</button>
                            <button type="button" class="btn btn-inverse btn-sm waves-effect waves-light">전일</button>
                            <button type="button" class="btn btn-inverse btn-sm waves-effect waves-light">최근7일</button>
                            <button type="button" class="btn btn-inverse btn-sm waves-effect waves-light">최근30일</button>
                          </div>
                          <div class="input-group float-right date col p-l-15 p-r-15 m-b-10">
                            <input type="text" id="fromDate" class="form-control form-control-inverse" value="">
                            <span class="input-group-addon bg-inverse" onclick="$('#fromDate').click();">
                              <span class="icofont icofont-ui-calendar"></span>
                            </span>
                          </div>
                        </div>
                        <!-- date picker end -->
                      </div>
                      <!-- data setting end -->
                      <div class="col-lg-12">
                        <!-- tab header start -->
                        <div class="tab-header">
                          <ul class="nav nav-tabs nav-vtabs md-tabs tab-timeline" role="tablist" id="mytab">
                            <a class="nav-item" href="mngViral.html">
                              <li class="nav-link">
                                <p>바이럴관리</p>
                                <div class="slide"></div>
                              </li>
                            </a>
                            <a class="nav-item" href="viralBlog.html">
                              <li class="nav-link">
                                <p>블로그관리</p>
                                <div class="slide"></div>
                              </li>
                            </a>
                            <a class="nav-item" href="viralCafe.html">
                              <li class="nav-link">
                                  <p>카페관리</p>
                                  <div class="slide"></div>
                              </li>
                            </a>
                            <a class="nav-item" href="viralKinTip.html">
                              <li class="nav-linke">
                                <p>지식인/Tip관리</p>
                                <div class="slide"></div>
                              </li>
                            </a>
                            <a class="nav-item" href="viralWeb.html">
                              <li class="nav-link">
                                <p>웹문서관리</p>
                                <div class="slide"></div>
                              </li>
                            </a>
                            <a class="nav-item" href="viralRword.html">
                              <li class="nav-link active">
                                <p>연관검색어관리</p>
                                <div class="slide"></div>
                              </li>
                            </a>
                          </ul>
                        </div>
                        <div class="tab-content">
                          <div class="tab-pane fade show active" id="main" role="tabpanel">
                            <div class="row">
                              <div class="col-md-6 col-xl-3">
                                <div class="card client-blocks">
                                  <div class="card-block-big card1">
                                    <h5 class="mt"  style="font-size: 25px;     padding-top: 5px;">전체건수</h5>
                                    <ul>
                                      <li class="p-t-10">
                                        <i class="icofont icofont-document-search"></i>
                                      </li>
                                      <li class="text-right">300건</li>
                                    </ul>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6 col-xl-6">
                                <div class="row">
                                  <div class="col p-l-0 p-r-0">
                                    <div class="card user-activity-card" style="border-radius: 0;">
                                      <div class="card-header">
                                        <h5>좋은글</h5>
                                        <span>점수 범위 : 10 ~ 8</span>
                                      </div>
                                      <div class="card-block-big text-center typography">
                                        <h2 class="text-success" style="font-weight: 600;">223<small style="font-size:20px; font-weight: 400;">/ 27%</small></h2>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="col p-l-0 p-r-0">
                                    <div class="card user-activity-card" style="border-radius: 0;">
                                      <div class="card-header">
                                        <h5>관심글</h5>
                                        <span>점수 범위 : 7 ~ 5</span>
                                      </div>
                                      <div class="card-block-big text-center typography">
                                        <h2 class="text-primary" style="font-weight: 600;">223<small style="font-size:20px; font-weight: 400;">/ 27%</small></h2>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="col p-l-0 p-r-0">
                                    <div class="card user-activity-card" style="border-radius: 0;">
                                      <div class="card-header">
                                        <h5>나쁜글</h5>
                                        <span>점수 범위 : 4 ~ 2</span>
                                      </div>
                                      <div class="card-block-big text-center typography">
                                        <h2 class="text-warning" style="font-weight: 600;">223<small style="font-size:20px; font-weight: 400;">/ 27%</small></h2>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="col p-l-0 p-r-0">
                                    <div class="card user-activity-card" style="border-radius: 0;">
                                      <div class="card-header">
                                        <h5>악성글</h5>
                                        <span>점수 범위 : 1</span>
                                      </div>
                                      <div class="card-block-big text-center typography">
                                        <h2 class="text-danger" style="font-weight: 600;">223<small style="font-size:20px; font-weight: 400;">/ 27%</small></h2>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!-- <div class="col-md-6 col-xl-6">
                                <div class="card table-card group-widget">
                                  <div class="row-table">
                                    <div class="col bg-primary card-block-big">
                                      <i class="icofont icofont-music"></i>
                                      <p class="ng-tns-c16-68">1,586</p>
                                    </div>
                                    <div class="col bg-dark-primary card-block-big">
                                      <i class="icofont icofont-video-clapper"></i>
                                      <p class="ng-tns-c16-68">1,743</p>
                                    </div>
                                    <div class="col bg-darkest-primary card-block-big">
                                      <i class="icofont icofont-email"></i>
                                      <p class="ng-tns-c16-68">1,096</p>
                                    </div>
                                    <div class="col bg-darkest-primary card-block-big">
                                      <i class="icofont icofont-email"></i>
                                      <p class="ng-tns-c16-68">1,096</p>
                                    </div>
                                  </div>
                                </div>
                              </div> -->
                              <div class="col-md-6 col-xl-3">
                                <div class="card user-activity-card">
                                  <div class="card-block-big" style="padding-top: 31px;padding-bottom: 8px;">
                                    <div class="row">
                                      <div class="col-sm-6">
                                        <dl class="dl-horizontal row">
                                          <dt class="col-sm-5">10 ~ 8</dt>
                                          <dd class="col-sm-7"><label class="label label-success">아주좋음</label></dd>
                                          <dt class="col-sm-5">8 ~ 6</dt>
                                          <dd class="col-sm-7"><label class="label label-primary">좋음</label></dd>
                                          <dt class="col-sm-5">6 ~ 5</dt>
                                          <dd class="col-sm-7"><label class="label label-info">양호</label></dd>
                                          <dt class="col-sm-5">5 ~ 3</dt>
                                          <dd class="col-sm-7"><label class="label label-warning">주의</label></dd>
                                          <dt class="col-sm-5">2 ~ 1</dt>
                                          <dd class="col-sm-7"><label class="label label-danger">경고</label></dd>
                                        </dl>
                                      </div>
                                      <div class="col-sm-6">
                                        <h4 class="sub-title">분류비율표</h4><br />
                                        <h2 class="text-success text-center"><strong>아주좋음</strong></h2>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="card">
                                  <div class="card-header">
                                    <h5>평점 관리 리스트</h5>
                                  </div>
                                  <div class="card-block table-border-style">
                                    <div class="table-responsive">
                                      <table class="table table-styling table-checkbox">
                                        <thead>
                                          <tr>
                                            <th>NO</th>
                                            <th>등록일</th>
                                            <th>구분</th>
                                            <th>내용</th>
                                            <th>키워드</th>
                                            <th>점수</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <th>1</th>
                                            <td>2017-12-13</td>
                                            <td>Naver</td>
                                            <td>강철비굿</td>
                                            <td>강철비</td>
                                            <td>10</td>
                                          </tr>
                                        </tbody>
                                        <tfoot>
                                          <tr>
                                            <td colspan="6">
                                              <ul class="pagination float-right">
                                                <li class="page-item">
                                                  <a class="page-link" href="#" aria-label="Previous">
                                                    <span aria-hidden="true">«</span>
                                                    <span class="sr-only">Previous</span>
                                                  </a>
                                                </li>
                                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item">
                                                  <a class="page-link" href="#" aria-label="Next">
                                                    <span aria-hidden="true">»</span>
                                                    <span class="sr-only">Next</span>
                                                  </a>
                                                </li>
                                              </ul>
                                            </td>
                                          </tr>
                                        </tfoot>
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
                  <!-- page-body end -->
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
  <!-- Bootstrap date-time-picker js -->
  <script type="text/javascript" src="../assets/pages/advance-elements/moment-with-locales.min.js"></script>
  <!-- Date-range picker js -->
  <script type="text/javascript" src="../bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
  <!-- jquery timepicker js -->
  <script src="../bower_components/jquery-timepicker-1.3.5/jquery.timepicker.min.js"></script>
  <!-- modernizr js -->
  <script type="text/javascript" src="../bower_components/modernizr/modernizr.js"></script>
  <script type="text/javascript" src="../bower_components/modernizr/feature-detects/css-scrollbars.js"></script>
  <!-- classie js -->
  <script type="text/javascript" src="../bower_components/classie/classie.js"></script>
  <!-- i18next.min.js -->
  <script type="text/javascript" src="../bower_components/i18next/i18next.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-xhr-backend/i18nextXHRBackend.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-browser-languagedetector/i18nextBrowserLanguageDetector.min.js"></script>
  <script type="text/javascript" src="../bower_components/jquery-i18next/jquery-i18next.min.js"></script>
  <!-- sweet alert js -->
  <script type="text/javascript" src="../bower_components/sweetalert/dist/sweetalert.min.js"></script>
  <!-- knob js -->
  <script src="../bower_components/aterrien/jQuery-Knob/js/jquery.knob.js"></script>
  <!-- Custom js -->
  <script type="text/javascript" src="../assets/js/script.js"></script>
  <script type="text/javascript" src="../assets/pages/viral/script2.js"></script>
  <script src="../assets/pages/picker.js"></script>
  <script src="../assets/js/pcoded.min.js"></script>
  <script src="../assets/js/demo-12.js"></script>
  <script src="../assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
  <script src="../assets/js/jquery.mousewheel.min.js"></script>
</body>

</html>
