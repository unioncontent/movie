$(document).ready(function() {
  $('[data-toggle="tooltip"]').tooltip();
  $('#time').timepicker({
    timeFormat: 'h:mm p',
    interval: 60,
    minTime: '12:00am',
    maxTime: '11:00pm',
    defaultTime: '12:00am',
    startTime: '12:00am',
    dynamic: true,
    dropdown: true,
    scrollbar: true
  });
});
