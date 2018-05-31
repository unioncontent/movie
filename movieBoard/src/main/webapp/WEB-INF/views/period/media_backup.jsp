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
  <%-- <link rel="icon" href="../assets/images/favicon.ico" type="image/x-icon"> --%>
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
  <!-- sweet alert framework -->
  <link rel="stylesheet" type="text/css" href="../bower_components/sweetalert/dist/sweetalert.css">
  <!-- Horizontal-Timeline css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/dashboard/horizontal-timeline/css/style.css">
  <!-- Date-range picker css  -->
  <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- Nvd3 chart css -->
  <link rel="stylesheet" href="../bower_components/nvd3/build/nv.d3.css" type="text/css" media="all">
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
  <style type="text/css">
  .padd{
  	float: right;
  }
   .tabc{
   	font-size : 13px;
   	width: 150px;
	text-align: center;
	border-collapse: collapse;
}
.tabc th{
	text-align: center;
	background-color: #EAEAEA;
	border-bottom: 2px solid #ddd;
}
.tabc td{
	text-align: center;
	border-bottom: 2px solid #ddd;
}
  /* .modal-dialog{
  width: 100%;
  height: 80%;
  margin: 0;
  padding: 0;
}
 .modal-content{
  height: auto;
  min-width: 100%;
  min-height: 80%;
} */
  </style>
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
                          <a href="../dashBoard/dashBoard">
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
                       <c:if test="${user.user_name == 'union'}">
                         <select name="select" class="col-md-1 form-control form-control-inverse m-b-10 p-r-5 f-left" id="selectCompany">
                          <option>회사</option>
                          <c:if test="${user.user_type == 1 }">
                          <c:forEach items="${companyList}" var = "companyList">
                          <option value="${companyList.user_name}">${companyList.user_name}</option>
                          </c:forEach>
                          </c:if>
                          <c:if test="${user.user_type == 2}">
                          <option value="${companyList.user_name}">${companyList.user_name}</option>
                          </c:if>
                        </select>
						</c:if>
						
						<c:if test="${user.user_name != 'union'}">
                         <select style="display: none;" name="select" class="col-md-1 form-control form-control-inverse m-b-10 p-r-5 f-left" id="selectCompany">
                          <option>회사</option>
                          <c:if test="${user.user_type == 1 }">
                          <c:forEach items="${companyList}" var = "companyList">
                          <option value="${companyList.user_name}">${companyList.user_name}</option>
                          </c:forEach>
                          </c:if>
                          <c:if test="${user.user_type == 2}">
                          <option value="${companyList.user_name}">${companyList.user_name}</option>
                          </c:if>
                        </select>
						</c:if>

                        <select name="select" class="col-md-1 form-control form-control-inverse m-b-10 p-r-5 f-left select-left" id="selectKeyword">
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
                          <!-- tab5 news start -->
                          <div class="tab-pane fade show active" id="main" role="tabpanel">
                            <div class="row">
                              <!-- top cards start -->
                              <div class="col-md-6 col-xl-3 main-card">
                                <div class="card social-widget-card">
                                  <div class="card-block-big bg-inverse">
                                    <h3><fmt:formatNumber value="${totalCount}" groupingUsed="true"/></h3>
                                    <span class="m-t-10">전체검색</span>
                                    <i class="icofont icofont-search"></i>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6 col-xl-3 main-card">
                                <div class="card social-widget-card">
                                  <div class="card-block-big bg-info">
                                    <h3><fmt:formatNumber value="${matchCount}" groupingUsed="true"/></h3>
                                    <span class="m-t-10">매칭</span>
                                    <i class="icofont icofont-connection"></i>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6 col-xl-3 main-card">
                                <div class="card social-widget-card">
                                  <div class="card-block-big bg-news">
                                    <h3><fmt:formatNumber value="${mediaCount}" groupingUsed="true"/></h3>
                                    <span class="m-t-10">언론사</span>
                                    <i class="icofont icofont-building-alt"></i>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6 col-xl-3 main-card">
                                <div class="card social-widget-card">
                                  <div class="card-block-big bg-success">
                                    <h3><fmt:formatNumber value="${pressCount}" groupingUsed="true"/></h3>
                                    <span class="m-t-10">기자</span>
                                    <i class="icofont icofont-fountain-pen"></i>
                                  </div>
                                </div>
                              </div>
                              <!-- top cards end -->
                              <!-- 언론사,기자 통계 start -->
                              <div class="col-md-6">
                                <div class="card">
                                  <div class="card-header">
                                    <h5>언론사 통계</h5>
                                    <div class="card-header-right">
                                      <i class="icofont icofont-rounded-down"></i>
                                    </div>
                                  </div>
                                  <div class="card-block table-border-style">
                                    <!-- sns table start -->
                                    <div class="table-border-style" id="newsMore">
                                        <div class="table-responsive">
                                          <table class="table table-styling">
                                            <thead>
                                                <tr class="table-inverse">
                                                    <th>순위</th>
                                                    <th>언론사</th>
                                                    <th>
                                                      전체기사건수
                                                      <span class="sort">
                                                        <i class="icofont icofont-long-arrow-up"></i>
                                                        <i class="icofont icofont-long-arrow-down"></i>
                                                      </span>
                                                    </th>
                                                    <th>
                                                      매칭기사
                                                      <span class="sort">
                                                        <i class="icofont icofont-long-arrow-up"></i>
                                                        <i class="icofont icofont-long-arrow-down"></i>
                                                      </span>
                                                    </th>
                                                    <th>매칭비율</th>
                                                </tr>
                                            </thead>
                                            <tbody id="news-ranking">
                                              <c:forEach items="${mediaList}" var="mediaList" varStatus="index">
                                              <tr>
                                                <th scope="row">${index.count}</th>
                                                <td class='news' onclick='showModal("#news-Modal", "${mediaList.media}")'>${mediaList.media}</td>
                                                <td><fmt:formatNumber value="${mediaList.allCount}" groupingUsed="true"/></td>
                                                <td><fmt:formatNumber value="${mediaList.searchCount}" groupingUsed="true"/></td>
                                              </tr>
                                              </c:forEach>
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
                                    <h5>기자 통계</h5>
                                    <div class="card-header-right">
                                      <i class="icofont icofont-rounded-down"></i>
                                    </div>
                                  </div>
                                  <div class="card-block table-border-style">
                                    <!-- news table start -->
                                    <div class="table-border-style" id="pressMore">
                                      <div class="table-responsive">
                                        <table class="table table-styling">
                                          <thead>
                                            <tr class="table-inverse">
                                              <th>순위</th>
                                              <th>기자</th>
                                              <th>언론사</th>
                                              <th>
                                                전체기사건수
                                                <span class="sort">
                                                  <i class="icofont icofont-long-arrow-up"></i>
                                                  <i class="icofont icofont-long-arrow-down"></i>
                                                </span>
                                              </th>
                                              <th>
                                                매칭기사
                                                <span class="sort">
                                                  <i class="icofont icofont-long-arrow-up"></i>
                                                  <i class="icofont icofont-long-arrow-down"></i>
                                                </span>
                                              </th>
                                              <th>매칭비율</th>
                                            </tr>
                                          </thead>
                                          <tbody id="press-ranking">
                                            <c:forEach items="${pressList}" var="pressList" varStatus="index">
                                              <tr>
                                                <th scope="row">${index.count}</th>
                                                <td class='press' onclick='showModal("#press-Modal", "${pressList.reporter}")'>${pressList.reporter}</td>
                                                <td>${pressList.media}</td>
                                                <td><fmt:formatNumber value="${pressList.allCount}" groupingUsed="true"/></td>
                                                <td><fmt:formatNumber value="${pressList.searchCount}" groupingUsed="true"/></td>
                                              </tr>
                                            </c:forEach>
                                          </tbody>
                                        </table>
                                      </div>
                                    </div>
                                    <!-- news table end -->
                                  </div>
                                </div>
                              </div>
                              <!-- 언론사,기자 end -->
                             
                              <!-- 테이블리스트 start -->
                              <div class="col-lg-12">
                                <div class="card">
                                  <div class="card-header">
                                    <h5 class="card-header-text m-b-10"> 검출데이터</h5>
                                    <table class="padd"><tr><td>
                                    <div class="btn-group f-right p-r-0">
                                   	 	
		                                <button type="button" id="allBtn1" class="radiosBtn btn btn-primary btn-outline-primary btn-sm waves-effect waves-light" onclick='showModal("#press-textType", "좋은글")'>좋은글</button>
		                                <button type="button" id="allBtn2" class="radiosBtn btn btn-primary btn-outline-primary btn-sm waves-effect waves-light" onclick='showModal("#press-textType2", "나쁜글")'>나쁜글</button>
		                                <button type="button" id="allBtn3" class="radiosBtn btn btn-primary btn-outline-primary btn-sm waves-effect waves-light" onclick='showModal("#press-textType3", "관심글")'>관심글</button>
		                                <button type="button" id="allBtn4" class="radiosBtn btn btn-primary btn-outline-primary btn-sm waves-effect waves-light" onclick='showModal("#press-textType4", "기타글")'>기타글</button>
		                            </div></td><td></td><td></td><td>
	                                <div class="btn-group f-right p-r-0">
	                                	<button class="btn btn-warning f-right alert-confirm" onclick="_gaq.push(['_trackEvent', 'example', 'try', 'alert-confirm']);"><i class="icofont icofont-download-alt"></i>EXCEL</button>
	                                	<button class="btn btn-info f-right alert-confirm" onclick = "location.href='http://localhost:8080/period/media2'"><i class="icofont icofont-ui-note"></i>목록으로</button>
	                                </div></td></tr></table>
                                  </div>
                                    <!-- list satart -->
                                    <div class="table-responsive">
                                      <table class="table">
                                        <thead>
                                            <tr>
                                              <th width="5%">NO</th>
                                              <th width="10%">등록날짜</th>
                                              <th width="10%">언론사</th>
                                              <th width="10%">기자</th>
                                              <th width="30%">제목</th>
                                              <th width="10%">키워드</th>
                                              <th width="10%">여론현황</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <c:forEach items="${searchList}" var = "mediaVO" varStatus="index">
                                          <tr>
                                            <th scope="row">${totalCountPage -index.count +1 -minusCount}</th>
                                            <td>
                                            <fmt:formatDate value="${mediaVO.updateDate}" pattern="yyyy-MM-dd kk:mm:ss"/>
                                            </td>
                                            <td>${mediaVO.media_name}</td>
                                            <td>${mediaVO.reporter_name}</td>
                                            <td><a href='${mediaVO.url}' target="_blank">${mediaVO.media_title}</a></td>
                                            <td>${mediaVO.keyword}</td>
                                            <td>${mediaVO.textType}</td>
                                          </tr>
                                          </c:forEach>
                                        </tbody>
                                        <tfoot>
                                          <tr>
                                            <td colspan="7">v
                                              <ul class="pagination float-right">
                                                <c:if test="${pageMaker.prev}">
                                              		<li class="page-item">
                                                		  <a class="page-link" href="media${pageMaker.makeSearch(pageMaker.startPage - 1) }" aria-label="Previous">&laquo;
                                                  		<span aria-hidden="true"></span>
                                                  		<span class="sr-only">Previous</span>
                                                		  </a>
                                              		</li>
                                        	      </c:if>
                                          		  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                                              		<li class= "${pageMaker.cri.page == idx? 'active':''} page-item">
                                                		  <a class="page-link" href="media${pageMaker.makeSearch(idx)}">${idx}</a>
                                              		</li>
                                          		  </c:forEach>
                                          		  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                              		<li class="page-item">
                                              		  <a class="page-link" href="media${pageMaker.makeSearch(pageMaker.endPage +1) }" aria-label="Next">&raquo;
                                                		<span aria-hidden="true"></span>
                                                		<span class="sr-only">Next</span>
                                              		  </a>
                                              		</li>
                                          		  </c:if>
                                          		</ul>
                                            </td>
                                          </tr>
                                        </tfoot>
                                      </table>
                                    </div>
                                    <!-- list end -->
                                  </div>
                                </div>
                              </div>
                              <!-- 테이블리스트 end -->
                            </div>
                          </div>
                          <!-- tab5 news end -->
                        </div>
                        <!-- tab-content end -->
                      </div>
                      <!-- news Modal start-->
                      <div class="modal fade" id="news-Modal" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title">언론사 상세정보</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true"><i class="icofont icofont-close-line"></i></span>
                              </button>
                            </div>
                            <div class="modal-body">
                              <div class="card">
                                <div class="card-header">
                                  <h5 class="card-header-text">언론사정보</h5>
                                </div>
                                <div class="card-block table-border-style">
                                  <!-- list satart -->
                                  <div class="table-border-style">
                                    <div class="table-responsive">
                                      <table class="table table-sm">
                                        <tbody>
                                          <tr>
                                            <th class="b-r-1" width="30%">언론사명</th>
                                            <td id = 'mediaName'>톱스타뉴스</td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                  </div>
                                  <!-- list end -->
                                </div>
                              </div>
                              <div class="card">
                                <div class="card-header">
                                  <h5 class="card-header-text">기사노출도</h5>
                                </div>
                                <div class="card-block table-border-style">
                                  <!-- list satart -->
                                  <div class="table-border-style">
                                    <div class="table-responsive">
                                      <table class="table">
                                        <thead>
                                          <tr>
                                            <th class="b-b-1">전체기사</th>
                                            <th class="b-b-1">NAVER</th>
                                            <th class="b-b-1">DAUM</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <td id='media1_1'>0</td>
                                            <td id='media1_2'>0</td>
                                            <td id='media1_3'>0</td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                  </div>
                                  <!-- list end -->
                                </div>
                              </div>
                              <div class="card">
                                <div class="card-header">
                                  <h5 class="card-header-text">성향분석</h5>
                                </div>
                                <div class="card-block table-border-style">
                                  <!-- list satart -->
                                  <div class="table-border-style">
                                    <div class="table-responsive">
                                      <table class="table">
                                        <thead>
                                          <tr>
                                            <th colspan="4" class="b-b-1 b-r-1">전체기사</th>
                                            <th colspan="4" class="b-b-1">매칭기사</th>
                                          </tr>
                                          <tr>
                                            <th class="b-b-1" >전체기사수</th>
                                            <th class="b-b-1" >호흥</th>
                                            <th class="b-b-1" >비호흥(악성)</th>
                                            <th class="b-b-1 b-r-1" >관심</th>
                                            <th class="b-b-1" >전체기사수</th>
                                            <th class="b-b-1" >호흥</th>
                                            <th class="b-b-1" >비호흥(악성)</th>
                                            <th class="b-b-1" >관심</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <td id='media2_1'>0</td>
                                            <td id='media2_2'>0</td>
                                            <td id='media2_3'>0</td>
                                            <td id='media2_4'>0</td>
                                            <td id='media3_1'>0</td>
                                            <td id='media3_2'>0</td>
                                            <td id='media3_3'>0</td>
                                            <td id='media3_4'>0</td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                  </div>
                                  <!-- list end -->
                                </div>
                              </div>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- news Modal end-->
                      <!-- press Modal start-->
                      <div class="modal fade" id="press-Modal" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title">기자 상세정보</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true"><i class="icofont icofont-close-line"></i></span>
                              </button>
                            </div>
                            <div class="modal-body">
                              <div class="card">
                                <div class="card-header">
                                  <h5 class="card-header-text">기자정보</h5>
                                </div>
                                <div class="card-block table-border-style">
                                  <!-- list satart -->
                                  <div class="table-border-style">
                                    <div class="table-responsive">
                                      <table class="table table-sm">
                                        <tbody>
                                          <tr>
                                            <th class="b-r-1" width="30%">이름</th>
                                            <td id='pressName'>김한준</td>
                                          </tr>
                                          <tr>
                                            <th class="b-r-1">언론사명</th>
                                            <td id = 'pressMediaName'></td>
                                          </tr>
                                          <tr>
                                            <th class="b-r-1" >이메일</th>
                                            <td id = 'pressEmail'></td>
                                          </tr>
                                          <tr>
                                            <th class="b-r-1">연락처</th>
                                            <td id = 'pressPhoneNumber'></td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                  </div>
                                  <!-- list end -->
                                </div>
                              </div>
                              <div class="card">
                                <div class="card-header">
                                  <h5 class="card-header-text">기사노출도</h5>
                                </div>
                                <div class="card-block table-border-style">
                                  <!-- list satart -->
                                  <div class="table-border-style">
                                    <div class="table-responsive">
                                      <table class="table">
                                        <thead>
                                          <tr>
                                            <th class="b-b-1">전체기사</th>
                                            <th class="b-b-1">NAVER</th>
                                            <th class="b-b-1">DAUM</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <td id = 'press1_1'>0</td>
                                            <td id = 'press1_2'>0</td>
                                            <td id = 'press1_3'>0</td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                  </div>
                                  <!-- list end -->
                                </div>
                              </div>
                              <div class="card">
                                <div class="card-header">
                                  <h5 class="card-header-text">성향분석</h5>
                                </div>
                                <div class="card-block table-border-style">
                                  <!-- list satart -->
                                  <div class="table-border-style">
                                    <div class="table-responsive">
                                      <table class="table">
                                        <thead>
                                          <tr>
                                            <th colspan="4" class="b-b-1 b-r-1">전체기사</th>
                                            <th colspan="4" class="b-b-1">매칭기사</th>
                                          </tr>
                                          <tr>
                                            <th class="b-b-1">전체기사수</th>
                                            <th class="b-b-1">호흥</th>
                                            <th class="b-b-1">비호흥(악성)</th>
                                            <th class="b-b-1 b-r-1">관심</th>
                                            <th class="b-b-1">전체기사수</th>
                                            <th class="b-b-1">호흥</th>
                                            <th class="b-b-1">비호흥(악성)</th>
                                            <th class="b-b-1">관심</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <td id = 'press2_1'>0</td>
                                            <td id = 'press2_2'>0</td>
                                            <td id = 'press2_3'>0</td>
                                            <td id = 'press2_4'>0</td>
                                            <td id = 'press3_1'>0</td>
                                            <td id = 'press3_2'>0</td>
                                            <td id = 'press3_3'>0</td>
                                            <td id = 'press3_4'>0</td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                  </div>
                                  <!-- list end -->
                                </div>
                              </div>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- press Modal end-->
                      <!-- 순위 더보기 Modal start-->
                      <div class="modal fade" id="more-Modal" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h4 class="modal-title"><span id="moreName">언론사</span> 통계 순위 더보기</h4>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body">

                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- 순위 더보기 Modal end-->
                      
                      <!-- reportTextType Modal start-->
                      <div class="modal fade" id="text-Modal3" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title"></h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true"><i class="icofont icofont-close-line"></i></span>
                              </button>
                            </div>
                            <div class="modal-body">
                              <div class="col-lg-12">
                                <div class="card">
                                  <div class="card-header">
                                    <h5 class="card-header-text m-b-10">검출데이터</h5>
                                     </div>
                                    <!-- list satart -->
                                    <div class="table-responsive">
                                      <table class="table">
                                        <thead>
                                            <tr>
                                              <th width="5%">NO</th>
                                              <th width="10%">등록날짜</th>
                                              <th width="10%">언론사</th>
                                              <th width="3%">제목</th>
                                              <th width="10%">키워드</th>
                                              <th width="10%">여론현황</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <c:forEach items="${reporterGetTextTypeCount}" var = "mediaVO2" varStatus="index">
                                          <tr>
                                            <th scope="row">${index.count}</th>
                                            <td>
                                            <fmt:formatDate value="${mediaVO2.writeDate}" pattern="yyyy-MM-dd kk:mm:ss"/>
                                            </td>
                                            <td>${mediaVO2.media_name}</td>
                                            <td width="3%"><a href='' target="_blank">${mediaVO2.media_title}</a></td>
                                            <td>${mediaVO2.keyword}</td>
                                            <td>${mediaVO2.textType}</td>
                                          </tr>
                                          </c:forEach>
                                        </tbody>
                                      </table>
                                    </div>
                                  <!-- list end -->
                                </div>
                              </div>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- reportTextType Modal end-->
                      
                      <!-- textType Modal start-->
                      <div class="modal fade" id="press-textType" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title">좋은 글</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true"><i class="icofont icofont-close-line"></i></span>
                              </button>
                            </div>
                            <div class="modal-body">
                              <div class="col-lg-12">
                                    <!-- list satart -->
                                      <c:if test="${empty textTypelistSearch}">
                                         	<h5 align="center">등록된 게시글이 없습니다.</h5>
                                     </c:if>
                                     <c:if test="${!empty textTypelistSearch}">
                                      <table class="tabc" align="center">
                                        <thead>
                                            <tr align="center">
                                              <th width="5%">NO</th>
                                              <th width="20%">등록날짜</th>
                                              <th width="25%">언론사</th>
                                              <th width="50%">제목</th>
                                              <th width="25%">키워드</th>
                                              <th width="25%">여론현황</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <c:forEach items="${textTypelistSearch}" var = "mediaVO" varStatus="index">
                                          <tr>
                                            <th scope="row">${index.count}</th>
                                            <td>
                                            <fmt:formatDate value="${mediaVO.updateDate}" pattern="yyyy-MM-dd"/>
                                            </td>
                                            <td>${mediaVO.media_name}</td>
                                            <td><a href='${mediaVO.url}' target="_blank" style="font-size: 12px;"><b>${mediaVO.media_title}</b></a></td>
                                            <td>${mediaVO.keyword}</td>
                                            <td>${mediaVO.textType}</td>
                                          </tr>
                                          </c:forEach>
                                        </tbody>
                                      </table>
                                      </c:if>
                                  <!-- list end -->
                              </div>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- textType Modal end-->
                      
                      <!-- textType Modal start-->
                      <div class="modal fade" id="press-textType2" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title">나쁜 글</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true"><i class="icofont icofont-close-line"></i></span>
                              </button>
                            </div>
                                <div class="modal-body">
                              <div class="col-lg-12">
                                    <!-- list satart -->
                                      <c:if test="${empty textTypelistSearch2}">
                                         	<h5 align="center">등록된 게시글이 없습니다.</h5>
                                     </c:if>
                                     <c:if test="${!empty textTypelistSearch2}">
                                      <table class="tabc" align="center">
                                        <thead>
                                            <tr align="center">
                                              <th width="5">NO</th>
                                              <th width="20">등록날짜</th>
                                              <th width="25">언론사</th>
                                              <th width="50">제목</th>
                                              <th width="25">키워드</th>
                                              <th width="25">여론현황</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <c:forEach items="${textTypelistSearch2}" var = "mediaVO" varStatus="index">
                                          <tr>
                                            <th scope="row">${index.count}</th>
                                            <td>
                                            <fmt:formatDate value="${mediaVO.updateDate}" pattern="yyyy-MM-dd"/>
                                            </td>
                                            <td>${mediaVO.media_name}</td>
                                            <td><a href='${mediaVO.url}' target="_blank" style="font-size: 12px;"><b>${mediaVO.media_title}</b></a></td>
                                            <td>${mediaVO.keyword}</td>
                                            <td>${mediaVO.textType}</td>
                                          </tr>
                                          </c:forEach>
                                        </tbody>
                                      </table>
                                      </c:if>
                                  <!-- list end -->
                              </div>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- textType Modal end-->
                      <!-- textType Modal start-->
                      <div class="modal fade" id="press-textType3" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title">관심 글</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true"><i class="icofont icofont-close-line"></i></span>
                              </button>
                            </div>
                                <div class="modal-body">
                              <div class="col-lg-12">
                                    <!-- list satart -->
                                      <c:if test="${empty textTypelistSearch3}">
                                         	<h5 align="center">등록된 게시글이 없습니다.</h5>
                                     </c:if>
                                     <c:if test="${!empty textTypelistSearch3}">
                                      <table class="tabc" align="center">
                                        <thead>
                                            <tr align="center">
                                              <th width="5">NO</th>
                                              <th width="20">등록날짜</th>
                                              <th width="25">언론사</th>
                                              <th width="25">제목</th>
                                              <th width="25">키워드</th>
                                              <th width="25">여론현황</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <c:forEach items="${textTypelistSearch3}" var = "mediaVO" varStatus="index">
                                          <tr>
                                            <th scope="row">${index.count}</th>
                                            <td>
                                            <fmt:formatDate value="${mediaVO.updateDate}" pattern="yyyy-MM-dd"/>
                                            </td>
                                            <td>${mediaVO.media_name}</td>
                                            <td><a href='${mediaVO.url}' target="_blank" style="font-size: 12px;"><b>${mediaVO.media_title}</b></a></td>
                                            <td>${mediaVO.keyword}</td>
                                            <td>${mediaVO.textType}</td>
                                          </tr>
                                          </c:forEach>
                                        </tbody>
                                      </table>
                                      </c:if>
                                  <!-- list end -->
                              </div>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- textType Modal end-->
                      <!-- textType Modal start-->
                      <div class="modal fade" id="press-textType4" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title">기타 글</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true"><i class="icofont icofont-close-line"></i></span>
                              </button>
                            </div>
                                <div class="modal-body">
                              <div class="col-lg-12">
                                    <!-- list satart -->
                                      <c:if test="${empty textTypelistSearch4}">
                                         	<h5 align="center">등록된 게시글이 없습니다.</h5>
                                     </c:if>
                                     <c:if test="${!empty textTypelistSearch4}">
                                      <table class="tabc" align="center">
                                        <thead>
                                            <tr align="center">
                                              <th width="5">NO</th>
                                              <th width="20">등록날짜</th>
                                              <th width="25">언론사</th>
                                              <th width="50">제목</th>
                                              <th width="25">키워드</th>
                                              <th width="25">여론현황</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <c:forEach items="${textTypelistSearch4}" var = "mediaVO" varStatus="index">
                                          <tr>
                                            <th scope="row">${index.count}</th>
                                            <td>
                                            <fmt:formatDate value="${mediaVO.updateDate}" pattern="yyyy-MM-dd"/>
                                            </td>
                                            <td>${mediaVO.media_name}</td>
                                            <td><a href='${mediaVO.url}' target="_blank" style="font-size: 12px;"><b>${mediaVO.media_title}</b></a></td>
                                            <td>${mediaVO.keyword}</td>
                                            <td>${mediaVO.textType}</td>
                                          </tr>
                                          </c:forEach>
                                        </tbody>
                                      </table>
                                      </c:if>
                                  <!-- list end -->
                              </div>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-default waves-effect " data-dismiss="modal">Close</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- textType Modal end-->
                      
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
  <!-- Date-range picker js -->
  <script type="text/javascript" src="../bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
  <!-- echart js -->
  <script src="../assets/pages/chart/echarts/js/echarts-all.js" type="text/javascript"></script>
  <!-- NVD3 chart -->
  <script src="../bower_components/d3/d3.js"></script>
  <script src="../bower_components/nvd3/build/nv.d3.js"></script>
  <script src="../assets/pages/chart/nv-chart/js/stream_layers.js"></script>
  <!-- i18next.min.js -->
  <script type="text/javascript" src="../bower_components/i18next/i18next.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-xhr-backend/i18nextXHRBackend.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-browser-languagedetector/i18nextBrowserLanguageDetector.min.js"></script>
  <script type="text/javascript" src="../bower_components/jquery-i18next/jquery-i18next.min.js"></script>
  <!-- sweet alert js -->
  <script type="text/javascript" src="../bower_components/sweetalert/dist/sweetalert.min.js"></script>
  <!-- Custom js -->
  <script type="text/javascript" src="../assets/js/script.js"></script>
  <script src="../assets/js/pcoded.min.js"></script>
  <script src="../assets/js/demo-12.js"></script>
  <script src="../assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
  <script src="../assets/js/jquery.mousewheel.min.js"></script>
  <script src="../assets/pages/period/custom-period5.js"></script>
  <script src="../assets/pages/picker.js"></script>
