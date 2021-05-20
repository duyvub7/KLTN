<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>Bạn bè</title>
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
                                            <li><a href="my-post">Bài đăng</a></li> 
                                            <li><a href="save-post">Bài đã lưu</a></li> 
                                            <li class="active"><a href="friend">Bạn bè</a></li> 
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
            <div class="container">
                <div class="col-lg-10 col-11 mx-auto">
                    <div class="about-description mb-4">
                        <div class="tab-content">
                            <div class="author-desc-title d-flex">
                                <h6 class="author mx-auto">Danh sách bạn bè ( ${listFriend.size() } )</h6>
                            </div>
                            <div class="row mt-5">
                            	<c:forEach var="friend" items="${listFriend }">
                            		<div class="col-12 col-md-6 col-lg-6 mt-3 mb-5">
                            			<c:choose>  
										    <c:when test="${friend.getTo_account().getAccount_id() == current_account.account_id}">  
										       <div class="unorder-list">
			                                        <div class="profile-thumb">
			                                            <a href="#">
			                                                <figure class="profile-thumb-middle">
			                                                    <img src="${friend.getFrom_account().getAvatar() }" alt="profile picture">
			                                                </figure>
			                                            </a>
			                                        </div>
			                                        <div class="unorder-list-info">
														<h3 class="list-title f-16"><a href="#">${friend.getFrom_account().getName() }</a></h3>
			                                            <button data-id="${friend.friend_id }" class="remove-btn mt-1" id="remove-btn">Xóa bạn bè</button>
			                                        </div>
			                                    </div>
										    </c:when>
										    <c:otherwise>
										    	<div class="unorder-list">
			                                        <div class="profile-thumb">
			                                            <a href="#">
			                                                <figure class="profile-thumb-middle">
			                                                    <img src="${friend.getTo_account().getAvatar() }" alt="profile picture">
			                                                </figure>
			                                            </a>
			                                        </div>
			                                        <div class="unorder-list-info">
														<h3 class="list-title f-16"><a href="#">${friend.getTo_account().getName() }</a></h3>
			                                            <button data-id="${friend.friend_id }" class="remove-btn mt-1" id="remove-btn">Xóa bạn bè</button>
			                                        </div>
			                                    </div>  
										    </c:otherwise>  
										</c:choose>
	                                </div>
                            	</c:forEach>
                            </div>
                        </div>
                   </div>
              </div>
         </div>

    </main>
    
    <div class="modal fade" id="confirmModal">
        <div class="modal-dialog w-25 mx-auto mt-5 pt-5">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Xác nhận xóa người bạn này?</h5>
                </div>
                <div class="text-center my-3">
                    <p class="f-16">Nguyễn Trần Diệu Linh</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="post-share-btn" data-dismiss="modal">Hủy</button>
                    <a id="remove-friend-btn"><button class="btn post-share-btn">Xóa</button></a>
                </div>
            </div>
        </div>
    </div>
	
    <div class="scroll-top not-visible">
        <i class="bi bi-finger-index"></i>
    </div>
	
	<jsp:include page="/pages/layout/footer.jsp" />
	
	<script>
        $(document).ready(function () {
            $('.remove-btn').click( function () {
                const id = $(this).attr('data-id')
                $('#confirmModal').modal();
                $('#remove-friend-btn').attr('href', 'delete-friend/'+id);
            });
        });
    </script>
	
</body>
</html>