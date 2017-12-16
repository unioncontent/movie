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
			<a class="nav-item">
				<li id="main" class="nav-link">
					<p>통계보고서</p>
					<div class="slide"></div>
			</li>
			</a>
			<a class="nav-item">
				<li id="portal" class="nav-link">
					<p>포털통계</p>
					<div class="slide"></div>
			</li>
			</a>
			<a class="nav-item">
				<li id="community" class="nav-link">
					<p>커뮤니티통계</p>
					<div class="slide"></div>
			</li>
			</a>
			<a class="nav-item">
				<li id="sns" class="nav-link">
					<p>SNS통계</p>
					<div class="slide"></div>
			</li>
			</a>
			<a class="nav-item">
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
	var selectOption = decodeURI(window.location.href.split("period/")[1]).split("?")[0];
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
	
	$(".nav-item").on("click", function(event){

		var part = event.currentTarget.children[0].id;

		var parameter = decodeURI(window.location.href.split("period/")[1]).split("?")[1];
		console.log("parameter: " + parameter);
		
		
		if(parameter == undefined){
			self.location = "../period/" + part;
		
		}else{
			
			var first = parameter.split("page=")[0];
			var second = parameter.split("page=")[1];
			
			second = "1" + second.substr(1);
			
			parameter = first + "page=" + second;
			
			self.location = "../period/" + part + "?" + parameter;
		}
		
	});
	
</script>