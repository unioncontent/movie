'use strict';
$(document).ready(function() {
  $('[data-toggle="tooltip"]').tooltip();

  document.querySelector('.alert-confirm').onclick = function(){
    swal({
          title: "엑셀출력 하시겠습니까?",
          text: "현재 리스트가 엑셀출력 됩니다.",
          type: "warning",
          showCancelButton: true,
          confirmButtonClass: "btn-danger",
          confirmButtonText: "YES",
          closeOnConfirm: false
        },
        function(){//엑셀 출력하겠다고 할 시 진행 함수
          swal("Success!", "엑셀출력 되었습니다.", "success");
        });
  };
  
  /* 언론사 통계 순위 for문 */
  for (var i = 2; i < 41; i++) {
    var check=""; // 20위이상 안보이게 하는 클래스 변수(more 클래스)
    if(i > 20){
      check="more";
    }

    $("#news-ranking").append("<tr class='"+check+"'><th scope='row'>"+i+"</th><td class='news'>언론사</td><td>3,294</td><td>13</td><td>11.74%</td></tr>");
    $("#press-ranking").append("<tr class='"+check+"'><th scope='row'>"+i+"</th><td class='press'>기자</td><td>언론사</td><td>1</td><td>0</td><td>0%</td></tr>");
  }

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

  /* 그래프1 */
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
        .datum(pieData1())
        .transition().duration(350)
        .call(chart);
    nv.utils.windowResize(chart.update);

    return chart;
  });
  /* 그래프2 */
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

    d3.select("#donutchart2").append('svg')
        .datum(pieData2())
        .transition().duration(350)
        .call(chart);
    nv.utils.windowResize(chart.update);

    return chart;
  });
});

//data
function pieData1() {
    return [{
        "label": "좋은기사",
        "value": 50,
        "color": "#2ecc71"
    },{
        "label": "나쁜기사",
        "value": 10,
        "color": "#e74c3c"
    },{
        "label": "관심기사",
        "value": 5,
        "color": "#FF9F55"
    },   {
        "label": "기타기사",
        "value": 5,
        "color": "#f1c40f"
    }];
}

function pieData2() {
  return [{
      "label": "좋은기사",
      "value": 10,
      "color": "#2ecc71"
  },{
      "label": "나쁜기사",
      "value": 50,
      "color": "#e74c3c"
  },{
      "label": "관심기사",
      "value": 10,
      "color": "#FF9F55"
  },   {
      "label": "기타기사",
      "value": 70,
      "color": "#f1c40f"
  }];
}

//more
function moreRanking(moreName,morehtml){
  // 1. 더보기를 할 부분 이름 가져와 타이틀 부분에 넣기(언론사,기자)
  $("#moreName").text(moreName);
  // 2. 더보기 할 부분의 순위 리스트 html을 변수에 대입
  var originHtml = $("#"+morehtml).html();
  // 3. 더보기 할 부분에 more이라는 클래스를 지워줌
  $("#"+morehtml+" tr").removeClass("more");
  // 4. more 클래스를 지운 html을 변수에 대입
  var changeHtml = $("#"+morehtml).html();
  // 5. more 클래스가 지워진 부분 다시 원래대로 복구
  $("#"+morehtml).html(originHtml);
  // 6. more클래스를 지운 html 모달 부분에 넣어줌
  $("#more-Modal .modal-body").html(changeHtml);
  $("#more-Modal").modal('show');
}
