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
  <!-- sweet alert framework -->
  <link rel="stylesheet" type="text/css" href="../bower_components/sweetalert/dist/sweetalert.css">
  <!-- font awesome -->
  <link rel="stylesheet" type="text/css" href="../assets/icon/font-awesome/css/font-awesome.css">
  <!-- Date-range picker css  -->
  <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- jquery timepicker css -->
  <link rel="stylesheet" href="../bower_components/jquery-timepicker-1.3.5/jquery.timepicker.min.css">
  <!-- Redial css -->
  <link rel="stylesheet" href="../assets/pages/chart/radial/css/radial.css" type="text/css" media="all">
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
                      <!-- <h4>Naver Movie</h4> -->
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="../dashBoard/dashBoard">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="http://localhost:8080/marketing/n_channel">마케팅 채널관리</a></li>
                        <li class="breadcrumb-item"><a href="http://localhost:8080/marketing/n_channel">Naver Movie</a></li>
                      </ul>
                    </div>
                  </div>
                  <!-- page-body start -->
                  <div class="page-body">
                    <div class="row">
                              <div class="col-md-12">
                                <div class="card">
                                  <div class="card-header">
                                    <h5>Naver Movie</h5>
                                    <div class="col-sm-3 input-group input-group-button input-group-inverse" style="float: right; margin-right: 280px;">
                                    <input type='text' class='datepicker-here form-control f-right p-r-5 p-l-5 m-l-15 m-b-10' data-language='en' id='startdate' style="width: 130px" placeholder="Date"/>
	                              	&nbsp;&nbsp;&nbsp;<font size="3"><b>~</b></font>
	                              	<input type='text' class='datepicker-here form-control f-right p-r-5 p-l-5 m-l-15 m-b-10' data-language='en' id='enddate' style="width: 130px" placeholder="Date"/>
	                              	<input onkeyup="if(event.keyCode == 13){$('#searchBtn').trigger('click');};" id="keywordInput" type="text" class="form-control  f-right p-r-5 p-l-5 m-l-15 m-b-10" placeholder=""  style="width: 200px">
	                              <span class="input-group-addon" id="basic-addon1">
	                              	<button id="searchBtn" class="btn btn-inverse"><i class="icofont icofont-search-alt-2"></i></button>
	                              </span>
	                              </div>
                                  </div>
                                  <div class="card-block table-border-style">
                                    <div class="table-responsive">
                                      <table class="table table-styling table-checkbox">
                                        <thead>
                                          <tr>
                                          	<th width="3%">NO</th>
                                            <th width="10%">날짜</th>
                                            <th width="3%">조회수</th>
                                            <th width="30%">제목</th>
                                            <th width="5%"></th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <c:forEach items="${nVList}" var="nV" varStatus="index">
                                          <tr>
                                          	<th>${totalCount - minusCount - index.count + 1}</th>
                                            <td>
                                            ${nV.writeDate}
                                            <input type="hidden" value="${nV.url}" name="url">
                                            </td>
                                            <td>
                                            <fmt:formatNumber value="${nV.view_cnt}" pattern="#,##0" />회
                                            </td>
                                            <td>
                                            <a href='${nV.url}' target="_blank">${nV.portal_title}</a>
                                            <input type="hidden" value="${nV.portal_title}" name="sns_content">
                                            </td>
                                            <td>
                                            <button type="button" class="list-button btn btn-primary waves-effect waves-light" style="margin-right: 5px;" data-toggle="tooltip" data-placement="top" data-original-title="리스트">
                                            <i class="icofont icofont-ui-note"></i>리스트
                                            </button>
		    								</td>
                                          </tr>
                                          </c:forEach>
                                        </tbody>
                                        <tfoot>
                                          <tr>
                                            <td colspan="5">
                                               <ul class="pagination float-right">
	        					                   <c:if test="${pageMaker.prev}">
		        					                   <li class="page-item">
			        					                   <a class="page-link" href="n_channel${pageMaker.makeSearch(pageMaker.startPage - 1) }" aria-label="Previous">&laquo;
				        					               <span aria-hidden="true"></span>
				        					               <span class="sr-only">Previous</span>
			        					                   </a>
		        					                   </li>
	        					                   </c:if>
        					                   <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	        					                   <li class= "${pageMaker.cri.page == idx? 'active':''} page-item">
	        					                   	<a class="page-link" href="n_channel${pageMaker.makeSearch(idx)}">${idx}</a>
	        					                   </li>
        					                   </c:forEach>
        					                   <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	        					                   <li class="page-item">
		        					                   <a class="page-link" href="n_channel${pageMaker.makeSearch(pageMaker.endPage +1) }" aria-label="Next">&raquo;
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
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- page-body end -->
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
  <script src="../assets/dist/js/datepicker.min.js"></script>
  <script src="../assets/dist/js/i18n/datepicker.en.js"></script>                       
</body>
<script type="text/javascript">

	$(document).ready(function(){

		// title 길시에 ...으로 변경
		var $content = $(".title_score");

		var size = 25;

		for (var i =0; i < $content.length; i++){
			if($content[i].innerText.length >= size){
				$content[i].textContent = $content[i].innerText.substr(0, size) + '...';
			}
		}

		var $fromDate = $("#fromDate");

		var startDateOption = decodeURI(window.location.href.split("startDate=")[1]).split("&")[0].split(" ")[0];
		var endDateOption = decodeURI(window.location.href.split("endDate=")[1]).split("&")[0].split(" ")[0];
		console.log("startDateOption: " + startDateOption);
		console.log("endDateOption: " + endDateOption);

		if(startDateOption != 'undefined' && endDateOption != 'undefined'
				&& startDateOption != '' && endDateOption != ''){

			$fromDate.val(startDateOption + " - " + endDateOption);
		}
		
		// 리스트 버튼 클릭
		$(".list-button").on("click", function(event){
			var parent = event.target.parentNode;

			if(parent.type == 'button'){
				console.log("button click...");
				parent = parent.parentNode;
			}

			var tr = parent.parentNode;
			console.log(tr); 
			
			var td1 = tr.children[1];
			console.log(td1);
			
			var td2 = tr.children[3];
			console.log(td2);
			
			
			var url = td1.children[0].value;
			var content = td2.children[1].value;
			
			console.log("url:" + url, "content:" + content);
			
			self.location = "n_list?url=" + url + "&content=" + content;

		});
		
		// 검색버튼 클릭시
		$('#searchBtn').on("click", function(event){
		  console.log("searchBtn clicked....");
		
		  searchList();
		  
		});

	}); // end ready...


	function searchList() {

		var makeQeury = '${pageMaker.makeQuery(1)}'.slice(0,-2);

		console.log(makeQeury);

    	self.location = "n_channel"
    						+ makeQeury + '10'
    						+ "&keyword=" + $('#keywordInput').val()
    						+ "&startDate=" + makeDateFormat($("#startdate").val(), 0)
				 			+ "&endDate=" +  makeDateFormat($("#enddate").val(), 0);
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

</script>

</html>
