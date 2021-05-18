<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>Bài viết</title>
	<jsp:include page="/pages/layout/header.jsp" />
</head>
<body>
    <jsp:include page="/pages/layout/navbar.jsp" />
	<div class="sticky-op bg-white" id="auto-op">
        <div class="container">
            <div class="col-6 row mt-2 mx-auto">
                <div class="col-6 px-0 text-center">
                    <a href="#" class="text-dark f-16">Phù hợp</a>
                </div>
                <div class="col-6 px-0 text-center">
                    <a href="#" class="text-dark f-16">Mới nhất</a>
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
                                    <a href="#">
                                        <figure class="profile-thumb-middle">
                                            <img src="${current_account.avatar }" alt="profile picture">
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
                                            <div class="modal-header">
                                                <h5 class="modal-title">Chia sẻ bài đăng của bạn</h5>
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
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="post-share-btn" data-dismiss="modal">Hủy</button>
                                                <button type="button" class="post-share-btn">Đăng bài</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Modal end -->
                            </div>
                        </div>
                        <!-- share box end -->
						
						<c:forEach var="post" items="${listPost }">
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
	                                            <li><button>Lưu bài viết</button></li>
	                                            <li><button>Theo dõi</button></li>
	                                            <li><button>Báo cáo</button></li>
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
	                                    <button class="post-meta-like" data-postId="${post.post_id }">
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
	                                </div>
	                            </div>
	                        </div>
	                        <!-- post status end -->
						</c:forEach>
						
                        <div class="card">
                            <div class="post-title d-flex align-items-center">
                                <!-- profile picture end -->
                                <div class="profile-thumb">
                                    <a href="#">
                                        <figure class="profile-thumb-middle">
                                            <img src="resources/contents/images/avatar/a14.jpg" alt="profile picture">
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
                                    Trong bối cảnh Covid-19 lan rộng toàn cầu, người dân được khuyến khích ở nhà, 
                                    làm việc online, tránh ra đường khi không thực sự cần thiết. Để thời gian ở 
                                    bên gia đình thêm ý nghĩa...<a href="#">Xem thêm</a>
                                </p>
                                <div class="plyr__video-embed plyr-video">
                                    <iframe src="https://www.youtube.com/embed/odUtqDz4lEk" 
                                    allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
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
                                        <li>
                                            <button class="post-share">
                                                <i class="bi bi-share"></i>
                                                <span>05</span>
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="row mb-2">
                                    <a href="#" class="col-1 px-2 mr-2">
                                        <figure class="profile-thumb-small">
                                            <img src="${current_account.avatar }" alt="profile picture">
                                        </figure>
                                    </a>
                                    <input class="col-10 form-control rounded" />
                                </div>
                                <div class="mt-1 ml-2">
                                    <p class="text-success" id="bl-01">Xem thêm bình luận</p>
                                    <p class="text-success hide-class" id="bl-02">Ẩn bớt bình luận</p>
                                </div>
                                <div class="unorder-list mb-2 border-bot-light">
                                    <div class="profile-thumb">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="resources/contents/images/avatar/a12.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <div class="unorder-list-info with-500">
                                        <h3 class="list-title mt-1 mr-2 float-left"><a href="#">Trần Văn Nam</a></h3>
                                        <p class="text-muted">20 phút trước</p>
                                        <div>
                                            <p>Bài viết rất hay</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="unorder-list mb-2 border-bot-light">
                                    <div class="profile-thumb">
                                        <a href="#">
                                            <figure class="profile-thumb-small">
                                                <img src="resources/contents/images/avatar/a15.jpg" alt="profile picture">
                                            </figure>
                                        </a>
                                    </div>
                                    <div class="unorder-list-info with-500">
                                        <h3 class="list-title mt-1 mr-2 float-left"><a href="#">Lê Trang</a></h3>
                                        <p class="text-muted">1 ngày trước</p>
                                        <div>
                                            <p>Tuyệt</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <jsp:include page="/pages/layout/right-aside.jsp" />
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