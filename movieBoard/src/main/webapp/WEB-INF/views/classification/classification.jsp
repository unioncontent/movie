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
  <link rel="stylesheet" type="text/css" href="../assets/pages/advance-elements/css/bootstrap-datetimepicker.css">
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
                        <select name="select" class="col-md-1 form-control form-control-inverse m-b-10 p-r-5 f-left">
                          <option value="opt1">회사</option>
                        </select>
                        <select name="select" class="col-md-1 form-control form-control-inverse m-b-10 p-r-5 f-left select-left" id="selectKeyword">
                          <option>키워드</option>
                          <option value="택시">택시</option>
                          <option value="강철비">강철비</option>
                          <option value="살인자">살인자</option>
                        </select>
                        <select name="select" class="col-md-1 form-control form-control-inverse m-r-10 m-b-10 p-r-5 f-left select-left">
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
                            <select id= "selectPerPageNum" name="select" class="col-sm-1 form-control form-control-inverse m-r-10 m-b-10 p-r-5 f-left list-select">
                                  <option id= "40" >40</option>
                                  <option id = "80">80</option>
                                  <option id = "160">120</option>
                                  <option id = "200">200</option>
                                </select>
                                <select id = "selectSearchType" name="select" class="col-sm-1 form-control form-control-inverse m-r-10 m-b-10 f-left search-select">
                                  <option id="t" value="t">제목</option>
                                  <option id="c" value="c">게시글</option>
                                </select>
                                <div class="col-sm-3 input-group input-group-button input-group-inverse p-l-0 p-r-0 m-b-10 f-left btn-select">
                                  <input id="keywordInput" type="text" class="form-control" placeholder="">
                                  <span class="input-group-addon" id="basic-addon1">
                                    <button id="searchBtn" class=" btn btn-inverse">검색</button>
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
                                    <th width="5%">No</th>
                                    <th width="10%">페이지 분류<span class="text-muted"></span></th>
                                    <th width="10%">페이지 명</th>
                                    <th width="10%">회사명</th>
                                    <th><span class="text-muted">키워드</span></th>
                                    <th width="20%">제목 &<span class="text-muted"></span><span class="text-success"> 컨텐츠</span></th>
                                    <th width="10%">추출일 / 작성일</th>
                                    <th width="10%">분류변경</th>
                                    <th width="5%">분류처리</th>
                                  </tr>
                                </thead>
                                <tbody>

                                  <c:forEach items="${classiList}" var="extractVO" varStatus="index">
                                  <tr class = "trList">
                                    <c:if test="${extractVO.sns_idx != null}">
                                      <input type="hidden" value="${extractVO.sns_idx}">
                                    </c:if>
                                    <c:if test="${extractVO.community_idx != null}">
                                      <input type="hidden" value="${extractVO.community_idx}">
                                    </c:if>
                                    <c:if test="${extractVO.media_idx != null}">
                                      <input type="hidden" value="${extractVO.media_idx}">
                                    </c:if>
                                    <c:if test="${extractVO.portal_idx != null}">
                                      <input type="hidden" value="${extractVO.portal_idx}">
                                    </c:if>
                                    <th scope="row">
                                      ${index.count}
                                    </th>
                                    <td>${extractVO.domain}<span class="text-muted"></span></td>
                                    <td>${extractVO.domainType}</td>
                                    <td>${extractVO.company}<span class="text-muted"></span></td>
                                    <td>${extractVO.keyword}<span class="text-muted"></span></td>
                                    <td>
                                      <a href="${extractVO.url}" target="_blank">
                                        <div class="nobr">${extractVO.title}</div>
                                      </a>
                                      <span class="text-muted"></span>
                                      <span class="text-success">${extractVO.content}</span>
                                    </td>
                                    <td>${extractVO.createDate} /<br/>${extractVO.writeDate }</td>
                                    <td>
                                      <div class="radios${index.count}">
                                        <c:choose>
                                        	<c:when test="${extractVO.textType eq '좋은글'}">
                                        	<input type="radio" id="radio1${index.count}" name="radios${index.count}" checked>
                                        	<label for="radio1${index.count}">좋은글</label>
                                        	<input type="radio" id="radio2${index.count}" name="radios${index.count}">
                                        	<label for="radio2${index.count}">나쁜글</label>
                                        	<input type="radio" id="radio3${index.count}" name="radios${index.count}">
                                        	<label for="radio3${index.count}">관심글</label><br>
                                        	<input type="radio" id="radio4${index.count}" name="radios${index.count}">
                                        	<label for="radio4${index.count}">기타글</label>
                                        	<input type="radio" id="radio5${index.count}" name="radios${index.count}">
                                        	<label for="radio5${index.count}">삭제글</label>
                                        	</c:when>
                                        </c:choose>

                                        <c:choose>
                                        	<c:when test="${extractVO.textType eq '나쁜글'}">
                                        	<input type="radio" id="radio1${index.count}" name="radios${index.count}">
                                        	<label for="radio1${index.count}">좋은글</label>
                                        	<input type="radio" id="radio2${index.count}" name="radios${index.count}" checked>
                                        	<label for="radio2${index.count}">나쁜글</label>
                                        	<input type="radio" id="radio3${index.count}" name="radios${index.count}">
                                        	<label for="radio3${index.count}">관심글</label><br>
                                        	<input type="radio" id="radio4${index.count}" name="radios${index.count}">
                                        	<label for="radio4${index.count}">기타글</label>
                                        	<input type="radio" id="radio5${index.count}" name="radios${index.count}">
                                        	<label for="radio5${index.count}">삭제글</label>
                                        	</c:when>
                                        </c:choose>

                                        <c:choose>
                                        	<c:when test="${extractVO.textType eq '관심글'}">
                                        	<input type="radio" id="radio1${index.count}" name="radios${index.count}">
                                        	<label for="radio1${index.count}">좋은글</label>
                                        	<input type="radio" id="radio2${index.count}" name="radios${index.count}">
                                        	<label for="radio2${index.count}">나쁜글</label>
                                        	<input type="radio" id="radio3${index.count}" name="radios${index.count}" checked>
                                        	<label for="radio3${index.count}">관심글</label><br>
                                        	<input type="radio" id="radio4${index.count}" name="radios${index.count}">
                                        	<label for="radio4${index.count}">기타글</label>
                                        	<input type="radio" id="radio5${index.count}" name="radios${index.count}">
                                        	<label for="radio5${index.count}">삭제글</label>
                                        	</c:when>
                                        </c:choose>

                                        <c:choose>
                                        	<c:when test="${extractVO.textType eq '기타글'}">
                                        	<input type="radio" id="radio1${index.count}" name="radios${index.count}">
                                        	<label for="radio1${index.count}">좋은글</label>
                                        	<input type="radio" id="radio2${index.count}" name="radios${index.count}">
                                        	<label for="radio2${index.count}">나쁜글</label>
                                        	<input type="radio" id="radio3${index.count}" name="radios${index.count}">
                                        	<label for="radio3${index.count}">관심글</label><br>
                                        	<input type="radio" id="radio4${index.count}" name="radios${index.count}" checked>
                                        	<label for="radio4${index.count}">기타글</label>
                                        	<input type="radio" id="radio5${index.count}" name="radios${index.count}">
                                        	<label for="radio5${index.count}">삭제글</label>
                                        	</c:when>
                                        </c:choose>

                                        <c:choose>
                                        	<c:when test="${extractVO.textType eq '삭제글'}">
                                        	<input type="radio" id="radio1${index.count}" name="radios${index.count}">
                                        	<label for="radio1${index.count}">좋은글</label>
                                        	<input type="radio" id="radio2${index.count}" name="radios${index.count}">
                                        	<label for="radio2${index.count}">나쁜글</label>
                                        	<input type="radio" id="radio3${index.count}" name="radios${index.count}">
                                        	<label for="radio3${index.count}">관심글</label><br>
                                        	<input type="radio" id="radio4${index.count}" name="radios${index.count}">
                                        	<label for="radio4${index.count}">기타글</label>
                                        	<input type="radio" id="radio5${index.count}" name="radios${index.count}" checked>
                                        	<label for="radio5${index.count}">삭제글</label>
                                        	</c:when>
                                        </c:choose>

                                      </div>
                                    </td>
                                    <td>
                                      <button class="btn btn-danger btn-sm alert-confirm1" data-toggle="tooltip" data-placement="top" data-original-title="삭제"><i class="icofont icofont-ui-delete" style="margin-right:0"></i></button>
                                      <button class="btn btn-primary btn-sm alert-confirm2" data-toggle="tooltip" data-placement="top" data-original-title="즉시처리"><i class="icofont icofont-ui-check" style="margin-right:0"></i></button>
                                    </td>
                                  </tr>
                                  </c:forEach>
                                </tbody>
                              </table>
                            </div>
                            <ul class="pagination float-right">
                              <c:if test="${pageMaker.prev}">
                                <li class="page-item">
                                  <a class="page-link" href="extract${pageMaker.makeSearch(pageMaker.startPage - 1) }" aria-label="Previous">&laquo;
                                    <span aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                  </a>
                                </li>
                              </c:if>

                              <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                                <li class= "${pageMaker.cri.page == idx? 'active':''} page-item">
                                  <a class="page-link" href="classification${pageMaker.makeSearch(idx)}">${idx}</a>
                                </li>
                              </c:forEach>

                              <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                <li class="page-item">
                                  <a class="page-link" href="extract${pageMaker.makeSearch(pageMaker.endPage +1) }" aria-label="Next">&raquo;
                                    <span aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                  </a>
                                </li>
                              </c:if>
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
  <script type="text/javascript" src="../assets/pages/advance-elements/moment-with-locales.min.js"></script>
  <script type="text/javascript" src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
  <script type="text/javascript" src="../assets/pages/advance-elements/bootstrap-datetimepicker.min.js"></script>
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
  <script type="text/javascript" src="../assets/pages/division/script2.js"></script>
  <script type="text/javascript" src="../assets/pages/picker.js"></script>
  <script src="../assets/js/pcoded.min.js"></script>
  <script src="../assets/js/demo-12.js"></script>
  <script src="../assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
  <script src="../assets/js/jquery.mousewheel.min.js"></script>
