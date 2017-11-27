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
  <!-- jquery timepicker css -->
  <link rel="stylesheet" href="../bower_components/jquery-timepicker-1.3.5/jquery.timepicker.min.css">
  <!-- Style.css -->
  <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/pages/viral/css/style.css">
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
          <!-- right menu start -->
          <jsp:include page='../include/side.jsp' />
          <!-- right menu end -->
          <div class="pcoded-content">
            <div class="pcoded-inner-content">
              <div class="main-body">
                <div class="page-wrapper">
                  <div class="page-header">
                    <div class="page-header-title">
                      <h4>바이럴관리</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="dashboard.html">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">바이럴관리</a></li>
                      </ul>
                    </div>
                  </div>
                  <!-- page-body start -->
                  <div class="page-body">
                    <div class="row">
                      <!-- data setting start -->
                      <div class="col-md-6">
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
                      </div>
                      <div class="col-md-6 input-time">
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
                          <div class="input-group float-right date time col-sm-3 p-l-15 p-r-15 m-b-10">
                            <input type="text" id="time" class="timepicker form-control form-control-inverse">
                            <span class="input-group-addon bg-inverse" onclick="$('#time').click();">
                              <span class="icofont icofont-clock-time"></span>
                            </span>
                          </div>

                        </div>
                        <!-- date picker end -->
                      </div>
                      <!-- data setting end -->
                      <div class="col-lg-12">
                        <!-- tab header start -->
                        <div class="tab-header">
                          <ul class="nav nav-tabs nav-vtabs md-tabs tab-timeline" role="tablist" id="mytab">
                            <a class="nav-item" href="viral">
                              <li class="nav-link active">
                                <p>바이럴관리</p>
                                <div class="slide"></div>
                              </li>
                            </a>
                            <a class="nav-item" href="v_blog">
                              <li class="nav-link">
                                <p>블로그관리</p>
                                <div class="slide"></div>
                              </li>
                            </a>
                            <a class="nav-item" href="v_cafe">
                              <li class="nav-link">
                                  <p>카페관리</p>
                                  <div class="slide"></div>
                              </li>
                            </a>
                            <a class="nav-item" href="v_kin">
                              <li class="nav-link">
                                <p>지식인/Tip관리</p>
                                <div class="slide"></div>
                              </li>
                            </a>
                            <a class="nav-item" href="v_web">
                              <li class="nav-link">
                                <p>웹문서관리</p>
                                <div class="slide"></div>
                              </li>
                            </a>
                            <a class="nav-item" href="v_relation">
                              <li class="nav-link">
                                <p>연관검색어관리</p>
                                <div class="slide"></div>
                              </li>
                            </a>
                          </ul>
                        </div>
                        <!-- tab header end -->
                        <!-- tab-content start -->
                        <div class="tab-content">
                          <!-- tab1 main start -->
                          <div class="tab-pane fade show active" id="main" role="tabpanel">
                            <div class="row">
                              <!-- top cards start -->
                              <div class="col-md-6 col-xl-3">
                                <div class="card user-activity-card">
                                  <div class="card-block-big viral-card p-b-20">
                                      <h5>BOLG</h5>
                                      <h3 class="user-number">${nb1 + nb2 + db1 + db2}</h3>
                                      <div class="row">
                                        <div class="col-sm-6">
                                          <p>본사계정</p>
                                          <h6>${nb1 + db1}</h6>
                                        </div>
                                        <div class="col-sm-6">
                                          <p>외부계정</p>
                                          <h6>${nb2 + db2}</h6>
                                        </div>
                                      </div>
                                      <i class="icofont icofont-ui-note link"></i>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6 col-xl-3">
                                <div class="card user-activity-card">
                                  <div class="card-block-big viral-card p-b-20">
                                      <h5>CAFE</h5>
                                      <h3 class="user-number">${nc1+nc2+dc1+dc2}</h3>
                                      <div class="row">
                                        <div class="col-sm-6">
                                          <p>본사계정</p>
                                          <h6>${nc1+dc1}</h6>
                                        </div>
                                        <div class="col-sm-6">
                                          <p>외부계정</p>
                                          <h6>${nc2+dc2}</h6>
                                        </div>
                                      </div>
                                      <i class="icofont icofont-users link"></i>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6 col-xl-3">
                                <div class="card user-activity-card">
                                  <div class="card-block-big viral-card p-b-20">
                                      <h5>지식인 / TIP</h5>
                                      <h3 class="user-number">${nk1+nk2+dk1+dk2}</h3>
                                      <div class="row">
                                        <div class="col-sm-6">
                                          <p>본사계정</p>
                                          <h6>${nk1+dk1}</h6>
                                        </div>
                                        <div class="col-sm-6">
                                          <p>외부계정</p>
                                          <h6>${nk2+dk2}</h6>
                                        </div>
                                      </div>
                                      <i class="icofont icofont-hat-alt link"></i>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6 col-xl-3">
                                <div class="card user-activity-card">
                                  <div class="card-block-big viral-card p-b-20">
                                      <h5>웹문서</h5>
                                      <h3 class="user-number">${nw1+nw2+dw1+dw2}</h3>
                                      <div class="row">
                                        <div class="col-sm-6">
                                          <p>본사계정</p>
                                          <h6>${nw1+dw1}</h6>
                                        </div>
                                        <div class="col-sm-6">
                                          <p>외부계정</p>
                                          <h6>${nw2+dw2}</h6>
                                        </div>
                                      </div>
                                      <i class="icofont icofont-web link"></i>
                                  </div>
                                </div>
                              </div>
                              <!-- top cards end -->
                              <!-- Naver테이블 start-->
                              <div class="col-md-6">
                                <div class="card">
                                  <div class="card-header">
                                    <h5 class="card-header-text">NAVER</h5>
                                    <div class="card-header-right">
                                      <i class="icofont icofont-rounded-down"></i>
                                    </div>
                                  </div>
                                  <div class="card-block table-border-style">
                                    <div class="table-border-style">
                                        <div class="table-responsive">
                                          <table class="table table-styling text-center">
                                            <thead>
                                              <tr>
                                                <th>분류</th>
                                                <th>본사계정</th>
                                                <th>외부계정</th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">블로그</th>
                                                    <td>${nb1}</td>
                                                    <td>${nb2}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">카페</th>
                                                    <td>${nc1}</td>
                                                    <td>${nc2}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">TIP</th>
                                                    <td>${nk1}</td>
                                                    <td>${nk2}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">웹문서</th>
                                                    <td>${nw1}</td>
                                                    <td>${nw2}</td>
                                                </tr>
                                                <tr class="bg-inverse">
                                                    <th scope="row">합계</th>
                                                    <td>${nb1+nc1+nk1+nw1}</td>
                                                    <td>${nb2+nc2+nk2+nw2}</td>
                                                </tr>
                                            </tbody>
                                          </table>
                                        </div>
                                      </div>
                                  </div>
                                </div>
                              </div>
                              <!-- Naver테이블 end-->
                              <!-- daum테이블 start-->
                              <div class="col-md-6">
                                <div class="card">
                                  <div class="card-header">
                                    <h5 class="card-header-text">DAUM</h5>
                                    <div class="card-header-right">
                                      <i class="icofont icofont-rounded-down"></i>
                                    </div>
                                  </div>
                                  <div class="card-block table-border-style">
                                    <div class="table-border-style">
                                        <div class="table-responsive">
                                          <table class="table table-styling text-center">
                                            <thead>
                                              <tr>
                                                <th>분류</th>
                                                <th>본사계정</th>
                                                <th>외부계정</th>
                                              </tr>
                                            </thead>
                                            <tbody>
                                               <tr>
                                                    <th scope="row">블로그</th>
                                                    <td>${db1}</td>
                                                    <td>${db2}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">카페</th>
                                                    <td>${dc1}</td>
                                                    <td>${dc2}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">TIP</th>
                                                    <td>${dk1}</td>
                                                    <td>${dk2}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">웹문서</th>
                                                    <td>${dw1}</td>
                                                    <td>${dw2}</td>
                                                </tr>
                                                <tr class="bg-inverse">
                                                    <th scope="row">합계</th>
                                                    <td>${db1+dc1+dk1+dw1}</td>
                                                    <td>${db2+dc2+dk2+dw2}</td>
                                                </tr>
                                            </tbody>
                                          </table>
                                        </div>
                                      </div>
                                  </div>
                                </div>
                              </div>
                              <!-- daum테이블 end-->
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
  <!-- jquery timepicker js -->
  <script src="../bower_components/jquery-timepicker-1.3.5/jquery.timepicker.min.js"></script>
  <!-- modernizr js -->
  <script type="text/javascript" src="../bower_components/modernizr/modernizr.js"></script>
  <script type="text/javascript" src="../bower_components/modernizr/feature-detects/css-scrollbars.js"></script>
  <!-- classie js -->
  <script type="text/javascript" src="../bower_components/classie/classie.js"></script>
  <!-- Morris Chart js -->
  <script src="../bower_components/raphael/raphael.min.js"></script>
  <script src="../bower_components/morris.js/morris.js"></script>
  <!-- i18next.min.js -->
  <script type="text/javascript" src="../bower_components/i18next/i18next.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-xhr-backend/i18nextXHRBackend.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-browser-languagedetector/i18nextBrowserLanguageDetector.min.js"></script>
  <script type="text/javascript" src="../bower_components/jquery-i18next/jquery-i18next.min.js"></script>
  <!-- Custom js -->
  <script type="text/javascript" src="../assets/js/script.js"></script>
  <script type="text/javascript" src="../assets/pages/viral/script.js"></script>
  <script src="../assets/pages/picker.js"></script>
  <script src="../assets/js/pcoded.min.js"></script>
  <script src="../assets/js/demo-12.js"></script>
  <script src="../assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
  <script src="../assets/js/jquery.mousewheel.min.js"></script>
