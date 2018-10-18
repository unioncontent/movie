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
  <!-- sweet alert framework -->
  <link rel="stylesheet" type="text/css" href="../bower_components/sweetalert/dist/sweetalert.css">
  <!-- sweet alert framework -->
  <link rel="stylesheet" type="text/css" href="../bower_components/sweetalert/dist/sweetalert.css">
  <!-- Style.css -->
  <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/pages/marketing/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/pages/viral/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/picker.css">
  <!--color css-->
  <link rel="stylesheet" type="text/css" href="../assets/css/color/color-1.css" id="color" />
  <link rel="stylesheet" type="text/css" href="../assets/css/linearicons.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/simple-line-icons.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/ionicons.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/jquery.mCustomScrollbar.css">
  <link href="../assets/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
  <link href="../assets/dist/css/select2.css" rel="stylesheet" type="text/css">
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
                      <h4>Facebook CGV</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="../dashBoard/dashBoard_main">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">마케팅 채널관리</a></li>
                        <li class="breadcrumb-item"><a href="../marketing/f_channel">Facebook CGV</a></li>
                      </ul>
                    </div>
                  </div>
                  <!-- page-body start -->
                  <div class="page-body" style="float: center">
                    <div class="row">
                    <c:if test="${user.user_name == 'union'}">
                    <div class="col-md-12">
                        <div class="card">
                          <div class="card-header">
                          	<h5><font style="font-weight: bold; color: black;"><i class="icofont icofont-imac"></i>&nbsp;&nbsp;CGV 모니터링</font></h5>
                            <div class="card-header-right">
                              <i class="icofont icofont-rounded-down"></i>
                            </div>
                          </div>
                          <div class="card-block table-border-style">
                                    <div class="table-responsive">
                                      <table class="table table-bordered table-sm">
                                <c:forEach items="${fVMonitor}" var="fVMonitor" varStatus="index">
                                  <tr>
                                    <td>${fVMonitor.sns_writer}</td>
                                    <td><a href="${fVMonitor.url}" target="_blank"><div class="monitor-nowrap">${fVMonitor.sns_content}</div></a></td>
                                    <td><fmt:formatDate value="${fVMonitor.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${fVMonitor.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio1" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${fVMonitor.checkCondition == false}">
                                            <label>
                                                <input type="radio" name="radio" disabled >
                                                <i class="helper"></i>비정상
                                            </label>
                                            </c:if>
                                        </div>
                                      </div>
                                    </td>
                                  </tr>
                                </c:forEach>
                                </table>
                          </div></div></div></div>
                          </c:if>
                    <div class="col-md-12">
                        <div class="card">
                          <div class="card-header">
                          	<h5><font style="font-weight: bold; color: black;"><i class="icofont icofont-chart-line m-r-5"></i>그래프 비교</font></h5>
                          	총 검출수 24건 영화를 선택하여 그래프를 비교할 수 있습니다.
                            <div class="card-header-right">
                              <i class="icofont icofont-rounded-down"></i>
                            </div>
                          </div>
                          <div class="card-block" style="width: 100%;">
                          <%-- <div class="card-block table-border-style">
                          <div class="table-responsive">
                          <table>
                          	<tr>
                          	<th>제목&nbsp;&nbsp;&nbsp;&nbsp;</th>
                          	<td>
                          	<select class="form-control" id="e1" style="width:700px;">
	                            <c:forEach items="${fVallList}" var="fV">
	                  				<option value="${fV.url}">${fV.sns_content}</option>
	                  			</c:forEach>
            				</select>
                          	</td>
                          	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                          	<th>제목&nbsp;&nbsp;&nbsp;&nbsp;</th>
                          	<td>
                          	<select class="form-control" id="e2" style="width:700px;">
	                            <c:forEach items="${fVallList}" var="fV">
	                  				<option value="${fV.url}">${fV.sns_content}</option>
	                  			</c:forEach>
            				</select>
                          	</td>
                          	</tr>
                          	<tr>
                          	<td height="30"></td>
                          	</tr>
                          	<tr>
                          	<td colspan="5" align="center">
                          	<button type="button" class="twin-button btn btn-twin waves-effect waves-light" style="width: 150px;" data-toggle="tooltip" data-placement="top" data-original-title="비교검색">비교 검색</button> 
                          	</td>
                          	</tr>
                          </table>
                          </div>
                            </div> --%>
                            
                            
                            <div style="float: left; width: 45%;">
                              <div style="width: 100%;">
                              <label style="float: left; width: 9%; height: 40px; margin-top: 10px;">제목</label>
                                <div style="float: left; width: 90%;">
                               <!--  <label style="width: 10%;">제목</label>
                                <div style="width: 80%; margin-left: 10px;"> -->
                                  <select class="form-control form-control-inverse" id="e1">
                                    <c:forEach items="${fVallList}" var="fV">
                  								  <option value="${fV.url}">${fV.sns_content}</option>
                  								  </c:forEach>
            						          </select>
                                </div>
                              </div>
                              </div>
                               <div style="float: left; width: 10%; text-align: center;">
                              <font style="font-weight: bold; color: black; font-size: 25px;">VS</font>
                              </div>
                              <div style="float: left; width: 45%;">
                              <div style="width: 100%;">
                              <label style="float: left; width: 9%; height: 40px; margin-top: 10px;">제목</label>
                                <div style="float: left; width: 90%;">
                                <!-- <label style="width: 10%;">제목</label>
                                <div style="width: 80%; margin-left: 10px;"> -->
                                  <select class="form-control form-control-inverse" id="e2">
                                    <c:forEach items="${fVallList}" var="fV">
                  								  <option value="${fV.url}">${fV.sns_content}</option>
                  								  </c:forEach>
            						          </select>
                                </div>
                              </div>
		                        </div>
		                        </div>
		                        <div style="padding:10px 0px 20px 0px ; width: 100%; text-align: center;">
                                <button type="button" class="twin-button btn btn-twin waves-effect waves-light" style="width: 150px;" data-toggle="tooltip" data-placement="top" data-original-title="비교검색">비교 검색</button> 
                                </div>
		                      
		                      <%-- <div class="row">
		                      <label style="margin-left: 15px; margin-right: 15px;">제목</label>
		                      <select class="form-control" style="width: 700px; margin-left: 15px; margin-right: 15px;" id="e1">
                              	<c:forEach items="${fVallList}" var="fV">
                  			  		<option value="${fV.url}">${fV.sns_content}</option>
                  			  	</c:forEach>
            				  </select>
            				  <label style="margin-left: 15px; margin-right: 15px;">제목</label>
            				  <select class="form-control" style="width: 700px; margin-left: 15px; margin-right: 15px;" id="e2">
	                              <c:forEach items="${fVallList}" var="fV">
	                  			  	<option value="${fV.url}">${fV.sns_content}</option>
	                  			  </c:forEach>
            				  </select>
            				  </div>
            				  <div style="padding:20px 0px 10px 0px ; width: 100%; text-align: center;">
                                <button type="button" class="twin-button btn btn-twin waves-effect waves-light" style="width: 150px;" data-toggle="tooltip" data-placement="top" data-original-title="비교검색">비교 검색</button> 
                                </div>
            				  </div> --%>
            				  </div>
		                      </div>
                              <div class="col-md-12">
                                <div class="card">
                                  <div class="card-header">
                                    <div class="col-sm-3 m-t-10 m-b-10 f-right input-group input-group-button input-group-inverse">
                                      <input onkeyup="if(event.keyCode == 13){$('#searchBtn').trigger('click');};" id="keywordInput" type="text" class="form-control f-right p-r-5 p-l-5 m-b-10" placeholder="">
                                      <span class="input-group-addon" id="basic-addon1"><button id="searchBtn" class="btn btn-search" data-original-title="검색"><i class="icofont icofont-ui-search"></i></button></span>
                                  	</div>
                                    <div class="p-l-15 p-t-10 p-r-15 f-right input-group input-group-inverse" style="max-width: 293px;">
                                      <input type="text" class="datepicker-here form-control col-sm-1 f-left" data-language="en" id="startdate" placeholder="Date" style="max-width:130px;"><div size="3" class="f-left m-l-5 m-r-5"><b>~</b></div>
    	                              	<input type="text" class="datepicker-here form-control col-sm-1 f-left m-b-10" data-language="en" id="enddate" placeholder="Date" style="max-width:130px;">
                                    </div>
                                    <button class="btn btn-list f-right p-r-5 p-l-5 m-l-3 m-b-5 m-t-5"  style="float: left; margin-top: 10px;" type="button" onclick="show()"><i class="icofont icofont-ui-note"></i>전체목록</button>
                                    <c:if test="${user.user_name == 'union'}">
                                    <button type="button" class="tabledit-update-button btn btn-primary waves-effect waves-light alert-confirm1" style="float: left; margin-left: 15px; margin-top: 10px;" data-toggle="tooltip" data-placement="top" data-original-title="일괄등록">
      									일괄등록
    								</button>
    								</c:if>
                                  </div>
                                  <div class="card-block table-border-style">
                                    <div class="table-responsive">
                                      <table class="table table-bordered table-sm">
                                      <c:if test="${empty fVList}">
	                                    <tbody>
	                                     <tr>
	                                     <td style="vertical-align:middle;" align="center" height="200px"><h5>등록된 게시글이 없습니다.</h5></td>
	                                     </tr>
	                                     </tbody>
	                                  </c:if>
	                                  <c:if test="${!empty fVList}">
                                        <thead>
                                          <tr>
                                          	<th width="3%">NO</th>
                                            <th width="5%">등록일</th>
                                            <th width="3%">총 검출수</th>
                                            <th width="3%">조회수</th>
                                            <th width="3%">댓글수</th>
                                            <th width="3%">좋아요수</th>
                                            <th width="15%">영화제목</th>
                                            <th width="15%">제목</th>
                                            <th width="5%"></th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <c:forEach items="${fVList}" var="fV" varStatus="index">
                                          <tr class = "trList">
                                          	<th>${totalCount - minusCount - index.count + 1}</th>
                                            <td>
                                            ${fV.writeDate}
                                            <input type="hidden" value="${fV.url}" name="url">
                                            </td>
                                            <td>
                                            <fmt:formatNumber value="${fV.total}" pattern="#,##0" />건
                                            </td>
                                            <td>
                                            <c:if test="${!empty fV.view_cnt}">
                                            <fmt:formatNumber value="${fV.view_cnt}" pattern="#,##0" />회
                                            </c:if>
                                            <c:if test="${empty fV.view_cnt}">
                                            0회
                                            </c:if>
                                            </td>
                                            <td>
                                            <fmt:formatNumber value="${fV.reply_cnt}" pattern="#,##0" />회
                                            </td>
                                            <td>
                                            <fmt:formatNumber value="${fV.like_cnt}" pattern="#,##0" />회
                                            <input type="hidden" value="${fV.sns_content}" name="sns_content">
                                            </td>
                                            <td>
                                            <input type="text" value="${fV.sns_subcontent}" name="sns_subcontent" style="vertical-align:middle; max-width:300px; height: 35px; border-color: #dcdcdc; border: 1px solid #dcdcdc;">
                                            <button type="button" class="insertBtn2 btn btn-list waves-effect waves-light alert-confirm1" data-original-title="등록">
		      								  <span class="icofont icofont-ui-check"></span>
		    								</button>
                                            </td>
                                            <td>
                                            <div class="content-nowrap">
                                            <a href='${fV.url}' target="_blank">${fV.sns_content}</a>
                                            </div>
                                            </td>
                                            <td>
                                            <button type="button" class="list-button btn btn-list waves-effect waves-light" style="margin-right: 5px;" data-toggle="tooltip" data-placement="top" data-original-title="리스트">
                                            <i class="icofont icofont-ui-note"></i>리스트
                                            </button>
		    								</td>
                                          </tr>
                                          </c:forEach>
                                        </tbody>
                                        <tfoot>
                                          <tr>
                                            <td colspan="9">
                                               <ul class="pagination float-right">
	        					                   <c:if test="${pageMaker.prev}">
		        					                   <li class="page-item">
			        					                   <a class="page-link" href="f_channel${pageMaker.makeSearch(pageMaker.startPage - 1) }" aria-label="Previous">&laquo;
				        					               <span aria-hidden="true"></span>
				        					               <span class="sr-only">Previous</span>
			        					                   </a>
		        					                   </li>
	        					                   </c:if>
        					                   <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	        					                   <li class= "${pageMaker.cri.page == idx? 'active':''} page-item">
	        					                   	<a class="page-link" href="f_channel${pageMaker.makeSearch(idx)}">${idx}</a>
	        					                   </li>
        					                   </c:forEach>
        					                   <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	        					                   <li class="page-item">
		        					                   <a class="page-link" href="f_channel${pageMaker.makeSearch(pageMaker.endPage +1) }" aria-label="Next">&raquo;
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
  <script src="../assets/dist/js/select2.js"></script>
