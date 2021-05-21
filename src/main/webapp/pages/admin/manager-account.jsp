<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>Quản lý tài khoản</title>
	<jsp:include page="/pages/layout/header_admin.jsp" />
</head>
<body>
	<div class="theme-loader">
    <div class="ball-scale">
        <div class='contain'>
            <div class="ring">
                <div class="frame"></div>
            </div>
            <div class="ring">
                <div class="frame"></div>
            </div>
            <div class="ring">
                <div class="frame"></div>
            </div>
            <div class="ring">
                <div class="frame"></div>
            </div>
            <div class="ring">
                <div class="frame"></div>
            </div>
            <div class="ring">
                <div class="frame"></div>
            </div>
            <div class="ring">
                <div class="frame"></div>
            </div>
            <div class="ring">
                <div class="frame"></div>
            </div>
            <div class="ring">
                <div class="frame"></div>
            </div>
            <div class="ring">
                <div class="frame"></div>
            </div>
        </div>
    </div>
</div>
<!-- Pre-loader end -->
<div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
    <div class="pcoded-container navbar-wrapper">
        <nav class="navbar header-navbar pcoded-header background-light">
            <div class="navbar-wrapper">
                <div class="navbar-logo">
                    <a class="mobile-menu" id="mobile-collapse" href="#!">
                        <i class="feather icon-menu"></i>
                    </a>
                    <a href="Manager-account.html">
                        ADMIN HOME
                    </a>
                    <a class="mobile-options">
                        <i class="feather icon-more-horizontal"></i>
                    </a>
                </div>

                <div class="navbar-container container-fluid">
                    <div class="nav-left">
                                <h4 class="ml-3 mt-3">Quản lý tài khoản</h4>
                    </div>
                    <div class="nav-right">
                            <div class="dropdown-primary dropdown">
                                <div class="mt-2">
                                    <img src="${contextPath }/${current_account.avatar }" class="img-radius img-comment" alt="User-Profile-Image">
                                    <a href="myProfile" class="f-18">${current_account.name }</a>
                                </div>
                           </div>
                    </div>
                </div>
            </div>
        </nav>
        <div class="pcoded-main-container">
            <div class="pcoded-wrapper">
                <nav class="pcoded-navbar">
                    <div class="pcoded-inner-navbar main-menu">
                        <div class="pcoded-navigatio-lavel">Quản lý</div>
                        <ul class="pcoded-item pcoded-left-item">
                            <li class="pcoded-hasmenu active pcoded-trigger">
                                <a href="javascript:void(0)">
                                    <span class="pcoded-micon"><i class="fa fa-users"></i></span>
                                    <span class="pcoded-mtext">Quản lý tài khoản</span>
                                </a>
                                <ul class="pcoded-submenu">
                                    <li class="active">
                                        <a href="manager-account">
                                            <span class="pcoded-mtext">Tất cả</span>
                                        </a>
                                    </li>
                                    <li class="">
                                        <a href="manager-availableaccount">
                                            <span class="pcoded-mtext">Khả dụng</span>
                                        </a>
                                    </li>
                                    <li class="">
                                        <a href="manager-blockaccount">
                                            <span class="pcoded-mtext">Bị khóa</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="pcoded-hasmenu">
                                <a href="javascript:void(0)">
                                    <span class="pcoded-micon"><i class="fa fa-list-alt"></i></span>
                                    <span class="pcoded-mtext">Quản lý bài viết</span>
                                </a>
                                <ul class="pcoded-submenu">
                                    <li class="">
                                        <a href="manager-post">
                                            <span class="pcoded-mtext">Tất cả</span>
                                        </a>
                                    </li>
                                    <li class="">
                                        <a href="manager-post1">
                                            <span class="pcoded-mtext">Bài viết</span>
                                        </a>
                                    </li>
                                    <li class="">
                                        <a href="manager-post2">
                                            <span class="pcoded-mtext">Phòng trọ</span>
                                        </a>
                                    </li>
                                    <li class="">
                                        <a href="manager-post3">
                                            <span class="pcoded-mtext">Ở ghép</span>
                                        </a>
                                    </li>
                                    <li class="">
                                        <a href="manager-post4">
                                            <span class="pcoded-mtext">Đồ dùng</span>
                                        </a>
                                    </li>
                                    <li class="">
                                        <a href="manager-postreport">
                                            <span class="pcoded-mtext">Bài viết bị báo cáo</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="pcoded-hasmenu ">
                                <a href="javascript:void(0)">
                                    <span class="pcoded-micon"><i class="fa fa-exclamation-circle"></i></span>
                                    <span class="pcoded-mtext">Quản lý thông báo</span>
                                </a>
                                <ul class="pcoded-submenu">
                                    <li class="">
                                        <a href="manager-notification">
                                            <span class="pcoded-mtext">Tất cả</span>
                                        </a>
                                    </li>
                                    <li class="">
                                        <a href="manager-notification-toall">
                                            <span class="pcoded-mtext">Gửi cho toàn bộ</span>
                                        </a>
                                    </li>
                                    <li class="">
                                        <a href="manager-notification-toaccount">
                                            <span class="pcoded-mtext">Gửi cho cá nhân</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <div class="pcoded-navigatio-lavel">Tài khoản</div>
                        <ul class="pcoded-item pcoded-left-item">
                            <li class="">
                                <a href="profile">
                                    <span class="pcoded-micon"><i class="fa fa-user"></i></span>
                                    <span class="pcoded-mtext">Hồ sơ cá nhân</span>
                                </a>
                            </li>
                            <li class="">
                                <a href="change-pass">
                                    <span class="pcoded-micon"><i class="fa fa-key"></i></span>
                                    <span class="pcoded-mtext">Đổi mật khẩu</span>
                                </a>
                            </li>
                            <li class="">
                                <a href="${contextPath}/logout">
                                    <span class="pcoded-micon"><i class="fa fa-sign-out"></i></span>
                                    <span class="pcoded-mtext">Đăng xuất</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="pcoded-content">
                    <div class="pcoded-inner-content">
                        <!-- Main-body start -->
                        <div class="main-body">
                            <div class="page-wrapper pt-3">
                                    <!-- Page-body start -->
                                    <div class="page-body">
                                        <!-- Single Select table start -->
                                        <div class="card">
                                            <div class="card-block">
                                                <div class="dt-responsive table-responsive">
                                                    <table id="single-select" class="table table-striped table-bordered nowrap">
                                                        <thead>
                                                            <tr>
                                                                <th>Họ tên</th>
                                                                <th>Số điện thoại</th>
                                                                <th>Trạng thái</th>
                                                                <th>Giới tính</th>
                                                                <th>Ngày sinh</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        	<c:forEach var="account" items="${listAccount }">
                                                        		<tr>
	                                                                <td>${account.name }</td>
	                                                                <td>${account.phone }</td>
	                                                                <c:choose>  
																	    <c:when test="${account.account_status == true}">  
																	       <td>Bình thường</td>
																	    </c:when>
																	    <c:otherwise>  
																	       <td>Bị khóa</td>
																	    </c:otherwise>  
																	</c:choose>
	                                                                <c:choose>  
																	    <c:when test="${account.gender == 1}">  
																	       <td>Nam</td>
																	    </c:when>  
																	    <c:when test="${account.gender == 2}">  
																	       <td>Nữ</td>
																	    </c:when>
																	    <c:otherwise>  
																	       <td>Chưa biết</td> 
																	    </c:otherwise>  
																	</c:choose>  
	                                                                <td>${fn:substring(account.birthday, 0, 10) }</td>
	                                                                <td>
	                                                                	<div class="mx-auto">
	                                                                		<a href="${contextPath }/admin/delete-account/${account.account_id }"><button class="btn-delete mx-3">Xóa</button></a>
	                                                                		<c:choose>  
																			    <c:when test="${account.account_status == true}">  
																			       <a href="${contextPath }/admin/block-account/${account.account_id }"><button class="btn-lock">Khóa</button></a>
																			    </c:when>
																			    <c:otherwise>  
																			       <a href="${contextPath }/admin/unlock-account/${account.account_id }"><button class="btn-unlock">Mở khóa</button></a>
																			    </c:otherwise>  
																			</c:choose>
	                                                                	</div>
	                                                                </td>
	                                                            </tr>
                                                        	</c:forEach>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Single Select table end -->
                                    </div>
                                    <!-- Page-body start -->
                                </div>
                            </div>
                            <!-- Main-body end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal mt-5 pt-5" id="modalConfirm">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Xác nhận xóa tài khoản</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p>Nguyễn Văn Tiến</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary" data-dismiss="modal">Hủy</button>
              <button type="button" class="btn btn-danger">Xóa</button>
            </div>
          </div>
        </div>
      </div>

	<script>
	  $(document).ready(function () {
	      $('.btn-lock').click( function () {
	        $('#modalConfirm').modal()
	      });
	  });
	</script>

	<jsp:include page="/pages/layout/footer_admin.jsp" />
	
</body>
</html>