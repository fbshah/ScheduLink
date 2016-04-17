        $(function() { // document ready
var myCalendar = $('#my-calendar-id'); 
myCalendar.fullCalendar();
var myEvent = {
  title:"my new event",
  allDay: true,
  start: new Date(),
  end: new Date()
};
myCalendar.fullCalendar( 'renderEvent', myEvent );
            $('#calendar').fullCalendar({
                

                events: '/events.json',


                defaultView: 'agendaDay',
                editable: true,
                selectable: true,
                eventLimit: true,
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'agendaDay,agendaSevenDay'
                },
                views: {
                    agendaSevenDay: {
                        type: 'agenda',
                        duration: { days: 7 },
                        groupByResource: false
                    }
                },

                //// uncomment this line to hide the all-day slot
                allDaySlot: false,

                events: [
                    { id: '1', resourceId: 'a', start: '2016-04-17', end: '2016-04-19', title: 'event 1' },
                    { id: '2', resourceId: 'a', start: '2016-04-18T09:00:00', end: '2016-04-19T14:00:00', title: 'event 2' },
                    { id: '3', resourceId: 'b', start: '2016-04-17T12:00:00', end: '2016-04-17T06:00:00', title: 'event 3' },
                    { id: '4', resourceId: 'c', start: '2015-12-07T07:30:00', end: '2015-12-07T09:30:00', title: 'event 4' },
                    { id: '5', resourceId: 'd', start: '2015-12-07T10:00:00', end: '2015-12-07T15:00:00', title: 'event 5' }
                ],
               

                resources: function (callBack) {
                    callBack([
                        { id: 'a', title: 'Room A', altTitle: 'Sophie' },
                        { id: 'b', title: 'Room B', altTitle: 'Reshma' , eventColor: 'green' },
                        { id: 'c', title: 'Room C', altTitle: 'Carol' , eventColor: 'orange' },
                        { id: 'd', title: 'Room D', altTitle: 'Rashid' , eventColor: 'red' }
                    ]);
                },
                resourceRender: function (dataTds, eventTd) {
                    console.log('resourcerender');
                    console.log(eventTd);
                    console.log(dataTds);
                    var textElement = eventTd.empty();
                    textElement.append('<b>' + dataTds.altTitle + '</b>');
                },
            });

        });