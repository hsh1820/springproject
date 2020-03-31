var draggedEventIsAllDay;
var activeInactiveWeekends = true;

function getDisplayEventDate(event) {

  var displayEventDate;

  if (event.allDay == 0) {
    var startTimeEventInfo = moment(event.start).format('HH:mm');
    var endTimeEventInfo = moment(event.end).format('HH:mm');
    displayEventDate = startTimeEventInfo + " - " + endTimeEventInfo;
  } else {
    displayEventDate = "하루종일";
  }

  return displayEventDate;
}

function filtering(event) {
     var show_username = true;
     var show_type = true;

     var username = $('input:checkbox.filter:checked').map(function () {
       return $(this).val();
     }).get();
     var types = $('#type_filter').val();

     show_username = username.indexOf(event.username) >= 0;

     if (types && types.length > 0) {
       if (types[0] == "all") {
         show_type = true;
       } else {
         show_type = types.indexOf(event.type) >= 0;
       }
     }

     return true;
   }


var calendar = $('#calendar').fullCalendar({

  eventRender: function (event, element, view) {

    //일정에 hover시 요약
    element.popover({
      title: $('<div />', {
        class: 'popoverTitleCalendar',
        text: event.title
      }).css({
        'background': event.backgroundColor,
        'color': event.textColor
      }),
      content: $('<div />', {
          class: 'popoverInfoCalendar'
        }).append('<p><strong>구분:</strong> ' + event.type + '</p>')
        .append('<p><strong>시간:</strong> ' + getDisplayEventDate(event) + '</p>')
        .append('<div class="popoverDescCalendar"><strong>설명:</strong> ' + event.description + '</div>'),
      delay: {
        show: "800",
        hide: "50"
      },
      trigger: 'hover',
      placement: 'top',
      html: true,
      container: 'body'
    });

    return true;

  },

  header: {
       left: 'prev,next today',
       center: 'title',
       right: 'agendaWeek'
  },
  defaultView: 'agendaWeek',
  height:650,
  views: {
    agendaWeek: {
      columnFormat: 'M/D ddd',
      titleFormat: 'YYYY년 M월 D일',
      eventLimit: false
    }
  },

  /* ****************
   *  일정 받아옴 
   * ************** */
  events: function (start, end, timezone, callback) {
     
    $.ajax({
       url: "readEvent",
       type: "POST",
       dataType : "json",
       success: function (cList) {
          
          var events=[];
          var eventList = cList;
          
          for(var i = 0; i < eventList.length; i++){
             if (eventList[i].allDay == 1 && eventList[i].start != eventList[i].end) {
                // 이틀 이상 AllDay 일정인 경우 달력에 표기시 하루를 더해야 정상출력
                eventList[i].end = moment(eventList[i].end).add(1, 'days');
             }
             
             var evt = {
                   _id : eventList[i].calendarNo,
                   title: eventList[i].calTitle, 
                   description : eventList[i].calDescription,
                   allDay: eventList[i].callAllDay,
                   start: eventList[i].calStart,
                   end: eventList[i].calEnd, 
                   backgroundColor: eventList[i].calBackColor,
                   textColor:eventList[i].calTextColor,
                   type: eventList[i].calType,
                   repeat : eventList[i].calRepeat
                };
             events.push(evt);
             
          }
          callback(events);
       }
    });
  },

  eventAfterAllRender: function (view) {
    if (view.name == "month") {
      $(".fc-content").css('height', 'auto');
    }
  },

  locale: 'ko',
  timezone: "local",
  nextDayThreshold: "09:00:00",
  allDaySlot: true,
  displayEventTime: true,
  displayEventEnd: true,
  firstDay: 0, //월요일이 먼저 오게 하려면 1
  weekNumbers: false,
  weekNumberCalculation: "ISO",
  eventLimit: true,
  views: {
    month: {
      eventLimit: 12
    }
  },
  eventLimitClick: 'week', //popover
  navLinks: true,
  timeFormat: 'HH:mm',
  defaultTimedEventDuration: '01:00:00',
  minTime: '00:00:00',
  maxTime: '24:00:00',
  slotLabelFormat: 'HH:mm',
  weekends: true,
  nowIndicator: true,
  dayPopoverFormat: 'MM/DD dddd',
  longPressDelay: 0,
  eventLongPressDelay: 0,
  selectLongPressDelay: 0
});