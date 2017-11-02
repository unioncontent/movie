"use strict";
$(window).resize(function(){
  window.areaChart.redraw();
});

$(document).ready(function() {
  areaChart1();
  pieChart();
  $("i[data-value='chart1']").on("click",pieChart);
  $("i[data-value='chart2']").on("click",areaChart1);
});

/*pie chart*/
function pieChart(){
  $("#chart").empty();
  c3.generate({
    bindto: '#chart',//chart id
    data: {
        columns: [
            ['전체', 30],
            ['영화', 10],
            ['배우', 60],
        ],
        type: 'donut',
        // onclick: function(d, i) { console.log("onclick", d, i); },
        // onmouseover: function(d, i) { console.log("onmouseover", d, i); },
        // onmouseout: function(d, i) { console.log("onmouseout", d, i); }
    },
    color: {
        pattern: ['#4C5667', '#1ABC9C','#FF9F55']
    },
    donut: {
        title: "PC 메인노출량"
    }
  });
}
/*Area chart*/
function areaChart1() {
  $("#morris-extra-area").empty();
  window.areaChart = Morris.Area({
      element: 'morris-extra-area',
      data: [
        {period: '2017-10-10 00:00:00',total: 0,matching: 0},
        {period: '2017-10-10 01:00:00',total: 1,matching: 2},
        {period: '2017-10-10 02:00:00',total: 2,matching: 0},
        {period: '2017-10-10 03:00:00',total: 10,matching: 0},
        {period: '2017-10-10 04:00:00',total: 0,matching: 0},
        {period: '2017-10-10 05:00:00',total: 10,matching: 0},
        {period: '2017-10-10 06:00:00',total: 0,matching: 0},
        {period: '2017-10-10 07:00:00',total: 0,matching: 20},
        {period: '2017-10-10 08:00:00',total: 20,matching: 0},
        {period: '2017-10-10 09:00:00',total: 0,matching: 4},
        {period: '2017-10-10 10:00:00',total: 5,matching: 0},
        {period: '2017-10-10 11:00:00',total: 0,matching: 0},
        {period: '2017-10-10 12:00:00',total: 0,matching: 0},
        {period: '2017-10-10 13:00:00',total: 0,matching: 0},
        {period: '2017-10-10 14:00:00',total: 0,matching: 0},
        {period: '2017-10-10 15:00:00',total: 0,matching: 0},
        {period: '2017-10-10 16:00:00',total: 0,matching: 0},
        {period: '2017-10-10 17:00:00',total: 0,matching: 0},
        {period: '2017-10-10 18:00:00',total: 0,matching: 0},
        {period: '2017-10-10 19:00:00',total: 0,matching: 0},
        {period: '2017-10-10 20:00:00',total: 0,matching: 0},
        {period: '2017-10-10 21:00:00',total: 0,matching: 0},
        {period: '2017-10-10 22:00:00',total: 0,matching: 0},
        {period: '2017-10-10 23:00:00',total: 0,matching: 0}
      ],
      lineColors: ['#4C5667', '#1ABC9C'],
      xkey: 'period',
      ykeys: ['total', 'matching'],
      labels: ['전체', '매칭'],
      pointSize: 0,
      lineWidth: 0,
      resize: true,
      fillOpacity: 0.8,
      behaveLikeLine: true,
      gridLineColor: '#5FBEAA',
      hideHover: 'auto'
    });
}
