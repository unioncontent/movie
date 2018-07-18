<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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
  <!-- sweet alert framework -->
  <link rel="stylesheet" type="text/css" href="../bower_components/sweetalert/dist/sweetalert.css">
  <!-- animation nifty modal window effects css -->
  <link rel="stylesheet" type="text/css" href="../assets/css/component.css">
  <!-- Menu-Search css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/menu-search/css/component.css">
  <!-- Horizontal-Timeline css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/dashboard/horizontal-timeline/css/style.css">
  <!-- Date-range picker css  -->
  <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- Nvd3 chart css -->
  <link rel="stylesheet" href="../bower_components/nvd3/build/nv.d3.css" type="text/css" media="all">
  <!-- Style.css -->
  <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/picker.css">
  <link rel="stylesheet" type="text/css" href="../assets/pages/keyword/css/style.css">
  <!--color css-->
  <link rel="stylesheet" type="text/css" href="../assets/css/color/color-1.css" id="color" />
  <link rel="stylesheet" type="text/css" href="../assets/css/linearicons.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/simple-line-icons.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/ionicons.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/jquery.mCustomScrollbar.css">
  <link href="../assets/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
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
                      <h4>보고서 작성</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="../dashBoard/dashBoard_main">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">보고서작성</a>
                      </ul>
                    </div>
                  </div>
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
                      <div class="col-md-12">
                        <div class="card">
                          <div class="card-block">
                            <form action="insertIssue">
                            <%-- <h3>${selectKey}</h3> --%>
                            <div class="row">
                                <label class="col-sm-2"></label>
                                <div class="col-sm-12">
                                <c:if test="${selectKey != null}">
                                    <!-- <button id="alert-check" class="btn btn-primary alert-check f-right p-r-5 p-l-5 m-l-15 m-b-10" ><i class="icofont icofont-ui-check"></i>등록</button> -->
                                    <input type='text' class='datepicker-here form-control m-r-10 m-b-10 f-left' data-language='en' id='writeDate' style="width: 105px" placeholder="보고날짜" name="writeDate" autocomplete="off"/>
                                    <input type="hidden" value="${company}" name="company">
                              	  	<input type="hidden" value="${selectKey}" name="selectKey">
                                 </c:if>
                                </div>
                              </div>
                            <c:forEach items="${getKeyword}" var = "Keyword" varStatus="index">
                              <div class="form-group row">

                              <div class="col-sm-5">
                              	  <input type="hidden" value="${company}" name="company_name">
                              	  <input type="hidden" value="${selectKey}" name="title_key">
                                  <input type="text" id="keyword" name="keyword" size="15px" style="border: 0px" value="${Keyword.keyword}" readonly="readonly">
                                  <textarea class="form-control" rows="3" cols="50" id="issue_content" name="issue_content" autocomplete="off" style="min-width: 200px;"></textarea>
                                  <!-- <input type="text" class="form-control" id="issue_content" name="issue_content" autocomplete="off" style="min-width: 200px;"> -->
                                  <%-- <input type="hidden" value="${company}" name="writeDate"> --%>
                                  </div>
                              </div>
                              </c:forEach>
                              <div class="row">
                                <label class="col-sm-2"></label>
                                <div class="col-sm-12" style="margin-bottom: 20px;">
                                <c:if test="${selectKey == null}">
                                    <h5><font style="font-weight: bold; color: black;">키워드를 선택해주세요.</font></h5>
                                 </c:if>
                                <c:if test="${selectKey != null}">
                                    <!-- <button id="alert-check" class="btn btn-primary alert-check f-right p-r-5 p-l-5 m-l-15 m-b-10" ><i class="icofont icofont-ui-check"></i>등록</button> -->
                                    <input type="submit" value="등록" class="submit btn btn-primary m-b-0">
                                 </c:if>
                                </div>
                              </div>
                            </form>
                          </div>
                        </div>
                      </div>
                      <!-- <div class="col-md-6 keywordResult">
                          <div class="card">
                            <div class="card-block">
                              <div class="table-responsive">
                                <table class="table table-bordered">
                                  <thead>
                                    <tr>
                                      <th class="tabledit-view-mode"></th>
                                      <th class="tabledit-view-mode">검색어</th>
                                      <th class="tabledit-view-mode">제외검색어</th>
                                      <th class="tabledit-view-mode">영화구분</th>
                                      <th class="tabledit-view-mode">작업</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <th scope="row">입력</th>
                                      <td><input type="text" class="form-control"/></td>
                                      <td><input type="text" class="form-control"/></td>
                                      <td>
                                        <div class="form-radio">
                                          <div class="radio radiofill radio-primary radio-inline">
                                            <label>
                                              <input type="radio" name="member" value="free" data-bv-field="member">
                                              <i class="helper"></i>영화
                                            </label>
                                          </div>
                                          <div class="radio radiofill radio-primary radio-inline">
                                            <label>
                                              <input type="radio" name="member" value="personal" data-bv-field="member">
                                              <i class="helper"></i>배우
                                            </label>
                                          </div>
                                          <div class="radio radiofill radio-primary radio-inline">
                                            <label>
                                              <input type="radio" name="member" value="personal" data-bv-field="member">
                                              <i class="helper"></i>기타
                                            </label>
                                          </div>
                                        </div>
                                      </td>
                                      <td><button class="btn btn-success btn-sm"><i class="icofont icofont-plus"style="margin-right:0"></i></button></td>
                                      <td><button class="btn btn-primary"> <i class="icofont icofont-plus" style="margin-right:0"></i></button></td>
                                    </tr>
                                    <tr>
                                      <th scope="row">1</th>
                                      <td>산양산삼</td>
                                      <td></td>
                                      <td></td>
                                      <td><button class="btn btn-danger btn-sm"><i class="icofont icofont-garbage" style="margin-right:0"></i></button></td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                          </div>
                        </div> -->
                    </div>
                  </div>
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
  <script src="../assets/dist/js/datepicker.min.js"></script>
  <script src="../assets/dist/js/i18n/datepicker.en.js"></script>
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

					script += '{"period":' + '"' + data[i].writeDate + '",'
							+ '"l1"' + ':' + data[i].type1 + "},";


					if(i == data.length-1){
						script =  script.substr(0, script.length-1);
						script += "]";
					}
				}
				console.log(script);

				// to json
				var jsonScript = JSON.parse(script);

				drawChart(jsonScript);

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

		/* //등록 확인메시지
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
	  }); */

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


