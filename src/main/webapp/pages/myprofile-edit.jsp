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
                                            <li class="active"><a href="MyInfo.html">Thông tin</a></li>
                                            <li><a href="MyPost.html">Bài đăng</a></li> 
                                            <li><a href="MySavePost.html">Bài đã lưu</a></li> 
                                            <li><a href="MyFriend.html">Bạn bè</a></li> 
                                            <li><a href="MyRequest.html">Lời mời kết bạn</a></li> 
                                            <li><a href="MyFollow.html">Theo dõi</a></li>
                                        </ul>
                                    </nav>
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
                                </div>
                            </div>
                            <form action="#" method="POST" class="signup-inner--form px-3">
                                <div class="container f-16">
                                    <div class="row">
                                        <div class="col-12 row">
                                            <p class="col-md-3 col-lg-2 col-12 pt-2 pl-1">Giới thiệu</p>
                                            <input type="text" class="single-field col-md-9 col-lg-10 col-12 text-muted" placeholder="Thông tin ngắn gọn về bản thân" value="thông tin j đó">
                                        </div>
                                        <div class="col-12 row">
                                            <p class="col-md-3 col-lg-2 col-12 pt-2 pl-1">Họ tên</p>
                                            <input type="text" class="single-field col-md-9 col-lg-10 col-12 text-muted" placeholder="Họ tên" value="Nguyễn Văn Tiến">
                                        </div>
                                        <div class="col-12 row">
                                            <p class="col-md-3 col-lg-2 col-12 pt-2 pl-1">Giới tính</p>
                                            <select class="form-control col-md-9 col-lg-10 col-12">
                                                <option class="f-18">1</option>
                                                <option class="f-18">2</option>
                                                <option class="f-18" selected>3</option>
                                                <option class="f-18">4</option>
                                                <option class="f-18">5</option>
                                            </select>
                                        </div>
                                        <div class="col-12 row">
                                            <p class="col-md-3 col-lg-2 col-12 pt-2 pl-1">Ngày sinh</p>
                                            <input class="form-control single-field col-md-9 col-lg-10 col-12 text-muted f-16" type="date" value="2011-08-19" id="example-date-input">
                                            
                                        </div>
                                        <div class="col-12 row">
                                            <p class="col-md-3 col-lg-2 col-12 pt-2 pl-1">Số điện thoại</p>
                                            <input type="tel" class="single-field col-md-9 col-lg-10 col-12 text-muted" placeholder="Số điện thoại" value="sdt l,an">
                                        </div>
                                        <div class="col-12 row">
                                            <p class="col-md-3 col-lg-2 col-12 pt-2 pl-1">Tỉnh thành</p>
                                            <select class="form-control col-md-9 col-lg-10 col-12">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                            </select>
                                        </div>
                                        <div class="col-12 row">
                                            <p class="col-md-3 col-lg-2 col-12 pt-2 pl-1">Địa chỉ</p>
                                            <input type="text" class="single-field col-md-9 col-lg-10 col-12 text-muted" placeholder="Địa chỉ" value="địa chỉ 1">
                                        </div>
                                    </div>
                                </div>
                            </form>
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