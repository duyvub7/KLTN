$(document).ready(function () {

	$('.post-more').click(function () {
		$(this).parent('.post-desc').children('.more-content').attr('style', 'display: block')
		$(this).hide()
	});
	
	$('.post-short').click(function () {
		$(this).parent('.more-content').parent('.post-desc').children('.post-more').show()
		$(this).parent('.more-content').hide()
	});
	
	$('#nav-search-btn').click(function () {
		$('#nav-search-form').submit()
	});
	
	$('.post-meta-like').click(function () {
		let postId = $(this).attr('data-postId')
		const num = parseInt($(this).children('.lh-16').html())
		const icon = '.' + $(this).attr('data-icon')
		const count = '.' + $(this).attr('data-like')
		$.ajax({
			async: true,
			headers: {
				"content-type": "application/json;charset=utf-8"	
			},
			type: "POST",
			url: "/KLTN/like-post",
			data: postId,
			success: function (response) {
				if (response === 'OK') {
					$(icon).attr('style', 'color: black')
					$(count).html(num-1)
					console.log('da giam like')
				} else {
					$(icon).attr('style', 'color: #41b3d8')
					$(count).html(num+1)
					console.log('da tang like')
				}
			},
			error: function (err) {
				console.log(err)
			}
		});
	});
	
	$('.more-com').click(function () {
		$(this).parent('.option-com').parent('.post-content').children('.com-area-2').show()
		$(this).parent('.option-com').children('.hide-com').show()
		$(this).hide()
	});
	
	$('.hide-com').click(function () {
		$(this).parent('.option-com').parent('.post-content').children('.com-area-2').hide()
		$(this).parent('.option-com').children('.more-com').show()
		$(this).hide()
	});
	
	$('.accept-request').click(function () {
		$(this).parent('.option-request3').parent('.option-request2').parent('.option-request1').parent('.option-request0').hide()
		let requestId = $(this).attr('data-id')
		$.ajax({
			async: true,
			headers: {
				"content-type": "application/json;charset=utf-8"	
			},
			type: "POST",
			url: "/KLTN/accept-request",
			data: requestId,
			success: function (response) {
				if (response === 'OK') {
					console.log('da chap nhan')
				}
			},
			error: function (err) {
				console.log(err)
			}
		});
	});
	
	$('.deny-request').click(function () {
		$(this).parent('.option-request3').parent('.option-request2').parent('.option-request1').parent('.option-request0').hide()
		let requestId = $(this).attr('data-id')
		$.ajax({
			async: true,
			headers: {
				"content-type": "application/json;charset=utf-8"	
			},
			type: "POST",
			url: "/KLTN/deny-request",
			data: requestId,
			success: function (response) {
				if (response === 'OK') {
					console.log('da xoa')
				}
			},
			error: function (err) {
				console.log(err)
			}
		});
	});
	
	$('.accept-request-op').click(function () {
		$(this).parent('li').parent('ul').children('.request1').show()
		$(this).parent('li').parent('ul').children('.request3').hide()
		$(this).parent('li').parent('ul').children('.request4').hide()
		let accId = $(this).attr('data-id')
		let reNum = '.request-num-' + accId;
		$(reNum).hide()
		$.ajax({
			async: true,
			headers: {
				"content-type": "application/json;charset=utf-8"	
			},
			type: "POST",
			url: "/KLTN/accept-requestAccId",
			data: accId,
			success: function (response) {
				if (response === 'OK') {
					console.log('da chap nhan')
				}
			},
			error: function (err) {
				console.log(err)
			}
		});
	});
	
	$('.deny-request-op').click(function () {
		$(this).parent('li').parent('ul').children('.request2').show()
		$(this).parent('li').parent('ul').children('.request3').hide()
		$(this).parent('li').parent('ul').children('.request4').hide()
		let accId = $(this).attr('data-id')
		let reNum = '.request-num-' + accId;
		$(reNum).hide()
		$.ajax({
			async: true,
			headers: {
				"content-type": "application/json;charset=utf-8"	
			},
			type: "POST",
			url: "/KLTN/deny-requestAccId",
			data: accId,
			success: function (response) {
				if (response === 'OK') {
					console.log('da xoa')
				}
			},
			error: function (err) {
				console.log(err)
			}
		});
	});
	
	$('.save-post').click(function () {
		$(this).parent('li').parent('ul').children('.save2').show()
		$(this).parent('li').hide()
		let postId = $(this).attr('data-id')
		$.ajax({
			async: true,
			headers: {
				"content-type": "application/json;charset=utf-8"	
			},
			type: "POST",
			url: "/KLTN/save-post",
			data: postId,
			success: function (response) {
				if (response === 'OK') {
					console.log('da luu bai viet')
				}
			},
			error: function (err) {
				console.log(err)
			}
		});
	});
	
	$('.unsave-post').click(function () {
		$(this).parent('li').parent('ul').children('.save1').show()
		$(this).parent('li').hide()
		let postId = $(this).attr('data-id')
		$.ajax({
			async: true,
			headers: {
				"content-type": "application/json;charset=utf-8"	
			},
			type: "POST",
			url: "/KLTN/unsave-post",
			data: postId,
			success: function (response) {
				if (response === 'OK') {
					console.log('da luu bai viet')
				}
			},
			error: function (err) {
				console.log(err)
			}
		});
	});
	
	$('.follow-account').click(function () {
		$(this).parent('li').parent('ul').children('.follow2').show()
		$(this).parent('li').hide()
		let accId = $(this).attr('data-id')
		$.ajax({
			async: true,
			headers: {
				"content-type": "application/json;charset=utf-8"	
			},
			type: "POST",
			url: "/KLTN/follow",
			data: accId,
			success: function (response) {
				if (response === 'OK') {
					console.log('da theo doi')
				}
			},
			error: function (err) {
				console.log(err)
			}
		});
	});
	
	$('.unfollow-account').click(function () {
		$(this).parent('li').parent('ul').children('.follow1').show()
		$(this).parent('li').hide()
		let accId = $(this).attr('data-id')
		$.ajax({
			async: true,
			headers: {
				"content-type": "application/json;charset=utf-8"	
			},
			type: "POST",
			url: "/KLTN/unfollow",
			data: accId,
			success: function (response) {
				if (response === 'OK') {
					console.log('da bo theo doi')
				}
			},
			error: function (err) {
				console.log(err)
			}
		});
	});
	
	$('.remove-mypost').click( function () {
		$('#modal-confirm').modal()
		$('#delete-content').html('Xóa bài viết:<br>'+$(this).attr('data-cont') + '...')
		$('#deletePost-btn').attr('data-id', $(this).attr('data-id'))
	});
	
	$('#deletePost-btn').click( function () {
		const id = $(this).attr('data-id')
		$('#modal-confirm').modal('toggle')
		const divId = '.post-num-' + id;
		$.ajax({
			async: true,
			headers: {
				"content-type": "application/json;charset=utf-8"	
			},
			type: "POST",
			url: "/KLTN/delete-post",
			data: id,
			success: function (response) {
				if (response === 'OK') {
					$(divId).hide()
				}
			},
			error: function (err) {
				console.log(err)
			}
		});
	});
	
	$('.delete-comment').click( function () {
		const id = $(this).attr('data-id')
		const divId = '.comment-num-' + id;
		console.log('da xoa cmt')
		$.ajax({
			async: true,
			headers: {
				"content-type": "application/json;charset=utf-8"	
			},
			type: "POST",
			url: "/KLTN/delete-comment",
			data: id,
			success: function (response) {
				if (response === 'OK') {
					$(divId).hide()
				}
			},
			error: function (err) {
				console.log(err)
			}
		});
	});
	
});