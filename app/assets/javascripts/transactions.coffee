# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  # Initialize the date picker
  $('.datepicker').pickadate(
    selectMonths: true
    selectYears: 15
  )

  checkRepetitionDropdown = (elem) ->
    if elem.val() != 'single'
      $('.datepicker-container').hide()
      $('.datepicker').pickadate('clear')
    else
      $('.datepicker-container').show()

  $('select.repetition-dropdown').change ->
    elem = $(@)

    checkRepetitionDropdown(elem)

  # Need to do this in case of editing a transaction
  repetitionElem = $('select.repetition-dropdown')

  checkRepetitionDropdown(repetitionElem)
