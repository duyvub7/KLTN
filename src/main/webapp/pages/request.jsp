<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>Yêu cầu kết bạn</title>
	<jsp:include page="/pages/layout/header.jsp" />
</head>
<body>
	<jsp:include page="/pages/layout/navbar.jsp" />
	
	<main>
        <div class="main-wrapper pb-2">
            <div class="profile-banner-large bg-img" data-bg="${current_account.wall_image }">
            </div>
            <div class="profile-menu-area bg-white">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-3 col-md-3">
                            <div class="profile-picture-box">
                                <figure class="profile-picture">
                                    <a href="profile.html">
                                        <img src="${current_account.avatar }" alt="profile picture">
                                    </a>
                                </figure>
                            </div>
                        </div>
                        <div class="col-lg-10 col-md-10 offset-lg-1">
                            <div class="profile-menu-wrapper">
                                <div class="main-menu-inner header-top-navigation">
                                    <nav>
                                        <ul class="main-menu float-right">
                                            <li><a href="my-profile">Thông tin</a></li>
                                            <li><a href="my-post">Bài đăng</a></li> 
                                            <li><a href="save-post">Bài đã lưu</a></li> 
                                            <li><a href="friend">Bạn bè</a></li> 
                                            <li class="active"><a href="request">Lời mời kết bạn</a></li> 
                                            <li><a href="follow">Theo dõi</a></li>
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
                <div class="row">
                    <div class="col-4">
                        <div class="about-description mb-4 px-4">
                            <div class="tab-content">
                                <div class="author-desc-title d-flex">
                                    <h6 class="author mx-auto">Yêu cầu đã gửi ( ${listRequestSend.size() } )</h6>
                                </div>
                                <div class="mt-5">
                                	<c:forEach var="request" items="${listRequestSend }">
                                		<div class="col-12 mt-3 mb-5">
	                                        <div class="unorder-list">
	                                            <div class="profile-thumb">
	                                                <a href="#">
	                                                    <figure class="profile-thumb-middle">
	                                                        <img src="${request.getTo_account().getAvatar() }" alt="profile picture">
	                                                    </figure>
	                                                </a>
	                                            </div>
	                                            <div class="unorder-list-info">
	                                                <h3 class="list-title f-16"><a href="#">${request.getTo_account().getName() }</a></h3>
	                                                <p class="list-subtitle">${fn:substring(request.time, 0, 16) }</p>
	                                                <a href="remove-request/${request.getTo_account().getAccount_id() }"><button class="remove-btn">Hủy yêu cầu</button></a>
	                                            </div>
	                                        </div>
	                                    </div>
                                	</c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-8">
                        <div class="about-description mb-4">
                            <div class="tab-content">
                                <div class="author-desc-title d-flex">
                                    <h6 class="author mx-auto">Yêu cầu kết bạn ( ${listRequestReceive.size() } )</h6>
                                </div>
                                <div class="row mt-5">
                                	<c:forEach var="request" items="${listRequestReceive }">
                                		<div class="col-12 col-md-6 col-lg-6 mt-3 mb-5">
	                                        <div class="unorder-list">
	                                            <div class="profile-thumb">
	                                                <a href="#">
	                                                    <figure class="profile-thumb-middle">
	                                                        <img src="${request.getFrom_account().getAvatar() }" alt="profile picture">
	                                                    </figure>
	                                                </a>
	                                            </div>
	                                            <div class="unorder-list-info">
	                                                <h3 class="list-title f-16"><a href="#">${request.getFrom_account().getName() }</a></h3>
	                                                <p class="list-subtitle">${fn:substring(request.time, 0, 16) }</p>
	                                                <div class="row ml-1">
	                                                    <a href="accept-request/${request.getFrom_account().getAccount_id() }"><button class="accept-btn mb-1 mr-1">Đồng ý</button></a>
	                                                    <a href="remove-request/${request.getFrom_account().getAccount_id() }"><button class="remove-btn mb-1">Từ chối</button></a>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
                                	</c:forEach>
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