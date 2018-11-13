// data input hidden values
var sDateValue = $('#sDate').val();
var eDateValue = $('#eDate').val();
var moduleValue = $('#module').val();
$(document).ready(function(){
  $('#reportrange').daterangepicker(optionSet1,cb);

  if(sDateValue == '' && eDateValue == ''){
    $('#reportrange span').html(moment().format('YYYY.MM.DD') + ' - ' + moment().format('YYYY.MM.DD'));
  }
  else{
    $('#reportrange span').html(moment(new Date(sDateValue)).format('YYYY.MM.DD') + ' - ' + moment(new Date(eDateValue)).format('YYYY.MM.DD'));
  }
  if(moduleValue != ''){
    $("#selectModule option[value='"+moduleValue+"']").attr('selected','selected');
  }
});
// 성공 클릭시
$(document).on('click','.success',function(){
  $('#success-list').empty();
  $('#success-Modal').modal('show');
  var param = {
    type : 'success',
    idx :$(this).data('idx'),
    module:$(this).data('module')
  };
  if($(this).text() == '0'){
    return false;
  }
  $('#loader_s').show();
  $.ajax({
    url: '/newsclipping/period/result',
    type: 'post',
    data: param,
    datatype : 'json',
    error:function(request,status,error){
      console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
    },
    success:function(data){
      console.log(data);
      if( param.module == '1'){
        module2Result(param.type,data.result);
      }
      else if( param.module == '2'){
        module1Result(param.type,data.result);
      }
      $('#loader_s').fadeOut(500);
    }
  });
});
// 실패 클릭시
$(document).on('click','.error_nobr',function(){
  $(this).toggleClass('error_nobr_more');
});
$(document).on('click','.fail',function(){
  $('#error-list').empty();
  $('#error-Modal').modal('show');
  var param = {
    type : 'fail',
    idx :$(this).data('idx'),
    module:$(this).data('module')
  };
  if($(this).text() == '0'){
    return false;
  }
  $('#loader_f').show();
  $.ajax({
    url: '/newsclipping/period/result',
    type: 'post',
    data: param,
    datatype : 'json',
    error:function(request,status,error){
      console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
    },
    success:function(data){
      if( param.module == '1'){
        module2Result(param.type,data.result);
      }
      else if( param.module == '2'){
        module1Result(param.type,data.result);
      }
      $('#loader_f').fadeOut(500);
    }
  });
});
function module2Result(type,result){
  result.forEach(function(ele,idx){
    if(type == 'success'){
      var html = '<tr><td><i class="fas fa-check"></i></td>'+
      '<td>'+(idx+1)+'</td>'+
      '<td>'+ele.M_email+'</td>'+
      '<td>'+((ele.M_ptitle != null) ? ele.M_ptitle:'')+'</td>'+
      '<td>'+ele.M_name+'</td>'+
      '<td>'+((ele.OPENTIME != null) ? ele.OPENTIME:'')+'</td>'+
      '</tr>';
      $('#success-list').append(html);
    } else{
      var code = ele.FINALRESULT;
      var k_msg = '';
      if(code == null && ele.RSLTMSG != 'ER'){
        var errMsgArr = ele.RSLTMSG.split(']');
        code = errMsgArr[0].replace('[','');
        k_msg = errMsgArr[1];
        if(k_msg.indexOf('Master Content Not Found') != -1){
          k_msg = '지원되지 않는 미디어 유형';
        }
      }
      else{ k_msg = settingErrorMsg(code); }

      var html = '<tr><td><i class="fas fa-exclamation-triangle"></i></td><td>'+ele.M_email;
      if(code != '42' && code != '43' && code != '44' && code != '45' && ele.SENDRESULT != 'ER'){
        html+='<label class="label label-warning">재발송가능</label>';
      }
      html+='</td><td>'+((ele.M_ptitle != null) ? ele.M_ptitle:'')+'</td><td>'+ele.M_name+'</td><td><div class="error_nobr">'+k_msg+'</div></td></tr>';
      $('#error-list').append(html);
    }
  });
}
function module1Result(type,result){
  result.forEach(function(ele,idx){
    if(type == 'success'){
      var html = '<tr><td><i class="fas fa-check"></i></td>'+
      '<td>'+(idx+1)+'</td>'+
      '<td>'+ele.EMTOADDRESS+'</td>'+
      '<td>'+((ele.M_ptitle != null) ? ele.M_ptitle:'')+'</td>'+
      '<td>'+ele.EMTONAME+'</td>'+
      '<td>'+((ele.OPENTIME != null) ? ele.OPENTIME:'')+'</td>'+
      '</tr>';
      $('#success-list').append(html);
    } else{
      var msg = ele.FINALRESULT;
      if(ele.send_success == 'X' && (ele.FINALRESULT == '' || ele.FINALRESULT == null)){
        msg = '기타 알수 없는 영구적인 오류';
      }
      var html = '<tr><td><i class="fas fa-exclamation-triangle"></i></td><td>'+ele.EMTOADDRESS+'</td><td>'+((ele.M_ptitle != null) ? ele.M_ptitle:'')+'</td><td>'+ele.EMTONAME+'</td><td><div class="error_nobr">'+msg+'</div></td></tr>';
      $('#error-list').append(html);
    }
  });
}
// 메일모듈 선택시
$('#selectModule').on('change',function(){
  var optionVal = $("#selectModule option:selected").val();
  $('#module').val(optionVal);
  var param = settingParams(1);
  ajaxGetPageList(param);
});
//페이지 이동
$(document).on('click','.page-link',function(){
  var param = settingParams(Number($(this).data().value));
  ajaxGetPageList(param);
});
function ajaxGetPageList(param){
  console.log('ajaxGetPageList:',param);
  $('.preloader3').show();
  $.ajax({
    url: '/newsclipping/period/getNextPage',
    type: 'post',
    data: param,
    error: function(request,status,error){
      console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
      alert('새로고침 후 다시 시도해주세요.');
    },
    success: function(data){
      if(data.status != true){
        alert('새로고침 후 다시 시도해주세요.');
        return false;
      }
      $('#listTable tbody').eq(0).empty();

      data.result.list.forEach(function(item,idx){
        var numIdx = Math.ceil(data.result.listCount-(data.result.offset+idx)).toString();
        var html = '<tr>\
          <th>'+numIdx+'</th>\
          <td>'+item.M_regdate+'</td>\
          <td><a href="http://showbox.email/preview/newsclipping?idx='+item.n_idx+'" target="_blank"><div class="title_nobr">'+item.M_subject+'</div></a></td>\
          <td><span class="total">'+(parseInt(item.success) + parseInt(item.fail))+'</span></td>\
          <td class="success" data-idx=\"'+item.n_idx+'\"" data-module=\"'+item.M_module+'\">'+item.success+'</td>\
          <td class="fail" data-idx=\"'+item.n_idx+'\" data-module=\"'+item.M_module+'\">'+item.fail+'</td>';
        html += '<td>'+ ((item.M_type == '0') ? '즉시' : '예약');
        if(item.M_type == '1' &&(new Date().getTime() < new Date(item.SENDTIME).getTime()) && parseInt(item.success) == 0 && parseInt(item.fail) ==0){
          html += '<label class="badge badge-danger m-b-0">대기</label>'
        }
        if(item.sendCount == '0' && item.success == '0' && item.fail == '0' && (new Date().getTime() > new Date(item.SENDTIME).getTime())){
          html += '<label class="badge badge-warning m-b-0">발송중</label>'
        }
        html += '</td></tr>';
        $('#listTable tbody').eq(0).append(html);
      });
      var limit = 10;
      var pageCount = Math.ceil(data.result.listCount/limit);
      $('#listTable tfoot').eq(0).empty();
      if(pageCount > 1) {
        var html = '<tr><td colspan="7"><ul class="pagination float-right">';
        var pageSize = 5;
        var pRCnt = parseInt(data.result.currentPage / pageSize);
        if(data.result.currentPage % pageSize == 0){
          pRCnt = parseInt(data.result.currentPage / pageSize) - 1;
        }
        if(data.result.currentPage > 5) {
          html += '<li class="page-item"><a class="page-link" data-value="1" aria-label="Previous">\
              <i class="ti-angle-double-left f-12"></i>\
              <span aria-hidden="true"></span>\
              <span class="sr-only">Previous</span>\
            </a></li>\
            <li class="page-item"><a class="page-link" data-value=\"'+(pRCnt * pageSize)+'"\ aria-label="Previous">\
              <i class="ti-angle-left f-12"></i>\
              <span aria-hidden="true"></span>\
              <span class="sr-only">Previous</span>\
            </a></li>';
        }

        for(var index=pRCnt * pageSize + 1;index<(pRCnt + 1)*pageSize + 1;index++){
          var active = (data.result.currentPage == index) ? "active" : "";
          html += '<li class=\"'+active+' page-item">\
            <a class="page-link" data-value=\"'+index+'"\ >'+index+'</a></li>'

          if(index == pageCount) {
            break;
          }
        }
        if((pRCnt + 1) * pageSize < pageCount) {
          html += '<li class="page-item">\
                <a class="page-link" data-value=\"'+((pRCnt + 1)*pageSize+1)+'"\ aria-label="Next">\
                  <i class="ti-angle-right f-12"></i>\
                  <span aria-hidden="true"></span>\
                  <span class="sr-only">Next</span>\
                </a></li>\
                <li class="page-item">\
                <a class="page-link" data-value=\"'+pageCount+'"\ aria-label="Next">\
                  <i class="ti-angle-double-right f-12"></i>\
                  <span aria-hidden="true"></span>\
                  <span class="sr-only">Next</span>\
                </a></li>';
        }
        html += '</ul></td></tr>';
        $('#listTable tfoot').eq(0).append(html);
      }
      $('.preloader3').fadeOut(500);
    }
  });
}

