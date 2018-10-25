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
  <!-- Menu-Search css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/menu-search/css/component.css">
  <!-- sweet alert framework -->
  <link rel="stylesheet" type="text/css" href="../bower_components/sweetalert/dist/sweetalert.css">
  <!-- animation nifty modal window effects css -->
  <link rel="stylesheet" type="text/css" href="../assets/css/component.css">
  <!-- Horizontal-Timeline css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/dashboard/horizontal-timeline/css/style.css">
  <!-- font awesome -->
  <link rel="stylesheet" type="text/css" href="../assets/icon/font-awesome/css/font-awesome.css">
  <!-- Date-range picker css  -->
  <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- Style.css -->
  <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/pages/news/css/style.css">
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
                      <h4>언론사 기사글 관리</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="../dashBoard/dashBoard_main">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">언론사관리</a></li>
                        <li class="breadcrumb-item"><a href="#!">언론사 기사글 관리</a></li>
                      </ul>
                    </div>
                  </div>
                  <!-- Page-body start -->
                  <div class="page-body">
                    <div class="row">
                      <div class="col-md-7">
                        <select name="select" class="col-md-1 form-control form-control-inverse m-b-10 m-l-0 f-left select-left" id="selectKeyword">
                          <option>키워드</option>
                          <c:if test="${modelKeywordList == null}" >
                          	<c:forEach items="${keywordList}" var = "keywordList">
                          <option value="${keywordList.keyword_main}">${keywordList.keyword_main}</option>
                          </c:forEach>
                          </c:if>
                          <c:if test="${modelKeywordList != null}">
                          	<c:forEach items="${modelKeywordList}" var = "keywordList">
                          <option value="${keywordList.keyword_main}">${keywordList.keyword_main}</option>
                          </c:forEach>
                          </c:if>
                        </select>
                        <select id= "selectPerPageNum" name="select" class="col-md-1 form-control form-control-inverse m-b-10 p-r-5 f-left select-left">	
	                        <option value="30">리스트</option>
	                        <option id= "10" >10</option>
	                        <option id= "30" >30</option>
	                        <option id = "60">60</option>
	                        <option id = "120">90</option>
                        </select>
                        <select id= "selectMediaMain" name="select" class="col-md-1 form-control form-control-inverse m-r-10 m-b-10 p-r-5 f-left select-left">	
	                        <option value="0">매체</option>
	                        <option value= "1" >주요</option>
	                        <option value= "0" >전체</option>
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
                            <input type="text" id="fromDate" class="form-control form-control-inverse" value="" style="text-align: center;">
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
                        <!-- tab header end -->
                        <!-- tab-content start -->
                         <div class="tab-content">
                          <!-- tab1 main start -->
                          <div class="tab-pane fade show active" id="main" role="tabpanel">
                            <div class="row">
                              <!-- top cards end -->
                      <!-- list table card start -->
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            <select id = "selectSearchType" name="select" class="col-sm-1 form-control form-control-inverse m-r-5 m-b-5 m-t-5 f-left search-select" style="height:40px;">
							  <option id="r" value="r">기자명</option>
                              <option id="m" value="m">언론사명</option>
                            </select>
                            <div class="col-sm-2 input-group input-group-button input-group-inverse p-l-0 p-r-0 m-r-5 m-b-5 m-t-5 f-left btn-select">
                               <input onkeyup="if(event.keyCode == 13){$('#searchBtn').trigger('click');};"id="keywordInput" type="text" class="form-control" placeholder="" style="height:40px;">
                              <span class="input-group-addon" id="basic-addon1">
                                <button id="searchBtn" class="btn btn-search"><i class="icofont icofont-ui-search"></i></button>
                              </span>
                            </div>
                            <button class="btn btn-warning alert-confirm f-right p-r-5 p-l-5 m-l-15 m-b-5  m-t-5" style="height:40px;"><i class="icofont icofont-download-alt"></i>EXCEL</button>
                            <c:if test="${user.user_name == 'union'}">
                            <button id="alert-check" class="btn btn-list alert-check f-right p-r-5 p-l-5 m-l-15 m-b-5  m-t-5" style="height:40px;"><i class="icofont icofont-ui-check"></i>등록</button>
                            </c:if>
                            <!-- <input type="submit" value="등록" class="btn btn-primary alert-check f-right p-r-5 p-l-5 m-l-15 m-b-10" onclick="show()"> -->
                            <!-- <button id="insertAllBtn" type="button" class="alert-success-msg btn btn-success waves-effect f-right p-r-5 p-l-5 m-l-15 m-b-10"><i class="icofont icofont-check-circled"></i>선택처리</button> -->
                          </div>
                          <div class="card-block table-border-style">
                            		<div class="table-responsive">
                              <table class="table table-bordered table-sm" style="vertical-align:middle;">
                              <c:if test="${empty mediaList}">
					          <tbody>
						          <tr>
						          	<td style="vertical-align:middle;" align="center" height="150px"><h5>등록된 기사가 없습니다.</h5></td>
						          </tr>
					          </tbody>
					          </c:if>
					          <c:if test="${!empty mediaList}">
                                <thead>
                                  <tr>
                                  <c:if test="${user.user_name == 'union'}">
                                  	<th width="1%">
                                  	<div class="border-checkbox-section">
			                          <div class="border-checkbox-group border-checkbox-group-default">
                                  		<input type="checkbox" name="ck" id="checkall" class="border-checkbox news-checkbox">
                                  		<label class="border-checkbox-label" for="checkall"></label>
                                  	  </div>
                                  	</div>
                                  	</th>
                                  </c:if>
                                    <th width="5%">NO</th>
                                    <th width="10%">등록날짜</th>
                                    <th width="40%">제목</th>
                                    <th width="5%">출처</th>
                                    <th width="5%">언론사</th>
                                    <th width="5%">기자</th>
                                    <th width="5%">키워드</th>
                                    <th width="5%">분류글</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <c:forEach items="${mediaList}" var="mediaList" varStatus="index">
                                  <tr class = "trList">
                                    <input type="hidden" value="${mediaList.media_idx}" name="media_idx">
                                    <c:if test="${user.user_name == 'union'}">
                                    <td>
                                    <div class="border-checkbox-section">
			                          <div class="border-checkbox-group border-checkbox-group-default">
			                            <c:if test="${mediaList.media_state == 1}">
		                                    <input type="checkbox" name="ck" id="checkbox${index.count}" class="border-checkbox news-checkbox" value="${mediaList.media_idx}" checked="checked">
		                                </c:if>
		                                <c:if test="${mediaList.media_state == null || mediaList.media_state == 0}">
		                                    <input type="checkbox" name="ck" id="checkbox${index.count}" class="border-checkbox news-checkbox" value="${mediaList.media_idx}">
	                                    </c:if>
			                            <label class="border-checkbox-label" for="checkbox${index.count}"></label>
			                          </div>
			                        </div>
                                    </td>
                                    </c:if>
                                    <th width="5%" style="vertical-align:middle;">${totalCount -index.count +1 -minusCount}</th>
                                    <td width="10%">${mediaList.writeDate}</td>
                                    <td width="40%" class="text-success">
                                    	<%-- <c:if test="${mediaList.media_main == 1}">
		                                    <i class="icofont icofont-tick-mark"></i>&nbsp;
	                                    </c:if> --%>
	                                    <c:if test="${mediaList.media_main == 1}">
		                                    <i class="icofont icofont-favourite"></i>&nbsp;
	                                    </c:if>
                                    	<a href="${mediaList.url}" target="_blank">${mediaList.media_title}</a>
                                    </td>
                                    <td width="5%">
                                    <c:if test="${mediaList.media_subname != null}">${mediaList.media_subname}</c:if>
                                    <c:if test="${mediaList.media_subname == null}"><i class="icofont icofont-minus"></i></c:if>
                                    </td>
                                    <td width="5%">${mediaList.media_name}</td>
                                    <td width="5%" style="text-align: center;">
                                    <c:if test="${mediaList.reporter_name != null}">${mediaList.reporter_name}</c:if>
                                    <c:if test="${mediaList.reporter_name == null}"><i class="icofont icofont-minus"></i></c:if>
                                    </td>
                                    <td width="5%">${mediaList.keyword}</td>
                                   	<td width="5%" style="text-align: center;">
                                   	<c:if test="${mediaList.textType != null}">${mediaList.textType}</c:if>
                                    <c:if test="${mediaList.textType == null}"><i class="icofont icofont-minus"></i></c:if>
                                   	<%-- <div class="radios${index.count}">
                                        <c:choose>
                                        	<c:when test="${mediaList.textType eq '좋은글'}">
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
                                        	<input type="radio" id="radio6${index.count}" name="radios${index.count}">
                                        	<label for="radio6${index.count}">미분류</label>
                                        	</c:when>
                                        </c:choose>

                                        <c:choose>
                                        	<c:when test="${mediaList.textType eq '나쁜글'}">
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
                                        	<input type="radio" id="radio6${index.count}" name="radios${index.count}">
                                        	<label for="radio6${index.count}">미분류</label>
                                        	</c:when>
                                        </c:choose>

                                        <c:choose>
                                        	<c:when test="${mediaList.textType eq '관심글'}">
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
                                        	<input type="radio" id="radio6${index.count}" name="radios${index.count}">
                                        	<label for="radio6${index.count}">미분류</label>
                                        	</c:when>
                                        </c:choose>

                                        <c:choose>
                                        	<c:when test="${mediaList.textType eq '기타글'}">
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
                                        	<input type="radio" id="radio6${index.count}" name="radios${index.count}">
                                        	<label for="radio6${index.count}">미분류</label>
                                        	</c:when>
                                        </c:choose>

                                        <c:choose>
                                        	<c:when test="${mediaList.textType eq '삭제글'}">
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
                    											<input type="radio" id="radio6${index.count}" name="radios${index.count}">
                                        	<label for="radio6${index.count}">미분류</label>
                                        	</c:when>
                                        </c:choose>


                                        <c:choose>
                                        	<c:when test="${mediaList.textType eq null}">
                                        	<input type="radio" id="radio1${index.count}" name="radios${index.count}">
                                        	<label for="radio1${index.count}">좋은글</label>
                                        	<input type="radio" id="radio2${index.count}" name="radios${index.count}">
                                        	<label for="radio2${index.count}">나쁜글</label>
                                        	<input type="radio" id="radio3${index.count}" name="radios${index.count}">
                                        	<label for="radio3${index.count}">관심글</label><br>
                                        	<input type="radio" id="radio4${index.count}" name="radios${index.count}">
                                        	<label for="radio4${index.count}">기타글</label>
                                        	<input type="radio" id="radio5${index.count}" name="radios${index.count}">
                                        	<label for="radio5${index.count}">삭제글</label>
                    											<input type="radio" id="radio6${index.count}" name="radios${index.count}" checked>
                                        	<label for="radio6${index.count}">미분류</label>
                                        	</c:when>
                                        </c:choose>

                                      </div> --%></td>
                                  </tr>
                                  </c:forEach>
                                </tbody>
                                <tfoot>
                                  <tr>
                                  <c:if test="${user.user_name != 'union'}">
                                    <td colspan="8">
                                  </c:if>
                                  <c:if test="${user.user_name == 'union'}">
                                    <td colspan="9">
                                  </c:if> 
                                      <ul class="pagination float-right">
                                       <c:if test="${pageMaker.prev}">
                                         <li class="page-item">
                                           <a class="page-link" href="news${pageMaker.makeSearch(pageMaker.startPage - 1) }" aria-label="Previous">&laquo;
                                             <span aria-hidden="true"></span>
                                             <span class="sr-only">Previous</span>
                                           </a>
                                         </li>
                                       </c:if>

                                       <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                                         <li class= "${pageMaker.cri.page == idx? 'active':''} page-item">
                                           <a class="page-link" href="news${pageMaker.makeSearch(idx)}">${idx}</a>
                                         </li>
                                       </c:forEach>

                                       <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                         <li class="page-item">
                                           <a class="page-link" href="news${pageMaker.makeSearch(pageMaker.endPage +1) }" aria-label="Next">&raquo;
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
                             </div></div></div>
                      </div></div></div></div>
                      </div>
                      <!-- list table card end -->
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
  <!-- Bootstrap date-time-picker js -->
  <script type="text/javascript" src="../assets/pages/advance-elements/moment-with-locales.min.js"></script>
  <!-- Date-range picker js -->
  <script type="text/javascript" src="../bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
  <!-- modernizr js -->
  <script type="text/javascript" src="../bower_components/modernizr/modernizr.js"></script>
  <script type="text/javascript" src="../bower_components/modernizr/feature-detects/css-scrollbars.js"></script>
  <!-- classie js -->
  <script type="text/javascript" src="../bower_components/classie/classie.js"></script>
  <!-- Morris Chart js -->
  <script src="../bower_components/raphael/raphael.min.js"></script>
  <script src="../bower_components/morris.js/morris.js"></script>
  <!-- sweet alert js -->
  <script type="text/javascript" src="../bower_components/sweetalert/dist/sweetalert.min.js"></script>
  <script type="text/javascript" src="../assets/pages/news/script.js"></script>
  <!-- i18next.min.js -->
  <script type="text/javascript" src="../bower_components/i18next/i18next.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-xhr-backend/i18nextXHRBackend.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-browser-languagedetector/i18nextBrowserLanguageDetector.min.js"></script>
  <script type="text/javascript" src="../bower_components/jquery-i18next/jquery-i18next.min.js"></script>
  <!-- Custom js -->
  <script type="text/javascript" src="../assets/js/script.js"></script>
  <script src="../assets/pages/picker.js"></script>
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

		var startDateOption = decodeURI(window.location.href.split("startDate=")[1]).split("&")[0].split(" ")[0];
		var endDateOption = decodeURI(window.location.href.split("endDate=")[1]).split("&")[0].split(" ")[0];
		console.log("startDateOption: " + startDateOption);
		console.log("endDateOption: " + endDateOption);

		if(startDateOption != 'undefined' && endDateOption != 'undefined'
				&& startDateOption != '' && endDateOption != ''){
			$("#fromDate").val(startDateOption + " - " + endDateOption);
		}


		var keywordOption = decodeURI(window.location.href.split("selectKey=")[1]).split("&searchType")[0].split("&startDate")[0];
		console.log("keywordOption: " + keywordOption);
		console.log(decodeURI(window.location.href.split("&selectKey=")[1]));



		var $selectKeyword = $('#selectKeyword');

		if(keywordOption != 'undefined'){
			for(var i = 0; i < $selectKeyword[0].length; i++ ){
				if($selectKeyword[0][i].value == keywordOption){
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
		
		var ListOption = decodeURI(window.location.href.split("PerPageNum=")[1]).split("&")[0];

		var $selectPerPageNum = $('#selectPerPageNum');
		
		$selectPerPageNum[0][0].disabled = true;
		
		// 글 수 변경 선택시
		$selectPerPageNum.change(function(){
			console.log("selectPerPageNum clicked....");
			console.log($("#selectPerPageNum option:selected").val());

			searchList();

		});
		
		var mediaMainOption = decodeURI(window.location.href.split("mediaMain=")[1]).split("&")[0];
		
		var $selectMediaMain = $('#selectMediaMain');

		if(mediaMainOption != 'undefined'){
			for(var i = 0; i < $selectMediaMain[0].length; i++ ){
				if($selectMediaMain[0][i].value == mediaMainOption){
					$selectMediaMain[0][i].selected = 'selected';
				}
			}
		}
		$selectMediaMain[0][0].disabled = true;


		// 미디아메인 선택시
		$selectMediaMain.change(function(){
			console.log("selectMediaMain clicked....");
			console.log($('#selectMediaMain option:selected').val());

			searchList();

		});


	  // 일괄처리버튼 클릭시
	  $(document).on("click","#insertAllBtn",function(){
		  console.log("insertAll click...");
		insertAll();
	  });
	  
	/* // 등록처리버튼 클릭시
	  $(document).on("click","#alert-check",function(){
		  console.log("checkList click...");
		checkList();
	  }); */


		// 당일 클릭시
		$('#toDay').on("click", function(){
		  console.log("toDay clicked....");
		  var date = getDate("toDay");
		  var startDate = date.startDate;
		  var endDate = date.endDate;

		  $("#fromDate").val(endDate + " - " + endDate)
		  console.log($("#fromDate").val());
		  searchList();
		});

		// 전일 클릭시
		$('#yesterDay').on("click", function(){
		  console.log("yesterDay clicked....");
		  var date = getDate("yesterDay");
		  var startDate = date.startDate;
		  var endDate = date.endDate;

		  $("#fromDate").val(startDate + " - " + endDate)
		  console.log($("#fromDate").val());
		  searchList();
		});

		// 7일  클릭시
		$('#week').on("click", function(){
		  console.log("week clicked....");
		  var date = getDate("week");
		  var startDate = date.startDate;
		  var endDate = date.endDate;

		  $("#fromDate").val(startDate + " - " + endDate)
		  console.log($("#fromDate").val());
		  searchList();
		})

		// 30일 클릭시
		$('#month').on("click", function(){
		  console.log("month clicked....");
		  var date = getDate("month");
		  var startDate = date.startDate;
		  var endDate = date.endDate;

		  $("#fromDate").val(startDate + " - " + endDate)
		  console.log($("#fromDate").val());

		  searchList();

		})

		// content 길시에 ...으로 변경
		var $content = $(".text-success").children();

		var size = 25;

		for (var i =1; i < $content.length; i++){
			if($content[i].innerText.length >= size){
				$content[i].textContent = $content[i].innerText.substr(0, size) + '...';
			}
		}


		//캘린더 클릭시..
		$('#fromDate').on('apply.daterangepicker', function(ev, picker) {
			   var startDate = picker.startDate.format('YYYY-MM-DD');
			   var endDate = picker.endDate.format('YYYY-MM-DD');

			   console.log("startDate: " + startDate);
			   console.log("endDate: " + endDate);

			   searchList();
		});
		
		//최상단 체크박스 클릭
	    $("#checkall").click(function(){
	        //클릭되었으면
	        if($("#checkall").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=ck]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=ck]").prop("checked",false);
	        }
		 })

		// 검색버튼 클릭시
		$('#searchBtn').on("click", function(event){
		  console.log("searchBtn clicked....");
		  console.log($('#selectSearchType option:selected').val());

		  if($('#keywordInput').val() == ''){
			  swal("warning!", "검색어를 입력해주세요.", "warning");
		  }else{
			searchList();
		  }
		});
		
		var idx = $('input[name=media_idx]').val();
		
		//등록 확인메시지
		$(document).on("click",".alert-check",function(){
			swal({
				title: "등록 처리 하시겠습니까?",
				text: "바로 등록 됩니다.",
				type: "warning",
				showCancelButton: true,
				confirmButtonClass: "btn-danger",
				confirmButtonText: "YES",
				closeOnConfirm: false
				},
					function(){

						checkList(event);

						swal("Update!", "등록 처리가 완료되었습니다.", "success");

						location.reload();
					});
	  });
		
		//엑셀출력 확인메시지
		$(document).on("click",".alert-confirm",function(){
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

	        	self.location = "excel?"+ "searchType=" + decodeURI(window.location.href.split("&searchType=")[1]).split("&")[0]
					 	+ "&keyword=" + decodeURI(window.location.href.split("&keyword=")[1]).split("&")[0]
			        	+ "&selectKey=" + $('#selectKeyword option:selected').val()
			        	+ "&searchType=" + $("#selectSearchType option:selected").val()
			        	+ "&mediaMain=" + $('#selectMediaMain option:selected').val()
						+ "&startDate=" + makeDateFormat($("#fromDate").val(), 0)
						+ "&endDate=" +  makeDateFormat($("#fromDate").val(), 1)


		  		swal("Success!", "엑셀출력 되었습니다.", "success");


	        });
		});

	}); // end ready...
	
	function checkList(event) {
		  
		
		  $("input[name='ck']:checked").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
			  $.ajax({
					type : "POST",
					url : "checkList",
					data : {idx : $(this).val()},
					contentType:"application/x-www-form-urlencoded;charset=utf-8", //한글 깨짐 방지
					cache: false, 
					success : function(data) {
					console.log(data);
					}

				});
			  
		  });
			  $("input[name='ck']").each(function(i,e){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
					if($(e).is(':checked') != true){
					  $.ajax({
							type : "POST",
							url : "uncheckList",
							data : {idx : $(e).val()},
							contentType:"application/x-www-form-urlencoded;charset=utf-8", //한글 깨짐 방지
							cache: false, 
							success : function(data) {
							console.log(data);
							}

						});
						}
				  });
				/* } */
			}
			  /* $("input[name='ck']:unchecked").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
				  $.ajax({
						type : "POST",
						url : "uncheckList",
						data : {idx : $(this).val()},
						contentType:"application/x-www-form-urlencoded;charset=utf-8", //한글 깨짐 방지
						cache: false, 
						success : function(data) {
						console.log(data);
						}

					});
				  
			  }); */

		
		  
		/* }else{
			$("input[name='ck']").each(function(i,e){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
				if($(e).is(':checked') != true){
				  $.ajax({
						type : "POST",
						url : "uncheckList",
						data : {idx : $(e).val()},
						contentType:"application/x-www-form-urlencoded;charset=utf-8", //한글 깨짐 방지
						cache: false, 
						success : function(data) {
						console.log(data);
						}

					});
				};
			  });

		} */
		  
		  
		  /* $("input[name='ck']").each(function(i,e){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
			  if($(e).is(':checked') != true){
			  				 console.log($(e).val())
			  }
			  			  }); */
			  
	function insertAll(){
		  swal({
				title: "일괄처리 하시겠습니까?",
				text: "선택한 분류들로 일괄처리 됩니다.",
				type: "warning",
				showCancelButton: true,
				confirmButtonClass: "btn-danger",
				confirmButtonText: "YES",
				closeOnConfirm: false
			},
			function(){

				var tr = $(".trList");

				var arr = [];

				for(var i = 0; i < tr.length; i++){
					console.log(tr[i]);
					var idx = tr[i].children[0].value;
					var table = tr[i].children[2].innerText;
					var arr = tr[i].children[7].children[0].children;
					console.log(arr);

					for (var l = 0; l < arr.length; l++) {
						if (arr[l].type == "radio") {

							if (arr[l].checked) {
								var textType = arr[l + 1].innerText;

								break;
							}
						}
					}

					console.log("type: " + textType);
					if(textType != '미분류'){
						$.ajax({
							  type: "POST",
							  url: "newsInsert",
							  data: {idx : idx, textType : textType},
							  dataType: "text",
							  success: function(data){
								  console.log(data);
							  }

							});
					}

				}


				swal("Success!", "일괄처리가 완료되었습니다.", "success");

				//location.reload();
			});
	  }


	  function makeDateFormat(date, index){
			var splitDate = date.split(" - ")[index];
				if(splitDate != undefined){
					var returnDate = splitDate.replace("/", "-").replace("/", "-")
					return returnDate;
				}


		}
		makeDateFormat($("#fromDate").val());

	  function searchList(event) {

			var makeQeury = '${pageMaker.makeQuery(1)}'.slice(0, -2);

			self.location = "news" + makeQeury
							+ $('#selectPerPageNum option:selected').val()
							+ "&selectKey=" + $('#selectKeyword option:selected').val()
							+ "&searchType=" + $("#selectSearchType option:selected").val()
							+ "&mediaMain=" + $('#selectMediaMain option:selected').val()
							+ "&keyword=" + $('#keywordInput').val()
	    					+ "&startDate=" + makeDateFormat($("#fromDate").val(), 0)
	    					+ "&endDate=" +  makeDateFormat($("#fromDate").val(), 1)
		}

	//날짜 계산 함수
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
	   		
	   		if(calcDate == 0){
	   			calcDate = 12;
	   			year -= 1;
	   		}
	   		
	   		startDate = year + "-" + calcDate + "-" + day;

	   	}else if(type == "week"){
	   		var calcDate = day-7;
	   		if(calcDate < 0){
	   			var lastDay = (new Date(year, month-1, 0)).getDate();
	   			calcDate += lastDay;
	   			month -= 1;
	   		}
	   		startDate = year + "-" + month + "-" + calcDate;

	   	}else if(type =='toDay'){
	   		startDate = endDate

	   	}

	   	return {
	   		startDate : startDate,
	   		endDate : endDate
	   	}

	  }

</script>

</html>
