<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>Tài khoản - Bài đăng</title>
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
                                            <li class=""><a href="${contextPath}/profile/${viewAccount.account_id }">Thông tin</a></li>
                                            <li class="ml-4 active"><a href="${contextPath}/account-post/${viewAccount.account_id }">Bài đăng</a></li> 
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
        	<div class="col-7 mx-auto mb-4">
        		<c:forEach var="post" items="${listPostAcc }">
					<div class="card post-num-${post.post_id }">
	                          <!-- post title start -->
	                          <div class="post-title d-flex align-items-center">
	                              <!-- profile picture end -->
	                              <div class="profile-thumb">
	                                  <a href="#">
	                                      <figure class="profile-thumb-middle">
	                                          <img src="${contextPath}/${post.getAccount().getAvatar() }" alt="profile picture">
	                                      </figure>
	                                  </a>
	                              </div>
	                              <!-- profile picture end -->
	
	                              <div class="posted-author">
	                                  <h6 class="author"><a href="profile.html">${post.getAccount().getName() }</a></h6>
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
	                              <div class="row mb-2">
	                                  <a href="#" class="col-1 px-2 mr-2">
	                                      <figure class="profile-thumb-small">
	                                          <img src="${contextPath}/${current_account.avatar }" alt="profile picture">
	                                      </figure>
	                                  </a>
	                                  <input class="col-10 form-control rounded" placeholder="Nhập bình luận"/>
	                              </div>
	                              <div class="com-area-1">
	                              	<c:forEach var="comment" items="${post.getComment() }" begin="0" end="1">
	                              		<div class="unorder-list mb-2 border-bot-light">
	                                       <div class="profile-thumb">
	                                           <a href="#">
	                                               <figure class="profile-thumb-small">
	                                                   <img src="${contextPath}/${comment.getAccount().getAvatar() }" alt="profile picture">
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
	                              <div class="display-0 com-area-2">
	                                  <c:forEach var="comment" items="${post.getComment() }" begin="2">
	                              		<div class="unorder-list mb-2 border-bot-light">
	                                       <div class="profile-thumb">
	                                           <a href="#">
	                                               <figure class="profile-thumb-small">
	                                                   <img src="${contextPath}/${comment.getAccount().getAvatar() }" alt="profile picture">
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
	                          </div>
	                      </div>
				</c:forEach>
        	</div>
    	</div>
    </main>
    
    <div class="scroll-top not-visible">
        <i class="bi bi-finger-index"></i>
    </div>
	
	<jsp:include page="/pages/layout/footer.jsp" />
	
</body>
</html>