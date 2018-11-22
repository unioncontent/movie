<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<meta name="_csrf_header" content="${_csrf.headerName}" />
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
					<!-- left menu start -->
					<jsp:include page='../include/side.jsp' />
					<!-- left menu end -->
					<div class="pcoded-content">
						<div class="pcoded-inner-content">
							<div class="main-body">
								<div class="page-wrapper">
									<!-- 네이버 관리 start -->
									<div class="page-header">
										<div class="page-header-title">
											<h4>네이버TV연예 영화관리</h4>
										</div>
										<div class="page-header-breadcrumb">
											<ul class="breadcrumb-title">
												<li class="breadcrumb-item"><a href="../dashBoard/dashBoard_main"> <i class="icofont icofont-home"></i>
												</a></li>
												<li class="breadcrumb-item"><a href="#!">포털관리</a></li>
												<li class="breadcrumb-item"><a href="#!">네이버영화관리</a></li>
											</ul>
										</div>
									</div>
									<div class="page-body">
										<!-- data setting start -->
										<div class="row">
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
														<input type="text" id="fromDate" class="form-control form-control-inverse" value="" style="text-align: center;"> <span class="input-group-addon bg-inverse"> <span class="icofont icofont-ui-calendar"></span>
														</span>
													</div>
												</div>
												<!-- date picker end -->
											</div>
										</div>
										<!-- data setting end -->
										<!-- Pc table start -->
										<div class="card">
											<div class="card-header">
												<select id="selectSearchType" name="select" class="col-sm-1 form-control form-control-inverse m-r-5 m-t-5 m-b-5 f-left search-select" style="height:40px;">
													<option id="t" value="t">제목</option>
													<!-- <option id="c" value="c">게시글</option> -->
												</select>
												<div class="col-sm-3 input-group input-group-button input-group-inverse p-l-0 p-r-0  m-r-5 m-t-5 m-b-5 f-left btn-select">
													<input onkeyup="if(event.keyCode == 13){$('#searchBtn').trigger('click');};" id="keywordInput" type="text" class="form-control" placeholder="" style="height:40px;"> <span class="input-group-addon" id="basic-addon1">
														<button id="searchBtn" class=" btn btn-search"><i class="icofont icofont-ui-search"></i></button>
													</span>
												</div>
												<c:if test="${user.user_name == 'union'}">
												<button class="btn btn-warning alert-excel f-right p-r-5 p-l-5 m-r-15 m-t-5 m-b-5">
													<i class="icofont icofont-download-alt"></i>EXCEL
												</button>
												</c:if>
												<c:if test="${user.user_name != 'union'}">
												<button class="btn btn-warning showalert-excel f-right p-r-5 p-l-5 m-r-15 m-t-5 m-b-5">
													<i class="icofont icofont-download-alt"></i>EXCEL
												</button>
												</c:if>
											</div>
											<div class="card-block table-border-style">
												<div class="table-responsive">
													<table class="table table-bordered table-sm">
													<c:if test="${empty movieList}">
				                                    <tbody>
				                                     <tr>
				                                     <td style="vertical-align:middle;" align="center" height="150px"><h5>등록된 게시글이 없습니다.</h5></td>
				                                     </tr>
				                                     </tbody>
				                                    </c:if>
				                                    <c:if test="${!empty movieList}">
														<thead>
															<tr>
																<th>NO</th>
																<th>등록날짜</th>
																<th>제목</th>
																<th>키워드</th>
																<th>언론사</th>
															</tr>
														</thead>
														<tbody>
														<c:if test="${user.user_name == 'union'}">
															<c:forEach items="${movieList}" var="movieList" varStatus="index">
																<tr>
																	<th scope="row">${totalCount -index.count +1 -minusCount}</th>
																	<td>${movieList.writeDate}</td>
																	<td><a href="${movieList.url}" target="_blank">
																			<div class="nobr content">${movieList.NM_title}</div>
																	</a></td>
																	<td>${movieList.keyword}</td>
																	<td>${movieList.writer}</td>
																</tr>
															</c:forEach>
														</c:if>
														<c:if test="${user.user_name != 'union'}">
															<c:forEach items="${showmovieList}" var="movieList" varStatus="index">
																<tr>
																	<th scope="row">${totalCount -index.count +1 -minusCount}</th>
																	<td>${movieList.writeDate}</td>
																	<td><a href="${movieList.url}" target="_blank">
																			<div class="nobr content">${movieList.NM_title}</div>
																	</a></td>
																	<td>${movieList.keyword}</td>
																	<td>${movieList.writer}</td>
																</tr>
															</c:forEach>
														</c:if>
														</tbody>
														<tfoot>
															<tr>
																<td colspan="5">
																	<ul class="pagination float-right">
							                                        	<c:if test="${pageMaker.prev}">
							                                              		<li class="page-item">
							                                                		  <a class="page-link" href="naver_movie${pageMaker.makeSearchMobile(pageMaker.startPage - 1) }" aria-label="Previous">&laquo;
							                                                  		<span aria-hidden="true"></span>
							                                                  		<span class="sr-only">Previous</span>
							                                                		  </a>
							                                              		</li>
							                                        	      </c:if>
							                                          		  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
							                                              		<li class= "${pageMaker.cri.page == idx? 'active':''} page-item">
							                                                		  <a class="page-link" href="naver_movie${pageMaker.makeSearchMobile(idx)}">${idx}</a>
							                                              		</li>
							                                          		  </c:forEach>
							                                          		  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							                                              		<li class="page-item">
							                                              		  <a class="page-link" href="naver_movie${pageMaker.makeSearchMobile(pageMaker.endPage +1) }" aria-label="Next">&raquo;
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
										<!-- Pc table end -->
									</div>
									<!-- 네이버 관리 end -->
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
	<!-- sweet alert js -->
  	<script type="text/javascript" src="../bower_components/sweetalert/dist/sweetalert.min.js"></script>
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
		var keywordOption = decodeURI(window.location.href.split("selectKey=")[1]).split("&")[0];
		console.log("keywordOption: " + keywordOption);
		console.log(decodeURI(window.location.href.split("&")[1]));

		var $selectKeyword = $('#selectKeyword');
		if(keywordOption != 'undefined'){
			for(var i = 0; i < $selectKeyword[0].length; i++ ){
				if($selectKeyword[0][i].value == keywordOption){
					$selectKeyword[0][i].selected = 'selected';
				}
			}
		}
		$selectKeyword[0][0].disabled = true;
		
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

		var startDateOption = decodeURI(window.location.href.split("startDate=")[1]).split("&endDate=")[0];
		var endDateOption = decodeURI(window.location.href.split("endDate=")[1]).split("&")[0];
		
		var sDate = new Date(startDateOption);
		var eDate = new Date(endDateOption);
		
		if(startDateOption != 'undefined' && endDateOption != 'undefined' && startDateOption != '' && endDateOption != ''){
			startDateOption = startDateOption.split(" ")[0];
			endDateOption = endDateOption.split(" ")[0];
			$('#fromDate').data('daterangepicker').setStartDate(sDate);
			$('#fromDate').data('daterangepicker').setEndDate(eDate);
		}
		
		console.log("startDateOption: " + startDateOption);
		console.log("endDateOption: " + endDateOption);
		
		// 키워드 선택시
		$selectKeyword.change(function(){
			console.log("selectKeyword clicked....");
			console.log($('#selectKeyword option:selected').val());

			searchList();

		});
		
		// 검색 클릭시
		$('#searchBtn').on("click", function(event){
		  console.log("searchBtn clicked....");
		  console.log($('#selectSearchType option:selected').val());

		   if($('#keywordInput').val() == ''){
			   swal("warning!", "검색어를 입력해주세요.", "warning");
		  }else{
			  searchList();
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
		
		var keywordInput = decodeURI(window.location.href.split("&keyword=")[1]).split("&")[0]
		console.log(keywordInput);
		if(keywordInput == "undefined"){
			keywordInput = "";
		}
		$('#keywordInput').val(keywordInput);
		
		var selectSearchType = decodeURI(window.location.href.split("&searchType=")[1]).split("&")[0]
		console.log(selectSearchType);
		if(selectSearchType == "undefined"){
			selectSearchType = "t";
		}
		$('#selectSearchType').val(selectSearchType);

	}); // end ready...


	function makeDateFormat(date, index){
		var splitDate = date.split(" - ")[index];
			if(splitDate != undefined){
				var returnDate = splitDate.replace("/", "-").replace("/", "-")
				return returnDate;
			}


	}
	makeDateFormat($("#fromDate").val());

    function searchList(event) {
    	
    	var makeQeury = '${pageMaker.makeQuery(1)}'.slice(0,-2);
    	
		self.location = "naver_movie" + makeQeury + "10"
    					+ "&company=" + $("#selectCompany option:selected").val()
						+ "&selectKey=" + $('#selectKeyword option:selected').val()
						+ "&searchType=" + $("#selectSearchType option:selected").val()
					  	+ "&keyword=" + $('#keywordInput').val()
    					+ "&startDate=" + makeDateFormat($("#fromDate").val(), 0)
    					+ "&endDate=" +  makeDateFormat($("#fromDate").val(), 1)
	 	}
 	// 엑셀 출력
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

        	self.location = "excel?"+
			  + "&company=" + $("#selectCompany option:selected").val()
			  + "searchType=" + decodeURI(window.location.href.split("&searchType=")[1]).split("&")[0]
			  + "&keyword=" + decodeURI(window.location.href.split("&keyword=")[1]).split("&")[0]
			  + "&selectKey=" + $('#selectKeyword option:selected').val()
			  + "&startDate=" + makeDateFormat($("#fromDate").val(), 0)
			  + "&endDate=" + makeDateFormat($("#fromDate").val(), 1)
			  + "&portal_type=" + "movie";


	  		swal("Success!", "엑셀출력 되었습니다.", "success");

        });
	}); 
	// show엑셀 출력
	//엑셀출력 확인메시지
	$(document).on("click",".showalert-excel",function(){
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

        	self.location = "excel?"+
			  + "&company=" + $("#selectCompany option:selected").val()
			  + "searchType=" + decodeURI(window.location.href.split("&searchType=")[1]).split("&")[0]
			  + "&keyword=" + decodeURI(window.location.href.split("&keyword=")[1]).split("&")[0]
			  + "&selectKey=" + $('#selectKeyword option:selected').val()
			  + "&startDate=" + makeDateFormat($("#fromDate").val(), 0)
			  + "&endDate=" + makeDateFormat($("#fromDate").val(), 1)
			  + "&portal_type=" + "movies";


	  		swal("Success!", "엑셀출력 되었습니다.", "success");

        });
	}); 
	//날짜 계산 함수
    function getDate(type){
  		console.log("TYPE : " + type);
  		var date = new Date();

   		var month = date.getMonth()+1;
   		 day = date.getDate();
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
