$(document).ready(function () {
	
	$('#btn-login').click(function (e) {
		e.preventDefault()
		let acc = {
			phone: $('#phone-log').val(),
			password: $('#password-log').val()
		}
		$.ajax({
			async: true,
			headers: {
				"content-type": "application/json;charset=utf-8"	
			},
			type: "POST",
			url: "/KLTN/checklogin",
			data: JSON.stringify(acc),
			// dataType: "json",
			success: function (response) {
				if (response === 'OK') {
					$('#messageError').css({ 'visibility': 'hidden' })
					$('#login').submit()
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
	
	$('#btn-register').click(function (e) {
		e.preventDefault()
		let acc = {
			name: $('#name').val(),
			phone: $('#phone').val(),
			email: $('#email').val(),
			password: $('#password').val(),
			introduction: $('#passwordConfirm').val(),
		}
		$.ajax({
			async: true,
			headers: {
				"content-type": "application/json"
			},
			type: "POST",
			url: "/KLTN/checkregister",
			data: JSON.stringify(acc),
			//dataType: "json",
			success: function (response) {
				if (response === 'OK') {
					$('#regMessageError').css({ 'visibility': 'hidden' })
					alert('dang ky thanh cong')
					$('#register').submit()
				} else {
					$('#regMessageError').css({ 'visibility': 'visible' })
					$('#regMessageError').text(response)
				}
			},
			error: function (err) {
				console.log(err)
			}
		});
	});
});