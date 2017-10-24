'use strict';
$(window).on('resize',function(){
  setTimeout(function(){
    cardResize();
    window.lineChart.redraw();
  }, 500);
});

$(document).ready(function() {
  cardResize();
  linechart();
});

/*line*/
function linechart(){
  window.lineChart = Morris.Line({
      element: 'line-chart1',
      data: [
        {period: '2017-10-10',l1: 0,l2: 0,l3: 0,l4:0},
        {period: '2017-10-11',l1: 50,l2: 15,l3: 5,l4:0},
        {period: '2017-10-12',l1: 20,l2: 50,l3: 65,l4:0},
        {period: '2017-10-13',l1: 60,l2: 12,l3: 7,l4:0},
        {period: '2017-10-14',l1: 30,l2: 20,l3: 120,l4:0},
        {period: '2017-10-15',l1: 25,l2: 80,l3: 40,l4:0},
        {period: '2017-10-16',l1: 10,l2: 10,l3: 10,l4:0}
      ],
      xkey: 'period',
      redraw: true,
      ykeys: ['l1', 'l2', 'l3', 'l4'],
      hideHover: 'auto',
      labels: ['좋은글', '나쁜글', '관심글', '기타'],
      lineColors: ['#2ecc71', '#e74c3c', '#3498DB','#f1c40f']
  });
}
/* card resize*/
function cardResize(){
  setTimeout(function(){
    if($(".tab-pane > .row").width() > 1200){
      var card = Math.ceil($(".tab-pane > .row").width()/5)-2;
      $(".main-card").css("min-width",card);
    }
  }, 400);

}
