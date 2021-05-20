<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>Tìm kiếm</title>
	<jsp:include page="/pages/layout/header.jsp" />
</head>
<body>
	<jsp:include page="/pages/layout/navbar.jsp" />

    <main>
    	
        <div class="main-wrapper pt-80">
            <div class="container">
                <div class="col-12 col-md-11 col-lg-10 row mx-auto">
                    <div class="col-lg-4 col-md-3 col-2">
                        <div class="card widget-item" style="position: sticky; top: 100px;">
                            <div class="about-me">
                                <ul class="nav flex-column about-author-menu">
                                    <li><a href="#one" id="tab1" data-toggle="tab" class="active">Bài viết</a></li>
                                    <li><a href="#two" id="tab2" data-toggle="tab">Tài khoản</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-9 col-10">
                        
                        <div class="">
                            <div class="tab-content">
                                <div class="tab-pane active show" id="one">
                                	<c:if test="${listPostSearch.size() == 0 }">
                                		<div class="card">
                                			<h3>Không tìm thấy bài viết phù hợp</h3>
                                		</div>
                                	</c:if>
                                    <c:forEach var="post" items="${listPostSearch }">
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
                               		<c:if test="${listAccountSeacrh.size() == 0 }">
                                		<div class="card">
                                			<h3>Không tìm thấy tài khoản phù hợp</h3>
                                		</div>
                                	</c:if>
                                    <c:forEach var="account" items="${listAccountSeacrh }">
				                        <div class="card">
				                           <div class="post-title d-flex align-items-center">
				                                <div class="profile-thumb">
				                                    <a href="${contextPath}/profile/${account.getAccount_id() }">
				                                        <figure class="profile-thumb-middle">
				                                            <img src="${account.getAvatar() }" alt="profile picture">
				                                        </figure>
				                                    </a>
				                                </div>
				                                <div class="posted-author">
				                                    <h6 class="author"><a href="${contextPath}/profile/${post.getAccount_id() }">${account.getName() }</a></h6>
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
	
    <div class="scroll-top not-visible">
        <i class="bi bi-finger-index"></i>
    </div>
	
	<jsp:include page="/pages/layout/footer.jsp" />
	<script src="${contextPath}/resources/contents/js/changeForm.js"></script>
	
</body>
</html>