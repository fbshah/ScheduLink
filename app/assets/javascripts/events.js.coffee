# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $("#calendar").fullCalendar({
  
   events: '/events.json'
  editable: true
  eventDrop: (event, delta, revertFunc) ->
    alert event.title + ' was dropped on ' + event.start.format()
    if !confirm('Are you sure about this change?')
      revertFunc()
    return
    Integer default: 500
    Float default: .75
    Boolean default: true
    timeFormat: 'h:mm t{ - h:mm t} ',
    dragOpacity: "0.5"

    eventDrop: (event, dayDelta, minuteDelta, allDay, revertFunc) ->
      updateEvent(event);

    eventResize: (event, dayDelta, minuteDelta, revertFunc) ->
      updateEvent(event);
   customButtons: myCustomButton:
    text: 'custom!'
    click: ->
      alert 'clicked the custom button!'
      return
  header:
    left: 'prev,next today myCustomButton'
    center: 'title'
    right: 'resourceDay,month,agendaWeek,agendaDay'
  defaultView: 'agendaDay'
  default: 'Resources'
  resources: [
    {
      id: 'a'
      title: 'Brian'
    }
    {
      id: 'b'
      title: 'Carol'
    }
    {
      id: 'c'
      title: 'Edwin'
    }
    {
      id: 'd'
      title: 'Hannah'
    }
  ]


  })
