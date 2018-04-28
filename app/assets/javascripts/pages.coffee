# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$document = $(document)
console.log(' Document ',$document)

$document.on 'turbolinks:load', (e) ->

  count_media_blocks = ->

    media_children = $document.find(".media-block").length
    console.log(' number of Photos', media_children)
    if media_children < 3
      $('.media-buttons a').toggleClass('invisible')
    else if media_children > 3
      $('.media-buttons a').removeClass('invisible')
    return

  count_media_blocks()

  detect_Hover = ->

    if $('#media').hasClass('grid2')
      $('.media-buttons a').removeClass 'active'
      $('.media-buttons a.show-grid2').addClass 'active'
    else
      $('.media-buttons a').removeClass 'active'
      $('.media-buttons a.show-grid3').addClass 'active'
    return

  detect_Hover()



$(document).on 'click', 'a.hamburger', (e) ->

  e.preventDefault()
  $(this).toggleClass 'is-active'
  $('.menu').toggleClass 'menu__visible'
  $('.wrapper').toggleClass 'open-menu'
  $('body').toggleClass 'open-menu'

$(document).on 'click', '.media-buttons a', (e) ->

  $('.media-buttons a').removeClass('active')

  if $(this).hasClass('show-grid2')
    $(this).addClass('active')
    $('#media').removeClass('grid3').addClass 'grid2'
  else if $(this).hasClass('show-grid3')
    $(this).addClass('active')
    $('#media').removeClass('grid2').addClass 'grid3'
  return
