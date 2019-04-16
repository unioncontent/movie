// data input hidden values
var sDateValue = $('#sDate').val();
var eDateValue = $('#eDate').val();
$(document).ready(function(){
  settingTableInputDate();
  $('#reportrange').daterangepicker(optionSet1,cb);

  if(sDateValue == '' && eDateValue == ''){
    $('#reportrange span').html(moment().format('YYYY.MM.DD') + ' - ' + moment().format('YYYY.MM.DD'));
  }
  else{
    $('#reportrange span').html(moment(new Date(sDateValue)).format('YYYY.MM.DD') + ' - ' + moment(new Date(eDateValue)).format('YYYY.MM.DD'));
  }
});
// 리스트 전체 선택시
$('#checkboxAll').on('click',function(){
  var checkBool = null;
  if($(this).is(":checked")){
    checkBool = true;
  }else{
    checkBool = false;
  }
  $('.news-checkbox').prop('checked', checkBool);
});
$(document).on('click','.news-checkbox',function(){
  $('#checkboxAll').prop('checked', false);
});
// 선택저장 클릭시
$(document).on('click','#addBtn',function(){
  if($('input.news-checkbox[type=checkbox]:checked').length < 1){
    swal("ERROR!", '체크박스를 선택해주세요.', "error");
    return false;
  }
  swal({
    title: "선택저장 처리 하시겠습니까?",
    icon: "warning",
    buttons: ["취소", true],
    dangerMode: true,
  }).then(function(value) {
    if (value != null) {
      var list = [];
      $('input.news-checkbox[type=checkbox]:checked').each(function(idx,ele){
        var trEle = $(ele).parents('tr');
        list.push({
          idx:trEle.find('#idx').val(),
          table:'marketing_sns_mail',
          date:trEle.find('input[name="datefilter"]').val(),
          cnt:trEle.find('#cnt').text().replace(/[,]/gi,''),
          v_cnt:trEle.find('#v_cnt').text().replace(/[,]/gi,''),
          l_cnt:trEle.find('#l_cnt').text().replace(/[,]/gi,''),
          r_cnt:trEle.find('#r_cnt').text().replace(/[,]/gi,''),
          s_cnt:trEle.find('#s_cnt').val().replace(/[,]/gi,''),
          title:trEle.find('#title').val()
        });
      });
      $('#checkboxAll').prop('checked', false);
      addMarketing(list);
    }
  });
});
function addMarketing(arr){
  // $('input[type=checkbox]:checked').prop('checked',false);
  $.ajax({
    type: "POST",
    url: "/marketing/add",
    data: {'list' : JSON.stringify(arr)},
    error:function(request,status,error){
      console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
      swal("ERROR!", '새로고침 후 다시 시도해주세요.', "error");
    },
    success:function(data){
      if(data.status){
        swal("SUCCESS!", '선택저장 완료했습니다.', "success");
      }else{
        swal("ERROR!", '새로고침 후 다시 시도해주세요.', "error");
      }
    }
  });
}
// 보고날짜 변경시
$(document).on('change','input[name=datefilter]',function(){
  $('input[name=datefilter]').val($(this).val());
});
// 검색시
$('#searchInput').on('keyup',function(event){
  if(event.keyCode == 13){
    $('#searchBtn').trigger('click');
  };
});
$('#searchBtn').on('click',function(){
  var url = '/marketing/facebook/'+$('#writer').val()+'?page=1';
  var search = $("#searchInput").val();
  if(search != ''){
    url += '&search='+$.urlPostParam(search);
  }
  location.href = url;
});
//페이지 이동
$(document).on('click','.page-link',function(){
  var num = Number($(this).text()) || Number($(this).data().num);
  var param = {
    page : Number($(this).data().value),
    writer : $('#writer').val()
  };
  // data input hidden values
  var sDateValue = $('#sDate').val();
  var eDateValue = $('#eDate').val();
  var searchValue = $('#searchInput').val();
  if(sDateValue != '' && eDateValue != '' ){
    param.sDate = moment(sDateValue).format('YYYY-MM-DD');
    param.eDate = moment(eDateValue).format('YYYY-MM-DD');
  }
  if(searchValue != ''){
    param.search = searchValue;
  }
  ajaxGetPageList(param,num);
});
function ajaxGetPageList(param){
  console.log('ajaxGetPageList:',param);
  $('.preloader3').show();
  $.ajax({
    url: '/marketing/facebook/getNextPage',
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
      if(typeof history.pushState == 'function'){
        var renewURL = location.href;//현재 주소를 가져온다.
        renewURL = renewURL.replace(/\?page=([0-9]+)/ig,'?page='+data.result.currentPage);//현재 주소 중 page 부분이 있다면 새로 부여될 페이지 번호를 할당한다.
        if(renewURL.indexOf("?page=") == -1){
          renewURL += '?page='+data.result.currentPage;
        }
        //페이지 갱신 실행!
        history.pushState(null, null,renewURL);
      }

      $('#listTable tbody').eq(0).empty();
      data.result.list.forEach(function(item,idx){
        var numIdx = Math.ceil(data.result.listCount-(data.result.offset+idx)).toString();
        var html = '<tr>\
        <input type="hidden" id="idx" value="'+item.sns_idx+'" />\
        <td>\
          <div class="border-checkbox-section" style="max-width: 30px;">\
            <div class="border-checkbox-group border-checkbox-group-default">\
              <input class="border-checkbox news-checkbox" type="checkbox" id="checkbox'+idx+'" '+((item.marketing_idx != null) ? 'checked' : '')+'>\
              <label class="border-checkbox-label" for="checkbox'+idx+'"></label>\
            </div>\
          </div>\
        </td>\
          <th>'+numIdx+'</th>\
          <td>'+item.writeDate+'</td>\
          <td><input type="text" name="datefilter" class="datepicker form-control"  value="'+((item.reportDate != null && item.reportDate != '') ? item.reportDate : '')+'"/></td>\
          <td><span id="cnt">'+item.total_cnt+'</span>건</td>\
          <td><span id="v_cnt">'+item.view_cnt+'</span>회</td>\
          <td><span id="r_cnt">'+item.reply_cnt+'</span>회</td>\
          <td><span id="l_cnt">'+item.like_cnt+'</span>회<input type="hidden" id="s_cnt" value="'+item.share_cnt+'"/></td>\
          <td>\
            <a href="'+item.url+'" target="_blank" title="'+item.sns_content+'">\
              <div class="title_nobr">'+item.sns_content+'</div>\
            </a>\
          </td>\
          <td><input type="text" placeholder="제목"  id="title" value="'+ ((item.sns_subcontent  == null) ? '' :item.sns_subcontent)+'"class="form-control title_input"/></td>\
        </tr>';
        $('#listTable tbody').eq(0).append(html);
      });
      settingTableInputDate();
      var limit = 10;
      var pageCount = Math.ceil(data.result.listCount/limit);
      $('#listTable tfoot').eq(0).empty();
      var html = '<tr>';
      if(pageCount > 1) {
        html += '<td colspan="6"><button id="addBtn" class="btn btn-list alert-check p-r-5 p-l-5 m-l-15 m-b-5  f-left m-t-5"><i class="fas fa-angle-down"></i>선택저장</button></td>';
        html += '<td colspan="4"><ul class="pagination float-right">';
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
        html += '</ul></td>';
      }
      else{
        html += '<td colspan="10"><button id="addBtn" class="btn btn-list alert-check p-r-5 p-l-5 m-l-15 m-b-5  f-left m-t-5"><i class="fas fa-angle-down"></i>선택저장</button></td>';
      }
      html += '</tr>';
      $('#listTable tfoot').eq(0).append(html);
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
    eDate : end.format('YYYY-MM-DD'),
    writer : $('#writer').val()
  };
  $('#sDate').val(param.sDate);
  $('#eDate').val(param.eDate);
  var searchValue = $('#searchInput').val();
  if(searchValue != ''){
    param.search = searchValue;
  }
  if(typeof(history.pushState) == 'function'){
    var renewURL = location.href;
    if(renewURL.indexOf("?page=") == -1){
      renewURL += '?page=1';
    }
    else{
      renewURL = renewURL.replace(/\?page=([0-9]+)/ig,'?page=1');
    }
    if(renewURL.indexOf("&sDate=") == -1 && renewURL.indexOf("&eDate=") == -1){
      renewURL += '&sDate='+param.sDate+'&eDate='+param.eDate;
    }
    else{
      renewURL = renewURL.replace(/\&sDate=(\d{4}-\d{2}-\d{2})/ig,'&sDate='+param.sDate);
      renewURL = renewURL.replace(/\&eDate=(\d{4}-\d{2}-\d{2})/ig,'&eDate='+param.eDate);
    }
    //페이지 갱신 실행!
    history.pushState(null, null,renewURL);
  }
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
// 일일보고날짜
function settingTableInputDate(){
  $(document).find("input[name=datefilter]").daterangepicker({
    singleDatePicker: true,
    showDropdowns: true,
    locale: {
      format: 'YYYY-MM-DD',
      "customRangeLabel": "Custom",
      "daysOfWeek": [
        "일", "월", "화", "수", "목", "금", "토"
      ],
      "monthNames": [
        "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"
      ],
    }
  });
}
