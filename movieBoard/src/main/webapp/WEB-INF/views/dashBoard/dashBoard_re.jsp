<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="currTime" class="java.util.Date" />

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
  <!-- calendar -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/dashboard/pgcalendar/calendar.css">
  <!-- Style.css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/clndr-calendar/css/clndr.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/pages/dashboard/css/style.css">
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
          <!-- left menu start -->
          <jsp:include page='../include/side.jsp' />
          <!-- left menu end -->
          <!-- content start -->
          <div class="pcoded-content">
            <div class="pcoded-inner-content">
              <!-- main-body start -->
              <div class="main-body">
                <div class="page-wrapper">
                  <!-- page-header start -->
                  <div class="page-header">
                    <div class="page-header-title">
                      <h4>DashBoard</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="../dashBoard/dashBoard">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">대시보드</a>
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
                      <div class="col-md-6">
                        <div class="card">
                          <div class="card-header">
                            <h5>NEWS HEADLINE</h5>
                            <div class="card-header-right">
                                <i class="icofont icofont-rounded-down"></i>
                            </div>
                          </div>
                          <div class="card-block table-border-style">
                            <div class="table-responsive">
                              <table class="table table-bordered table-sm">
                              <c:if test="${empty headlineList}">
                                     <tbody>
                                     <tr>
                                     <td align="center" height="243px"><h5>등록된 기사가 없습니다.</h5></td>
                                     </tr>
                                     </tbody>
                                     </c:if>
                                     <c:if test="${!empty headlineList}">
                                     <thead>
                                            <tr>
                                              <th width="5%">날짜</th>
                                              <th width="5%">기사제목</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                          <c:forEach items="${headlineList}" var = "list" varStatus="index">
                                          <tr class = "trList">
                                            <td>
                                            <fmt:formatDate value="${list.createDate}" type="DATE" pattern="yyyy-MM-dd" />
                                            </td>
                                            <td>
                                            <div class="title-nowrap">
                                            <a href='${list.url}' target="_blank">${list.media_title}</a>
                                            </div>
                                            </td>
                                          </tr>
                                          </c:forEach>
                                        </tbody>
                                        </c:if>
                                      </table>
                                      <br>
                                      <table class="table table-bordered">
                                <thead>
                                  <tr>
                                    <th width="50%">분류</th>
                                    <th>검출량</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <th scope="row">언론사 기사글</th>
                                    <td><fmt:formatNumber value="${mediaTotalcnt}" groupingUsed="true"/>건</td>
                                  </tr>
                                  <tr>
                                    <th scope="row">언론사 댓글</th>
                                    <td><fmt:formatNumber value="${replyTotalcnt}" groupingUsed="true"/>건</td>
                                  </tr>
                                  <tr>
                                    <th scope="row" style="white-space:initial;">SNS ( facebook, instagram, twitter )</th>
                                    <td><fmt:formatNumber value="${snsTotalcount}" groupingUsed="true"/>건</td>
                                  </tr>
                                  <tr>
                                    <th scope="row">Naver 평점</th>
                                    <td><fmt:formatNumber value="${scoreTotalcnt}" groupingUsed="true"/>건</td>
                                  </tr>
                                  <tr class="bg-inverse">
                                    <th scope="row">합계</th>
                                    <td><fmt:formatNumber value="${mediaTotalcnt + replyTotalcnt
                                    	+ snsTotalcount + scoreTotalcnt}" groupingUsed="true"/>건</td>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- Morris chart start -->
                      <div class="col-md-6">
                        <div class="card">
                          <div class="card-header">
                            <h5>
                            	<i class="icofont icofont-chart-line m-r-5"></i>
                            	기사글 증가현황(금일)
                            </h5>
                            <div class="card-header-right">
                              <i class="icofont icofont-rounded-down"></i>
                            </div>
                          </div>
                          <div class="card-block">
                            <!-- <div id="morris-extra-area" style="height:300px;"></div> -->
                            <div id="morris-extra-line" style="height:328px;"></div>
                            <br>
                            <h5>분류글 현황</h5>
                            <br><br>
                            <table class="table table-bordered">
                                  <thead>
                                    <tr>
                                      <th>검출</th>
                                      <th>나쁜글</th>
                                      <th>상태</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td><fmt:formatNumber value="${mediaTextcnt + portalTextcnt + communityTextcnt}" groupingUsed="true"/>건</td>
                                      <td>
                                      <fmt:formatNumber value="${mediaTextcnt2 + portalTextcnt2 + communityTextcnt2}" groupingUsed="true"/>건
                                      <c:if test="${mediaTextcnt + portalTextcnt + communityTextcnt != 0}">
                                      (
                                      <fmt:parseNumber var="pages" integerOnly="true" value="${(mediaTextcnt2 + portalTextcnt2 + communityTextcnt2)/(mediaTextcnt + portalTextcnt + communityTextcnt) * 100}"></fmt:parseNumber>${pages}%
                                      )
                                      </c:if>
                                      <c:if test="${mediaTextcnt + portalTextcnt + communityTextcnt == 0}">
								      (0%)
								      </c:if>
                                      </td>
                                      <td>
                                      <c:if test="${pages <= 1}">
								      <strong class="text-success">아주좋음</strong>
								      </c:if>
								      <c:if test="${pages >= 2 && pages <= 5}">
								      <strong class="text-primary">좋음</strong>
								      </c:if>
								      <c:if test="${pages >= 6 && pages <= 9}">
								      <strong class="text-info">양호</strong>
								      </c:if>
								      <c:if test="${pages >= 10 && pages <= 19}">
								      <strong class="text-warning">나쁨</strong>
								      </c:if>
								      <c:if test="${pages >= 20}">
								      <strong class="text-danger">아주나쁨</strong>
								      </c:if>
                                      </td>
                                    </tr>
                                  </tbody>
                              </table>
                          </div>
                        </div>
                      </div>
                      <!-- Morris chart end -->
                      <!-- List start -->
                              <div class="col-md-12">
                                <div class="card">
                                  <div class="card-header">
                                    <h5>이메일 발송현황</h5>
                                  </div>
                                  <div class="card-block table-border-style">
                                    <div class="table-responsive">
                                      <table class="table table-bordered table-sm">
                                      <c:if test="${empty mailList}">
                                     <tbody>
                                     <tr>
                                     <td align="center"><h5>발송된 메일이 없습니다.</h5></td>
                                     </tr>
                                     </tbody>
                                     </c:if>
                                     <c:if test="${!empty mailList}">
                                        <thead>
                                            <tr align="center">
                                              <th width="10%">발송일</th>
                                              <th width="30%">메일제목</th>
                                              <th width="3%">발송건</th>
                                              <th width="3%">성공건</th>
                                              <th width="3%">실패건</th>
                                              <th width="5%">기사매칭건</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${mailList}" var="mvo" varStatus="index">
                                          <tr>
                                            <th>
                                            <fmt:formatDate value="${mvo.m_regdate}" type="DATE" pattern="yyyy-MM-dd HH:mm:ss" />
                                            </th>
                                            <td>
                                            ${mvo.m_subject}
                                            </td>
                                            <td>
                                            <fmt:formatNumber value="${mvo.sendCount}" pattern="#,##0" />회
                                            </td>
                                            <td>
                                            <fmt:formatNumber value="${mvo.success}" pattern="#,##0" />회
                                            </td>
                                            <td>
                                            <fmt:formatNumber value="${mvo.fail}" pattern="#,##0" />회
                                            </td>
                                            <td>
                                            ${mvo.total}건
                                            </td>
                                          </tr>
                                        </c:forEach>
                                        </tbody>
                                        </c:if>
                                      </table>
                                      </div>
                                      </div>
                                      </div>
                                      </div>
                                      </div>
                                      </div>
                      <%-- <div class="col-md-6">
                        <div class="card">
                          <div class="card-header">
                            <div class="card-header-right">
                                <i class="icofont icofont-rounded-down"></i>
                            </div>
                          </div>
                          <div class="card-block table-border-style">
                            <div class="table-responsive">
                              <table class="table table-bordered">
                                <thead>
                                  <tr>
                                    <th width="30%">분류</th>
                                    <th>검출량</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <th scope="row">기사글</th>
                                    <td><fmt:formatNumber value="${mediaTotalcnt}" groupingUsed="true"/>건</td>
                                  </tr>
                                  <tr>
                                    <th scope="row">댓글</th>
                                    <td><fmt:formatNumber value="${replyTotalcnt}" groupingUsed="true"/>건</td>
                                  </tr>
                                  <tr>
                                    <th scope="row">SNS</th>
                                    <td><fmt:formatNumber value="${snsTotalcount}" groupingUsed="true"/>건</td>
                                  </tr>
                                  <tr>
                                    <th scope="row">Naver평점</th>
                                    <td><fmt:formatNumber value="${scoreTotalcnt}" groupingUsed="true"/>건</td>
                                  </tr>
                                  <tr class="bg-inverse">
                                    <th scope="row">합계</th>
                                    <td><fmt:formatNumber value="${mediaTotalcnt + replyTotalcnt
                                    	+ snsTotalcount + scoreTotalcnt}" groupingUsed="true"/>건</td>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="card">
                          <div class="card-header">
                            <h5>분류글 현황</h5>
                            <div class="card-header-right">
                              <i class="icofont icofont-rounded-down"></i>
                            </div>
                          </div>
                          <div class="card-block table-border-style">
                            <div class="table-responsive">
                              <table class="table table-bordered">
                                  <thead>
                                    <tr>
                                      <th>검출</th>
                                      <th>나쁜글</th>
                                      <th>상태</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td><fmt:formatNumber value="${mediaTextcnt + portalTextcnt + communityTextcnt}" groupingUsed="true"/>건</td>
                                      <td>
                                      <fmt:formatNumber value="${mediaTextcnt2 + portalTextcnt2 + communityTextcnt2}" groupingUsed="true"/>건
                                      (
                                      <fmt:parseNumber var="pages" integerOnly="true" value="${(mediaTextcnt2 + portalTextcnt2 + communityTextcnt2)/(mediaTextcnt + portalTextcnt + communityTextcnt) * 100}"></fmt:parseNumber>${pages}%
                                      )
                                      </td>
                                      <td>
                                      <c:if test="${pages <= 1}">
								      <strong class="text-success">아주좋음</strong>
								      </c:if>
								      <c:if test="${pages >= 2 && pages <= 5}">
								      <strong class="text-primary">좋음</strong>
								      </c:if>
								      <c:if test="${pages >= 6 && pages <= 9}">
								      <strong class="text-info">양호</strong>
								      </c:if>
								      <c:if test="${pages >= 10 && pages <= 19}">
								      <strong class="text-warning">나쁨</strong>
								      </c:if>
								      <c:if test="${pages >= 20}">
								      <strong class="text-danger">아주나쁨</strong>
								      </c:if>
                                      </td>
                                    </tr>
                                  </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
                      </div> --%>
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
  <!-- modernizr js사 -->
  <script type="text/javascript" src="../bower_components/modernizr/modernizr.js"></script>
  <script type="text/javascript" src="../bower_components/modernizr/feature-detects/css-scrollbars.js"></script>
  <!-- classie js -->
  <script type="text/javascript" src="../bower_components/classie/classie.js"></script>
  <!-- calendar -->
  <script type="text/javascript" src="../assets/pages/dashboard/pgcalendar/calendar.js"></script>
  <!-- Morris Chart js -->
  <script src="../bower_components/raphael/raphael.min.js"></script>
  <script src="../bower_components/morris.js/morris.js"></script>
  <!-- i18next.min.js -->
  <script type="text/javascript" src="../bower_components/i18next/i18next.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-xhr-backend/i18nextXHRBackend.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-browser-languagedetector/i18nextBrowserLanguageDetector.min.js"></script>
  <script type="text/javascript" src="../bower_components/jquery-i18next/jquery-i18next.min.js"></script>
  <!-- Custom js -->
  <script type="text/javascript" src="../assets/pages/dashboard/custom-dashboard.js"></script>
  <script type="text/javascript" src="../assets/js/script.js"></script>
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



		var companyOption = decodeURI(window.location.href.split("company=")[1]).split("&")[0];
		console.log("companyOption: " + companyOption);

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


		var keywordOption = decodeURI(window.location.href.split("selectKey=")[1]).split("&")[0];
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

			searchList2();

			//searchList();
		});

		// allBtn 클릭시
		  $(".radiosBtn").on("click", function(event){
			  console.log(event);

			  var input = event.target.id;

			  var btnNum = input.substr(6);

			  var $trList = $(".trList");

			  for(var i = 0; i < $trList.length; i++){
				  $('#state'+ btnNum + (i+1))[0].checked = true;
			  }

		  });

		// 일괄처리버튼 클릭시
		 $(document).on("click","#insertAllBtn",function(){
			insertAll();
		 });


	  // 삭제버튼 클릭시
	  $(document).on("click",".alert-confirm1",function(event){
			swal({
						title: "삭제처리 하시겠습니까?",
						text: "바로 삭제처리 됩니다.",
						type: "warning",
						showCancelButton: true,
						confirmButtonClass: "btn-danger",
						confirmButtonText: "YES",
						closeOnConfirm: false
					},
					function(){

						var parent = event.target.parentNode;
						if(parent.type == 'submit'){
							console.log("button click...");
							parent = parent.parentNode;
						}

						var tr = parent.parentNode;
						console.log(tr);

						var idx = tr.children[0].value;
						console.log(tr.children);

						console.log("idx:" + idx);

						$.ajax({

							  type: "POST",
							  url: "remove",
							  data: {idx: idx},
							  dataType: "json",
							  success: function(data){
								  console.log(data);
							  }

						});

						swal("Delete!", "삭제처리가 완료되었습니다.", "success");

						location.reload();
					});
	  			});
	  var selectKey = decodeURI(window.location.href.split("selectKey=")[1]).split("&")[0].split(" ")[0];
	  $.ajax({

	      type : "POST",
		  url : "graph_re",
	 	  dataType : "json",
	 	  data : {success : 'success', selectKey : selectKey},
	  	  success : function(data){

	  		  console.log(data);
	  		var script = "[";


			for(var i = 0; i < data.length; i++){

				script += '{"period":' + '"' + data[i].writeDate + '",'
						+ '"검출량"' + ':' + data[i].type1 + "},";


				if(i == data.length-1){
					script =  script.substr(0, script.length-1);
					script += "]";
				}
			}
			console.log(script);

			// to json
			var jsonScript = JSON.parse(script);

			areaChart(jsonScript);

	  	 }
	});


	  //즉시처리 버튼 클릭시
	  $(document).on("click",".alert-confirm2",function(event){
			swal({
						title: "즉시처리 하시겠습니까?",
						text: "선택된 분류로 즉시처리 됩니다.",
						type: "warning",
						showCancelButton: true,
						confirmButtonClass: "btn-danger",
						confirmButtonText: "YES",
						closeOnConfirm: false
					},
					function(){

						insertType(event);

						swal("Success!", "즉시처리가 완료되었습니다.", "success");

						location.reload();
					});
	  });



	// 상태변경 버튼 클릭시
	  $(document).on("click",".alert-confirm3",function(event){
		  swal({
				title: "상태변경 처리 하시겠습니까?",
				text: "바로 상태변경 됩니다.",
				type: "warning",
				showCancelButton: true,
				confirmButtonClass: "btn-danger",
				confirmButtonText: "YES",
				closeOnConfirm: false
			},
					function(){

						insertState(event);

						swal("Update!", "상태변경 처리가 완료되었습니다.", "success");

						location.reload();
					});
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

	// content 길시에 ...으로 변경
	var $content = $(".text-success");

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

function makeDateFormat(date, index){
		var splitDate = date.split(" - ")[index];
			if(splitDate != undefined){
				var returnDate = splitDate.replace("/", "-").replace("/", "-")
				return returnDate;
			}


	}
	makeDateFormat($("#fromDate").val());

	//list URL 함수
	  function searchList(event) {

	  	self.location = "dashBoard_main?"
	  				  + "&company="
	  				  + $("#selectCompany option:selected").val()
	  				  + "&selectKey="
	  				  + $('#selectKeyword option:selected').val();
	  }

	//list URL 함수
	  function searchList2(event) {

	  	self.location = "dashBoard_re?"
	  				  + "&company="
	  				  + $("#selectCompany option:selected").val()
	  				  + "&selectKey="
	  				  + $('#selectKeyword option:selected').val();
	  }

	  function areaChart(jsonScript) {
			$("#morris-extra-line").empty();
			window.areaChart = Morris.Line({
				element: 'morris-extra-line',
			    data: jsonScript,
			    xkey: 'period',
			    ykeys: ['검출량'],
			    labels: ['검출량'],
			    lineColors: ['#01C0C8'],
			    lineWidth : 3,
			  	hideHover : 'auto'
			    });
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
