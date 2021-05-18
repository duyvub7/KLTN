<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>Bài đã lưu</title>
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
                                            <li class="active"><a href="save-post">Bài đã lưu</a></li> 
                                            <li><a href="friend">Bạn bè</a></li> 
                                            <li><a href="request">Lời mời kết bạn</a></li> 
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

            <div class="about-author-details mt-0">
                <div class="container">
                    <div class="col-12 col-md-11 col-lg-10 row mx-auto">
                        <div class="col-lg-4 col-md-3 col-2">
                            <div class="card widget-item" style="position: sticky; top: 100px;">
                                <div class="about-me">
                                    <ul class="nav flex-column about-author-menu">
                                        <li><a href="#one" id="tab1" data-toggle="tab" class="active">Tất cả</a></li>
                                        <li><a href="#two" id="tab2" data-toggle="tab">Bài viết</a></li>
                                        <li><a href="#three" id="tab3" data-toggle="tab">Phòng trọ</a></li>
                                        <li><a href="#four" id="tab4" data-toggle="tab">Ở ghép</a></li>
                                        <li><a href="#five" id="tab5" data-toggle="tab">Đồ dùng</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-9 col-10">
                            
                            <div class="">
                                <div class="tab-content">
                                    <div class="tab-pane active show" id="one">
                                        <c:forEach var="post" items="${listPost0 }">
											<!-- post status start -->
					                        <div class="card">
					                            <!-- post title start -->
					                            <div class="post-title d-flex align-items-center">
					                                <!-- profile picture end -->
					                                <div class="profile-thumb">
					                                    <a href="#">
					                                        <figure class="profile-thumb-middle">
					                                            <img src="${post.getAccount().getAvatar() }" alt="profile picture">
					                                        </figure>
					                                    </a>
					                                </div>
					                                <!-- profile picture end -->
					
					                                <div class="posted-author">
					                                    <h6 class="author"><a href="profile.html">${post.getAccount().getName() }</a></h6>
					                                    <span class="post-time">${fn:substring(post.post_date, 0, 16) }</span>
					                                    <c:if test="${post.post_type != 1}">
					                                    	<p class="mt-1">
						                                        <i class="icofont icofont-location-pin"></i><span class="text-muted mr-3">${post.getProvince().getProvince_name() }</span>
						                                        <i class="fa fa-money mr-1"></i>
							                                        <span class="text-info">
							                                        	<fmt:formatNumber type="number" maxFractionDigits="3" value="${post.price }"/> vnđ
							                                        </span>
						                                    </p>
					                                    </c:if>
					                                </div>
					
					                                <div class="post-settings-bar">
					                                    <span></span>
					                                    <span></span>
					                                    <span></span>
					                                    <div class="post-settings arrow-shape">
					                                        <ul>
					                                            <li><button>Sửa bài viết</button></li>
					                                            <li><button>Xóa bài viết</button></li>
					                                        </ul>
					                                    </div>
					                                </div>
					                            </div>
					                            <!-- post title start -->
					                            <div class="post-content">
					                            	<c:if test="${post.post_content.length() > 300 }">
					                            		<p class="post-desc">
					                            			${fn:substring(post.post_content, 0, 300) }
					                            			<span class="text-blue post-more">...xem thêm</span>
					                            			<span class="more-content display-0">
					                            				${fn:substring(post.post_content, 301, post.post_content.length()) }
					                            				<span class="text-blue post-short">thu gọn</span>
					                            			</span>
					                            			
					                            		</p>
					                            	</c:if>
					                                <c:if test="${post.post_content.length() <= 300 }">
					                            		<p class="post-desc">${post.post_content}</p>
					                            	</c:if>
					                            	<c:if test="${post.getImage().size() > 0 }">
						                                <div class="post-thumb-gallery">
						                                    <figure class="post-thumb img-popup">
						                                        <a href="assets/images/post/post-large-1.jpg">
						                                            <img src="${post.getImage().get(0).getUrl() }" alt="post image">
						                                        </a>
						                                    </figure>
						                                </div>
						                            </c:if>
					                                <div class="post-meta">
					                                    <button class="post-meta-like">
					                                        <i class="fa fa-heart"></i>
					                                        <span class="lh-16">${post.getLike().size() }</span>
					                                    </button>
					                                    <ul class="comment-share-meta">
					                                        <li class="mr-3">
					                                            <button class="post-comment">
					                                                <i class="bi bi-chat-bubble"></i>
					                                                <span class="lh-16">${post.getComment().size() }</span>
					                                            </button>
					                                        </li>
					                                    </ul>
					                                </div>
					                                <div class="mt-1 ml-2">
					                                    <p class="text-success" id="bl-01">Xem thêm bình luận</p>
					                                    <p class="text-success display-0" id="bl-02">Ẩn bớt bình luận</p>
					                                </div>
					                                <div class="row mb-2">
					                                    <a href="#" class="col-1 px-2 mr-2">
					                                        <figure class="profile-thumb-small">
					                                            <img src="${current_account.avatar }" alt="profile picture">
					                                        </figure>
					                                    </a>
					                                    <input class="col-10 form-control rounded" />
					                                </div>
					                                <div id="com-area-1">
					                                	<c:forEach var="comment" items="${post.getComment() }" begin="0" end="1">
					                                		<div class="unorder-list mb-2 border-bot-light">
						                                        <div class="profile-thumb">
						                                            <a href="#">
						                                                <figure class="profile-thumb-small">
						                                                    <img src="${comment.getAccount().getAvatar() }" alt="profile picture">
						                                                </figure>
						                                            </a>
						                                        </div>
						                                        <div class="unorder-list-info with-500">
						                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">${comment.getAccount().getName() }</a></h3>
						                                            <p class="text-muted">
																		<fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${comment.time }"/>
																	</p>
						                                            <div>
						                                                <p>${comment.comment_content }</p>
						                                            </div>
						                                        </div>
						                                    </div>
					                                	</c:forEach>
					                                </div>
					                                <div class="display-0" id="com-area-2">
					                                    <c:forEach var="comment" items="${post.getComment() }" begin="2">
					                                		<div class="unorder-list mb-2 border-bot-light">
						                                        <div class="profile-thumb">
						                                            <a href="#">
						                                                <figure class="profile-thumb-small">
						                                                    <img src="${comment.getAccount().getAvatar() }" alt="profile picture">
						                                                </figure>
						                                            </a>
						                                        </div>
						                                        <div class="unorder-list-info with-500">
						                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">${comment.getAccount().getName() }</a></h3>
						                                            <p class="text-muted">
																		<fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${comment.time }"/>
																	</p>
						                                            <div>
						                                                <p>${comment.comment_content }</p>
						                                            </div>
						                                        </div>
						                                    </div>
					                                	</c:forEach>
					                                    <div class="unorder-list mb-2 border-bot-light">
					                                        <div class="profile-thumb">
					                                            <a href="#">
					                                                <figure class="profile-thumb-small">
					                                                    <img src="assets/images/profile/avatar-6.jpg" alt="profile picture">
					                                                </figure>
					                                            </a>
					                                        </div>
					                                        <div class="unorder-list-info with-500">
					                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">Jackson</a></h3>
					                                            <p class="text-muted">20 min ago</p>
					                                            <div>
					                                                <p>Bài viết rất hay</p>
					                                            </div>
					                                        </div>
					                                    </div>
					                                    <div class="unorder-list mb-2 border-bot-light">
					                                        <div class="profile-thumb">
					                                            <a href="#">
					                                                <figure class="profile-thumb-small">
					                                                    <img src="assets/images/profile/avatar-6.jpg" alt="profile picture">
					                                                </figure>
					                                            </a>
					                                        </div>
					                                        <div class="unorder-list-info with-500">
					                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">Jackson</a></h3>
					                                            <p class="text-muted">20 min ago</p>
					                                            <div>
					                                                <p>Bài viết rất hay</p>
					                                            </div>
					                                        </div>
					                                    </div>
					                                    <div class="unorder-list mb-2 border-bot-light">
					                                        <div class="profile-thumb">
					                                            <a href="#">
					                                                <figure class="profile-thumb-small">
					                                                    <img src="assets/images/profile/avatar-6.jpg" alt="profile picture">
					                                                </figure>
					                                            </a>
					                                        </div>
					                                        <div class="unorder-list-info with-500">
					                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">Jackson</a></h3>
					                                            <p class="text-muted">20 min ago</p>
					                                            <div>
					                                                <p>Bài viết rất hay</p>
					                                            </div>
					                                        </div>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                        <!-- post status end -->
										</c:forEach>>
                                    </div>
                                    <div class="tab-pane fade" id="two">
                                        <c:forEach var="post" items="${listPost1 }">
											<!-- post status start -->
					                        <div class="card">
					                            <!-- post title start -->
					                            <div class="post-title d-flex align-items-center">
					                                <!-- profile picture end -->
					                                <div class="profile-thumb">
					                                    <a href="#">
					                                        <figure class="profile-thumb-middle">
					                                            <img src="${post.getAccount().getAvatar() }" alt="profile picture">
					                                        </figure>
					                                    </a>
					                                </div>
					                                <!-- profile picture end -->
					
					                                <div class="posted-author">
					                                    <h6 class="author"><a href="profile.html">${post.getAccount().getName() }</a></h6>
					                                    <span class="post-time">${fn:substring(post.post_date, 0, 16) }</span>
					                                </div>
					
					                                <div class="post-settings-bar">
					                                    <span></span>
					                                    <span></span>
					                                    <span></span>
					                                    <div class="post-settings arrow-shape">
					                                        <ul>
					                                            <li><button>Sửa bài viết</button></li>
					                                            <li><button>Xóa bài viết</button></li>
					                                        </ul>
					                                    </div>
					                                </div>
					                            </div>
					                            <!-- post title start -->
					                            <div class="post-content">
					                            	<c:if test="${post.post_content.length() > 300 }">
					                            		<p class="post-desc">${fn:substring(post.post_content, 0, 300) }...<a href="#">xem thêm</a></p>
					                            	</c:if>
					                                <c:if test="${post.post_content.length() <= 300 }">
					                            		<p class="post-desc">${post.post_content}</p>
					                            	</c:if>
					                            	<c:if test="${post.getImage().size() > 0 }">
						                                <div class="post-thumb-gallery">
						                                    <figure class="post-thumb img-popup">
						                                        <a href="assets/images/post/post-large-1.jpg">
						                                            <img src="${post.getImage().get(0).getUrl() }" alt="post image">
						                                        </a>
						                                    </figure>
						                                </div>
						                            </c:if>
					                                <div class="post-meta">
					                                    <button class="post-meta-like">
					                                        <i class="bi bi-heart-beat"></i>
					                                        <span>${post.getLike().size() }</span>
					                                        <strong>201</strong>
					                                    </button>
					                                    <ul class="comment-share-meta">
					                                        <li>
					                                            <button class="post-comment">
					                                                <i class="bi bi-chat-bubble"></i>
					                                                <span>${post.getComment().size() }</span>
					                                            </button>
					                                        </li>
					                                        <li>
					                                            <button class="post-share">
					                                                <i class="bi bi-share"></i>
					                                                <span>02</span>
					                                            </button>
					                                        </li>
					                                    </ul>
					                                </div>
					                                <div class="mt-1 ml-2">
					                                    <p class="text-success" id="bl-01">Xem thêm bình luận</p>
					                                    <p class="text-success hide-class" id="bl-02">Ẩn bớt bình luận</p>
					                                </div>
					                                <div class="row mb-2">
					                                    <a href="#" class="col-1 px-2 mr-2">
					                                        <figure class="profile-thumb-small">
					                                            <img src="${current_account.avatar }" alt="profile picture">
					                                        </figure>
					                                    </a>
					                                    <input class="col-10 form-control rounded" />
					                                </div>
					                                <div id="com-area-1">
					                                	<c:forEach var="comment" items="${post.getComment() }">
					                                		<div class="unorder-list mb-2 border-bot-light">
					                                        <div class="profile-thumb">
					                                            <a href="#">
					                                                <figure class="profile-thumb-small">
					                                                    <img src="${comment.getAccount().getAvatar() }" alt="profile picture">
					                                                </figure>
					                                            </a>
					                                        </div>
					                                        <div class="unorder-list-info with-500">
					                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">${comment.getAccount().getName() }</a></h3>
					                                            <p class="text-muted">${fn:substring(comment.time, 0, 16) }</p>
					                                            <div>
					                                                <p>${comment.comment_content }</p>
					                                            </div>
					                                        </div>
					                                    </div>
					                                	</c:forEach>
					                                </div>
					                                <div class="hide-class" id="com-area-2">
					                                    <div class="unorder-list mb-2 border-bot-light">
					                                        <div class="profile-thumb">
					                                            <a href="#">
					                                                <figure class="profile-thumb-small">
					                                                    <img src="assets/images/profile/avatar-6.jpg" alt="profile picture">
					                                                </figure>
					                                            </a>
					                                        </div>
					                                        <div class="unorder-list-info with-500">
					                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">Jackson</a></h3>
					                                            <p class="text-muted">20 min ago</p>
					                                            <div>
					                                                <p>Bài viết rất hay</p>
					                                            </div>
					                                        </div>
					                                    </div>
					                                    <div class="unorder-list mb-2 border-bot-light">
					                                        <div class="profile-thumb">
					                                            <a href="#">
					                                                <figure class="profile-thumb-small">
					                                                    <img src="assets/images/profile/avatar-6.jpg" alt="profile picture">
					                                                </figure>
					                                            </a>
					                                        </div>
					                                        <div class="unorder-list-info with-500">
					                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">Jackson</a></h3>
					                                            <p class="text-muted">20 min ago</p>
					                                            <div>
					                                                <p>Bài viết rất hay</p>
					                                            </div>
					                                        </div>
					                                    </div>
					                                    <div class="unorder-list mb-2 border-bot-light">
					                                        <div class="profile-thumb">
					                                            <a href="#">
					                                                <figure class="profile-thumb-small">
					                                                    <img src="assets/images/profile/avatar-6.jpg" alt="profile picture">
					                                                </figure>
					                                            </a>
					                                        </div>
					                                        <div class="unorder-list-info with-500">
					                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">Jackson</a></h3>
					                                            <p class="text-muted">20 min ago</p>
					                                            <div>
					                                                <p>Bài viết rất hay</p>
					                                            </div>
					                                        </div>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                        <!-- post status end -->
										</c:forEach>
                                    </div>
                                    <div class="tab-pane fade" id="three">
                                        <c:forEach var="post" items="${listPost2 }">
											<!-- post status start -->
					                        <div class="card">
					                            <!-- post title start -->
					                            <div class="post-title d-flex align-items-center">
					                                <!-- profile picture end -->
					                                <div class="profile-thumb">
					                                    <a href="#">
					                                        <figure class="profile-thumb-middle">
					                                            <img src="${post.getAccount().getAvatar() }" alt="profile picture">
					                                        </figure>
					                                    </a>
					                                </div>
					                                <!-- profile picture end -->
					
					                                <div class="posted-author">
					                                    <h6 class="author"><a href="profile.html">${post.getAccount().getName() }</a></h6>
					                                    <span class="post-time">${fn:substring(post.post_date, 0, 16) }</span>
					                                    <c:if test="${post.post_type != 1}">
					                                    	<p class="mt-1">
						                                        <i class="icofont icofont-location-pin"></i><span class="text-muted mr-3">${post.getProvince().getProvince_name() }</span>
						                                        <i class="fa fa-money mr-1"></i>
							                                        <span class="text-info">
							                                        	<fmt:formatNumber type="number" maxFractionDigits="3" value="${post.price }"/> vnđ
							                                        </span>
						                                    </p>
					                                    </c:if>
					                                </div>
					
					                                <div class="post-settings-bar">
					                                    <span></span>
					                                    <span></span>
					                                    <span></span>
					                                    <div class="post-settings arrow-shape">
					                                        <ul>
					                                            <li><button>Sửa bài viết</button></li>
					                                            <li><button>Xóa bài viết</button></li>
					                                        </ul>
					                                    </div>
					                                </div>
					                            </div>
					                            <!-- post title start -->
					                            <div class="post-content">
					                            	<c:if test="${post.post_content.length() > 300 }">
					                            		<p class="post-desc">${fn:substring(post.post_content, 0, 300) }...<a href="#">xem thêm</a></p>
					                            	</c:if>
					                                <c:if test="${post.post_content.length() <= 300 }">
					                            		<p class="post-desc">${post.post_content}</p>
					                            	</c:if>
					                            	<c:if test="${post.getImage().size() > 0 }">
						                                <div class="post-thumb-gallery">
						                                    <figure class="post-thumb img-popup">
						                                        <a href="assets/images/post/post-large-1.jpg">
						                                            <img src="${post.getImage().get(0).getUrl() }" alt="post image">
						                                        </a>
						                                    </figure>
						                                </div>
						                            </c:if>
					                                <div class="post-meta">
					                                    <button class="post-meta-like">
					                                        <i class="bi bi-heart-beat"></i>
					                                        <span>${post.getLike().size() }</span>
					                                        <strong>201</strong>
					                                    </button>
					                                    <ul class="comment-share-meta">
					                                        <li>
					                                            <button class="post-comment">
					                                                <i class="bi bi-chat-bubble"></i>
					                                                <span>${post.getComment().size() }</span>
					                                            </button>
					                                        </li>
					                                        <li>
					                                            <button class="post-share">
					                                                <i class="bi bi-share"></i>
					                                                <span>02</span>
					                                            </button>
					                                        </li>
					                                    </ul>
					                                </div>
					                                <div class="mt-1 ml-2">
					                                    <p class="text-success" id="bl-01">Xem thêm bình luận</p>
					                                    <p class="text-success hide-class" id="bl-02">Ẩn bớt bình luận</p>
					                                </div>
					                                <div class="row mb-2">
					                                    <a href="#" class="col-1 px-2 mr-2">
					                                        <figure class="profile-thumb-small">
					                                            <img src="${current_account.avatar }" alt="profile picture">
					                                        </figure>
					                                    </a>
					                                    <input class="col-10 form-control rounded" />
					                                </div>
					                                <div id="com-area-1">
					                                	<c:forEach var="comment" items="${post.getComment() }">
					                                		<div class="unorder-list mb-2 border-bot-light">
					                                        <div class="profile-thumb">
					                                            <a href="#">
					                                                <figure class="profile-thumb-small">
					                                                    <img src="${comment.getAccount().getAvatar() }" alt="profile picture">
					                                                </figure>
					                                            </a>
					                                        </div>
					                                        <div class="unorder-list-info with-500">
					                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">${comment.getAccount().getName() }</a></h3>
					                                            <p class="text-muted">${fn:substring(comment.time, 0, 16) }</p>
					                                            <div>
					                                                <p>${comment.comment_content }</p>
					                                            </div>
					                                        </div>
					                                    </div>
					                                	</c:forEach>
					                                </div>
					                                <div class="hide-class" id="com-area-2">
					                                    <div class="unorder-list mb-2 border-bot-light">
					                                        <div class="profile-thumb">
					                                            <a href="#">
					                                                <figure class="profile-thumb-small">
					                                                    <img src="assets/images/profile/avatar-6.jpg" alt="profile picture">
					                                                </figure>
					                                            </a>
					                                        </div>
					                                        <div class="unorder-list-info with-500">
					                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">Jackson</a></h3>
					                                            <p class="text-muted">20 min ago</p>
					                                            <div>
					                                                <p>Bài viết rất hay</p>
					                                            </div>
					                                        </div>
					                                    </div>
					                                    <div class="unorder-list mb-2 border-bot-light">
					                                        <div class="profile-thumb">
					                                            <a href="#">
					                                                <figure class="profile-thumb-small">
					                                                    <img src="assets/images/profile/avatar-6.jpg" alt="profile picture">
					                                                </figure>
					                                            </a>
					                                        </div>
					                                        <div class="unorder-list-info with-500">
					                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">Jackson</a></h3>
					                                            <p class="text-muted">20 min ago</p>
					                                            <div>
					                                                <p>Bài viết rất hay</p>
					                                            </div>
					                                        </div>
					                                    </div>
					                                    <div class="unorder-list mb-2 border-bot-light">
					                                        <div class="profile-thumb">
					                                            <a href="#">
					                                                <figure class="profile-thumb-small">
					                                                    <img src="assets/images/profile/avatar-6.jpg" alt="profile picture">
					                                                </figure>
					                                            </a>
					                                        </div>
					                                        <div class="unorder-list-info with-500">
					                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">Jackson</a></h3>
					                                            <p class="text-muted">20 min ago</p>
					                                            <div>
					                                                <p>Bài viết rất hay</p>
					                                            </div>
					                                        </div>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                        <!-- post status end -->
										</c:forEach>
                                    </div>
                                    <div class="tab-pane fade" id="four">
                                        <c:forEach var="post" items="${listPost3 }">
											<!-- post status start -->
					                        <div class="card">
					                            <!-- post title start -->
					                            <div class="post-title d-flex align-items-center">
					                                <!-- profile picture end -->
					                                <div class="profile-thumb">
					                                    <a href="#">
					                                        <figure class="profile-thumb-middle">
					                                            <img src="${post.getAccount().getAvatar() }" alt="profile picture">
					                                        </figure>
					                                    </a>
					                                </div>
					                                <!-- profile picture end -->
					
					                                <div class="posted-author">
					                                    <h6 class="author"><a href="profile.html">${post.getAccount().getName() }</a></h6>
					                                    <span class="post-time">${fn:substring(post.post_date, 0, 16) }</span>
					                                    <c:if test="${post.post_type != 1}">
					                                    	<p class="mt-1">
						                                        <i class="icofont icofont-location-pin"></i><span class="text-muted mr-3">${post.getProvince().getProvince_name() }</span>
						                                        <i class="fa fa-money mr-1"></i>
							                                        <span class="text-info">
							                                        	<fmt:formatNumber type="number" maxFractionDigits="3" value="${post.price }"/> vnđ
							                                        </span>
						                                    </p>
					                                    </c:if>
					                                </div>
					
					                                <div class="post-settings-bar">
					                                    <span></span>
					                                    <span></span>
					                                    <span></span>
					                                    <div class="post-settings arrow-shape">
					                                        <ul>
					                                            <li><button>Sửa bài viết</button></li>
					                                            <li><button>Xóa bài viết</button></li>
					                                        </ul>
					                                    </div>
					                                </div>
					                            </div>
					                            <!-- post title start -->
					                            <div class="post-content">
					                            	<c:if test="${post.post_content.length() > 300 }">
					                            		<p class="post-desc">${fn:substring(post.post_content, 0, 300) }...<a href="#">xem thêm</a></p>
					                            	</c:if>
					                                <c:if test="${post.post_content.length() <= 300 }">
					                            		<p class="post-desc">${post.post_content}</p>
					                            	</c:if>
					                            	<c:if test="${post.getImage().size() > 0 }">
						                                <div class="post-thumb-gallery">
						                                    <figure class="post-thumb img-popup">
						                                        <a href="assets/images/post/post-large-1.jpg">
						                                            <img src="${post.getImage().get(0).getUrl() }" alt="post image">
						                                        </a>
						                                    </figure>
						                                </div>
						                            </c:if>
					                                <div class="post-meta">
					                                    <button class="post-meta-like">
					                                        <i class="bi bi-heart-beat"></i>
					                                        <span>${post.getLike().size() }</span>
					                                        <strong>201</strong>
					                                    </button>
					                                    <ul class="comment-share-meta">
					                                        <li>
					                                            <button class="post-comment">
					                                                <i class="bi bi-chat-bubble"></i>
					                                                <span>${post.getComment().size() }</span>
					                                            </button>
					                                        </li>
					                                        <li>
					                                            <button class="post-share">
					                                                <i class="bi bi-share"></i>
					                                                <span>02</span>
					                                            </button>
					                                        </li>
					                                    </ul>
					                                </div>
					                                <div class="mt-1 ml-2">
					                                    <p class="text-success" id="bl-01">Xem thêm bình luận</p>
					                                    <p class="text-success hide-class" id="bl-02">Ẩn bớt bình luận</p>
					                                </div>
					                                <div class="row mb-2">
					                                    <a href="#" class="col-1 px-2 mr-2">
					                                        <figure class="profile-thumb-small">
					                                            <img src="${current_account.avatar }" alt="profile picture">
					                                        </figure>
					                                    </a>
					                                    <input class="col-10 form-control rounded" />
					                                </div>
					                                <div id="com-area-1">
					                                	<c:forEach var="comment" items="${post.getComment() }">
					                                		<div class="unorder-list mb-2 border-bot-light">
					                                        <div class="profile-thumb">
					                                            <a href="#">
					                                                <figure class="profile-thumb-small">
					                                                    <img src="${comment.getAccount().getAvatar() }" alt="profile picture">
					                                                </figure>
					                                            </a>
					                                        </div>
					                                        <div class="unorder-list-info with-500">
					                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">${comment.getAccount().getName() }</a></h3>
					                                            <p class="text-muted">${fn:substring(comment.time, 0, 16) }</p>
					                                            <div>
					                                                <p>${comment.comment_content }</p>
					                                            </div>
					                                        </div>
					                                    </div>
					                                	</c:forEach>
					                                </div>
					                                <div class="hide-class" id="com-area-2">
					                                    <div class="unorder-list mb-2 border-bot-light">
					                                        <div class="profile-thumb">
					                                            <a href="#">
					                                                <figure class="profile-thumb-small">
					                                                    <img src="assets/images/profile/avatar-6.jpg" alt="profile picture">
					                                                </figure>
					                                            </a>
					                                        </div>
					                                        <div class="unorder-list-info with-500">
					                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">Jackson</a></h3>
					                                            <p class="text-muted">20 min ago</p>
					                                            <div>
					                                                <p>Bài viết rất hay</p>
					                                            </div>
					                                        </div>
					                                    </div>
					                                    <div class="unorder-list mb-2 border-bot-light">
					                                        <div class="profile-thumb">
					                                            <a href="#">
					                                                <figure class="profile-thumb-small">
					                                                    <img src="assets/images/profile/avatar-6.jpg" alt="profile picture">
					                                                </figure>
					                                            </a>
					                                        </div>
					                                        <div class="unorder-list-info with-500">
					                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">Jackson</a></h3>
					                                            <p class="text-muted">20 min ago</p>
					                                            <div>
					                                                <p>Bài viết rất hay</p>
					                                            </div>
					                                        </div>
					                                    </div>
					                                    <div class="unorder-list mb-2 border-bot-light">
					                                        <div class="profile-thumb">
					                                            <a href="#">
					                                                <figure class="profile-thumb-small">
					                                                    <img src="assets/images/profile/avatar-6.jpg" alt="profile picture">
					                                                </figure>
					                                            </a>
					                                        </div>
					                                        <div class="unorder-list-info with-500">
					                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">Jackson</a></h3>
					                                            <p class="text-muted">20 min ago</p>
					                                            <div>
					                                                <p>Bài viết rất hay</p>
					                                            </div>
					                                        </div>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                        <!-- post status end -->
										</c:forEach>
                                    </div>
                                    <div class="tab-pane fade" id="five">
                                        <c:forEach var="post" items="${listPost4 }">
											<!-- post status start -->
					                        <div class="card">
					                            <!-- post title start -->
					                            <div class="post-title d-flex align-items-center">
					                                <!-- profile picture end -->
					                                <div class="profile-thumb">
					                                    <a href="#">
					                                        <figure class="profile-thumb-middle">
					                                            <img src="${post.getAccount().getAvatar() }" alt="profile picture">
					                                        </figure>
					                                    </a>
					                                </div>
					                                <!-- profile picture end -->
					
					                                <div class="posted-author">
					                                    <h6 class="author"><a href="profile.html">${post.getAccount().getName() }</a></h6>
					                                    <span class="post-time">${fn:substring(post.post_date, 0, 16) }</span>
					                                    <c:if test="${post.post_type != 1}">
					                                    	<p class="mt-1">
						                                        <i class="icofont icofont-location-pin"></i><span class="text-muted mr-3">${post.getProvince().getProvince_name() }</span>
						                                        <i class="fa fa-money mr-1"></i>
							                                        <span class="text-info">
							                                        	<fmt:formatNumber type="number" maxFractionDigits="3" value="${post.price }"/> vnđ
							                                        </span>
						                                    </p>
					                                    </c:if>
					                                </div>
					
					                                <div class="post-settings-bar">
					                                    <span></span>
					                                    <span></span>
					                                    <span></span>
					                                    <div class="post-settings arrow-shape">
					                                        <ul>
					                                            <li><button>Sửa bài viết</button></li>
					                                            <li><button>Xóa bài viết</button></li>
					                                        </ul>
					                                    </div>
					                                </div>
					                            </div>
					                            <!-- post title start -->
					                            <div class="post-content">
					                            	<c:if test="${post.post_content.length() > 300 }">
					                            		<p class="post-desc">${fn:substring(post.post_content, 0, 300) }...<a href="#">xem thêm</a></p>
					                            	</c:if>
					                                <c:if test="${post.post_content.length() <= 300 }">
					                            		<p class="post-desc">${post.post_content}</p>
					                            	</c:if>
					                            	<c:if test="${post.getImage().size() > 0 }">
						                                <div class="post-thumb-gallery">
						                                    <figure class="post-thumb img-popup">
						                                        <a href="assets/images/post/post-large-1.jpg">
						                                            <img src="${post.getImage().get(0).getUrl() }" alt="post image">
						                                        </a>
						                                    </figure>
						                                </div>
						                            </c:if>
					                                <div class="post-meta">
					                                    <button class="post-meta-like">
					                                        <i class="bi bi-heart-beat"></i>
					                                        <span>${post.getLike().size() }</span>
					                                        <strong>201</strong>
					                                    </button>
					                                    <ul class="comment-share-meta">
					                                        <li>
					                                            <button class="post-comment">
					                                                <i class="bi bi-chat-bubble"></i>
					                                                <span>${post.getComment().size() }</span>
					                                            </button>
					                                        </li>
					                                        <li>
					                                            <button class="post-share">
					                                                <i class="bi bi-share"></i>
					                                                <span>02</span>
					                                            </button>
					                                        </li>
					                                    </ul>
					                                </div>
					                                <div class="mt-1 ml-2">
					                                    <p class="text-success" id="bl-01">Xem thêm bình luận</p>
					                                    <p class="text-success hide-class" id="bl-02">Ẩn bớt bình luận</p>
					                                </div>
					                                <div class="row mb-2">
					                                    <a href="#" class="col-1 px-2 mr-2">
					                                        <figure class="profile-thumb-small">
					                                            <img src="${current_account.avatar }" alt="profile picture">
					                                        </figure>
					                                    </a>
					                                    <input class="col-10 form-control rounded" />
					                                </div>
					                                <div id="com-area-1">
					                                	<c:forEach var="comment" items="${post.getComment() }">
					                                		<div class="unorder-list mb-2 border-bot-light">
					                                        <div class="profile-thumb">
					                                            <a href="#">
					                                                <figure class="profile-thumb-small">
					                                                    <img src="${comment.getAccount().getAvatar() }" alt="profile picture">
					                                                </figure>
					                                            </a>
					                                        </div>
					                                        <div class="unorder-list-info with-500">
					                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">${comment.getAccount().getName() }</a></h3>
					                                            <p class="text-muted">${fn:substring(comment.time, 0, 16) }</p>
					                                            <div>
					                                                <p>${comment.comment_content }</p>
					                                            </div>
					                                        </div>
					                                    </div>
					                                	</c:forEach>
					                                </div>
					                                <div class="hide-class" id="com-area-2">
					                                    <div class="unorder-list mb-2 border-bot-light">
					                                        <div class="profile-thumb">
					                                            <a href="#">
					                                                <figure class="profile-thumb-small">
					                                                    <img src="assets/images/profile/avatar-6.jpg" alt="profile picture">
					                                                </figure>
					                                            </a>
					                                        </div>
					                                        <div class="unorder-list-info with-500">
					                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">Jackson</a></h3>
					                                            <p class="text-muted">20 min ago</p>
					                                            <div>
					                                                <p>Bài viết rất hay</p>
					                                            </div>
					                                        </div>
					                                    </div>
					                                    <div class="unorder-list mb-2 border-bot-light">
					                                        <div class="profile-thumb">
					                                            <a href="#">
					                                                <figure class="profile-thumb-small">
					                                                    <img src="assets/images/profile/avatar-6.jpg" alt="profile picture">
					                                                </figure>
					                                            </a>
					                                        </div>
					                                        <div class="unorder-list-info with-500">
					                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">Jackson</a></h3>
					                                            <p class="text-muted">20 min ago</p>
					                                            <div>
					                                                <p>Bài viết rất hay</p>
					                                            </div>
					                                        </div>
					                                    </div>
					                                    <div class="unorder-list mb-2 border-bot-light">
					                                        <div class="profile-thumb">
					                                            <a href="#">
					                                                <figure class="profile-thumb-small">
					                                                    <img src="assets/images/profile/avatar-6.jpg" alt="profile picture">
					                                                </figure>
					                                            </a>
					                                        </div>
					                                        <div class="unorder-list-info with-500">
					                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="#">Jackson</a></h3>
					                                            <p class="text-muted">20 min ago</p>
					                                            <div>
					                                                <p>Bài viết rất hay</p>
					                                            </div>
					                                        </div>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                        <!-- post status end -->
										</c:forEach>
                                    </div>
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