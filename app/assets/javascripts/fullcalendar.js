$(document).ready(function() {

            var calendar = $('#calendar').fullCalendar({
                defaultView: 'timelineDay',
                    resourceAreaWidth: 230,
    editable: true,
    aspectRatio: 1.5,
    scrollTime: '00:00',
                header: {
                    left: 'promptResource prev,next today',
                    center: 'title',
                    right: 'month,timelineWeek,timelineDay'
                        },
                            customButtons: {
      promptResource: {
        text: 'Add employee Name',
        click: function() {
          var title = prompt('Enter Name');
          if (title) {
            $('#calendar').fullCalendar(
              'addResource',
              { title: title },
              true // scroll to the new resource?
            );
          }
        }
      }
    },
                    selectable: true,
                    selectHelper: true,

                select: function(start, end, allDay) {
                        var title = prompt('Event Title:');
                        if (title) {
                            calendar.fullCalendar('renderEvent',
                            {
                                title: title,
                                start: start,
                                end: end,
                                allDay: allDay
                            },
                            true // make the event "stick"
                            );
                            }
                            calendar.fullCalendar('unselect');
                        },
                                editable: true,

                                eventSources: [
                                    {
                                            url: '/events.json',
                                            type: 'GET',
                                            data: {
                                                start: 'start',
                                                end: 'end',
                                                id: 'id',
                                                title: 'title',
                                                allDay: 'allDay'
                                            },
                                            error: function () {
                                                alert('there was an error while fetching events!');
                                            }
                                    }
                            ] 

                    });
            });