var eventModal = $('#eventModal');

var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay');
var editTitle = $('#edit-title');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editType = $('#edit-type');
var editRepeat = $('#edit-repeat');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');
 

/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function (start, end, eventType) {

    $("#contextMenu").hide(); //메뉴 숨김

    modalTitle.html('새로운 일정');
    editStart.val(start);
    editEnd.val(end);
    editType.val(eventType).prop("selected", true);

    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');

    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {

        var eventData = {

            title: editTitle.val(),
            start: editStart.val(),
            end: editEnd.val(),
            description: editDesc.val(),
            type: editType.val(),
            repeat:editRepeat.val(),
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            allDay: 0
        };

        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.title == '') {
            alert('일정명은 필수입니다.');
            return false;
        }

        var realEndDay;

      /*  
        if (editAllDay.is(':checked')){
            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
        } else{
           eventData.end = moment(eventData.end).format('YYYY-MM-DD HH:mm');
            
        }*/
        
        
        if (editAllDay.is(':checked')) {
            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
            //render시 날짜표기수정
            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
            //console.log(eventData.end);
            
            //DB에 넣을때(선택)
            realEndDay = moment(eventData.end).format('YYYY-MM-DD');

            eventData.allDay = 1;
        }
        
        
        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        editAllDay.prop('checked', 0);
        eventModal.modal('hide');
        
        //새로운 일정 저장
        $.ajax({
           
           url: "insertEvent",
            type: "post",
            data: {
                "calTitle" : eventData.title,
                "calDescription" : eventData.description,
                "calStart" : eventData.start, 
                "calEnd" : eventData.end,
                "calType" : eventData.type,
                "calRepeat" : eventData.repeat,
                "calBackColor" : eventData.backgroundColor,
                "callAllDay" : eventData.allDay
              },
            success: function (calendar) {
                
                //DB연동시 중복이벤트 방지를 위한
                $('#calendar').fullCalendar('removeEvents');
                $('#calendar').fullCalendar('refetchEvents');
                

            }
              
              
        });
    });
};