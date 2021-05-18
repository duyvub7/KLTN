$(document).ready(function () {

	$('.post-more').click(function () {
		$(this).parent('.post-desc').children('.more-content').attr('style', 'display: block')
		$(this).hide()
	});
	
	$('.post-short').click(function () {
		$(this).parent('.more-content').parent('.post-desc').children('.post-more').show()
		$(this).parent('.more-content').hide()
	});
	
	$('.post-meta-like').click(function () {
		console.log('clicked like')
		let postId = $(this).attr('data-postId')
		let num = parseInt($(this).children('.lh-16').html())
		console.log(num + 1)
		console.log(postId)
		/*$.ajax({
			async: true,
			headers: {
				"content-type": "application/json;charset=utf-8"	
			},
			type: "POST",
			url: "/KLTN/like-post",
			data: postId,
			// dataType: "json",
			success: function (response) {
				if (response === 'OK') {
					let num = $(this).children('.lh-16').html()
					$(this).children('.lh-16')
					$('#login').submit()
				}
			},
			error: function (err) {
				console.log(err)
			}
		});*/
	});

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
});