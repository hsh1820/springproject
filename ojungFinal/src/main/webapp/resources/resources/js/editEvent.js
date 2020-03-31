// 이벤트 수정
var editEvent = function (event, element, view) {
	
	 $('#deleteEvent').data('id', event._id); 

    $('.popover.fade.top').remove();
    $(element).popover("hide");

    if (event.allDay == 1) {
        editAllDay.prop('checked', 1);
    } else {
        editAllDay.prop('checked', 0);
    }

    if (event.end == null) {
        event.end = event.start;
    }

    if (event.allDay == 1 && event.end != event.start) {
        editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD'))
    } else {
        editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
    }

    modalTitle.html('일정 수정');
    editTitle.val(event.title);
    editStart.val(event.start.format('YYYY-MM-DD HH:mm'));
    editType.val(event.type);
    editDesc.val(event.description);
    editColor.val(event.backgroundColor).css('color', event.backgroundColor);

    addBtnContainer.hide();
    modifyBtnContainer.show();
    eventModal.modal('show');

    //업데이트 버튼 클릭시
    $('#updateEvent').unbind();
    $('#updateEvent').on('click', function () {

        if (editStart.val() > editEnd.val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (editTitle.val() == '') {
            alert('일정명은 필수입니다.')
            return false;
        }

        var statusAllDay;
        var startDate;
        var endDate;
        var displayDate;

        if (editAllDay.is(':checked')) {
            statusAllDay = 1;
            startDate = moment(editStart.val()).format('YYYY-MM-DD');
            endDate = moment(editEnd.val()).format('YYYY-MM-DD');
            displayDate = moment(editEnd.val()).add(1, 'days').format('YYYY-MM-DD');
        } else {
            statusAllDay = 0;
            startDate = editStart.val();
            endDate = editEnd.val();
            displayDate = endDate;
        }

        eventModal.modal('hide');

        event.allDay = statusAllDay;
        event.title = editTitle.val();
        event.start = startDate;
        event.end = displayDate;
        event.type = editType.val();
        event.backgroundColor = editColor.val();
        event.description = editDesc.val();

        $("#calendar").fullCalendar('updateEvent', event);

        //일정 업데이트
        $.ajax({
        	url: "updateEvent",
            type: "post",
            data: {
            	 "calendarNo": event._id,
            	 "calTitle" : event.title,
                 "calDescription" : event.description,
                 "calStart" : event.start,
                 "calEnd" : event.end,
                 "calType" : event.type,
                 "calRepeat" : event.repeat,
                 "calBackColor" : event.backgroundColor,
                 "callAllDay" : event.allDay
            },
            success: function (response) {
                alert('수정되었습니다.')
            }
        });

    });
	

    // 삭제버튼
    $('#deleteEvent').unbind();
    $('#deleteEvent').on('click', function () { 
    	
    	$("#calendar").fullCalendar('removeEvents', $(this).data('id')); 
    	 eventModal.modal('hide'); 

        $.ajax({
        	url: "deleteEvent",
            type: "get",
            data: {
            	"calendarNo": $(this).data('id')
            },
            success: function (response) {
            	alert('삭제되었습니다.');

            }
        });
    });
};