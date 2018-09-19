<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}"/>

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
  <link rel="stylesheet" type="text/css" href="../assets/pages/monitor/css/style.css">
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
                      <h4>모니터링 현황</h4>
                    </div>
                    <div class="page-header-breadcrumb">
                      <ul class="breadcrumb-title">
                        <li class="breadcrumb-item">
                          <a href="../dashBoard/dashBoard_main">
                            <i class="icofont icofont-home"></i>
                          </a>
                        </li>
                        <li class="breadcrumb-item"><a href="#!">운영관리</a></li>
                        <li class="breadcrumb-item"><a href="#!">모니터링 현황</a></li>
                      </ul>
                    </div>
                  </div>
                  <div class="page-body">
                    <div class="row">
                      <div class="col-lg-12">
                        <!-- Form Inputs card start -->
                        <div class="card">
                          <div class="card-header" style="height:50px;">
                            <h5><font style="font-weight: bold; color: black; vertical-align:middle;">모니터링 리스트</font></h5>
                            각 플랫폼 별 최근 검출된 데이터를 확인 할 수 있습니다.
                          </div>
                          <div class="card-block">
                            <div class="table-responsive">
                              <table class="table table-bordered table-sm">
                                <thead>
                                  <tr>
                                    <th width="5%">NO</th>
                                    <th width="5%">대분류</th>
                                    <th width="5%">중분류</th>
                                    <th width="5%">소분류</th>
                                    <th width="20%">마지막 수집글 제목</th>
                                    <th width="10%">날짜</th>
                                    <th width="5%">상태</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <c:forEach items="${portalBList}" var="portal" varStatus="index">
                                  <tr>
                                    <th scope="row">1</th>
                                    <td>Portal</td>
                                    <td>${portal.portal_name}</td>
                                    <td>${portal.portal_type}</td>
                                    <td><a href="${portal.url}" target="_blank"><div class="title-nowrap">${portal.portal_title}</div></a></td>
                                    <td><fmt:formatDate value="${portal.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${portal.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio1" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${portal.checkCondition == false}">
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
                                  <c:forEach items="${portalCList}" var="portalc" varStatus="index">
                                  <tr>
                                    <th scope="row">2</th>
                                    <td>Portal</td>
                                    <td>${portalc.portal_name}</td>
                                    <td>${portalc.portal_type}</td>
                                    <td><a href="${portalc.url}" target="_blank"><div class="title-nowrap">${portalc.portal_title}</div></a></td>
                                    <td><fmt:formatDate value="${portalc.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${portalc.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio2" checked="checked"  disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${portalc.checkCondition == false}">
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
                                  <c:forEach items="${portalWList}" var="portalw" varStatus="index">
                                  <tr>
                                    <th scope="row">3</th>
                                    <td>Portal</td>
                                    <td>${portalw.portal_name}</td>
                                    <td>${portalw.portal_type}</td>
                                    <td><a href="${portalw.url}" target="_blank"><div class="title-nowrap">${portalw.portal_title}</div></a></td>
                                    <td><fmt:formatDate value="${portalw.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${portalw.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio3" checked="checked"  disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${portalw.checkCondition == false}" >
                                            <label>
                                                <input type="radio" name="radio"  disabled >
                                                <i class="helper"></i>비정상
                                            </label>
                                            </c:if>
                                        </div>
                                      </div>
                                    </td>
                                  </tr>
                                  </c:forEach>
                                  <c:forEach items="${portalBList2}" var="portal2" varStatus="index">
                                  <tr>
                                    <th scope="row">4</th>
                                    <td>Portal</td>
                                    <td>${portal2.portal_name}</td>
                                    <td>${portal2.portal_type}</td>
                                    <td><a href="${portal2.url}" target="_blank"><div class="title-nowrap">${portal2.portal_title}</div></a></td>
                                    <td><fmt:formatDate value="${portal2.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${portal2.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio4" checked="checked"  disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${portal2.checkCondition == false}">
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
                                  <c:forEach items="${portalCList2}" var="portalc2" varStatus="index">
                                  <tr>
                                    <th scope="row">5</th>
                                    <td>Portal</td>
                                    <td>${portalc2.portal_name}</td>
                                    <td>${portalc2.portal_type}</td>
                                    <td><a href="${portalc2.url}" target="_blank"><div class="title-nowrap">${portalc2.portal_title}</div></a></td>
                                    <td><fmt:formatDate value="${portalc2.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${portalc2.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio5" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${portalc2.checkCondition == false}">
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
                                  <c:forEach items="${portalWList2}" var="portalw2" varStatus="index">
                                  <tr>
                                    <th scope="row">6</th>
                                    <td>Portal</td>
                                    <td>${portalw2.portal_name}</td>
                                    <td>${portalw2.portal_type}</td>
                                    <td><a href="${portalw2.url}" target="_blank"><div class="title-nowrap">${portalw2.portal_title}</div></a></td>
                                    <td><fmt:formatDate value="${portalw2.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${portalw2.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio6" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${portalw2.checkCondition == false}">
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
                                  <c:forEach items="${snsListf}" var="snsListf" varStatus="index">
                                  <tr>
                                    <th scope="row">7</th>
                                    <td>SNS</td>
                                    <td>${snsListf.sns_name}</td>
                                    <td>페이스북</td>
                                    <td><a href="${snsListf.url}" target="_blank"><div class="title-nowrap">${snsListf.sns_title}</div></a></td>
                                    <td><fmt:formatDate value="${snsListf.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${snsListf.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio7" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${snsListf.checkCondition == false}">
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
                                  <c:forEach items="${snsListi}" var="snsListi" varStatus="index">
                                  <tr>
                                    <th scope="row">8</th>
                                    <td>SNS</td>
                                    <td>${snsListi.sns_name}</td>
                                    <td>인스타그램</td>
                                    <td><a href="${snsListi.url}" target="_blank"><div class="title-nowrap">${snsListi.sns_title}</div></a></td>
                                    <td><fmt:formatDate value="${snsListi.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${snsListi.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio8" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${snsListi.checkCondition == false}">
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
                                  <c:forEach items="${snsListt}" var="snsListt" varStatus="index">
                                  <tr>
                                    <th scope="row">9</th>
                                    <td>SNS</td>
                                    <td>${snsListt.sns_name}</td>
                                    <td>트위터</td>
                                    <td><a href="${snsListt.url}" target="_blank"><div class="title-nowrap">${snsListt.sns_title}</div></a></td>
                                    <td><fmt:formatDate value="${snsListt.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${snsListt.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio9" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${snsListt.checkCondition == false}">
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
                                  <c:forEach items="${mediaListA}" var="mediaListA" varStatus="index">
                                  <tr>
                                    <th scope="row">10</th>
                                    <td>Media</td>
                                    <td>${mediaListA.media_name}</td>
                                    <td>네이버</td>
                                    <td><a href="${mediaListA.url}" target="_blank"><div class="title-nowrap">${mediaListA.media_title}</div></a></td>
                                    <td><fmt:formatDate value="${mediaListA.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${mediaListA.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio10" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${mediaListA.checkCondition == false}">
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
                                 <c:forEach items="${mediaListB}" var="mediaListA" varStatus="index">
                                  <tr>
                                    <th scope="row">11</th>
                                    <td>Media</td>
                                    <td>${mediaListA.media_name}</td>
                                    <td>다음</td>
                                    <td><a href="${mediaListA.url}" target="_blank"><div class="title-nowrap">${mediaListA.media_title}</div></a></td>
                                    <td><fmt:formatDate value="${mediaListA.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${mediaListA.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio11" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${mediaListA.checkCondition == false}">
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
                                 <c:forEach items="${communityList1}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">12</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio12" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                 <c:forEach items="${communityList2}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">13</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio13" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                 <c:forEach items="${communityList3}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">14</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio14" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                 <c:forEach items="${communityList4}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">15</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio15" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList5}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">16</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio16" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList6}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">17</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio17" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList7}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">18</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio18" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList8}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">19</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio19" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList9}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">20</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio20" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList10}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">21</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio21" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList11}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">22</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio22" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList12}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">23</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio23" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList13}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">24</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio24" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList14}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">25</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio25" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList15}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">26</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio26" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList16}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">27</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio27" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList17}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">28</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank">
                                    <div class="title-nowrap">${communityList.community_title}</div>
                                    </a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio28" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList18}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">29</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank">
                                    <div class="title-nowrap">${communityList.community_title}</div>
                                    </a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio29" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList19}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">30</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank">
                                    <div class="title-nowrap">${communityList.community_title}</div>
                                    </a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio30" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList20}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">31</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio31" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList21}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">32</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio32" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList22}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">33</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio33" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList23}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">34</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio34" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList24}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">35</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio35" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList25}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">36</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio36" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList26}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">37</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio37" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList27}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">38</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio38" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList28}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">39</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio39" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList29}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">40</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio40" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                
                                
                                
                                <c:forEach items="${communityList30}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">41</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio41" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList31}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">42</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio42" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList32}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">43</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio43" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList33}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">44</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio44" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList34}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">45</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio45" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList35}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">46</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio46" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList36}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">47</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio47" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList37}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">48</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio48" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                <c:forEach items="${communityList38}" var="communityList" varStatus="index">
                                  <tr>
                                    <th scope="row">49</th>
                                    <td>community</td>
                                    <td>${communityList.community_name}</td>
                                    <td></td>
                                    <td><a href="${communityList.url}" target="_blank"><div class="title-nowrap">${communityList.community_title}</div></a></td>
                                    <td><fmt:formatDate value="${communityList.createDate}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
                                    <td>
                                      <div class="form-radio">
                                        <!-- radio-success:정상/radio-danger:비정상 -->
                                        <div class="radio radiofill radio-success  radio-inline">
                                            <c:if test="${communityList.checkCondition == true}">
                                            <label>
                                                <input type="radio" name="radio49" checked="checked" disabled >
                                                <i class="helper"></i>정상
                                            </label>
                                            </c:if>
                                            <c:if test="${communityList.checkCondition == false}">
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
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
                        <!-- Form Inputs card end -->
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
</body>
</html>
