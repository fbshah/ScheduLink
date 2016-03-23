# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#calendar").fullCalendar({
   events: '/events.json'
   customButtons: myCustomButton:
    text: 'custom!'
    click: ->
      alert 'clicked the custom button!'
      return
  header:
    left: 'prev,next today myCustomButton'
    center: 'title'
    right: 'month,agendaWeek,agendaDay'
  
  })
