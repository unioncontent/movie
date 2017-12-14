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
  <!-- Nvd3 chart css -->
  <link rel="stylesheet" href="../bower_components/nvd3/build/nv.d3.css" type="text/css" media="all">
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
                      <h4>연관검색어관리</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="../dashBoard/dashBoard">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="mngViral.html">바이럴관리</a></li>
                        <li class="breadcrumb-item"><a href="#!">연관검색어관리</a></li>
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
                        <select id="selectSite" name="select" class="col-md-1 form-control form-control-inverse m-b-10 p-r-5 f-left select-left">
                          <option value="사이트">사이트</option>
                          <option value="네이버">네이버</option>
                          <option value="다음">다음</option>
                        </select>
                      </div>
                      <!-- data setting end -->
                      <div class="col-lg-12">
                        <!-- tab header start -->
                        <div class="tab-header">
                          <ul class="nav nav-tabs nav-vtabs md-tabs tab-timeline" role="tablist" id="mytab">
                            <a class="nav-item" href="viral">
                              <li class="nav-link ">
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
                              <li class="nav-link active">
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
                                <div class="card client-blocks">
                                  <div class="card-block-big card1">
                                    <h5>전체건수</h5>
                                    <ul>
                                      <li class="p-t-10">
                                        <i class="icofont icofont-document-search"></i>
                                      </li>
                                      <li class="text-right">${blog0+blog1+blog2}</li>
                                    </ul>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6 col-xl-3">
                                <div class="card user-activity-card">
                                  <div class="card-header">
                                    <h5><i class="icofont icofont-ui-v-card"></i></h5>
                                    <h5>전체 연관검색어 현황</h5>
                                  </div>
                                  <div class="card-block-big">
                                    <div class="row">
                                      <div class="col-sm-6">
                                        <div class="text-center">
                                          <h1 class="text-inverse f-w-600">${blog0}</h1>
                                          <h6 class="text-muted m-t-10">전체</h6>
                                        </div>
                                      </div>
                                    </div>
                                    </div>
                                  </div>
                                </div>
                              <div class="col-md-6 col-xl-3">
                                <div class="card user-activity-card">
                                 <div class="card-header">
                                    <h5><i class="icofont icofont-clock-time"></i></h5>
                                    <h5>실시간 연관검색어 현황</h5>
                                  </div>
                                 <div class="card-block-big">
                                    <div class="row">
                                      <div class="col-sm-6">
                                        <div class="text-center">
                                          <h1 class="text-inverse f-w-600">${blog1}</h1>
                                          <h6 class="text-muted m-t-10">본사계정</h6>
                                        </div>
                                      </div>
                                      <div class="col-sm-6">
                                        <div class="text-center">
                                          <h1 class="text-muted f-w-600">${blog2}</h1>
                                          <h6 class="text-muted m-t-10">외부계정</h6>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!-- <div class="col-md-6 col-xl-3">
                                <div class="card bg-primary large-widget-card">
                                  <div class="card-block-big">
                                      <h4>5127 k</h4>
                                      <h6>Line of code</h6>
                                      <i class="icofont icofont-code-alt"></i>
                                  </div>
                                </div>
                              </div> -->
                              <div class="col-md-6 col-xl-3">
                                <div class="card user-activity-card">
                                  <div class="card-block-big"style="padding-top: 17px;padding-bottom: 17px;">
                                      <h5>점유율 %</h5>
                                      <div class="text-center">
                                        <!-- data-width:그래프 넓이 / data-height:그래프 높이 / data-fgColor:그래프 색상 / data-readonly:그래프 안움직이게-->
                                        <input type="text" class="dial" data-width="150" data-height="150" data-fgColor="#5d9cec" data-displayprevious="true" data-displayInput="true" data-readonly="true">
                                      </div>
                                  </div>
                                </div>
                              </div>

                              <!-- top cards end -->
                              <div class="col-md-12">
                                <c:if test="${blogList eq null }">
                                  <div class="card borderless-card">
                                    <div class="card-block warning-breadcrumb bg-white">
                                      <div class="breadcrumb-header">
                                        <h5 class="text-inverse"><i class="icofont icofont-warning text-warning"></i> 회사를 선택해주세요.</h5>
                                      </div>
                                    </div>
                                  </div>
                                </c:if>
                                <div class="card">
                                  <div class="card-header">
                                    <div class="col-md-1 btn-viral f-right p-r-0">
                                      <button class="btn col-md-12 btn-warning alert-confirm" onclick="_gaq.push(['_trackEvent', 'example', 'try', 'alert-confirm']);"><i class="icofont icofont-download-alt"></i>EXCEL</button>
                                    </div>
                                  </div>
                                  <div class="card-block">
                                    <div class="table-border-style">
                                      <div class="table-responsive">
                                        <table class="table table-styling table-checkbox">
                                          <thead>
                                            <tr>
                                              <th>순위</th>
                                              <th>등록일</th>
                                              <th>구분</th>
                                              <th>제목</th>
                                              <th>키워드</th>
                                              <th>업데이트일시</th>
                                              <th>계정분류</th>
                                              <th>히스토리</th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                          	  <c:forEach items="${blogList}" var="viralVO">
                                              <tr>
                                                <th scope="row">${viralVO.viral_rank}</th>
                                                <td>${viralVO.writeDate}</td>
                                                <td>${viralVO.portal_name}</td>
                                                <td><a href="${viralVO.url}">${viralVO.viral_title}</a></td>
                                                <td>${viralVO.keyword}</td>
                                                <td>${viralVO.viral_time}</td>
                                                <td>
                                                <c:if test="${viralVO.viral_isUser == 1}">본사</c:if>
                                              	<c:if test="${viralVO.viral_isUser == 2}">외부</c:if>
                                              	</td>
                                                <td>
                                                  <button class="btn btn-inverse btn-modal btn-sm"><i class="icofont icofont-chart-bar-graph m-r-0"></i></button>
                                                </td>
                                              </tr>
                                              </c:forEach>
                                          </tbody>
                                        </table>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <!-- tab1 main end -->
                        </div>
                        <!-- tab-content end -->
                      </div>
                    </div>
                  </div>
                  <!-- modal image show start -->
                  <div class="modal fade" id="history-Modal" tabindex="-1" role="dialog">
                    <div class="modal-dialog modal-lg" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h4 class="modal-title">순위변동량</h4>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                        <div class="modal-body">
                          <div id="barchart" class="nvd-chart"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- modal image show end -->
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
  <!-- i18next.min.js -->
  <script type="text/javascript" src="../bower_components/i18next/i18next.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-xhr-backend/i18nextXHRBackend.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-browser-languagedetector/i18nextBrowserLanguageDetector.min.js"></script>
  <script type="text/javascript" src="../bower_components/jquery-i18next/jquery-i18next.min.js"></script>
  <!-- sweet alert js -->
  <script type="text/javascript" src="../bower_components/sweetalert/dist/sweetalert.min.js"></script>
  <!-- NVD3 chart -->
  <script src="../bower_components/d3/d3.js"></script>
  <script src="../bower_components/nvd3/build/nv.d3.js"></script>
  <!-- knob js -->
  <script src="../bower_components/aterrien/jQuery-Knob/js/jquery.knob.js"></script>
  <!-- Custom js -->
  <script type="text/javascript" src="../assets/js/script.js"></script>
  <script type="text/javascript" src="../assets/pages/viral/script2.js"></script>
  <script src="../assets/pages/picker.js"></script>
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


		//점유율 그래프
		var first = '${blog1}';
		var second = '${blog2}';

		$(".dial").val(first/(first+second));

		// 회사 selectbox 유지.
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
			console.log($("#selectCompany option:selected").val());

			searchList();

		});

		// 키워드 selectbox 유지.
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
			console.log($('#selectKeyword option:selected').val());

			searchList();

		});


		// 사이트 selectbox 유지
		var siteOption = decodeURI(window.location.href.split("portal_name=")[1]);
		console.log("siteOption: " + siteOption);

		var $selectSite = $("#selectSite");

		if(siteOption != 'undefined'){
			for(var i = 0; i < $selectSite[0].length; i++ ){
				if($selectSite[0][i].value == siteOption){
					$selectSite[0][i].selected = 'selected';
				}
			}
		}

		$selectSite[0][0].disabled = true;

		// 사이트 선택시
		$selectSite.change(function(){
			console.log($selectSite.val());

			searchList();

		});

		// 모달 버튼 클릭시.
		var modal = $('.btn-modal');
		modal.on('click',function(event){

		  	var button = event.target;

		  	if(button.type != 'submit'){
		  		button = $(button).parent();
		  	}

		  	var tr = $(button).parent().parent()[0];

		  	var url = tr.children[3].children[0].getAttribute("href");

		  	$.ajax({
				type : "POST",
			  	url : "historyGraph",
		 	  	dataType : "json",
		 	  	data : {url : url},
		  	  	success : function(list){

		  	  	var script = '[{"values": [';

		  	  	for(var i = 0; i < list.length; i++){

		  	  		var value = '{';
					value = value + '"label"' + ':' + '"' + (list[i].writeDate).split(" ")[1] + '",';
					value += '"value"' + ':' + '' + (100- list[i].type1) + ',';
					value += '"color"' + ':' + '"#01C0C8"';
					value += '},'

					script += value;

	  	  		}

		  	  	script = script.slice(0, -1);

		  	  	script += ']}]';

		  	  	console.log(script);

		  	  	var jsonScript = JSON.parse(script);

		  	  	console.log(jsonScript);
		  	  	barScript = jsonScript;

		  	  	$('#history-Modal').modal('show');
			  	setTimeout(barChart, 300);

		  	  	}
		  	});
		});

		// 엑셀 출력
		//엑셀출력 확인메시지
		$(document).on("click",".alert-confirm",function(){
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
				  + "&selectKey=" + $('#selectKeyword option:selected').val()
				  + "&portal_name=" + $("#selectSite option:selected").val()
				  + "&portal_type=" + "relation";


		  		swal("Success!", "엑셀출력 되었습니다.", "success");

	        });
		});

	}); // end ready...

	var barScript = '';

	function barChart(){
		console.log("barChartCalled...");
		$('.nvd3-svg').remove();
	  	/*Bar chart start*/

	  	//var dataValue = barData;
	  	console.log(barScript);

	  	nv.addGraph(function() {
	      	var chart = nv.models.multiBarChart()
	          	.x(function(d) { return d.label }) //Specify the data accessors.
	          	.y(function(d) { return d.value })
	          	.forceY([0,100]);

	      	chart.groupSpacing(0.8);
	      	chart.reduceXTicks(false);
	      	chart.showLegend(false);
	      	chart.showControls(false);
	      	chart.groupSpacing(0.5);
	      	chart.yAxis.tickFormat(function(d, i){
	        return 100-d+"위" //"Year1 Year2, etc depending on the tick value - 0,1,2,3,4"
	      	});
	   		console.log(barScript);
	      	d3.select('#barchart').append('svg')
	          	.datum(barScript)
	          	.call(chart);


	      	nv.utils.windowResize(chart.update);

	      	return chart;
	  	});
	}

	function searchList() {

    	self.location = "v_relation?"
        					+ "&company=" + $("#selectCompany option:selected").val()
    						+ "&selectKey=" + $('#selectKeyword option:selected').val()
    						+ "&portal_name=" + $("#selectSite option:selected").val();
    }

</script>

</html>
