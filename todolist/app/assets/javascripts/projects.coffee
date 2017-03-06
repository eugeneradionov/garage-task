# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  jQuery ->
    $('.field').val('')
  jQuery ->
    $('.tasks').sortable
      handle: "#move_task_icon"
      items: "> div"
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize') )
#     axis: 'y'
# Axis 'y' has some bug, when you click on handle and very quick move_task_icon mouse only left or right
# not up or down element that you try to sort(drag) loose its position.
# In my case element loose centered position and become draggable only by the left side.
# That's why I commented line with axis property

$(document).ready ->
  ready()

$(document).on 'turbolinks:load ajaxSuccess ajaxComplete ajaxStart ajaxStop', ->
  ready()


#$ ->
#  $('#datepicker').datepicker()
#    showOn: 'button'
#    buttonImageOnly: true
#    buttonText: 'Select deadline'
