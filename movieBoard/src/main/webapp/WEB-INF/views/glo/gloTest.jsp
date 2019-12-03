<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
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
<title>Insert title here</title>
</head>
<body>
Hellow~ ${clientIP}
<input type="hidden" id='ip' value="${clientIP}">
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
	<script type="text/javascript" src="../assets/pages/advance-elements/bootstrap-datetimepicker.min.js"></script>
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
	var ip = $('#ip').val();
	console.log("ip : " + ip);
	$.ajax({
		type : "POST",
		url : "insertIP",
		data : {find_ip : ip},
		dataType : "json",
		success : function(data) {
			console.log(data);
		}
	});
	
}); // end ready...
</script>
</body>
     
</html>