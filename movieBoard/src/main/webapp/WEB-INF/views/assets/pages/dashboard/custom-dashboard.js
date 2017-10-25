"use strict";

$(window).resize(function(){
  //dashboard card width size
  cardResize();
  window.areaChart.redraw();
});

$(document).ready(function() {
  //dashboard card width size
  cardResize();

  // Calender js
  $('.dashboard-calender').pignoseCalendar();

  areaChart();
});

function cardResize(){
  setTimeout(function(){
    if($(".page-body > .row").width() > 1200){
      var card = Math.ceil($(".page-body > .row").width()/5)-3;
      $(".main-card").css("max-width",card);
    }
  }, 400);

}

/*Area chart*/
function areaChart() {
    window.areaChart = Morris.Area({
      element: 'morris-extra-area',
      data: [
        {period: '2017-10-10 00:00:00',portal: 0,cumminty: 0,sns: 0},
        {period: '2017-10-10 01:00:00',portal: 1,cumminty: 2,sns: 0},
        {period: '2017-10-10 02:00:00',portal: 2,cumminty: 0,sns: 2},
        {period: '2017-10-10 03:00:00',portal: 10,cumminty: 10,sns: 0},
        {period: '2017-10-10 04:00:00',portal: 0,cumminty: 0,sns: 0},
        {period: '2017-10-10 05:00:00',portal: 10,cumminty: 0,sns: 0},
        {period: '2017-10-10 06:00:00',portal: 0,cumminty: 0,sns: 0},
        {period: '2017-10-10 07:00:00',portal: 0,cumminty: 20,sns: 0},
        {period: '2017-10-10 08:00:00',portal: 20,cumminty: 0,sns: 0},
        {period: '2017-10-10 09:00:00',portal: 0,cumminty: 4,sns: 0},
        {period: '2017-10-10 10:00:00',portal: 5,cumminty: 0,sns: 20},
        {period: '2017-10-10 11:00:00',portal: 0,cumminty: 0,sns: 0},
        {period: '2017-10-10 12:00:00',portal: 0,cumminty: 10,sns: 0},
        {period: '2017-10-10 13:00:00',portal: 0,cumminty: 0,sns: 0},
        {period: '2017-10-10 14:00:00',portal: 0,cumminty: 0,sns: 0},
        {period: '2017-10-10 15:00:00',portal: 0,cumminty: 0,sns: 0},
        {period: '2017-10-10 16:00:00',portal: 0,cumminty: 0,sns: 0},
        {period: '2017-10-10 17:00:00',portal: 0,cumminty: 0,sns: 0},
        {period: '2017-10-10 18:00:00',portal: 0,cumminty: 0,sns: 0},
        {period: '2017-10-10 19:00:00',portal: 0,cumminty: 0,sns: 0},
        {period: '2017-10-10 20:00:00',portal: 0,cumminty: 0,sns: 0},
        {period: '2017-10-10 21:00:00',portal: 0,cumminty: 0,sns: 0},
        {period: '2017-10-10 22:00:00',portal: 0,cumminty: 0,sns: 0},
        {period: '2017-10-10 23:00:00',portal: 0,cumminty: 0,sns: 0}
      ],
      lineColors: ['#fb9678', '#7E81CB', '#01C0C8'],
      xkey: 'period',
      ykeys: ['portal', 'cumminty', 'sns'],
      labels: ['포털', '커뮤니티', 'SNS'],
      pointSize: 0,
      lineWidth: 0,
      resize: true,
      fillOpacity: 0.8,
      behaveLikeLine: true,
      gridLineColor: '#5FBEAA',
      hideHover: 'auto'

    });

}
