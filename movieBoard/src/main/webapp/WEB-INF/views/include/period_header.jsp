<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="tab-header">
		<ul class="nav nav-tabs md-tabs tab-timeline" role="tablist"
			id="mytab">
			<a class="nav-item" href="../period/main">
				<li id="main" class="nav-link">
					<p>통계보고서</p>
					<div class="slide"></div>
			</li>
			</a>
			<a class="nav-item" href="../period/portal">
				<li id="portal" class="nav-link">
					<p>포털통계</p>
					<div class="slide"></div>
			</li>
			</a>
			<a class="nav-item" href="../period/community">
				<li id="community" class="nav-link">
					<p>커뮤니티통계</p>
					<div class="slide"></div>
			</li>
			</a>
			<a class="nav-item" href="../period/sns">
				<li id="sns" class="nav-link">
					<p>SNS통계</p>
					<div class="slide"></div>
			</li>
			</a>
			<a class="nav-item" href="../period/media">
				<li id="media" class="nav-link">
					<p>언론사통계</p>
					<div class="slide"></div>
			</li>
			</a>
		</ul>
	</div>
</body>
</html>

<script type="text/javascript" src="../bower_components/jquery/dist/jquery.min.js"></script>
  <script type="text/javascript" src="../bower_components/jquery-ui/jquery-ui.min.js"></script>
  <script type="text/javascript" src="../bower_components/tether/dist/js/tether.min.js"></script>
  <script type="text/javascript" src="../bower_components/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" >
	var selectOption = decodeURI(window.location.href.split("period/")[1]);
	console.log(selectOption);
	
	if(selectOption == 'main'){
		$("#main").addClass('active');
		
	}else if(selectOption == 'portal'){
		$("#portal").addClass('active');
		
	}else if(selectOption == 'community'){
		$("#community").addClass('active');
		
	}else if(selectOption == 'sns'){
		$("#sns").addClass('active');
		
	}else if(selectOption == 'media'){
		$("#media").addClass('active');
	}
</script>