$( document ).ready(function(){
    $('.select2').select2();
    $('.date').datepicker({
        language: "pl",
        format: "yyyy-mm-dd",
        todayHighlight: true,
        autoclose: true
    });
});

$.fn.modal.Constructor.prototype.enforceFocus = function() {};