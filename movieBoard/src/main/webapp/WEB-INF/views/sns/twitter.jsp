<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>OverWare</title>
  <!-- HTML5 Shim and Respond.js IE9 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
  <!-- Meta -->
  <meta name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}"/>
  <meta charset="utf-8">
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
  <!-- Menu-Search css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/menu-search/css/component.css">
  <!-- Horizontal-Timeline css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/dashboard/horizontal-timeline/css/style.css">
  <!-- font awesome -->
  <link rel="stylesheet" type="text/css" href="../assets/icon/font-awesome/css/font-awesome.css">
  <!-- Date-range picker css  -->
  <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- sweet alert framework -->
  <link rel="stylesheet" type="text/css" href="../bower_components/sweetalert/dist/sweetalert.css">
  <!-- Style.css -->
  <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/pages/sns/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/picker.css">
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
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
          <!-- right menu start -->
          <jsp:include page='../include/side.jsp' />
          <!-- right menu end -->
          <div class="pcoded-content">
            <div class="pcoded-inner-content">
              <div class="main-body">
                <div class="page-wrapper">
                  <div class="page-header">
                    <div class="page-header-title">
                      <h4>트위터관리</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="../dashBoard/dashBoard_main">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">SNS관리</a></li>
                        <li class="breadcrumb-item"><a href="#!">트위터관리</a></li>
                      </ul>
                    </div>
                  </div>
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
                      <!-- 그래프 start -->
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            <h5 class="card-header-text">
                            <font style="font-weight: bold; color: black;">
                              <img alt="naver" src="../assets/images/Twitter_logo.png" style="width: 20px; height: 20px;">
                              트위터 그래프
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
                      <!-- 그래프 end -->
                      <!-- table start -->
                      <div class="col-lg-12">
                        <div class="card">
                          <div class="card-header">
                            <select id= "selectPerPageNum" name="select" class="col-sm-1 form-control form-control-inverse m-r-5 m-b-5 m-t-5 p-r-5 f-left list-select" style="height:40px;">
                                  <option id= "10" >10</option>
                                  <option id = "50">50</option>
                                  <option id = "100">100</option>
                                </select>
                                <select id = "selectSearchType" name="select" class="col-sm-1 form-control form-control-inverse m-r-5 m-b-5 m-t-5 f-left search-select" style="height:40px;">
                                  <option id="t" value="t">제목</option>
                                  <option id="c">게시글</option>
                                </select>
                            <div class="col-sm-3 input-group input-group-button input-group-inverse p-l-0 p-r-0 m-b-5 m-t-5 f-left btn-select">
                               <input onkeyup="if(event.keyCode == 13){$('#searchBtn').trigger('click');};"id="keywordInput" type="text" class="form-control" placeholder="" style="height:40px;">
                              <span class="input-group-addon" id="basic-addon1">
                                <button id="searchBtn" class="btn btn-search"><i class="icofont icofont-ui-search"></i></button>
                              </span>
                            </div>
                            <button id="excel" class="btn btn-warning f-right alert-confirm m-t-5"><i class="icofont icofont-download-alt"></i>EXCEL</button>
                          </div>
                          <div class="card-block table-border-style  table-responsive">
                            <table class="table table-bordered table-sm">
                            <c:if test="${empty twitterList}">
	                                    <tbody>
	                                     <tr>
	                                     <td style="vertical-align:middle;" align="center" height="150px"><h5>등록된 게시글이 없습니다.</h5></td>
	                                     </tr>
	                                     </tbody>
	                                    </c:if>
	                                    <c:if test="${!empty twitterList}">
                              <thead>
                                <tr>
                                  <th width="5%">NO</th>
                                  <th width="7%">작성날짜</th>
                                  <th width="5%">키워드</th>
                                  <th width="15%">제목</th>
                                  <th width="5%">글쓴이</th>
                                  <th width="5%">좋아요</th>
                                  <th width="5%">공유</th>
                                  <th width="5%">댓글</th>
                                </tr>
                              </thead>
                              <tbody>
                                <c:forEach items="${twitterList}" var="snsVO" varStatus="index">
                                  <tr>
                                    <th scope="row">${totalCount - minusCount - index.count +1}</th>
                                    <td>${snsVO.writeDate}</td>
                                    <td><div class="keyword-nowrap">${snsVO.keyword}</div></td>
                                    <td><a href="${snsVO.url}" target="_blank">${snsVO.sns_title}</div></td>
                                    <td><div class="writer-nowrap">${snsVO.sns_writer}</div></td>
                                    <td>${snsVO.like_cnt}</td>
                                    <td>${snsVO.share_cnt}</td>
                                    <td>${snsVO.reply_cnt}</td>
                                  </tr>
                                </c:forEach>
                              </tbody>
                              <tfoot>
                                <tr>
                                  <td colspan="8">
                                    <ul class="pagination float-right">
                                      <c:if test="${pageMaker.prev}">
                                        <li class="page-item">
                                          <a class="page-link" href="twitter${pageMaker.makeSearch(pageMaker.startPage - 1) }" aria-label="Previous">&laquo;
                                            <span aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                          </a>
                                        </li>
                                      </c:if>

                                      <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                                        <li class= "${pageMaker.cri.page == idx? 'active':''} page-item">
                                          <a class="page-link" href="twitter${pageMaker.makeSearch(idx)}">${idx}</a>
                                        </li>
                                      </c:forEach>

                                      <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                        <li class="page-item">
                                          <a class="page-link" href="twitter${pageMaker.makeSearch(pageMaker.endPage +1) }" aria-label="Next">&raquo;
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
                      <!-- table end -->
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
  <!-- Bootstrap date-time-picker js -->
  <script type="text/javascript" src="../assets/pages/advance-elements/moment-with-locales.min.js"></script>
  <!-- Date-range picker js -->
  <script type="text/javascript" src="../bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
  <!-- classie js -->
  <script type="text/javascript" src="../bower_components/classie/classie.js"></script>
  <!-- sweet alert js -->
  <script type="text/javascript" src="../bower_components/sweetalert/dist/sweetalert.min.js"></script>
  <script type="text/javascript" src="../assets/pages/sns/script.js"></script>
  <!-- Morris Chart js -->
  <script src="../bower_components/raphael/raphael.min.js"></script>
  <script src="../bower_components/morris.js/morris.js"></script>
  <!-- High Chart js -->
  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script src="https://code.highcharts.com/modules/series-label.js"></script>
  <script src="https://code.highcharts.com/modules/exporting.js"></script>
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
  <script src="../assets/pages/sns/script.js"></script>
  <script src="../assets/pages/picker.js"></script>
