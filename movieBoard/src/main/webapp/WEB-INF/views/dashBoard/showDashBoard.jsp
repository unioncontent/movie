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
      <!-- top menu start -->
      <jsp:include page='../include/header.jsp' />
      <!-- top menu end -->
      <!-- main container start -->
      <div class="pcoded-main-container">
        <div class="pcoded-wrapper">
          <!-- left menu start -->
          <jsp:include page='../include/side.jsp' />
          <!-- left menu end -->
          <!-- content start -->
          <div class="pcoded-content">
            <div class="pcoded-inner-content">
              <!-- main-body start -->
              <div class="main-body">
                <div class="page-wrapper">
                  <!-- page-header start -->
                  <div class="page-header">
                    <div class="page-header-title">
                      <h4>대시보드</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="../dashBoard/dashBoard">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">대시보드</a>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <!-- page-header end -->
                  <!-- page-body start -->
                  <div class="page-body">
                    <div class="row">
                      <!-- card start -->
                      <div class="col-md-4 col-xl-3 main-card">
                        <div class="card client-blocks ">
                          <div class="card-block">
                            <h5>대표키워드</h5>
                            <ul>
                              <li style="min-height: 60px;">
                                <i class="icofont icofont-document-search" style="line-height: 58px;"></i>
                              </li>
                              <li class="text-right">
                                <fmt:formatNumber value="${showboxkeywordCount}" groupingUsed="true"/>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-4 col-xl-3 main-card">
                        <div class="card client-blocks ">
                          <div class="card-block">
                            <h5>블로그(Blog)검출</h5>
                            <ul>
                              <li style="min-height: 60px;">
                                <i class="icofont icofont-ui-text-chat" style="line-height: 58px;"></i>
                              </li>
                              <li class="text-right">
                                <fmt:formatNumber value="${showboxblogCount.type3}" groupingUsed="true"/>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-4 col-xl-3 main-card">
                        <div class="card client-blocks ">
                          <div class="card-block">
                            <h5>카페(cafe)검출</h5>
                            <ul>
                              <li style="min-height: 60px;">
                                <i class="icofont icofont-ui-social-link" style="line-height: 58px;"></i>
                              </li>
                              <li class="text-right">
                                <fmt:formatNumber value="${showboxcafeCount.type3}" groupingUsed="true"/>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-4 col-xl-3 main-card">
                        <div class="card client-blocks ">
                          <div class="card-block">
                            <h5>평점관리검출</h5>
                            <ul>
                              <li style="min-height: 60px;">
                                <i class="icofont icofont-page" style="line-height: 58px;"></i>
                              </li>
                              <li class="text-right">
                                <fmt:formatNumber value="${showboxrelationCount.type1 + showboxrelationCount.type2}" groupingUsed="true"/>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-4 col-xl-3 main-card">
                        <div class="card client-blocks ">
                          <div class="card-block">
                            <h5>지식인검출</h5>
                            <ul>
                              <li style="min-height: 60px;">
                                <i class="icofont icofont-hat-alt" style="line-height: 58px;"></i>
                              </li>
                              <li class="text-right">
                                <fmt:formatNumber value="${showboxkintipCount.type3}" groupingUsed="true"/>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                      <!-- Morris chart start -->
                      <div class="col-md-12">
                        <div class="card">
                          <div class="card-header">
                            <h5>검출량그래프</h5>
                            <span>최근 24시간 블로그, 카페, 지식인에서 검출된 데이터 그래프</span>
                            <div class="card-header-right">
                              <i class="icofont icofont-rounded-down"></i>
                            </div>
                          </div>
                          <div class="card-block">
                            <div id="morris-extra-area2" style="height:300px;"></div>
                          </div>
                        </div>
                      </div>
                      <!-- Morris chart end -->
                      <div class="col-md-6">
                        <div class="card">
                          <div class="card-header">
                            <h5>플랫폼별 노출현황</h5>
                            <span><fmt:formatDate value="${currTime}" pattern="yyyy-MM-dd HH:mm:ss" /> 기준(최근 24시간)</span>
                            <div class="card-header-right">
                                <i class="icofont icofont-rounded-down"></i>
                            </div>
                          </div>
                          <div class="card-block table-border-style">
                            <div class="table-responsive">
                              <table class="table table-bordered">
                                <thead>
                                  <tr>
                                    <th width="30%">분류</th>
                                    <th>전일</th>
                                    <th>금일</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <th scope="row">포털</th>
                                    <td><fmt:formatNumber value="${showboxportalCount.type1}" groupingUsed="true"/></td>
                                    <td><fmt:formatNumber value="${showboxportalCount.type2}" groupingUsed="true"/></td>
                                  </tr>
                                  <tr>
                                    <th scope="row">언론기사</th>
                                    <td><fmt:formatNumber value="${showboxmediaCount.type1}" groupingUsed="true"/></td>
                                    <td><fmt:formatNumber value="${showboxmediaCount.type2}" groupingUsed="true"/></td>
                                  </tr>
                                  <tr>
                                    <th scope="row">페이스북</th>
                                    <td><fmt:formatNumber value="${showboxfacebookCount.type1}" groupingUsed="true"/></td>
                                    <td><fmt:formatNumber value="${showboxfacebookCount.type2}" groupingUsed="true"/></td>
                                  </tr>
                                  <tr>
                                    <th scope="row">인스타그램</th>
                                    <td><fmt:formatNumber value="${showboxinstagramCount.type1}" groupingUsed="true"/></td>
                                    <td><fmt:formatNumber value="${showboxinstagramCount.type2}" groupingUsed="true"/></td>
                                  </tr>
                                  <tr>
                                    <th scope="row">트위터</th>
                                    <td><fmt:formatNumber value="${showboxtwitterCount.type1}" groupingUsed="true"/></td>
                                    <td><fmt:formatNumber value="${showboxtwitterCount.type2}" groupingUsed="true"/></td>
                                  </tr>
                                  <tr class="bg-inverse">
                                    <th scope="row">합계</th>
                                    <td><fmt:formatNumber value="${showboxportalCount.type1 + showboxmediaCount.type1 + showboxfacebookCount.type1
                                    	+ showboxinstagramCount.type1 + showboxtwitterCount.type1}" groupingUsed="true"/></td>
                                    <td><fmt:formatNumber value="${showboxportalCount.type2 + showboxmediaCount.type2 + showboxfacebookCount.type2
                                    	+ showboxinstagramCount.type2 + showboxtwitterCount.type2}" groupingUsed="true"/></td>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="card">
                          <div class="card-header">
                            <h5>포털 키워드 노출현황</h5>
                            <span><fmt:formatDate value="${currTime}" pattern="yyyy-MM-dd HH:mm:ss" /> 기준(최근 24시간)</span>
                            <div class="card-header-right">
                              <i class="icofont icofont-rounded-down"></i>
                            </div>
                          </div>
                          <div class="card-block table-border-style">
                            <div class="table-responsive">
                              <table class="table table-bordered">
                                  <thead>
                                    <tr>
                                      <th width="30%">분류</th>
                                      <th>네이버</th>
                                      <th>다음</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <th scope="row">블로그</th>
                                      <td><fmt:formatNumber value="${showboxblogCount.type1}" groupingUsed="true"/></td>
                                      <td><fmt:formatNumber value="${showboxblogCount.type2}" groupingUsed="true"/></td>
                                    </tr>
                                    <tr>
                                      <th scope="row">카페</th>
                                      <td><fmt:formatNumber value="${showboxcafeCount.type1}" groupingUsed="true"/></td>
                                      <td><fmt:formatNumber value="${showboxcafeCount.type2}" groupingUsed="true"/></td>
                                    </tr>
                                    <tr>
                                      <th scope="row">지식인/Tip</th>
                                      <td><fmt:formatNumber value="${showboxkintipCount.type1}" groupingUsed="true"/></td>
                                      <td><fmt:formatNumber value="${showboxkintipCount.type2}" groupingUsed="true"/></td>
                                    </tr>
                                    <tr>
                                      <th scope="row">웹문서</th>
                                      <td><fmt:formatNumber value="${showboxwebdocCount.type1}" groupingUsed="true"/></td>
                                      <td><fmt:formatNumber value="${showboxwebdocCount.type2}" groupingUsed="true"/></td>
                                    </tr>
                                    <tr>
                                      <th scope="row">언론</th>
                                      <td><fmt:formatNumber value="${showboxmediaCount.type1}" groupingUsed="true"/></td>
                                      <td><fmt:formatNumber value="${showboxmediaCount.type2}" groupingUsed="true"/></td>
                                    </tr>
                                    <tr class="bg-inverse">
                                      <th scope="row">합계</th>
                                      <td><fmt:formatNumber value="${showboxblogCount.type1 + showboxcafeCount.type1 + 
                                       showboxkintipCount.type1 + showboxwebdocCount.type1 + showboxmediaCount.type1}" groupingUsed="true"/></td>
                                      <td><fmt:formatNumber value="${blogCount.type2 + cafeCount.type2 + 
                                       showboxkintipCount.type2 + showboxwebdocCount.type2 + showboxmediaCount.type2}" groupingUsed="true"/></td>
                                    </tr>
                                  </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- showbox card end -->
                      <!-- calendar start -->
                      <div class="col-md-4 ">
                        <div class="card borderless-card z-depth-left-0">
                          <div class="card-block o-auto p-l-0 p-r-0">
                            <div id="mcalendar"></div>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-8">
                        <div class="card">
                          <div class="card-header">
                            <h5><i class="icofont icofont-ui-calendar m-r-5"></i>주요 일정</h5>
                            <span><p id="date"><fmt:formatDate value="${currTime}" pattern="yyyy년  M월  dd일" /></p><p id="data">0</p>건의 일정이 있습니다.</span>
                            <div class="card-header-right">
                                <i class="icofont icofont-rounded-down"></i>
                            </div>
                          </div>
                          <div class="card-block">
                            <section class="task-panel tasks-widget">
                              <div class="panel-body">
                                <div class="task-content">

                                </div>
                                <div>
                                  <a class="btn btn-info btn-add-task waves-effect waves-light m-t-10" href="#" data-toggle="modal" data-target="#flipFlop"><i class="icofont icofont-plus"></i> 일정 추가</a>
                                </div>
                              </div>
                            </section>
                          </div>
                        </div>
                        <!-- calendar end -->
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
      <!-- 일정 추가 modal -->
      <div class="modal fade" id="flipFlop" tabindex="-1" role="dialog" aria-labelledby="modalLabel" style="display: none;" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalLabel">일정추가</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <label class="col-sm-3 col-form-label">일정</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control save_task_todo" placeholder="일정을 적어주세요.">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id = "insert" class="save_btn btn btn-primary">Save</button>
                    <button type="button" class="btn btn-default close_btn" data-dismiss="modal">Close</button>
                </div>
            </div>
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
  <!-- modernizr js사 -->
  <script type="text/javascript" src="../bower_components/modernizr/modernizr.js"></script>
  <script type="text/javascript" src="../bower_components/modernizr/feature-detects/css-scrollbars.js"></script>
  <!-- classie js -->
  <script type="text/javascript" src="../bower_components/classie/classie.js"></script>
  <!-- calendar -->
  <script type="text/javascript" src="../assets/pages/dashboard/pgcalendar/calendar.js"></script>
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

	settingCalendar();

		$.ajax({

		      type : "POST",
			  url : "showGraph",
		 	  dataType : "json",
		 	  data : {success : 'success'},
		  	  success : function(data){

		  		  console.log(data);
		  		var script = "[";


				for(var i = 0; i < data.length; i++){

					script += '{"period":' + '"' + data[i].writeDate + '",'
							+ '"portal"'+ ':' + data[i].type1 + ","
							+ '"cumminty"' + ':' + data[i].type2 + ","
							+ '"sns"' + ':' + data[i].type3 + "},";

					if(i == data.length-1){
						script =  script.substr(0, script.length-1);
						script += "]";
					}
				}
				console.log(script);

				// to json
				var jsonScript = JSON.parse(script);

				showAreaChart(jsonScript);

		 	}
		});

	$(document).on("click",".delete_todo",function() {
	    $(this).parent().parent().parent().parent().fadeOut();

	    var title = $(this).parent().parent()[0].children[2].innerText;

	    $.ajax({

  	      type : "POST",
  		  url : "delete",
  	 	  dataType : "text",
  	 	  data : {title : title},
  	 		error:function(request,status,error){
  	 		      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
  	 		     },
  	  	  success : function(success){
  	  		  	console.log(success);
  	  			location.reload();
  	  	  }
  	});
	  });



	  $("#mcalendar").width("500px");
	  $(".save_btn").on("click", function() {
	      $(".md-form-control").removeClass("md-valid");
	      var saveTask = $('.save_task_todo').val();
	      if (saveTask == "") {
	          alert("일정을 적어주세요.");
	      } else {
	          var add_todo = $("<div class='to-do-label'>\
	            <div class='checkbox-fade fade-in-info'>\
	              <label class='check-task'>\
	                <input type='checkbox' checked disabled>\
	                <span class='cr'><i class='cr-icon icofont icofont-ui-check txt-info'></i></span>\
	                <span class='task-title-sp'>"+saveTask+"</span>\
	                <div class='f-right hidden-phone'>\
	                  <i class='icofont icofont-ui-delete delete_todo'></i>\
	                </div>\
	              </label>\
	            </div>\
	          </div>");

	          $.ajax({

	    	      type : "POST",
	    		  url : "insert",
	    	 	  dataType : "text",
	    	 	  data : {title : $('.save_task_todo').val(), date : $(".selected")[0].dataset.calendarDay},
	    	 		error:function(request,status,error){
	    	 		      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    	 		     },
	    	  	  success : function(success){
	    	  		  console.log(success);
					location.reload();
	    	  	  }
	    	});

	          $(add_todo).appendTo(".task-content").hide().fadeIn(300);
	          $('.save_task_todo').val('');
	          $("#flipFlop").modal('hide');

	      }

	  });


}); // end ready...

