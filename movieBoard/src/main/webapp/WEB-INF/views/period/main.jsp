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
  <!-- Horizontal-Timeline css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/dashboard/horizontal-timeline/css/style.css">
  <!-- Date-range picker css  -->
  <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap-daterangepicker/daterangepicker.css">
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
  .md-tabs li.active p {
  	font-weight: bold;
    color: black;
}
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
                          <!-- tab1 main start -->
                          <div class="tab-pane fade show active" id="main" role="tabpanel">
                            <div class="row">
                              <!-- top cards start -->
                              <div class="col-md-6 col-xl-2 main-card">
                                <div class="card social-widget-card" style="border-top: 0px;">
                                  <div class="card-block-big bg-inverse">
                                    <h3><fmt:formatNumber value="${portalCount+communityCount+snsCount+mediaCount+youtubeCount}" groupingUsed="true"/></h3>
                                    <span class="m-t-10">전체검색</span>
                                    <i class="icofont icofont-search"></i>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6 col-xl-2 main-card">
                                <div class="card social-widget-card" style="border-top: 0px;">
                                  <div class="card-block-big bg-primary">
                                    <h3><fmt:formatNumber value="${portalCount}" groupingUsed="true"/></h3>
                                    <span class="m-t-10">포털검색</span>
                                    <i class="icofont icofont-web"></i>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6 col-xl-2 main-card">
                                <div class="card social-widget-card" style="border-top: 0px;">
                                  <div class="card-block-big bg-success">
                                    <h3><fmt:formatNumber value="${communityCount}" groupingUsed="true"/></h3>
                                    <span class="m-t-10">커뮤니티검색</span>
                                    <i class="icofont icofont-users"></i>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6 col-xl-2 main-card">
                                <div class="card social-widget-card" style="border-top: 0px;">
                                  <div class="card-block-big bg-twitter">
                                    <h3><fmt:formatNumber value="${snsCount + youtubeCount}" groupingUsed="true"/></h3>
                                    <span class="m-t-10">SNS검색</span>
                                    <i class="icofont icofont-social-twitter"></i>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6 col-xl-2 main-card">
                                  <div class="card social-widget-card" style="border-top: 0px;">
                                    <div class="card-block-big bg-news">
                                      <h3><fmt:formatNumber value="${mediaCount}" groupingUsed="true"/></h3>
                                      <span class="m-t-10">언론사검색</span>
                                      <i class="icofont icofont-building-alt"></i>
                                    </div>
                                  </div>
                                </div>
                              <!-- top cards end -->
                              
                              <!-- Morris chart start -->
		                      <!-- <div class="col-lg-12">
		                        <div class="card">
		                          <div class="card-header">
		                            <h5><font style="font-weight: bold; color: black;">
		                            	<i class="icofont icofont-chart-line m-r-5"></i>
		                            	이메일 발송 현황
		                            	</font>
		                            </h5>
		                            <div class="card-header-right">
		                              <i class="icofont icofont-rounded-down"></i>
		                            </div>
		                          </div>
		                          <div class="card-block">
		                            <div id="morris-extra-area" style="height:300px;"></div>
		                            <div id="container" style="height:350px;"></div>
				                	</div>
		                        </div>
		                      </div> -->
		                      <!-- Morris chart end -->
		                      <!-- List start -->
                              <div class="col-md-12">
                                <div class="card">
                                  <div class="card-header">
                                    <h5>
						               <font style="font-weight: bold; color: black;">                     
						                                    이메일 발송현황
                                    </font>
                                    </h5>
                                  </div>
                                  <div class="card-block table-border-style">
                                    <div class="table-responsive">
                                      <table class="table table-bordered table-sm">
                                      <c:if test="${empty mailList}">
                                     <tbody>
                                     <tr>
                                      <td style="vertical-align:middle;" align="center" height="150px"><h5>발송된 메일이 없습니다.</h5></td>
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
                                              <!-- <th width="5%">기사매칭건</th> -->
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${mailList}" var="mvo" varStatus="index">
                                          <tr>
                                            <th style="height: 50px;">
                                            <fmt:formatDate value="${mvo.m_send}" type="DATE" pattern="yyyy-MM-dd HH:mm:ss" />
                                            </th>
                                            <td>
                                            <a href="http://showbox.email/preview?keyword=${mvo.m_keyword_idx}&amp;idx=${mvo.n_idx}" target="_blank">
                                            ${mvo.m_subject}
                                            </a>
                                            </td>
                                            <td>
                                            ${mvo.sendCount}회
                                            </td>
                                            <td>
                                            ${mvo.success}회
                                            </td>
                                            <td>
                                            ${mvo.fail}회
                                            </td>
                                            <%-- <td>
                                            <a href="javascript:popupOpen('<fmt:formatDate value="${mvo.m_send}" type="DATE" pattern="yyyy-MM-dd" />');" >${mvo.total}건</a>      
                                            </td> --%>
                                          </tr>
                                        </c:forEach>
                                        </tbody>
                                        </c:if>
                                      </table>
                                      </div>
                                      </div>
                                      </div>
                                      </div>
		                      <!-- List end -->
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
  <!-- High Chart js -->
  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script src="https://code.highcharts.com/modules/series-label.js"></script>
  <script src="https://code.highcharts.com/modules/exporting.js"></script>
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

