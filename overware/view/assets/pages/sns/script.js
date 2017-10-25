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
        {period: '2017-10-10',l1: 0,l2: 0,l3: 0},
        {period: '2017-10-11',l1: 50,l2: 15,l3: 5},
        {period: '2017-10-12',l1: 20,l2: 50,l3: 65},
        {period: '2017-10-13',l1: 60,l2: 12,l3: 7},
        {period: '2017-10-14',l1: 30,l2: 20,l3: 120},
        {period: '2017-10-15',l1: 25,l2: 80,l3: 40},
        {period: '2017-10-16',l1: 10,l2: 10,l3: 10}
      ],
      xkey: 'period',
      redraw: true,
      ykeys: ['l1', 'l2', 'l3'],
      hideHover: 'auto',
      labels: ['좋아요', '공유', '댓글'],
      lineColors: ['#fb9678', '#7E81CB', '#01C0C8']
  });
}
