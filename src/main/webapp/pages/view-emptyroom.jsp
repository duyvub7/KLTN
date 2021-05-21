<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>Phòng trọ</title>
	<jsp:include page="/pages/layout/header.jsp" />
</head>
<body>
	<jsp:include page="/pages/layout/navbar.jsp" />
	<div class="sticky-op bg-white" id="auto-op">
        <div class="container">
            <div class="col-10 row mt-2 mx-auto">
                <div class="col-3 px-0 text-center">
                    <a href="emptyroom-hot" class="text-dark f-16">Phù hợp</a>
                </div>
                <div class="col-3 px-0 text-center">
                    <a href="emptyroom" class="text-dark f-16">Mới nhất</a>
                </div>
                <div class="col-3 px-0 text-center">
                    <select class="form-control form-control-sm py-0 select-ssm with-150" onChange="window.location.href='${contextPath}/emptyroom'+this.value">
                    	<option value="">Giá phòng</option>
                    	<option value="-asc">Giá tăng dần </option>
                    	<option value="-desc">Giá giảm dần </option>
                    </select>
                </div>
                <div class="col-3 pl-5">
                    <select class="form-control form-control-sm py-0 select-ssm with-150" onChange="window.location.href='${contextPath}/emptyroom/'+this.value">
                        <c:forEach var="province" items="${listProvince }">
                      		<option value="${province.province_id }">${province.province_name }</option>
                      	</c:forEach>
                    </select>
                </div>
            </div>
        </div>
    </div>
    
    <main>
        <div class="main-wrapper pt-80">
            <div class="container mt-4">
                <div class="row">
                    <jsp:include page="/pages/layout/left-aside.jsp" />

                    <div class="col-lg-6 order-1 order-lg-2">
                        <!-- share box start -->
                        <div class="card card-small">
                            <div class="share-box-inner">
                                <!-- profile picture end -->
                                <div class="profile-thumb">
                                    <a href="${contextPath}/my-profile">
                                        <figure class="profile-thumb-middle">
                                            <img src="${contextPath}/${current_account.avatar }" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->

                                <!-- share content box start -->
                                <div class="share-content-box w-100">
                                    <form class="share-text-box">
                                        <textarea name="share" class="share-text-field" aria-disabled="true" placeholder="Viết gì đó" data-toggle="modal" data-target="#textbox" id="email"></textarea>
                                        <button class="btn-share" type="submit">Đăng</button>
                                    </form>
                                </div>
                                <!-- share content box end -->

                                <!-- Modal start -->
                                <div class="modal fade" id="textbox" aria-labelledby="textbox">
                                    <div class="modal-dialog">
            							<div class="modal-content">
           								<form action="add-emptyroom" method="POST" enctype="multipart/form-data">
           									<div class="modal-header">
                                                <h5 class="modal-title">Chia sẻ phòng trọ muốn cho thuê</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body custom-scroll col-12">
                                                <textarea name="content" class="share-field-big custom-scroll" placeholder="Hãy viết gì đó"></textarea>
                                            </div>
                                            <div class="col-12">
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
						                                        <select class="js-example-basic-single col-md-8 col-lg-8 col-12 with-300" name="province">
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
						                                        <input type="number" name="price" class="form-control with-300" value="0"> 
						                                    </div>
						                                </div>
						                            </div>
						                        </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="post-share-btn" data-dismiss="modal">Hủy</button>
                                                <input type="submit" class="post-share-btn border-0" value="Đăng bài"/>
                                            </div>
           								</form>
                                        </div>
                                    </div>
                                </div>
                                <!-- Modal end -->
                            </div>
                        </div>
                        <!-- share box end -->
						
						<c:forEach var="post" items="${listPost }">
							<div class="card post-num-${post.post_id }">
	                            <!-- post title start -->
	                            <div class="post-title d-flex align-items-center">
	                                <!-- profile picture end -->
	                                <div class="profile-thumb">
	                                    <a href="${contextPath}/profile/${post.getAccount_id() }">
	                                        <figure class="profile-thumb-middle">
	                                            <img src="${contextPath}/${post.getAccount().getAvatar() }" alt="profile picture">
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
	                                        	<c:choose>
		                                        	<c:when test="${ post.getAccount().getAccount_id() == current_account.account_id }">
		                                        		<li>
		                                        			<a href="${contextPath}/edit-post/${post.post_id }">
		                                        				<button class="edit-mypost" data-id="${post.post_id }">Sửa bài viết</button>
		                                        			</a>
		                                        		</li>
	                                            		<li><button class="remove-mypost" data-id="${post.post_id }" data-cont="${fn:substring(post.post_content, 0, 100) }">
	                                            			Xóa bài viết</button></li>
		                                        	</c:when>
		                                        	<c:otherwise>
		                                        		<c:set var = "check" value = "no"/>
			                                        	<c:forEach var="id" items="${listSaved }">
			                                        		<c:if test="${id == post.post_id }">
			                                        			<c:set var = "check" value = "yes"/>
			                                        		</c:if>
			                                        	</c:forEach>
			                                        	<c:choose>
				                                        	<c:when test="${ check == 'yes' }">
				                                        		<li class="save2"><button class="unsave-post" data-id="${post.post_id }">Bỏ lưu bài viết</button></li>
			                                            		<li class="save1 display-0"><button class="save-post" data-id="${post.post_id }">Lưu bài viết</button></li>
				                                        	</c:when>
				                                        	<c:otherwise>
				                                        		<li class="save1"><button class="save-post" data-id="${post.post_id }">Lưu bài viết</button></li>
			                                            		<li class="save2 display-0"><button class="unsave-post" data-id="${post.post_id }">Bỏ lưu bài viết</button></li>
				                                        	</c:otherwise>
				                                        </c:choose>
				                                        
				                                        <c:forEach var="id" items="${listFollowed }">
			                                        		<c:if test="${id == post.getAccount().getAccount_id() }">
			                                        			<c:set var = "check" value = "yes"/>
			                                        		</c:if>
			                                        	</c:forEach>
			                                        	<c:choose>
				                                        	<c:when test="${ check == 'yes' }">
				                                        		<li class="follow2"><button class="unfollow-account" data-id="${post.getAccount().getAccount_id() }"> Bỏ theo dõi</button></li>
			                                            		<li class="follow1 display-0"><button class="follow-account" data-id="${post.getAccount().getAccount_id() }">Theo dõi</button></li>
				                                        	</c:when>
				                                        	<c:otherwise>
				                                        		<li class="follow1"><button class="follow-account" data-id="${post.getAccount().getAccount_id() }">Theo dõi</button></li>
			                                            		<li class="follow2 display-0"><button class="unfollow-account" data-id="${post.getAccount().getAccount_id() }">Bỏ theo dõi</button></li>
				                                        	</c:otherwise>
				                                        </c:choose>
				                                        
			                                            <c:forEach var="id" items="${listFollowed }">
			                                        		<c:if test="${id == post.getAccount().getAccount_id() }">
			                                        			<c:set var = "check" value = "yes"/>
			                                        		</c:if>
			                                        	</c:forEach>
			                                        	<c:forEach var="id" items="${listSendRequest }">
			                                        		<c:if test="${id == post.getAccount().getAccount_id() }">
			                                        			<c:set var = "check" value = "send"/>
			                                        		</c:if>
			                                        	</c:forEach>
			                                        	<c:forEach var="id" items="${listReceiveRequest }">
			                                        		<c:if test="${id == post.getAccount().getAccount_id() }">
			                                        			<c:set var = "check" value = "receive"/>
			                                        		</c:if>
			                                        	</c:forEach>
			                                        	<c:choose>
				                                        	<c:when test="${ check == 'yes' }">
				                                        		<li class="request1"><button class="remove-friend" data-id="${post.getAccount().getAccount_id() }">Hủy kết bạn</button></li>
			                                            		<li class="request2 display-0"><button class="add-friend" data-id="${post.getAccount().getAccount_id() }">Kết bạn</button></li>
			                                            		<li class="request3 display-0"><button class="accept-request-op" data-id="${post.getAccount().getAccount_id() }">Chấp nhận y/c kết bạn</button></li>
			                                            		<li class="request4 display-0"><button class="deny-request-op" data-id="${post.getAccount().getAccount_id() }">Từ chối y/c kết bạn</button></li>
			                                            		<li class="request5 display-0"><button class="remove-request" data-id="${post.getAccount().getAccount_id() }">Hủy y/c kết bạn</button></li>
				                                        	</c:when>
				                                        	<c:when test="${ check == 'send' }">
				                                        		<li class="request1 display-0"><button class="remove-friend" data-id="${post.getAccount().getAccount_id() }">Hủy kết bạn</button></li>
			                                            		<li class="request2 display-0"><button class="add-friend" data-id="${post.getAccount().getAccount_id() }">Kết bạn</button></li>
			                                            		<li class="request3 display-0"><button class="accept-request-op" data-id="${post.getAccount().getAccount_id() }">Chấp nhận y/c kết bạn</button></li>
			                                            		<li class="request4 display-0"><button class="deny-request-op" data-id="${post.getAccount().getAccount_id() }">Từ chối y/c kết bạn</button></li>
			                                            		<li class="request5"><button class="remove-request" data-id="${post.getAccount().getAccount_id() }">Hủy y/c kết bạn</button></li>
				                                        	</c:when>
				                                        	<c:when test="${ check == 'receive' }">
				                                        		<li class="request1 display-0"><button class="remove-friend" data-id="${post.getAccount().getAccount_id() }">Hủy kết bạn</button></li>
			                                            		<li class="request2 display-0"><button class="add-friend" data-id="${post.getAccount().getAccount_id() }">Kết bạn</button></li>
			                                            		<li class="request3"><button class="accept-request-op" data-id="${post.getAccount().getAccount_id() }">Chấp nhận y/c kết bạn</button></li>
			                                            		<li class="request4"><button class="deny-request-op" data-id="${post.getAccount().getAccount_id() }">Từ chối y/c kết bạn</button></li>
			                                            		<li class="request5 display-0"><button class="remove-request" data-id="${post.getAccount().getAccount_id() }">Hủy y/c kết bạn</button></li>
				                                        	</c:when>
				                                        	<c:otherwise>
				                                        		<li class="request1 display-0"><button class="remove-friend" data-id="${post.getAccount().getAccount_id() }">Hủy kết bạn</button></li>
			                                            		<li class="request2"><button class="add-friend" data-id="${post.getAccount().getAccount_id() }">Kết bạn</button></li>
			                                            		<li class="request3 display-0"><button class="accept-request-op" data-id="${post.getAccount().getAccount_id() }">Chấp nhận y/c kết bạn</button></li>
			                                            		<li class="request4 display-0"><button class="deny-request-op" data-id="${post.getAccount().getAccount_id() }">Từ chối y/c kết bạn</button></li>
			                                            		<li class="request5 display-0"><button class="remove-request" data-id="${post.getAccount().getAccount_id() }">Hủy y/c kết bạn</button></li>
				                                        	</c:otherwise>
				                                        </c:choose>
			                                            <li><button class="report-post" data-id="${post.post_id }">Báo cáo</button></li>
		                                        	</c:otherwise>
		                                        </c:choose>
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
		                                        <a href="${post.getImage().get(0).getUrl() }">
		                                            <img src="${contextPath}/${post.getImage().get(0).getUrl() }" alt="post image">
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
		                                            <c:if test="${comment.getAccount_id() == current_account.account_id || post.account_id == current_account.account_id }">
		                                            	<button class="btn-secondary btn-sm rounded float-right delete-comment" data-id="${comment.comment_id }">Xóa</button>
		                                            </c:if>
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
		                                            <c:if test="${comment.getAccount_id() == current_account.account_id || post.account_id == current_account.account_id }">
		                                            	<button class="btn-secondary btn-sm rounded float-right delete-comment" data-id="${comment.comment_id }">Xóa</button>
		                                            </c:if>
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

                        <!-- post status start -->
                        <div class="card">
                            <div class="post-title d-flex align-items-center">
                                <div class="profile-thumb">
                                    <a href="#">
                                        <figure class="profile-thumb-middle">
                                            <img src="${contextPath}/resources/contents/images/avatar/a13.jpg" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <div class="posted-author">
                                    <h6 class="author"><a href="profile.html">Nguyễn Thị Linh</a></h6>
                                    <span class="post-time mb-1">3 ngày trước</span>
                                    <p>
                                        <i class="icofont icofont-location-pin"></i>
                                        <span class="text-muted mr-3">Hà Nội</span>
                                        <i class="fa fa-money mr-1"></i>
	                                        <span class="text-info">
	                                        	2.200.000 vnđ
	                                        </span>
                                    </p>
                                </div>
                                <div class="post-settings-bar">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    <div class="post-settings arrow-shape">
                                        <ul>
                                            <li><button>Lưu bài viết</button></li>
                                            <li><button>Theo dõi</button></li>
                                            <li><button>Báo cáo</button></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="post-content">
                                <p class="post-desc">
                                    Many desktop publishing packages and web page editors now use Lorem Ipsum as their
                                    default model text, and a search for 'lorem ipsum' will uncover many web sites still
                                    in their infancy.
                                </p>
                                <div class="post-thumb-gallery img-gallery">
                                    <div class="row no-gutters">
                                        <div class="col-8">
                                            <figure class="post-thumb">
                                                <a class="gallery-selector" href="resources/contents/images/post/38.jpg">
                                                    <img src="${contextPath}/resources/contents/images/post/38.jpg" alt="post image">
                                                </a>
                                            </figure>
                                        </div>
                                        <div class="col-4">
                                            <div class="row">
                                                <div class="col-12">
                                                    <figure class="post-thumb">
                                                        <a class="gallery-selector" href="resources/contents/images/post/28.jpg">
                                                            <img src="${contextPath}/resources/contents/images/post/28.jpg" alt="post image">
                                                        </a>
                                                    </figure>
                                                </div>
                                                <div class="col-12">
                                                    <figure class="post-thumb">
                                                        <a class="gallery-selector" href="resources/contents/images/post/29.jpg">
                                                            <img src="${contextPath}/resources/contents/images/post/29.jpg" alt="post image">
                                                        </a>
                                                    </figure>
                                                </div>
                                                <div class="col-12">
                                                    <figure class="post-thumb">
                                                        <a class="gallery-selector" href="resources/contents/images/post/30.jpg">
                                                            <img src="${contextPath}/resources/contents/images/post/30.jpg" alt="post image">
                                                        </a>
                                                    </figure>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="post-meta">
                                    <button class="post-meta-like">
                                        <i class="bi bi-heart-beat"></i>
                                        <span>70</span>
                                        <strong>70</strong>
                                    </button>
                                    <ul class="comment-share-meta">
                                        <li>
                                            <button class="post-comment">
                                                <i class="bi bi-chat-bubble"></i>
                                                <span>0</span>
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                                <hr class="my-2">
                                <div class="row mb-2">
                                    <a href="#" class="col-1 px-2 mr-2">
                                        <figure class="profile-thumb-small">
                                            <img src="${contextPath}/${current_account.avatar }" alt="profile picture">
                                        </figure>
                                    </a>
                                    <input class="col-10 form-control rounded" placeholder="Nhập bình luận"/>
                                </div>
                            </div>
                        </div>
                        <!-- post status end -->
                        
                        <!-- post status start -->
                        <div class="card">
                            <div class="post-title d-flex align-items-center">
                                <!-- profile picture end -->
                                <div class="profile-thumb">
                                    <a href="#">
                                        <figure class="profile-thumb-middle">
                                            <img src="${contextPath}/resources/contents/images/avatar/a14.jpg" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <div class="posted-author">
                                    <h6 class="author"><a href="profile.html">Trần Văn Quý</a></h6>
                                    <span class="post-time mb-1">48 phút trước</span>
                                    <p>
                                        <i class="icofont icofont-location-pin"></i>
                                        <span class="text-muted mr-3">Hà Nội</span>
                                        <i class="fa fa-money mr-1"></i>
	                                        <span class="text-info">
	                                        	1.700.000 vnđ
	                                        </span>
                                    </p>
                                </div>
                                <div class="post-settings-bar">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    <div class="post-settings arrow-shape">
                                        <ul>
                                            <li><button>Lưu bài viết</button></li>
                                            <li><button>Theo dõi</button></li>
                                            <li><button>Báo cáo</button></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="post-content">
                                <p class="post-desc">
                                    Many desktop publishing packages and web page editors now use Lorem Ipsum as their
                                    default model text, and a search for 'lorem ipsum' will uncover many web sites still
                                    in their infancy.
                                </p>
                                <div class="plyr__video-embed plyr-video">
                                    <iframe src="https://www.youtube.com/embed/odUtqDz4lEk" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                </div>
                                <div class="post-meta">
                                    <button class="post-meta-like">
                                        <i class="bi bi-heart-beat"></i>
                                        <span>26</span>
                                        <strong>26</strong>
                                    </button>
                                    <ul class="comment-share-meta">
                                        <li>
                                            <button class="post-comment">
                                                <i class="bi bi-chat-bubble"></i>
                                                <span>42</span>
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                                <hr class="my-2">
                                <div class="row mb-2">
                                    <a href="#" class="col-1 px-2 mr-2">
                                        <figure class="profile-thumb-small">
                                            <img src="${contextPath}/${current_account.avatar }" alt="profile picture">
                                        </figure>
                                    </a>
                                    <input class="col-10 form-control rounded" placeholder="Nhập bình luận"/>
                                </div>
                            </div>
                        </div>
                        <!-- post status end -->

                        <!-- post status start -->
                        <div class="card">
                            <!-- post title start -->
                            <div class="post-title d-flex align-items-center">
                                <!-- profile picture end -->
                                <div class="profile-thumb">
                                    <a href="#">
                                        <figure class="profile-thumb-middle">
                                            <img src="${contextPath}/resources/contents/images/avatar/a15.jpg" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->

                                <div class="posted-author">
                                    <h6 class="author"><a href="profile.html">Lê Văn Tuấn</a></h6>
                                    <span class="post-time mb-1">5 giờ trước</span>
                                    <p>
                                        <i class="icofont icofont-location-pin"></i>
                                        <span class="text-muted mr-3">Quảng Ninh</span>
                                        <i class="fa fa-money mr-1"></i>
	                                        <span class="text-info">
	                                        	1.500.000 vnđ
	                                        </span>
                                    </p>
                                </div>
                                <div class="post-settings-bar">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    <div class="post-settings arrow-shape">
                                        <ul>
                                            <li><button>Lưu bài viết</button></li>
                                            <li><button>Theo dõi</button></li>
                                            <li><button>Báo cáo</button></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- post title start -->
                            <div class="post-content">
                                <p class="post-desc">
                                    Many desktop publishing packages and web page editors now use Lorem Ipsum as their
                                    default model text, and a search for 'lorem ipsum' will uncover many web sites still
                                    in their infancy.
                                </p>
                                <div class="post-thumb-gallery img-gallery">
                                    <div class="row no-gutters">
                                        <div class="col-6">
                                            <figure class="post-thumb">
                                                <a class="gallery-selector" href="assets/images/post/post-large-6.jpg">
                                                    <img src="${contextPath}/resources/contents/images/post/10.jpg" alt="post image">
                                                </a>
                                            </figure>
                                        </div>
                                        <div class="col-6">
                                            <figure class="post-thumb">
                                                <a class="gallery-selector" href="assets/images/post/post-large-7.jpg">
                                                    <img src="${contextPath}/resources/contents/images/post/11.jpg" alt="post image">
                                                </a>
                                            </figure>
                                        </div>
                                    </div>
                                </div>
                                <div class="post-meta">
                                    <button class="post-meta-like">
                                        <i class="bi bi-heart-beat"></i>
                                        <span>30</span>
                                        <strong>30</strong>
                                    </button>
                                    <ul class="comment-share-meta">
                                        <li>
                                            <button class="post-comment">
                                                <i class="bi bi-chat-bubble"></i>
                                                <span>65</span>
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                                <hr class="my-2">
                                <div class="row mb-2">
                                    <a href="#" class="col-1 px-2 mr-2">
                                        <figure class="profile-thumb-small">
                                            <img src="${contextPath}/${current_account.avatar }" alt="profile picture">
                                        </figure>
                                    </a>
                                    <input class="col-10 form-control rounded" placeholder="Nhập bình luận"/>
                                </div>
                            </div>
                        </div>
                        <!-- post status end -->
                    </div>
					
                    <jsp:include page="/pages/layout/right-aside.jsp" />
                </div>
            </div>
        </div>
    </main>
	
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
   
</body>
</html>