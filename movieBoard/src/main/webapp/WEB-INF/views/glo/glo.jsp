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
<!-- Date-time picker css  -->
<link rel="stylesheet" type="text/css" href="../assets/pages/advance-elements/css/bootstrap-datetimepicker.css">
<!-- C3 chart -->
<link rel="stylesheet" href="../bower_components/c3/c3.css" type="text/css" media="all">
<!-- Style.css -->
<link rel="stylesheet" type="text/css" href="../assets/css/style.css">
<link rel="stylesheet" type="text/css" href="../assets/css/picker.css">
<link rel="stylesheet" type="text/css" href="../assets/pages/glo/css/style.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<!--color css-->
<link rel="stylesheet" type="text/css" href="../assets/css/color/color-1.css" id="color" />
<link rel="stylesheet" type="text/css" href="../assets/css/linearicons.css">
<link rel="stylesheet" type="text/css" href="../assets/css/simple-line-icons.css">
<link rel="stylesheet" type="text/css" href="../assets/css/ionicons.css">
<link rel="stylesheet" type="text/css" href="../assets/css/jquery.mCustomScrollbar.css">
<style type="text/css">
a:hover { color: black; text-decoration: underline;}
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
										<div class="col-lg-12">
										<div class="page-header-title">
											<h4>해외통계관리</h4>
										</div>
										<div class="page-header-breadcrumb">
											<ul class="breadcrumb-title">
												<li class="breadcrumb-item"><a href="../dashBoard/dashBoard_main"> <i class="icofont icofont-home"></i>
												</a></li>
												<li class="breadcrumb-item"><a href="#!">해외통계관리</a></li>
											</ul>
										</div>
										</div>
									</div>
									<div class="page-body">
										<div class="col-lg-12">
				                        <div class="tab-pane fade show active" id="main" role="tabpanel">
										<div class="row">
											<!-- counter-card-1 start-->
											<div class="col-md-4">
												<div class="card" style="border-top: 1px solid #34495e; height: 200px;">
													<div class="card-block-big">
														<div>
															<div class="title">모니터링현황</div>
										                    <div class="out">
										                      <div class="in">
										                        <p class="f1">전체</p>
										                        <p class="f2">${totalCnt}</p>
										                      </div>
										                      <div class="in">
										                        <p class="f1">국내/해외</p>
										                        <p class="f2">${totalCnt - gloCnt} / ${gloCnt}</p>
										                      </div>
										                    </div>
														</div>
													</div>
												</div>
											</div>
											<!-- counter-card-1 end-->
											
											<!-- counter-card-2 start -->
											<div class="col-md-8">
												<div class="card" style="border-top: 1px solid #34495e; height: 200px;">
													<div class="card-block-big">
														<div>
															<c:forEach items="${gloTypeCount}" var="count">
															<div class="title">검출현황</div>
															<div class="outdiv">
										                      <div class="indiv">
										                        <p class="f1">검출현황</p>
										                        <p class="f2"><fmt:formatNumber value="${count.total}" groupingUsed="true"/></p>
										                      </div>
										                      <div class="indiv">
										                        <p class="f1">삭제요청</p>
										                        <p class="f2"><fmt:formatNumber value="${count.del}" groupingUsed="true"/></p>
										                      </div>
										                      <div class="indiv">
										                        <p class="f1">기관전달</p>
										                        <p class="f2"><fmt:formatNumber value="${count.sen}" groupingUsed="true"/></p>
										                      </div>
										                      <div class="indiv">
										                        <p class="f1">불법잔류건</p>
										                        <p class="f2"><fmt:formatNumber value="${count.etc}" groupingUsed="true"/></p>
										                      </div>
										                    </div>
										                    </c:forEach>
														</div>
													</div>
												</div>
											</div>
											<!-- counter-card-2 end -->
											</div></div></div>
											
											<!-- Morris chart start -->
				                              <div class="col-lg-12">
				                                <div class="card">
				                                <div class="card-header">
				                                  <h5 class="card-header-text">
				                                  <font style="font-weight: bold; color: black;">
				                                    <i class="icofont icofont-chart-line m-r-5"></i>
				                                    	통계 그래프 (최근 30일)
				                                    </font>
				                                  </h5>
				                                  <div class="card-header-right">
				                                    <i class="icofont icofont-rounded-down"></i>
				                                  </div>
				                                </div>
				                                <div class="card-block">
				                                  <!-- chart start -->
				                                  <div id="container" style="height:350px;"></div>
				                                  <!-- chart end -->
				                                </div>
				                              </div>
				                              </div>
											<!-- Morris chart end -->
											<div class="col-md-12">
												<!-- Pc table start -->
												<div class="card">
													<div class="card-header">
														<h5 class="card-header-text m-b-5 m-t-15">
											               <font style="font-weight: bold; color: black;">모니터링 리스트</font>
					                                    </h5>
														
							                            <div class="col-sm-2 input-group input-group-button input-group-inverse p-l-0 p-r-0 m-r-5 m-b-5 m-t-5 f-right btn-select">
							                               <input onkeyup="if(event.keyCode == 13){$('#searchBtn').trigger('click');};" id="fromDate" value="" type="text" class="form-control form-control-inverse" placeholder="" style="height:40px; float: right; text-align: center;">
							                              <span class="input-group-addon" id="basic-addon1">
							                                <button id="searchBtn" class="btn btn-search"><i class="icofont icofont-ui-search"></i></button>
							                              </span>
							                            </div>
							                            <select id = "selectSite" name="select" class="col-sm-1 form-control form-control-inverse m-r-5 m-b-5 m-t-5 f-left search-select" style="height:40px; float: right;">
							                              <option>사이트</option>
								                          <c:forEach items="${siteList}" var = "siteList">
								                          <option value="${siteList.glo_site}">${siteList.glo_site}</option>
								                          </c:forEach>
							                            </select>
							                            <select id = "selectNation" name="select" class="col-sm-1 form-control form-control-inverse m-r-5 m-b-5 m-t-5 f-left search-select" style="height:40px; float: right;">
							                              <option>국가</option>
								                          <c:forEach items="${nationList}" var = "nationList">
								                          <option value="${nationList.glo_nation}">${nationList.glo_nation}</option>
								                          </c:forEach>
							                            </select>
													</div>
													<div class="card-block table-border-style">
														<div class="table-responsive">
															<table class="table table-bordered table-sm">
																<c:if test="${empty gloList}">
							                                     <tbody>
															          <tr>
															          	<td style="vertical-align:middle; height: 150px;" align="center">
															          	<h5 align="center">등록된 리스트가 없습니다.</h5>
															          	</td>
															          </tr>
														          </tbody>
														          </c:if>
														          <c:if test="${!empty gloList}">
																<thead>
																	<tr>
																		<th>NO</th>
																		<th>국가</th>
																		<th>사이트명</th>
																		<th>URL</th>
																		<th>전체검출건</th>
																		<th>삭제요청</th>
																		<th>기관전달</th>
																		<th>불법잔류건</th>
																	</tr>
																</thead>
																<tbody>
																<c:forEach items="${gloList}" var="gloList" varStatus="index">
																		<tr>
																			<th scope="row">${totalCnt -index.count +1 -minusCount}</th>
																			<td>${gloList.glo_nation}</td>
																			<td>${gloList.glo_site}</td>
																			<td><a href="${gloList.glo_url}" target="_blank"> ${gloList.glo_url} </a></td>
																			<td>
																				 <span class="dataSend">
																						${gloList.total}
																					</span>
																			</td>
																			<td>
																				 <span class="dataSend2">
																					<input type="hidden" value="1">
																						${gloList.del}
																					</span>
																			</td>
																			<td>
																				 <span class="dataSend3">
																					<input type="hidden" value="2">
																						${gloList.sen}
																					</span>
																			</td>
																			<td>
																				 <span class="dataSend4">
																					<input type="hidden" value="3">
																						${gloList.etc}
																					</span>
																			</td>
																		</tr>
																	</c:forEach>
																</tbody>
																</c:if>
															</table>
												<!-- Pc table end -->
										</div></div></div></div>
										<br>
										<br>
										<br>
										<br>
										<br>
										<br>
										<br>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal start-->
    <div class="modal fade" id="gloDetail" tabindex="-1" role="dialog">
    	<div class="modal-dialog modal-xxlg" role="document">
	         <div class="modal-content">
	         </div>
         </div>
   </div>
   <!-- Modal end-->


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
	<!-- Date-time picker js -->
	<script type="text/javascript" src="..../assets/pages/advance-elements/moment-with-locales.min.js"></script>
	<script type="text/javascript" src="../assets/pages/advance-elements/bootstrap-datetimepicker.min.js"></script>
	<!-- c3 chart js -->
	<script src="../bower_components/d3/d3.min.js"></script>
	<script src="../bower_components/c3/c3.js"></script>
	<!-- sweet alert js -->
    <script type="text/javascript" src="../bower_components/sweetalert/dist/sweetalert.min.js"></script>
	<!-- Morris Chart js -->
	<script src="../bower_components/raphael/raphael.min.js"></script>
	<script src="../bower_components/morris.js/morris.js"></script>
	<!-- High Chart js -->
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<!-- echart js -->
	<script src="../assets/pages/chart/echarts/js/echarts-all.js" type="text/javascript"></script>
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
	
	//BODY 에 로딩화면 추가
	var loading = $('<div id="loading" class="loading"></div><img id="loading_img" alt="loading" src="../assets/images/ajax-loader.gif">').appendTo(document.body).hide();