function settingCalendar(){

	$.ajax({
		type : "POST",
		url : "listDate",
	 	dataType : "json",
	 	data : {success : 'success'},
	 	error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       },
	  	success : function(success){

	  		var script = "[";
	  		for(var i = 0; i < success.length; i++){

	  		    script += '{"date": "'+ success[i].calendar_date +
	  		      		'","value":"' + success[i].calendar_title +'"},'
	  		}

	  		script = script.slice(0, -1);
	  		script += "]";

	  		//console.log("script: " + script);
	  		//console.log(JSON.parse(script));
	  		
	  		value = JSON.parse(script);
	  		var length = 0;
	  		for (var data in value) {
	  			var todayDate = new Date();
	  			var dbDate = new Date(value[data].date);
	  			
	  			var today = todayDate.getFullYear()+"-"+(todayDate.getMonth()+1)+"-"+todayDate.getDate()
	  			var dbDay = dbDate.getFullYear()+"-"+(dbDate.getMonth()+1)+"-"+dbDate.getDate()
	  			
	  			if(dbDay == today){
	  				var vdata = value[data].value.split(",");
	  				console.log(vdata)
	  				$.each(vdata, function(key,value){
	  					length = length+1
	  		              $(".task-content").append("<div class='to-do-label'>\
	  		                <div class='checkbox-fade fade-in-info'>\
	  		                  <label class='check-task'>\
	  		                    <input type='checkbox' checked disabled>\
	  		                    <span class='cr'><i class='cr-icon icofont icofont-ui-check txt-info'></i></span>\
	  		                    <span class='task-title-sp'>"+value+"</span>\
	  		                    <div class='f-right hidden-phone'>\
	  		                      <i class='icofont icofont-ui-delete delete_todo'></i>\
	  		                    </div>\
	  		                  </label>\
	  		                </div>\
	  		              </div>");
	  		            });
	  			}
	        }
	  		$("#data").text(length);
	  		
	  	// inline
	  		  var $ca = $('#mcalendar').calendar({
	  		      width: '300px',
	  		      height: '280px',
	  		      data: JSON.parse(script),
	  		      date: new Date(),
	  		      onSelected: function (view, date, data) {//날짜 선택시 이벤트
	  		          console.log('date:' + date);//날짜
	  		          console.log('data:' + (data || '없음'));//일정

	  		          if(data != null && typeof data != "undefined") {//일정 있을때
	  		            var data = data.split(",");
	  		            //일정 건수 넣기
	  		            $("#data").text(data.length);
	  		            //스케줄 넣기 전 비우기
	  		            $(".task-content").empty();
	  		            $.each(data, function(key,value){
	  		              $(".task-content").append("<div class='to-do-label'>\
	  		                <div class='checkbox-fade fade-in-info'>\
	  		                  <label class='check-task'>\
	  		                    <input type='checkbox' checked disabled>\
	  		                    <span class='cr'><i class='cr-icon icofont icofont-ui-check txt-info'></i></span>\
	  		                    <span class='task-title-sp'>"+value+"</span>\
	  		                    <div class='f-right hidden-phone'>\
	  		                      <i class='icofont icofont-ui-delete delete_todo'></i>\
	  		                    </div>\
	  		                  </label>\
	  		                </div>\
	  		              </div>");
	  		            });
	  		          }
	  		          else{//일정 없을때
	  		            $("#data").text(0);
	  		            $(".task-content").empty();
	  		          }
	  		          //선택된 날짜 대입
	  		          var select = new Date(date);
	  		        $("#date").text(select.getFullYear()+"년 "+(select.getMonth() + 1)+"월 "+select.getDate()+"일 ");
	  		      },
	  		      viewChange: function (view, y, m) {//날짜 변경될 때, ex) 10월에서 11월 / 2017년에서 2010년
	  		          console.log(view, y, m);
	  		      }
	  		  });


	  		}
		})
	}

function showAreaChart(jsonScript) {
	$("#morris-extra-area2").empty();
	window.showAreaChart = Morris.Area({
		element: 'morris-extra-area2',
	    data: jsonScript,
	    lineColors: ['#fb9678', '#7E81CB', '#01C0C8'],
	    xkey: 'period',
	    ykeys: ['portal', 'cumminty', 'sns'],
	    labels: ['포털', '커뮤니티', 'SNS'],
	    pointSize: 0,
        lineWidth: 0,
        resize: true,
        fillOpacity: 0.8,
        behaveLikeLine: true,
        gridLineColor: '#5FBEAA',
        hideHover: 'auto'
	    });
	}


</script>


</html>
