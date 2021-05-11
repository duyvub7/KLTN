<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>Phòng trọ</title>
	<jsp:include page="/pages/layout/header.jsp" />
</head>
<body>
	<!-- header area start -->
    <header>
        <div class="header-top sticky bg-white d-none d-lg-block">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-8 px-0">
                        <!-- header top navigation start -->
                        <div class="header-top-navigation">
                            <nav>
                                <ul>
                                    <li class="mr-4 ml-2 active"><a href="index.html">Bài viết</a></li>
                                    <li class="mr-4 "><a href="index2.html">Phòng trọ</a></li>
                                    <li class="mr-4 "><a href="index3.html">Ở ghép</a></li>
                                    <li class="mr-4 "><a href="index4.html">Đồ dùng</a></li>
                                    <li class="notification-trigger mr-4 float-right">
                                        <a class="msg-trigger-btn" href="#b">
                                            <button class="notification"><i class="flaticon-notification f-22"></i>
                                                <span>03</span>
                                            </button>
                                        </a>
                                        <div class="message-dropdown" id="b">
                                            <div class="dropdown-title">
                                                <p class="recent-msg">Notification</p>
                                                <button>
                                                    <i class="flaticon-settings"></i>
                                                </button>
                                            </div>
                                            <ul class="dropdown-msg-list">
                                                <li class="msg-list-item d-flex justify-content-between">
                                                    <!-- profile picture end -->
                                                    <div class="profile-thumb">
                                                        <figure class="profile-thumb-middle">
                                                            <img src="assets/images/profile/profile-small-3.jpg" alt="profile picture">
                                                        </figure>
                                                    </div>
                                                    <!-- profile picture end -->

                                                    <!-- message content start -->
                                                    <div class="msg-content notification-content">
                                                        <a href="profile.html">Robert Faul</a>,
                                                        <a href="profile.html">william jhon</a>
                                                        <p>and 35 other people reacted to your photo</p>
                                                    </div>
                                                    <!-- message content end -->

                                                    <!-- message time start -->
                                                    <div class="msg-time">
                                                        <p>25 Apr 2019</p>
                                                    </div>
                                                    <!-- message time end -->
                                                </li>
                                                <li class="msg-list-item d-flex justify-content-between">
                                                    <!-- profile picture end -->
                                                    <div class="profile-thumb">
                                                        <figure class="profile-thumb-middle">
                                                            <img src="assets/images/profile/profile-small-4.jpg" alt="profile picture">
                                                        </figure>
                                                    </div>
                                                    <!-- profile picture end -->

                                                    <!-- message content start -->
                                                    <div class="msg-content notification-content">
                                                        <a href="profile.html">Robert mushkil</a>,
                                                        <a href="profile.html">Terry jhon</a>
                                                        <p>and 20 other people reacted to your photo</p>
                                                    </div>
                                                    <!-- message content end -->

                                                    <!-- message time start -->
                                                    <div class="msg-time">
                                                        <p>20 May 2019</p>
                                                    </div>
                                                    <!-- message time end -->
                                                </li>
                                                <li class="msg-list-item d-flex justify-content-between">
                                                    <!-- profile picture end -->
                                                    <div class="profile-thumb">
                                                        <figure class="profile-thumb-middle">
                                                            <img src="assets/images/profile/profile-small-6.jpg" alt="profile picture">
                                                        </figure>
                                                    </div>
                                                    <!-- profile picture end -->

                                                    <!-- message content start -->
                                                    <div class="msg-content notification-content">
                                                        <a href="profile.html">Horijon Mbala</a>,
                                                        <a href="profile.html">Bashu jhon</a>
                                                        <p>and 55 other people reacted to your post</p>
                                                    </div>
                                                    <!-- message content end -->

                                                    <!-- message time start -->
                                                    <div class="msg-time">
                                                        <p>15 Jan 2019</p>
                                                    </div>
                                                    <!-- message time end -->
                                                </li>
                                            </ul>
                                            <div class="msg-dropdown-footer">
                                                <button>See all in messenger</button>
                                                <button>Mark All as Read</button>
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
                                                <p class="recent-msg">recent message</p>
                                                <div class="message-btn-group">
                                                    <button>New group</button>
                                                    <button>New Message</button>
                                                </div>
                                            </div>
                                            <ul class="dropdown-msg-list">
                                                <li class="msg-list-item d-flex justify-content-between">
                                                    <!-- profile picture end -->
                                                    <div class="profile-thumb">
                                                        <figure class="profile-thumb-middle">
                                                            <img src="assets/images/profile/profile-small-3.jpg" alt="profile picture">
                                                        </figure>
                                                    </div>
                                                    <!-- profile picture end -->

                                                    <!-- message content start -->
                                                    <div class="msg-content">
                                                        <h6 class="author"><a href="profile.html">Mili Raoulin</a></h6>
                                                        <p>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default</p>
                                                    </div>
                                                    <!-- message content end -->

                                                    <!-- message time start -->
                                                    <div class="msg-time">
                                                        <p>25 Apr 2019</p>
                                                    </div>
                                                    <!-- message time end -->
                                                </li>
                                                <li class="msg-list-item d-flex justify-content-between">
                                                    <!-- profile picture end -->
                                                    <div class="profile-thumb">
                                                        <figure class="profile-thumb-middle">
                                                            <img src="assets/images/profile/profile-small-4.jpg" alt="profile picture">
                                                        </figure>
                                                    </div>
                                                    <!-- profile picture end -->

                                                    <!-- message content start -->
                                                    <div class="msg-content">
                                                        <h6 class="author"><a href="profile.html">Jhon Doe</a></h6>
                                                        <p>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default</p>
                                                    </div>
                                                    <!-- message content end -->

                                                    <!-- message time start -->
                                                    <div class="msg-time">
                                                        <p>15 May 2019</p>
                                                    </div>
                                                    <!-- message time end -->
                                                </li>
                                                <li class="msg-list-item d-flex justify-content-between">
                                                    <!-- profile picture end -->
                                                    <div class="profile-thumb">
                                                        <figure class="profile-thumb-middle">
                                                            <img src="assets/images/profile/profile-small-5.jpg" alt="profile picture">
                                                        </figure>
                                                    </div>
                                                    <!-- profile picture end -->

                                                    <!-- message content start -->
                                                    <div class="msg-content">
                                                        <h6 class="author"><a href="profile.html">Jon Wileyam</a></h6>
                                                        <p>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default</p>
                                                    </div>
                                                    <!-- message content end -->

                                                    <!-- message time start -->
                                                    <div class="msg-time">
                                                        <p>20 Jun 2019</p>
                                                    </div>
                                                    <!-- message time end -->
                                                </li>
                                            </ul>
                                            <div class="msg-dropdown-footer">
                                                <a href="Message.html"><button>See all in messenger</button></a>
                                                <button>Mark All as Read</button>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="notification-trigger mr-5 float-right">
                                        <a class="msg-trigger-btn" href="#d">
                                            <button class="notification"><i class="flaticon-users f-22"></i>
                                                <span>03</span>
                                            </button>
                                        </a>
                                        <div class="message-dropdown" id="d">
                                            <div class="dropdown-title">
                                                <p class="recent-msg">Notification</p>
                                                <button>
                                                    <i class="flaticon-settings"></i>
                                                </button>
                                            </div>
                                            <ul class="dropdown-msg-list">
                                                <li class="msg-list-item d-flex justify-content-between">
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
                                                <li class="msg-list-item d-flex justify-content-between">
                                                    <div class="frnd-request-member">
                                                        <figure class="request-thumb">
                                                            <a href="profile.html">
                                                                <img src="assets/images/profile/avatar-6.jpg" alt="proflie author">
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
                                                <li class="msg-list-item d-flex justify-content-between">
                                                    <div class="frnd-request-member">
                                                        <figure class="request-thumb">
                                                            <a href="profile.html">
                                                                <img src="assets/images/profile/avatar-3.jpg" alt="proflie author">
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
                                            <img src="${recently_account.avatar }" alt="profile picture">
                                    </a>
                                    <div class="profile-dropdown">
                                        <div class="profile-head">
                                            <h5 class="name"><a href="#">${recently_account.name }</a></h5>
                                            <a class="mail" href="#">${recently_account.email }</a>
                                        </div>
                                        <div class="profile-body">
                                            <ul>
                                                <li><a href="MyProfile"><i class="flaticon-user"></i>Hồ sơ cá nhân</a></li>
                                                <li><a href="login"><i class="feather icon-log-out"></i>Đăng xuất</a></li>
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
    </header>
    <!-- header area end -->
    <!-- header area start -->
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
                                <img src="${recently_account.avatar }" alt="profile picture">
                            </figure>
                        </a>
                        <div class="profile-dropdown text-left">
                            <div class="profile-head">
                                <h5 class="name"><a href="#">Madison Howard</a></h5>
                                <a class="mail" href="#">mailnam@mail.com</a>
                            </div>
                            <div class="profile-body">
                                <ul>
                                    <li><a href="profile.html"><i class="flaticon-user"></i>Profile</a></li>
                                    <li><a href="#"><i class="flaticon-message"></i>Inbox</a></li>
                                    <li><a href="#"><i class="flaticon-document"></i>Activity</a></li>
                                </ul>
                                <ul>
                                    <li><a href="#"><i class="flaticon-settings"></i>Setting</a></li>
                                    <li><a href="signup.html"><i class="flaticon-unlock"></i>Sing out</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- profile picture end -->
                </div>
            </div>
        </div>
    </header>
    <!-- header area end -->

    <main>

        <div class="main-wrapper pt-80">
            <div class="container mt-4">
                <div class="row">
                    <div class="col-lg-3 order-2 order-lg-1">
                        <aside class="widget-area">
                            <!-- widget single item start -->
                            <div class="card card-profile widget-item p-0">
                                <div class="profile-banner">
                                    <figure class="profile-banner-small">
                                        <a href="profile.html">
                                            <img src="${recently_account.wall_image }" alt="">
                                        </a>
                                        <a href="profile.html" class="profile-thumb-2">
                                            <img src="${recently_account.avatar }" alt="">
                                        </a>
                                    </figure>
                                    <div class="profile-desc text-center">
                                        <h6 class="author"><a href="profile.html">${recently_account.name }</a></h6>
                                        <p>Hồ sơ của bạn sẽ được hiển thị với mọi người</p>
                                    </div>
                                </div>
                            </div>
                            <!-- widget single item start -->

                        
                            <!-- widget single item start -->
                            <div class="card widget-item">
                                <h4 class="widget-title">Lời mời kết bạn</h4>
                                <div class="widget-body">
                                    <ul class="like-page-list-wrapper">
                                    	<c:forEach var="request" items="${listRequest }">
                                    		<li class="unorder-list">
	                                            <div class="profile-thumb">
	                                                <a href="#">
	                                                    <figure class="profile-thumb-small">
	                                                        <img src="${request.getFrom_account().getAvatar() }" alt="profile picture">
	                                                    </figure>
	                                                </a>
	                                            </div>
	
	                                            <div class="unorder-list-info col-10">
	                                                <h3 class="list-title"><a href="#">${request.getFrom_account().getName() }</a></h3>
	                                                <p class="list-subtitle">${fn:substring(request.time, 0, 16) }</p>
	                                                <div class="row">
	                                                	<div class="col-6 px-0">
	                                                		<a href="#"><button class="btn-sm btn-success">Đồng ý</button></a>
	                                                	</div>
	                                                	<div class="col-6 px-0">
	                                                		<a href="#"><button class="btn-sm btn-danger">Từ chối</button></a>
	                                                	</div>
	                                                </div>
	                                            </div>
	                                        </li>
                                    	</c:forEach>
                                    </ul>
                                    <a href="#" class="f-16 text-primary float-right">>>>Xem tất cả</a>
                                </div>
                            </div>
                            <!-- widget single item end -->
                        </aside>
                    </div>

                    <div class="col-lg-6 order-1 order-lg-2">
                        <!-- share box start -->
                        <div class="card card-small">
                            <div class="share-box-inner">
                                <!-- profile picture end -->
                                <div class="profile-thumb">
                                    <a href="#">
                                        <figure class="profile-thumb-middle">
                                            <img src="${recently_account.avatar }" alt="profile picture">
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
                                                <textarea name="share" class="share-field-big custom-scroll" placeholder="Hãy viết gì đó"></textarea>
                                            </div>
                                            <div class="">
                                                <div class="container">
                                                    <div class="panel my-2">
                                                        <div class="button_outer">
                                                            <div class="btn_upload">
                                                                <input type="file" id="upload_file" name="">
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
	                                    <span class="post-time">${fn:substring(post.post_date, 0, 16) }</span>
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
	                                            <img src="${recently_account.avatar }" alt="profile picture">
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
						
                        <!-- post status start -->
                        <div class="card">
                            <!-- post title start -->
                            <div class="post-title d-flex align-items-center">
                                <!-- profile picture end -->
                                <div class="profile-thumb">
                                    <a href="#">
                                        <figure class="profile-thumb-middle">
                                            <img src="assets/images/profile/avatar-2.jpg" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->

                                <div class="posted-author">
                                    <h6 class="author"><a href="profile.html">merry watson</a></h6>
                                    <span class="post-time">20 min ago</span>
                                </div>

                                <div class="post-settings-bar">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    <div class="post-settings arrow-shape">
                                        <ul>
                                            <li><button>copy link to adda</button></li>
                                            <li><button>edit post</button></li>
                                            <li><button>embed adda</button></li>
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
                                <div class="post-thumb-gallery">
                                    <figure class="post-thumb img-popup">
                                        <a href="assets/images/post/post-large-1.jpg">
                                            <img src="assets/images/post/2.jpg" alt="post image">
                                        </a>
                                    </figure>
                                </div>
                                <div class="post-meta">
                                    <button class="post-meta-like">
                                        <i class="bi bi-heart-beat"></i>
                                        <span>You and 201 people like this</span>
                                        <strong>201</strong>
                                    </button>
                                    <ul class="comment-share-meta">
                                        <li>
                                            <button class="post-comment">
                                                <i class="bi bi-chat-bubble"></i>
                                                <span>41</span>
                                            </button>
                                        </li>
                                        <li>
                                            <button class="post-share">
                                                <i class="bi bi-share"></i>
                                                <span>07</span>
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="mt-1 ml-2">
                                    <p class="text-success" id="bl-01">Xem thêm bình luận</p>
                                    <p class="text-success hide-class" id="bl-02">Ẩn bớt bình luận</p>
                                </div>
                                <div class="row mb-2">
                                    <a href="#" class="col-1 px-2 mr-1">
                                        <figure class="profile-thumb-small">
                                            <img src="assets/images/profile/avatar-1.jpg" alt="profile picture">
                                        </figure>
                                    </a>
                                    <input class="col-10 form-control rounded" />
                                </div>
                                <div id="com-area-1">
                                    <div class="unorder-list mb-2 border-bot-light">
                                        <div class="profile-thumb">
                                            <a href="#">
                                                <figure class="profile-thumb-small">
                                                    <img src="assets/images/profile/avatar-4.jpg" alt="profile picture">
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

                        <!-- post status start -->
                        <div class="card">
                            <!-- post title start -->
                            <div class="post-title d-flex align-items-center">
                                <!-- profile picture end -->
                                <div class="profile-thumb">
                                    <a href="#">
                                        <figure class="profile-thumb-middle">
                                            <img src="assets/images/profile/avatar-7.jpg" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->

                                <div class="posted-author">
                                    <h6 class="author"><a href="profile.html">Jon Wileyam</a></h6>
                                    <span class="post-time">15 min ago</span>
                                </div>

                                <div class="post-settings-bar">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    <div class="post-settings arrow-shape">
                                        <ul>
                                            <li><button>copy link to adda</button></li>
                                            <li><button>edit post</button></li>
                                            <li><button>embed adda</button></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- post title start -->
                            <div class="post-content">
                                <p class="post-desc pb-0">
                                    Many desktop publishing packages and web page editors now use Lorem Ipsum as their
                                    default model text, and a search for
                                </p>
                                <div class="post-meta">
                                    <button class="post-meta-like">
                                        <i class="bi bi-heart-beat"></i>
                                        <span>You and 206 people like this</span>
                                        <strong>206</strong>
                                    </button>
                                    <ul class="comment-share-meta">
                                        <li>
                                            <button class="post-comment">
                                                <i class="bi bi-chat-bubble"></i>
                                                <span>41</span>
                                            </button>
                                        </li>
                                        <li>
                                            <button class="post-share">
                                                <i class="bi bi-share"></i>
                                                <span>07</span>
                                            </button>
                                        </li>
                                    </ul>
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
                                            <img src="assets/images/profile/avatar-1.jpg" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->

                                <div class="posted-author">
                                    <h6 class="author"><a href="profile.html">Kate Palson</a></h6>
                                    <span class="post-time">35 min ago</span>
                                </div>

                                <div class="post-settings-bar">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    <div class="post-settings arrow-shape">
                                        <ul>
                                            <li><button>copy link to adda</button></li>
                                            <li><button>edit post</button></li>
                                            <li><button>embed adda</button></li>
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
                                        <div class="col-8">
                                            <figure class="post-thumb">
                                                <a class="gallery-selector" href="assets/images/post/post-large-2.jpg">
                                                    <img src="assets/images/post/6.jpg" alt="post image">
                                                </a>
                                            </figure>
                                        </div>
                                        <div class="col-4">
                                            <div class="row">
                                                <div class="col-12">
                                                    <figure class="post-thumb">
                                                        <a class="gallery-selector" href="assets/images/post/post-large-3.jpg">
                                                            <img src="assets/images/post/14.jpg" alt="post image">
                                                        </a>
                                                    </figure>
                                                </div>
                                                <div class="col-12">
                                                    <figure class="post-thumb">
                                                        <a class="gallery-selector" href="assets/images/post/post-large-4.jpg">
                                                            <img src="assets/images/post/15.jpg" alt="post image">
                                                        </a>
                                                    </figure>
                                                </div>
                                                <div class="col-12">
                                                    <figure class="post-thumb">
                                                        <a class="gallery-selector" href="assets/images/post/post-large-5.jpg">
                                                            <img src="assets/images/post/9.jpg" alt="post image">
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
                                        <span>You and 70 people like this</span>
                                        <strong>70</strong>
                                    </button>
                                    <ul class="comment-share-meta">
                                        <li>
                                            <button class="post-comment">
                                                <i class="bi bi-chat-bubble"></i>
                                                <span>28</span>
                                            </button>
                                        </li>
                                        <li>
                                            <button class="post-share">
                                                <i class="bi bi-share"></i>
                                                <span>12</span>
                                            </button>
                                        </li>
                                    </ul>
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
                                            <img src="assets/images/profile/avatar-4.jpg" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->

                                <div class="posted-author">
                                    <h6 class="author"><a href="profile.html">william henry</a></h6>
                                    <span class="post-time">35 min ago</span>
                                </div>

                                <div class="post-settings-bar">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    <div class="post-settings arrow-shape">
                                        <ul>
                                            <li><button>copy link to adda</button></li>
                                            <li><button>edit post</button></li>
                                            <li><button>embed adda</button></li>
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
                                <div class="plyr__video-embed plyr-youtube">
                                    <iframe src="https://www.youtube.com/embed/WeA7edXsU40" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                </div>
                                <div class="post-meta">
                                    <button class="post-meta-like">
                                        <i class="bi bi-heart-beat"></i>
                                        <span>You and 112 people like this</span>
                                        <strong>112</strong>
                                    </button>
                                    <ul class="comment-share-meta">
                                        <li>
                                            <button class="post-comment">
                                                <i class="bi bi-chat-bubble"></i>
                                                <span>36</span>
                                            </button>
                                        </li>
                                        <li>
                                            <button class="post-share">
                                                <i class="bi bi-share"></i>
                                                <span>08</span>
                                            </button>
                                        </li>
                                    </ul>
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
                                            <img src="assets/images/profile/avatar-6.jpg" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->

                                <div class="posted-author">
                                    <h6 class="author"><a href="profile.html">Robart Faul</a></h6>
                                    <span class="post-time">40 min ago</span>
                                </div>

                                <div class="post-settings-bar">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    <div class="post-settings arrow-shape">
                                        <ul>
                                            <li><button>copy link to adda</button></li>
                                            <li><button>edit post</button></li>
                                            <li><button>embed adda</button></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- post title start -->
                            <div class="post-content">
                                <p class="post-desc pb-0">
                                    Many desktop publishing packages and web page editors now use Lorem Ipsum as their
                                    default model text, and a search for Many desktop publishing packages and web page
                                    editors now use Lorem Ipsum as their default model text, and a search for Many
                                    desktop publishing duskam azer.
                                </p>
                                <div class="post-meta">
                                    <button class="post-meta-like">
                                        <i class="bi bi-heart-beat"></i>
                                        <span>You and 250 people like this</span>
                                        <strong>250</strong>
                                    </button>
                                    <ul class="comment-share-meta">
                                        <li>
                                            <button class="post-comment">
                                                <i class="bi bi-chat-bubble"></i>
                                                <span>80</span>
                                            </button>
                                        </li>
                                        <li>
                                            <button class="post-share">
                                                <i class="bi bi-share"></i>
                                                <span>10</span>
                                            </button>
                                        </li>
                                    </ul>
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
                                            <img src="assets/images/profile/avatar-3.jpg" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->

                                <div class="posted-author">
                                    <h6 class="author"><a href="profile.html">Halen Omaro</a></h6>
                                    <span class="post-time">45 min ago</span>
                                </div>

                                <div class="post-settings-bar">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    <div class="post-settings arrow-shape">
                                        <ul>
                                            <li><button>copy link to adda</button></li>
                                            <li><button>edit post</button></li>
                                            <li><button>embed adda</button></li>
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
                                <div class="plyr__video-embed plyr-video">
                                    <iframe src="https://www.youtube.com/embed/odUtqDz4lEk" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                </div>
                                <p class="post-desc post-desc-secondary">
                                    Many desktop publishing packages and web page editors now use Lorem Ipsum as their
                                    default model text, and a search for
                                </p>
                                <div class="post-meta">
                                    <button class="post-meta-like">
                                        <i class="bi bi-heart-beat"></i>
                                        <span>You and 160 people like this</span>
                                        <strong>160</strong>
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
                                            <img src="assets/images/profile/avatar-5.jpg" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->

                                <div class="posted-author">
                                    <h6 class="author"><a href="profile.html">Mili Raoulin</a></h6>
                                    <span class="post-time">50 min ago</span>
                                </div>

                                <div class="post-settings-bar">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    <div class="post-settings arrow-shape">
                                        <ul>
                                            <li><button>copy link to adda</button></li>
                                            <li><button>edit post</button></li>
                                            <li><button>embed adda</button></li>
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
                                                    <img src="assets/images/post/post-6.jpg" alt="post image">
                                                </a>
                                            </figure>
                                        </div>
                                        <div class="col-6">
                                            <figure class="post-thumb">
                                                <a class="gallery-selector" href="assets/images/post/post-large-7.jpg">
                                                    <img src="assets/images/post/post-7.jpg" alt="post image">
                                                </a>
                                            </figure>
                                        </div>
                                    </div>
                                </div>
                                <div class="post-meta">
                                    <button class="post-meta-like">
                                        <i class="bi bi-heart-beat"></i>
                                        <span>You and 30 people like this</span>
                                        <strong>30</strong>
                                    </button>
                                    <ul class="comment-share-meta">
                                        <li>
                                            <button class="post-comment">
                                                <i class="bi bi-chat-bubble"></i>
                                                <span>65</span>
                                            </button>
                                        </li>
                                        <li>
                                            <button class="post-share">
                                                <i class="bi bi-share"></i>
                                                <span>04</span>
                                            </button>
                                        </li>
                                    </ul>
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
                                            <img src="assets/images/profile/profile-small-9.jpg" alt="profile picture">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->

                                <div class="posted-author">
                                    <h6 class="author"><a href="profile.html">Jon Wileyam</a></h6>
                                    <span class="post-time">15 min ago</span>
                                </div>

                                <div class="post-settings-bar">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    <div class="post-settings arrow-shape">
                                        <ul>
                                            <li><button>copy link to adda</button></li>
                                            <li><button>edit post</button></li>
                                            <li><button>embed adda</button></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- post title start -->
                            <div class="post-content">
                                <p class="post-desc pb-0">
                                    Many desktop publishing packages and web page editors now use Lorem Ipsum as their
                                    default model text, and a search for
                                </p>
                                <div class="post-meta">
                                    <button class="post-meta-like">
                                        <i class="bi bi-heart-beat"></i>
                                        <span>You and 320 people like this</span>
                                        <strong>320</strong>
                                    </button>
                                    <ul class="comment-share-meta">
                                        <li>
                                            <button class="post-comment">
                                                <i class="bi bi-chat-bubble"></i>
                                                <span>41</span>
                                            </button>
                                        </li>
                                        <li>
                                            <button class="post-share">
                                                <i class="bi bi-share"></i>
                                                <span>07</span>
                                            </button>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- post status end -->

                    </div>

                    <div class="col-lg-3 order-3">
                        <aside class="widget-area">
                            <!-- widget single item start -->
                            <div class="card widget-item">
                                <h4 class="widget-title">Bài nổi bật</h4>
                                <div class="widget-body">
                                    <ul class="like-page-list-wrapper">
                                        <li class="unorder-list">
                                            <!-- profile picture end -->
                                            <div class="profile-thumb">
                                                <a href="#">
                                                    <figure class="profile-thumb-small">
                                                        <img src="assets/images/profile/avatar-2.jpg" alt="profile picture">
                                                    </figure>
                                                </a>
                                            </div>
                                            <!-- profile picture end -->

                                            <div class="unorder-list-info">
                                                <h3 class="list-title"><a href="#">Meery Waston</a></h3>
                                                <p class="list-subtitle">5 min ago</p>
                                                <a href="photos.html" class="text-dark">Mình xin chia sẻ một số kinh nghiệm khi ở trọ...</a>
                                            </div>
                                        </li>
                                        <li class="unorder-list">
                                            <!-- profile picture end -->
                                            <div class="profile-thumb">
                                                <a href="#">
                                                    <figure class="profile-thumb-small">
                                                        <img src="assets/images/profile/avatar-3.jpg" alt="profile picture">
                                                    </figure>
                                                </a>
                                            </div>
                                            <!-- profile picture end -->

                                            <div class="unorder-list-info">
                                                <h3 class="list-title"><a href="#">John Doe</a></h3>
                                                <p class="list-subtitle">10 min ago</p>
                                                <a href="photos.html" class="text-dark">Những địa điểm cho sinh viên giải trí ở Huế...</a>
                                            </div>
                                        </li>
                                        <li class="unorder-list">
                                            <!-- profile picture end -->
                                            <div class="profile-thumb">
                                                <a href="#">
                                                    <figure class="profile-thumb-small">
                                                        <img src="assets/images/profile/avatar-2.jpg" alt="profile picture">
                                                    </figure>
                                                </a>
                                            </div>
                                            <!-- profile picture end -->

                                            <div class="unorder-list-info">
                                                <h3 class="list-title"><a href="#">Meery Waston</a></h3>
                                                <p class="list-subtitle">5 min ago</p>
                                                <a href="photos.html" class="text-dark">Mình xin chia sẻ một số kinh nghiệm khi ở trọ...</a>
                                            </div>
                                        </li>
                                        <li class="unorder-list">
                                            <!-- profile picture end -->
                                            <div class="profile-thumb">
                                                <a href="#">
                                                    <figure class="profile-thumb-small">
                                                        <img src="assets/images/profile/avatar-3.jpg" alt="profile picture">
                                                    </figure>
                                                </a>
                                            </div>
                                            <!-- profile picture end -->

                                            <div class="unorder-list-info">
                                                <h3 class="list-title"><a href="#">John Doe</a></h3>
                                                <p class="list-subtitle">10 min ago</p>
                                                <a href="photos.html" class="text-dark">Những địa điểm cho sinh viên giải trí ở Huế...</a>
                                            </div>
                                        </li>
                                        <li class="unorder-list">
                                            <!-- profile picture end -->
                                            <div class="profile-thumb">
                                                <a href="#">
                                                    <figure class="profile-thumb-small">
                                                        <img src="assets/images/profile/avatar-2.jpg" alt="profile picture">
                                                    </figure>
                                                </a>
                                            </div>
                                            <!-- profile picture end -->

                                            <div class="unorder-list-info">
                                                <h3 class="list-title"><a href="#">Meery Waston</a></h3>
                                                <p class="list-subtitle">5 min ago</p>
                                                <a href="photos.html" class="text-dark">Mình xin chia sẻ một số kinh nghiệm khi ở trọ...</a>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- widget single item end -->
                        </aside>
                    </div>
                </div>
            </div>
        </div>

    </main>

    <!-- Scroll to top start -->
    <div class="scroll-top not-visible">
        <i class="bi bi-finger-index"></i>
    </div>
    <!-- Scroll to Top End -->
	
	<jsp:include page="/pages/layout/footer.jsp" />
   
</body>
</html>