</body>
</html>

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

		//content 길시에 ...으로 변경
		var $content = $(".text-success");
		
		var size = 25;
		
		for (var i =1; i < $content.length; i++){
			if($content[i].innerText.length >= size){
				$content[i].textContent = $content[i].innerText.substr(0, size) + '...';
			}
		}
		
		//당일 클릭시
		$('#toDay').on("click", function(){
		console.log("toDay clicked....");
		var date = getDate("toDay");
		var startDate = date.startDate;
		var endDate = date.endDate;
		
		$("#fromDate").val(endDate + " - " + endDate)
		console.log($("#fromDate").val());
		searchList(); 
		});
		
		//전일 클릭시
		$('#yesterDay').on("click", function(){
		console.log("yesterDay clicked....");
		var date = getDate("yesterDay");
		var startDate = date.startDate;
		var endDate = date.endDate;
		
		$("#fromDate").val(startDate + " - " + endDate)
		console.log($("#fromDate").val());
		searchList();
		});
		
		//7일  클릭시
		$('#week').on("click", function(){
		console.log("week clicked....");
		var date = getDate("week");
		var startDate = date.startDate;
		var endDate = date.endDate;
		
		$("#fromDate").val(startDate + " - " + endDate)
		console.log($("#fromDate").val());
		searchList();
		})
		
		//30일 클릭시
		$('#month').on("click", function(){
		console.log("month clicked....");
		var date = getDate("month");
		var startDate = date.startDate;
		var endDate = date.endDate;
		
		$("#fromDate").val(startDate + " - " + endDate)
		console.log($("#fromDate").val());
		
		searchList();
		
		})

	//캘린더 클릭시..
	$('#fromDate').on('apply.daterangepicker', function(ev, picker) {
		   var startDate = picker.startDate.format('YYYY-MM-DD');
		   var endDate = picker.endDate.format('YYYY-MM-DD');

		   console.log("startDate: " + startDate);
		   console.log("endDate: " + endDate);

		   searchList();
	});


	// 엑셀 출력시
	$(document).on("click","#excel",function(){
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

	        	console.log("엑셀출력한다?");

	        	self.location = "excel?"
	        		  +"searchType=" + decodeURI(window.location.href.split("&searchType=")[1]).split("&")[0]
			 		  + "&keyword=" + decodeURI(window.location.href.split("&keyword=")[1]).split("&")[0]
					  + "&selectKey="
					  + $('#selectKeyword option:selected').val()
					  + "&company="
					  + $("#selectCompany option:selected").val()
					  + "&startDate=" + makeDateFormat($("#fromDate").val(), 0)
					  + "&endDate=" +  makeDateFormat($("#fromDate").val(), 1)
					  + "&portal_name=twitter";

		  		swal("Success!", "엑셀출력 되었습니다.", "success");

	        });
		});
	
	var selectKey = decodeURI(window.location.href.split("selectKey=")[1]).split("&")[0];
	if(selectKey == 'undefined'){
			var selectKey = '키워드'
	}
	var company = decodeURI(window.location.href.split("company=")[1]).split("&")[0];
	if(company == 'undefined'){
		var company = '회사'
	}
	$.ajax({

	      type : "POST",
		  url : "graph",
		  dataType : "json",
	 	  data : {success : 'success', portal_name : "twitter", company : company, selectKey : selectKey},
	 	  success : function(data){
	  		  console.log(data);
			
	  		var script = "[";

			for(var i = 0; i < data.length; i++){

				script += data[i].likeCount + ",";


				if(i == data.length-1){
					script =  script.substr(0, script.length-1);
					script += "]";
				}
			}
			
			var script2 = "[";


			for(var i = 0; i < data.length; i++){

				script2 += data[i].shareCount + ",";

				if(i == data.length-1){
					script2 =  script2.substr(0, script2.length-1);
					script2 += "]";
	  		
				}
			}
			
			var script3 = "[";


			for(var i = 0; i < data.length; i++){

				script3 += data[i].replyCount + ",";

				if(i == data.length-1){
					script3 =  script3.substr(0, script3.length-1);
					script3 += "]";
	  		
				}
			}
			
			var script4 = "[";


			for(var i = 0; i < data.length; i++){

				script4 += '"' + data[i].writeDate + '",';

				if(i == data.length-1){
					script4 =  script4.substr(0, script4.length-1);
					script4 += "]";
	  		
				}
			}

			// to json
			var jsonScript = JSON.parse(script);
			var jsonScript2 = JSON.parse(script2);
			var jsonScript3 = JSON.parse(script3);
			var jsonScript4 = JSON.parse(script4);
			
			console.log(jsonScript);
			console.log(jsonScript2);
			console.log(jsonScript3);
			console.log(jsonScript4);
			
			areaChart(jsonScript, jsonScript2, jsonScript3, jsonScript4);
			
	  	 }
	});


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

	


}); // end ready....


