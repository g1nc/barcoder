window.App ||= {}

App.init = ->
  $(".scroll-to").on "click", (e) ->
    e.preventDefault()
    $("body").animate
      scrollTop: $($(this).data('to')).offset().top - 64
      400
  Materialize.updateTextFields()
  $(".button-collapse").sideNav()
  $('select').material_select()
  $('.datepicker').pickadate({
      selectMonths: true,
      selectYears: 15
  })
  $('ul.tabs').tabs()

$(document).on "turbolinks:load", ->
  App.init()