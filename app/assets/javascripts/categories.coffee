# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
 $currentElement = $('.category').first()
 $('.scroll').click ->
  $nextElement = $currentElement.next('.category')
  console.log(' Next element ! ',$nextElement)
  # Check if next element actually exists
  if $nextElement.length
    # If yes, update:
    # 1. $currentElement
    # 2. Scroll position
    $currentElement = $nextElement
    console.log(' Current Element! ',$currentElement)
    $('html, body').stop(true).animate { scrollTop: $nextElement.offset().top }, 1000
  false
