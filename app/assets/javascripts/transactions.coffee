# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  # Initialize the date picker
  $('.datepicker').pickadate(
    selectMonths: true
    selectYears: 15
  )

  $('select.repetition-dropdown').change ->
    elem = $(@)

    if elem.val() != 'single'
      $('.datepicker-container').hide()
      $('.datepicker').pickadate('clear')
    else
      $('.datepicker-container').show()
      $('.datepicker').pickadate('clear')
