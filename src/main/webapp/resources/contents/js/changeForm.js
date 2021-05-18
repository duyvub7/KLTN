$(document).ready(function () {

    $('#type1').click( function () {
        $('#textbox').modal()
        $('#title-modal').html('Chia sẻ cảm nhận của bạn')
        $('#option-area').hide()
        $('#add-post-form').attr('action', 'add-post')
    });

    $('#type2').click( function () {
        $('#textbox').modal()
        $('#title-modal').html('Đăng bài cho thuê phòng trọ')
        $('#modal-price').html('Giá tiền / tháng')
        $('#option-area').show()
        $('#add-post-form').attr('action', 'add-emptyroom')
    });

    $('#type3').click( function () {
        $('#textbox').modal()
        $('#title-modal').html('Đăng bài tìm người ở ghép')
        $('#modal-price').html('Giá tiền / tháng')
        $('#option-area').show()
        $('#add-post-form').attr('action', 'add-shareroom')
    });

    $('#type4').click( function () {
        $('#textbox').modal()
        $('#title-modal').html('Đăng bài bán lại đồ dùng')
        $('#modal-price').html('Giá tiền (không bắt buộc)')
        $('#option-area').show()
        $('#add-post-form').attr('action', 'add-utensil')
    });

    $('#tab2').click( function () {
        $('#title-modal').html('Chia sẻ cảm nhận của bạn')
        $('#option-area').hide()
        $('#add-post-form').attr('action', 'add-post')
    });
    $('#tab3').click( function () {
        $('#title-modal').html('Đăng bài cho thuê phòng trọ')
        $('#modal-price').html('Giá tiền / tháng')
        $('#option-area').show()
        $('#add-post-form').attr('action', 'add-emptyroom')
    });
    $('#tab4').click( function () {
        $('#title-modal').html('Đăng bài tìm người ở ghép')
        $('#modal-price').html('Giá tiền / tháng')
        $('#option-area').show()
        $('#add-post-form').attr('action', 'add-shareroom')
    });
    $('#tab5').click( function () {
        $('#title-modal').html('Đăng bài bán lại đồ dùng')
        $('#modal-price').html('Giá tiền (không bắt buộc)')
        $('#option-area').show()
        $('#add-post-form').attr('action', 'add-utensil')
    });
});