"use strict";
$(document).ready(function() {

  var chart = c3.generate({
    bindto: '#chart',//chart id
    data: {
        columns: [
            ['전체', 30],
            ['영화', 10],
            ['배우', 60],
        ],
        type: 'donut',
        onclick: function(d, i) { console.log("onclick", d, i); },
        onmouseover: function(d, i) { console.log("onmouseover", d, i); },
        onmouseout: function(d, i) { console.log("onmouseout", d, i); }
    },
    color: {
        pattern: ['#4C5667', '#1ABC9C','#FF9F55']
    },
    donut: {
        title: "PC 메인노출량"
    }
  });

});
