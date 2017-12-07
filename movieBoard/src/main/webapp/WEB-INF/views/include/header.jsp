<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- top menu start -->
<nav class="navbar header-navbar pcoded-header" header-theme="theme4">
  <div class="navbar-wrapper">
    <div class="navbar-logo">
      <a class="mobile-menu" id="mobile-collapse" href="#!">
        <i class="ti-menu"></i>
      </a>
      <a href="../dashBoard/dashBoard">
        <img class="img-fluid" src="../assets/images/logo.png" alt="Theme-Logo" />
      </a>
      <a class="mobile-options">
        <i class="ti-more"></i>
      </a>
    </div>
    <div class="navbar-container container-fluid">
      <div>
        <ul class="nav-left">
          <li>
            <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
          </li>
        </ul>
        <ul class="nav-right">
          <li class="user-profile header-notification">
            <a href="#!">
                <img src="../assets/images/user.png" alt="User-Profile-Image">
                <span>${user.user_name}</span>
                <i class="ti-angle-down"></i>
            </a>
            <ul class="show-notification profile-notification">
              <li>
                <a href="../logout">
                  <i class="ti-layout-sidebar-left"></i> Logout
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </div>
</nav>
<!-- top menu end -->