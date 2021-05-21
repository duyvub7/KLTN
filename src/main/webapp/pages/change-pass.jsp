<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>Phòng trọ</title>
	<jsp:include page="/pages/layout/header.jsp" />
</head>
<body>
	<div class="container">
        <div class="row py-3 align-items-center">
            <div class="col-md-9 col-lg-6 background-white mx-auto mt-5">
                <div class="form-area p-3">
                    <form action="change-pass" method="POST" class="signup-inner--form" id="change-pass-form">
                        <div class="row">
                            <h3 class="text-info mx-auto p-3">Đổi mật khẩu</h3>

                            <div class="col-12 row">
                                <input type="password" name="pass" id="pass-current" class="single-field col-12" placeholder="Nhập mật khẩu hiện tại">
                            </div>

                            <div class="col-12 row">
                                <input type="password" name="newPass" id="pass-new" class="single-field col-12" placeholder="Nhập mật khẩu mới">
                            </div>

                            <div class="col-12 row">
                                <input type="password" name="confirmPass" id="pass-confirm" class="single-field col-12" placeholder="Nhập lại mật khẩu mới">
                            </div>
                            
                            <div id="messageError" class="" style="visibility: hidden; color: red; margin-top: 0;">Sth</div>
                            
                            <div class="form-group col-lg-12 mx-auto mb-0">
                                <input type="submit" id="change-pass-btn" class="rounded btn-primary btn-block py-2" value="Đổi mật khẩu">
                            </div>

                            <a href="${contextPath}/my-profile" id="btn-back" class="f-16 mx-auto mt-3">Quay lại</a>
    
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
	
	<jsp:include page="/pages/layout/footer.jsp" />
	<script>
        $(document).ready(function () {
            $('input, select').on('focus', function () {
                $(this).parent().find('.input-group-text').css('border-color', '#80bdff');
            });
            $('input, select').on('blur', function () {
                $(this).parent().find('.input-group-text').css('border-color', '#ced4da');
            });
            $('#change-pass-btn').click(function (e) {
        		e.preventDefault()
        		console.log('da dung event')
        		let pass = $('#pass-current').val()
        		let newPass = $('#pass-new').val()
        		let confirmPass = $('#pass-confirm').val()
        		$.ajax({
        			async: true,
        			headers: {
        				"content-type": "application/json"
        			},
        			type: "POST",
        			url: '/KLTN/check-changepass/' + pass + '/' + newPass + '/' + confirmPass,
        			success: function (response) {
        				if (response === 'OK') {
        					$('#messageError').css({ 'visibility': 'hidden' })
        					alert('Đổi mk thành công')
        					$("#change-pass-form").submit()
        				} else {
        					$('#messageError').css({ 'visibility': 'visible' })
        					$('#messageError').text(response)
        				}
        			},
        			error: function (err) {
        				console.log(err)
        			}
        		});
        	});
        });
    </script>
</body>
</html>