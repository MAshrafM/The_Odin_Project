# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$("#new_post").on("ajax:error", (e, data, status, xhr) ->
 $("#errors ul").append('<li>' + data.responseJSON + '</li>')
)