//  	ajax 통신 시작시 실행
  $(window).ajaxStart(function() {
  	loading.show();
  });

//  	ajax 통신 종료시 실행
  $(window).ajaxStop(function() {
  	loading.hide();
  });

  $(document).ready(function(){


	
	  var $fromDate = $("#fromDate");
	  
	  var startDateOption = decodeURI(window.location.href.split("startDate=")[1]).split("&")[0];
	  var endDateOption = decodeURI(window.location.href.split("endDate=")[1]).split("&")[0];
	  console.log("startDateOption: " + startDateOption);
	  console.log("endDateOption: " + endDateOption);
		
	  if(startDateOption != 'undefined' && endDateOption != 'undefined'
			&& startDateOption != '' && endDateOption != ''){
		  $fromDate.val(startDateOption + " - " + endDateOption);
	  		
		}

	//ajaxGraph(startDate, endDate);

	// content 길시에 ...으로 변경
	var $title = $(".title");

	var size = 25;

	for (var i =0; i < $title.length; i++){
		if($title[i].innerText.length >= size){
			$title[i].children[0].text = $title[i].innerText.substr(0, size) + '...';
		}
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

	var companyOption = decodeURI(window.location.href.split("company=")[1]).split("&selectKey")[0];


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
	
	/* $.ajax({
			
	      type : "POST",
		  url : "graph_re",
	 	  dataType : "json",
	 	 	data : {success : 'success', part : "main", company : decodeURI(window.location.href.split("company=")[1]).split("&")[0], selectKey : decodeURI(window.location.href.split("selectKey=")[1]).split("&")[0]},
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

			areaChart1(jsonScript, jsonScript2);

	  	 }
	});*/
 
	// 캘린더 클릭시
	$('#fromDate').on('apply.daterangepicker', function(ev, picker) {	
		   var startDate = picker.startDate.format('YYYY-MM-DD');
		   var endDate = picker.endDate.format('YYYY-MM-DD');

		   console.log("startDate: " + startDate);
		   console.log("endDate: " + endDate);

		   searchList();

	});
	
  }); // end ready...
  
  /* function areaChart1(jsonScript,jsonScript2) {
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
		        name: '발송건',
		        data: jsonScript
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
		} */

  function popupOpen(date){
		var company = $("#selectCompany option:selected").val();
		
		var selectKey = $("#selectKeyword option:selected").val();
		
		var popUrl = "period_popUp?part=이메일&company="+company
					+"&selectKey="+selectKey+"&emailDate="+date;	//팝업창에 출력될 페이지 URL

		var popOption = "width=1500, height=900, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

			window.open(popUrl,"",popOption);

		}
  
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

  	self.location = "main?"
  				  + "&company="
  				  + $("#selectCompany option:selected").val()
  				  + "&selectKey="
  				  + $('#selectKeyword option:selected').val()
  				  + "&startDate=" + makeDateFormat($("#fromDate").val(), 0)
  				  + "&endDate=" +  makeDateFormat($("#fromDate").val(), 1);
  }

</script>

</html>