//그래프 함수
function areaChart(jsonScript,jsonScript2,jsonScript3,jsonScript4) {
	Highcharts.setOptions({
		lang: {
			thousandsSep: ','
		}
	});
	Highcharts.chart('container', {
		chart: {
			type: 'spline'
		},
		title: {
			text: ''
		},
		subtitle: {
			text: ''
		},
		xAxis: {
			categories: jsonScript4
		},
		yAxis: {
		    title: {
		      text: ''
		    }
		  },
		  tooltip: {
		    crosshairs: true,
		    shared: true
		  },
		  plotOptions: {
		    spline: {
		      marker: {
		        radius: 4,
		        lineColor: '#666666',
		        lineWidth: 1
		      }
		    }
		  },
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
		    series: [{
	        name: '좋아요',
	        data: jsonScript,
	        color: '#fb9678'
	    },{
	        name: '공유',
	        data: jsonScript2,
	        color: '#7E81CB'
	    },{
	        name: '댓글',
	        data: jsonScript3,
	        color: '#01C0C8'
	    },]
		});
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
makeDateFormat($("#fromDate").val());

//list URL 함수
function searchList(event) {

	var makeQeury = '${pageMaker.makeQuery(1)}'.slice(0,-2);

	self.location = "twitter"
				  + makeQeury
				  + $('#selectPerPageNum option:selected').val()
				  + "&searchType="
				  + $("#selectSearchType option:selected").val()
				  + "&keyword="
				  + $('#keywordInput').val()
				  + "&selectKey="
				  + $('#selectKeyword option:selected').val()
				  + "&company="
				  + $("#selectCompany option:selected").val()
				  + "&startDate=" + makeDateFormat($("#fromDate").val(), 0)
				  + "&endDate=" +  makeDateFormat($("#fromDate").val(), 1);
}


</script>
