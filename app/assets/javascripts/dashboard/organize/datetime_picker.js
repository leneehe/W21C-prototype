$(function () {
  $('input#event_end').bootstrapMaterialDatePicker({
    weekStart: 1,
    format : 'DD MMMM YYYY - HH:mm',
    shortTime: true,
    nowButton : true
  });

  $('input#event_start').bootstrapMaterialDatePicker({
    weekStart: 1,
    format : 'DD MMMM YYYY - HH:mm',
    shortTime: true,
    nowButton : true
  });
})
