<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<header>
   <div class="header-top sticky bg-white d-none d-lg-block">
       <div class="container">
           <div class="row align-items-center">
               <div class="col-md-8 px-0">
                   <!-- header top navigation start -->
                   <div class="header-top-navigation">
                       <nav>
                           <ul>
	                           <c:choose>
	                           		<c:when test="${listPost != null && listPost.size() > 0}">
	                           			<c:choose>
			                           		<c:when test="${listPost.get(0).getPost_type() == 1}">
			                           			<li class="mr-4 ml-2 active"><a href="${contextPath}/post">Bài viết</a></li>
			                           		</c:when>
			                           		<c:otherwise>
			                           			<li class="mr-4 ml-2"><a href="${contextPath}/post">Bài viết</a></li>
					                        </c:otherwise>
			                           </c:choose>
			                           <c:choose>
			                           		<c:when test="${listPost.get(0).getPost_type() == 2}">
			                           			<li class="mr-4 active"><a href="${contextPath}/emptyroom">Phòng trọ</a></li>
			                           		</c:when>
			                           		<c:otherwise>
			                           			<li class="mr-4"><a href="${contextPath}/emptyroom">Phòng trọ</a></li>
					                        </c:otherwise>
			                           </c:choose>
			                           <c:choose>
			                           		<c:when test="${listPost.get(0).getPost_type() == 3}">
			                           			<li class="mr-4 active"><a href="${contextPath}/shareroom">Ở ghép</a></li>
			                           		</c:when>
			                           		<c:otherwise>
			                           			<li class="mr-4"><a href="${contextPath}/shareroom">Ở ghép</a></li>
					                        </c:otherwise>
			                           </c:choose>
			                           <c:choose>
			                           		<c:when test="${listPost.get(0).getPost_type() == 4}">
			                           			<li class="mr-4 active"><a href="${contextPath}/utensil">Đồ dùng</a></li>
			                           		</c:when>
			                           		<c:otherwise>
			                           			<li class="mr-4"><a href="${contextPath}/utensil">Đồ dùng</a></li>
					                        </c:otherwise>
			                           </c:choose>
	                           		</c:when>
	                           		<c:otherwise>
	                           			<li class="mr-4 ml-2"><a href="${contextPath}/post">Bài viết</a></li>
		                                <li class="mr-4"><a href="${contextPath}/emptyroom">Phòng trọ</a></li>
		                                <li class="mr-4 "><a href="${contextPath}/shareroom">Ở ghép</a></li>
		                                <li class="mr-4 "><a href="${contextPath}/utensil">Đồ dùng</a></li>
			                        </c:otherwise>
	                           </c:choose>
                               <li class="notification-trigger mr-4 float-right">
                                   <a class="msg-trigger-btn" href="#b">
                                       <button class="notification"><i class="flaticon-notification f-22"></i>
                                           <span>${listNotification.size() }</span>
                                       </button>
                                   </a>
                                   <div class="message-dropdown" id="b">
                                       <div class="dropdown-title">
                                           <p class="recent-msg">Thông báo</p>
                                           <button>
                                               <i class="flaticon-settings"></i>
                                           </button>
                                       </div>
                                       <ul class="dropdown-msg-list">
                                       		<c:choose>
                                       			<c:when test="${listNotification.size() < 3 }">
                                       				<c:forEach var="notification" items="${listNotification }" begin="0" end="2">
		                                        		<li class="msg-list-item d-flex justify-content-between">
			                                                 <div class="profile-thumb">
			                                                     <figure class="profile-thumb-middle">
			                                                         <img src="${contextPath}/${notification.getAccount().getAvatar() }" alt="profile picture">
			                                                     </figure>
			                                                 </div>
			                                                 <div class="msg-content notification-content">
			                                                     <a href="view-acc/${notification.getAccount().getAccount_id() }">${notification.getAccount().getName() }</a>
			                                                     <p>${notification.notification_content }</p>
			                                                 </div>
			                                                 <div class="msg-time">
			                                                     <p>${fn:substring(notification.time, 0, 16) }</p>
			                                                 </div>
			                                             </li>
                                        			</c:forEach>
                                       			</c:when>
                                       			<c:otherwise>
                                       				<c:forEach var="notification" items="${listNotification }">
		                                        		<li class="msg-list-item d-flex justify-content-between">
			                                                 <div class="profile-thumb">
			                                                     <figure class="profile-thumb-middle">
			                                                         <img src="${contextPath}/${notification.getAccount().getAvatar() }" alt="profile picture">
			                                                     </figure>
			                                                 </div>
			                                                 <div class="msg-content notification-content">
			                                                     <a href="view-acc/${notification.getAccount().getAccount_id() }">${notification.getAccount().getName() }</a>
			                                                     <p>${notification.notification_content }</p>
			                                                 </div>
			                                                 <div class="msg-time">
			                                                     <p>${fn:substring(notification.time, 0, 16) }</p>
			                                                 </div>
			                                             </li>
                                        			</c:forEach>
                                       			</c:otherwise>
                                       		</c:choose>
                                       </ul>
                                       <div class="msg-dropdown-footer">
                                           <button>Xem toàn bộ</button>
                                           <button>Đánh dấu đã đọc</button>
                                       </div>
                                   </div>
                               </li>
                               <li class="msg-trigger mr-5 float-right">
                                   <a class="msg-trigger-btn" href="#a">
                                       <button class="chat-trigger notification"><i class="flaticon-chats f-22"></i>
                                           <span>${listChat.size() }</span>
                                       </button>
                                   </a>
                                   <div class="message-dropdown" id="a">
                                       <div class="dropdown-title">
                                           <p class="recent-msg">Tin nhắn hiện tại</p>
                                           <div class="message-btn-group">
                                               <button>Gửi tin nhắn mới</button>
                                           </div>
                                       </div>
                                       <ul class="dropdown-msg-list">
                                       		<c:choose>
                                       			<c:when test="${listChat.size() >= 4 }">
                                       				<c:forEach var="message" items="${listChat }" begin="0" end="3">
                                       					<c:if test="${message.getTo_account().getAccount_id() == current_account.account_id}">
		                                       				<li class="msg-list-item d-flex justify-content-between">
			                                                  <div class="profile-thumb">
			                                                      <figure class="profile-thumb-middle">
			                                                          <img src="${contextPath}/${message.getFrom_account().getAvatar() }" alt="profile picture">
			                                                      </figure>
			                                                  </div>
			                                                  <div class="msg-content">
			                                                      <h6 class="author"><a href="profile.html">${message.getFrom_account().getName() }</a></h6>
			                                                      <c:if test="${message.getImage().size() > 0 }"></c:if>
			                                                      <p>${message.message_content }</p>
			                                                  </div>
			                                                  <div class="msg-time">
			                                                      <p>${fn:substring(message.time, 0, 16) }</p>
			                                                  </div>
		                                             	 	</li>
		                                       			</c:if>
		                                            	<c:if test="${message.getTo_account().getAccount_id() != current_account.account_id}">
		                                       				<li class="msg-list-item d-flex justify-content-between">
			                                                  <div class="profile-thumb">
			                                                      <figure class="profile-thumb-middle">
			                                                          <img src="${contextPath}/${message.getTo_account().getAvatar() }" alt="profile picture">
			                                                      </figure>
			                                                  </div>
			                                                  <div class="msg-content">
			                                                      <h6 class="author"><a href="profile.html">${message.getTo_account().getName() }</a></h6>
			                                                      <p><strong>Bạn: </strong>${message.message_content }</p>
			                                                  </div>
			                                                  <div class="msg-time">
			                                                      <p>${fn:substring(message.time, 0, 16) }</p>
			                                                  </div>
			                                              	</li>
		                                       			</c:if>
		                                            </c:forEach>
                                       			</c:when>
                                       			<c:otherwise>
                                       				<c:forEach var="message" items="${listChat }">
		                                       			<c:if test="${message.getTo_account().getAccount_id() == current_account.account_id}">
		                                       				<li class="msg-list-item d-flex justify-content-between">
			                                                  <div class="profile-thumb">
			                                                      <figure class="profile-thumb-middle">
			                                                          <img src="${contextPath}/${message.getFrom_account().getAvatar() }" alt="profile picture">
			                                                      </figure>
			                                                  </div>
			                                                  <div class="msg-content">
			                                                      <h6 class="author"><a href="profile.html">${message.getFrom_account().getName() }</a></h6>
			                                                      <c:if test="${message.getImage().size() > 0 }"></c:if>
			                                                      <p>${message.message_content }</p>
			                                                  </div>
			                                                  <div class="msg-time">
			                                                      <p>${fn:substring(message.time, 0, 16) }</p>
			                                                  </div>
		                                             	 	</li>
		                                       			</c:if>
		                                            	<c:if test="${message.getTo_account().getAccount_id() != current_account.account_id}">
		                                       				<li class="msg-list-item d-flex justify-content-between">
			                                                  <div class="profile-thumb">
			                                                      <figure class="profile-thumb-middle">
			                                                          <img src="${contextPath}/${message.getTo_account().getAvatar() }" alt="profile picture">
			                                                      </figure>
			                                                  </div>
			                                                  <div class="msg-content">
			                                                      <h6 class="author"><a href="profile.html">${message.getTo_account().getName() }</a></h6>
			                                                      <p><strong>Bạn: </strong>${message.message_content }</p>
			                                                  </div>
			                                                  <div class="msg-time">
			                                                      <p>${fn:substring(message.time, 0, 16) }</p>
			                                                  </div>
			                                              	</li>
		                                       			</c:if>
		                                            </c:forEach>
                                       			</c:otherwise>
                                       		</c:choose>
                                       </ul>
                                       <div class="msg-dropdown-footer">
                                           <a href="message" class="py-2"><button>Xem toàn bộ</button></a>
                                           <button>Đánh dấu đã đọc tất cả</button>
                                       </div>
                                   </div>
                               </li>
                               <li class="notification-trigger mr-5 float-right">
                                   <a class="msg-trigger-btn" href="#d">
                                       <button class="notification"><i class="flaticon-users f-22"></i>
                                           <span>${listRequest.size() }</span>
                                       </button>
                                   </a>
                                   <div class="message-dropdown" id="d">
                                       <div class="dropdown-title">
                                           <p class="recent-msg">Yêu cầu kết bạn</p>
                                           <button>
                                               <i class="flaticon-settings"></i>
                                           </button>
                                       </div>
                                       <ul class="dropdown-msg-list">
                                       		<c:choose>
                                       			<c:when test="${listRequest.size() >= 3 }">
                                       				<c:forEach var="request" items="${listRequest }" begin="0" end="2">
		                                            	<li class="msg-list-item d-flex justify-content-between">
			                                                 <div class="frnd-request-member">
			                                                     <figure class="request-thumb">
			                                                         <a href="profile.html">
			                                                             <img src="${contextPath}/${request.getFrom_account().getAvatar() }" alt="proflie author">
			                                                         </a>
			                                                     </figure>
			                                                     <div class="frnd-content">
			                                                         <h6 class="author"><a href="profile.html">${request.getFrom_account().getName() }</a></h6>
			                                                         <p class="author-subtitle">${fn:substring(request.time, 0, 16) }</p>
			                                                         <div class="request-btn-inner">
			                                                             <button class="frnd-btn">Chấp nhận</button>
			                                                             <button class="frnd-btn delete">Xóa</button>
			                                                         </div>
			                                                     </div>
			                                                 </div>
			                                             </li>
		                                            </c:forEach>
                                       			</c:when>
                                       			<c:otherwise>
                                       				<c:forEach var="request" items="${listRequest }">
		                                            	<li class="msg-list-item d-flex justify-content-between option-request0">
			                                                 <div class="frnd-request-member option-request1">
			                                                     <figure class="request-thumb">
			                                                         <a href="profile.html">
			                                                             <img src="${contextPath}/${request.getFrom_account().getAvatar() }" alt="proflie author">
			                                                         </a>
			                                                     </figure>
			                                                     <div class="frnd-content option-request2">
			                                                         <h6 class="author"><a href="profile.html">${request.getFrom_account().getName() }</a></h6>
			                                                         <p class="author-subtitle">${fn:substring(request.time, 0, 16) }</p>
			                                                         <div class="request-btn-inner option-request3">
			                                                             <button class="frnd-btn accept-request" data-id="${request.friend_id }">Chấp nhận</button>
			                                                             <button class="frnd-btn delete deny-request" data-id="${request.friend_id }">Xóa</button>
			                                                         </div>
			                                                     </div>
			                                                 </div>
			                                             </li>
		                                            </c:forEach>
                                       			</c:otherwise>
                                       		</c:choose>
                                       </ul>
                                       <div class="msg-dropdown-footer">
                                           <button>Xem toàn bộ</button>
                                       </div>
                                   </div>
                               </li>
                               
                           </ul>
                       </nav>
                   </div>
                   <!-- header top navigation start -->
               </div>

               <div class="col-md-4 px-0">
                   <div class="header-top-right d-flex align-items-center justify-content-end">
                       <!-- header top search start -->
                       <div class="header-top-search">
                           <form action="search" method="post" class="top-search-box" id="nav-search-form">
                               <input type="text" name="text" placeholder="Tìm kiếm" class="top-search-field" id="nav-search-text" autocomplete="off">
                               <button class="top-search-btn" id="nav-search-btn"><i class="flaticon-search"></i></button>
                           </form>
                       </div>
                       <!-- header top search end -->

                       <!-- profile picture start -->
                       <div class="profile-setting-box">
                           <div class="profile-thumb-small">
                               <a href="javascript:void(0)" class="profile-triger">
                                       <img src="${contextPath}/${current_account.avatar }" alt="profile picture">
                               </a>
                               <div class="profile-dropdown">
                                   <div class="profile-head">
                                       <h5 class="name"><a href="#">${current_account.name }</a></h5>
                                       <a class="mail" href="#">${current_account.email }</a>
                                   </div>
                                   <div class="profile-body">
                                       <ul>
                                           <li><a href="${contextPath}/my-profile"><i class="flaticon-user"></i>Hồ sơ cá nhân</a></li>
                                           <li><a href="${contextPath}/change-pass"><i class="fa fa-lock text-muted"></i>Đổi mật khẩu</a></li>
                                           <li><a href="${contextPath}/logout"><i class="feather icon-log-out"></i>Đăng xuất</a></li>
                                       </ul>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <!-- profile picture end -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<header>
    <div class="mobile-header-wrapper sticky d-block d-lg-none">
        <div class="mobile-header position-relative ">
            <div class="mobile-logo">
                <a href="index.html">
                    <img src="${contextPath}/resources/contents/images/icon-home.png" alt="logo">
                </a>
            </div>
            <div class="mobile-menu w-100">
                <ul>
                    <li>
                        <button class="notification request-trigger"><i class="flaticon-users"></i>
                            <span>${listChat.size() }</span>
                        </button>
                    </li>
                    <li>
                        <button class="chat-trigger notification"><i class="flaticon-chats"></i>
                            <span>${listRequest.size() }</span>
                        </button>
                   </li>
                   <li>
                       <button class="notification"><i class="flaticon-notification"></i>
                           <span>${listNotification.size() }</span>
                       </button>
                   </li>
                   <li>
                       <button class="search-trigger">
                           <i class="search-icon flaticon-search"></i>
                           <i class="close-icon flaticon-cross-out"></i>
                       </button>
                       <div class="mob-search-box">
                           <form class="mob-search-inner">
                               <input type="text" placeholder="Search Here" class="mob-search-field">
                               <button class="mob-search-btn"><i class="flaticon-search"></i></button>
                           </form>
                       </div>
                   </li>
               </ul>
           </div>
           <div class="mobile-header-profile">
               <!-- profile picture end -->
               <div class="profile-thumb profile-setting-box">
                   <a href="javascript:void(0)" class="profile-triger">
                       <figure class="profile-thumb-middle">
                           <img src="${contextPath}/${current_account.avatar }" alt="profile picture">
                       </figure>
                   </a>
                   <div class="profile-dropdown text-left">
                       <div class="profile-head">
                           <h5 class="name"><a href="#">${current_account.name }</a></h5>
                           <a class="mail" href="#">${current_account.email }</a>
                       </div>
                       <div class="profile-body">
                           <ul>
                               <li><a href="${contextPath}/my-profile"><i class="flaticon-user"></i>Hồ sơ</a></li>
                               <li><a href="${contextPath}/logout"><i class="flaticon-unlock"></i>Đăng xuất</a></li>
                           </ul>
                       </div>
                   </div>
               </div>
               <!-- profile picture end -->
            </div>
        </div>
    </div>
</header>