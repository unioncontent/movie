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
  <meta name="robots" content="noindex,nofollow"/>
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
  <!-- font awesome -->
  <link rel="stylesheet" type="text/css" href="../assets/icon/font-awesome/css/font-awesome.css">
  <!-- Date-time picker css -->
  <link rel="stylesheet" type="text/css" href="../assets/pages/advance-elements/css/bootstrap-datetimepicker.css">
  <!-- Date-range picker css  -->
  <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- sweet alert framework -->
  <link rel="stylesheet" type="text/css" href="../bower_components/sweetalert/dist/sweetalert.css">
  <!-- Style.css -->
  <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/pages/reply/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/picker.css">
  <!--color css-->
  <link rel="stylesheet" type="text/css" href="../assets/css/color/color-1.css" id="color" />
  <link rel="stylesheet" type="text/css" href="../assets/css/linearicons.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/simple-line-icons.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/ionicons.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/jquery.mCustomScrollbar.css">
  <style type="text/css">
  .report{
  	margin: 0px auto;
  }
  .copyarea{
  	margin: 0px auto;
  }
  #reportdiv{
  	margin: 0px atuo;
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
                        <li class="breadcrumb-item"><a href="http://localhost:8080/manage/report">보고서관리</a>
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
					  <!-- <input type="button" class="btn btn-primary m-b-0 f-left select-left" data-toggle="modal" data-target="#press-modal" value="미리보기" onclick="fn_layer_popup()"> -->
                      <!-- <input type="button" class="btn btn-primary m-b-0 f-left select-left" data-toggle="modal" data-target="#press-modal" value="미리보기" onclick="PrintDiv()"> -->
					  
                      <div class="col-md-5" style="float: left;">
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
                      <div class="col-lg-12" id="hidden">
                        <!-- tab header start -->
                        <!-- tab header end -->
                        <!-- tab-content start -->
                         <div class="tab-content">
                          <!-- tab1 main start -->
                          <div class="tab-pane fade show active" id="main" role="tabpanel">
                            <div class="row">
                            <div class="col-lg-12">	
                              <div style="background-color:white; padding:20px; width: 100%;" class="card">
                              <div class="copyarea">
                              <table width="600" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                              <td align="right" colspan="2">
                              <input type="text" id="clip_target" value="" style="opacity: 0;">
                              <input type="button"  class="btn btn-primary f-right p-r-5 p-l-5 m-l-15 m-b-10 copyBtn" data-toggle="modal" data-target="#press-modal" value="복사">
                              <input type="button" class="btn btn-primary f-right p-r-5 p-l-5 m-l-15 m-b-10" data-toggle="modal" data-target="#press-modal" value="인쇄" onclick="PrintDiv()">
                              </td>
                              </tr>
                              <tr>
							  <td height="5" colspan="2"></td>
                              </tr>
                              </table>
							  </div>
                              <div class="report" id="reportdiv" style="margin: 0px auto;">
                              		<!-- 복사 시작 -->
                              			<table width="600" border="0" cellspacing="0" cellpadding="0" id="copyTabel">
									    <tbody><tr><td><table width="100%" border="0" cellspacing="0" cellpadding="0">
									    <tbody>
									    <tr>
									    <td align="left">
									    <img src="http://overware.iptime.org:8080/classification/show?name=/union_logo/union_logo.png" alt="Theme-Logo" style="margin-top: 3px;float: left; width: 150; height: 27;">
									    <!-- http://overware.iptime.org:8080/classification/show?name=/union_logo/union_logo.png -->
									    </td>
									    <td></td>
									    <td align="right" valign="bottom" style="color: rgb(153, 153, 153); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px;">
									    <a style="color: rgb(153, 153, 153); letter-spacing: -1px; font-family: gulim,verdana; font-size: 13px; text-decoration: none;" href="http://overware.co.kr" target="_blank" rel="noopener noreferrer">Admin</a>│
									    <a style="color: rgb(153, 153, 153); letter-spacing: -1px; font-family: gulim,verdana; font-size: 13px; text-decoration: none;" href="http://mail.overware.co.kr" target="_blank" rel="noopener noreferrer">Email</a>
									    </td>
									    </tr>
									    </tbody>
									    </table>
									    </td>
									    </tr>
									    <tr>
									    <td height="11">
									    </td>
									    </tr>
									    <tr>
									    <td>
                              			<table width="600" border="0" cellspacing="0" cellpadding="0">
									      <tbody>
									      <tr>
									      <td>
									      	<table width="100%" border="0" cellspacing="0" cellpadding="0">
									            <tbody>
									            <tr>
									            <td align="center" style="border: 4px solid rgb(55, 70, 112); border-image: none;">
									            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
									                  <tbody>
									                  <tr>
									                  <td align="center">
									                  <table width="556" border="0" cellspacing="0" cellpadding="0">
									                        <tbody>
									                        <tr>
									                        	<td height="15"></td>
									                        </tr>
									                        <tr>
									                        <td align="center"style="font-family: font-family :'나눔고딕', 'Malgun Gothic', sans-serif; font-size: 20px; font-weight: 900;">
									                        	<h4>
									                        	<c:if test="${user.user_type == 1}">
									                        	<b>< ${company} : ${selectKey} > <font style="color: rgb(34, 66, 145)">일일 보고서</font></b>
									                        	</c:if>
									                        	<c:if test="${user.user_type == 2}">
									                        	<b>< 쇼박스 : ${selectKey} > <font style="color: rgb(34, 66, 145)">일일 보고서</font></b>
									                        	</c:if>
									                        	</h4>
									                        </td>
									                        </tr>
									                        <tr>
									                        	<td height="15"></td>
									                        </tr>	
									                        <tr>
									                        	<td height="1" bgcolor="#d4d8e1"></td>
									                        </tr>
									                        <tr>
									                        <td align="center" height="20" style="color: rgb(78, 78, 78); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 14px; font-weight: bold;"></td>
									                        </tr>
									                        <tr>
									                        <td align="center" height="47" style="border: 1px solid rgb(122, 187, 240); border-image: none;">
									                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
									                              <tbody>
									                              <tr>
									                              <td height="1" bgcolor="#e4e4e4"></td>
									                              <td bgcolor="#e4e4e4"></td>
									                              <td height="1" bgcolor="#e4e4e4"></td>
									                              </tr>
									                              <tr>
									                              <td align="center" style="color: rgb(57, 130, 199); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 12px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;" bgcolor="#eff7ff">키워드</td>
									                              <td> </td>
									                              <td align="left" style="padding: 10px 10px 10px 0px; color: rgb(102, 102, 102); line-height: 18px; letter-spacing: -1px; font-family: Gulim,verdana; font-size: 12px;"> 
									                              <c:if test="${getKeyword != null}">
										                          	<c:forEach items="${getKeyword}" var = "getKeyword" varStatus="status">
										                          	&nbsp;${getKeyword.keyword}
										                          	<c:if test="${!status.last}">
										                            ,
										                            </c:if>
										                          </c:forEach>
										                          </c:if>
										                          </td></tr>
									                              <tr><td height="1" bgcolor="#e4e4e4"></td><td bgcolor="#e4e4e4"></td><td height="1" bgcolor="#e4e4e4"></td></tr><tr><td align="center" style="color: rgb(57, 130, 199); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 12px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;" bgcolor="#eff7ff">보고기간</td><td> </td><td align="left" style="padding: 10px 10px 10px 0px; color: rgb(102, 102, 102); line-height: 18px; letter-spacing: -1px; font-family: Gulim,verdana; font-size: 12px;">&nbsp;${startDate} ~ ${endDate }</td></tr>
									                              <tr><td height="1" bgcolor="#e4e4e4"></td><td bgcolor="#e4e4e4"></td><td height="1" bgcolor="#e4e4e4"></td></tr><tr><td align="center" style="color: rgb(57, 130, 199); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 12px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;" bgcolor="#eff7ff">보고날짜</td><td> </td><td align="left" style="padding: 10px 10px 10px 0px; color: rgb(102, 102, 102); line-height: 18px; font-family: Gulim,verdana; font-size: 12px;">&nbsp;${today}</td></tr></tbody></table></td></tr><tr><td align="center">
									                              
																		<table width="100%" border="0" cellspacing="0" cellpadding="0">
									                              		<tbody>
									                              		<tr>
									                              		<td height="25"></td>
									                              		</tr>
									                              		<tr>
									                              		<td align="left">
									                              		<table width="100%" border="0" cellspacing="0" cellpadding="0">
									                                    <tbody>
									                                    <tr>
									                                    <td align="left" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 13px; font-weight: bold;"><img align="absmiddle" width="3" height="3" src="http://file1.jobkorea.co.kr/Mailing/report/bullet.gif"> 통계현황</td>
									                                    <td align="right" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px;"></td>
									                                    </tr>
									                                    </tbody>
									                                    </table></td>
									                                    </tr>
									                                    <tr>
									                                    <td height="10"></td>
									                                    </tr>
									                                    <tr>
									                                    <td style="border: 1px solid rgb(228, 228, 228); border-image: none;">
									                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
									                                    <tbody>
										                                    <tr>
										                                    <td align="center" width="131" height="30" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 13px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid; border-bottom-color: rgb(228, 228, 228); border-bottom-width: 1px; border-bottom-style: solid;" bgcolor="#fffedd">포털</td>
										                                    <td align="center" width="131" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 13px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid; border-bottom-color: rgb(228, 228, 228); border-bottom-width: 1px; border-bottom-style: solid;" bgcolor="#fffedd">커뮤니티</td>
										                                    <td align="center" width="131" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 13px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid; border-bottom-color: rgb(228, 228, 228); border-bottom-width: 1px; border-bottom-style: solid;" bgcolor="#fffedd">NEWS</td>
										                                    <td align="center" width="131" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 13px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid; border-bottom-color: rgb(228, 228, 228); border-bottom-width: 1px; border-bottom-style: solid;" bgcolor="#fffedd">SNS</td>
										                                    <td align="center" width="131" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 13px; font-weight: bold; border-bottom-color: rgb(228, 228, 228); border-bottom-width: 1px; border-bottom-style: solid;" bgcolor="#fffedd">합계</td></tr>
										                                    <tr>
									                                    </tr>
									                                    <tr>
									                                    <td align="center" height="28" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 13px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${portalCount}" pattern="#,##0" /> 건</td>
									                                    <td align="center" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 13px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${communityCount}" pattern="#,##0" /> 건</td>
									                                    <td align="center" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 13px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${mediaCount}" pattern="#,##0" /> 건</td>
									                                    <td align="center" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 13px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${snsCount}" pattern="#,##0" /> 건</td>
									                                    <td align="center" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 13px; font-weight: bold;"><fmt:formatNumber value="${portalCount+communityCount+snsCount+mediaCount}" pattern="#,##0" /> 건</td></tr></tbody></table>
									                                    </tr>
									                                    <tr>
									                                    <td height="15"></td></tr><tr><td align="left" style="color: rgb(153, 153, 153); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px;">
									  									</td>
									  									</tr>
									  									<tr>
									  									<td height="20"></td>
									  									</tr>
									  									<tr>
									  									<td height="1" bgcolor="#d7d8dc"></td>
									  									</tr>
									  									<tr>
									  									<td height="20"> </td>
									  									<tr>
									  									<td align="left">
									                              		<table width="100%" border="0" cellspacing="0" cellpadding="0">
									                                    <tbody>
									                                    <tr>
									                                    <!-- 포털 현황  start-->
									                                    <tr>
									                                    <td align="left" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold;"><img align="absmiddle" width="3" height="3" src="http://file1.jobkorea.co.kr/Mailing/report/bullet.gif"> 포털 현황 / NAVER</td>
									                                    <td> </td><td align="left" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold;"><img align="absmiddle" width="3" height="3" src="http://file1.jobkorea.co.kr/Mailing/report/bullet.gif"> 포털 현황 / DAUM</td></tr>
									                                    <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
								                                          <tbody><tr><td style="border: 1px solid rgb(228, 228, 228); border-image: none;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
								                                                <tbody><tr>
								                                                <td align="center" width="112" height="22" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;" bgcolor="#f7f7f7">분류</td>
								                                                <td align="center" width="75" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;" bgcolor="#f7f7f7">검출량</td>
								                                                <td align="center" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold;" bgcolor="#f7f7f7">비율</td></tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="3"></td></tr>
								                                                <tr>
								                                                <td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">블로그(Blog)</td>
								                                                <c:forEach items="${naver1}" var="count">
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${count.lik + count.dis + count.cu + count.etc}" pattern="#,##0" /></td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                <c:if test="${count.lik + count.dis + count.cu + count.etc != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${(count.lik + count.dis + count.cu + count.etc)/naverCount * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${count.lik + count.dis + count.cu + count.etc == 0}">
								                                                0%
								                                                </c:if>
								                                                
								                                                </td>
								                                                </c:forEach>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="3"></td></tr><tr><td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">카페(Cafe)</td>
								                                                <c:forEach items="${naver2}" var="count">
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${count.lik + count.dis + count.cu + count.etc}" pattern="#,##0" /></td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                <c:if test="${count.lik + count.dis + count.cu + count.etc != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${(count.lik + count.dis + count.cu + count.etc)/naverCount * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${count.lik + count.dis + count.cu + count.etc == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                                </c:forEach>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="3"></td></tr><tr><td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">지식인</td>
								                                                <c:forEach items="${naver3}" var="count">
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${count.lik + count.dis + count.cu + count.etc}" pattern="#,##0" /></td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                <c:if test="${count.lik + count.dis + count.cu + count.etc != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${(count.lik + count.dis + count.cu + count.etc)/naverCount * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${count.lik + count.dis + count.cu + count.etc == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                                </c:forEach>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="3"></td></tr><tr><td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">웹문서</td>
								                                                <c:forEach items="${naver4}" var="count">
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${count.lik + count.dis + count.cu + count.etc}" pattern="#,##0" /></td>
								                                                
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                <c:if test="${count.lik + count.dis + count.cu + count.etc != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${(count.lik + count.dis + count.cu + count.etc)/naverCount * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${count.lik + count.dis + count.cu + count.etc == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                                </c:forEach>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="3"></td>
								                                                </tr>
								                                                <tr>
								                                                <td align="center" height="22" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">합계</td>
								                                                
								                                                <td align="center" width="75" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${naverCount}" pattern="#,##0" /></td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; font-weight: bold;">
								                                                <c:if test="${naverCount != 0}">
								                                                100%
								                                                </c:if>
								                                                <c:if test="${naverCount == 0}">
								                                                0%
								                                                </c:if>
								                                                </td></tr></tbody></table></td></tr></tbody></table>
								                                                </td>
								                                                <td width="10"> </td>
								                                                
								                                        <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
								                                          <tbody><tr><td style="border: 1px solid rgb(228, 228, 228); border-image: none;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
								                                          <tbody><tr>
								                                          
								                                          <td align="center" width="112" height="22" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;" bgcolor="#f7f7f7">분류</td>
								                                                <td align="center" width="75" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;" bgcolor="#f7f7f7">검출량</td>
								                                                <td align="center" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold;" bgcolor="#f7f7f7">비율</td></tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="3"></td></tr>
								                                                <tr>
								                                                <td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">블로그(Blog)</td>
								                                                <c:forEach items="${daum1}" var="count">
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${count.lik + count.dis + count.cu + count.etc}" pattern="#,##0" /></td>
								                                                
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                <c:if test="${count.lik + count.dis + count.cu + count.etc != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${(count.lik + count.dis + count.cu + count.etc)/daumCount * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${count.lik + count.dis + count.cu + count.etc == 0}">
								                                                0%
								                                                </c:if>
								                                                
								                                                </td>
								                                                </c:forEach>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="3"></td></tr><tr><td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">카페(Cafe)</td>
								                                                <c:forEach items="${daum2}" var="count">
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${count.lik + count.dis + count.cu + count.etc}" pattern="#,##0" /></td>
								                                                
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                <c:if test="${count.lik + count.dis + count.cu + count.etc != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${(count.lik + count.dis + count.cu + count.etc)/daumCount * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${count.lik + count.dis + count.cu + count.etc == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                                </c:forEach>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="3"></td></tr><tr><td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">Tip</td>
								                                                <c:forEach items="${daum3}" var="count">
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${count.lik + count.dis + count.cu + count.etc}" pattern="#,##0" /></td>
								                                                
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                <c:if test="${count.lik + count.dis + count.cu + count.etc != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${(count.lik + count.dis + count.cu + count.etc)/daumCount * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${count.lik + count.dis + count.cu + count.etc == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                                </c:forEach>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="3"></td></tr><tr><td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">웹문서</td>
								                                                <c:forEach items="${daum4}" var="count">
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${count.lik + count.dis + count.cu + count.etc}" pattern="#,##0" /></td>
								                                                
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                <c:if test="${count.lik + count.dis + count.cu + count.etc != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${(count.lik + count.dis + count.cu + count.etc)/daumCount * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${count.lik + count.dis + count.cu + count.etc == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                                </c:forEach>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="3"></td>
								                                                </tr>
								                                                <tr>
								                                                <td align="center" height="22" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">합계</td>
								                                                <td align="center" width="75" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${daumCount}" pattern="#,##0" /></td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; font-weight: bold;">
								                                                <c:if test="${daumCount != 0}">
								                                                100%
								                                                </c:if>
								                                                <c:if test="${daumCount == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                          
								                                          </tr></tbody></table></td></tr></tbody></table>
								                                          </td>
									                                    </tr>
									                                    <!-- 포털 현황  end-->
									                                    <td height="25"> </td>
									                                    <!-- sns 현황 start-->
									                                    <tr>
									                                    <td align="left" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold;"><img align="absmiddle" width="3" height="3" src="http://file1.jobkorea.co.kr/Mailing/report/bullet.gif"> SNS 현황 / facebook</td>
									                                    <td> </td><td align="left" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold;"><img align="absmiddle" width="3" height="3" src="http://file1.jobkorea.co.kr/Mailing/report/bullet.gif"> 커뮤니티 현황 / Community site</td></tr>
									                                    <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
								                                          <tbody><tr><td style="border: 1px solid rgb(228, 228, 228); border-image: none;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
								                                                <tbody><tr>
								                                                <td align="center" width="60" height="22" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;" bgcolor="#f7f7f7">분류</td>
								                                                <td align="center" width="50" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;" bgcolor="#f7f7f7">좋아요</td>
								                                                <td align="center" width="35" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;" bgcolor="#f7f7f7">공유</td>
								                                                <td align="center" width="35" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;" bgcolor="#f7f7f7">댓글</td>
								                                                <td align="center" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold;" bgcolor="#f7f7f7">비율</td></tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="5"></td></tr>
								                                                <tr>
								                                                <td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">페이스북</td>
								                                                <c:forEach items="${snsTotalCnt}" var="countTotal">
								                                                <c:forEach items="${facebookCnt}" var="count">
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">
								                                                <c:if test="${count.like_cnt == null }">
								                                                0
								                                                </c:if>
								                                                <fmt:formatNumber value="${count.like_cnt}" pattern="#,##0" />
								                                                </td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">
								                                                <c:if test="${count.share_cnt == null }">
								                                                0
								                                                </c:if>
								                                                <fmt:formatNumber value="${count.share_cnt}" pattern="#,##0" />
								                                                </td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">
								                                                <c:if test="${count.reply_cnt == null }">
								                                                0
								                                                </c:if>
								                                                <fmt:formatNumber value="${count.reply_cnt}" pattern="#,##0" />
								                                                </td>
								                                                
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                
								                                                <c:if test="${count.like_cnt + count.share_cnt + count.reply_cnt != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${(count.like_cnt + count.share_cnt + count.reply_cnt)/(countTotal.like_cnt + countTotal.share_cnt + countTotal.reply_cnt) * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${count.like_cnt + count.share_cnt + count.reply_cnt == 0}">
								                                                0%
								                                                </c:if>
								                                                
								                                                </td>
								                                                </c:forEach>
								                                                </c:forEach>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="5"></td>
								                                                </tr>
								                                                <tr>
								                                                <td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">트위터</td>
								                                                <c:forEach items="${snsTotalCnt}" var="countTotal">
								                                                <c:forEach items="${twiCnt}" var="count">
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">
								                                                <c:if test="${count.like_cnt == null }">
								                                                0
								                                                </c:if>
								                                                <fmt:formatNumber value="${count.like_cnt}" pattern="#,##0" />
								                                                </td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">
								                                                <c:if test="${count.share_cnt == null }">
								                                                0
								                                                </c:if>
								                                                <fmt:formatNumber value="${count.share_cnt}" pattern="#,##0" />
								                                                </td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">
								                                                <c:if test="${count.reply_cnt == null }">
								                                                0
								                                                </c:if>
								                                                <fmt:formatNumber value="${count.reply_cnt}" pattern="#,##0" />
								                                                </td>
								                                                
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                <c:if test="${count.like_cnt + count.share_cnt + count.reply_cnt != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${(count.like_cnt + count.share_cnt + count.reply_cnt)/(countTotal.like_cnt + countTotal.share_cnt + countTotal.reply_cnt) * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${count.like_cnt + count.share_cnt + count.reply_cnt == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                                </c:forEach>
								                                                </c:forEach>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="5"></td></tr><tr><td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">인스타그램</td>
								                                                <c:forEach items="${snsTotalCnt}" var="countTotal">
								                                                <c:forEach items="${instaCnt}" var="count">
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">
								                                                <c:if test="${count.like_cnt == null }">
								                                                0
								                                                </c:if>
								                                                <fmt:formatNumber value="${count.like_cnt}" pattern="#,##0" />
								                                                </td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">
								                                                <c:if test="${count.share_cnt == null }">
								                                                0
								                                                </c:if>
								                                                <fmt:formatNumber value="${count.share_cnt}" pattern="#,##0" />
								                                                </td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">
								                                                <c:if test="${count.reply_cnt == null }">
								                                                0
								                                                </c:if>
								                                                <fmt:formatNumber value="${count.reply_cnt}" pattern="#,##0" />
								                                                </td>
								                                                
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                <c:if test="${count.like_cnt + count.share_cnt + count.reply_cnt != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${(count.like_cnt + count.share_cnt + count.reply_cnt)/(countTotal.like_cnt + countTotal.share_cnt + countTotal.reply_cnt) * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${count.like_cnt + count.share_cnt + count.reply_cnt == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                                </c:forEach>
								                                                </c:forEach>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="5"></td>
								                                                </tr>
								                                                <tr>
								                                                <td align="center" height="25" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">합계</td>
								                                                <c:forEach items="${snsTotalCnt}" var="countTotal">
								                                                <td align="center" width="50" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">
								                                                <c:if test="${countTotal.like_cnt == null }">
								                                                0
								                                                </c:if>
								                                                <fmt:formatNumber value="${countTotal.like_cnt}" pattern="#,##0" />
								                                                </td>
								                                                <td align="center" width="35" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">
								                                                <c:if test="${countTotal.share_cnt == null }">
								                                                0
								                                                </c:if>
								                                                <fmt:formatNumber value="${countTotal.share_cnt}" pattern="#,##0" />
								                                                </td>
								                                                <td align="center" width="35" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">
								                                                <c:if test="${countTotal.reply_cnt == null }">
								                                                0
								                                                </c:if>
								                                                <fmt:formatNumber value="${countTotal.reply_cnt}" pattern="#,##0" />
								                                                </td>
								                                                
								                                                <td align="center" width="35" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; font-weight: bold;">
								                                                <c:if test="${countTotal.like_cnt + countTotal.share_cnt + countTotal.reply_cnt != 0}">
								                                                100%
								                                                </c:if>
								                                                <c:if test="${countTotal.like_cnt + countTotal.share_cnt + countTotal.reply_cnt == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                                </c:forEach>
								                                                </tr></tbody></table></td></tr></tbody></table>
								                                                </td>
								                                                <td width="10"> </td>
								                                                
								                                        <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
								                                          <tbody><tr><td style="border: 1px solid rgb(228, 228, 228); border-image: none;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
								                                          <tbody><tr>
								                                          
								                                          <td align="center" width="112" height="22" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;" bgcolor="#f7f7f7">분류</td>
								                                                <td align="center" width="75" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;" bgcolor="#f7f7f7">검출량</td>
								                                                <td align="center" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold;" bgcolor="#f7f7f7">비율</td></tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="3"></td></tr>
								                                                <tr>
								                                                <td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">좋은글</td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${type1}" pattern="#,##0" /></td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                
								                                                <c:if test="${type1 != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${type1/(type1+type2+type3+type4) * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${type1 == 0}">
								                                                0%
								                                                </c:if>
								                                                
								                                                </td>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="5"></td></tr><tr><td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">나쁜글</td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${type2}" pattern="#,##0" /></td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                <c:if test="${type2 != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${type2/(type1+type2+type3+type4) * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${type2 == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="5"></td></tr><tr><td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">관심글</td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${type3}" pattern="#,##0" /></td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                <c:if test="${type3 != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${type3/(type1+type2+type3+type4) * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${type3 == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="5"></td></tr><tr><td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">기타</td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${type4}" pattern="#,##0" /></td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                <c:if test="${type4 != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${type1/(type1+type2+type3+type4) * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${type4 == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="5"></td>
								                                                </tr>
								                                                <tr>
								                                                <td align="center" height="22" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">합계</td>
								                                                <td align="center" width="75" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${type1+type2+type3+type4}" pattern="#,##0" /></td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; font-weight: bold;">
								                                                <c:if test="${type1+type2+type3+type4 != 0}">
								                                                100%
								                                                </c:if>
								                                                <c:if test="${type1+type2+type3+type4 == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                          
								                                          </tr></tbody></table></td></tr></tbody></table>
								                                          </td>
									                                    </tr>
									                                    <!-- sns 현황 end-->
									                                    <td height="25"> </td>
									                                    <!-- 언론사 현황 start-->
									                                    <tr>
									                                    <td align="left" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold;"><img align="absmiddle" width="3" height="3" src="http://file1.jobkorea.co.kr/Mailing/report/bullet.gif"> 언론사 현황 / NEWS</td>
									                                    <td> </td><td align="left" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold;"><img align="absmiddle" width="3" height="3" src="http://file1.jobkorea.co.kr/Mailing/report/bullet.gif"> 평점현황</td></tr>
									                                    <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
								                                          <tbody><tr><td style="border: 1px solid rgb(228, 228, 228); border-image: none;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
								                                                <tbody><tr>
								                                                <td align="center" width="112" height="22" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;" bgcolor="#f7f7f7">분류</td>
								                                                <td align="center" width="75" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;" bgcolor="#f7f7f7">검출량</td>
								                                                <td align="center" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold;" bgcolor="#f7f7f7">비율</td></tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="3"></td></tr>
								                                                <tr>
								                                                <td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">좋은글</td>
								                                                <c:forEach items="${mediaCnt}" var="count">
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${count.lik}" pattern="#,##0" /></td>
								                                                
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                
								                                                <c:if test="${count.lik != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${(count.lik/count.al) * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${count.lik == 0}">
								                                                0%
								                                                </c:if>
								                                                
								                                                </td>
								                                                </c:forEach>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="5"></td></tr><tr><td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">나쁜글</td>
								                                                <c:forEach items="${mediaCnt}" var="count">
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${count.dis}" pattern="#,##0" /></td>
								                                                
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                <c:if test="${count.dis != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${(count.dis/count.al) * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${count.dis == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                                </c:forEach>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="5"></td></tr><tr><td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">관심글</td>
								                                                <c:forEach items="${mediaCnt}" var="count">
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${count.cu}" pattern="#,##0" /></td>
								                                                
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                <c:if test="${count.cu != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${(count.cu/count.al) * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${count.cu == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                                </c:forEach>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="5"></td></tr><tr><td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">기타</td>
								                                                <c:forEach items="${mediaCnt}" var="count">
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${count.etc}" pattern="#,##0" /></td>
								                                                
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                <c:if test="${count.etc != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${(count.etc/count.al) * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${count.etc == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                                </c:forEach>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="5"></td>
								                                                </tr>
								                                                <tr>
								                                                <td align="center" height="22" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">합계</td>
								                                                <c:forEach items="${mediaCnt}" var="count">
								                                                <td align="center" width="75" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${count.al}" pattern="#,##0" /></td>
								                                                
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; font-weight: bold;">
								                                                <c:if test="${count.al != 0}">
								                                                100%
								                                                </c:if>
								                                                <c:if test="${count.al == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                                </c:forEach></tr></tbody></table></td></tr></tbody></table>
								                                                </td>
								                                                <td width="10"> </td>
								                                                
								                                        <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
								                                          <tbody><tr><td style="border: 1px solid rgb(228, 228, 228); border-image: none;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
								                                          <tbody>
								                                          <tr>
								                                          <td align="center" width="112" height="22" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;" bgcolor="#f7f7f7">분류</td>
								                                                <td align="center" width="75" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;" bgcolor="#f7f7f7">검출량</td>
								                                                <td align="center" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold;" bgcolor="#f7f7f7">비율</td></tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="3"></td></tr>
								                                                <tr>
								                                                <td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">좋은글(10~8)</td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${textType.lik}" pattern="#,##0" /></td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                <c:if test="${textType.lik != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${(textType.lik/textType.al) * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${textType.lik == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="5"></td></tr><tr><td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">관심글(7~5)</td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${textType.cu}" pattern="#,##0" /></td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                <c:if test="${textType.cu != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${(textType.cu/textType.al) * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${textType.cu == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="5"></td></tr><tr><td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">나쁜글(4~2)</td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${textType.dis}" pattern="#,##0" /></td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                <c:if test="${textType.dis != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${(textType.dis/textType.al) * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${textType.dis == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="5"></td></tr><tr><td align="center" height="22" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">악성글(1)</td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${textType.etc}" pattern="#,##0" /></td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px;">
								                                                <c:if test="${textType.etc != 0}">
								                                                <fmt:parseNumber var="pages" integerOnly="true" value="${(textType.dis/textType.al) * 100}"></fmt:parseNumber>${pages}%
								                                                </c:if>
								                                                <c:if test="${textType.etc == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                                </tr>
								                                                <tr bgcolor="#e4e4e4"><td height="1" colspan="5"></td>
								                                                </tr>
								                                                <tr>
								                                                <td align="center" height="22" style="color: rgb(102, 102, 102); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;">합계</td>
								                                                <td align="center" width="75" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; font-weight: bold; border-right-color: rgb(228, 228, 228); border-right-width: 1px; border-right-style: solid;"><fmt:formatNumber value="${textType.al}" pattern="#,##0" /></td>
								                                                <td align="center" style="color: rgb(102, 102, 102); font-family: Gulim,verdana; font-size: 11px; font-weight: bold;">
								                                                <c:if test="${textType.al != 0}">
								                                                100%
								                                                </c:if>
								                                                <c:if test="${textType.al == 0}">
								                                                0%
								                                                </c:if>
								                                                </td>
								                                          </tr>
								                                          </tbody></table></td></tr></tbody></table></td></tbody></table>
								                                          </td>
									                                    </tr>
									                                    <td height="25"> </td>
									                                    <!-- 언론사 현황 end-->
									                                    </tbody>
									                                    </table>
									                                    </td>
									                                    </tr>
									                                    </tbody>
									                                    <tr>
									                                    <td height="15"></td>
									                                    </tr>
									                                    <tr>
									                                    <td align="left" style="color: rgb(153, 153, 153); letter-spacing: -1px; font-family: Gulim,verdana; font-size: 11px;">
									  									</td>
									  									</tr>						
  																		</table>
  																		</td>
  																		</tr>
  																		</tbody>
  																		</table>
  																		</td>
  																		</tr>
  																		</tbody>
  																		</table>
  																		</td>
  																		</tr>
  																	</tbody>
  																</table>
  															</td>
  														</tr>
  													</tbody>
  												</table>
  												<!-- 복사 끝 -->
  											</div>
  										</div>
  									</div>
  								</div>
  							</div>
  						</div>
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
			console.log($('#selectKeyword option:selected').val());

			searchList();

		});
		
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
	
	// 복사  클릭시
	$('.copyBtn').on('click', function(e) { 
		// div의 텍스트값을 가져옴 
		var text = $("#reportdiv").clone().wrapAll("<div/>").parent().html(); 
		//숨겨진 input박스 value값으로 text 변수 넣어줌. 
		$('#clip_target').val(text); 
		//input박스 value를 선택
		$('#clip_target').select(); 
		// Use try & catch for unsupported browser 
		try { 
			// The important part (copy selected text) 
			var successful = document.execCommand('copy'); 
			// if(successful) answer.innerHTML = 'Copied!'; 
			// else answer.innerHTML = 'Unable to copy!'; 
			} catch (err) { 
				alert('이 브라우저는 지원하지 않습니다.') 
			}
	});
	
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
  
  function fn_layer_popup() {
	  
	  
	  var w = window.open(); 
	  w.document.write( $("#hidden").html() ); 
	  w.document.close(); // 페이지 로딩 끝.
	
}
  function PrintDiv() {
      var contents = document.getElementById("reportdiv").innerHTML;
      var frame1 = document.createElement('iframe');
      frame1.name = "frame1";
      frame1.style.position = "absolute";
      frame1.style.top = "-1000000px";
      document.body.appendChild(frame1);
      var frameDoc = (frame1.contentWindow) ? frame1.contentWindow : (frame1.contentDocument.document) ? frame1.contentDocument.document : frame1.contentDocument;
      frameDoc.document.open();
      frameDoc.document.write('<html><head>');
      frameDoc.document.write('</head><body>');
      frameDoc.document.write(contents);
      frameDoc.document.write('</body></html>');
      frameDoc.document.close();
      setTimeout(function () {
          window.frames["frame1"].focus();
          window.frames["frame1"].print();
          document.body.removeChild(frame1);
      }, 500);
      return false;
  }
  
  
</script>
</html>
