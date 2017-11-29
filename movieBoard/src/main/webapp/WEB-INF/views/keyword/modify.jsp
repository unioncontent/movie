<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <li class="pcoded-hasmenu">
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
                <li class="active">
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
                      <h4>키워드수정</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="dashboard.html">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="mngKeyword.html">키워드관리</a></li>
                        <li class="breadcrumb-item"><a href="#!">키워드수정</a></li>
                      </ul>
                    </div>
                  </div>
                  <div class="page-body">
                    <div class="row">
                      <div class="col-md-12">
                        <div class="card">
                          <div class="card-header">
                            <h5></h5>
                            <div class="card-header-right">
                              <i class="icofont icofont-rounded-down"></i>
                            </div>
                          </div>
                          <div class="card-block  table-border-style">
                            <div class="table-responsive">
                              <table class="table table-bordered result">
                                <thead>
                                  <tr class="bg-inverse">
                                    <th width="5%">컨텐츠명</th>
                                    <th width="5%">CP사</th>
                                    <th width="5%">설명</th>
                                    <th width="5%">컨텐츠ID</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <td>
                                      산양산삼
                                      <div class="label-main">
                                        <label class="label label-success">관리</label>
                                      </div>
                                      <!-- <div class="label-main">
                                        <label class="label label-danger">비관리</label>
                                      </div> -->
                                    </td>
                                    <td>청유심</td>
                                    <td></td>
                                    <td>12</td>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-12">
                          <div class="card">
                            <div class="card-block">
                              <div class="table-responsive">
                                <table class="table table-bordered">
                                  <thead>
                                    <tr>
                                      <th class="tabledit-view-mode"></th>
                                      <th class="tabledit-view-mode">검색어</th>
                                      <th class="tabledit-view-mode">제외검색어</th>
                                      <th class="tabledit-view-mode">영화구분</th>
                                      <th class="tabledit-view-mode">작업</th>
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
                                              <input type="radio" name="member" value="free" data-bv-field="member">
                                              <i class="helper"></i>영화
                                            </label>
                                          </div>
                                          <div class="radio radiofill radio-primary radio-inline">
                                            <label>
                                              <input type="radio" name="member" value="personal" data-bv-field="member">
                                              <i class="helper"></i>배우
                                            </label>
                                          </div>
                                          <div class="radio radiofill radio-primary radio-inline">
                                            <label>
                                              <input type="radio" name="member" value="personal" data-bv-field="member">
                                              <i class="helper"></i>기타
                                            </label>
                                          </div>
                                        </div>
                                      </td>
                                      <td><button class="btn btn-success btn-sm" id="puls"><i class="icofont icofont-plus" style="margin-right:0"></i></button></td>
                                    </tr>
                                    <tr>
                                      <th scope="row"  class="centerTh">1</th>
                                      <td>산양산삼</td>
                                      <td></td>
                                      <td></td>
                                      <td><button class="btn btn-danger btn-sm"><i class="icofont icofont-garbage" style="margin-right:0"></i></button></td>
                                    </tr>
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

</html>
