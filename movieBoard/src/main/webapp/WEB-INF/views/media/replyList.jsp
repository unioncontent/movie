<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}"/>

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
  <link rel="stylesheet" type="text/css" href="../assets/pages/sns/css/style.css">
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
                      <h4>언론사 댓글 기사 리스트</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="../dashBoard/dashBoard_main">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">언론사관리</a></li>
                        <li class="breadcrumb-item"><a href="#!">언론사 댓글 기사 리스트</a>
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
                        <select name="select" class="col-md-1 form-control form-control-inverse m-b-10 m-l-0 p-r-5 f-left select-left" id="selectKeyword">
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
                        <!-- tab header end -->
                        <!-- tab-content start -->
                         <div class="tab-content">
                          <!-- tab1 main start -->
                          <div class="tab-pane fade show active" id="main" role="tabpanel">
                            <div class="row">
                              <!-- top cards end -->
                              <!-- list satart -->
                              <div class="col-lg-12">
		                        <div class="card">
		                          <div class="card-header">
		                          <h5 class="card-header-text m-b-5 m-t-5"><font style="font-weight: bold; color: black;">댓글 기사 리스트</font></h5>
		                          <div class="btn-group f-right p-r-0">
		                          	<c:if test="${user.user_name == 'union'}">
	                                  <button type="button" id="allBtn1" class="radiosBtn btn btn-primary btn-outline-primary btn-sm waves-effect waves-light">ON</button>
	                                  <button type="button" id="allBtn2" class="radiosBtn btn btn-primary btn-outline-primary btn-sm waves-effect waves-light">OFF</button>
	                                  <button type="button" id="insertAllBtn" class="alert-confirm btn btn-sm btn-primary waves-effect f-right p-b-10"><i class="icofont icofont-exchange" style="margin: 0px;font-size: 16px;"></i></button>
	                                </c:if>
	                                </div>
                                    </div>
                                    <div class="card-block table-border-style">
                            		<div class="table-responsive">
                                      <table class="table table-bordered table-sm">
                                      <c:if test="${empty newsList}">
	                                    <tbody>
	                                     <tr>
	                                     <td style="vertical-align:middle;" align="center" height="150px"><h5>등록된 기사글이 없습니다.</h5></td>
	                                     </tr>
	                                     </tbody>
	                                    </c:if>
	                                    <c:if test="${!empty newsList}">
                                        <thead>
                                            <tr>
                                              <th width="5%">NO</th>
                                              <th width="5%">회사</th>
                                              <th width="5%">키워드</th>
                                              <th width="30%">기사명 / URL</th>
                                              <th width="7%">댓글수</th>
                                              <th width="7%">추출일/작성일</th>
                                              <th width="5%">타입</th>
                                              <th width="5%">상태</th>
                                              <th width="5%">분류글</th>
                                              <c:if test="${user.user_name == 'union'}">
                                              <th width="7%">분류변경</th>
                                              <th width="7%">상태변경</th>
                                              <th width="10%">분류처리</th>
                                              </c:if>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <c:forEach items="${newsList}" var = "NewsVO" varStatus="index">
                                          <tr class = "trList">
                                          	<c:if test="${NewsVO.news_idx != null}">
                                      			<input type="hidden" id="news_idx" value="${NewsVO.news_idx}">
                                    		</c:if>
                                            <th scope="row">
                                            	${totalCount -index.count +1 -minusCount}
                                            </th>
                                            <td>${NewsVO.company_name}</td>
                                            <td>${NewsVO.keyword}</td>
                                            <td>
                                            	<div class="title-nowrap">
                                            	${NewsVO.media_title} /<br/><a href='${NewsVO.url}' target="_blank">${NewsVO.url}</a>
                                            	</div>
                                            </td>
                                            <td>
                                            	<fmt:formatNumber value="${NewsVO.replycnt}" groupingUsed="true"/>건
                                            </td>
                                            <td>
                                            	<fmt:formatDate value="${NewsVO.createDate}" type="DATE" pattern="yyyy-MM-dd HH:mm:ss" />
                                            	/<br>
                                            	${NewsVO.writeDate}
                                            </td>
                                            <td>${NewsVO.news_type}</td>
                                           		<c:if test="${NewsVO.news_state eq '1'}" >
                                           		<td>
                                           		<font style="color: #1abc9c; font-weight: bold;">ON</font>
                                           		</td>
                                           		</c:if>
                                           		<c:if test="${NewsVO.news_state eq '2'}" >
                                           		<td>
                                           		<font style="color: #e74c3c; font-weight: bold;">OFF</font>
                                           		</td>
                                           		</c:if>
                                           		<td>
                                            	<c:if test="${empty NewsVO.textType}">
			                                         	<i class="icofont icofont-minus"></i>
			                                    </c:if>
                                            		${NewsVO.textType}
                                            	</td>
                                            	<c:if test="${user.user_name == 'union'}">
                                            	<td>
                                            	<div class="radios${index.count}">
			                                        <input type="radio" id="radio1${index.count}" name="radios${index.count}">
			                                        <label for="radio1${index.count}">좋은글</label>
			                                        <input type="radio" id="radio2${index.count}" name="radios${index.count}">
			                                        <label for="radio2${index.count}">나쁜글</label>
			                                        <input type="radio" id="radio3${index.count}" name="radios${index.count}">
			                                        <label for="radio3${index.count}">관심글</label>
			                                        <br/>
			                                        <input type="radio" id="radio4${index.count}" name="radios${index.count}">
			                                        <label for="radio4${index.count}">기타글</label>
			                                        <input type="radio" id="radio5${index.count}" name="radios${index.count}">
			                                        <label for="radio5${index.count}">삭제글</label>
			                                        <input type="radio" id="radio6${index.count}" name="radios${index.count}" checked>
			                                        <label for="radio6${index.count}">미분류</label>
			                                      </div>
	                                            </td>
	                                            <td>
	                                            	<div class="state${index.count}">
			                                        <input type="radio" id="state1${index.count}" name="state${index.count}" value="1" checked>
			                                        <label for="state1${index.count}">ON</label>
			                                        <input type="radio" id="state2${index.count}" name="state${index.count}" value="2">
			                                        <label for="state2${index.count}">OFF</label>
			                                      	</div>
	                                            </td>
		                                    <td>
		                                      <button class="btn btn-list btn-sm alert-confirm1" data-toggle="tooltip" data-placement="top" data-original-title="삭제"><i class="icofont icofont-ui-delete" style="margin-right:0"></i></button>
		                                      <button class="btn btn-list btn-sm alert-confirm2" data-toggle="tooltip" data-placement="top" data-original-title="분류변경"><i class="icofont icofont-ui-check" style="margin-right:0"></i></button>
		                                      <button class="btn btn-list btn-sm alert-confirm3" data-toggle="tooltip" data-placement="top" data-original-title="상태변경"><i class="icofont icofont-ui-laoding" style="margin-right:0"></i></button>
		                                    </td>
		                                    </c:if>
                                          </tr>
                                          </c:forEach>
                                        </tbody>
                                        <tfoot>
                                          <tr>
                                          <c:if test="${user.user_name != 'union'}">
		                                    <td colspan="9">
		                                    </c:if>
		                                  <c:if test="${user.user_name == 'union'}">
		                                    <td colspan="12">
		                                    </c:if>
                                            
                                              <ul class="pagination float-right">
                                                <c:if test="${pageMaker.prev}">
                                              		<li class="page-item">
                                                		  <a class="page-link" href="replyList${pageMaker.makeSearch(pageMaker.startPage - 1) }" aria-label="Previous">&laquo;
                                                  		<span aria-hidden="true"></span>
                                                  		<span class="sr-only">Previous</span>
                                                		  </a>
                                              		</li>
                                        	      </c:if>

                                          		  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                                              		<li class= "${pageMaker.cri.page == idx? 'active':''} page-item">
                                                		  <a class="page-link" href="replyList${pageMaker.makeSearch(idx)}">${idx}</a>
                                              		</li>
                                          		  </c:forEach>

                                          		  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                              		<li class="page-item">
                                              		  <a class="page-link" href="replyList${pageMaker.makeSearch(pageMaker.endPage +1) }" aria-label="Next">&raquo;
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
                                    </div>
                                   </div>
                                  </div>
                                 </div>
                                </div>
                              <!-- list end -->
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

			searchList();

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

      	self.location = "excel?"+  "searchType=" + decodeURI(window.location.href.split("&searchType=")[1]).split("&")[0]
		 	  + "&keyword=" + decodeURI(window.location.href.split("&keyword=")[1]).split("&")[0]
      	  	  + "&company=" + $("#selectCompany option:selected").val()
	          + "&selectKey=" + $('#selectKeyword option:selected').val()
    		  + "&startDate=" + makeDateFormat($("#fromDate").val(), 0)
    		  + "&endDate=" +  makeDateFormat($("#fromDate").val(), 1);


	  		swal("Success!", "엑셀출력 되었습니다.", "success");

      });
	});


}); // end ready...

	function insertType(event) {

		var parent = event.target.parentNode;
		if(parent.type == 'submit'){
			console.log("button click...");
			parent = parent.parentNode;
		}

		var tr = parent.parentNode;
		console.log(tr);

		if (tr.children[0].value != 'undefined') {
			var idx = tr.children[0].value;
			console.log(idx);
		}

		if (tr.children[10].children[0].children != 'undefined') {
			var arr = tr.children[10].children[0].children;
			console.log(arr);
		} else {
			clacInsertData(event);
		}

		for (var i = 0; i < arr.length; i++) {
			console.log(arr[i]);
			if (arr[i].type == "radio") {
				if (arr[i].checked) {
					var textType = arr[i + 1].innerText;

					 $.ajax({
						type : "POST",
						url : "modify",
						data : {
							idx : idx,
							textType : textType
						},
						dataType : "json",
						success : function(data) {
							console.log(data);
						}

					});

					break;
				}
			}

		}
	}
	
	function insertState(event) {

		var parent = event.target.parentNode;
		if(parent.type == 'submit'){
			console.log("button click...");
			parent = parent.parentNode;
		}

		var tr = parent.parentNode;
		console.log(tr);

		if (tr.children[0].value != 'undefined') {
			var idx = tr.children[0].value;
			console.log(idx);
		}

		if (tr.children[11].children[0].children != 'undefined') {
			var arr = tr.children[11].children[0].children;
			console.log(arr);
		} else {
			clacInsertData(event);
		}

		for (var i = 0; i < arr.length; i++) {
			console.log(arr[i]);
			if (arr[i].type == "radio") {
				if (arr[i].checked) {
					var state = arr[i].value;

					 $.ajax({
						type : "POST",
						url : "update",
						data : {
							idx : idx,
							state : state
						},
						dataType : "json",
						success : function(data) {
							console.log(data);
						}

					});

					break;
				}
			}

		}
	}
	
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
					var idx = tr[i].children[0].value;
					var arr = tr[i].children[11].children[0].children;


					for (var l = 0; l < arr.length; l++) {
						if (arr[l].type == "radio") {

							if (arr[l].checked) {
								var state = arr[l].value;

								break;
							}
						}
					}
						$.ajax({
							  type: "POST",
							  url: "allUpdate",
							  data: {idx : idx, state : state},
							  dataType: "json",
							  success: function(data){
								  console.log(data);
							  }

							});
					

				}


				swal("Success!", "일괄처리가 완료되었습니다.", "success");

				location.reload();
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

	//list URL 함수
	  function searchList(event) {

	  	self.location = "replyList?"
	  				  + "&company="
	  				  + $("#selectCompany option:selected").val()
	  				  + "&selectKey="
	  				  + $('#selectKeyword option:selected').val()
	  				  + "&startDate=" + makeDateFormat($("#fromDate").val(), 0)
	  				  + "&endDate=" +  makeDateFormat($("#fromDate").val(), 1);
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