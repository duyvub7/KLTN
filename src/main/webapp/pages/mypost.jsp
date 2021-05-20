<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>Bài đăng của tôi</title>
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
                                    <a href="my-profile">
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
                                            <li class="active"><a href="my-post">Bài đăng</a></li> 
                                            <li><a href="save-post">Bài đã lưu</a></li> 
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
                                        <div class="card card-small">
                                            <div class="share-box-inner">
                                                <div class="profile-thumb">
                                                    <a href="#">
                                                        <figure class="profile-thumb-middle">
                                                            <img src="${current_account.avatar }" alt="profile picture">
                                                        </figure>
                                                    </a>
                                                </div>
                                                <div class="share-content-box w-100">
                                                    <form class="share-text-box">
                                                        <textarea name="share" class="share-text-field" aria-disabled="true" placeholder="Viết gì đó" data-toggle="modal" data-target="#choose-type" id="addBtn1"></textarea>
                                                        <button class="btn-share" type="submit">Đăng</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <c:forEach var="post" items="${listPost0 }">
											<div class="card post-num-${post.post_id }">
					                            <!-- post title start -->
					                            <div class="post-title d-flex align-items-center">
					                                <!-- profile picture end -->
					                                <div class="profile-thumb">
					                                    <a href="${contextPath}/profile/${post.getAccount_id() }">
					                                        <figure class="profile-thumb-middle">
					                                            <img src="${post.getAccount().getAvatar() }" alt="profile picture">
					                                        </figure>
					                                    </a>
					                                </div>
					                                <!-- profile picture end -->
					
					                                <div class="posted-author">
					                                    <h6 class="author"><a href="${contextPath}/profile/${post.getAccount_id() }">${post.getAccount().getName() }</a></h6>
					                                    <span class="post-time">
					                                    	<fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${post.post_date }"/>
					                                    	<c:if test="${post.post_type != 1 }">
					                                    		<c:choose>
						                                    		<c:when test="${post.post_status == true }">
						                                    			<strong class="pl-3">Đang sẵng sàng</strong>
						                                    		</c:when>
						                                    		<c:otherwise>
						                                    			<strong class="pl-3">Đã hết hạn</strong>
						                                    		</c:otherwise>
						                                    	</c:choose>
					                                    	</c:if>
					                                    </span>
					                                    <c:if test="${post.post_type != 1 }">
					                                    	<p>
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
					                                        	<li><button class="edit-mypost" data-id="${post.post_id }">Sửa bài viết</button></li>
					                                            <li><button class="remove-mypost" data-id="${post.post_id }" data-cont="${fn:substring(post.post_content, 0, 100) }">
	                                            					Xóa bài viết</button></li>
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
					                                    <button class="post-meta-like" data-postId="${post.post_id }"
					                                    	 data-icon="icon-of${post.post_id }" data-like="like-of${post.post_id }">
				                                        	<c:forEach var="id" items="${listLiked }">
				                                        		<c:if test="${id == post.post_id }">
				                                        			<c:set var = "check" value = "yes"/>
				                                        		</c:if>
				                                        	</c:forEach>
				                                        	<c:choose>
					                                        	<c:when test="${ check == 'yes' }">
					                                        		<i class="fa fa-heart icon-of${post.post_id }" style="color: #41b3d8"></i>
					                                        	</c:when>
					                                        	<c:otherwise>
					                                        		<i class="fa fa-heart icon-of${post.post_id }"></i>
					                                        	</c:otherwise>
					                                        </c:choose>
					                                        <span class="lh-16 like-of${post.post_id }">${post.getLike().size() }</span>
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
					                                <hr class="my-2">
					                                <c:if test="${post.getComment().size() > 2 }">
					                                	<div class="ml-2 mb-2 option-com">
						                                    <p class="text-success more-com">Xem thêm bình luận</p>
						                                    <p class="text-success display-0 hide-com">Ẩn bớt bình luận</p>
						                                </div>
					                                </c:if>
					                                <div class="row mb-back-10">
					                                    <a href="${contextPath}/my-profile" class="col-1 px-2 mr-2">
					                                        <figure class="profile-thumb-small">
					                                            <img src="${contextPath}/${current_account.avatar }" alt="profile picture">
					                                        </figure>
					                                    </a>
					                                    <form action="${contextPath}/add-comment/${post.post_id }" method="post" enctype="multipart/form-data" class="col-11 row">
					                                    	<input name="content" class="col-12 form-control rounded pr-5" placeholder="Nhập bình luận" autocomplete="off"/>
						                                    <i class="fa fa-picture-o f-18 image-input" onclick="document.getElementById('file-com${post.post_id}').click()"></i>
					  										<input id="file-com${post.post_id}" name="file" style="visibility:hidden;" type="file">
					                                    </form>
					                                </div>
					                                <div class="com-area-1">
					                                	<c:forEach var="comment" items="${post.getComment() }" begin="0" end="1">
					                                		<div class="unorder-list mb-2 border-bot-light comment-num-${comment.comment_id }">
						                                        <div class="profile-thumb">
						                                            <a href="${contextPath}/profile/${comment.getAccount_id() }">
						                                                <figure class="profile-thumb-small">
						                                                    <img src="${comment.getAccount().getAvatar() }" alt="profile picture">
						                                                </figure>
						                                            </a>
						                                        </div>
						                                        <div class="unorder-list-info with-500">
						                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="${contextPath}/profile/${comment.getAccount_id() }">
						                                            	${comment.getAccount().getName() }</a></h3>
						                                            <p class="text-muted">
						                                            	<fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${comment.time }"/>
						                                            </p>
						                                            <button class="btn-secondary btn-sm rounded float-right delete-comment" data-id="${comment.comment_id }">Xóa</button>
						                                            <div class="mt-back-5">
						                                                <p>${comment.comment_content }</p>
						                                            </div>
						                                            <div class="col-12 ml-back-15">
						                                            	<c:forEach var="image" items="${comment.getImage() }">
						                                            		<img src="${contextPath}/${image.getUrl() }" class="float-left mr-1 mb-1 with-100 height-70">
						                                            	</c:forEach>
						                                            </div>
						                                        </div>
						                                    </div>
					                                	</c:forEach>
					                                </div>
					                                <div class="display-0 com-area-2">
					                                    <c:forEach var="comment" items="${post.getComment() }" begin="2">
					                                		<div class="unorder-list mb-2 border-bot-light comment-num-${comment.comment_id }">
						                                        <div class="profile-thumb">
						                                            <a href="${contextPath}/profile/${comment.getAccount_id() }">
						                                                <figure class="profile-thumb-small">
						                                                    <img src="${comment.getAccount().getAvatar() }" alt="profile picture">
						                                                </figure>
						                                            </a>
						                                        </div>
						                                        <div class="unorder-list-info with-500">
						                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="${contextPath}/profile/${comment.getAccount_id() }">
						                                            	${comment.getAccount().getName() }</a></h3>
						                                            <p class="text-muted">
						                                            	<fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${comment.time }"/>
						                                            </p>
						                                            <button class="btn-secondary btn-sm rounded float-right delete-comment" data-id="${comment.comment_id }">Xóa</button>
						                                            <div class="mt-back-5">
						                                                <p>${comment.comment_content }</p>
						                                            </div>
						                                            <div class="col-12 ml-back-15">
						                                            	<c:forEach var="image" items="${comment.getImage() }">
						                                            		<img src="${contextPath}/${image.getUrl() }" class="float-left mr-1 mb-1 with-100 height-70">
						                                            	</c:forEach>
						                                            </div>
						                                        </div>
						                                    </div>
					                                	</c:forEach>
					                                </div>
					                            </div>
					                        </div>
										</c:forEach>
                                    </div>
                                    <div class="tab-pane fade" id="two">
                                        <div class="card card-small">
                                            <div class="share-box-inner">
                                                <div class="profile-thumb">
                                                    <a href="#">
                                                        <figure class="profile-thumb-middle">
                                                            <img src="${current_account.avatar }" alt="profile picture">
                                                        </figure>
                                                    </a>
                                                </div>
                                                <div class="share-content-box w-100">
                                                    <form class="share-text-box">
                                                        <textarea name="share" class="share-text-field" aria-disabled="true" placeholder="Viết gì đó" data-toggle="modal" data-target="#textbox" id="addBtn2"></textarea>
                                                        <button class="btn-share" type="submit">Đăng</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <c:forEach var="post" items="${listPost1 }">
					                        <div class="card post-num-${post.post_id }">
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
					                                    <h6 class="author"><a href="${contextPath}/profile/${post.getAccount_id() }">${post.getAccount().getName() }</a></h6>
					                                    <span class="post-time">
					                                    	<fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${post.post_date }"/>
					                                    </span>
					                                </div>
					
					                                <div class="post-settings-bar">
					                                    <span></span>
					                                    <span></span>
					                                    <span></span>
					                                    <div class="post-settings arrow-shape">
					                                        <ul>
					                                        	<li><button class="edit-mypost" data-id="${post.post_id }">Sửa bài viết</button></li>
					                                            <li><button class="remove-mypost" data-id="${post.post_id }" data-cont="${fn:substring(post.post_content, 0, 100) }">
	                                            					Xóa bài viết</button></li>
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
					                                    <button class="post-meta-like" data-postId="${post.post_id }"
					                                    	 data-icon="icon-of${post.post_id }" data-like="like-of${post.post_id }">
				                                        	<c:forEach var="id" items="${listLiked }">
				                                        		<c:if test="${id == post.post_id }">
				                                        			<c:set var = "check" value = "yes"/>
				                                        		</c:if>
				                                        	</c:forEach>
				                                        	<c:choose>
					                                        	<c:when test="${ check == 'yes' }">
					                                        		<i class="fa fa-heart icon-of${post.post_id }" style="color: #41b3d8"></i>
					                                        	</c:when>
					                                        	<c:otherwise>
					                                        		<i class="fa fa-heart icon-of${post.post_id }"></i>
					                                        	</c:otherwise>
					                                        </c:choose>
					                                        <span class="lh-16 like-of${post.post_id }">${post.getLike().size() }</span>
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
					                                <hr class="my-2">
					                                <c:if test="${post.getComment().size() > 2 }">
					                                	<div class="ml-2 mb-2 option-com">
						                                    <p class="text-success more-com">Xem thêm bình luận</p>
						                                    <p class="text-success display-0 hide-com">Ẩn bớt bình luận</p>
						                                </div>
					                                </c:if>
					                                <div class="row mb-back-10">
					                                    <a href="${contextPath}/my-profile" class="col-1 px-2 mr-2">
					                                        <figure class="profile-thumb-small">
					                                            <img src="${contextPath}/${current_account.avatar }" alt="profile picture">
					                                        </figure>
					                                    </a>
					                                    <form action="${contextPath}/add-comment/${post.post_id }" method="post" enctype="multipart/form-data" class="col-11 row">
					                                    	<input name="content" class="col-12 form-control rounded pr-5" placeholder="Nhập bình luận" autocomplete="off"/>
						                                    <i class="fa fa-picture-o f-18 image-input" onclick="document.getElementById('file-com${post.post_id}').click()"></i>
					  										<input id="file-com${post.post_id}" name="file" style="visibility:hidden;" type="file">
					                                    </form>
					                                </div>
					                                <div class="com-area-1">
					                                	<c:forEach var="comment" items="${post.getComment() }" begin="0" end="1">
					                                		<div class="unorder-list mb-2 border-bot-light comment-num-${comment.comment_id }">
						                                        <div class="profile-thumb">
						                                            <a href="${contextPath}/profile/${comment.getAccount_id() }">
						                                                <figure class="profile-thumb-small">
						                                                    <img src="${comment.getAccount().getAvatar() }" alt="profile picture">
						                                                </figure>
						                                            </a>
						                                        </div>
						                                        <div class="unorder-list-info with-500">
						                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="${contextPath}/profile/${comment.getAccount_id() }">
						                                            	${comment.getAccount().getName() }</a></h3>
						                                            <p class="text-muted">
						                                            	<fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${comment.time }"/>
						                                            </p>
						                                            <button class="btn-secondary btn-sm rounded float-right delete-comment" data-id="${comment.comment_id }">Xóa</button>
						                                            <div class="mt-back-5">
						                                                <p>${comment.comment_content }</p>
						                                            </div>
						                                            <div class="col-12 ml-back-15">
						                                            	<c:forEach var="image" items="${comment.getImage() }">
						                                            		<img src="${contextPath}/${image.getUrl() }" class="float-left mr-1 mb-1 with-100 height-70">
						                                            	</c:forEach>
						                                            </div>
						                                        </div>
						                                    </div>
					                                	</c:forEach>
					                                </div>
					                                <div class="display-0 com-area-2">
					                                    <c:forEach var="comment" items="${post.getComment() }" begin="2">
					                                		<div class="unorder-list mb-2 border-bot-light comment-num-${comment.comment_id }">
						                                        <div class="profile-thumb">
						                                            <a href="${contextPath}/profile/${comment.getAccount_id() }">
						                                                <figure class="profile-thumb-small">
						                                                    <img src="${comment.getAccount().getAvatar() }" alt="profile picture">
						                                                </figure>
						                                            </a>
						                                        </div>
						                                        <div class="unorder-list-info with-500">
						                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="${contextPath}/profile/${comment.getAccount_id() }">
						                                            	${comment.getAccount().getName() }</a></h3>
						                                            <p class="text-muted">
						                                            	<fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${comment.time }"/>
						                                            </p>
						                                            <button class="btn-secondary btn-sm rounded float-right delete-comment" data-id="${comment.comment_id }">Xóa</button>
						                                            <div class="mt-back-5">
						                                                <p>${comment.comment_content }</p>
						                                            </div>
						                                            <div class="col-12 ml-back-15">
						                                            	<c:forEach var="image" items="${comment.getImage() }">
						                                            		<img src="${contextPath}/${image.getUrl() }" class="float-left mr-1 mb-1 with-100 height-70">
						                                            	</c:forEach>
						                                            </div>
						                                        </div>
						                                    </div>
					                                	</c:forEach>
					                                </div>
					                            </div>
					                        </div>
										</c:forEach>
                                    </div>
                                    <div class="tab-pane fade" id="three">
                                        <div class="card card-small">
                                            <div class="share-box-inner">
                                                <div class="profile-thumb">
                                                    <a href="#">
                                                        <figure class="profile-thumb-middle">
                                                            <img src="${current_account.avatar }" alt="profile picture">
                                                        </figure>
                                                    </a>
                                                </div>
                                                <div class="share-content-box w-100">
                                                    <form class="share-text-box">
                                                        <textarea name="share" class="share-text-field" aria-disabled="true" placeholder="Viết gì đó" data-toggle="modal" data-target="#textbox" id="addBtn3"></textarea>
                                                        <button class="btn-share" type="submit">Đăng</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <c:forEach var="post" items="${listPost2 }">
											<div class="card post-num-${post.post_id }">
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
					                                    <h6 class="author"><a href="${contextPath}/profile/${post.getAccount_id() }">${post.getAccount().getName() }</a></h6>
					                                    <span class="post-time">
					                                    	<fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${post.post_date }"/>
					                                    	<c:choose>
					                                    		<c:when test="${post.post_status == true }">
					                                    			<strong class="pl-3">Đang cho thuê</strong>
					                                    		</c:when>
					                                    		<c:otherwise>
					                                    			<strong class="pl-3">Đã cho thuê</strong>
					                                    		</c:otherwise>
					                                    	</c:choose>
					                                    </span>
					                                    <p>
					                                        <i class="icofont icofont-location-pin"></i><span class="text-muted mr-3">${post.getProvince().getProvince_name() }</span>
					                                        <i class="fa fa-money mr-1"></i>
						                                        <span class="text-info">
						                                        	<fmt:formatNumber type="number" maxFractionDigits="3" value="${post.price }"/> vnđ
						                                        </span>
					                                    </p>
					                                </div>
					
					                                <div class="post-settings-bar">
					                                    <span></span>
					                                    <span></span>
					                                    <span></span>
					                                    <div class="post-settings arrow-shape">
					                                        <ul>
					                                        	<li><button class="edit-mypost" data-id="${post.post_id }">Sửa bài viết</button></li>
					                                            <li><button class="remove-mypost" data-id="${post.post_id }" data-cont="${fn:substring(post.post_content, 0, 100) }">
	                                            					Xóa bài viết</button></li>
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
					                                    <button class="post-meta-like" data-postId="${post.post_id }"
					                                    	 data-icon="icon-of${post.post_id }" data-like="like-of${post.post_id }">
				                                        	<c:forEach var="id" items="${listLiked }">
				                                        		<c:if test="${id == post.post_id }">
				                                        			<c:set var = "check" value = "yes"/>
				                                        		</c:if>
				                                        	</c:forEach>
				                                        	<c:choose>
					                                        	<c:when test="${ check == 'yes' }">
					                                        		<i class="fa fa-heart icon-of${post.post_id }" style="color: #41b3d8"></i>
					                                        	</c:when>
					                                        	<c:otherwise>
					                                        		<i class="fa fa-heart icon-of${post.post_id }"></i>
					                                        	</c:otherwise>
					                                        </c:choose>
					                                        <span class="lh-16 like-of${post.post_id }">${post.getLike().size() }</span>
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
					                                <hr class="my-2">
					                                <c:if test="${post.getComment().size() > 2 }">
					                                	<div class="ml-2 mb-2 option-com">
						                                    <p class="text-success more-com">Xem thêm bình luận</p>
						                                    <p class="text-success display-0 hide-com">Ẩn bớt bình luận</p>
						                                </div>
					                                </c:if>
					                                <div class="row mb-back-10">
					                                    <a href="${contextPath}/my-profile" class="col-1 px-2 mr-2">
					                                        <figure class="profile-thumb-small">
					                                            <img src="${contextPath}/${current_account.avatar }" alt="profile picture">
					                                        </figure>
					                                    </a>
					                                    <form action="${contextPath}/add-comment/${post.post_id }" method="post" enctype="multipart/form-data" class="col-11 row">
					                                    	<input name="content" class="col-12 form-control rounded pr-5" placeholder="Nhập bình luận" autocomplete="off"/>
						                                    <i class="fa fa-picture-o f-18 image-input" onclick="document.getElementById('file-com${post.post_id}').click()"></i>
					  										<input id="file-com${post.post_id}" name="file" style="visibility:hidden;" type="file">
					                                    </form>
					                                </div>
					                                <div class="com-area-1">
					                                	<c:forEach var="comment" items="${post.getComment() }" begin="0" end="1">
					                                		<div class="unorder-list mb-2 border-bot-light comment-num-${comment.comment_id }">
						                                        <div class="profile-thumb">
						                                            <a href="${contextPath}/profile/${comment.getAccount_id() }">
						                                                <figure class="profile-thumb-small">
						                                                    <img src="${comment.getAccount().getAvatar() }" alt="profile picture">
						                                                </figure>
						                                            </a>
						                                        </div>
						                                        <div class="unorder-list-info with-500">
						                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="${contextPath}/profile/${comment.getAccount_id() }">
						                                            	${comment.getAccount().getName() }</a></h3>
						                                            <p class="text-muted">
						                                            	<fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${comment.time }"/>
						                                            </p>
						                                            <button class="btn-secondary btn-sm rounded float-right delete-comment" data-id="${comment.comment_id }">Xóa</button>
						                                            <div class="mt-back-5">
						                                                <p>${comment.comment_content }</p>
						                                            </div>
						                                            <div class="col-12 ml-back-15">
						                                            	<c:forEach var="image" items="${comment.getImage() }">
						                                            		<img src="${contextPath}/${image.getUrl() }" class="float-left mr-1 mb-1 with-100 height-70">
						                                            	</c:forEach>
						                                            </div>
						                                        </div>
						                                    </div>
					                                	</c:forEach>
					                                </div>
					                                <div class="display-0 com-area-2">
					                                    <c:forEach var="comment" items="${post.getComment() }" begin="2">
					                                		<div class="unorder-list mb-2 border-bot-light comment-num-${comment.comment_id }">
						                                        <div class="profile-thumb">
						                                            <a href="${contextPath}/profile/${comment.getAccount_id() }">
						                                                <figure class="profile-thumb-small">
						                                                    <img src="${comment.getAccount().getAvatar() }" alt="profile picture">
						                                                </figure>
						                                            </a>
						                                        </div>
						                                        <div class="unorder-list-info with-500">
						                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="${contextPath}/profile/${comment.getAccount_id() }">
						                                            	${comment.getAccount().getName() }</a></h3>
						                                            <p class="text-muted">
						                                            	<fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${comment.time }"/>
						                                            </p>
						                                            <button class="btn-secondary btn-sm rounded float-right delete-comment" data-id="${comment.comment_id }">Xóa</button>
						                                            <div class="mt-back-5">
						                                                <p>${comment.comment_content }</p>
						                                            </div>
						                                            <div class="col-12 ml-back-15">
						                                            	<c:forEach var="image" items="${comment.getImage() }">
						                                            		<img src="${contextPath}/${image.getUrl() }" class="float-left mr-1 mb-1 with-100 height-70">
						                                            	</c:forEach>
						                                            </div>
						                                        </div>
						                                    </div>
					                                	</c:forEach>
					                                </div>
					                            </div>
					                        </div>
										</c:forEach>
                                    </div>
                                    <div class="tab-pane fade" id="four">
                                        <div class="card card-small">
                                            <div class="share-box-inner">
                                                <div class="profile-thumb">
                                                    <a href="#">
                                                        <figure class="profile-thumb-middle">
                                                            <img src="${current_account.avatar }" alt="profile picture">
                                                        </figure>
                                                    </a>
                                                </div>
                                                <div class="share-content-box w-100">
                                                    <form class="share-text-box">
                                                        <textarea name="share" class="share-text-field" aria-disabled="true" placeholder="Viết gì đó" data-toggle="modal" data-target="#textbox" id="addBtn3"></textarea>
                                                        <button class="btn-share" type="submit">Đăng</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <c:forEach var="post" items="${listPost3 }">
											<div class="card post-num-${post.post_id }">
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
					                                    <h6 class="author"><a href="${contextPath}/profile/${post.getAccount_id() }">${post.getAccount().getName() }</a></h6>
					                                    <span class="post-time">
					                                    	<fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${post.post_date }"/>
					                                    	<c:choose>
					                                    		<c:when test="${post.post_status == true }">
					                                    			<strong class="pl-3">Đang tìm người</strong>
					                                    		</c:when>
					                                    		<c:otherwise>
					                                    			<strong class="pl-3">Đã hết hạn</strong>
					                                    		</c:otherwise>
					                                    	</c:choose>
					                                    </span>
					                                    <p>
					                                        <i class="icofont icofont-location-pin"></i><span class="text-muted mr-3">${post.getProvince().getProvince_name() }</span>
					                                        <i class="fa fa-money mr-1"></i>
						                                        <span class="text-info">
						                                        	<fmt:formatNumber type="number" maxFractionDigits="3" value="${post.price }"/> vnđ
						                                        </span>
					                                    </p>
					                                </div>
					
					                                <div class="post-settings-bar">
					                                    <span></span>
					                                    <span></span>
					                                    <span></span>
					                                    <div class="post-settings arrow-shape">
					                                        <ul>
					                                        	<li><button class="edit-mypost" data-id="${post.post_id }">Sửa bài viết</button></li>
					                                            <li><button class="remove-mypost" data-id="${post.post_id }" data-cont="${fn:substring(post.post_content, 0, 100) }">
	                                            					Xóa bài viết</button></li>
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
					                                    <button class="post-meta-like" data-postId="${post.post_id }"
					                                    	 data-icon="icon-of${post.post_id }" data-like="like-of${post.post_id }">
				                                        	<c:forEach var="id" items="${listLiked }">
				                                        		<c:if test="${id == post.post_id }">
				                                        			<c:set var = "check" value = "yes"/>
				                                        		</c:if>
				                                        	</c:forEach>
				                                        	<c:choose>
					                                        	<c:when test="${ check == 'yes' }">
					                                        		<i class="fa fa-heart icon-of${post.post_id }" style="color: #41b3d8"></i>
					                                        	</c:when>
					                                        	<c:otherwise>
					                                        		<i class="fa fa-heart icon-of${post.post_id }"></i>
					                                        	</c:otherwise>
					                                        </c:choose>
					                                        <span class="lh-16 like-of${post.post_id }">${post.getLike().size() }</span>
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
					                                <hr class="my-2">
					                                <c:if test="${post.getComment().size() > 2 }">
					                                	<div class="ml-2 mb-2 option-com">
						                                    <p class="text-success more-com">Xem thêm bình luận</p>
						                                    <p class="text-success display-0 hide-com">Ẩn bớt bình luận</p>
						                                </div>
					                                </c:if>
					                                <div class="row mb-back-10">
					                                    <a href="${contextPath}/my-profile" class="col-1 px-2 mr-2">
					                                        <figure class="profile-thumb-small">
					                                            <img src="${contextPath}/${current_account.avatar }" alt="profile picture">
					                                        </figure>
					                                    </a>
					                                    <form action="${contextPath}/add-comment/${post.post_id }" method="post" enctype="multipart/form-data" class="col-11 row">
					                                    	<input name="content" class="col-12 form-control rounded pr-5" placeholder="Nhập bình luận" autocomplete="off"/>
						                                    <i class="fa fa-picture-o f-18 image-input" onclick="document.getElementById('file-com${post.post_id}').click()"></i>
					  										<input id="file-com${post.post_id}" name="file" style="visibility:hidden;" type="file">
					                                    </form>
					                                </div>
					                                <div class="com-area-1">
					                                	<c:forEach var="comment" items="${post.getComment() }" begin="0" end="1">
					                                		<div class="unorder-list mb-2 border-bot-light comment-num-${comment.comment_id }">
						                                        <div class="profile-thumb">
						                                            <a href="${contextPath}/profile/${comment.getAccount_id() }">
						                                                <figure class="profile-thumb-small">
						                                                    <img src="${comment.getAccount().getAvatar() }" alt="profile picture">
						                                                </figure>
						                                            </a>
						                                        </div>
						                                        <div class="unorder-list-info with-500">
						                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="${contextPath}/profile/${comment.getAccount_id() }">
						                                            	${comment.getAccount().getName() }</a></h3>
						                                            <p class="text-muted">
						                                            	<fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${comment.time }"/>
						                                            </p>
						                                            <button class="btn-secondary btn-sm rounded float-right delete-comment" data-id="${comment.comment_id }">Xóa</button>
						                                            <div class="mt-back-5">
						                                                <p>${comment.comment_content }</p>
						                                            </div>
						                                            <div class="col-12 ml-back-15">
						                                            	<c:forEach var="image" items="${comment.getImage() }">
						                                            		<img src="${contextPath}/${image.getUrl() }" class="float-left mr-1 mb-1 with-100 height-70">
						                                            	</c:forEach>
						                                            </div>
						                                        </div>
						                                    </div>
					                                	</c:forEach>
					                                </div>
					                                <div class="display-0 com-area-2">
					                                    <c:forEach var="comment" items="${post.getComment() }" begin="2">
					                                		<div class="unorder-list mb-2 border-bot-light comment-num-${comment.comment_id }">
						                                        <div class="profile-thumb">
						                                            <a href="${contextPath}/profile/${comment.getAccount_id() }">
						                                                <figure class="profile-thumb-small">
						                                                    <img src="${comment.getAccount().getAvatar() }" alt="profile picture">
						                                                </figure>
						                                            </a>
						                                        </div>
						                                        <div class="unorder-list-info with-500">
						                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="${contextPath}/profile/${comment.getAccount_id() }">
						                                            	${comment.getAccount().getName() }</a></h3>
						                                            <p class="text-muted">
						                                            	<fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${comment.time }"/>
						                                            </p>
						                                            <button class="btn-secondary btn-sm rounded float-right delete-comment" data-id="${comment.comment_id }">Xóa</button>
						                                            <div class="mt-back-5">
						                                                <p>${comment.comment_content }</p>
						                                            </div>
						                                            <div class="col-12 ml-back-15">
						                                            	<c:forEach var="image" items="${comment.getImage() }">
						                                            		<img src="${contextPath}/${image.getUrl() }" class="float-left mr-1 mb-1 with-100 height-70">
						                                            	</c:forEach>
						                                            </div>
						                                        </div>
						                                    </div>
					                                	</c:forEach>
					                                </div>
					                            </div>
					                        </div>
										</c:forEach>
                                    </div>
                                    <div class="tab-pane fade" id="five">
                                        <div class="card card-small">
                                            <div class="share-box-inner">
                                                <div class="profile-thumb">
                                                    <a href="#">
                                                        <figure class="profile-thumb-middle">
                                                            <img src="${current_account.avatar }" alt="profile picture">
                                                        </figure>
                                                    </a>
                                                </div>
                                                <div class="share-content-box w-100">
                                                    <form class="share-text-box">
                                                        <textarea name="share" class="share-text-field" aria-disabled="true" placeholder="Viết gì đó" data-toggle="modal" data-target="#textbox" id="addBtn3"></textarea>
                                                        <button class="btn-share" type="submit">Đăng</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <c:forEach var="post" items="${listPost4 }">
											<div class="card post-num-${post.post_id }">
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
					                                    <h6 class="author"><a href="${contextPath}/profile/${post.getAccount_id() }">${post.getAccount().getName() }</a></h6>
					                                    <span class="post-time">
					                                    	<fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${post.post_date }"/>
					                                    	<c:choose>
					                                    		<c:when test="${post.post_status == true }">
					                                    			<strong class="pl-3">Đang bán</strong>
					                                    		</c:when>
					                                    		<c:otherwise>
					                                    			<strong class="pl-3">Đã bán</strong>
					                                    		</c:otherwise>
					                                    	</c:choose>
					                                    </span>
					                                    <p>
					                                        <i class="icofont icofont-location-pin"></i><span class="text-muted mr-3">${post.getProvince().getProvince_name() }</span>
					                                        <i class="fa fa-money mr-1"></i>
						                                        <span class="text-info">
						                                        	<fmt:formatNumber type="number" maxFractionDigits="3" value="${post.price }"/> vnđ
						                                        </span>
					                                    </p>
					                                </div>
					
					                                <div class="post-settings-bar">
					                                    <span></span>
					                                    <span></span>
					                                    <span></span>
					                                    <div class="post-settings arrow-shape">
					                                        <ul>
					                                        	<li><button class="edit-mypost" data-id="${post.post_id }">Sửa bài viết</button></li>
					                                            <li><button class="remove-mypost" data-id="${post.post_id }" data-cont="${fn:substring(post.post_content, 0, 100) }">
	                                            					Xóa bài viết</button></li>
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
					                                    <button class="post-meta-like" data-postId="${post.post_id }"
					                                    	 data-icon="icon-of${post.post_id }" data-like="like-of${post.post_id }">
				                                        	<c:forEach var="id" items="${listLiked }">
				                                        		<c:if test="${id == post.post_id }">
				                                        			<c:set var = "check" value = "yes"/>
				                                        		</c:if>
				                                        	</c:forEach>
				                                        	<c:choose>
					                                        	<c:when test="${ check == 'yes' }">
					                                        		<i class="fa fa-heart icon-of${post.post_id }" style="color: #41b3d8"></i>
					                                        	</c:when>
					                                        	<c:otherwise>
					                                        		<i class="fa fa-heart icon-of${post.post_id }"></i>
					                                        	</c:otherwise>
					                                        </c:choose>
					                                        <span class="lh-16 like-of${post.post_id }">${post.getLike().size() }</span>
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
					                                <hr class="my-2">
					                                <c:if test="${post.getComment().size() > 2 }">
					                                	<div class="ml-2 mb-2 option-com">
						                                    <p class="text-success more-com">Xem thêm bình luận</p>
						                                    <p class="text-success display-0 hide-com">Ẩn bớt bình luận</p>
						                                </div>
					                                </c:if>
					                                <div class="row mb-back-10">
					                                    <a href="${contextPath}/my-profile" class="col-1 px-2 mr-2">
					                                        <figure class="profile-thumb-small">
					                                            <img src="${contextPath}/${current_account.avatar }" alt="profile picture">
					                                        </figure>
					                                    </a>
					                                    <form action="${contextPath}/add-comment/${post.post_id }" method="post" enctype="multipart/form-data" class="col-11 row">
					                                    	<input name="content" class="col-12 form-control rounded pr-5" placeholder="Nhập bình luận" autocomplete="off"/>
						                                    <i class="fa fa-picture-o f-18 image-input" onclick="document.getElementById('file-com${post.post_id}').click()"></i>
					  										<input id="file-com${post.post_id}" name="file" style="visibility:hidden;" type="file">
					                                    </form>
					                                </div>
					                                <div class="com-area-1">
					                                	<c:forEach var="comment" items="${post.getComment() }" begin="0" end="1">
					                                		<div class="unorder-list mb-2 border-bot-light comment-num-${comment.comment_id }">
						                                        <div class="profile-thumb">
						                                            <a href="${contextPath}/profile/${comment.getAccount_id() }">
						                                                <figure class="profile-thumb-small">
						                                                    <img src="${comment.getAccount().getAvatar() }" alt="profile picture">
						                                                </figure>
						                                            </a>
						                                        </div>
						                                        <div class="unorder-list-info with-500">
						                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="${contextPath}/profile/${comment.getAccount_id() }">
						                                            	${comment.getAccount().getName() }</a></h3>
						                                            <p class="text-muted">
						                                            	<fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${comment.time }"/>
						                                            </p>
						                                            <button class="btn-secondary btn-sm rounded float-right delete-comment" data-id="${comment.comment_id }">Xóa</button>
						                                            <div class="mt-back-5">
						                                                <p>${comment.comment_content }</p>
						                                            </div>
						                                            <div class="col-12 ml-back-15">
						                                            	<c:forEach var="image" items="${comment.getImage() }">
						                                            		<img src="${contextPath}/${image.getUrl() }" class="float-left mr-1 mb-1 with-100 height-70">
						                                            	</c:forEach>
						                                            </div>
						                                        </div>
						                                    </div>
					                                	</c:forEach>
					                                </div>
					                                <div class="display-0 com-area-2">
					                                    <c:forEach var="comment" items="${post.getComment() }" begin="2">
					                                		<div class="unorder-list mb-2 border-bot-light comment-num-${comment.comment_id }">
						                                        <div class="profile-thumb">
						                                            <a href="${contextPath}/profile/${comment.getAccount_id() }">
						                                                <figure class="profile-thumb-small">
						                                                    <img src="${comment.getAccount().getAvatar() }" alt="profile picture">
						                                                </figure>
						                                            </a>
						                                        </div>
						                                        <div class="unorder-list-info with-500">
						                                            <h3 class="list-title mt-1 mr-2 float-left"><a href="${contextPath}/profile/${comment.getAccount_id() }">
						                                            	${comment.getAccount().getName() }</a></h3>
						                                            <p class="text-muted">
						                                            	<fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${comment.time }"/>
						                                            </p>
						                                            <button class="btn-secondary btn-sm rounded float-right delete-comment" data-id="${comment.comment_id }">Xóa</button>
						                                            <div class="mt-back-5">
						                                                <p>${comment.comment_content }</p>
						                                            </div>
						                                            <div class="col-12 ml-back-15">
						                                            	<c:forEach var="image" items="${comment.getImage() }">
						                                            		<img src="${contextPath}/${image.getUrl() }" class="float-left mr-1 mb-1 with-100 height-70">
						                                            	</c:forEach>
						                                            </div>
						                                        </div>
						                                    </div>
					                                	</c:forEach>
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
            </div>

    </main>

    <div class="modal fade" id="choose-type" aria-labelledby="textbox">
        <div class="modal-dialog mt-5 pt-5">
            <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Bạn muốn viết bài về:</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="row ml-3">
                        <div class="col-6 my-3">
                            <button id="type1" class="post-share-btn" data-dismiss="modal">Chia sẻ bài viết</button>
                        </div>
                        <div class="col-6 my-3">
                            <button id="type2" class="post-share-btn" data-dismiss="modal">Cho thuê trọ</button>
                        </div>
                        <div class="col-6 my-3">
                            <button id="type3" class="post-share-btn" data-dismiss="modal">Tìm người ở ghép</button>
                        </div>
                        <div class="col-6 my-3">
                            <button id="type4" class="post-share-btn" data-dismiss="modal">Bán lại đồ dùng</button>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="textbox" aria-labelledby="textbox">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="add-post" method="POST" enctype="multipart/form-data" id="add-post-form">
                    <div class="modal-header">
                        <h5 class="modal-title" id="title-modal">Chia sẻ bài đăng của bạn</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body custom-scroll">
                        <textarea name="content" class="share-field-big custom-scroll" placeholder="Hãy viết gì đó"></textarea>
                    </div>
                    <div class="">
                        <div class="container">
                            <div class="panel my-2">
                                <div class="button_outer">
                                    <div class="btn_upload">
                                        <input type="file" id="upload_file" name="file">
                                        Thêm ảnh
                                    </div>
                                    <div class="processing_bar"></div>
                                    <div class="success_box"></div>
                                </div>
                            </div>
                            <div class="error_msg"></div>
                            <div class="uploaded_file_view my-2" id="uploaded_view">
                                <span class="file_remove">X</span>
                            </div>
                        </div>
                        <div class="col-12" id="option-area">
                            <div class="row ml-1">
                                <div class="col-12 row form-group">
                                    <p class="col-md-4 col-lg-4 col-12 pt-2">Tỉnh/ Thành phố :</p>
                                    <div class="select-small">
                                        <select class="js-example-basic-single col-md-8 col-lg-8 col-12 with-300">
                                            <c:forEach var="province" items="${listProvince }">
                                        		<option value="${province.province_id }">${province.province_name }</option>
                                        	</c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 form-group row">
                                    <div class="col-md-4">
                                        <p id="modal-price">Giá (/tháng) :</p>
                                    </div>
                                    <div class="col-md-8 pl-0">
                                        <input type="number" class="form-control with-300" value="0"> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="post-share-btn" data-dismiss="modal">Hủy</button>
                        <input type="submit" class="post-share-btn border-0" value="Đăng bài">
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="modal-confirm">
        <div class="modal-dialog mt-5 pt-5">
            <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Xác nhận xóa bài đăng</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-content">
                        <p class="my-4 mx-3 f-16" id="delete-content">Xác nhận xóa</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="post-share-btn" data-dismiss="modal">Hủy</button>
                        <button id="deletePost-btn" class="post-share-btn border-0" data-id="0">Xóa</button>
                    </div>
            </div>
        </div>
    </div>
    
    <div class="scroll-top not-visible">
        <i class="bi bi-finger-index"></i>
    </div>
	
	<jsp:include page="/pages/layout/footer.jsp" />
	<script src="${contextPath}/resources/contents/js/changeForm.js"></script>
	
</body>
</html>