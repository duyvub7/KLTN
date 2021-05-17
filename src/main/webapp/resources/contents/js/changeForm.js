$(document).ready(function () {
    $('#type1').click( function () {
        $('#textbox').modal()
        $('#title-modal').html('Chia sẻ cảm nhận của bạn')
        $('#option-area').hide()
        $('#add-post-form').attr('action', 'addpost1')
        let ss = $('#add-post-form').attr('action')
        console.log(ss)
    });

    $('#type2').click( function () {
        $('#textbox').modal()
        $('#title-modal').html('Đăng bài cho thuê phòng trọ')
        $('#modal-price').html('Giá tiền / tháng')
        $('#option-area').show()
        $('#add-post-form').attr('action', 'addpost2')
        let ss = $('#add-post-form').attr('action')
        console.log(ss)
    });

    $('#type3').click( function () {
        $('#textbox').modal()
        $('#title-modal').html('Đăng bài tìm người ở ghép')
        $('#modal-price').html('Giá tiền / tháng')
        $('#option-area').show()
        $('#add-post-form').attr('action', 'addpost3')
        let ss = $('#add-post-form').attr('action')
        console.log(ss)
    });

    $('#type4').click( function () {
        $('#textbox').modal()
        $('#title-modal').html('Đăng bài bán lại đồ dùng')
        $('#modal-price').html('Giá tiền (không bắt buộc)')
        $('#option-area').show()
        $('#add-post-form').attr('action', 'addpost4')
        let ss = $('#add-post-form').attr('action')
        console.log(ss)
    });

    $('#tab2').click( function () {
        $('#title-modal').html('Chia sẻ cảm nhận của bạn')
        $('#option-area').hide()
        $('#add-post-form').attr('action', 'addpost1')
        let ss = $('#add-post-form').attr('action')
        console.log(ss)
    });
    $('#tab3').click( function () {
        $('#title-modal').html('Đăng bài cho thuê phòng trọ')
        $('#modal-price').html('Giá tiền / tháng')
        $('#option-area').show()
        $('#add-post-form').attr('action', 'addpost2')
        let ss = $('#add-post-form').attr('action')
        console.log(ss)
    });
    $('#tab4').click( function () {
        $('#title-modal').html('Đăng bài tìm người ở ghép')
        $('#modal-price').html('Giá tiền / tháng')
        $('#option-area').show()
        $('#add-post-form').attr('action', 'addpost3')
        let ss = $('#add-post-form').attr('action')
        console.log(ss)
    });
    $('#tab5').click( function () {
        $('#title-modal').html('Đăng bài bán lại đồ dùng')
        $('#modal-price').html('Giá tiền (không bắt buộc)')
        $('#option-area').show()
        $('#add-post-form').attr('action', 'addpost4')
        let ss = $('#add-post-form').attr('action')
        console.log(ss)
    });
});