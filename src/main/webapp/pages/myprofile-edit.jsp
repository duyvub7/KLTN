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
            <div class="container">
                <div class="col-10 mx-auto">
                    <div class="about-description mb-4">
                        <div class="tab-content">
                        	<form action="edit-profile" method="POST" class="signup-inner--form px-3">
	                            <div class="author-desc-title d-flex">
	                                <h6 class="author pt-2">Sửa thông tin cá nhân</h6>
	                                <div class="post-settings-bar">
	                                	<input type="submit" class="btn-secondary px-3 py-2 rounded border-0" value="Lưu thay đổi"/>
	                                </div>
	                            </div>
	                            
	                            <div class="container f-16">
	                                <div class="row">
	                                    <div class="col-12 row">
	                                        <p class="col-md-3 col-lg-2 col-12 pt-2 pl-1">Giới thiệu</p>
	                                        <input type="text" name="introduction" class="single-field col-md-9 col-lg-10 col-12 text-muted" 
	                                        	placeholder="Thông tin ngắn gọn về bản thân" value="${current_account.introduction }">
	                                    </div>
	                                    <div class="col-12 row">
	                                        <p class="col-md-3 col-lg-2 col-12 pt-2 pl-1">Họ tên</p>
	                                        <input type="text" name="name" class="single-field col-md-9 col-lg-10 col-12 text-muted" 
	                                        	placeholder="Họ tên" value="${current_account.name }">
	                                    </div>
	                                    <div class="col-12 row">
	                                        <p class="col-md-3 col-lg-2 col-12 pt-2 pl-1">Giới tính</p>
	                                        <select name="gender" class="form-control col-md-9 col-lg-10 col-12">
	                                        	<c:choose>
	                                        		<c:when test="${current_account.gender == 1 }">
	                                        			<option class="f-18" value="1" selected>Nam</option>
	                                        			<option class="f-18" value="2">Nữ</option>
	                                        			<option class="f-18" value="3">Ẩn</option>
	                                        		</c:when>
	                                        		<c:when test="${current_account.gender == 2 }">
	                                        			<option class="f-18" value="1">Nam</option>
	                                        			<option class="f-18" value="2" selected>Nữ</option>
	                                        			<option class="f-18" value="3">Ẩn</option>
	                                        		</c:when>
	                                        		<c:otherwise>
	                                        			<option class="f-18" value="1">Nam</option>
	                                        			<option class="f-18" value="2">Nữ</option>
	                                        			<option class="f-18" value="3" selected>Ẩn</option>
	                                        		</c:otherwise>
	                                        	</c:choose>
	                                        </select>
	                                    </div>
	                                    <div class="col-12 row">
	                                        <p class="col-md-3 col-lg-2 col-12 pt-2 pl-1">Ngày sinh</p>
	                                        <input class="form-control single-field col-md-9 col-lg-10 col-12 text-muted f-16" name="birthday" type="date" 
	                                        	value="${current_account.birthday }" id="date-input">
	                                        
	                                    </div>
	                                    <div class="col-12 row">
	                                        <p class="col-md-3 col-lg-2 col-12 pt-2 pl-1">Số điện thoại</p>
	                                        <input type="tel" name="phone" class="single-field col-md-9 col-lg-10 col-12 text-muted" 
	                                        	placeholder="Số điện thoại" value="${current_account.phone }">
	                                    </div>
	                                    <div class="col-12 row">
	                                        <p class="col-md-3 col-lg-2 col-12 pt-2 pl-1">Tỉnh thành</p>
	                                        <div class="select-small">
	                                        	<select name="province" class="js-example-basic-single col-md-9 col-lg-10 col-12 with-300">
		                                        	<c:forEach var="province" items="${listProvince }">
		                                        		<c:choose>
							                      			<c:when test="${current_account.province_id == province.province_id }">
							                      				<option value="${province.province_id }" selected>${province.province_name }</option>
							                      			</c:when>
							                      			<c:otherwise>
							                      				<option value="${province.province_id }">${province.province_name }</option>
							                      			</c:otherwise>
							                      		</c:choose>
		                                        	</c:forEach>
		                                        </select>
	                                        </div>
	                                    </div>
	                                    <div class="col-12 row mt-4">
	                                        <p class="col-md-3 col-lg-2 col-12 pt-2 pl-1">Địa chỉ</p>
	                                        <input type="text" name="address" class="single-field col-md-9 col-lg-10 col-12 text-muted" 
	                                        	placeholder="Địa chỉ" value="${current_account.address }">
	                                    </div>
	                                </div>
	                            </div>
                            </form>
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