# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
 $('a.hamburger').on 'click', (e) ->
  e.preventDefault()
  $(this).toggleClass 'is-active'
  $('.menu').toggleClass 'menu__visible'
  $('#wrapper').toggleClass 'fixed'

 $('.media-buttons i').on 'click', (e) ->
  $('.media-buttons i').removeClass('active')
  if $(this).hasClass('show-grid2')
    $(this).addClass('active')
    $('.media').removeClass('grid3').addClass 'grid2'
  else if $(this).hasClass('show-grid3')
    $(this).addClass('active')
    $('.media').removeClass('grid2').addClass 'grid3'
  return
