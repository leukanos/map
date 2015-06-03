$ ->
  bind_inputs()
  $.fn.modal.Constructor::enforceFocus = ->
  gritter_setup()

@bind_inputs = (id) ->
  id ||= ''
  $("#{id} .select2").select2()
  $("#{id} .date").datepicker({
    language: "pl",
    format: "yyyy-mm-dd",
    todayHighlight: true,
    autoclose: true
  })

@gritter_setup = ->
  jQuery.extend $.gritter.options,
    time: 1500
    position: 'bottom-left'