//날짜 선택 시
function searchDate(){
  var dateArr = $("#reportrange span").text().split(' - ');
  var start = moment(new Date(dateArr[0].replace(/[.]/gi,'-')));
  var end = moment(new Date(dateArr[1].replace(/[.]/gi,'-')));
  $('#sDate').val(start.format('YYYY-MM-DD'));
  $('#eDate').val( end.format('YYYY-MM-DD'));
  var param = settingParams(1);
  ajaxGetPageList(param);
}
$(document).on('click','.applyBtn',searchDate);
//날짜 설정
var cb = function(start, end, label) {
  console.log('FUNC: cb',start.toISOString(), end.toISOString(), label);
  $('#reportrange span').html(moment(new Date(start.toISOString())).format('YYYY.MM.DD') + ' - ' + moment(new Date(end.toISOString())).format('YYYY.MM.DD'));
  searchDate();
}
var ranges = {
  '당일': [moment(), moment()],
  '전일': [moment().subtract(1, 'days'), moment()],
  '최근 7일': [moment().subtract(6, 'days'), moment()],
  '최근 30일': [moment().subtract(29, 'days'), moment()]
};
var optionSet1 = {
  startDate: (sDateValue != '') ? moment(new Date(sDateValue)) : moment(),
  endDate:  (eDateValue != '') ? moment(new Date(eDateValue)) : moment(),
  showDropdowns: true,
  showRangeInputsOnCustomRangeOnly: false,
  ranges: ranges,
  opens: 'left',
  buttonClasses: ['btn'],
  applyClass: 'btn-small btn-primary',
  cancelClass: 'btn-small',
  format: 'YYYY.MM.DD',
  separator: ' to ',
  locale: {
    applyLabel: '확인',
    cancelLabel: '취소',
    customRangeLabel: '직접선택',
    daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    firstDay: 1
  }
};

// 리스트 조건 세팅
function settingParams(num){
  var param = {
    page : num
  };
  // 메일모듈
  var moduleValue = $('#module').val();
  if(moduleValue != ''){
    param.module = moduleValue;
  }
  // 날짜
  var sDateValue = $('#sDate').val();
  var eDateValue = $('#eDate').val();
  if(sDateValue != '' && eDateValue != ''){
    param.sDate = sDateValue;
    param.eDate = eDateValue;
  }
  return param;
}
