<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>Đăng nhập - Đăng ký</title>
 	<jsp:include page="/pages/layout/header_login.jsp" />
</head>
<body>
	<div class="container">
        <div class="row py-3 align-items-center">
            <div class="col-md-5 mb-5 mb-md-0 pr-0 text-center">
                <h1>Tham gia với chúng tôi</h1>
                <p class="f-22 font-italic text-muted mb-0">Tìm kiếm phòng trọ, đồ dùng hay chia sẻ các trải nghiệm của mình</p>
            </div>

            <div class="col-md-7 col-lg-6 ml-auto">
                <!-- Login Form -->
                <div class="form-area p-3 mb-5">
                    <form action="login" method="post" id="login">
                        <div class="row mb-3">
                            <div class="input-group col-6 mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-phone-square text-muted"></i>
                                    </span>
                                </div>
                                <input type="tel" id="phone-log" name="phone-log" placeholder="Số điện thoại"
                                    class="form-control bg-white border-md border-left-0 pl-3" required/>
                            </div>
                            
                            <div class="input-group col-6 mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-lock text-muted"></i>
                                    </span>
                                </div>
                                <input type="password" id="password-log" name="password-log" placeholder="Mật khẩu"
                                    class="form-control bg-white border-left-0 border-md" autocomplete="off" required/>
                            </div>
							
							<div id="messageError" class="ml-3 mb-2" style="visibility: hidden; color: red">error</div>
                            
                            <div class="input-group col-lg-12 row pr-0">
                                <div class="col-6">
                                    <a href="forget-pass">Quên mật khẩu</a>
                                </div>
                                <div class="col-6 pr-0">
                                    <div class="form-group mb-0">
                                        <input type="submit" id="btn-login" class="btn btn-primary btn-block" value="Đăng nhập">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                
                <!-- Register Form -->
                <div class="form-area p-3">
                    <form action="register" method="post" id="register">
                        <div class="row">
                            
                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-user text-muted"></i>
                                    </span>
                                </div>
                                <input id="name" type="text" name="name" placeholder="Họ tên (*)"
                                    class="form-control bg-white border-left-0 border-md" autocomplete="off" required/>
                            </div>
                            
                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-transgender-alt text-muted"></i>
                                    </span>
                                </div>
                                <select id="gender" name="gender"
                                    class="form-control custom-select bg-white border-left-0 border-md">
                                    <option value="0" selected>Chọn giới tính</option>
                                    <option value="1">Nam</option>
                                    <option value="2">Nữ</option>
                                    <option value="3">Khác</option>
                                </select>
                            </div>

                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-phone-square text-muted"></i>
                                    </span>
                                </div>
                                <input id="phone" type="tel" name="phone" placeholder="Số điện thoại (*)"
                                    class="form-control bg-white border-md border-left-0 pl-3" autocomplete="off" required/>
                                <button class="btn btn-outline-info ml-1">Gửi OTP</button>
                            </div>
                            
                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-envelope text-muted"></i>
                                    </span>
                                </div>
                                <input id="email" type="email" name="email" placeholder="Email"
                                    class="form-control bg-white border-left-0 border-md"/>
                            </div>
                            
                            <div class="input-group col-lg-6 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-lock text-muted"></i>
                                    </span>
                                </div>
                                <input id="password" type="password" name="password" placeholder="Mật khẩu (*)"
                                    class="form-control bg-white border-left-0 border-md" autocomplete="off" required/>
                            </div>
                            
                            <div class="input-group col-lg-6 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-lock text-muted"></i>
                                    </span>
                                </div>
                                <input id="passwordConfirm" type="text" name="passwordConfirm"
                                    placeholder="Xác nhận mật khẩu (*)" class="form-control bg-white border-left-0 border-md">
                            </div>

                            <div class="input-group col-lg-12 mb-3 d-none">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-whatsapp text-muted"></i>
                                    </span>
                                </div>
                                <input id="otpConfirmation" type="text" name="otpConfirmation" placeholder="Nhập mã OTP"
                                	 class="form-control bg-white border-left-0 border-md" autocomplete="off" required/>
                            </div>
                            
							<div id="regMessageError" class="ml-3 mb-3" style="visibility: hidden; color: red;">username existed</div>
                            
                            <div class="form-group col-lg-12 mx-auto mb-0">
                                <input type="submit" id="btn-register" class="btn btn-primary btn-block py-2" value="Đăng ký">
                            </div>
    
                        </div>
                    </form>
                </div>
                
            </div>
        </div>
    </div>
	<script src="resources/contents/js/login.js"></script>
    <script>
        $(document).ready(function () {
            $('input, select').on('focus', function () {
                $(this).parent().find('.input-group-text').css('border-color', '#80bdff');
            });
            $('input, select').on('blur', function () {
                $(this).parent().find('.input-group-text').css('border-color', '#ced4da');
            });
        });
    </script>
</body>
</html>