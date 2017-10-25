'use strict';
$(window).on('resize',function(){
  setTimeout(function(){
    window.lineChart.redraw();
  }, 500);
});

$(document).ready(function() {
  linechart();
});

/*line*/
function linechart(){
  window.lineChart = Morris.Line({
      element: 'line-chart1',
      data: [
        {period: '2017-10-10',Facebook: 0,Twitter: 0,Instagram: 0},
        {period: '2017-10-11',Facebook: 50,Twitter: 15,Instagram: 5},
        {period: '2017-10-12',Facebook: 20,Twitter: 50,Instagram: 65},
        {period: '2017-10-13',Facebook: 60,Twitter: 12,Instagram: 7},
        {period: '2017-10-14',Facebook: 30,Twitter: 20,Instagram: 120},
        {period: '2017-10-15',Facebook: 25,Twitter: 80,Instagram: 40},
        {period: '2017-10-16',Facebook: 10,Twitter: 10,Instagram: 10}
      ],
      xkey: 'period',
      redraw: true,
      ykeys: ['Facebook', 'Twitter', 'Instagram'],
      hideHover: 'auto',
      labels: ['페이스북', '트위터', '인스타그램'],
      lineColors: ['#3B5998', '#4099FF', '#8632fb']
  });
}