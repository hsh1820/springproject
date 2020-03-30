//SELECT 색 변경
$('#edit-color').change(function () {
    $(this).css('color', $(this).val());
});

//datetimepicker
$("#edit-start, #edit-end").datetimepicker({
    format: 'YYYY-MM-DD HH:mm'
});