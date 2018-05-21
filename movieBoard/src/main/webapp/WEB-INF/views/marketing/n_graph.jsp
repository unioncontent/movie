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
  <!-- sweet alert framework -->
  <link rel="stylesheet" type="text/css" href="../bower_components/sweetalert/dist/sweetalert.css">
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
                      <h4>Naver Movie</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="../dashBoard/dashBoard">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="http://localhost:8080/marketing/f_channel">마케팅 채널관리</a></li>
                        <li class="breadcrumb-item"><a href="http://localhost:8080/marketing/n_channel">Naver Movie</a></li>
                      </ul>
                    </div>
                  </div>
                  <!-- page-body start -->
                  <div class="page-body">
                    <div class="row">
                      <!-- data setting start -->
                      <div class="col-md-6">
                      </div>
                      <div class="col-md-5">
                        <!-- date picker start -->
                        <div class="row">
                        </div>
                        <!-- date picker end -->
                      </div>
                      <!-- data setting end -->
                      <!-- Morris chart start -->
                      <div class="col-md-12">
                        <div class="card">
                          <div class="card-header">
                            <h5>
                            	<i class="icofont icofont-chart-line m-r-5"></i>
                            	조회수 데이터
                            </h5>
                            <span><font color="#fb9678">'<c:forEach items="${list1}" var="list1" varStatus="status">
                            	${list1.portal_title}
                            	</c:forEach>'</font> / <font color="#7E81CB">'<c:forEach items="${list2}" var="list1" varStatus="status">
                            	${list1.portal_title}
                            	</c:forEach>'</font>
                            	최근 48시간 그래프</span>
                            <div class="card-header-right">
                              <i class="icofont icofont-rounded-down"></i>
                            </div>
                          </div>
                          <div class="card-block">
                            <!-- <div id="morris-extra-area" style="height:300px;"></div> -->
                            <div id="morris-extra-line" style="height:200px;"></div>
                          </div>
                        </div>
                      </div>
                      <!-- Morris chart end -->
                      <!-- Morris chart start -->
                      <div class="col-md-12">
                        <div class="card">
                          <div class="card-header">
                            <h5>
                            	<i class="icofont icofont-chart-line m-r-5"></i>
                            	댓글수 데이터
                            </h5>
                            <span><font color="#fb9678">'<c:forEach items="${list1}" var="list1" varStatus="status">
                            	${list1.portal_title}
                            	</c:forEach>'</font> / <font color="#7E81CB">'<c:forEach items="${list2}" var="list1" varStatus="status">
                            	${list1.portal_title}
                            	</c:forEach>'</font>
                            	최근 48시간 그래프</span>
                            <div class="card-header-right">
                              <i class="icofont icofont-rounded-down"></i>
                            </div>
                          </div>
                          <div class="card-block">
                            <!-- <div id="morris-extra-area" style="height:300px;"></div> -->
                            <div id="morris-extra-line2" style="height:200px;"></div>
                          </div>
                        </div>
                      </div>
                      <!-- Morris chart end -->
                      <!-- Morris chart start -->
                      <div class="col-md-12">
                        <div class="card">
                          <div class="card-header">
                            <h5>
                            	<i class="icofont icofont-chart-line m-r-5"></i>
                            	좋아요수 데이터
                            </h5>
                            <span><font color="#fb9678">'<c:forEach items="${list1}" var="list1" varStatus="status">
                            	${list1.portal_title}
                            	</c:forEach>'</font> / <font color="#7E81CB">'<c:forEach items="${list2}" var="list1" varStatus="status">
                            	${list1.portal_title}
                            	</c:forEach>'</font>
                            	최근 48시간 그래프</span>
                            <div class="card-header-right">
                              <i class="icofont icofont-rounded-down"></i>
                            </div>
                          </div>
                          <div class="card-block">
                            <!-- <div id="morris-extra-area" style="height:300px;"></div> -->
                            <div id="morris-extra-line3" style="height:200px;"></div>
                          </div>
                        </div>
                      </div>
                      <!-- Morris chart end -->
                      <table>
                                        <tbody>
                                        <c:forEach items="${list1}" var="list1" varStatus="status">
                                          <tr>
                                          	<td>
                                          	<input type="hidden" value="<fmt:formatDate value="${list1.createDate}" type="DATE" pattern="yyyy-MM-dd HH" />" name="createDate" id=createDate>
                                            </td>
                                            <td>
                                            <input type="hidden" value="${list1.url}" name="url" id="url">
                                            </td>
                                            <td>
                                            <input type="hidden" value="${list1.portal_title}" name="content" id="content">
                                            </td>
                                          </tr>
                                        </c:forEach>
                                        </tbody>
                                      </table>
                                    <table> 
                                        <tbody>
                                        <c:forEach items="${list2}" var="list2" varStatus="status">
                                          <tr>
                                          	<td>
                                          	<input type="hidden" value="<fmt:formatDate value="${list2.createDate}" type="DATE" pattern="yyyy-MM-dd HH" />" name="createDate2" id=createDate2>
                                            </td>
                                            <td>
                                            <input type="hidden" value="${list2.url}" name="url2" id="url2">
                                            </td>
                                            <td>
                                            <input type="hidden" value="${list2.portal_title}" name="content2" id="content2">
                                            </td>
                                          </tr>
                                        </c:forEach>
                                        </tbody>
                                      </table>
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
  <!-- modernizr js사 -->
  <script type="text/javascript" src="../bower_components/modernizr/modernizr.js"></script>
  <script type="text/javascript" src="../bower_components/modernizr/feature-detects/css-scrollbars.js"></script>
  <!-- classie js -->
  <script type="text/javascript" src="../bower_components/classie/classie.js"></script>
  <!-- calendar -->
  <script type="text/javascript" src="../assets/pages/dashboard/pgcalendar/calendar.js"></script>
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
  <script type="text/javascript" src="../assets/pages/dashboard/custom-dashboard.js"></script>
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
	
	var url = $('input[name=url]').val();
	console.log("url:" + url);
	var url2 = $('input[name=url2]').val();
	console.log("url2:" + url2);
	var Mcreate = $('input[name=createDate]').val();
	console.log("Mcreate:" + Mcreate);
	var Mcreate2 = $('input[name=createDate2]').val();
	console.log("Mcreate:2" + Mcreate2);
	var dt = new Date();
	var time = dt.getHours();
	$.ajax({
		
	      type : "POST",
		  url : "graphTwo",
	 	  dataType : "json",
	 	  data : {success : 'success', url: url, url2: url2, Mcreate: Mcreate, Mcreate2: Mcreate2},
	  	  success : function(data){

	  		  console.log(data);
	  		var script = "[";


			for(var i = 0; i < data.length; i++){

				script += '{"period":' + '"' + time + '",'
						+ '"첫번째조회수"'+ ':' + data[i].type1 + ","
						+ '"두번째조회수"' + ':' + data[i].type2 + "},";
						

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
	
	$.ajax({
		
	      type : "POST",
		  url : "graphTwo",
	 	  dataType : "json",
	 	  data : {success : 'success', url: url, url2: url2, Mcreate: Mcreate, Mcreate2: Mcreate2},
	  	  success : function(data){

	  		  console.log(data);
	  		var script = "[";


			for(var i = 0; i < data.length; i++){

				script += '{"period":' + '"' + data[i].writeDate + '",'
				+ '"첫번째댓글수"'+ ':' + data[i].type3 + ","
				+ '"두번째댓글수"' + ':' + data[i].type4 + "},";
						

				if(i == data.length-1){
					script =  script.substr(0, script.length-1);
					script += "]";
				}
			}
			console.log(script);

			// to json
			var jsonScript = JSON.parse(script);

			areaChart2(jsonScript);

	  	 }
	});
	
	$.ajax({
		
	      type : "POST",
		  url : "graphTwo",
	 	  dataType : "json",
	 	  data : {success : 'success', url: url, url2: url2, Mcreate: Mcreate, Mcreate2: Mcreate2},
	  	  success : function(data){

	  		  console.log(data);
	  		var script = "[";


			for(var i = 0; i < data.length; i++){

				script += '{"period":' + '"' + data[i].writeDate + '",'
				+ '"첫번째좋아요수"'+ ':' + data[i].type5 + ","
				+ '"두번째좋아요수"' + ':' + data[i].type6 + "},";
						

				if(i == data.length-1){
					script =  script.substr(0, script.length-1);
					script += "]";
				}
			}
			console.log(script);

			// to json
			var jsonScript = JSON.parse(script);

			areaChart3(jsonScript);

	  	 }
	});
	
	
	
}); // end ready...

	  			function areaChart(jsonScript) {
		  			$("#morris-extra-line").empty();
		  			window.areaChart = Morris.Line({
		  				element: 'morris-extra-line',
		  			    data: jsonScript,
		  			  	xkey: 'period',
		  			    ykeys: ['첫번째조회수','두번째조회수'],
		  			  	labels: ['첫번째조회수','두번째조회수'],
		  			    lineColors: ['#fb9678', '#7E81CB'],
		  			  	hideHover : 'auto'
		  			    });
		  			}
	  			function areaChart2(jsonScript) {
		  			$("#morris-extra-line2").empty();
		  			window.areaChart2 = Morris.Line({
		  				element: 'morris-extra-line2',
		  			    data: jsonScript,
		  			  	xkey: 'period',
		  			    ykeys: ['첫번째댓글수','두번째댓글수'],
		  			  	labels: ['첫번째댓글수','두번째댓글수'],
		  			    lineColors: ['#fb9678', '#7E81CB'],
		  			 	hideHover : 'auto',
		  			 	axes: false
		  			    });
	  			}
	  			function areaChart3(jsonScript) {
		  			$("#morris-extra-line3").empty();
		  			window.areaChart3 = Morris.Line({
		  				element: 'morris-extra-line3',
		  			    data: jsonScript,
		  			  	xkey: 'period',
		  			    ykeys: ['첫번째좋아요수','두번째좋아요수'],
		  			  	labels: ['첫번째좋아요수','두번째좋아요수'],
		  			    lineColors: ['#fb9678', '#7E81CB'],
		  			  	hideHover : 'auto',
		  			 	axes: false
		  			    });
	  			}
	  			
	  	//list URL 함수
	  	var url = $('input[name=url]').val();
	  	var content = $('input[name=content]').val();
	  		
	  	  function searchList(event) {

	  	  	self.location = "f_listall?"
	  	  				  + "url="
	  	  				  + url
	  	  				  + "&content="
	  				  	  + content
	    				  + "&startDate=" + makeDateFormat($("#startdate").val(), 0)
	  	 			      + "&endDate=" +  makeDateFormat($("#enddate").val(), 0);
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
