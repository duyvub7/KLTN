<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>Thông tin tài khoản</title>
	<jsp:include page="/pages/layout/header.jsp" />
</head>
<body>
	<jsp:include page="/pages/layout/navbar.jsp" />
    
    <main>
        <div class="main-wrapper pb-2">
            <div class="profile-banner-large bg-img" data-bg="${contextPath}/${viewAccount.wall_image }"></div>
            <div class="profile-menu-area bg-white">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-3 col-md-3">
                            <div class="profile-picture-box">
                                <figure class="profile-picture with-130">
                                    <img src="${contextPath}/${viewAccount.avatar }" alt="profile picture">
                                </figure>
                            </div>
                        </div>
                        <div class="col-lg-10 col-md-10 offset-lg-1">
                            <div class="profile-menu-wrapper">
                                <div class="main-menu-inner header-top-navigation">
                                    <nav>
                                        <ul class="main-menu float-right">
                                            <li class="active"><a href="${contextPath}/profile/${viewAccount.account_id }">Thông tin</a></li>
                                            <li class="ml-4"><a href="${contextPath}/account-post/${viewAccount.account_id }">Bài đăng</a></li> 
                                            <li class="ml-4"><a href="${contextPath}/account-friend/${viewAccount.account_id }">Bạn bè</a></li>
                                            <li class="ml-4"><button type="button" class="post-share-btn">Nhắn tin</button></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="col-10 mx-auto">
                    <div class="about-description mb-4">
                        <div class="tab-content">
                            <div class="author-desc-title d-flex">
                                <h6 class="author">Thông tin cá nhân</h6>
                                <div class="post-settings-bar">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    <div class="post-settings arrow-shape">
                                        <ul>
                                            <li><button class="changeAvatar-btn">Kết bạn</button></li>
                                            <li><button class="changeWall-btn">Theo dõi</button></li>
                                            <li><a href="edit-profile"><button>Báo cáo tài khoản</button></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="container f-16">
                            	<div class="row mb-3 border-opacity">
                            		<div class="col-sm-3 col-2">
                            			<p>Giới thiệu:</p>
                            		</div>
                            		<div class="col-sm-9 col-10">
                            			<p>${viewAccount.introduction }</p>
                            		</div>
                            	</div>
                            	<div class="row mb-3 border-opacity">
                            		<div class="col-sm-3 col-2">
                            			<p>Họ tên:</p>
                            		</div>
                            		<div class="col-sm-9 col-10">
                            			<p>${viewAccount.name }</p>
                            		</div>
                            	</div>
                            	<div class="row mb-3 border-opacity">
                            		<div class="col-sm-3 col-2">
                            			<p>Giới tính:</p>
                            		</div>
                            		<div class="col-sm-9 col-10">
                            			<c:choose>
		                                	<c:when test="${viewAccount.gender == 1 }">
		                                		<p>Nam</p>
		                                	</c:when>
		                                	<c:when test="${viewAccount.gender == 2 }">
		                                		<p>Nữ</p>
		                                	</c:when>
		                                	<c:otherwise>
		                                		<p>Chưa biết</p>
		                                	</c:otherwise>
		                                </c:choose>
                            		</div>
                            	</div>
                            	<div class="row mb-3 border-opacity">
                            		<div class="col-sm-3 col-2">
                            			<p>Ngày sinh:</p>
                            		</div>
                            		<div class="col-sm-9 col-10">
                            			<p><fmt:formatDate type="date" pattern="dd-MM-yyyy" value="${viewAccount.birthday }"/></p>
                            		</div>
                            	</div>
                            	<div class="row mb-3 border-opacity">
                            		<div class="col-sm-3 col-2">
                            			<p>Số điện thoại:</p>
                            		</div>
                            		<div class="col-sm-9 col-10">
                            			<p>${viewAccount.phone }</p>
                            		</div>
                            	</div>
                            	<div class="row mb-3 border-opacity">
                            		<div class="col-sm-3 col-2">
                            			<p>Email:</p>
                            		</div>
                            		<div class="col-sm-9 col-10">
                            			<p>${viewAccount.email }</p>
                            		</div>
                            	</div>
                            	<div class="row mb-3 border-opacity">
                            		<div class="col-sm-3 col-2">
                            			<p>Tỉnh thành:</p>
                            		</div>
                            		<div class="col-sm-9 col-10">
                            			<p>${viewAccount.getProvince().province_name }</p>
                            		</div>
                            	</div>
                            	<div class="row mb-3 border-opacity">
                            		<div class="col-sm-3 col-2">
                            			<p>Địa chỉ:</p>
                            		</div>
                            		<div class="col-sm-9 col-10">
                            			<p>${viewAccount.address }</p>
                            		</div>
                            	</div>
                            </div>
                       </div>
                  </div>
             </div>
        </div>
    </main>
    
    <div class="scroll-top not-visible">
        <i class="bi bi-finger-index"></i>
    </div>
	
	<jsp:include page="/pages/layout/footer.jsp" />
	
</body>
</html>