<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
      <li class="">
        <a href="dashboard.jsp">
          <span class="pcoded-micon"><i class="ti-home"></i></span>
          <span class="pcoded-mtext" data-i18n="nav.dash.main">대시보드</span>
          <span class="pcoded-mcaret"></span>
        </a>
      </li>
      <li class="">
        <a href="period.jsp">
          <span class="pcoded-micon"><i class="ti-bar-chart-alt"></i></span>
          <span class="pcoded-mtext">통계보고서</span>
          <span class="pcoded-mcaret"></span>
        </a>
      </li>
      <li class="pcoded-hasmenu">
        <a href="javascript:void(0)" data-i18n="nav.advance-components.main">
          <span class="pcoded-micon"><i class="ti-world"></i></span>
          <span class="pcoded-mtext">포털관리</span>
          <span class="pcoded-mcaret"></span>
        </a>
        <ul class="pcoded-submenu">
          <li class="">
            <a href="mngNaver.jsp" data-i18n="nav.advance-components.draggable">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">네이버관리</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
          <li class=" ">
            <a href="mngViral.jsp" data-i18n="nav.advance-components.grid-stack">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">바이럴관리</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
        </ul>
      </li>
      <li class="pcoded-hasmenu">
        <a href="javascript:void(0)" data-i18n="nav.advance-components.main">
          <span class="pcoded-micon"><i class="ti-facebook"></i></span>
          <span class="pcoded-mtext">SNS관리</span>
          <span class="pcoded-mcaret"></span>
        </a>
        <ul class="pcoded-submenu">
          <li class=" ">
            <a href="facebook.jsp" data-i18n="nav.advance-components.draggable">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">페이스북관리</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
          <li class=" ">
            <a href="twitter.jsp" data-i18n="nav.advance-components.grid-stack">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">트위터관리</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
          <li class=" ">
            <a href="instagram.jsp" data-i18n="nav.advance-components.grid-stack">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">인스타그램관리</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
        </ul>
      </li>
      <li class="pcoded-hasmenu">
        <a href="javascript:void(0)" data-i18n="nav.advance-components.main">
          <span class="pcoded-micon"><i class="ti-notepad"></i></span>
          <span class="pcoded-mtext">언론사관리</span>
          <span class="pcoded-mcaret"></span>
        </a>
        <ul class="pcoded-submenu">
          <li class=" ">
            <a href="mngNews.jsp" data-i18n="nav.advance-components.draggable">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">언론사 기사글 관리</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
          <li class=" ">
            <a href="mngPress.jsp" data-i18n="nav.advance-components.grid-stack">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">기자관리</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
        </ul>
      </li>
      <li class="pcoded-hasmenu">
        <a href="javascript:void(0)" data-i18n="nav.advance-components.main">
          <span class="pcoded-micon"><i class="ti-harddrives"></i></span>
          <span class="pcoded-mtext">운영관리</span>
          <span class="pcoded-mcaret"></span>
        </a>
        <ul class="pcoded-submenu">
          <li class=" ">
            <a href="mngCompany.jsp" data-i18n="nav.advance-components.draggable">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">거래처관리</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
          <li class=" ">
            <a href="monitoring.jsp" data-i18n="nav.advance-components.grid-stack">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">모니터링현황</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
        </ul>
      </li>
      <li class="">
        <a href="mngKeyword.jsp" data-i18n="nav.advance-components.main">
          <span class="pcoded-micon"><i class="ti-ink-pen"></i></span>
          <span class="pcoded-mtext">키워드관리</span>
          <span class="pcoded-mcaret"></span>
        </a>
      </li>
      <li class="">
        <a href="mngExtract.jsp" data-i18n="nav.advance-components.main">
          <span class="pcoded-micon"><i class="ti-search"></i></span>
          <span class="pcoded-mtext">추출글관리</span>
          <span class="pcoded-mcaret"></span>
        </a>
      </li>
      <li class="pcoded-hasmenu">
        <a href="javascript:void(0)" data-i18n="nav.advance-components.main">
          <span class="pcoded-micon"><i class="ti-filter"></i></span>
          <span class="pcoded-mtext">분류글관리</span>
          <span class="pcoded-mcaret"></span>
        </a>
        <ul class="pcoded-submenu">
          <li class=" ">
            <a href="mngClassifiCation1.jsp" data-i18n="nav.advance-components.draggable">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">좋은글</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
          <li class=" ">
            <a href="mngClassifiCation2.jsp" data-i18n="nav.advance-components.grid-stack">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">나쁜글</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
          <li class=" ">
            <a href="mngClassifiCation3.jsp" data-i18n="nav.advance-components.grid-stack">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">관심글</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
          <li class=" ">
            <a href="mngClassifiCation4.jsp" data-i18n="nav.advance-components.grid-stack">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">기타</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
          <li class=" ">
            <a href="mngClassifiCation5.jsp" data-i18n="nav.advance-components.grid-stack">
              <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
              <span class="pcoded-mtext">삭제</span>
              <span class="pcoded-mcaret"></span>
            </a>
          </li>
        </ul>
        <li class="">
          <a href="mngAllList.jsp" data-i18n="nav.advance-components.main">
            <span class="pcoded-micon"><i class="ti-menu"></i></span>
            <span class="pcoded-mtext">전체글관리</span>
            <span class="pcoded-mcaret"></span>
          </a>
        </li>
      </li>
    </ul>
  </div>
</nav>
<!-- left menu end -->
