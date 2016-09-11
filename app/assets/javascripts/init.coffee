window.App ||= {}

App.init = ->
  $(".scroll-to").on "click", (e) ->
    e.preventDefault()
    $("body").animate
      scrollTop: $($(this).data('to')).offset().top - 64
      400
  Materialize.updateTextFields()
  $(".button-collapse").sideNav()

$(document).on "turbolinks:load", ->
  App.init()