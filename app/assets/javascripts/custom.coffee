$ ->
  bind_inputs()
  $.fn.modal.Constructor::enforceFocus = ->

@bind_inputs = (id) ->
  id ||= ''
  $("#{id} .select2").select2()
  $("#{id} .date").datepicker({
    language: "pl",
    format: "yyyy-mm-dd",
    todayHighlight: true,
    autoclose: true
  })