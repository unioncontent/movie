// data input hidden values
var sDateValue = $('#sDate').val();
var eDateValue = $('#eDate').val();
$(document).ready(function(){
  $('#reportrange').daterangepicker(optionSet1,cb);

  if(sDateValue == '' && eDateValue == ''){
    $('#reportrange span').html(moment().format('YYYY.MM.DD') + ' - ' + moment().format('YYYY.MM.DD'));
  }
  else{
    $('#reportrange span').html(moment(new Date(sDateValue)).format('YYYY.MM.DD') + ' - ' + moment(new Date(eDateValue)).format('YYYY.MM.DD'));
  }
});
// 삭제버튼 클릭시
$(document).on('click','.btn-delete',function(){
  var tdEles = $(this).parents('tr').find('td');
  var moduleVal = $(this).data('module');
  var idxVal = $(this).data('idx');
  var mIdVal = $(this).data('mid');
  if(moduleVal == '2' && tdEles.eq(5).find('.fa-minus').length == 0 && tdEles.eq(6).find('.fa-minus').length == 1){
    $.ajax({
      url: '/newsclipping/list/checkMail',
      type: 'post',
      data : {mid:mIdVal},
      datatype : 'json',
      error:function(request,status,error){
        console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
        swal("ERROR!","다시 시도해주세요.", "error");
      },
      success:function(data){
        console.log(data);
        var msg = (data.status == 112) ? "예약메일의 상태가 발송대기 중이므로\n삭제해도 예약발송취소는 불가합니다.":"";
        swal({
          title: "삭제하시겠습니까?",
          text: msg,
          icon: "warning",
          buttons: ["취소", true],
          dangerMode: true,
        })
        .then(function(value) {
          if (value == null) {
            return false;
          }
          deleteAjax({mid:mIdVal,idx:idxVal,module:moduleVal});
        });
        return false;
      }
    });
  } else{
    swal({
      title: "삭제하시겠습니까?",
      icon: "warning",
      buttons: ["취소", true],
      dangerMode: true,
    })
    .then(function(value) {
      if (value == null) {
        return false;
      }
      deleteAjax({mid:mIdVal,idx:idxVal,module:moduleVal});
    });
  }
});
function deleteAjax(param){
  $.ajax({
    url: '/newsclipping/list/delete',
    type: 'post',
    data : param,
    datatype : 'json',
    error:function(request,status,error){
      console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
      swal("ERROR!","삭제 실패했습니다. 다시 시도해주세요.", "error");
    },
    success:function(data){
      if(data.status){
        swal("SUCCESS!", '삭제 되었습니다.', "success")
        .then(function(value) {
          reloadPage();
        });
      }else{
        swal("ERROR!", '새로고침 후 다시 시도해주세요.', "error");
      }
    }
  });
}

function reloadPage(){
  console.log('reloadPage');
  var pageValue = ($("#page").val() == '') ? 1 : parseInt($("#page").val());
  var param = {
    page : pageValue
  };
  // var keywordValue = $("#keyword").val();
  // if(keywordValue != ''){
  //   param.keyword = keywordValue;
  // }
  var searchTypeParams = $.urlParam("searchType");
  var searchParams = $.urlParam("search");
  var keywordParams = $.urlParam("keyword");
  if(keywordParams != '' && keywordParams != null){
    param.keyword = keywordParams;
  }
  var sDateValue = $('#sDate').val();
  var eDateValue = $('#eDate').val();
  if(sDateValue != '' && eDateValue != '' ){
    param.sDate = moment(sDateValue).format('YYYY-MM-DD');
    param.eDate = moment(eDateValue).format('YYYY-MM-DD');
  }
  if(searchTypeParams != null && searchParams != null){
    page.searchType=searchTypeParams;
    page.search=searchParams;
  }
  ajaxGetPageList(param);
}
//페이지 이동
$(document).on('click','.page-link',function(){
  var num = Number($(this).text()) || Number($(this).data().num);
  var param = {
    page : Number($(this).data().value)
  };
  // data input hidden values
  var sDateValue = $('#sDate').val();
  var eDateValue = $('#eDate').val();
  if(sDateValue != '' && eDateValue != '' ){
    param.sDate = moment(sDateValue).format('YYYY-MM-DD');
    param.eDate = moment(eDateValue).format('YYYY-MM-DD');
  }
  ajaxGetPageList(param,num);
});
function ajaxGetPageList(param){
  console.log('ajaxGetPageList:',param);
  $('.preloader3').show();
  $.ajax({
    url: '/newsclipping/list/getNextPage',
    type: 'post',
    data: param,
    error: function(request,status,error){
      console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
      alert('새로고침 후 다시 시도해주세요.');
    },
    success: function(data){
      console.log(data);
      if(data.status != true){
        alert('새로고침 후 다시 시도해주세요.');
        return false;
      }
      $("#page").val(data.result.currentPage);
      $("#sDate").val(param.sDate);
      $("#eDate").val(param.eDate);
      $('#listTable tbody').eq(0).empty();
      data.result.list.forEach(function(item,idx){
        var numIdx = Math.ceil(data.result.listCount-(data.result.offset+idx)).toString();
        var mailHtmlStr = '';
        var recipiArr = item.M_recipi_idx.split(',');
        var recipiStr = '';
        if(recipiArr.length > 1){
          recipiStr = ((item.M_recipi == null) ? '(삭제된메일)':item.M_recipi)+' 외 '+(recipiArr.length-1);
        }
        else{
          recipiStr = ((item.M_recipi == null) ? '(삭제된메일)':item.M_recipi);
        }

        var groupStr = '';
        if(item.M_group_idx != null){
          var groupArr = item.M_group_idx.split(',');
          if(groupArr.length > 1){
            groupStr = ((item.M_group == null) ? '(삭제된그룹)':item.M_group)+' 외 '+(groupArr.length-1);
          }
          else if(item.M_group != null){
            groupStr = ((item.M_group == null) ? '(삭제된그룹)':item.M_group);
          }
        }
        var html = '<tr>\
          <th>'+numIdx+'</th>\
          <td><a href="http://showbox.email/preview/newsclipping?idx='+item.n_idx+'" target="_blank">\
            <div class="title_nobr">'+item.M_subject+'</div>\
          </a></td>\
          <td>'+item.M_sender+'</td>\
          <td>'+recipiStr+'</td>\
          <td><div class="group-nobr" title="'+groupStr+'">'+groupStr+'</div></td>\
          <td><div class="date-nobr">'+item.M_regdate+'</div></td>\
          <td><div class="date-nobr">'+((item.M_type != 1) ?'<i class="fas fa-minus"></i>': item.SENDTIME)+'</div></td>\
          <td><div class="date-nobr">'+((item.M_type == 1 && new Date().getTime() < new Date(item.SENDTIME).getTime()) ? '<i class="fas fa-minus"></i>': item.SENDTIME)+'</div></td>\
          <td>';
          html += '<button class="btn btn-sm btn-inverse btn-delete" data-idx="'+item.n_idx+'" data-mid="'+item.M_a_id+'"  data-module="'+item.module+'">삭제</button> ';
        $('#listTable tbody').eq(0).append(html);
      });
      var limit = 10;
      var pageCount = Math.ceil(data.result.listCount/limit);
      $('#listTable tfoot').eq(0).empty();
      if(pageCount > 1) {
        var html = '<tr><td colspan="9"><ul class="pagination float-right">';
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
  var param = {
    page : 1,
    sDate : start.format('YYYY-MM-DD'),
    eDate : end.format('YYYY-MM-DD')
  };
  $('#sDate').val(param.sDate);
  $('#eDate').val(param.eDate);
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
