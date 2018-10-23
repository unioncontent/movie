// data input hidden values
var sDateValue = $('#sDate').val();
var eDateValue = $('#eDate').val();
var keywordValue = $('#keyword').val();
var typeValue = $('#type').val();
var mTypeValue = $('#mType').val();
var moduleValue = $('#module').val();
$(document).ready(function(){
  if(keywordValue != ''){
    $("#selectKeyword option[value='"+keywordValue+"']").attr('selected','selected');
  }
  if(typeValue != ''){
    $("#selectType option[value='"+typeValue+"']").attr('selected','selected');
  }
  if(mTypeValue != ''){
    $("#selectMType option[value='"+mTypeValue+"']").attr('selected','selected');
  }
  if(moduleValue != ''){
    $("#selectModule option[value='"+moduleValue+"']").attr('selected','selected');
  }
  $('#reportrange').daterangepicker(optionSet1,cb);

  if(sDateValue == '' && eDateValue == ''){
    $('#reportrange span').html(moment().format('YYYY.MM.DD') + ' - ' + moment().format('YYYY.MM.DD'));
  }
  else{
    $('#reportrange span').html(moment(new Date(sDateValue)).format('YYYY.MM.DD') + ' - ' + moment(new Date(eDateValue)).format('YYYY.MM.DD'));
  }
});
// 발송실적
$('.btn-excel').on("click",function(){
  var idx= $(this).data('idx');
  var module= $(this).data('module');
  swal({
    title: "발송실적 출력하시겠습니까?",
    icon: "warning",
    buttons: ["취소", true],
    dangerMode: true,
  })
  .then((value) =>{
    console.log(value);
    if(value != null){
      var link = '/excel?idx='+idx+'&module='+module;
      location.href = link;
    }
  });
});
// 성공 클릭시
$(document).on('click','.success',function(){
  $('#success-list').empty();
  $('#success-Modal').modal('show');
  var clickParam = $(this).data('idx');
  if($(this).text() == '0'){
    return false;
  }
  $('#loader_s').show();
  $.ajax({
    url: '/period/result',
    type: 'post',
    data: {
      M_result: 'success',
      arr : [clickParam,13]
    },
    datatype : 'json',
    error:function(request,status,error){
      console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
      $('#loader_s').fadeOut(500);
    },
    success:function(data){
      data.result.forEach(function(ele,idx){
        var html = '<tr><td><i class="fas fa-check"></i></td>'+
          '<td>'+(idx+1)+'</td>'+
          '<td>'+ele.EMTOADDRESS+'</td>'+
          '<td>'+ele.M_ptitle+'</td>'+
          '<td>'+ele.EMTONAME+'</td>'+
          '<td>'+((ele.OPENTIME != null) ? ele.OPENTIME:'')+'</td>'+
        '</tr>';
        $('#success-list').append(html);
      });
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
  var clickFParam = $(this).data('idx');
  if($(this).text() == '0'){
    return false;
  }
  $('#loader_f').show();
  $.ajax({
    url: '/period/result',
    type: 'post',
    data: {
      M_result: 'fail',
      arr : [clickFParam,13]
    },
    datatype : 'json',
    error:function(request,status,error){
      console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
      $('#loader_f').fadeOut(500);
    },
    success:function(data){
      data.result.forEach(function(ele,idx){
        // var o_msg = ele.M_result_msg.replace('send mail Error: ','');
        // var k_msg = settingErrorMsg(o_msg);
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
        else{
          k_msg = settingErrorMsg(code);
        }
        var html = '<tr><td><i class="fas fa-exclamation-triangle"></i></td>'+
          '<td  class="widthMin">'+code+'</td>'+'<td>'+ele.EMTOADDRESS;
        if(code != '42' && code != '43' && code != '44' && code != '45' && ele.SENDRESULT != 'ER'){
          html+=' <label class="label label-warning">재발송가능</label>'
        }
        html+='</td>'+'<td>'+ele.M_ptitle+'</td>'+
          '<td>'+ele.EMTONAME+'</td>'+
          '<td><div class="error_nobr">'+k_msg+'</div></td>'+
        '</tr>';
        $('#error-list').append(html);
      });
      $('#loader_f').fadeOut(500);
    }
  });
});
// 통계보고서 보기버튼 클릭시
$(document).on("click",".btn-period",function(){
  //  표 초기화
  $('.modal-num').text(0);
  $('#date1').text('');
  $('#date2').text('');
  $("#period-Modal").modal('show');
  var trEle = $(this).parents('tr');
  var tdEles = trEle.find('td');
  var inputEle = trEle.find('input[type=hidden]');
  var idxParam = $(this).data('idx');
  if(inputEle.eq(1).val() != ''){
    var param = {
      M_idx_A:idxParam,
      M_module:inputEle.eq(2).val(),
      keyword:tdEles.eq(1).text(),
      sDate:tdEles.eq(0).text(),
      eDate:tdEles.eq(0).text()
    };
    ajaxGetPeriod(param,tdEles,inputEle);
  }
});
function ajaxGetPeriod(param,tag,input){
  $('#loader_p').show();
  $('#total').text(tag.eq(5).text());
  $('#success').text(tag.eq(6).text());
  $('#fail').text(tag.eq(7).text());
  var sendDate = input.eq(1).val().slice(0,16);
  $('#date1').text(sendDate);
  if(tag.eq(8).text().trim().indexOf("예약") != -1){
    $('#date1').text(sendDate);
    $('#date2').text(sendDate);
  }
  $.ajax({
    url: '/period/getPeriod',
    type: 'post',
    data: param,
    error: function(request,status,error){
      console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
      $('#loader_p').fadeOut(500);
      alert('새로고침 후 다시 시도해주세요.');
    },
    success: function(data){
      console.log(data);
      $('#loader_p').fadeOut(500);
      if(data.status){
        $('#media').text(data.result.media);
        $('#reporter').text(data.result.reporter);
        $('#newsCount').text(data.result.newsCount);
        $('#replyCount').text(data.result.replyCount);
      } else{
        alert('새로고침 후 다시 시도해주세요.');
      }
    }
  });
}

// 메일타입 선택시
$('#selectType').on('change',function(){
  var optionVal = $("#selectType option:selected").val();
  if(optionVal != '메일타입'){
    $('#type').val(optionVal);
  }
  else{
    $('#type').val('');
  }
  var param = settingParams(1);
  ajaxGetPageList(param);
});
// 발송타입 선택시
$('#selectMType').on('change',function(){
  var optionVal = $("#selectMType option:selected").val();
  if(optionVal != '발송타입'){
    $('#mType').val(optionVal);
  }
  else{
    $('#mType').val('');
  }
  var param = settingParams(1);
  ajaxGetPageList(param);
});
// 메일모듈 선택시
$('#selectModule').on('change',function(){
  var optionVal = $("#selectModule option:selected").val();
  $('#module').val(optionVal);
  var param = settingParams(1);
  ajaxGetPageList(param);
});
// 키워드 선택시
$('#selectKeyword').on('change',function(){
  var optionVal = $("#selectKeyword option:selected").val();
  if(optionVal != '키워드'){
    $('#keyword').val(optionVal);
  }
  else{
    $('#keyword').val('');
  }
  var param = settingParams(1);
  ajaxGetPageList(param);
});
// 인비테이션 선택시
$('input[type="checkbox"][name="search"]').on('click',function(){
  //click 이벤트가 발생했는지 체크
  if($(this).prop('checked')){
    // checkbox전체를 checked 해제후 click한 요소만 true지정
    $('input[type="checkbox"][name="search"]').prop('checked',false);
    $(this).prop('checked',true);
    $('#ivt').val($(this).val());
    searchStrBtn($(this).val());
  }
  else{
    $('#ivt').val('');
    searchStrBtn('');
  }
});
function searchStrBtn(search){
  if(search != ''){
    $('#ivt').val(search);
  }
  else{
    $('#ivt').val('');
  }
  var param = settingParams(1);
  ajaxGetPageList(param);
}

//페이지 이동
$(document).on('click','.page-link',function(){
  var param = settingParams(Number($(this).data().value));
  ajaxGetPageList(param);
});
function ajaxGetPageList(param){
  console.log('ajaxGetPageList:',param);
  $('.preloader3').show();
  $.ajax({
    url: '/period/getNextPage',
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
          <input type="hidden" class="M_regdate" value="'+item.M_regdate+'"/>\
          <input type="hidden" class="M_send" value="'+item.M_send+'"/>\
          <th>'+numIdx+'</th>\
          <td>'+item.M_regdate+'</td>\
          <td><div class="kwd_nobr">'+item.M_keyword+'</div></td>\
          <td><div class="num_nobr">'+((item.M_invitation == '0' && item.M_seq_number != '')?(item.M_seq_number+'차'):'-')+'</div></td>\
          <td><a href="http://showbox.email/preview?keyword='+item.M_keyword_idx+'&idx='+item.n_idx+'" target="_blank"><div class="title_nobr">'+item.M_subject+'</div></a></td>\
          <td>'+item.M_mail_type+'</td>\
          <td><span class="total">'+item.sendCount+'</span></td>\
          <td data-idx=\"'+item.n_idx+'\">'+item.success+'</td>\
          <td data-idx=\"'+item.n_idx+'\">'+item.fail+'</td>';
        html += '<td>'+ ((item.M_type == '0') ? '즉시' : '예약');
        if((new Date().getTime() < new Date(item.M_send).getTime()) && parseInt(item.success) == 0 && parseInt(item.fail) ==0){
          html += '<label class="badge badge-danger m-b-0">대기</label>'
        }
        html += '</td>';
        html += '<td><button class="btn btn-warning btn-excel" data-idx="'+item.n_idx+'" data-module="'+item.M_module+'"><i class="fas fa-file-excel"></i></button></td>\
        <td><button class="btn btn-inverse btn-period" data-idx="'+item.n_idx+'" data-module="'+item.M_module+'"><i class="fas fa-chart-bar"></i></button></td>\
        </tr>'
        $('#listTable tbody').eq(0).append(html);
      });
      var limit = 20;
      var pageCount = Math.ceil(data.result.listCount/limit);
      $('#listTable tfoot').eq(0).empty();
      if(pageCount > 1) {
        var html = '<tr><td colspan="12"><ul class="pagination float-right">';
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
  $('#eDate').val(end.format('YYYY-MM-DD'));
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
  // 키워드
  var keywordValue = $('#keyword').val();
  if(keywordValue != ''){
    param.keyword = keywordValue;
  }
  // 메일타입
  var typeValue = $('#type').val();
  if(typeValue != ''){
    param.type = typeValue;
  }
  // 발송타입
  var mTypeValue = $('#mType').val();
  if(mTypeValue != ''){
    param.mType = mTypeValue;
  }
  // 메일모듈
  var moduleValue = $('#module').val();
  if(moduleValue != ''){
    param.module = moduleValue;
  }
  // 인비테이션
  var ivtValue = $('#ivt').val();
  if(ivtValue != ''){
    param.ivt = ivtValue;
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