</body>


<script type="text/javascript">
	$(document).ready(function(){

		// content 길시에 ...으로 변경
		var $content = $(".text-success");

		var size = 25;

		for (var i =1; i < $content.length; i++){
			if($content[i].innerText.length >= size){
				$content[i].textContent = $content[i].innerText.substr(0, size) + '...';
			}
		}

		var selectOption = decodeURI(window.location.href.split("selectKey=")[1]);
		console.log(selectOption);



		var $selectKeyword = $('#selectKeyword');

		if(selectOption != 'undefined'){
			for(var i = 0; i < $selectKeyword[0].length; i++ ){
				if($selectKeyword[0][i].value == selectOption){
					$selectKeyword[0][i].selected = 'selected';
				}
			}
		}
		$selectKeyword[0][0].disabled = true;

		// 키워드 선택시
		$selectKeyword.change(function(){
			console.log("selectKeyword clicked....");
			console.log($('#selectKeyword option:selected').val());

			searchList();
		});


		//엑셀출력 확인메시지
		$(document).on("click",".alert-excel",function(){
	    swal({
	          title: "엑셀출력 하시겠습니까?",
	          text: "현재 리스트가 엑셀출력 됩니다.",
	          type: "warning",
	          showCancelButton: true,
	          confirmButtonClass: "btn-danger",
	          confirmButtonText: "YES",
	          closeOnConfirm: false
	        },
	        function(){//엑셀 출력하겠다고 할 시 진행 함수

	        	$.ajax({
					  type: "GET",
					  url: "excel",
					  data: {success : "success"},
					  dataType : "text",
					  success : function(){
						  //swal("Success!", "엑셀출력 되었습니다.", "success");
					  	self.location = "excel";
					  }
					});


	        });
		});


		// 검색버튼 클릭시
		$('#searchBtn').on("click", function(event){
		  console.log("searchBtn clicked....");
		  console.log($('#selectSearchType option:selected').val());

		  if($('#keywordInput').val() == ''){
			alert("검색어를 입력해주세요.");
		  }else{
			searchList();
		  }
		});


	}); // end ready...

	function searchList(event) {

		var makeQeury = '${pageMaker.makeQuery(1)}'.slice(0, -2);

		self.location = "classification" + makeQeury
				+ $('#selectPerPageNum option:selected').val() + "&searchType="
				+ $("#selectSearchType option:selected").val() + "&keyword="
				+ $('#keywordInput').val() + "&selectKey="
				+ $('#selectKeyword option:selected').val();
	}

</script>

</html>
