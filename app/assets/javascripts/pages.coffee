# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$document = $(document)

$document.on 'turbolinks:load', (e) ->

  count_media_blocks = ->

    media_children = $document.find(".media-block").length
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

  load_slick = ->
    $('.slider').slick
        slidesToShow: 3,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 1500,

  load_slick()

  $ ->
  timer = undefined
  el = $('.scroll')
  flag = false
  $(window).scroll ->
    if !flag
      flag = true
      el.addClass 'scrolling'
    clearTimeout timer
    timer = setTimeout((->
      el.removeClass 'scrolling'
      flag = false
      return
    ), 200)
    return
  return

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



