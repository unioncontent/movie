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
  <!--color css-->
  <link rel="stylesheet" type="text/css" href="../assets/css/color/color-1.css" id="color" />
  <link rel="stylesheet" type="text/css" href="../assets/css/linearicons.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/simple-line-icons.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/ionicons.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/jquery.mCustomScrollbar.css">
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	
    	  var l = ${portalTextType.lik};
    	  var d = ${portalTextType.dis};
    	  var c = ${portalTextType.cu};
    	  var e = ${portalTextType.etc};
    	  
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['긍정글', l],
          ['부정글', d],
          ['관심글', c],
          ['기타글', e]
        ]);

        var options = {
          title: '포털 통계그래프',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
   </script>
   <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	
    	  var l2 = ${communityTextType.lik};
    	  var d2 = ${communityTextType.dis};
    	  var c2 = ${communityTextType.cu};
    	  var e2 = ${communityTextType.etc};
    	  
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['긍정글', l2],
          ['부정글', d2],
          ['관심글', c2],
          ['기타글', e2]
        ]);

        var options = {
          title: '커뮤니티 통계그래프',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart2'));
        chart.draw(data, options);
      }
   </script>
   <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	
    	  var l3 = ${totalMediaCount.lik};
    	  var d3 = ${totalMediaCount.dis};
    	  var c3 = ${totalMediaCount.cu};
    	  var e3 = ${totalMediaCount.etc};
    	  
    	  /* var l3 = ${naverMediaCount.lik + daumMediaCount.lik};
    	  var d3 = ${naverMediaCount.dis + daumMediaCount.dis};
    	  var c3 = ${naverMediaCount.cu + daumMediaCount.cu};
    	  var e3 = ${naverMediaCount.etc + daumMediaCount.etc}; */
    	  
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['긍정글', l3],
          ['부정글', d3],
          ['관심글', c3],
          ['기타글', e3]
        ]);

        var options = {
          title: 'NEWS 통계그래프',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart3'));
        chart.draw(data, options);
      }
   </script>
   
   <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	
    	  var l = ${blogTextType.lik + cafeTextType.lik};
    	  var d = ${blogTextType.dis + cafeTextType.dis};
    	  var c = ${blogTextType.cu + cafeTextType.cu};
    	  var e = ${blogTextType.etc + cafeTextType.etc};
    	  
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['긍정글', l],
          ['부정글', d],
          ['관심글', c],
          ['기타글', e]
        ]);

        var options = {
          title: '포털 통계그래프',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart4'));
        chart.draw(data, options);
      }
   </script>
   <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	
    	  var l2 = ${communityTextType.lik};
    	  var d2 = ${communityTextType.dis};
    	  var c2 = ${communityTextType.cu};
    	  var e2 = ${communityTextType.etc};
    	  
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['긍정글', l2],
          ['부정글', d2],
          ['관심글', c2],
          ['기타글', e2]
        ]);

        var options = {
          title: '커뮤니티 통계그래프',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart5'));
        chart.draw(data, options);
      }
   </script>
  <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	
    	  var l3 = ${communityTextType.lik};
    	  var d3 = ${communityTextType.dis};
    	  var c3 = ${communityTextType.cu};
    	  var e3 = ${communityTextType.etc};
    	  
    	  /* var l3 = ${naverMediaCount.lik + daumMediaCount.lik};
    	  var d3 = ${naverMediaCount.dis + daumMediaCount.dis};
    	  var c3 = ${naverMediaCount.cu + daumMediaCount.cu};
    	  var e3 = ${naverMediaCount.etc + daumMediaCount.etc}; */
    	  
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['긍정글', l3],
          ['부정글', d3],
          ['관심글', c3],
          ['기타글', e3]
        ]);

        var options = {
          title: 'NEWS 통계그래프',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart6'));
        chart.draw(data, options);
      }
   </script>
  <style type="text/css">
  	.card{
  		margin: 0px auto;
  		width: 100%;
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
                      <h4>보고서 관리</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="../dashBoard/dashBoard">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">보고서관리</a>
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
                      <div class="col-lg-12">
                        <!-- tab header start -->
                        <!-- tab header end -->
                        <!-- tab-content start -->
                         <div class="tab-content">
                          <!-- tab1 main start -->
                          <div class="tab-pane fade show active" id="main" role="tabpanel">
                            <div class="row">
                              <!-- top cards end -->
                              <div class="card">
                              	<div class="card-header" align="center">
                              	<h4 class="card-header-text"><${company} : ${selectKey}> 주간보고서</h4>
                              	</div>
                              	<div class="card-block table-border-style">
                              		<div class="table-responsive">
                              			<table class="table table-bordered">
                              				<tr>
                              					<th width="50%">기간</th>
                              					<td align="left">
                              						 ${startDate } ~ ${endDate }
                              					</td>
                              				</tr>
                              				<tr>
                              					<th>키워드</th>
                              					<td>${selectKey}</td>
                              				</tr>
                              			</table>
                              			<div class="card-header">
		                              		<h5 class="card-header-text">통계현황</h5>
		                              	</div>
		                              	<table class="table table-bordered">
                              				<tr>
                              					<th>포털</th>
                              					<th>커뮤니티</th>
                              					<th>NEWS</th>
                              					<th>SNS</th>
                              					<th>합계</th>
                              				</tr>
                              				<tr>
                              					<td><fmt:formatNumber value="${portalCount}" pattern="#,##0" /></td>
                              					<td><fmt:formatNumber value="${communityCount}" pattern="#,##0" /></td>
                              					<td><fmt:formatNumber value="${mediaCount}" pattern="#,##0" /></td>
                              					<td><fmt:formatNumber value="${snsCount}" pattern="#,##0" /></td>
                              					<td><fmt:formatNumber value="${portalCount+communityCount+snsCount+mediaCount}" pattern="#,##0" /></td>
                              				</tr>
                              			</table>
                              			<br>
                              				<!-- 도넛 그래프 start -->
				                                <div class="card">
				                                  <div class="card-header">
				                                    <h5 class="card-header-text">
				                                    <i class="icofont icofont-chart-pie-alt"></i>
				                                                                                           통계그래프
				                                    </h5>
				                                    <div class="card-header-right">
				                                      <i class="icofont icofont-refresh"></i>
				                                    </div>
				                                  </div>
				                                  <div class="card-block">
				                                    <!-- chart start -->
				                                    <div class="m-b-35" id="donutchart" style="width: 33%; height: 500px; float: left;"></div>
	                              					<div class="m-b-35" id="donutchart2" style="width: 33%; height: 500px; float: left;"></div>
	                              					<div class="m-b-35" id="donutchart3" style="width: 33%; height: 500px; float: left;"></div>
				                                    <!-- chart end -->
				                                  </div>
				                                </div>
				                            <!-- 도넛 그래프 end -->
                              				<!-- <div>
	                              			<div class="m-b-35" id="donutchart" style="width: 33%; height: 500px; float: left;"></div>
	                              			<div class="m-b-35" id="donutchart2" style="width: 33%; height: 500px; float: left;"></div>
	                              			<div class="m-b-35" id="donutchart3" style="width: 33%; height: 500px; float: left;"></div>
	                              			</div> -->
                              				<!-- 버즈량 변동 현황 그래프 start -->
				                                <div class="card">
				                                  <div class="card-header">
				                                    <h5 class="card-header-text">
				                                      <i class="icofont icofont-chart-line m-r-5"></i>
				                                                                                           일일 <${selectKey}> 버즈량 변동 현황
				                                    </h5>
				                                    <div class="card-header-right">
				                                      <i class="icofont icofont-refresh"></i>
				                                    </div>
				                                  </div>
				                                  <div class="card-block">
				                                    <!-- chart start -->
				                                    <div class="m-b-35" id="line-chart1"></div>
				                                    <!-- chart end -->
				                                  </div>
				                                </div>
				                              <!-- 버즈량 변동 현황 그래프 end -->
		                              	<div class="card-header">
		                              		<h5 class="card-header-text">포털 통계</h5>
		                              	</div>
		                              	<table class="table table-bordered">
                              				<tr>
                              					<th>날짜</th>
                              					<th>검출량</th>
                              					<th>긍정글</th>
                              					<th>부정글</th>
                              					<th>관심글</th>
                              					<th>기타글</th>
                              				</tr>
                              				<c:forEach items="${portalTextType2}" var="portal">
                              				<tr>
                              					<td>${portal.writeDate}</td>
                              					<td><fmt:formatNumber value="${portal.lik + portal.dis + portal.cu
                                                       + portal.etc}" groupingUsed="true"/></td>
                              					<td><fmt:formatNumber value="${portal.lik}" groupingUsed="true"/></td>
                              					<td><fmt:formatNumber value="${portal.dis}" groupingUsed="true"/></td>
                              					<td><fmt:formatNumber value="${portal.cu}" groupingUsed="true"/></td>
                              					<td><fmt:formatNumber value="${portal.etc}" groupingUsed="true"/></td>
                              				</tr>
                              				</c:forEach>
                              			</table>
                              			<div id="getTable"></div>
                              		</div><br>
	                                <div align="center">
	                                	<input type="button" class="btn btn-primary m-b-0" data-toggle="modal" data-target="#press-modal" value="미리보기">
	                                </div><br>
                              	</div>
                           	  </div><br>
                           	  
                      <!-- Modal start-->
                      <div class="modal fade" id="press-modal" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title"></h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true"><i class="icofont icofont-close-line"></i></span>
                              </button>
                            </div>
                            <div class="modal-body">
                              <div class="col-lg-12">
                                    <div class="card">
	                              	<div class="card-header" align="center">
	                              	<h4 class="card-header-text"><${company} : ${selectKey}> 주간보고서</h4>
	                              	</div>
	                              	<div class="card-block table-border-style">
	                              		<div class="table-responsive">
	                              			<table class="table table-bordered">
	                              				<tr>
	                              					<th width="50%">기간</th>
	                              					<td align="left">
	                              						 ${startDate } ~ ${endDate }
	                              					</td>
	                              				</tr>
	                              				<tr>
	                              					<th>키워드</th>
	                              					<td>${selectKey}</td>
	                              				</tr>
	                              			</table>
	                              			<div class="card-header">
			                              		<h5 class="card-header-text">통계현황</h5>
			                              	</div>
			                              	<div>
			                              	<table class="table table-bordered">
	                              				<tr>
	                              					<th>포털</th>
	                              					<th>커뮤니티</th>
	                              					<th>NEWS</th>
	                              					<th>SNS</th>
	                              					<th>합계</th>
	                              				</tr>
	                              				<tr>
	                              					<td><fmt:formatNumber value="${portalCount}" pattern="#,##0" /></td>
	                              					<td><fmt:formatNumber value="${communityCount}" pattern="#,##0" /></td>
	                              					<td><fmt:formatNumber value="${mediaCount}" pattern="#,##0" /></td>
	                              					<td><fmt:formatNumber value="${snsCount}" pattern="#,##0" /></td>
	                              					<td><fmt:formatNumber value="${portalCount+communityCount+snsCount+mediaCount}" pattern="#,##0" /></td>
	                              				</tr>
	                              			</table>
	                              			</div>
	                              			<br>
	                              			<!-- 도넛 그래프 start -->
				                                <div class="card">
				                                  <div class="card-header">
				                                    <h5 class="card-header-text">
				                                    <i class="icofont icofont-chart-pie-alt"></i>
				                                                                                           통계그래프
				                                    </h5>
				                                    <div class="card-header-right">
				                                      <i class="icofont icofont-refresh"></i>
				                                    </div>
				                                  </div>
				                                  <div class="card-block">
				                                    <!-- chart start -->
				                                    <div id="donutchart4" style="float:left;width:30%;margin-left:15px;"></div>
			                              			<div id="donutchart5" style="float:left;width:30%;margin-left:90px;"></div>
			                              			<div id="donutchart6" style="float:left;width:30%;margin-left:15px;"></div>
				                                    <!-- chart end -->
				                                  </div>
				                                </div>
				                                <div class="card">
				                                  <div class="card-header">
				                                    <h5 class="card-header-text">
				                                      <i class="icofont icofont-chart-line m-r-5"></i>
				                                                                                           일일 <${selectKey}> 버즈량 변동 현황
				                                    </h5>
				                                    <div class="card-header-right">
				                                      <i class="icofont icofont-refresh"></i>
				                                    </div>
				                                  </div>
				                                  <div class="card-block">
				                                    <!-- chart start -->
				                                    <div class="m-b-35" id="line-chart2"></div>
				                                    <!-- chart end -->
				                                  </div>
				                                </div>
				                              <!-- 버즈량 변동 현황 그래프 end -->
			                              	<div class="card-header">
			                              		<h5 class="card-header-text">포털 통계</h5>
			                              	</div>
			                              	<div>
			                              	<table class="table table-bordered">
	                              				<tr>
	                              					<th>날짜</th>
	                              					<th>검출량</th>
	                              					<th>긍정글</th>
	                              					<th>부정글</th>
	                              					<th>관심글</th>
	                              					<th>기타글</th>
	                              				</tr>
	                              				<c:forEach items="${portalTextType2}" var="portal">
	                              				<tr>
	                              					<td>${portal.writeDate}</td>
	                              					<td><fmt:formatNumber value="${portal.lik + portal.dis + portal.cu
	                                                       + portal.etc}" groupingUsed="true"/></td>
	                              					<td><fmt:formatNumber value="${portal.lik}" groupingUsed="true"/></td>
	                              					<td><fmt:formatNumber value="${portal.dis}" groupingUsed="true"/></td>
	                              					<td><fmt:formatNumber value="${portal.cu}" groupingUsed="true"/></td>
	                              					<td><fmt:formatNumber value="${portal.etc}" groupingUsed="true"/></td>
	                              				</tr>
	                              				</c:forEach>
	                              			</table>
	                              			</div>
	                              		</div><br>
	                              	</div>
	                           	  </div>
							      </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button> 
							      	<button type="button" class="btn btn-primary">메일보내기</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- Modal end-->
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
		});
		
		//ajaxGraph
		var graphStart = $fromDate.val().split(" - ")[0].replace("/", "-").replace("/", "-");
		var graphEnd = $fromDate.val().split(" - ")[1].replace("/", "-").replace("/", "-");

		console.log("graphStart: " + graphStart);
	    console.log("graphEnd: " + graphEnd);
		  
	    ajaxGraph(graphStart, graphEnd);
	    
	    //ajaxGraph2
	    var graphStart = $fromDate.val().split(" - ")[0].replace("/", "-").replace("/", "-");
		var graphEnd = $fromDate.val().split(" - ")[1].replace("/", "-").replace("/", "-");

		console.log("graphStart: " + graphStart);
	    console.log("graphEnd: " + graphEnd);
		  
	    ajaxGraph2(graphStart, graphEnd);

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
	
	// 그래프 함수
	function ajaxGraph(startDate, endDate){
	  console.log(startDate + "/" + endDate);
		$.ajax({

	      type : "POST",
		  url : "graph",
	 	  dataType : "json",
	 	  data : {startDate : startDate, endDate : endDate,
	 		      company : $("#selectCompany option:selected").val(), selectKey : $("#selectKeyword option:selected").val()},
	  	  error : function(){
	      	alert('graphPOST ajax error....');
	  	  },
	  	  success : function(data){

	  		var script = "[";

	  		for(var i = 0; i < data.length; i++){
	  			console.log(data[i]);
	  			script += '{"manage":' + '"' + data[i].writeDate + '",'
	  					+ '"l1"'+ ':' + data[i].type1 + ","
	  					+ '"l2"' + ':' + data[i].type2 + ","
	  					+ '"l3"' + ':' + data[i].type3 + ","
	  					+ '"l4"' + ':' + data[i].type4 + "},";

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
	}
	
	function drawChart(data){
     	// 그래프 초기화
     	$('#line-chart1').children().remove();

     	window.lineChart = Morris.Line({
     	      element: 'line-chart1',
     	      data: data,
     	      xkey: 'manage',
     	      xLabels : 'day',
     	      redraw: true,
     	      ykeys: ['l1', 'l2', 'l3', 'l4'],
     	      hideHover: 'auto',
     	      labels: ['포털', '커뮤니티', 'SNS', '언론사'],
     	      lineColors: ['#2ecc71', '#e74c3c', '#3498DB','#f1c40f']
     	  });
     }
	
	// 그래프 함수
	function ajaxGraph2(startDate, endDate){
	  console.log(startDate + "/" + endDate);
		$.ajax({

	      type : "POST",
		  url : "graph",
	 	  dataType : "json",
	 	  data : {startDate : startDate, endDate : endDate,
	 		      company : $("#selectCompany option:selected").val(), selectKey : $("#selectKeyword option:selected").val()},
	  	  error : function(){
	      	alert('graphPOST ajax error....');
	  	  },
	  	  success : function(data){

	  		var script = "[";

	  		for(var i = 0; i < data.length; i++){
	  			console.log(data[i]);
	  			script += '{"manage":' + '"' + data[i].writeDate + '",'
	  					+ '"l1"'+ ':' + data[i].type1 + ","
	  					+ '"l2"' + ':' + data[i].type2 + ","
	  					+ '"l3"' + ':' + data[i].type3 + ","
	  					+ '"l4"' + ':' + data[i].type4 + "},";

	  			if(i == data.length-1){
	  				script =  script.substr(0, script.length-1);
	  				script += "]";
	  			}
	  		}
	  		console.log(script);

	  		// to json
	  		var jsonScript = JSON.parse(script);

	  		drawChart2(jsonScript);

	  	 }
		});
	}
	function drawChart2(data){
     	// 그래프 초기화
     	$('#line-chart2').children().remove();

     	window.lineChart = Morris.Line({
     	      element: 'line-chart2',
     	      data: data,
     	      xkey: 'manage',
     	     xLabels : 'day',
     	      redraw: true,
     	      ykeys: ['l1', 'l2', 'l3', 'l4'],
     	      hideHover: 'auto',
     	      labels: ['포털', '커뮤니티', 'SNS', '언론사'],
     	      lineColors: ['#2ecc71', '#e74c3c', '#3498DB','#f1c40f']
     	  });
     }



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

	  	self.location = "report?"
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
  
  var sel = document.getElementById("select");
  var val = sel.options[sel.selectedIndex].value;
  
</script>
</html>