//		ajax 통신 시작시 실행
	$(window).ajaxStart(function() {
		loading.show();
	});

//		ajax 통신 종료시 실행
	$(window).ajaxStop(function() {
		loading.hide();
	});

	$(document).ready(function(){
		
		ajaxGraph();
		
		var $fromDate = $("#fromDate");

	    var startDateOption = decodeURI(window.location.href.split("startDate=")[1]).split("&")[0].split(" ")[0];
		var endDateOption = decodeURI(window.location.href.split("endDate=")[1]).split("&")[0].split(" ")[0];
		console.log("startDateOption: " + startDateOption);
		console.log("endDateOption: " + endDateOption);

		if(startDateOption != 'undefined' && endDateOption != 'undefined'
			&& startDateOption != '' && endDateOption != ''){
			$("#fromDate").val(startDateOption + " - " + endDateOption);
		}
		
		$('.dataSend').on("click", function(){
			
			var parent = event.target.parentNode;
			if(parent.type == 'submit'){
				console.log("button click...");
				parent = parent.parentNode;
			}

			var tr = parent.parentNode;
			
			var nation = tr.children[1].innerText;
			
			var site = tr.children[2].innerText.trim();
			console.log(site);
			
			var work = "전체";
			
			gloModal(nation, site, work)
		});
		
		$('.dataSend2').on("click", function(){
					
					var parent = event.target.parentNode;
					if(parent.type == 'submit'){
						console.log("button click...");
						parent = parent.parentNode;
					}
		
					var tr = parent.parentNode;
					
					var nation = tr.children[1].innerText;
					
					var site = tr.children[2].innerText.trim();
					console.log(site);
					
					var work = tr.children[5].children[0].children[0].value;
					console.log(work);
					
					gloModal(nation, site, work)
				});
				
		$('.dataSend3').on("click", function(){
			
			var parent = event.target.parentNode;
			if(parent.type == 'submit'){
				console.log("button click...");
				parent = parent.parentNode;
			}
		
			var tr = parent.parentNode;
			
			var nation = tr.children[1].innerText;
			
			var site = tr.children[2].innerText.trim();
			console.log(site);
			
			var work = tr.children[6].children[0].children[0].value;
			console.log(work);
			
			gloModal(nation,site, work)
		});
		
		$('.dataSend4').on("click", function(){
			
			var parent = event.target.parentNode;
			if(parent.type == 'submit'){
				console.log("button click...");
				parent = parent.parentNode;
			}
		
			var tr = parent.parentNode;
			
			var nation = tr.children[1].innerText;
			
			var site = tr.children[2].innerText.trim();
			console.log(site);
			
			var work = tr.children[7].children[0].children[0].value;
			console.log(work);
			
			gloModal(nation, site, work)
		});
		
		
		
	// 검색버튼 클릭시
		$('#searchBtn').on("click", function(event){
		  console.log("searchBtn clicked....");
			
		  searchList();
		});
	
		var selectNation = decodeURI(window.location.href.split("&nation=")[1]).split("&")[0]
		if(selectNation == "undefined"){
			selectNation = "국가";
		}
		$('#selectNation').val(selectNation);
		
		var selectSite = decodeURI(window.location.href.split("&site=")[1]).split("&")[0]
		if(selectSite == "undefined"){
			selectSite = "사이트";
		}
		$('#selectSite').val(selectSite);
		
	}); // end ready...
	
	function gloModal(nation, site, work) {
		
	 	var startDate = decodeURI(window.location.href.split("startDate=")[1]).split("&")[0].split(" ")[0]
		var endDate =  decodeURI(window.location.href.split("endDate=")[1]).split("&")[0].split(" ")[0]
		
		$.ajax({
			type : "POST",
			url : "gloModal",
			data : {nation : nation, site : site, work : work, startDate : startDate, endDate : endDate},
			cache: false, 
			success : function(data) {$('#gloDetail').modal('show');
				$('.modal-content').empty();
				$('.modal-content').append(data);
			}
		});
	}
	
	//그래프 함수
	function ajaxGraph(){
		
		$.ajax({
	      type : "POST",
		  url : "graph",
	 	  dataType : "json",
	 	  data : {company : decodeURI(window.location.href.split("company=")[1]).split("&")[0], selectKey : decodeURI(window.location.href.split("selectKey=")[1]).split("&")[0]},
	  	  success : function(data){

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

				script2 += data[i].type2 + ",";

				if(i == data.length-1){
					script2 =  script2.substr(0, script2.length-1);
					script2 += "]";
	  		
				}
			}
			
			var script3 = "[";

			for(var i = 0; i < data.length; i++){

				script3 += '"' + data[i].writeDate + '",';

				if(i == data.length-1){
					script3 =  script3.substr(0, script3.length-1);
					script3 += "]";
	  		
				}
			}
			
			console.log(script);
			console.log(script2);
			console.log(script3);

			// to json
			var jsonScript = JSON.parse(script);
			var jsonScript2 = JSON.parse(script2);
			var jsonScript3 = JSON.parse(script3);

			areaChart(jsonScript, jsonScript2, jsonScript3);

	  	 }
	});
	}

	function areaChart(jsonScript,jsonScript2,jsonScript3) {
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
					categories: jsonScript3
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
			        name: '해외',
			        data: jsonScript,
			        color: '#2ecc71'
			    },{
			        name: '국내',
			        data: jsonScript2,
			        color: '#4099FF'
			    }]
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

	  	self.location = "glo?"
	  				  + "nation="
	  				  + $("#selectNation option:selected").val()
	  				  + "&site="
	  				  + $('#selectSite option:selected').val()
	  				  + "&startDate=" + makeDateFormat($("#fromDate").val(), 0)
	  				  + "&endDate=" +  makeDateFormat($("#fromDate").val(), 1);
	  }

</script>

</html>
