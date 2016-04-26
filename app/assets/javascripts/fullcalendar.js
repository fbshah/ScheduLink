$(function() {
            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();



        $('#rota').fullCalendar({
            editable:true,
            theme: true,
            eventOverlap: false,
                defaultView: 'agendaWeek',
                views: {
                timelineThreeDays: {
                type: 'timelineDay',
                duration: { days: 3 }
                    }
                },
                events: {
                    url: '/shifts.json',
                }
                    
                

    });

    $(function() { // dom ready

            $('#calendar').fullCalendar({
                resourceAreaWidth: 230,
                editable: true,
                aspectRatio: 1.5,
                scrollTime: '00:00',
                header: {
                    left: 'today prev,next',
                    center: 'title',
                    right: 'agendaDay,agendaThreeDays,agendaWeek,month'
                },
              
                defaultView: 'agendaWeek',
                        defaultView: 'agendaWeek',
                /*
                    selectable:true will enable user to select datetime slot
                    selectHelper will add helpers for selectable.
                */
                selectable: true,
                selectHelper: true,
                /*
                    when user select timeslot this option code will execute.
                    It has three arguments. Start,end and allDay.
                    Start means starting time of event.
                    End means ending time of event.
                    allDay means if events is for entire day or not.
                */
                select: function(start, end, allDay)
                {
                    /*
                        after selection user will be promted for enter title for event.
                    */
                    var title = prompt('Shift Title:');
                    /*
                        if title is enterd calendar will add title and event into fullCalendar.
                    */
                    if (title)
                    {
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
               
                events: '/events.json'
            });

        });

$('#rotaa').fullCalendar({
                resourceAreaWidth: 230,
                editable: true,
                aspectRatio: 1.5,
                scrollTime: '00:00',
                header: {
                    left: 'promptResource today prev,next',
                    center: 'title',
                    right: 'timelineDay,timelineThreeDays,agendaWeek,month'
                },
                customButtons: {
                    promptResource: {
                        text: '+ room',
                        click: function() {
                            var title = prompt('Room name');
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
                defaultView: 'timelineDay',
                views: {
                    timelineThreeDays: {
                        type: 'timeline',
                        duration: { days: 3 }
                    }
                },
                resourceLabelText: 'Rooms',
                resources: [
                    { id: 'a', title: 'Auditorium A' },
                    { id: 'b', title: 'Auditorium B', eventColor: 'green' },
                    { id: 'c', title: 'Auditorium C', eventColor: 'orange' },
                    { id: 'd', title: 'Auditorium D', children: [
                        { id: 'd1', title: 'Room D1' },
                        { id: 'd2', title: 'Room D2' }
                    ] },
                    { id: 'e', title: 'Auditorium E' },
                    { id: 'f', title: 'Auditorium F', eventColor: 'red' },
                    { id: 'g', title: 'Auditorium G' },
                    { id: 'h', title: 'Auditorium H' },
                    { id: 'i', title: 'Auditorium I' },
                    { id: 'j', title: 'Auditorium J' },
                    { id: 'k', title: 'Auditorium K' },
                    { id: 'l', title: 'Auditorium L' },
                    { id: 'm', title: 'Auditorium M' },
                    { id: 'n', title: 'Auditorium N' },
                    { id: 'o', title: 'Auditorium O' },
                    { id: 'p', title: 'Auditorium P' },
                    { id: 'q', title: 'Auditorium Q' },
                    { id: 'r', title: 'Auditorium R' },
                    { id: 's', title: 'Auditorium S' },
                    { id: 't', title: 'Auditorium T' },
                    { id: 'u', title: 'Auditorium U' },
                    { id: 'v', title: 'Auditorium V' },
                    { id: 'w', title: 'Auditorium W' },
                    { id: 'x', title: 'Auditorium X' },
                    { id: 'y', title: 'Auditorium Y' },
                    { id: 'z', title: 'Auditorium Z' }
                ],
                events: [
                    {  start: '2016-04-25T06:00:00', end: '2016-04-25T10:30:00', title: 'event 1' },
                ],
            });

      


});