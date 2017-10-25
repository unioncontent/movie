'use strict';
$(window).on('resize',function(){
  setTimeout(function(){
    window.lineChart.redraw();
  }, 500);
});

$(document).ready(function() {
  linechart();
  bartChart();

  /* 테이블 정렬 */
  $(".sort").on("click",function(){
    if($(this).children("i").eq(0).hasClass("on")){
      $(this).children("i").eq(0).removeClass("on");
      $(this).children("i").eq(1).addClass("on");
    }
    else{
      $(this).children("i").eq(0).addClass("on");
      $(this).children("i").eq(1).removeClass("on");
    }
  });

  /* 언론사 클릭시 모달Toggle */
  $(".news").on("click",function(){
    console.log($(this).text());//클릭한 언론사 이름
    $('#news-Modal').modal('show');
  });
  /* 기자 클릭시 모달Toggle */
  $(".press").on("click",function(){
    console.log($(this).text());//클릭한 기자 이름
    $('#press-Modal').modal('show');
  });
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
      labels: ['언론사', '기자', '매칭'],
      lineColors: ['#ff5e00', '#2ecc71', '#3498DB']
  });
}

/*bar*/
function bartChart(){
  /*Bar chart*/
    var data1 = {
        labels: ['좋은기사','나쁜기사','관심기사','기타기사'],
        datasets: [{
            backgroundColor: [
                'rgba(95, 190, 170, 0.99)',
                'rgba(231, 76, 60, 0.99)',
                'rgba(52, 152, 219, 0.99)',
                'rgba(241, 196, 15, 0.99)'
            ],
            hoverBackgroundColor: [
                'rgba(26, 188, 156, 0.88)',
                'rgba(231, 76, 60, 0.88)',
                'rgba(52, 152, 219, 0.88)',
                'rgba(241, 196, 15, 0.88)'
            ],
            data: [65, 59, 80, 81],
        }]
    };

    var bar = document.getElementById("barChart").getContext('2d');
    var myBarChart = new Chart(bar, {
        type: 'bar',
        data: data1,
        options: {
          barValueSpacing: 5,
          legend: {
            display: false
          }
        }
    });

    /*Doughnut chart*/
      var ctx = document.getElementById("doughnutChart");
      var data = {
          labels: ['좋은기사','나쁜기사','관심기사','기타기사'],
          datasets: [{
              data: [40, 10, 40, 10],
              backgroundColor: [
                'rgba(95, 190, 170, 0.99)',
                'rgba(231, 76, 60, 0.99)',
                'rgba(52, 152, 219, 0.99)',
                'rgba(241, 196, 15, 0.99)'
              ],
              borderWidth: ["0px","0px","0px","0px"]
          }]
      };

      var myDoughnutChart = new Chart(ctx, {
          type: 'doughnut',
          data: data,
          options: {
            legend: {
              display: false
            }
          }
      });

      //Donut chart example
    nv.addGraph(function() {
      var chart = nv.models.pieChart()
          .x(function(d) {
              return d.label })
          .y(function(d) {
              return d.value })
          .showLabels(true) //Display pie labels
          .labelThreshold(.05) //Configure the minimum slice size for labels to show up
          .labelType("percent") //Configure what type of data to show in the label. Can be "key", "value" or "percent"
          .donut(true) //Turn on Donut mode. Makes pie chart look tasty!
          .donutRatio(0.35) //Configure how big you want the donut hole size to be.
      ;

      d3.select("#donutchart").append('svg')
          .datum(pieData())
          .transition().duration(350)
          .call(chart);
      nv.utils.windowResize(chart.update);
      return chart;
  });
  function pieData() {
    return [{
        "label": "좋은기사",
        "value": 29.765957771107,
        "color": "#2ecc71"
    }, {
        "label": "나쁜기사",
        "value": 1,
        "color": "#e74c3c"
    }, {
        "label": "관심기사",
        "value": 32.807804682612,
        "color": "#3498DB"
    }, {
        "label": "기타기사",
        "value": 196.45946739256,
        "color": "#f1c40f"
    }];
}
}
