'use strict';
$(window).on('resize',function(){
  window.lineChart.redraw();
  window.lineChart2.redraw();
});

$(document).ready(function() {
  linechart1();
  linechart2();
  $("i[data-value='chart1']").on("click",linechart1);
  $("i[data-value='chart2']").on("click",linechart2);

  $('#time').timepicker({
    timeFormat: 'H:mm',
    interval: 60,
    defaultTime: '00:00',
    dynamic: true,
    dropdown: true,
    scrollbar: true
  });
});

/*line*/
function linechart1(){
  $("#line-chart1").empty();

  window.lineChart2 = Morris.Line({
      element: 'line-chart1',
      data: [
        {period: '2017-10-10',naver: 0,daum: 0},
        {period: '2017-10-11',naver: 50,daum: 15},
        {period: '2017-10-13',naver: 60,daum: 12},
        {period: '2017-10-12',naver: 20,daum: 50},
        {period: '2017-10-14',naver: 30,daum: 20},
        {period: '2017-10-15',naver: 25,daum: 80},
        {period: '2017-10-16',naver: 10,daum: 10}
      ],
      xkey: 'period',
      redraw: true,
      ykeys: ['naver', 'daum'],
      labels: ['네이버', '다음'],
      lineColors: ['#43B02A', '#0C99B4']
  });
}

function linechart2(){
  $("#line-chart2").empty();
  window.lineChart = Morris.Line({
      element: 'line-chart2',
      data: [
        {period: '2017-10-10',bolg: 0,cafe: 0,kin: 0,web:5},
        {period: '2017-10-11',bolg: 50,cafe: 15,kin: 5,web:5},
        {period: '2017-10-12',bolg: 20,cafe: 50,kin: 65,web:5},
        {period: '2017-10-13',bolg: 60,cafe: 12,kin: 7,web:5},
        {period: '2017-10-14',bolg: 30,cafe: 20,kin: 120,web:5},
        {period: '2017-10-15',bolg: 25,cafe: 80,kin: 40,web:5},
        {period: '2017-10-16',bolg: 10,cafe: 10,kin: 10,web:5}
      ],
      xkey: 'period',
      redraw: true,
      ykeys: ['bolg', 'cafe', 'kin','web'],
      labels: ['블로그', '카페', '지식인/Tip','웹문서'],
      lineColors: ['#53352E', '#E85029', '#2CAE91','#FEE103']
  });
}
