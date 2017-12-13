<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- left menu start -->
<nav class="pcoded-navbar" pcoded-header-position="relative">
  <div class="pcoded-inner-navbar main-menu">
    <div class="">
      <div class="main-menu-header">
        <img class="img-50" src="../assets/images/avatar-blank.png" alt="User-Profile-Image">
        <div class="user-details">
          <span id="more-details">Union</span>
        </div>
      </div>
    </div>
    <ul class="pcoded-item pcoded-left-item">
      <li class="dashBoard">
        <a href="../dashBoard/dashBoard">
          <span class="pcoded-micon"><i class="ti-home"></i></span>
          <span class="pcoded-mtext" data-i18n="nav.dash.main">대시보드</span>
          <span class="pcoded-mcaret"></span>
        </a>
      </li>
      <li class="period">
        <a href="../period/main">
          <span class="pcoded-micon"><i class="ti-bar-chart-alt"></i></span>
          <span class="pcoded-mtext">통계보고서</span>
          <span class="pcoded-mcaret"></span>
        </a>
      </li>
      <li class="pcoded-hasmenu portal">
        <a href="javascript:void(0)" data-i18n="nav.advance-components.main">
          <span class="pcoded-micon"><i class="ti-world"></i></span>
          <span class="pcoded-mtext">포털관리</span>
          <span class="pcoded-mcaret"></span>
        </a>
        <ul class="pcoded-submenu">
          <li class="">
            <a href="../portal/naver" data-i18n="nav.advance-components.draggable">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">네이버관리</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
          <li class=" ">
            <a href="../portal/viral" data-i18n="nav.advance-components.grid-stack">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">바이럴관리</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
        </ul>
      </li>
      <li class="pcoded-hasmenu sns">
        <a href="javascript:void(0)" data-i18n="nav.advance-components.main">
          <span class="pcoded-micon"><i class="ti-facebook"></i></span>
          <span class="pcoded-mtext">SNS관리</span>
          <span class="pcoded-mcaret"></span>
        </a>
        <ul class="pcoded-submenu">
          <li class=" ">
            <a href="../sns/facebook" data-i18n="nav.advance-components.draggable">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">페이스북관리</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
          <li class=" ">
            <a href="../sns/twitter" data-i18n="nav.advance-components.grid-stack">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">트위터관리</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
          <li class=" ">
            <a href="../sns/instagram" data-i18n="nav.advance-components.grid-stack">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">인스타그램관리</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
        </ul>
      </li>
      <li class="pcoded-hasmenu media">
        <a href="javascript:void(0)" data-i18n="nav.advance-components.main">
          <span class="pcoded-micon"><i class="ti-notepad"></i></span>
          <span class="pcoded-mtext">언론사관리</span>
          <span class="pcoded-mcaret"></span>
        </a>
        <ul class="pcoded-submenu">
          <li class=" ">
            <a href="../media/news" data-i18n="nav.advance-components.draggable">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">언론사 기사글 관리</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
          <c:if test="${user.user_name == 'union'}">
          	<li class=" ">
            <a href="../media/press" data-i18n="nav.advance-components.grid-stack">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">기자관리</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
          </c:if>
          
        </ul>
      </li>
      <li class="pcoded-hasmenu manage">
        <a href="javascript:void(0)" data-i18n="nav.advance-components.main">
          <span class="pcoded-micon"><i class="ti-harddrives"></i></span>
          <span class="pcoded-mtext">운영관리</span>
          <span class="pcoded-mcaret"></span>
        </a>
        <ul class="pcoded-submenu">
          <c:if test="${user.user_name == 'union'}">
          <li class=" ">
            <a href="../manage/company" data-i18n="nav.advance-components.draggable">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">거래처관리</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
          </c:if>
          <li class=" ">
            <a href="../manage/monitor" data-i18n="nav.advance-components.grid-stack">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">모니터링 현황</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
        </ul>
      </li>
      <c:if test="${user.user_name == 'union'}">
      <li class="keyword">
        <a href="../keyword/keyword" data-i18n="nav.advance-components.main">
          <span class="pcoded-micon"><i class="ti-ink-pen"></i></span>
          <span class="pcoded-mtext">키워드관리</span>
          <span class="pcoded-mcaret"></span>
        </a>
      </li>
      </c:if>
      <li class="extract">
        <a href="../extract/extract" data-i18n="nav.advance-components.main">
          <span class="pcoded-micon"><i class="ti-search"></i></span>
          <span class="pcoded-mtext">추출글관리</span>
          <span class="pcoded-mcaret"></span>
        </a>
      </li>
      <li class="classification">
        <a href="../classification/classification" data-i18n="nav.advance-components.main">
          <span class="pcoded-micon"><i class="ti-filter"></i></span>
          <span class="pcoded-mtext">분류글관리</span>
          <span class="pcoded-mcaret"></span>
        </a>
   
        <li class="listAll">
          <a href="../listAll/listAll" data-i18n="nav.advance-components.main">
            <span class="pcoded-micon"><i class="ti-menu"></i></span>
            <span class="pcoded-mtext">전체글관리</span>
            <span class="pcoded-mcaret"></span>
          </a>
        </li>
      </li>
    </ul>
  </div>
</nav>

<script type="text/javascript">

		// 해당 페이지 active 추가
		var url = location.href;

		var domain = url.split("8080/")[1].split("/")[0];

		var li = window.document.getElementsByClassName(domain)[0];
		
		console.log(li);
		if(li != undefined){
			li.className += " active pcoded-trigger";
		}
		
	
</script>
<!-- left menu end -->
