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
        {period: '2017-10-10',naver: 0,daum: 0},
        {period: '2017-10-11',naver: 50,daum: 15},
        {period: '2017-10-12',naver: 20,daum: 50},
        {period: '2017-10-13',naver: 60,daum: 12},
        {period: '2017-10-14',naver: 30,daum: 20},
        {period: '2017-10-15',naver: 25,daum: 80},
        {period: '2017-10-16',naver: 10,daum: 10}
      ],
      xkey: 'period',
      redraw: true,
      ykeys: ['naver', 'daum'],
      hideHover: 'auto',
      labels: ['네이버', '다음'],
      lineColors: ['#2ecc71', '#4099FF']
  });
}
