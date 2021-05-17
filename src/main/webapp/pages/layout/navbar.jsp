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
			                           			<li class="mr-4 ml-2 active"><a href="post">Bài viết</a></li>
			                           		</c:when>
			                           		<c:otherwise>
			                           			<li class="mr-4 ml-2"><a href="post">Bài viết</a></li>
					                        </c:otherwise>
			                           </c:choose>
			                           <c:choose>
			                           		<c:when test="${listPost.get(0).getPost_type() == 2}">
			                           			<li class="mr-4 active"><a href="emptyroom">Phòng trọ</a></li>
			                           		</c:when>
			                           		<c:otherwise>
			                           			<li class="mr-4"><a href="emptyroom">Phòng trọ</a></li>
					                        </c:otherwise>
			                           </c:choose>
			                           <c:choose>
			                           		<c:when test="${listPost.get(0).getPost_type() == 3}">
			                           			<li class="mr-4 active"><a href="shareroom">Ở ghép</a></li>
			                           		</c:when>
			                           		<c:otherwise>
			                           			<li class="mr-4"><a href="shareroom">Ở ghép</a></li>
					                        </c:otherwise>
			                           </c:choose>
			                           <c:choose>
			                           		<c:when test="${listPost.get(0).getPost_type() == 4}">
			                           			<li class="mr-4 active"><a href="utensil">Đồ dùng</a></li>
			                           		</c:when>
			                           		<c:otherwise>
			                           			<li class="mr-4"><a href="utensil">Đồ dùng</a></li>
					                        </c:otherwise>
			                           </c:choose>
	                           		</c:when>
	                           		<c:otherwise>
	                           			<li class="mr-4 ml-2"><a href="post">Bài viết</a></li>
		                                <li class="mr-4"><a href="emptyroom">Phòng trọ</a></li>
		                                <li class="mr-4 "><a href="shareroom">Ở ghép</a></li>
		                                <li class="mr-4 "><a href="utensil">Đồ dùng</a></li>
			                        </c:otherwise>
	                           </c:choose>
                               <li class="notification-trigger mr-4 float-right">
                                   <a class="msg-trigger-btn" href="#b">
                                       <button class="notification"><i class="flaticon-notification f-22"></i>
                                           <span>03</span>
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
                                       	<c:if test="${listNotification.size() < 5 }">
                                       		<c:forEach var="notification" items="${listNotification }">
                                        		<li class="msg-list-item d-flex justify-content-between">
                                                 <div class="profile-thumb">
                                                     <figure class="profile-thumb-middle">
                                                         <img src="${notification.getAccount().getAvatar() }" alt="profile picture">
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
                                       	</c:if>
                                       	<c:if test="${listNotification.size() >= 5 }">
                                       		<c:forEach var="notification" items="${listNotification }" begin="0" end="4">
                                        		<li class="msg-list-item d-flex justify-content-between">
                                                 <div class="profile-thumb">
                                                     <figure class="profile-thumb-middle">
                                                         <img src="${notification.getAccount().getAvatar() }" alt="profile picture">
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
                                       	</c:if>
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
                                           <span>04</span>
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
                                       	<c:if test="${listRequest.size() >= 5 }">
                                       		<c:forEach var="request" items="${listRequest }" begin="0" end="4">
                                            	<li class="msg-list-item d-flex justify-content-between">
                                                 <div class="frnd-request-member">
                                                     <figure class="request-thumb">
                                                         <a href="profile.html">
                                                             <img src="${request.getFrom_account().getAvatar() }" alt="proflie author">
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
                                       	</c:if>
                                       	<c:if test="${listRequest.size() < 5 }">
                                       		<c:forEach var="message" items="${listChat }">
                                       			<c:if test="${message.getTo_account().getAccount_id() == current_account.account_id}">
                                       				<li class="msg-list-item d-flex justify-content-between">
                                                  <div class="profile-thumb">
                                                      <figure class="profile-thumb-middle">
                                                          <img src="${message.getFrom_account().getAvatar() }" alt="profile picture">
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
                                                          <img src="${message.getTo_account().getAvatar() }" alt="profile picture">
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
                                       	</c:if>
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
                                       	<c:if test="${listRequest.size() >= 5 }">
                                       		<c:forEach var="request" items="${listRequest }" begin="0" end="4">
                                            	<li class="msg-list-item d-flex justify-content-between">
                                                 <div class="frnd-request-member">
                                                     <figure class="request-thumb">
                                                         <a href="profile.html">
                                                             <img src="${request.getFrom_account().getAvatar() }" alt="proflie author">
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
                                       	</c:if>
                                       	<c:if test="${listRequest.size() < 5 }">
                                       		<c:forEach var="request" items="${listRequest }">
                                            	<li class="msg-list-item d-flex justify-content-between">
                                                 <div class="frnd-request-member">
                                                     <figure class="request-thumb">
                                                         <a href="profile.html">
                                                             <img src="${request.getFrom_account().getAvatar() }" alt="proflie author">
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
                                       	</c:if>
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
                           <form class="top-search-box">
                               <input type="text" placeholder="Tìm kiếm" class="top-search-field">
                               <button class="top-search-btn"><i class="flaticon-search"></i></button>
                           </form>
                       </div>
                       <!-- header top search end -->

                       <!-- profile picture start -->
                       <div class="profile-setting-box">
                           <div class="profile-thumb-small">
                               <a href="javascript:void(0)" class="profile-triger">
                                       <img src="${current_account.avatar }" alt="profile picture">
                               </a>
                               <div class="profile-dropdown">
                                   <div class="profile-head">
                                       <h5 class="name"><a href="#">${current_account.name }</a></h5>
                                       <a class="mail" href="#">${current_account.email }</a>
                                   </div>
                                   <div class="profile-body">
                                       <ul>
                                           <li><a href="my-profile"><i class="flaticon-user"></i>Hồ sơ cá nhân</a></li>
                                           <li><a href="logout"><i class="feather icon-log-out"></i>Đăng xuất</a></li>
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
                    <img src="resources/contents/images/icon-home.png" alt="logo">
                </a>
            </div>
            <div class="mobile-menu w-100">
                <ul>
                    <li>
                        <button class="notification request-trigger"><i class="flaticon-users"></i>
                            <span>03</span>
                        </button>
                        <ul class="frnd-request-list">
                            <li>
                                <div class="frnd-request-member">
                                    <figure class="request-thumb">
                                        <a href="profile.html">
                                            <img src="assets/images/profile/avatar-1.jpg" alt="proflie author">
                                        </a>
                                    </figure>
                                    <div class="frnd-content">
                                        <h6 class="author"><a href="profile.html">merry watson</a></h6>
                                        <p class="author-subtitle">Works at HasTech</p>
                                        <div class="request-btn-inner">
                                            <button class="frnd-btn">confirm</button>
                                            <button class="frnd-btn delete">delete</button>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="frnd-request-member">
                                    <figure class="request-thumb">
                                        <a href="profile.html">
                                            <img src="assets/images/profile/profile-midle-2.jpg" alt="proflie author">
                                        </a>
                                    </figure>
                                    <div class="frnd-content">
                                        <h6 class="author"><a href="profile.html">merry watson</a></h6>
                                        <p class="author-subtitle">Works at HasTech</p>
                                        <div class="request-btn-inner">
                                            <button class="frnd-btn">confirm</button>
                                            <button class="frnd-btn delete">delete</button>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="frnd-request-member">
                                    <figure class="request-thumb">
                                        <a href="profile.html">
                                            <img src="assets/images/profile/profile-midle-3.jpg" alt="proflie author">
                                        </a>
                                    </figure>
                                    <div class="frnd-content">
                                        <h6 class="author"><a href="profile.html">merry watson</a></h6>
                                        <p class="author-subtitle">Works at HasTech</p>
                                        <div class="request-btn-inner">
                                            <button class="frnd-btn">confirm</button>
                                            <button class="frnd-btn delete">delete</button>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <button class="chat-trigger notification"><i class="flaticon-chats"></i>
                            <span>04</span>
                        </button>
                        <div class="mobile-chat-box">
                            <div class="live-chat-title">
                                <!-- profile picture end -->
                               <div class="profile-thumb">
                                   <a href="profile.html">
                                       <figure class="profile-thumb-small profile-active">
                                           <img src="assets/images/profile/profile-small-15.jpg" alt="profile picture">
                                       </figure>
                                   </a>
                               </div>
                               <!-- profile picture end -->
                               <div class="posted-author">
                                   <h6 class="author"><a href="profile.html">Robart Marloyan</a></h6>
                                   <span class="active-pro">active now</span>
                               </div>
                               <div class="live-chat-settings ml-auto">
                                   <button class="chat-settings"><img src="assets/images/icons/settings.png" alt=""></button>
                                   <button class="close-btn"><img src="assets/images/icons/close.png" alt=""></button>
                               </div>
                           </div>
                           <div class="message-list-inner">
                               <ul class="message-list custom-scroll">
                                   <li class="text-friends">
                                       <p>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text</p>
                                       <div class="message-time">10 minute ago</div>
                                   </li>
                                   <li class="text-author">
                                       <p>Many desktop publishing packages and web page editors</p>
                                       <div class="message-time">5 minute ago</div>
                                   </li>
                                   <li class="text-friends">
                                       <p>packages and web page editors </p>
                                       <div class="message-time">2 minute ago</div>
                                   </li>
                                   <li class="text-friends">
                                       <p>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text</p>
                                       <div class="message-time">10 minute ago</div>
                                   </li>
                                   <li class="text-author">
                                       <p>Many desktop publishing packages and web page editors</p>
                                       <div class="message-time">5 minute ago</div>
                                   </li>
                                   <li class="text-friends">
                                       <p>packages and web page editors </p>
                                       <div class="message-time">2 minute ago</div>
                                   </li>
                               </ul>
                           </div>
                           <div class="chat-text-field mob-text-box">
                               <textarea class="live-chat-field custom-scroll" placeholder="Text Message"></textarea>
                               <button class="chat-message-send" type="submit" value="submit">
                                   <img src="assets/images/icons/plane.png" alt="">
                               </button>
                           </div>
                       </div>
                   </li>
                   <li>
                       <button class="notification"><i class="flaticon-notification"></i>
                           <span>03</span>
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
                           <img src="${current_account.avatar }" alt="profile picture">
                       </figure>
                   </a>
                   <div class="profile-dropdown text-left">
                       <div class="profile-head">
                           <h5 class="name"><a href="#">${current_account.name }</a></h5>
                           <a class="mail" href="#">${current_account.email }</a>
                       </div>
                       <div class="profile-body">
                           <ul>
                               <li><a href="profile.html"><i class="flaticon-user"></i>Hồ sơ</a></li>
                               <li><a href="logout"><i class="flaticon-unlock"></i>Đăng xuất</a></li>
                           </ul>
                       </div>
                   </div>
               </div>
               <!-- profile picture end -->
            </div>
        </div>
    </div>
</header>