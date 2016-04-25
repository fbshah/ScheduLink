$(function() { // document ready

    $('#calendar').fullCalendar({
      editable: true, // enable draggable events
      aspectRatio: 1.8,
      scrollTime: '00:00', // undo default 6am scrollTime
      header: {
        left: 'today prev,next',
        center: 'title',
        right: 'timelineDay,timelineThreeDays,agendaWeek,month'
      },
      defaultView: 'timelineDay',
      views: {
        timelineThreeDays: {
          type: 'timeline',
          duration: { days: 3 }
        }
      },
      resourceLabelText: 'Rooms',

      resources: { // you can also specify a plain string like 'json/resources.json'
        url: 'json/resources.json',
        error: function() {
          $('#script-warning').show();
        }
      },

      events: { // you can also specify a plain string like 'json/events.json'
        url: 'json/events.json',
        error: function() {
          $('#script-warning').show();
        }
      }
    });
  
  });