</body>
<style>
.select2-container .select2-selection--single{
  height: 40px;
}
.select2-container--default .select2-selection--single .select2-selection__arrow{
  height: 40px;
}
</style>
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
		
		//등록버튼 클릭시
		$(document).on("click",".insertBtn2",function(event){
			var parent = event.target.parentNode;

			if(parent.type == 'button'){
				console.log("button click...");
				parent = parent.parentNode;
			}

			var tr = parent.parentNode;
			console.log(tr);

			var td1 = tr.children[1];

			var td2 = tr.children[6];


			var url = td1.children[0].value;
			var sns_subcontent = td2.children[0].value;
			
			console.log(url);
			console.log(sns_subcontent);
			
		    swal({
				title: "등록 하시겠습니까?",
				text: "바로 등록처리 됩니다.",
				type: "warning",
				showCancelButton: true,
				confirmButtonClass: "btn-danger",
				confirmButtonText: "YES",
				closeOnConfirm: false
				},
			function(){
					
					$.ajax({
							type: "GET",
							url: "f_update",
							data: {sns_subcontent: sns_subcontent, url: url},
							dataType: "json",
							success: function(data){
									console.log(data);
							}
				
					});
				
				swal("Success!", "등록처리가 완료되었습니다.", "success");
				
				window.setTimeout("pageReload()", 1000);
				/* location.reload(); */
			});
		
		});

		//그래프 비교버튼
		$(".twin-button").on("click", function(event){
			var url = $("#e1 option:selected").val()
			var url2 = $("#e2 option:selected").val()

			console.log("url:" + url);
			console.log("url2:" + url2);

			self.location = "f_graph?url=" + url + "&url2=" + url2;

		});

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

			var td2 = tr.children[5];
			console.log(td2);


			var url = td1.children[0].value;
			var content = td2.children[0].value;

			console.log("url:" + url, "content:" + content);

			self.location = "f_list?url=" + url;

		});

		// 검색버튼 클릭시
		$('#searchBtn').on("click", function(event){
		  console.log("searchBtn clicked....");

		  searchList();

		});

		/* var data = [{ id: 'KOR', text: 'Korea' }, { id: 'JPN', text: 'Japan' }]; */

		$('#e1').select2({ width: '100%', height: '45%' });
		$('#e2').select2({ width: '100%', height: '45%' });
		
		// 수정 버튼 클릭
		$(document).on("click",".tabledit-update-button",function(event){
			swal({
				title: "일괄처리 하시겠습니까?",
				text: "등록처리 됩니다.",
				type: "warning",
				showCancelButton: true,
				confirmButtonClass: "btn-danger",
				confirmButtonText: "YES",
				closeOnConfirm: false
			},
			function(){
					
				var tr = $(".trList");;
				console.log(tr);
				
				for(var i = 0; i < tr.length; i++){
					
					var td1 = tr[i].children[1];
					var td2 = tr[i].children[6];
					
					var url = td1.children[0].value;
					var sns_subcontent = td2.children[0].value;
					
					console.log(url);
					console.log(sns_subcontent);
					
					$.ajax({
						type: "GET",
						url: "f_update",
						data: {sns_subcontent: sns_subcontent, url: url},
						dataType: "json",
						success: function(data){
								console.log(data);
						}
					});
				} 
				
				swal("Success!", "등록처리가 완료되었습니다.", "success");
				
				window.setTimeout("pageReload()", 2000);
				/* location.reload(); */
			});


		});
		
}); // end ready...


	function searchList() {

		var makeQeury = '${pageMaker.makeQuery(1)}'.slice(0,-2);

		console.log(makeQeury);

    	self.location = "f_channel"
    						+ makeQeury + '10'
    						+ "&keyword=" + $('#keywordInput').val()
    						+ "&startDate=" + makeDateFormat($("#startdate").val(), 0)
				 			+ "&endDate=" +  makeDateFormat($("#enddate").val(), 0);
    }
	
	function pageReload() {
		location.reload();
	}
	
	function show(event) {
		
		var makeQeury = '${pageMaker.makeQuery(1)}'.slice(0,-2);
		
		location.href = "f_channelAll"
						+ makeQeury + '10'
						+ "&snsName=" + 'CGV'
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