</body>

<script type="text/javascript">

	$(document).ready(function(){
		

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

			self.location = "viral?"+ "company=" + $("#selectCompany option:selected").val();
			
		});
		

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


		// 키워드 선택시
		$selectKeyword.change(function(){
			console.log("selectKeyword clicked....");
			console.log($('#selectKeyword option:selected').val());
			
			self.location = "viral?"
							+ "company=" + $("#selectCompany option:selected").val()
							+ "&selectKey=" + $('#selectKeyword option:selected').val();

		});
		
		// hour 설정
		$time = $("#time");
		
		$time.attr("disabled", true);
		
		
		$(".ui-corner-all").on("click", function(){
			console.log("$time click....");
			
			console.log($("#fromDate").val());
			
			console.log($("#fromDate").val().split(" - ")[0]);
			
			console.log($time.val().split(" "));
			
			
		});
		
		var startDateOption = decodeURI(window.location.href.split("startDate=")[1]).split("&endDate=")[0];
		var endDateOption = decodeURI(window.location.href.split("endDate=")[1]);
		console.log("startDateOption: " + startDateOption);
		console.log("endDateOption: " + endDateOption);
		
		
		
		if(startDateOption == endDateOption){
			console.log("startDate == endDate")
			$time.attr("disabled", false);
		}
		
		if(startDateOption != 'undefined' && endDateOption != 'undefined'
				&& startDateOption != '' && endDateOption != ''){
			
			$("#fromDate").val(startDateOption + " - " + endDateOption);
			
		}else{
			var date = getDate("toDay");
			var startDate = date.startDate;
			var endDate = date.endDate;

			$("#fromDate").val(startDate + " - " + endDate);
			
		}

		
		
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

		var makeQeury = '${pageMaker.makeQuery(1)}'.slice(0, -2);

		self.location = "viral?" 
    					+ "&company=" + $("#selectCompany option:selected").val()
						+ "&selectKey=" + $('#selectKeyword option:selected').val()
    					+ "&startDate=" + makeDateFormat($("#fromDate").val(), 0)
    					+ "&endDate=" +  makeDateFormat($("#fromDate").val(), 1)
	 	}
  
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
