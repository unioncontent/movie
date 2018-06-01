<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<meta name="_csrf_header" content="${_csrf.headerName}" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="Phoenixcoded">
<meta name="keywords"
	content="flat ui, admin , Flat ui, Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="Phoenixcoded">
<!-- Favicon icon -->
<link rel="icon" href="../assets/images/favicon.ico" type="image/x-icon">
<!-- Google font-->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css"
	href="../bower_components/bootstrap/css/bootstrap.min.css">
<!-- themify-icons line icon -->
<link rel="stylesheet" type="text/css"
	href="../assets/icon/themify-icons/themify-icons.css">
<!-- ico font -->
<link rel="stylesheet" type="text/css"
	href="../assets/icon/icofont/css/icofont.css">
<!-- sweet alert framework -->
<link rel="stylesheet" type="text/css"
	href="../bower_components/sweetalert/dist/sweetalert.css">
<!-- animation nifty modal window effects css -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/component.css">
<!-- Menu-Search css -->
<link rel="stylesheet" type="text/css"
	href="../assets/pages/menu-search/css/component.css">
<!-- Horizontal-Timeline css -->
<link rel="stylesheet" type="text/css"
	href="../assets/pages/dashboard/horizontal-timeline/css/style.css">
<!-- Style.css -->
<link rel="stylesheet" type="text/css" href="../assets/css/style.css">
<link rel="stylesheet" type="text/css"
	href="../assets/pages/keyword/css/style.css">
<!--color css-->
<link rel="stylesheet" type="text/css"
	href="../assets/css/color/color-1.css" id="color" />
<link rel="stylesheet" type="text/css"
	href="../assets/css/linearicons.css">
<link rel="stylesheet" type="text/css"
	href="../assets/css/simple-line-icons.css">
<link rel="stylesheet" type="text/css" href="../assets/css/ionicons.css">
<link rel="stylesheet" type="text/css"
	href="../assets/css/jquery.mCustomScrollbar.css">
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
											<h4>악성글등록</h4>
										</div>
										<div class="page-header-breadcrumb">
											<ul class="breadcrumb-title">
												<li class="breadcrumb-item"><a
													href="../dashBoard/dashBoard_main"> <i
														class="icofont icofont-home"></i>
												</a></li>
												<li class="breadcrumb-item"><a href="../keyword/swearword">악성글관리</a></li>
												<li class="breadcrumb-item"><a href="#!">악성글 등록</a></li>
											</ul>
										</div>
									</div>
									<div class="page-body">
										<div class="row">
											<div class="col-lg-12">
												<div class="card">
													<div class="card-header">
														<h5 class="card-header-text m-b-10"></h5>
														<form action="swearwordCreateOk">
															<div class="form-group row">
																<label class="col-sm-2 col-form-label"><b>악성글</b></label>
																<div class="col-sm-5">
																	<input type="text" class="form-control" id="swearword" name="swearword">
																	<input type="hidden" id="keywordCheck"/>
                                    								<span class="messages"><p class="text-danger error"></p></span>
																</div>
																<div class="col-sm-1 btn-check">
																	<button id="checkMainBtn" type="button"
																		class="btn btn-sm btn-inverse alert-prompt"
																		onclick="_gaq.push(['_trackEvent', 'example', 'try', 'alert-prompt']);">
																		<i class="icofont icofont icofont-ui-check"></i> 중복체크
																	</button>
																</div>
															</div>
															<div class="row">
																<label class="col-sm-2"></label>
																<div class="col-sm-10">
																	<input type="submit" value="등록"
																		class="submit btn btn-primary m-b-0">
																</div>
															</div>
														</form>
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
			</div>
		</div>
	</div>
	<!-- Required Jquery -->
	<script type="text/javascript"
		src="../bower_components/jquery/dist/jquery.min.js"></script>
	<script type="text/javascript"
		src="../bower_components/jquery-ui/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="../bower_components/tether/dist/js/tether.min.js"></script>
	<script type="text/javascript"
		src="../bower_components/bootstrap/js/bootstrap.min.js"></script>
	<!-- jquery slimscroll js -->
	<script type="text/javascript"
		src="../bower_components/jquery-slimscroll/jquery.slimscroll.js"></script>
	<!-- modernizr js -->
	<script type="text/javascript"
		src="../bower_components/modernizr/modernizr.js"></script>
	<script type="text/javascript"
		src="../bower_components/modernizr/feature-detects/css-scrollbars.js"></script>
	<!-- sweet alert js -->
	<script type="text/javascript"
		src="../bower_components/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript" src="../assets/pages/keyword/script.js"></script>
	<!-- sweet alert modal.js intialize js -->
	<!-- modalEffects js nifty modal window effects -->
	<script type="text/javascript" src="../assets/js/modalEffects.js"></script>
	<script type="text/javascript" src="../assets/js/classie.js"></script>
	<!-- classie js -->
	<script type="text/javascript"
		src="../bower_components/classie/classie.js"></script>
	<!-- classie js -->
	<script type="text/javascript"
		src="../bower_components/classie/classie.js"></script>
	<!-- i18next.min.js -->
	<script type="text/javascript"
		src="../bower_components/i18next/i18next.min.js"></script>
	<script type="text/javascript"
		src="../bower_components/i18next-xhr-backend/i18nextXHRBackend.min.js"></script>
	<script type="text/javascript"
		src="../bower_components/i18next-browser-languagedetector/i18nextBrowserLanguageDetector.min.js"></script>
	<script type="text/javascript"
		src="../bower_components/jquery-i18next/jquery-i18next.min.js"></script>
	<!-- Custom js -->
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
		
		document.querySelector('.alert-prompt').onclick = function(){
		    swal({
		      title: "✓ 악성키워드 중복체크",
		      text: "악성키워드를 입력해주세요.",
		      type: "input",
		      showCancelButton: true,
		      closeOnConfirm: false,
		      inputValue:$("#swearword").val(),
		      inputPlaceholder: "악성 키워드 입력"
		    }, function (inputValue) {
		    	
		    	$.ajax({

					type : "POST",
				  	url : "checkSwearword",
			 	  	dataType : "text",
			 	  	data : {swearword : inputValue},
			  	  	success : function(data){
			  	  	if (inputValue === false){
				        swal.showInputError("키워드를 다시 입력해 주세요.");
				        return false;
				      }
				      if (inputValue == ""){
				        swal.showInputError("키워드를 다시 입력해 주세요.");
				        return false;
				      }
				      if (data != 0) {
				        swal.showInputError("키워드가 중복됩니다. 다시 입력해 주세요.");
				        return false
				      }
				      
				      $("#swearword").val(inputValue);
				      $("#keywordCheck").val("true");
				      $("#swearword").removeClass("form-control-danger");
				      $("#swearword").siblings().children("p").text("");
				      swal("중복확인!", inputValue+"는 사용가능한 키워드입니다.", "success");
			  	  	}
				});
		      
		    });
		  };
		
	}); // end ready...

</script>

</html>