/* var title_key = $('input[name=title_key]').val();
var keyword = $('input[name=keyword]').val();
var issue_content = $('input[name=issue_content]').val();

function checkList(event) {
		  $.ajax({
				type : "POST",
				url : "insertIssue",
				data : {title_key : title_key, keyword : keyword, issue_content : issue_content},
				contentType:"application/x-www-form-urlencoded;charset=utf-8", //한글 깨짐 방지
				cache: false,
				success : function(data) {
				console.log(data);
				}

			});

	} */

/* function checkList(event) {

	  $("input[name='title_key']").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
		  $.ajax({
				type : "POST",
				url : "insertIssue",
				data : {title_key : title_key, keyword : keyword, issue_content : issue_content},
				contentType:"application/x-www-form-urlencoded;charset=utf-8", //한글 깨짐 방지
				cache: false,
				success : function(data) {
				console.log(data);
				}

			});

	  });

	} */

function drawChart(jsonScript) {
		$("#line-chart1").empty();
		window.areaChart = Morris.Line({
			element: 'line-chart1',
		    data: jsonScript,
		    xkey: 'period',
		    ykeys: ['l1'],
		    labels: ['기사건수'],
		    lineColors: ['#01C0C8'],
		    lineWidth : 3,
		  	hideHover : 'auto'
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

		self.location = "report_edit?"
					  + "selectKey="
					  + $('#selectKeyword option:selected').val()
					  + "&company="
					  + $("#selectCompany option:selected").val()
					  + "&startDate=" + makeDateFormat($("#fromDate").val(), 0)
					  + "&endDate=" +  makeDateFormat($("#fromDate").val(), 1);
	}


</script>

</html>
