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
  <!-- Style.css -->
  <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/pages/keyword/css/style.css">
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
              <div class="main-body">
                <div class="page-wrapper">
                  <div class="page-header">
                    <div class="page-header-title">
                      <h4>키워드관리</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="../dashBoard/dashBoard_main">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">키워드관리</a></li>
                      </ul>
                    </div>
                  </div>
                  <!-- Page-body start -->
                  <div class="page-body">
                  <div class="row">
                      <!-- data setting start -->
                      <div class="col-md-7">
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
                      </div>
                    <!-- Filtering Foo-table card start -->
                    <div class="card">
                      <div class="card-header">
                        <div class="col-md-1 p-r-0 f-right">
                          <a href="create" class="btn btn-primary float-right">등록</a>
                        </div>
                      </div>
                      <div class="card-block table-border-style">
                        <div class="table-responsive">
                          <table class="table table-bordered table-sm">
                          <c:if test="${empty mainList}">
					          <tbody>
						          <tr>
						          	<td style="vertical-align:middle;" align="center" height="150px"><h5>등록된 키워드가 없습니다.</h5></td>
						          </tr>
					          </tbody>
				          </c:if>
				          <c:if test="${!empty mainList}">
                            <thead>
                              <tr>
                                <th width="1%">NO</th>
                                <th width="3%">등록일</th>
                                <th width="3%">회사명</th>
                                <th width="3%">키워드</th>
                                <th width="1%">검색어</th>
                                <th width="1%">제외검색어</th>
                                <th width="2%">상태변경</th>
                                <th width="4%"></th>
                              </tr>
                            </thead>
                            <tbody>
                              <c:forEach items="${mainList}" var="keyword" varStatus="index">
                              <tr>
                                <th scope="row">${index.count}</th>
                                <td>${keyword.createDate}</td>
                                <td>${keyword.company}</td>
                                <td>${keyword.keyword_main}</td>
                                <td>${keyword.first}</td>
                                <td>${keyword.second }</td>
                                <td>
	                            <div class="state${index.count}">
	                            	<c:if test="${keyword.first == 0}">
	                                <button class="tabledit-button btn btn-default waves-effect waves-light alert-confirm2" data-toggle="tooltip" data-placement="top" data-original-title="상태변경">
    								On
    								</button>
    								<button class="tabledit-button btn btn-info waves-effect waves-light alert-confirm3" data-toggle="tooltip" data-placement="top" data-original-title="상태변경">
    								Off
    								</button>
	                                </c:if>
	                                <c:if test="${keyword.first != 0}">
	                                <button class="tabledit-button btn btn-info waves-effect waves-light alert-confirm2" data-toggle="tooltip" data-placement="top" data-original-title="상태변경">
    								On
    								</button>
    								<button class="tabledit-button btn btn-default waves-effect waves-light alert-confirm3" data-toggle="tooltip" data-placement="top" data-original-title="상태변경">
    								Off
    								</button>
	                                </c:if>
			                    </div>
	                            </td>
                                <td class="text-center">
  								  <div class="btn-group btn-group-md text-center" style="min-width: 115px; padding-right: 0;">
    							    <button type="button" class="tabledit-edit-button btn btn-primary waves-effect waves-light" style="margin-right: 5px;" data-toggle="tooltip" data-placement="top" data-original-title="키워드 추가">
      								  <span class="icofont icofont-ui-edit"></span>
    								</button>
    								<button type="button" class="tabledit-delete-button btn btn-danger waves-effect waves-light alert-confirm1" data-toggle="tooltip" data-placement="top" data-original-title="삭제">
      								  <span class="icofont icofont-ui-delete"></span>
    								</button>
  								  </div>
								</td>
                              </tr>
                              </c:forEach>
                            </tbody>
                            </c:if>
                          </table>
                        </div>
                      </div>
                    </div>
                    <!-- Filtering Foo-table card end -->
                  </div>
                  <!-- Page-body end -->
                </div>
              </div>
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
		console.log(decodeURI(window.location.href.split("&selectKey=")[1]));

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

			//searchList();
		});

		// 수정 버튼 클릭
		$(".tabledit-edit-button").on("click", function(event){
			var div = event.target.parentNode;

			if(div.type == 'button'){
				console.log("button click...");
				div = div.parentNode;
			}

			var tr = div.parentNode.parentNode;
			console.log(tr);

			var td = tr.children[3];
			console.log(td);

			var keyword_main = td.childNodes[0];
			console.log(keyword_main.data);

			self.location = "modify?keyword_main=" + keyword_main.data;

		});

		// 상태변경 버튼 클릭시On
		  $(document).on("click",".alert-confirm2",function(event){
			  var div = event.target.parentNode;

				if(div.type == 'button'){
					console.log("button click...");
					div = div.parentNode;
				}

				var tr = div.parentNode.parentNode;
				console.log(tr);

				var td = tr.children[3];
				console.log(td);

				var keyword_main = td.childNodes[0];
				console.log("keyword_main:"+keyword_main.data);

			  swal({
					title: "상태On 처리 하시겠습니까?",
					text: "바로 상태변경 됩니다.",
					type: "warning",
					showCancelButton: true,
					confirmButtonClass: "btn-state",
					confirmButtonText: "YES",
					closeOnConfirm: false
				},
					function(){

						$.ajax({
							type : "POST",
							url : "updateOn",
							data: {keyword_main: keyword_main.data},
							dataType: "json",
							success: function(data){
							console.log(data);
							}

						});

						swal("Update!", "상태변경 처리가 완료되었습니다.", "success");

						location.reload();
					});
	  			});

		// 상태변경 버튼 클릭시Off
		  $(document).on("click",".alert-confirm3",function(event){
			  var div = event.target.parentNode;

				if(div.type == 'button'){
					console.log("button click...");
					div = div.parentNode;
				}

				var tr = div.parentNode.parentNode;
				console.log(tr);

				var td = tr.children[3];
				console.log(td);

				var keyword_main = td.childNodes[0];
				console.log("keyword_main:"+keyword_main.data);

			  swal({
					title: "상태Off 처리 하시겠습니까?",
					text: "바로 상태변경 됩니다.",
					type: "warning",
					showCancelButton: true,
					confirmButtonClass: "btn-state",
					confirmButtonText: "YES",
					closeOnConfirm: false
				},
					function(){

						$.ajax({
							type : "POST",
							url : "updateOff",
							data: {keyword_main: keyword_main.data},
							dataType: "json",
							success: function(data){
							console.log(data);
							}

						});

						swal("Update!", "상태변경 처리가 완료되었습니다.", "success");

						location.reload();
					});
	  			});

		// 삭제 버튼 클릭
		$(".tabledit-delete-button").on("click", function(event){
			var div = event.target.parentNode;

			if(div.type == 'button'){
				console.log("button click...");
				div = div.parentNode;
			}

			var tr = div.parentNode.parentNode;
			console.log(tr);

			var td = tr.children[3];
			console.log(td);

			var keyword_main = td.childNodes[0];
			console.log(keyword_main.data);

			swal({
				title: "삭제처리 하시겠습니까?",
				text: "해당 키워드가 삭제처리 됩니다.",
				type: "warning",
				showCancelButton: true,
				confirmButtonClass: "btn-danger",
				confirmButtonText: "YES",
				closeOnConfirm: false
			},
			function(){

				$.ajax({

					type : "POST",
				  	url : "removeMain",
			 	  	dataType : "text",
			 	  	data : {keyword_main : keyword_main.data},
			 	  	success : function(data){

			 	  		if(data == "success"){
							location.reload();
			 	  		}

			 	  	}
				});

				swal("Success!", "삭제처리가 완료되었습니다.", "success");
			});


		});
		
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

	}); // end ready...
	
	//list URL 함수
	function searchList(event) {

		self.location = "keyword"
					  + "?company="
					  + $("#selectCompany option:selected").val()
					  + "&selectKey="
					  + $('#selectKeyword option:selected').val()
					  
	}
	
</script>

</html>
