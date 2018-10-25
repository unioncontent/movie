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
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
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
	background-color: white;
	border-bottom: 1px solid #ddd;
}
.tabc td{
	text-align: center;
	border-bottom: 1px solid #ddd;
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
                          <a href="../dashBoard/dashBoard_main">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">통계보고서</a>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <!-- page-header end -->
                  <!-- Page-body start -->
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
                        <select name="select" class="col-md-1 form-control form-control-inverse m-b-10 p-r-5 m-l-0 f-left select-left" id="selectKeyword">
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
						</c:if>
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
                        <jsp:include page='../include/period_header.jsp' />
                        <!-- tab header end -->
                        <!-- tab-content start -->
                        <div class="tab-content">
                          <!-- tab5 news start -->
                          <div class="tab-pane fade show active" id="main" role="tabpanel">
                            <div class="row">
                              <!-- top cards start -->
                              <%-- <div class="col-md-6 col-xl-3 main-card">
                                <div class="card social-widget-card">
                                  <div class="card-block-big bg-inverse">
                                    <h3><fmt:formatNumber value="${totalCountPage}" groupingUsed="true"/></h3>
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
                                    <h3><fmt:formatNumber value="" groupingUsed="true"/></h3>
                                    <span class="m-t-10">언론사</span>
                                    <i class="icofont icofont-building-alt"></i>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6 col-xl-3 main-card">
                                <div class="card social-widget-card">
                                  <div class="card-block-big bg-success">
                                    <h3><fmt:formatNumber value="" groupingUsed="true"/></h3>
                                    <span class="m-t-10">기자</span>
                                    <i class="icofont icofont-fountain-pen"></i>
                                  </div>
                                </div>
                              </div> --%>
                              <!-- top cards end -->
		                      <!-- 통계보고서 그래프 start -->
                              <div class="col-lg-12">
                                <div class="card">
                                <div class="card-header">
                                  <h5 class="card-header-text">
                                  <font style="font-weight: bold; color: black;">
                                    <i class="icofont icofont-chart-line m-r-5"></i>검출량 그래프
                                    </font>
                                  </h5>
                                  <div class="card-header-right">
                                    <i class="icofont icofont-rounded-down"></i>
                                    <i class="icofont icofont-refresh"></i>
                                  </div>
                                </div>
                                <div class="card-block">
                                  <!-- chart start -->
                                  <div id="container" style="height:350px;"></div>
                                  <!-- chart end -->
                                </div>
                              </div>
                              </div>
                              <!-- 통계보고서 그래프 end -->
                              <!-- 테이블리스트 start -->
                              <div class="col-lg-12">
                                <div class="card">
                                  <div class="card-header">
                                    <h5 class="card-header-text m-b-10 m-t-10"><font style="font-weight: bold; color: black;">검출데이터</font></h5>
                                    <table class="padd m-t-10"><tr><td>
                                    <div class="btn-group f-right p-r-0 ">
                                    	<button type="button" class="btn btn-modal m-b-5" data-toggle="modal" data-target="#mediaMain">주요매체</button>
                                   	 	<button type="button" class="btn btn-modal m-b-5" data-toggle="modal" data-target="#textType1" style="margin-left: 2px">좋은글</button>
                                   	 	<button type="button" class="btn btn-modal m-b-5" data-toggle="modal" data-target="#textType2" style="margin-left: 2px">나쁜글</button>
                                   	 	<button type="button" class="btn btn-modal m-b-5" data-toggle="modal" data-target="#textType3" style="margin-left: 2px">관심글</button>
                                   	 	<button type="button" class="btn btn-modal" data-toggle="modal" data-target="#textType4" style="margin-left: 2px">기타글</button>
		                            </div></td><td></td><td></td><td>
	                                <div class="btn-group f-right p-r-0">
	                                	<button class="btn btn-warning m-b-5 f-right alert-confirm" onclick="_gaq.push(['_trackEvent', 'example', 'try', 'alert-confirm']);"><i class="icofont icofont-download-alt"></i>EXCEL</button>
	                                </div></td></tr></table>
                                  </div>
                                    <!-- list satart -->
                                    <div class="card-block table-border-style">
                                    <div class="table-responsive">
                                      <table class="table table-bordered table-sm">
                                      <c:if test="${empty mediaList}">
                                      <tbody>
	                                     <tr>
	                                     <td style="vertical-align:middle;" align="center" height="150px"><h5>등록된 게시글이 없습니다.</h5></td>
	                                     </tr>
	                                     </tbody>
                                     	</c:if>
                                     	<c:if test="${!empty mediaList}">
                                        <thead>
                                            <tr>
                                              <th width="5%">NO</th>
                                              <th width="10%">등록날짜</th>
                                              <th width="10%">언론사</th>
                                              <th width="5%">출처</th>
                                              <th width="10%">기자</th>
                                              <th width="30%">제목</th>
                                              <th width="10%">키워드</th>
                                              <th width="10%">여론현황</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <c:forEach items="${mediaList}" var = "List" varStatus="index">
                                          <tr>
                                            <th scope="row">${totalCountPage -index.count +1 -minusCount}</th>
                                            <td>
                                            ${List.writeDate}
                                            <%-- <fmt:formatDate value="${mediaVO.writeDate}" pattern="yyyy-MM-dd kk:mm:ss"/> --%>
                                            </td>
                                            <td>${List.media_name}</td>
                                            <td width="5%">
		                                    <c:if test="${List.media_subname != null}">${List.media_subname}</c:if>
		                                    <c:if test="${List.media_subname == null}"><i class="icofont icofont-minus"></i></c:if>
		                                    </td>
                                            <td>
                                            <c:if test="${List.reporter_name != null}">${List.reporter_name}</c:if>
                                            <c:if test="${List.reporter_name == null}"><i class="icofont icofont-minus"></i></c:if>
                                            </td>
                                            <td>
	                                            <c:if test="${List.media_main == 1}">
			                                    	<i class="icofont icofont-favourite" style="color: #2ecc71 !important"></i>&nbsp;
		                                    	</c:if>
                                            	<a href='${List.url}' target="_blank">${List.media_title}</a>
                                            </td>
                                            <td>${List.keyword}</td>
                                            <td>${List.textType}</td>
                                          </tr>
                                          </c:forEach>
                                        </tbody>
                                        <tfoot>
                                          <tr>
                                            <td colspan="8">
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
                                        </c:if>
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
                      <!-- textType Modal start-->
                      <div class="modal fade" id="mediaMain" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title">주요매체</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true"><i class="icofont icofont-close-line"></i></span>
                              </button>
                            </div>
                            <div class="modal-body">
                              <div class="col-lg-12">
                                    <!-- list satart -->
                                      <c:if test="${empty mediaMain}">
                                         	<h5 align="center">등록된 게시글이 없습니다.</h5>
                                     </c:if>
                                     <c:if test="${!empty mediaMain}">
                                       <div class="table-responsive">
                                         <table class="table tabc" align="center">
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
                                            <c:forEach items="${mediaMain}" var = "mediaVO" varStatus="index">
                                            <tr>
                                              <th scope="row" style="font-size: 12px;">${index.count}</th>
                                              <td style="font-size: 12px;">
	                                              <fmt:parseDate value="${mediaVO.writeDate}" var="noticePostDate" pattern="yyyy-MM-dd HH:mm:ss"/>
												  <fmt:formatDate value="${noticePostDate}" pattern="yyyy-MM-dd"/>
                                              </td>
                                              <td style="font-size: 12px;">${mediaVO.media_name}</td>
                                              <td>
	                                              <a href='${mediaVO.url}' target="_blank" style="font-size: 12px;">
		                                              <div class="content-nowrap">
			                                              <i class="icofont icofont-favourite" style="color: #2ecc71 !important"></i>
			                                              <b>${mediaVO.media_title}</b>
		                                              </div>
	                                              </a>
                                              </td>
                                              <td style="font-size: 12px;">${mediaVO.keyword}</td>
                                              <td style="font-size: 12px;">${mediaVO.textType}</td>
                                            </tr>
                                            </c:forEach>
                                          </tbody>
                                        </table>
                                      </div>
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
                      <div class="modal fade" id="textType1" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title">좋은글</h5>
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
                                       <div class="table-responsive">
                                         <table class="table tabc" align="center">
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
                                              	<fmt:parseDate value="${mediaVO.writeDate}" var="noticePostDate" pattern="yyyy-MM-dd HH:mm:ss"/>
										      	<fmt:formatDate value="${noticePostDate}" pattern="yyyy-MM-dd"/>
                                              </td>
                                              <td>${mediaVO.media_name}</td>
                                              <td>
	                                              <a href='${mediaVO.url}' target="_blank" style="font-size: 12px;">
		                                              <div class="content-nowrap"><b>${mediaVO.media_title}</b></div>
	                                              </a>
                                              </td>
                                              <td>${mediaVO.keyword}</td>
                                              <td>${mediaVO.textType}</td>
                                            </tr>
                                            </c:forEach>
                                          </tbody>
                                        </table>
                                      </div>
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
                      <div class="modal fade" id="textType2" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title">나쁜글</h5>
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
                                       <div class="table-responsive">
                                         <table class="table tabc" align="center">
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
                                              	<fmt:parseDate value="${mediaVO.writeDate}" var="noticePostDate" pattern="yyyy-MM-dd HH:mm:ss"/>
												<fmt:formatDate value="${noticePostDate}" pattern="yyyy-MM-dd"/>
                                              </td>
                                              <td>${mediaVO.media_name}</td>
                                              <td>
	                                              <a href='${mediaVO.url}' target="_blank" style="font-size: 12px;">
		                                              <div class="content-nowrap"><b>${mediaVO.media_title}</b></div>
	                                              </a>
                                              </td>
                                              <td>${mediaVO.keyword}</td>
                                              <td>${mediaVO.textType}</td>
                                            </tr>
                                            </c:forEach>
                                          </tbody>
                                        </table>
                                      </div>
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
                      <div class="modal fade" id="textType3" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title">관심글</h5>
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
                                      <div class="table-responsive">
                                        <table class="table tabc" align="center">
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
                                              	<fmt:parseDate value="${mediaVO.writeDate}" var="noticePostDate" pattern="yyyy-MM-dd HH:mm:ss"/>
												<fmt:formatDate value="${noticePostDate}" pattern="yyyy-MM-dd"/>
                                              </td>
                                              <td>${mediaVO.media_name}</td>
                                              <td>
	                                              <a href='${mediaVO.url}' target="_blank" style="font-size: 12px;">
		                                              <div class="content-nowrap"><b>${mediaVO.media_title}</b></div>
	                                              </a>
                                              </td>
                                              <td>${mediaVO.keyword}</td>
                                              <td>${mediaVO.textType}</td>
                                            </tr>
                                            </c:forEach>
                                          </tbody>
                                        </table>
                                      </div>
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
                      <div class="modal fade" id="textType4" tabindex="-1" role="dialog">
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
                                       <div class="table-responsive">
                                         <table class="table tabc" align="center">
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
                                              	<fmt:parseDate value="${mediaVO.writeDate}" var="noticePostDate" pattern="yyyy-MM-dd HH:mm:ss"/>
												<fmt:formatDate value="${noticePostDate}" pattern="yyyy-MM-dd"/>
                                              </td>
                                              <td>${mediaVO.media_name}</td>
                                              <td>
	                                              <a href='${mediaVO.url}' target="_blank" style="font-size: 12px;">
		                                              <div class="content-nowrap"><b>${mediaVO.media_title}</b></div>
	                                              </a>
                                              </td>
                                              <td>${mediaVO.keyword}</td>
                                              <td>${mediaVO.textType}</td>
                                            </tr>
                                            </c:forEach>
                                          </tbody>
                                        </table>
                                      </div>
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
  <script type="text/javascript" src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
  <script type="text/javascript" src="../assets/pages/advance-elements/bootstrap-datetimepicker.min.js"></script>
  <!-- modernizr js사 -->
  <script type="text/javascript" src="../bower_components/modernizr/modernizr.js"></script>
  <script type="text/javascript" src="../bower_components/modernizr/feature-detects/css-scrollbars.js"></script>
  <!-- classie js -->
  <script type="text/javascript" src="../bower_components/classie/classie.js"></script>
  <!-- calendar -->
  <script type="text/javascript" src="../assets/pages/dashboard/pgcalendar/calendar.js"></script>
  <!-- Date-range picker js -->
  <script type="text/javascript" src="../bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
  <!-- Bootstrap date-time-picker js -->
  <script type="text/javascript" src="../assets/pages/advance-elements/moment-with-locales.min.js"></script>
  <!-- i18next.min.js -->
  <script type="text/javascript" src="../bower_components/i18next/i18next.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-xhr-backend/i18nextXHRBackend.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-browser-languagedetector/i18nextBrowserLanguageDetector.min.js"></script>
  <script type="text/javascript" src="../bower_components/jquery-i18next/jquery-i18next.min.js"></script>
  <!-- sweet alert js -->
  <script type="text/javascript" src="../bower_components/sweetalert/dist/sweetalert.min.js"></script>
  <!-- Morris Chart js -->
  <script src="../bower_components/raphael/raphael.min.js"></script>
  <script src="../bower_components/morris.js/morris.js"></script>
  <!-- High Chart js -->
  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script src="https://code.highcharts.com/modules/series-label.js"></script>
  <script src="https://code.highcharts.com/modules/exporting.js"></script>
  <!-- Custom js -->
  <script type="text/javascript" src="../assets/pages/dashboard/custom-dashboard.js"></script>
  <script type="text/javascript" src="../assets/js/script.js"></script>
  <script type="text/javascript" src="../assets/pages/division/script2.js"></script>
  <script type="text/javascript" src="../assets/pages/picker.js"></script>
  <script src="../assets/js/pcoded.min.js"></script>
  <script src="../assets/js/demo-12.js"></script>
  <script src="../assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
  <script src="../assets/js/jquery.mousewheel.min.js"></script>
  <script src="../assets/pages/period/custom-period5.js"></script>
  <script src="../assets/pages/picker.js"></script>
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

//BODY 에 로딩화면 추가
var loading = $('<div id="loading" class="loading"></div><img id="loading_img" alt="loading" src="../assets/images/ajax-loader.gif">').appendTo(document.body).hide();

//	ajax 통신 시작시 실행
$(window).ajaxStart(function() {
	loading.show();
});

//	ajax 통신 종료시 실행
$(window).ajaxStop(function() {
	loading.hide();
});

$(document).ready(function(){

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

		$.ajax({

		      type : "POST",
			  url : "graph_re",
		 	  dataType : "json",
		 	  data : {success : 'success', part : "media",company : $("#selectCompany option:selected").val(), selectKey : $("#selectKeyword option:selected").val()},
		  	  success : function(data){

		  		  console.log(data);
		  		var script = "[";


				for(var i = 0; i < data.length; i++){

					script += data[i].type1 + ",";


					if(i == data.length-1){
						script =  script.substr(0, script.length-1);
						script += "]";
					}
				}
				
				var script2 = "[";

		
				for(var i = 0; i < data.length; i++){

					script2 += '"' + data[i].writeDate + '",';

					if(i == data.length-1){
						script2 =  script2.substr(0, script2.length-1);
						script2 += "]";
		  		
					}
				}
				console.log(script);
				console.log(script2);

				// to json
				var jsonScript = JSON.parse(script);
				var jsonScript2 = JSON.parse(script2);

				areaChart(jsonScript, jsonScript2);

		  	 }
		});

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

		/* var selectKey = decodeURI(window.location.href.split("selectKey=")[1]).split("&")[0];
		console.log("aaaselectKey:" + selectKey);
		var company = decodeURI(window.location.href.split("company=")[1]).split("&")[0];
		console.log("aaacompany:" + company); */

		/* var selectKey = $('#selectKeyword option:selected').val();
		console.log("aaaselectKey:" + selectKey);
		var company = $("#selectCompany option:selected").val();
		console.log("aaacompany:" + company); */

		var target = document.getElementById("selectKeyword");
		var selectKey = target.options[target.selectedIndex].value;
		console.log("aaaselectKey:" + selectKey);
		var target2 = document.getElementById("selectCompany");
		var company = target2.options[target2.selectedIndex].value;
		console.log("aaacompany:" + company);

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

function areaChart(jsonScript,jsonScript2) {
		Highcharts.setOptions({
			lang: {
				thousandsSep: ','
			}
		});
		Highcharts.chart('container', {

		    title: {
		         text: ''
		    },
		    subtitle: {
		        text: ''
		    },
		    yAxis: {
		        title: {
		            text: ''
		        }
		    },
		    legend: {
		        layout: 'vertical',
		        align: 'right',
		        verticalAlign: 'middle'
		    },
		  	xAxis: {
		  	 categories: jsonScript2
		    },
		    plotOptions: {
		        series: {
		            allowPointSelect: true
		        }
		    },
		    series: [{
		        name: '검출수',
		        data: jsonScript,
		        color: '#01C0C8'
		    }],
		  	credits: {
		    	enabled : false
		    },
		  	exporting: {
	        sourceWidth: 1200,
	        sourceHeight: 330,
	        // scale: 2 (default)
	        chartOptions: {
	            subtitle: null
	        }
	    	},
		    responsive: {
		        rules: [{
		            condition: {
		                maxWidth: 500
		            },
		            chartOptions: {
		                legend: {
		                    layout: 'horizontal',
		                    align: 'center',
		                    verticalAlign: 'bottom'
		                }
		            }
		        }]
		    }
		});
		}

	// allBtn 클릭시
	  $(".radiosBtn").on("click", function(event){
		  console.log(event);

		  var input = event.target.id;

		  var btnNum = input.substr(6);

		  var $trList = $(".trList");

		  for(var i = 0; i < $trList.length; i++){
			  $('#radio'+ btnNum + (i+1))[0].checked = true;
		  }
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


</script>

</html>
