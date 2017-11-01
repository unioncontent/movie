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
  <!-- Menu-Search css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/menu-search/css/component.css">
  <!-- Horizontal-Timeline css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/dashboard/horizontal-timeline/css/style.css">
  <!-- font awesome -->
  <link rel="stylesheet" type="text/css" href="../assets/icon/font-awesome/css/font-awesome.css">
  <!-- Date-range picker css  -->
  <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- C3 chart -->
  <link rel="stylesheet" href="../bower_components/c3/c3.css" type="text/css" media="all">
  <!-- Style.css -->
  <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/picker.css">
  <link rel="stylesheet" type="text/css" href="../assets/pages/naver/css/style.css">
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
          <jsp:include page='../include/side.jsp' />
          <div class="pcoded-content">
            <div class="pcoded-inner-content">
              <div class="main-body">
                <div class="page-wrapper">
                  <div class="page-header">
                    <div class="page-header-title">
                      <h4>네이버관리</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="dashboard.html">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">포털관리</a></li>
                        <li class="breadcrumb-item"><a href="#!">네이버관리</a></li>
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
                    </div>

                    <!-- data setting end -->
                    <div class="row">
                        <!-- counter-card-1 start-->
                        <div class="col-md-12 col-xl-4">
                          <div class="card counter-card-1">
                            <div class="card-block-big">
                              <div>
                                <h3>0</h3>
                                <p>전체모니터링
                                  <span class="f-right text-inverse">
                                    <i class="icofont icofont-arrow-up"></i>
                                    37.89%
                                  </span>
                                </p>
                                <div class="progress ">
                                  <div class="progress-bar progress-bar-striped progress-xs progress-bar-pink" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                              </div>
                              <i class="icofont icofont-globe text-inverse"></i>
                            </div>
                          </div>
                        </div>
                        <!-- counter-card-1 end-->
                        <!-- counter-card-2 start -->
                        <div class="col-md-12 col-xl-4">
                          <div class="card counter-card-1">
                            <div class="card-block-big">
                              <div>
                                <h3>0</h3>
                                <p>영화
                                  <span class="f-right text-inverse">
                                    <i class="icofont icofont-arrow-up"></i>
                                    37.89%
                                  </span>
                                </p>
                                <div class="progress ">
                                  <div class="progress-bar progress-bar-striped progress-xs progress-bar-pink" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                              </div>
                              <i class="icofont icofont-video-clapper text-inverse"></i>
                            </div>
                          </div>
                        </div>
                        <!-- counter-card-2 end -->
                        <!-- counter-card-3 start -->
                        <div class="col-md-12 col-xl-4">
                          <div class="card counter-card-1">
                            <div class="card-block-big">
                              <div>
                                <h3>0</h3>
                                <p>배우
                                  <span class="f-right text-inverse">
                                    <i class="icofont icofont-arrow-up"></i>
                                    37.89%
                                  </span>
                                </p>
                                <div class="progress ">
                                  <div class="progress-bar progress-bar-striped progress-xs progress-bar-pink" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                              </div>
                              <i class="icofont icofont-user-alt-7 text-inverse"></i>
                            </div>
                          </div>
                        </div>
                        <!-- counter-card-3 end -->
                        <!-- pc 메인노출 테이블 start -->
                        <div class="col-md-6">
                          <!-- Pc table start -->
                          <div class="card">
                            <div class="card-header">
                                <h5>PC 메인 노출</h5>
                                <span>TV연예 홈</span>
                                <div class="card-header-right"><i class="icofont icofont-rounded-down"></i></div>
                            </div>
                            <div class="card-block table-border-style">
                              <div class="table-responsive">
                                <table class="table table-styling">
                                  <thead>
                                    <tr>
                                      <th width="5%">영역</th>
                                      <th width="10%">전체</th>
                                      <th width="10%">매칭</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <th scope="row">헤드라인기사</th>
                                      <td>3</td>
                                      <td>0</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">헤드라인 sub</th>
                                      <td>3</td>
                                      <td>0</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">아이템 기사</th>
                                      <td>3</td>
                                      <td>0</td>
                                    </tr>
                                    <tr class="bg-inverse">
                                      <th scope="row">합계</th>
                                      <td>0</td>
                                      <td>0</td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                          </div>
                          <!-- Pc table end -->
                        </div>
                        <!-- pc 메인노출 테이블 end -->
                        <!-- Donut chart start -->
                        <div class="col-md-12 col-lg-6">
                          <div class="card">
                            <div class="card-header" style="border:0;">
                              <div class="card-header-right">
                                <i class="icofont icofont-rounded-down"></i>
                                <i class="icofont icofont-refresh"></i>
                              </div>
                            </div>
                            <div class="card-block">
                              <div id="chart"></div>
                            </div>
                          </div>
                        </div>
                        <!-- Donut chart Ends -->
                        <!-- Morris chart start -->
                        <div class="col-md-12">
                          <div class="card">
                            <div class="card-header">
                              <h5>검출량그래프</h5>
                              <span>최근 24시간 검출된 데이터 그래프</span>
                              <div class="card-header-right">
                                <i class="icofont icofont-rounded-down"></i>
                                <i class="icofont icofont-refresh"></i>
                              </div>
                            </div>
                            <div class="card-block">
                              <div id="morris-extra-area" style="height:470px;"></div>
                            </div>
                          </div>
                        </div>
                        <!-- Morris chart end -->
                        <!-- pc,mobile순위 start -->
                        <div class="col-md-6">
                          <!-- Pc table start -->
                          <div class="card">
                            <div class="card-header">
                              <h5>PC</h5>
                              <span>Naver > 영화</span>
                              <div class="card-header-right"><i class="icofont icofont-rounded-down"></i></div>
                            </div>
                            <div class="card-block table-border-style">
                              <div class="table-responsive">
                                <table class="table table-styling  table-xs">
                                  <thead>
                                    <tr>
                                      <th width="5%">NO</th>
                                      <th>등록날짜</th>
                                      <th>제목</th>
                                      <th>언론사</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <th scope="row">1</th>
                                      <td>2017-09-29 20:54:16</td>
                                      <td>
                                        <a href="https://www.naver.com" target="_blank">
                                          <div class="nobr">[★SHOT!] "만삭의 아름다움"..이동건♥조윤희 동화 같은 결혼식 사진 공개</div>
                                        </a>
                                      </td>
                                      <td>스포츠서울</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">2</th>
                                      <td>2017-09-29 20:54:16</td>
                                      <td>
                                        <a href="https://www.naver.com" target="_blank">
                                          <div class="nobr">[★SHOT!] "만삭의 아름다움"..이동건♥조윤희 동화 같은 결혼식 사진 공개</div>
                                        </a>
                                      </td>
                                      <td>OSEN</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">3</th>
                                      <td>2017-09-29 20:54:16</td>
                                      <td>
                                        <a href="https://www.naver.com" target="_blank">
                                          <div class="nobr">[★SHOT!] "만삭의 아름다움"..이동건♥조윤희 동화 같은 결혼식 사진 공개</div>
                                        </a>
                                      </td>
                                      <td>OSEN</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">4</th>
                                      <td>2017-09-29 20:54:16</td>
                                      <td>
                                        <a href="https://www.naver.com" target="_blank">
                                          <div class="nobr">[★SHOT!] "만삭의 아름다움"..이동건♥조윤희 동화 같은 결혼식 사진 공개</div>
                                        </a>
                                      </td>
                                      <td>OSEN</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">5</th>
                                      <td>2017-09-29 20:54:16</td>
                                      <td>
                                        <a href="https://www.naver.com" target="_blank">
                                          <div class="nobr">[★SHOT!] "만삭의 아름다움"..이동건♥조윤희 동화 같은 결혼식 사진 공개</div>
                                        </a>
                                      </td>
                                      <td>OSEN</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">6</th>
                                      <td>2017-09-29 20:54:16</td>
                                      <td>
                                        <a href="https://www.naver.com" target="_blank">
                                          <div class="nobr">[★SHOT!] "만삭의 아름다움"..이동건♥조윤희 동화 같은 결혼식 사진 공개</div>
                                        </a>
                                      </td>
                                      <td>OSEN</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">7</th>
                                      <td>2017-09-29 20:54:16</td>
                                      <td>
                                        <a href="https://www.naver.com" target="_blank">
                                          <div class="nobr">[★SHOT!] "만삭의 아름다움"..이동건♥조윤희 동화 같은 결혼식 사진 공개</div>
                                        </a>
                                      </td>
                                      <td>OSEN</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">8</th>
                                      <td>2017-09-29 20:54:16</td>
                                      <td>
                                        <a href="https://www.naver.com" target="_blank">
                                          <div class="nobr">[★SHOT!] "만삭의 아름다움"..이동건♥조윤희 동화 같은 결혼식 사진 공개</div>
                                        </a>
                                      </td>
                                      <td>OSEN</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">9</th>
                                      <td>2017-09-29 20:54:16</td>
                                      <td>
                                        <a href="https://www.naver.com" target="_blank">
                                          <div class="nobr">[★SHOT!] "만삭의 아름다움"..이동건♥조윤희 동화 같은 결혼식 사진 공개</div>
                                        </a>
                                      </td>
                                      <td>OSEN</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">10</th>
                                      <td>2017-09-29 20:54:16</td>
                                      <td>
                                        <a href="https://www.naver.com" target="_blank">
                                          <div class="nobr">[★SHOT!] "만삭의 아름다움"..이동건♥조윤희 동화 같은 결혼식 사진 공개</div>
                                        </a>
                                      </td>
                                      <td>OSEN</td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                          </div>
                          <!-- Pc table end -->
                        </div>
                        <div class="col-md-6">
                          <!-- mobile table start -->
                          <div class="card">
                            <div class="card-header">
                                <h5>Mobile</h5>
                                <span>Naver > 영화</span>
                                <div class="card-header-right"><i class="icofont icofont-rounded-down"></i></div>
                            </div>
                            <div class="card-block table-border-style">
                              <div class="table-responsive">
                                <table class="table table-styling  table-xs">
                                  <thead>
                                    <tr>
                                      <th width="5%">NO</th>
                                      <th>등록날짜</th>
                                      <th>제목</th>
                                      <th>언론사</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <th scope="row">1</th>
                                      <td>2017-09-29 20:54:16</td>
                                      <td>
                                        <a href="https://www.naver.com" target="_blank">
                                          <div class="nobr">[★SHOT!] "만삭의 아름다움"..이동건♥조윤희 동화 같은 결혼식 사진 공개</div>
                                        </a>
                                      </td>
                                      <td>스포츠서울</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">2</th>
                                      <td>2017-09-29 20:54:16</td>
                                      <td>
                                        <a href="https://www.naver.com" target="_blank">
                                          <div class="nobr">[★SHOT!] "만삭의 아름다움"..이동건♥조윤희 동화 같은 결혼식 사진 공개</div>
                                        </a>
                                      </td>
                                      <td>OSEN</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">3</th>
                                      <td>2017-09-29 20:54:16</td>
                                      <td>
                                        <a href="https://www.naver.com" target="_blank">
                                          <div class="nobr">[★SHOT!] "만삭의 아름다움"..이동건♥조윤희 동화 같은 결혼식 사진 공개</div>
                                        </a>
                                      </td>
                                      <td>OSEN</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">4</th>
                                      <td>2017-09-29 20:54:16</td>
                                      <td>
                                        <a href="https://www.naver.com" target="_blank">
                                          <div class="nobr">[★SHOT!] "만삭의 아름다움"..이동건♥조윤희 동화 같은 결혼식 사진 공개</div>
                                        </a>
                                      </td>
                                      <td>OSEN</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">5</th>
                                      <td>2017-09-29 20:54:16</td>
                                      <td>
                                        <a href="https://www.naver.com" target="_blank">
                                          <div class="nobr">[★SHOT!] "만삭의 아름다움"..이동건♥조윤희 동화 같은 결혼식 사진 공개</div>
                                        </a>
                                      </td>
                                      <td>OSEN</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">6</th>
                                      <td>2017-09-29 20:54:16</td>
                                      <td>
                                        <a href="https://www.naver.com" target="_blank">
                                          <div class="nobr">[★SHOT!] "만삭의 아름다움"..이동건♥조윤희 동화 같은 결혼식 사진 공개</div>
                                        </a>
                                      </td>
                                      <td>OSEN</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">7</th>
                                      <td>2017-09-29 20:54:16</td>
                                      <td>
                                        <a href="https://www.naver.com" target="_blank">
                                          <div class="nobr">[★SHOT!] "만삭의 아름다움"..이동건♥조윤희 동화 같은 결혼식 사진 공개</div>
                                        </a>
                                      </td>
                                      <td>OSEN</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">8</th>
                                      <td>2017-09-29 20:54:16</td>
                                      <td>
                                        <a href="https://www.naver.com" target="_blank">
                                          <div class="nobr">[★SHOT!] "만삭의 아름다움"..이동건♥조윤희 동화 같은 결혼식 사진 공개</div>
                                        </a>
                                      </td>
                                      <td>OSEN</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">9</th>
                                      <td>2017-09-29 20:54:16</td>
                                      <td>
                                        <a href="https://www.naver.com" target="_blank">
                                          <div class="nobr">[★SHOT!] "만삭의 아름다움"..이동건♥조윤희 동화 같은 결혼식 사진 공개</div>
                                        </a>
                                      </td>
                                      <td>OSEN</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">10</th>
                                      <td>2017-09-29 20:54:16</td>
                                      <td>
                                        <a href="https://www.naver.com" target="_blank">
                                          <div class="nobr">[★SHOT!] "만삭의 아름다움"..이동건♥조윤희 동화 같은 결혼식 사진 공개</div>
                                        </a>
                                      </td>
                                      <td>OSEN</td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                          </div>
                          <!-- mobile table end -->
                        </div>
                        <!-- pc,mobile순위 end -->
                      </div>
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
  <!-- classie js -->
  <script type="text/javascript" src="../bower_components/classie/classie.js"></script>
  <!-- Bootstrap date-time-picker js -->
  <script type="text/javascript" src="../assets/pages/advance-elements/moment-with-locales.min.js"></script>
  <!-- Date-range picker js -->
  <script type="text/javascript" src="../bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
  <!-- c3 chart js -->
  <script src="../bower_components/d3/d3.min.js"></script>
  <script src="../bower_components/c3/c3.js"></script>
  <!-- Morris Chart js -->
  <script src="../bower_components/raphael/raphael.min.js"></script>
  <script src="../bower_components/morris.js/morris.js"></script>
  <!-- i18next.min.js -->
  <script type="text/javascript" src="../bower_components/i18next/i18next.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-xhr-backend/i18nextXHRBackend.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-browser-languagedetector/i18nextBrowserLanguageDetector.min.js"></script>
  <script type="text/javascript" src="../bower_components/jquery-i18next/jquery-i18next.min.js"></script>
  <!-- Custom js -->
  <script type="text/javascript" src="../assets/pages/naver/script.js"></script>
  <script type="text/javascript" src="../assets/pages/picker.js"></script>
  <script type="text/javascript" src="../assets/js/script.js"></script>
  <script src="../assets/js/pcoded.min.js"></script>
  <script src="../assets/js/demo-12.js"></script>
  <script src="../assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
  <script src="../assets/js/jquery.mousewheel.min.js"></script>
</body>

</html>