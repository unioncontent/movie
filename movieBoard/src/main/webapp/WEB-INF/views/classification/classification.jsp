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
  <!-- Date-time picker css -->
  <link rel="stylesheet" type="text/css" href="assets/pages/advance-elements/css/bootstrap-datetimepicker.css">
  <!-- Date-range picker css  -->
  <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- sweet alert framework -->
  <link rel="stylesheet" type="text/css" href="../bower_components/sweetalert/dist/sweetalert.css">
  <!-- Style.css -->
  <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/pages/division/css/style.css">
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
                      <h4>분류글관리</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="dashboard.html">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">분류글관리</a></li>
                      </ul>
                    </div>
                  </div>
                  <!-- Page-body start -->
                  <div class="page-body">
                    <div class="row">
                      <!-- data setting start -->
                      <div class="col-md-7">
                        <select name="select" class="col-md-1 form-control form-control-inverse m-r-10 m-b-10 p-r-5 f-left">
                          <option value="opt1">회사</option>
                        </select>
                        <select name="select" class="col-md-1 form-control form-control-inverse m-r-10 m-b-10 p-r-5 f-left">
                          <option value="opt1">키워드</option>
                        </select>
                        <select name="select" class="col-md-1 form-control form-control-inverse m-r-10 m-b-10 p-r-5 f-left">
                          <option value="opt1">분류</option>
                          <option value="opt1">좋은글</option>
                          <option value="opt1">나쁜글</option>
                          <option value="opt1">관심글</option>
                          <option value="opt1">기타</option>
                          <option value="opt1">삭제</option>
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
                            <span class="input-group-addon bg-inverse">
                              <span class="icofont icofont-ui-calendar"></span>
                            </span>
                          </div>

                        </div>
                        <!-- date picker end -->
                      </div>
                      <!-- data setting end -->
                      <!-- table start -->
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            <select name="select" class="col-sm-1 form-control form-control-inverse m-r-10 m-b-10 p-r-5 f-left">
                              <option value="">10</option>
                              <option value="">30</option>
                              <option value="">50</option>
                              <option value="">100</option>
                            </select>
                            <select name="select" class="col-sm-1 form-control form-control-inverse m-r-10 m-b-10 f-left">
                              <option value="">제목</option>
                              <option value="">분류</option>
                              <option value="">사이트명</option>
                              <option value="">게시판명</option>
                            </select>
                            <div class="col-sm-3 input-group input-group-button input-group-inverse p-l-0 p-r-0 m-b-10 f-left">
                              <input type="text" class="form-control" placeholder="">
                              <span class="input-group-addon" id="basic-addon1">
                                <button class="btn btn-inverse">검색</button>
                              </span>
                            </div>
                            <button class="btn btn-warning alert-excel f-right p-r-5 p-l-5 m-l-15 m-b-10"><i class="icofont icofont-download-alt"></i>EXCEL</button>
                            <button type="button" class="btn btn-inverse  waves-effect  f-right p-r-5 p-l-5 m-l-15 m-b-10" data-toggle="modal" data-target="#frmModal"><i class="ti-pencil-alt"></i>수동입력</button>
                            <button type="button" class="alert-confirm btn btn-primary waves-effect f-right p-r-0 p-l-5 m-l-15 m-b-10  f-right"><i class="icofont icofont-check-circled"></i>일괄처리</button>
                          </div>
                          <div class="card-block">
                            <div class="table-responsive">
                              <table class="table table-hover">
                                <thead>
                                  <tr>
                                    <th width="5%">NO</th>
                                    <th width="10%">사이트<br /><span class="text-muted">구분</span></th>
                                    <th width="10%">회사명</th>
                                    <th width="10%">컨텐츠타입<br /><span class="text-muted">(랭킹)</span></th>
                                    <th width="10%">게시판명<br /><span class="text-muted">키워드</span></th>
                                    <th width="20%">제목<br /><span class="text-muted">타이틀</span><br /><span class="text-success">컨텐츠</span></th>
                                    <th width="10%">추출일 / 작성일</th>
                                    <th width="10%">분류변경</th>
                                    <th width="5%">분류처리</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <th scope="row">1</th>
                                    <td>naver_web<br /><span class="text-muted">구분</span></td>
                                    <td>우드파크온수매트</td>
                                    <td>news<br /><span class="text-muted">()</span></td>
                                    <td>온수매트기사<br /><span class="text-muted">우드파크</span></td>
                                    <td>
                                      <a href="https://www.naver.com" target="_blank">
                                        <div class="nobr">찬바람 불어오니 온수매트 인기… 올해 6000억원대 시장 성장 전망</div>
                                      </a><br />
                                      <span class="text-muted"></span><br />
                                      <span class="text-success">14</span>
                                    </td>
                                    <td>2017-10-23 07:46:00 /<br/>2017-10-23 07:46:00 </td>
                                    <td>
                                      <div class="radios">
                                        <input type="radio" id="radio1" name="radios" checked>
                                        <label for="radio1">좋은글</label>
                                        <input type="radio" id="radio2" name="radios">
                                        <label for="radio2">나쁜글</label>
                                        <input type="radio" id="radio3" name="radios">
                                        <label for="radio3">관심글</label>
                                        <br/>
                                        <input type="radio" id="radio4" name="radios">
                                        <label for="radio4">기타글</label>
                                        <input type="radio" id="radio5" name="radios">
                                        <label for="radio5">삭제글</label>
                                        <input type="radio" id="radio6" name="radios">
                                        <label for="radio6">미분류</label>
                                      </div>
                                    </td>
                                    <td>
                                      <button class="btn btn-danger btn-sm alert-confirm1" data-toggle="tooltip" data-placement="top" data-original-title="삭제"><i class="icofont icofont-ui-delete" style="margin-right:0"></i></button>
                                      <button class="btn btn-primary btn-sm alert-confirm2" data-toggle="tooltip" data-placement="top" data-original-title="즉시처리"><i class="icofont icofont-ui-check" style="margin-right:0"></i></button>
                                    </td>
                                  </tr>
                                  <tr>
                                    <th scope="row">2</th>
                                    <td>naver_web<br /><span class="text-muted">구분</span></td>
                                    <td>우드파크온수매트</td>
                                    <td>news<br /><span class="text-muted">()</span></td>
                                    <td>온수매트기사<br /><span class="text-muted">우드파크</span></td>
                                    <td>
                                      <a href="https://www.naver.com" target="_blank">
                                        <div class="nobr">찬바람 불어오니 온수매트 인기… 올해 6000억원대 시장 성장 전망</div>
                                      </a><br />
                                      <span class="text-muted"></span><br />
                                      <span class="text-success">14</span>
                                    </td>
                                    <td>2017-10-23 07:46:00 /<br/>2017-10-23 07:46:00 </td>
                                    <td>
                                      <div class="radios">
                                        <input type="radio" id="radio7" name="radios1">
                                        <label for="radio7">좋은글</label>
                                        <input type="radio" id="radio8" name="radios1" checked>
                                        <label for="radio8">나쁜글</label>
                                        <input type="radio" id="radio9" name="radios1">
                                        <label for="radio9">관심글</label>
                                        <br/>
                                        <input type="radio" id="radio10" name="radios1">
                                        <label for="radio10">기타글</label>
                                        <input type="radio" id="radio11" name="radios1">
                                        <label for="radio11">삭제글</label>
                                        <input type="radio" id="radio12" name="radios1">
                                        <label for="radio12">미분류</label>
                                      </div>
                                    </td>
                                    <td>
                                      <button class="btn btn-danger btn-sm alert-confirm1" data-toggle="tooltip" data-placement="top" data-original-title="삭제"><i class="icofont icofont-ui-delete" style="margin-right:0"></i></button>
                                      <button class="btn btn-primary btn-sm alert-confirm2" data-toggle="tooltip" data-placement="top" data-original-title="즉시처리"><i class="icofont icofont-ui-check" style="margin-right:0"></i></button>
                                    </td>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
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
                          </div>
                        </div>
                      </div>
                      <!-- table end -->
                    </div>
                    <!-- frmModal start -->
                    <div class="modal fade" id="frmModal" tabindex="-1" role="dialog">
                      <div class="modal-dialog  modal-lg" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h4 class="modal-title">분류글 수동 입력</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            <form id="frm">
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">소속사</label>
                                <div class="col-sm-10">
                                  <select name="select" class="form-control form-control-default" id="select1">
                                    <option value="">소속사명</option>
                                    <option value="">UAA</option>
                                  </select>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">연예인명</label>
                                <div class="col-sm-10">
                                  <select name="select" class="form-control form-control-default" id="select2">
                                    <option value="">연예인명</option>
                                    <option value="">강동원</option>
                                  </select>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">분류</label>
                                <div class="col-sm-10">
                                  <select name="select" class="form-control form-control-default">
                                    <option value="">좋은글</option>
                                    <option value="">나쁜글</option>
                                    <option value="">관심글</option>
                                    <option value="">기타</option>
                                  </select>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">검색어</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="검색어">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">사이트명</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="사이트명" id="siteName">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">게시판명</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="게시판명">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">컨텐츠 타입</label>
                                <div class="col-sm-10">
                                  <select name="select" class="form-control form-control-default">
                                    <option value="1">board</option>
                    			   				<option value="2">reply</option>
                    			   				<option value="3">news</option>
                    			   				<option value="4">descr</option>
                                  </select>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">게시판 번호</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="게시판 번호" id="boardNum">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">제목</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="제목" id="title">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">내용</label>
                                <div class="col-sm-10">
                                    <textarea rows="5" cols="5" class="form-control" placeholder="내용" id="content"></textarea>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">작성자ID</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="작성자ID">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">작성자IP</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="작성자IP">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">작성일</label>
                                <div class="col-sm-5">
                                  <input type='text' class="form-control" id='datepicker'/>
                                </div>
                                <div class="col-sm-5">
                                  <input type='text' class="form-control" id='datetimepicker'/>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">URL</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="URL">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label">이미지 등록</label>
                                <div class="col-sm-10">
                                    <input type="file" class="form-control">
                                </div>
                              </div>
                            </form>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default waves-effect " data-dismiss="modal">취소</button>
                            <button type="button" class="btn btn-primary waves-effect waves-light " id="submit">등록</button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- frmModal end -->
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
  <!-- Bootstrap date-time-picker js -->
  <script type="text/javascript" src="assets/pages/advance-elements/moment-with-locales.min.js"></script>
  <script type="text/javascript" src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
  <script type="text/javascript" src="assets/pages/advance-elements/bootstrap-datetimepicker.min.js"></script>
  <!-- Morris Chart js -->
  <script src="../bower_components/raphael/raphael.min.js"></script>
  <script src="../bower_components/morris.js/morris.js"></script>
  <!-- sweet alert js -->
  <script type="text/javascript" src="../bower_components/sweetalert/dist/sweetalert.min.js"></script>
  <script type="text/javascript" src="../assets/pages/division/script.js"></script>
  <!-- i18next.min.js -->
  <script type="text/javascript" src="../bower_components/i18next/i18next.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-xhr-backend/i18nextXHRBackend.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-browser-languagedetector/i18nextBrowserLanguageDetector.min.js"></script>
  <script type="text/javascript" src="../bower_components/jquery-i18next/jquery-i18next.min.js"></script>
  <!-- Custom js -->
  <script type="text/javascript" src="../assets/js/script.js"></script>
  <script type="text/javascript" src="assets/pages/division/script2.js"></script>
  <script type="text/javascript" src="../assets/pages/picker.js"></script>
  <script src="../assets/js/pcoded.min.js"></script>
  <script src="../assets/js/demo-12.js"></script>
  <script src="../assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
  <script src="../assets/js/jquery.mousewheel.min.js"></script>
</body>

</html>
