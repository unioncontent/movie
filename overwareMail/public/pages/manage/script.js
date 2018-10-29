$(document).ready(function(){
startSetting();
});
// 인비테이션 선택
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
var param = settingParams(1);
ajaxGetPageList(param);
}
// 삭제버튼 클릭시
$(document).on('click','.btn-delete',function(){
var thisTd = $(this).parents('td');
var tdEles = $(this).parents('tr').find('td');
var moduleVal = thisTd.data('module');
var typeVal = thisTd.data('mtype');
var idxVal = thisTd.data('idx');
var mIdVal = thisTd.data('mid');

if(moduleVal == '2' && typeVal != '0' && tdEles.eq(8).text() == '-'){
  $.ajax({
    url: '/email/manage/checkMail',
    type: 'post',
    data : {mid:mIdVal},
    datatype : 'json',
    error:function(request,status,error){
      console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
      swal("ERROR!","다시 시도해주세요.", "error");
    },
    success:function(data){
      console.log(data);
      var msg = (data.status == 112) ? "예약메일의 상태가 발송대기 중이므로 삭제해도 예약발송취소는 불가합니다.":"";
      swal({
        title: "삭제하시겠습니까?",
        text:msg,
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
  url: '/email/manage/delete',
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
// 수정버튼 클릭시
$(document).on('click','.btn-edit',function(){
var tdEles = $(this).parents('tr').find('td');
var thisTd = $(this).parents('td');
var moduleVal = thisTd.data('module');
var typeVal = thisTd.data('mtype');
var idxVal = thisTd.data('idx');
var mIdVal = thisTd.data('mid');
if(tdEles.eq(8).text() != '-'){
  swal("ERROR!", '발송된 메일은 수정하실 수 없습니다.', "error");
  return false;
}
if(moduleVal == '2' && typeVal != '0'){
  $.ajax({
    url: '/email/manage/checkMail',
    type: 'post',
    data : {mid:mIdVal},
    datatype : 'json',
    error:function(request,status,error){
      console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
      swal("ERROR!","다시 시도해주세요.", "error");
    },
    success:function(data){
      if(data.status == 112){
        swal("ERROR!","예약메일의 상태가 발송대기 중이므로 메일 수정할 수 없습니다.", "error");
        return false;
      }
      editModal(idxVal);
    }
  });
}
else{
  editModal(idxVal);
}
});
function editModal(idxVal){
swal({
  title: '수정하시겠습니까?',
  icon: "warning",
  buttons: ["취소", true],
  dangerMode: true,
})
.then(function(value) {
  if (value == null) {
    return false;
  }
  location.href='../email?type=edit&idx='+idxVal;
});
}
// 메일전송버튼 클릭시
$(document).on('click','.btn-send',function(){
var tdEles = $(this).parents('tr').find('td');
var thisTd = $(this).parents('td');
var idxVal = thisTd.data('idx');
var typeVal = thisTd.data('mtype');
var midVal = thisTd.data('mid');
var moduleVal = thisTd.data('module');
swal({
  title: '메일을 보내시겠습니까?',
  text: '예약발송이 설정된 경우 예약 발송은 취소됩니다.',
  icon: "warning",
  buttons: ["취소", "보내기"]
})
.then(function(value) {
  if (value == null) {
    return false;
  }
  if(typeVal == '0'){
    sendMail(idxVal);
  }
  else{
    $.ajax({
      url: '/email/manage/updateMtype',
      type: 'post',
      data : {type:'0',mid:midVal,idx:idxVal,module:moduleVal},
      datatype : 'json',
      error:function(request,status,error){
        console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
        if(request.responseText == '112'){
          swal("ERROR!","예약메일의 상태가 발송대기 중이므로 메일을 보낼 수 없습니다.", "error");
          return false;
        }
        swal("ERROR!","다시 시도해주세요.", "error");
      },
      success:function(data){
        if(data.status){
          sendMail(idxVal);
        }else{
          swal("ERROR!", '다시 시도해주세요.', "error");
        }
      }
    });
  }
});
});
$(document).on('click','.btn-resend',function(){
var tdEles = $(this).parents('tr').find('td');
var thisTd = $(this).parents('td');
var moduleVal = thisTd.data('module');
var idxVal = thisTd.data('idx');
var midVal = thisTd.data('mid');
swal({
  title: '재발송 하시겠습니까?',
  icon: "warning",
  buttons: ["취소", "보내기"]
})
.then(function(value) {
  if (value == null) {
    return false;
  }
  console.log('재발송 updateMtype');
  $.ajax({
    url: '/email/manage/updateMtype',
    type: 'post',
    data : {type:'0',mid:midVal,idx:idxVal,module:moduleVal,mtype:'resend'},
    datatype : 'json',
    error:function(request,status,error){
      console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
      swal("ERROR!","다시 시도해주세요.", "error");
    },
    success:function(data){
      if(data.status){
        resendMail(idxVal);
      }else{
        swal("ERROR!", '다시 시도해주세요.', "error");
      }
    }
  });
});
});
function sendMail(idx){
$.ajax({
  url: '/email/send',
  type: 'post',
  data : {'idx':idx},
  datatype : 'json',
  error:function(request,status,error){
    console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
    swal("ERROR!","메일발송을 실패 하였습니다.", "error");
    reloadPage();
  },
  success:function(data){
    if(data.status){
      swal("SUCCESS!", '메일이 발송 되었습니다.', "success")
      .then(function(value) {
        reloadPage();
      });
    }else{
      swal("ERROR!", '메일발송을 실패 하였습니다.', "error");
    }
  }
});
}
function resendMail(idx){
$.ajax({
  url: '/email/send',//send
  type: 'post',
  data : {'idx':idx,'sType':'resend'},
  datatype : 'json',
  error:function(request,status,error){
    console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
    swal("ERROR!","재발송 실패 하였습니다.", "error");
    reloadPage();
  },
  success:function(data){
    if(data.status){
      swal("SUCCESS!", '메일이 재발송 되었습니다.', "success")
      .then(function(value) {
        reloadPage();
      });
    }else{
      swal("ERROR!", '재발송 실패 하였습니다.', "error");
    }
  }
});
}
// 메일 재작성버튼 클릭시
$(document).on('click','.btn-rewrite',function(){
var thisTd = $(this).parents('td');
var idxVal = thisTd.data('idx');
swal({
  title: '이번 회차를 바탕으로 재작성 하시겠습니까?',
  icon: "warning",
  buttons: ["취소", true],
  dangerMode: true,
})
.then(function(value) {
  if (value == null) {
    return false;
  }
  location.href='../email?type=rewrite&idx='+idxVal;
});
});
// 키워드 선택시
$('#selectKeyword').on('change',searchFun);
// 검색시
$('#searchInput').on('keyup',function(event){
if(event.keyCode == 13){
  $('#searchBtn').trigger('click');
};
});
$('#searchBtn').on('click',searchFun);
//페이지 이동
$(document).on('click','.page-link',function(){
var param = settingParams(Number($(this).data().value));
ajaxGetPageList(param);
});
function ajaxGetPageList(param){
console.log('ajaxGetPageList:',param);
$('.preloader3').show();
$.ajax({
  url: '/email/manage/getNextPage',
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
      var send_o = new Date(item.M_send);
      var now_o = new Date();
      var html = '<tr>\
        <th>'+numIdx+'</th>\
        <td><div class="kwd_nobr">'+item.M_keyword+'</div></td>\
        <td><a href="http://showbox.email/preview?keyword='+item.M_keyword_idx+'&idx='+item.n_idx+'" target="_blank">\
          <div class="title_nobr">'+item.M_subject+'</div>\
        </a></td>\
        <td>'+item.M_sender+'</td>\
        <td><div class="num_nobr">'+((item.M_invitation == '0' && item.M_seq_number != '')?(item.M_seq_number+'차'):'-')+'</div></td>\
        <td>'+recipiStr+'</td>\
        <td><div class="group-nobr" title="'+groupStr+'">'+groupStr+'</div></td>\
        <td><div class="date-nobr">'+item.M_regdate+'</div></td>\
        <td><div class="date-nobr">'+(((item.M_type != 1) || (item.M_type == 1 && item.M_send == null)) ?'-': item.M_send)+'</div></td>\
        <td><div class="date-nobr">'+(((item.M_send == null) || (item.M_type == 1 && (send_o > now_o))) ? '-': item.M_send)+'</div></td>\
        <td data-mtype="'+item.M_type+'" data-mid="'+item.M_a_id+'" data-idx="'+item.n_idx+'" data-module="'+item.M_module+'">';
        if(item.M_send == null || (item.M_type == 1 && (send_o > now_o))){
          html += '<button class="btn btn-sm btn-inverse btn-send">보내기</button> ';
        }
        else{
          html += '<button class="btn btn-sm btn-inverse btn-resend">재발송</button> ';
        }
        html += '<button class="btn btn-sm btn-inverse btn-delete">삭제</button> ';
        if(item.M_send == null || (item.M_type == 1 && (send_o > now_o))){
          html += '<button class="btn btn-sm btn-inverse btn-edit">수정</button> ';
        }
        html += '<button class="btn btn-sm btn-inverse btn-rewrite">재작성</button></td></tr>';
      $('#listTable tbody').eq(0).append(html);
    });
    var limit = 20;
    var pageCount = Math.ceil(data.result.listCount/limit);
    $('#listTable tfoot').eq(0).empty();
    if(pageCount > 1) {
      var html = '<tr><td colspan="11"><ul class="pagination float-right">';
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
$(document).on('click','.applyBtn',searchFun);
function reloadPage(){
console.log('reloadPage');
var param = settingParams(1);
ajaxGetPageList(param);
}
function searchFun(){
var param = settingParams(1);
ajaxGetPageList(param);
}
// 리스트 조건 세팅
function startSetting(){
var keyword = $.urlParam("keyword");
if(keyword){
  $('#selectKeyword > option[value='+keyword+']').attr("selected",true);
}
var ivt = $.urlParam("ivt");
if(ivt == '1'){
  $('input[type="checkbox"][name="search"]').prop('checked',true);
}
var searchType = $.urlParam("searchType");
if(searchType){
  $('#selectSearchType > option[value='+searchType+']').attr("selected",true);
}
var search = $.urlParam("search");
if(search){
  $('#searchInput').val(search);
}
//날짜 설정
var sDate = $.urlParam("sDate");
var eDate = $.urlParam("eDate");
var cb = function(start, end, label) {
  console.log('FUNC: cb',start.toISOString(), end.toISOString(), label);
  $('#reportrange span').html(moment(new Date(start.toISOString())).format('YYYY.MM.DD') + ' - ' + moment(new Date(end.toISOString())).format('YYYY.MM.DD'));
  searchFun();
}
var ranges = {
  '당일': [moment(), moment()],
  '전일': [moment().subtract(1, 'days'), moment()],
  '최근 7일': [moment().subtract(6, 'days'), moment()],
  '최근 30일': [moment().subtract(29, 'days'), moment()]
};
var optionSet1 = {
  startDate: (sDate != '' && sDate != null) ? moment(new Date(sDate)) : moment().subtract(7,'d'),
  endDate:  (eDate != '' && eDate != null) ? moment(new Date(eDate)) : moment(),
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
$('#reportrange').daterangepicker(optionSet1,cb);
if((sDate != '' && eDate != '') && (sDate != null && eDate != null)){
  $('#reportrange span').html(moment(new Date(sDate)).format('YYYY.MM.DD') + ' - ' + moment(new Date(eDate)).format('YYYY.MM.DD'));
}
else{
  $('#reportrange span').html(moment().subtract(7,'d').format('YYYY.MM.DD') + ' - ' + moment().format('YYYY.MM.DD'));
}
}
function settingParams(num){
var renewURL = window.location.origin+window.location.pathname;
var param = {};
if(Number.isInteger(num)){
  param.page = num;
  if(typeof history.pushState == 'function'){
    renewURL += '?page='+param.page;
    history.pushState(null, null,renewURL);
  }
}
// 키워드
var keywordValue = $('#selectKeyword option:selected').val();
if(keywordValue != '' && keywordValue != '키워드'){
  param.keyword = keywordValue;
  if(typeof history.pushState == 'function' && Number.isInteger(num)){
    renewURL += '&keyword='+param.keyword;
    history.pushState(null, null,renewURL);
  }
}
// 인비테이션
var ivtValue = $('input[type="checkbox"][name="search"]:checked').length;
if(ivtValue > 0){
  param.ivt = '1';
  if(typeof history.pushState == 'function' && Number.isInteger(num)){
    renewURL += '&ivt='+param.ivt;
    history.pushState(null, null,renewURL);
  }
}
//검색
var searchValue = $('#searchInput').val();
if(searchValue != ''){
  param.searchType = $('#selectSearchType option:selected').val();
  param.search = searchValue;
  if(typeof history.pushState == 'function' && Number.isInteger(num)){
    renewURL += '&search='+encodeURI(param.search);
    renewURL += '&searchType='+param.searchType;
    history.pushState(null, null,renewURL);
  }
}
//날짜검색
var dateArr = $("#reportrange span").text().split(' - ');
if(dateArr.length > 1){
  var start = moment(new Date(dateArr[0]));
  var end = moment(new Date(dateArr[1]));
  param.sDate = start.format('YYYY-MM-DD');
  param.eDate = end.format('YYYY-MM-DD');
  if(typeof history.pushState == 'function' && Number.isInteger(num)){
    renewURL += '&sDate='+param.sDate;
    renewURL += '&eDate='+param.eDate;
    history.pushState(null, null,renewURL);
  }
}
return param;
}
