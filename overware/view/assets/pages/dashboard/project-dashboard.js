$(document).ready(function() {
    // Extra chart
    Morris.Area({
      element: 'morris-extra-area',
      data: [{
        period: '2017-10-10',
        bolg: 0,
        cafe: 0,
        kin: 0
      }, {
        period: '2017-10-11',
        bolg: 50,
        cafe: 15,
        kin: 5
      }, {
        period: '2017-10-12',
        bolg: 20,
        cafe: 50,
        kin: 65
      }, {
        period: '2017-10-13',
        bolg: 60,
        cafe: 12,
        kin: 7
      }, {
        period: '2017-10-14',
        bolg: 30,
        cafe: 20,
        kin: 120
      }, {
        period: '2017-10-15',
        bolg: 25,
        cafe: 80,
        kin: 40
      }, {
        period: '2017-10-16',
        bolg: 10,
        cafe: 10,
        kin: 10
      }


      ],
      lineColors: ['#fb9678', '#7E81CB', '#01C0C8'],
      xkey: 'period',
      ykeys: ['bolg', 'cafe', 'kin'],
      labels: ['블로그', '카페', '지식인'],
      pointSize: 0,
      lineWidth: 0,
      resize: true,
      fillOpacity: 0.8,
      behaveLikeLine: true,
      gridLineColor: '#5FBEAA',
      hideHover: 'auto'

    });
});
