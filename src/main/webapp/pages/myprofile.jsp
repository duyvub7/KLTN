<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>Thông tin cá nhân</title>
	<jsp:include page="/pages/layout/header.jsp" />
</head>
<body>
	<jsp:include page="/pages/layout/navbar.jsp" />
    
    <main>
        <div class="main-wrapper pb-2">
            <div class="profile-banner-large bg-img" data-bg="${current_account.wall_image }"></div>
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
                                            <li class="active"><a href="my-profile">Thông tin</a></li>
                                            <li><a href="my-post">Bài đăng</a></li> 
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
            <div class="container">
                <div class="col-10 mx-auto">
                    <div class="about-description mb-4">
                        <div class="tab-content">
                            <div class="author-desc-title d-flex">
                                <h6 class="author">Thông tin cá nhân</h6>
                                <div class="post-settings-bar">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    <div class="post-settings arrow-shape">
                                        <ul>
                                            <li><button data-toggle="modal" data-target="#textbox">Đổi ảnh đại diện</button></li>
                                            <li><button>Đổi ảnh bìa</button></li>
                                            <li><a href="edit-profile"><button>Sửa thông tin cá nhân</button></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="container f-16">
                                <p>Giới thiệu: Sinh viên đang học ở Huế</p>
                                <p>Họ tên: Nguyễn Văn Tiến</p>
                                <p>Giới tính: Nam</p>
                                <p>Ngày sinh: 28-03-2000</p>
                                <p>Số điện thoại: 0382783422</p>
                                <p>Email: tien@gmail.com</p>
                                <p>Tỉnh thành: Thừa Thiên Huế</p>
                                <p>Địa chỉ: Hương Phong, Hương Trà, Thừa Thiên Huế</p>
                            </div>
                       </div>
                  </div>
             </div>
        </div>
    </main>

    <div class="modal fade" id="textbox" aria-labelledby="textbox">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Chọn ảnh đại diện mới</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="">
                    <div class="container">
                        <div class="panel my-2">
                            <div class="button_outer">
                                <div class="btn_upload">
                                    <input type="file" id="upload_file" name="">
                                    Chọn ảnh
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
                    <button type="button" class="post-share-btn" data-dismiss="modal">Hủy bỏ</button>
                    <input type="submit" id="change-btn" class="btn post-share-btn" value="Đổi avatar"/>
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