</body>

<script type="text/javascript">

	$(document).ready(function(){
		
		
		//ajax 보안
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");

		$(function() {
			$(document).ajaxSend(function(e, xhr, options) {
		  		xhr.setRequestHeader(header, token);
		  	});
		});
		
		var $fromDate = $("#fromDate");
		  
		var startDateOption = decodeURI(window.location.href.split("startDate=")[1]).split("&")[0].split(" ")[0];
		var endDateOption = decodeURI(window.location.href.split("endDate=")[1]).split("&")[0].split(" ")[0];
		console.log("startDateOption: " + startDateOption);
		console.log("endDateOption: " + endDateOption);
			
		if(startDateOption != 'undefined' && endDateOption != 'undefined'
				&& startDateOption != '' && endDateOption != ''){
			  
			$fromDate.val(startDateOption + " - " + endDateOption);
		  		
		}
		
		var selectOption = decodeURI(window.location.href.split("selectKey=")[1]).split("&")[0];
		console.log("selectOption: " + selectOption);


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

		var companyOption = decodeURI(window.location.href.split("company=")[1]).split("&")[0];


		var $selectCompany = $('#selectCompany');
		if(companyOption != 'undefined'){
			for(var i = 0; i < $selectCompany[0].length; i++ ){

				if($selectCompany[0].children[i].value == companyOption){
					$selectCompany[0].children[i].selected = 'selected';
				}
			}
		}
		$selectCompany[0][0].disabled = true;


		// 회사 선택시
		$selectCompany.change(function(){
			console.log("selectCompany clicked....");
			console.log($("#selectCompany option:selected").val());

			searchList();

		});
		
		
		var graphStart = $fromDate.val().split(" - ")[0].replace("/", "-").replace("/", "-");
		var graphEnd = $fromDate.val().split(" - ")[1].replace("/", "-").replace("/", "-");

		console.log("graphStart: " + graphStart);
	    console.log("graphEnd: " + graphEnd);
		  
		
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

		// 캘린더 클릭시
		$('#fromDate').on('apply.daterangepicker', function(ev, picker) {	
			var startDate = picker.startDate.format('YYYY-MM-DD');
			var endDate = picker.endDate.format('YYYY-MM-DD');

			console.log("startDate: " + startDate);
			console.log("endDate: " + endDate);

			searchList();

		});
		
		
		pieGraph1();
		pieGraph2();
		
		// 엑셀 출력
		document.querySelector('.alert-confirm').onclick = function(){
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
		          
		        	self.location = "excel?"
		  			  + "company=" + $("#selectCompany option:selected").val()
		  			  + "&selectKey=" + $('#selectKeyword option:selected').val()
		  			  + "&part=media"
		  			  + "&startDate=" + makeDateFormat($("#fromDate").val(), 0)
		  			  + "&endDate=" +  makeDateFormat($("#fromDate").val(), 1);

		  	  		swal("Success!", "엑셀출력 되었습니다.", "success");
		        });
		  };
		
	});
	
	// allBtn 클릭시
	  $(".radiosBtn").on("click", function(event){
		  console.log(event);

		  var input = event.target.id;

		  var btnNum = input.substr(6);

		  var $trList = $(".trList");

		  for(var i = 0; i < $trList.length; i++){
			  $('#radio'+ btnNum + (i+1))[0].checked = true;
		  }



		  /* var value;

		  switch(input){

		  case "allBtn1" : value = "좋은글"; break;
		  case "allBtn2" : value = "나쁜글"; break;
		  case "allBtn3" : value = "관심글"; break;
		  case "allBtn4" : value = "기타글"; break;
		  case "allBtn5" : value = "삭제글"; break;

		  }

		  console.log(value); */




	  });
	
	// 분류 선택시
	$selectTextType.change(function(){
		console.log("selectTextType clicked....");
		console.log($('#selectTextType option:selected').val());

		searchList();
	});
	
	// 날짜 계산 함수
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
		}

		return {
			startDate : startDate,
			endDate : endDate
		}

	}

	function makeDateFormat(date, index){
		var splitDate = date.split(" - ")[index];
			if(splitDate != undefined){
				var returnDate = splitDate.replace("/", "-").replace("/", "-")
				return returnDate;
			}
		
		
	}

	//list URL 함수
	function searchList(event) {

		var makeQeury = '${pageMaker.makeQuery(1)}'.slice(0,-2);

		self.location = "media"
					  + makeQeury
					  + "10"
					  + "&selectKey="
					  + $('#selectKeyword option:selected').val()
					  + "&company="
					  + $("#selectCompany option:selected").val()
					  + "&startDate=" + makeDateFormat($("#fromDate").val(), 0)
					  + "&endDate=" +  makeDateFormat($("#fromDate").val(), 1);
	}
	
	

	//data
	function pieData1() {
		console.log("media count");
		console.log('${mediaTypeCount.lik}');
		console.log('${mediaTypeCount.dis}');
		console.log('${mediaTypeCount.cu}');
		console.log('${mediaTypeCount.etc}');
	    
		return [{
		      "label": "좋은기사",
		      "value": '${pressTypeCount.lik}',
		      "color": "#2ecc71"
		  },{
		      "label": "나쁜기사",
		      "value": '${pressTypeCount.dis}',
		      "color": "#e74c3c"
		  },{
		      "label": "관심기사",
		      "value": '${pressTypeCount.cu}',
		      "color": "#FF9F55"
		  },   {
		      "label": "기타기사",
		      "value": '${pressTypeCount.etc}',
		      "color": "#f1c40f"
		  }];
	}
	function pieData2() {
		console.log("press count");
		console.log('${pressTypeCount.lik}');
		console.log('${pressTypeCount.dis}');
		console.log('${pressTypeCount.cu}');
		console.log('${pressTypeCount.etc}');
		return [{
	        "label": "좋은기사",
	        "value": '${mediaTypeCount.lik}',
	        "color": "#2ecc71"
	    },{
	        "label": "나쁜기사",
	        "value": '${mediaTypeCount.dis}',
	        "color": "#e74c3c"
	    },{
	        "label": "관심기사",
	        "value": '${mediaTypeCount.cu}',
	        "color": "#FF9F55"
	    },   {
	        "label": "기타기사",
	        "value": '${mediaTypeCount.etc}',
	        "color": "#f1c40f"
	    }];
	}
</script>

</html>
