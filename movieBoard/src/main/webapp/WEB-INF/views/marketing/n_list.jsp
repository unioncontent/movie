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
                        <li class="breadcrumb-item"><a href="http://localhost:8080/marketing/n_channel">마케팅 채널관리</a></li>
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
                            	검출량그래프
                            </h5>
                            <span><b>'${content}'</b> 최근 48시간 조회 수 데이터 그래프</span>
                            <div class="card-header-right">
                              <i class="icofont icofont-rounded-down"></i>
                            </div>
                          </div>
                          <div class="card-block">
                            <!-- <div id="morris-extra-area" style="height:300px;"></div> -->
                            <div id="morris-bar" style="height:300px;"></div>
                          </div>
                        </div>
                      </div>
                      <!-- Morris chart end -->
                      <!-- List start -->
                              <div class="col-md-12">
                                <div class="card">
                                  <div class="card-header">
                                    <!-- <h5>Naver Movie</h5> -->
                                    <button class="btn btn-info f-right alert-confirm" onclick = "location.href='http://overware.iptime.org:8080/marketing/n_channel'"><i class="icofont icofont-ui-note"></i>목록으로</button>
                                  </div>
                                  <div class="card-block table-border-style">
                                    <div class="table-responsive">
                                      <table class="table table-bordered table-sm">
                                        <thead>
                                            <tr align="center">
                                              <th width="3%">NO</th>
                                              <th width="10%">날짜</th>
                                              <th width="5%">조회수</th>
                                              <th width="3%">증가폭</th>
                                              <th width="30%">제목</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="list1" items="${list1}" varStatus="status">
                                          <tr>
                                            <th>${totalCount - minusCount - status.count + 1}</th>
                                            <td><fmt:formatDate value="${list1.createDate}" type="DATE" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                            <td>
                                            <fmt:formatNumber value="${list1.view_cnt}" pattern="#,##0" />회
                                            <input type="hidden" value="${list1.url}" name="url" id="url">
                                            </td>
                                            <td>
                                            <i class="icofont icofont-arrow-up" style="color: green"></i>
                                            <fmt:formatNumber value="${(list1.view_cnt - list2[status.index].view_cnt)}" pattern="#,##0" />회
                                            <%-- ${list2[status.index].view_cnt} --%>
                                            </td>
                                            <td>${list1.portal_title}</td>
                                          </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                          <tr>
                                            <td colspan="5">
                                              <ul class="pagination float-right">
                                                <c:if test="${pageMaker.prev}">
                                              		<li class="page-item">
                                                		  <a class="page-link" href="n_list${pageMaker.makeSearch(pageMaker.startPage - 1) }" aria-label="Previous">&laquo;
                                                  		<span aria-hidden="true"></span>
                                                  		<span class="sr-only">Previous</span>
                                                		  </a>
                                              		</li>
                                        	      </c:if>

                                          		  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                                              		<li class= "${pageMaker.cri.page == idx? 'active':''} page-item">
                                                		  <a class="page-link" href="n_list${pageMaker.makeSearch(idx)}">${idx}</a>
                                              		</li>
                                          		  </c:forEach>
                                          		  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                              		<li class="page-item">
                                              		  <a class="page-link" href="n_list${pageMaker.makeSearch(pageMaker.endPage +1) }" aria-label="Next">&raquo;
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
	
	var url = $('input[name=url]').val();
	console.log("url:" + url);
	
	$.ajax({
			
	      type : "POST",
		  url : "ngraph",
	 	  dataType : "json",
	 	  data : {success : 'success', url: url},
	  	  success : function(data){

	  		  console.log(data);
	  		var script = "[";


			for(var i = 0; i < data.length; i++){

				script += '{"period":' + '"' + data[i].writeDate + '",'
						+ '"조회수"'+ ':' + data[i].type1 + "},";

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
	

	
	  

}); // end ready...

		function areaChart(jsonScript) {
				$("#morris-bar").empty();
				window.areaChart = Morris.Bar({
					element: 'morris-bar',
				    data: jsonScript,
				    xkey: 'period',
				    ykeys: ['조회수'],
				    labels: ['조회수'],
				    barColors: ['#01C0C8'],
				    stacked: true,
				    /* xLabelMargin : 10, */
				    hideHover: 'auto',
				    resize: true,
				    gridTextColor: '#888'
				    });
				}

	  		
	  	
	  		/* function areaChart(jsonScript) {
	  			$("##morris-extra-area").empty();
	  			window.areaChart = Morris.Area({
	  				element: 'morris-extra-area',
	  			    data: jsonScript,
	  			    lineColors: ['#01C0C8'],
	  			    xkey: 'period',
	  			    ykeys: ['조회수'],
	  			    labels: ['조회수'],
	  			    pointSize: 0,
	  		        lineWidth: 0,
	  		        resize: true,
	  		        fillOpacity: 0.8,
	  		        behaveLikeLine: true,
	  		        gridLineColor: '#5FBEAA',
	  		        hideHover: 'auto'
	  			    });
	  			} */
	  	//list URL 함수
	  	var url = $('input[name=url]').val();
	  		
	  	  function searchList(event) {

	  	  	self.location = "n_list?"
	  	  				  + "url="
	  	  				  + url
	  	  				  + "&company="
	  	  				  + $("#selectCompany option:selected").val()
	  	  				  + "&selectKey="
	  	  				  + $('#selectKeyword option:selected').val()
	  	  				  + "&startDate=" + makeDateFormat($("#fromDate").val(), 0)
	  	  				  + "&endDate=" +  makeDateFormat($("#fromDate").val(), 1);
	  	  }
	  	
</script>


</html>
