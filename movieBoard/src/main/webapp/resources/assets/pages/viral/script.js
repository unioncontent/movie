'use strict';

$(document).ready(function() {

  $('#time').timepicker({
    timeFormat: 'h:mm p',
    interval: 60,
    minTime: '00:00',
    maxTime: '24:00',
    defaultTime: '12:00',
    startTime: '00:00',
    dynamic: true,
    dropdown: true,
    scrollbar: true
  });
});

