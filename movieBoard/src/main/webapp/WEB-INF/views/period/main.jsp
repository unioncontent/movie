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
  <!-- Required Fremwork -->
  <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/css/bootstrap.min.css">
  <!-- themify-icons line icon -->
  <link rel="stylesheet" type="text/css" href="../assets/icon/themify-icons/themify-icons.css">
  <!-- ico font -->
  <link rel="stylesheet" type="text/css" href="../assets/icon/icofont/css/icofont.css">
  <!-- font awesome -->
  <link rel="stylesheet" type="text/css" href="../assets/icon/font-awesome/css/font-awesome.css">
  <!-- Menu-Search css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/menu-search/css/component.css">
  <!-- Horizontal-Timeline css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/dashboard/horizontal-timeline/css/style.css">
  <!-- Date-range picker css  -->
  <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- Style.css -->
  <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/picker.css">
  <link rel="stylesheet" type="text/css" href="../assets/pages/period/css/style.css">
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
      <!-- top menu start -->
      <jsp:include page='../include/header.jsp' />
      <!-- top menu end -->
      <!-- main container start -->
      <div class="pcoded-main-container">
        <div class="pcoded-wrapper">
          <!-- right menu start -->
          <jsp:include page='../include/side.jsp' />
          <!-- right menu end -->
          <!-- content start -->
          <div class="pcoded-content">
            <div class="pcoded-inner-content">
              <!-- main-body start -->
              <div class="main-body">
                <div class="page-wrapper">
                  <!-- page-header start -->
                  <div class="page-header">
                    <div class="page-header-title">
                      <h4>통계보고서</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="dashboard.html">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">통계보고서</a>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <!-- page-header end -->
                  <!-- page-body start -->
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
                      <div class="col-lg-12">
                        <!-- tab header start -->
                        <jsp:include page='../include/period_header.jsp' />
                        <!-- tab header end -->
                        <!-- tab-content start -->
                        <div class="tab-content">
                          <!-- tab1 main start -->
                          <div class="tab-pane fade show active" id="main" role="tabpanel">
                            <div class="row">
                              <!-- top cards start -->
                              <div class="col-md-6 col-xl-2 main-card">
                                <div class="card social-widget-card">
                                  <div class="card-block-big bg-inverse">
                                    <h3>0</h3>
                                    <span class="m-t-10">전체검색</span>
                                    <i class="icofont icofont-search"></i>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6 col-xl-2 main-card">
                                <div class="card social-widget-card">
                                  <div class="card-block-big bg-primary">
                                    <h3>0</h3>
                                    <span class="m-t-10">포털검색</span>
                                    <i class="icofont icofont-web"></i>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6 col-xl-2 main-card">
                                <div class="card social-widget-card">
                                  <div class="card-block-big bg-success">
                                    <h3>0</h3>
                                    <span class="m-t-10">커뮤니티검색</span>
                                    <i class="icofont icofont-users"></i>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6 col-xl-2 main-card">
                                <div class="card social-widget-card">
                                  <div class="card-block-big bg-twitter">
                                    <h3>0</h3>
                                    <span class="m-t-10">SNS검색</span>
                                    <i class="icofont icofont-social-twitter"></i>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6 col-xl-2 main-card">
                                  <div class="card social-widget-card">
                                    <div class="card-block-big bg-news">
                                      <h3>0</h3>
                                      <span class="m-t-10">언론사검색</span>
                                      <i class="icofont icofont-building-alt"></i>
                                    </div>
                                  </div>
                                </div>
                              <!-- top cards end -->
                              <!-- 통계보고서 그래프 start -->
                              <div class="col-lg-12">
                                <div class="card">
                                  <div class="card-header">
                                    <h5 class="card-header-text">
                                      <i class="icofont icofont-chart-line m-r-5"></i>
                                      통계보고서 그래프
                                    </h5>
                                    <div class="card-header-right">
                                      <i class="icofont icofont-rounded-down"></i>
                                      <i class="icofont icofont-refresh"></i>
                                    </div>
                                  </div>
                                  <div class="card-block">
                                    <!-- chart start -->
                                    <div class="m-b-35" id="line-chart1"></div>
                                    <!-- chart end -->
                                  </div>
                                </div>
                              </div>
                              <!-- 통계보고서 그래프 end -->
                              <div class="col-md-6">
                                <!-- 전체여론통계 start -->
                                <div class="card">
                                  <div class="card-header">
                                    <h5 class="card-header-text">전체여론통계</h5>
                                    <div class="card-header-right">
                                      <i class="icofont icofont-rounded-down"></i>
                                      <i class="icofont icofont-refresh"></i>
                                    </div>
                                  </div>
                                  <div class="card-block">
                                    <!-- gauge1 start -->
                                    <div class="row">
                                      <div class="col-md-4">
                                        <div id="gauge1" style="height:300px"></div>
                                      </div>
                                      <div class="col-md-8 p-l-0 p-r-0">
                                        <div class="table-border-style">
                                          <div class="table-responsive">
                                            <table class="table table-styling">
                                              <thead>
                                                  <tr class="table-inverse">
                                                      <th>분류</th>
                                                      <th>호평</th>
                                                      <th>악평</th>
                                                      <th>관심</th>
                                                      <th>기타</th>
                                                      <th>합계</th>
                                                  </tr>
                                              </thead>
                                              <tbody>
                                                  <tr>
                                                      <th scope="row">포털</th>
                                                      <td>1</td>
                                                      <td>1</td>
                                                      <td>0</td>
                                                      <td>0</td>
                                                      <td>1</td>
                                                  </tr>
                                                  <tr>
                                                      <th scope="row">커뮤니티</th>
                                                      <td>0</td>
                                                      <td>1</td>
                                                      <td>0</td>
                                                      <td>0</td>
                                                      <td>2</td>
                                                  </tr>
                                                  <tr>
                                                      <th scope="row">댓글</th>
                                                      <td>1</td>
                                                      <td>1</td>
                                                      <td>0</td>
                                                      <td>0</td>
                                                      <td>1</td>
                                                  </tr>
                                                  <tr>
                                                      <th scope="row">합계</th>
                                                      <td>1</td>
                                                      <td>2</td>
                                                      <td>0</td>
                                                      <td>0</td>
                                                      <td>3</td>
                                                  </tr>
                                              </tbody>
                                            </table>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                    <!-- gauge1 end -->
                                  </div>
                                </div>
                                <!-- 전체여론통계 end -->
                              </div>
                              <div class="col-md-6">
                                <!-- 포털여론통계 start -->
                                <div class="card">
                                  <div class="card-header">
                                    <h5 class="card-header-text">포털여론통계</h5>
                                    <div class="card-header-right">
                                      <i class="icofont icofont-rounded-down"></i>
                                      <i class="icofont icofont-refresh"></i>
                                    </div>
                                  </div>
                                  <div class="card-block">
                                    <!-- gauge2 start -->
                                    <div class="row">
                                      <div class="col-md-4">
                                        <div id="gauge2" style="height:300px"></div>
                                      </div>
                                      <div class="col-md-8 p-l-0 p-r-0">
                                        <div class="table-border-style">
                                          <div class="table-responsive">
                                            <table class="table table-styling">
                                              <thead>
                                                  <tr class="table-inverse">
                                                      <th>분류</th>
                                                      <th>호평</th>
                                                      <th>악평</th>
                                                      <th>관심</th>
                                                      <th>기타</th>
                                                      <th>합계</th>
                                                  </tr>
                                              </thead>
                                              <tbody>
                                                  <tr height="63px">
                                                      <th scope="row">블로그 여론</th>
                                                      <td>1</td>
                                                      <td>1</td>
                                                      <td>0</td>
                                                      <td>0</td>
                                                      <td>1</td>
                                                  </tr>
                                                  <tr height="63px">
                                                      <th scope="row">카페여론</th>
                                                      <td>0</td>
                                                      <td>1</td>
                                                      <td>0</td>
                                                      <td>0</td>
                                                      <td>2</td>
                                                  </tr>
                                                  <tr height="63px">
                                                      <th scope="row">기사 댓글</th>
                                                      <td>1</td>
                                                      <td>1</td>
                                                      <td>0</td>
                                                      <td>0</td>
                                                      <td>1</td>
                                                  </tr>
                                              </tbody>
                                            </table>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                    <!-- gauge2 end -->
                                  </div>
                                </div>
                                <!-- 포털여론통계 end -->
                              </div>
                              <!-- sns/언론분석 start -->
                              <div class="col-md-6">
                                <div class="card">
                                  <div class="card-header">
                                    <h5 class="card-header-text">SNS 통계</h5>
                                    <div class="card-header-right">
                                      <i class="icofont icofont-rounded-down"></i>

                                    </div>
                                  </div>
                                  <div class="card-block table-border-style">
                                    <!-- sns table start -->
                                    <div class="table-border-style">
                                        <div class="table-responsive">
                                          <table class="table table-styling">
                                            <thead>
                                                <tr class="table-inverse">
                                                    <th>분류</th>
                                                    <th>전체검출량</th>
                                                    <th>좋아요</th>
                                                    <th>공유</th>
                                                    <th>댓글</th>
                                                    <th>합계</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">Facebook</th>
                                                    <td>1</td>
                                                    <td>1</td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td>1</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Twitter</th>
                                                    <td>0</td>
                                                    <td>1</td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td>2</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Instagram</th>
                                                    <td>1</td>
                                                    <td>1</td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td>1</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">합계</th>
                                                    <td>1</td>
                                                    <td>2</td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td>3</td>
                                                </tr>
                                            </tbody>
                                          </table>
                                        </div>
                                      </div>
                                    <!-- sns table end -->
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6">
                                <div class="card">
                                  <div class="card-header">
                                    <h5 class="card-header-text">언론 분석</h5>
                                    <div class="card-header-right">
                                      <i class="icofont icofont-rounded-down"></i>

                                    </div>
                                  </div>
                                  <div class="card-block table-border-style">
                                    <!-- news table start -->
                                    <div class="table-border-style">
                                        <div class="table-responsive">
                                          <table class="table table-styling">
                                            <thead>
                                                <tr class="table-inverse">
                                                    <th>분류</th>
                                                    <th>호평</th>
                                                    <th>악평</th>
                                                    <th>관심</th>
                                                    <th>기타</th>
                                                    <th>합계</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr height="92px">
                                                    <th scope="row">NAVER기사</th>
                                                    <td>1</td>
                                                    <td>1</td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td>1</td>
                                                </tr>
                                                <tr height="92px">
                                                    <th scope="row">DAUM기사</th>
                                                    <td>1</td>
                                                    <td>1</td>
                                                    <td>0</td>
                                                    <td>0</td>
                                                    <td>1</td>
                                                </tr>
                                            </tbody>
                                          </table>
                                        </div>
                                      </div>
                                    <!-- news table end -->
                                  </div>
                                </div>
                              </div>
                              <!-- sns/언론분석 end -->
                            </div>
                          </div>
                          <!-- tab1 main end -->
                        </div>
                        <!-- tab-content end -->
                      </div>
                    </div>
                  </div>
                  <!-- page-body end -->
                </div>
              </div>
              <!-- main-body end -->
            </div>
          </div>
          <!-- content end -->
        </div>
      </div>
      <!-- main container end -->
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
  <!-- modernizr js -->
  <script type="text/javascript" src="../bower_components/modernizr/modernizr.js"></script>
  <script type="text/javascript" src="../bower_components/modernizr/feature-detects/css-scrollbars.js"></script>
  <!-- classie js -->
  <script type="text/javascript" src="../bower_components/classie/classie.js"></script>
  <!-- Morris Chart js -->
  <script src="../bower_components/raphael/raphael.min.js"></script>
  <script src="../bower_components/morris.js/morris.js"></script>
  <!-- echart js -->
  <script src="../assets/pages/chart/echarts/js/echarts-all.js" type="text/javascript"></script>
  <!-- Date-range picker js -->
  <script type="text/javascript" src="../bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
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
  <script src="../assets/pages/period/custom-period1.js"></script>
  <script src="../assets/pages/picker.js"></script>
</body>

</html>