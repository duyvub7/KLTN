<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>Phòng trọ</title>
	<jsp:include page="/pages/layout/header_login.jsp" />
</head>
<body>
	<div class="container">
        <div class="row py-3 align-items-center">
            <div class="col-md-9 col-lg-6 mx-auto mt-5 pt-5">
                <div class="form-area p-3">
                    <form action="#">
                        <div class="row">
                            <h3 class="p-3 text-info mx-auto">Nhập mã xác nhận</h3>

                            <p class="pl-3 text-muted f-18">Nhập mã OTP được gửi về số điện thoại: 0388762847</p>

                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-phone-square text-muted"></i>
                                    </span>
                                </div>
                                <input id="phone" type="tel" name="phone" placeholder="Nhập mã OTP"
                                    class="form-control bg-white border-md border-left-0 pl-3" autocomplete="off"/>
                                <button class="btn btn-outline-info ml-1">Gửi lại mã</button>
                            </div>
                            
                            <div class="form-group col-lg-12 mx-auto mb-0">
                            	<input type="submit" id="submit-btn" class="f-18 btn btn-primary btn-block py-2" value="Xác nhận">
                            </div>

                            <a href="#" id="go-back" class="f-16 mx-auto my-2">Quay lại</a>
    
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="${contextPath}/resources/assets/js/vendor/jquery-3.3.1.min.js"></script>
    <script src="${contextPath}/resources/assets/js/vendor/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
        	$('#submit-btn').click(function (e) {
        		e.preventDefault();
        		window.location.assign('getpass-newpass');
        	});
            $('input, select').on('focus', function () {
                $(this).parent().find('.input-group-text').css('border-color', '#80bdff');
            });
            $('input, select').on('blur', function () {
                $(this).parent().find('.input-group-text').css('border-color', '#ced4da');
            });
            $('#go-back').click( function (e) {
                e.preventDefault()
                history.back()
            })
        });
    </script>
</body>
</html>