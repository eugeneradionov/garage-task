# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  jQuery ->
    $('.field').val('')
  jQuery ->
    $('.tasks').sortable
      axis: 'y'
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize') )

$(document).ready(ready)
$(document).on 'turbolinks:load', ->
  ready()
