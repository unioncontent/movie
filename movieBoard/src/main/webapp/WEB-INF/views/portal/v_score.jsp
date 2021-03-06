﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
  <!-- Redial css -->
  <link rel="stylesheet" href="../assets/pages/chart/radial/css/radial.css" type="text/css" media="all">
  <!-- Style.css -->
  <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/pages/viral/css/style.css">
  <link rel="stylesheet" type="text/css" href="../assets/css/picker.css">
  <link rel="stylesheet" type="text/css" href="../assets/pages/naver/css/style.css">
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
                      <h4>평점관리</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="../dashBoard/dashBoard_main">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">네이버평점관리</a></li>
                      </ul>
                    </div>
                  </div>
                  <!-- page-body start -->
                  <div class="page-body">
                    <div class="row">
                      <!-- data setting start -->
                      <div class="col-md-6">
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
                        <select name="select" class="col-md-1 form-control form-control-inverse m-b-10 m-l-0 p-r-5 f-left select-left" id="selectKeyword">
                          <option>키워드</option>
                          <c:if test="${modelKeywordList == null}" >
                          	<c:forEach items="${keywordList}" var = "keywordList">
                          <option value="${keywordList.keyword_main}">${keywordList.keyword_main}</option>
                          </c:forEach>
                          </c:if>
                          <c:if test="${modelKeywordList != null}">
                          	<c:forEach items="${modelKeywordList}" var = "keywordList">
                          	<%-- ${keywordList.keyword_main} --%>
                          		<c:if test="${'포함' eq keywordList.keyword_property}">
	                          		<option value="${keywordList.keyword_main}">${keywordList.keyword_main}</option>
	                          	</c:if>
	                          	<c:if test="${'포함0' eq keywordList.keyword_property}">
	                          		<option value="${keywordList.keyword_main}" style="display: none;">${keywordList.keyword_main}</option>
	                          	</c:if>
                          </c:forEach>
                          </c:if>
                        </select>
						</c:if>
                      </div>
                      <div class="col-md-5">
                        <!-- date picker start -->
                        <div class="row">
                          <div class="btn-group float-right m-b-10 p-l-15 p-r-10" role="group">
                            <button id="toDay" type="button" class="btn btn-inverse btn-sm waves-effect waves-light">당일</button>
                            <button id="yesterDay" type="button" class="btn btn-inverse btn-sm waves-effect waves-light">전일</button>
                            <button id="week" type="button" class="btn btn-inverse btn-sm waves-effect waves-light">최근7일</button>
                            <button id="month" type="button" class="btn btn-inverse btn-sm waves-effect waves-light">최근30일</button>
                          </div>
                          <div class="input-group float-right date col p-l-15 p-r-15 m-b-10">
                            <input type="text" id="fromDate" class="form-control form-control-inverse" value="" style="text-align: center;">
                            <span class="input-group-addon bg-inverse">
                              <span class="icofont icofont-ui-calendar"></span>
                            </span>
                          </div>
                        </div>
                        <!-- date picker end -->
                      </div>
                      <!-- data setting end -->
                      <div class="col-lg-12">
                        <div class="tab-content">
                          <div class="tab-pane fade show active" id="main" role="tabpanel">
                            <div class="row">
                              <div class="col-md-6 col-xl-3">
                                <div class="card client-blocks">
                                  <div class="card-block-big card1">
                                    <h5 class="mt"  style="font-size: 25px; padding-top: 5px;">
                                    <font style="font-weight: bold; color: black;">
                                    	전체건수
                                    </font>
                                    </h5>
                                    <ul>
                                      <li class="p-t-10">
                                        <i class="icofont icofont-document-search"></i>
                                      </li>
                                      <li class="text-right"><fmt:formatNumber value="${totalCount}" groupingUsed="true"/></li>
                                    </ul>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6 col-xl-6">
              							    <div class="col-sm-3 p-l-0 p-r-0 f-left">
              							      <div class="card user-activity-card" style="border-radius: 0;">
              							        <div class="card-header">
              							          <div>
              							            <h5><font style="font-weight: bold; color: black;">좋은글</font></h5>
              							            <span>점수 범위 : 10 ~ 8</span>
              							          </div>
              							        </div>
              							        <div class="card-block-big text-center typography" style="padding-left: 5px;padding-right: 5px;">
              							          <div style="height: 50px;display: inline-block;">
              							            <h1 class="text-success f-left">${textType.lik}</h1>
              							            <label class="badge badge-inverse f-left">
              							              <c:if test="${textType.al != 0}">
                							              <fmt:parseNumber var="pages" integerOnly="true" value="${(textType.lik/textType.al) * 100}"></fmt:parseNumber>
			                                            ${pages}%
			                                          </c:if>
			                                          <c:if test="${textType.al == 0}">
                							              0%
                                          			</c:if>
              							            </label>
              							          </div>
              							        </div>
              							      </div>
              							    </div>
              							    <div class="col-sm-3 p-l-0 p-r-0 f-left">
              							      <div class="card user-activity-card" style="border-radius: 0;">
              							        <div class="card-header">
              							          <h5><font style="font-weight: bold; color: black;">관심글</font></h5>
              							          <span>점수 범위 : 7 ~ 5</span>
              							        </div>
              							        <div class="card-block-big text-center typography" style="padding-left: 5px;padding-right: 5px;">
              							          <div style="height: 50px;display: inline-block;">
              							            <h1 class="text-primary f-left">${textType.cu}</h1>
              							            <label class="badge badge-inverse f-left">
                							            <c:if test="${textType.al != 0}">
                							              <fmt:parseNumber var="pages" integerOnly="true" value="${(textType.cu/textType.al) * 100}"></fmt:parseNumber>
                                            ${pages}%
                                          </c:if>
                                          <c:if test="${textType.al == 0}">
                							              0%
                                          </c:if>
              							            </label>
              							          </div>
              							        </div>
              							      </div>
              							    </div>
              							    <div class="col-sm-3 p-l-0 p-r-0 f-left">
              							      <div class="card user-activity-card" style="border-radius: 0;">
              							        <div class="card-header">
              							          <h5>
              							          <font style="font-weight: bold; color: black;">
              							          나쁜글
              							          </font>
              							          </h5>
              							          <span>점수 범위 : 4 ~ 2</span>
              							        </div>
              							        <div class="card-block-big text-center typography" style="padding-left: 5px;padding-right: 5px;">
              							          <div style="height: 50px;display: inline-block;">
              							            <h1 class="text-warning f-left">${textType.dis}</h1>
              							            <label class="badge badge-inverse f-left">
                							            <c:if test="${textType.al != 0}">
                							              <fmt:parseNumber var="pages" integerOnly="true" value="${(textType.dis/textType.al) * 100}"></fmt:parseNumber>
                                            ${pages}%
                                          </c:if>
                                          <c:if test="${textType.al == 0}">
                							              0%
                                          </c:if>
              							            </label>
              							          </div>
              							        </div>
              							      </div>
              							    </div>
              							    <div class="col-sm-3 p-l-0 p-r-0 f-left">
              							      <div class="card user-activity-card" style="border-radius: 0;">
              							        <div class="card-header">
              							          <h5>
              							    <font style="font-weight: bold; color: black;">      
              							          악성글
              							          </font>
              							          </h5>
              							          <span>점수 범위 : 1</span>
              							        </div>
              							        <div class="card-block-big text-center typography"  style="padding-left: 5px;padding-right: 5px;">
              							          <div style="height: 50px;display: inline-block;">
              							            <h1 class="text-danger f-left">${textType.etc}</h1>
              							            <label class="badge badge-inverse f-left">
                							            <c:if test="${textType.al != 0}">
                							              <fmt:parseNumber var="pages" integerOnly="true" value="${(textType.etc/textType.al) * 100}"></fmt:parseNumber>
                                            ${pages}%
                                          </c:if>
                                          <c:if test="${textType.al == 0}">
                							              0%
                                          </c:if>
              							            </label>
              							          </div>
              							        </div>
              							      </div>
              							    </div>
                							</div>
                              <!-- <div class="col-md-6 col-xl-6">
                                <div class="card table-card group-widget">
                                  <div class="row-table">
                                    <div class="col bg-primary card-block-big">
                                      <i class="icofont icofont-music"></i>
                                      <p class="ng-tns-c16-68">1,586</p>
                                    </div>
                                    <div class="col bg-dark-primary card-block-big">
                                      <i class="icofont icofont-video-clapper"></i>
                                      <p class="ng-tns-c16-68">1,743</p>
                                    </div>
                                    <div class="col bg-darkest-primary card-block-big">
                                      <i class="icofont icofont-email"></i>
                                      <p class="ng-tns-c16-68">1,096</p>
                                    </div>
                                    <div class="col bg-darkest-primary card-block-big">
                                      <i class="icofont icofont-email"></i>
                                      <p class="ng-tns-c16-68">1,096</p>
                                    </div>
                                  </div>
                                </div>
                              </div> -->
                              <div class="col-md-6 col-xl-3">
                                <div class="card user-activity-card">
                                  <div class="card-block-big" style="padding-top: 31px;padding-bottom: 8px;">
                                    <div class="row">
                                      <div class="col-sm-6">
                                        <dl class="dl-horizontal row text-center">
                                          <dt class="col-sm-5">10</dt>
                                          <dd class="col-sm-7"><label class="label label-success">아주좋음</label></dd>
                                          <dt class="col-sm-5">8 ~ 9</dt>
                                          <dd class="col-sm-7"><label class="label label-primary">좋음</label></dd>
                                          <dt class="col-sm-5">6 ~ 7</dt>
                                          <dd class="col-sm-7"><label class="label label-info">양호</label></dd>
                                          <dt class="col-sm-5">5 ~ 4</dt>
                                          <dd class="col-sm-7"><label class="label label-warning">주의</label></dd>
                                          <dt class="col-sm-5">4 ~ 1</dt>
                                          <dd class="col-sm-7"><label class="label label-danger">경고</label></dd>
                                        </dl>
                                      </div>
                                      <div class="col-sm-6" style="text-align: center;">
                  						  <h4 class="sub-title"><font style="font-weight: bold; color: black;">분류비율표</font></h4>
                    					  <h3 class="text-info text-center typography p-t-5 p-b-25 m-b-0">
                                          <c:if test="${scoreCount == 1 or scoreCount == 2 or scoreCount == 3}"><strong class="text-danger">경고</strong></c:if>
                                          <c:if test="${scoreCount == 4 or scoreCount == 5}"><strong class="text-warning">주의</strong></c:if>
                                          <c:if test="${scoreCount == 6 or scoreCount == 7}"><strong class="text-info">양호</strong></c:if>
                                          <c:if test="${scoreCount == 8 or scoreCount == 9}"><strong class="text-primary">좋음</strong></c:if>
                                          <c:if test="${scoreCount == 10}"><strong class="text-success">아주좋음</strong></c:if>
                    					  <small style="margin-left: 0;"><font style="font-weight: bold; color: black;">${scoreCount}</font></small>
                  						  </h3>
                  						</div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="card">
                                  <div class="card-header">
                                    <h5 class="card-header-text m-b-10 m-t-10"><font style="font-weight: bold; color: black;">평점 관리 리스트</font></h5>
                                    <div class="f-right m-t-10">
                                      <button class="btn btn-warning alert-excel f-right p-r-5 p-l-5 m-l-15 m-b-10"><i class="icofont icofont-download-alt"></i>EXCEL</button>
                                      <c:if test="${user.user_name == 'union'}">
                                      <button id="alert-check" class="btn btn-list alert-check f-right p-r-5 p-l-5 m-l-15 m-b-10"><i class="icofont icofont-ui-check"></i>등록</button>
                                      </c:if>
                                      <a href="https://movie.naver.com/movie/search/result.nhn?query=${selectKey}&section=all&ie=utf8" target="_blank">
                                      <button class="btn btn-list f-right p-r-5 p-l-5 m-l-15 m-b-10">
                                      <i class="icofont icofont-search"></i>검색
                                      </button>
                                      </a>
                                    </div>
                                  </div>
                                  <div class="card-block table-border-style">
                                    <div class="table-responsive">
                                      <table class="table table-bordered table-sm">
                                      <c:if test="${empty selectKey || '키워드' eq selectKey}">
	                                    <tbody>
	                                     <tr>
	                                     <td style="vertical-align:middle;" align="center" height="150px"><h5>키워드를 선택해주세요.</h5></td>
	                                     </tr>
	                                     </tbody>
	                                  </c:if>
	                                  <c:if test="${!empty selectKey && '키워드' ne selectKey}">
	                                    <c:if test="${empty scoreList}">
	                                    <tbody>
	                                     <tr>
	                                     <td style="vertical-align:middle;" align="center" height="150px"><h5>등록된 평점이 없습니다.</h5></td>
	                                     </tr>
	                                     </tbody>
	                                    </c:if>
	                                    <c:if test="${!empty scoreList}">
                                        <thead>
                                          <tr>
                                          	<c:if test="${user.user_name == 'union'}">
                                          	<th width="1%">
                                          	<div class="border-checkbox-section">
					                          <div class="border-checkbox-group border-checkbox-group-default">
		                                  		<input type="checkbox" name="ck" id="checkall" class="border-checkbox news-checkbox">
		                                  		<label class="border-checkbox-label" for="checkall"></label>
		                                  	  </div>
		                                  	</div>
                                          	</th>
                                          	</c:if>
                                            <th>NO</th>
                                            <th>작성일</th>
                                            <th>구분</th>
                                            <th>내용</th>
                                            <th>키워드</th>
                                            <th>점수</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <c:forEach items="${scoreList}" var="score" varStatus="index">
                                          <tr class = "trList">
                                          	<input type="hidden" value="${score.portal_idx}" name="portal_idx">
                                          	<c:if test="${user.user_name == 'union'}">
                                          	<td>
		                                    <div class="border-checkbox-section">
					                          <div class="border-checkbox-group border-checkbox-group-default">
					                            <c:if test="${score.portal_state == 1}">
				                                    <input type="checkbox" name="ck" id="checkbox${index.count}" class="border-checkbox news-checkbox" value="${score.portal_idx}" checked="checked">
				                                </c:if>
				                                <c:if test="${score.portal_state == null || score.portal_state == 0}">
				                                    <input type="checkbox" name="ck" id="checkbox${index.count}" class="border-checkbox news-checkbox" value="${score.portal_idx}">
			                                    </c:if>
					                            <label class="border-checkbox-label" for="checkbox${index.count}"></label>
					                          </div>
					                        </div>
		                                    </td>
                                          	</c:if>
                                            <th>${totalCount - minusCount - index.count + 1}</th>
                                            <td>${score.writeDate}</td>
                                            <td>${score.portal_name}</td>
                                            <%-- <td><a class = 'title_score' href="${score.url}">${score.portal_title}</a></td> --%>
                                            <td><div class = 'title_score'>${score.portal_title}</div></td>
                                            <td>${score.keyword}</td>
                                            <td>${score.score}</td>
                                          </tr>
                                          </c:forEach>
                                        </tbody>
                                        <tfoot>
                                          <tr>
                                          <c:if test="${user.user_name != 'union'}">
		                                    <td colspan="6">
		                                    </c:if>
		                                  <c:if test="${user.user_name == 'union'}">
		                                    <td colspan="7">
		                                  </c:if>
                                          <ul class="pagination float-right">
        					              <c:if test="${pageMaker.prev}">
        					              	<li class="page-item">
        					                	<a class="page-link" href="v_score${pageMaker.makeSearch(pageMaker.startPage - 1) }" aria-label="Previous">&laquo;
        					                    <span aria-hidden="true"></span>
        					                    <span class="sr-only">Previous</span>
        					                    </a>
        					                </li>
        					              </c:if>
        					              <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	        					          	<li class= "${pageMaker.cri.page == idx? 'active':''} page-item">
	        					            	<a class="page-link" href="v_score${pageMaker.makeSearch(idx)}">${idx}</a>
	        					            </li>
        					              </c:forEach>
        					              <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	        					          	<li class="page-item">
		        					        	<a class="page-link" href="v_score${pageMaker.makeSearch(pageMaker.endPage +1) }" aria-label="Next">&raquo;
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
  <!-- modernizr js -->
  <script type="text/javascript" src="../bower_components/modernizr/modernizr.js"></script>
  <script type="text/javascript" src="../bower_components/modernizr/feature-detects/css-scrollbars.js"></script>
  <!-- classie js -->
  <script type="text/javascript" src="../bower_components/classie/classie.js"></script>
  <!-- Morris Chart js -->
  <script src="../bower_components/raphael/raphael.min.js"></script>
  <script src="../bower_components/morris.js/morris.js"></script>
  <!-- sweet alert js -->
  <script type="text/javascript" src="../bower_components/sweetalert/dist/sweetalert.min.js"></script>
  <script type="text/javascript" src="../assets/pages/news/script.js"></script>
  <!-- i18next.min.js -->
  <script type="text/javascript" src="../bower_components/i18next/i18next.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-xhr-backend/i18nextXHRBackend.min.js"></script>
  <script type="text/javascript" src="../bower_components/i18next-browser-languagedetector/i18nextBrowserLanguageDetector.min.js"></script>
  <script type="text/javascript" src="../bower_components/jquery-i18next/jquery-i18next.min.js"></script>
  <!-- Custom js -->
  <script type="text/javascript" src="../assets/js/script.js"></script>
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


		// 캘린더 클릭시
		$('#fromDate').on('apply.daterangepicker', function(ev, picker) {
			   var startDate = picker.startDate.format('YYYY-MM-DD');
			   var endDate = picker.endDate.format('YYYY-MM-DD');

			   console.log("startDate: " + startDate);
			   console.log("endDate: " + endDate);

			   searchList();

		});
		
		//최상단 체크박스 클릭
	    $("#checkall").click(function(){
	        //클릭되었으면
	        if($("#checkall").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=ck]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=ck]").prop("checked",false);
	        }
		 })

		/* var idx = $('input[name=portal_idx]').val(); */

		//등록 확인메시지
			$(document).on("click",".alert-check",function(){
				swal({
					title: "등록 처리 하시겠습니까?",
					text: "바로 등록 됩니다.",
					type: "warning",
					showCancelButton: true,
					confirmButtonClass: "btn-danger",
					confirmButtonText: "YES",
					closeOnConfirm: false
					},
						function(){

							checkList(event);

							swal("Update!", "등록 처리가 완료되었습니다.", "success");

							location.reload();
						});
		  });

		//엑셀출력 확인메시지
		$(document).on("click",".alert-excel",function(){
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

	    	  self.location = "excelOk?"+
			  + "&company=" + $("#selectCompany option:selected").val()
			  + "&selectKey=" + $('#selectKeyword option:selected').val()
			  + "&startDate=" + makeDateFormat($("#fromDate").val(), 0)
		  	  + "&endDate=" +  makeDateFormat($("#fromDate").val(), 1);


		  		swal("Success!", "엑셀출력 되었습니다.", "success");

	      });
		});

	}); // end ready...

	function checkList(event) {

		  $("input[name='ck']:checked").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다

			  $.ajax({
				  	type : "POST",
					url : "checkList",
					data : {idx : $(this).val()},
					contentType:"application/x-www-form-urlencoded;charset=utf-8", //한글 깨짐 방지
					cache: false,
					success : function(data) {
					console.log(data);
					}

				});

		  });
		  $("input[name='ck']").each(function(i,e){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
				if($(e).is(':checked') != true){
				  $.ajax({
						type : "POST",
						url : "uncheckList",
						data : {idx : $(e).val()},
						contentType:"application/x-www-form-urlencoded;charset=utf-8", //한글 깨짐 방지
						cache: false, 
						success : function(data) {
						console.log(data);
						}

					});
					}
			  });

		}


	function searchList() {

		var makeQeury = '${pageMaker.makeQuery(1)}'.slice(0,-2);

		console.log(makeQeury);

    	self.location = "v_score"
    						+ makeQeury + '10'
        					+ "&company=" + $("#selectCompany option:selected").val()
    						+ "&selectKey=" + $('#selectKeyword option:selected').val()
    						+ "&portal_name=" + $("#selectSite option:selected").val()
    						+ "&startDate=" + makeDateFormat($("#fromDate").val(), 0)
				 			+ "&endDate=" +  makeDateFormat($("#fromDate").val(), 1);
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
