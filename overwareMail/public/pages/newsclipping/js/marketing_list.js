// data input hidden values
var sDateValue = $('#sDate').val();
var eDateValue = $('#eDate').val();
var keywordValue = $('#keyword').val();
$(document).ready(function(){
  settingTableInputDate();
  if(keywordValue != ''){
    $("#selectKeyword option[value='"+keywordValue+"']").attr('selected','selected');
  }
  $('#reportrange').daterangepicker(optionSet1,cb);

  if(sDateValue == '' && eDateValue == ''){
    $('#reportrange span').html(moment().format('YYYY.MM.DD') + ' - ' + moment().format('YYYY.MM.DD'));
  }
  else{
    $('#reportrange span').html(moment(new Date(sDateValue)).format('YYYY.MM.DD') + ' - ' + moment(new Date(eDateValue)).format('YYYY.MM.DD'));
  }
});
// 검색시
$('#searchInput').on('keyup',function(event){
  if(event.keyCode == 13){
    $('#searchBtn').trigger('click');
  };
});
$('#searchBtn').on('click',function(){
  var url = '/marketing/list?page=1';
  var search = $("#searchInput").val();
  if(search != ''){
    url += '&search='+$.urlPostParam(search);
  }
  location.href = url;
});
// 대표기사,썸네일,세부기사 클릭시 텍스트 전체 선택
$(document).on("click",".selectText", function(){
  $(this).select();
});
// 기사입력 클릭시
$(document).on("click","#newsAddBtn",function(){
  // modal 초기화
  $('#m_keyword').find('option:first').prop('selected', 'selected');
  $('#m_text_type').find('option:first').prop('selected', 'selected');
  $('#m_news_type').find('option:first').prop('selected', 'selected');
  $('#m_media_content').val('');
  $('#news-Modal input').val('');

  $("#news-Modal").modal('show');
});
// 기사입력 submit 시
$('#submit').on("click",function(){
  var param = {
    writeDate:$('#m_writeDate').val()+' '+$('#m_writeDateTime').val(),
    media_title:$('#m_media_title').val(),
    media_content:$('#m_media_content').val(),
    title_key:$('#m_keyword option:selected').val(),
    keyword:$('#m_keyword option:selected').val(),
    url:$('#m_url').val(),
    textType:$('#m_text_type').val(),
    media_name:$('#m_media_name').val()
  }
  // 작성일
  var datetime_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1]) (0[0-9]|1[0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])$/;
  if(!datetime_pattern.test(param.writeDate)){
    alert('작성일을 다시 입력해주세요');
  }
  // 키워드
  else if(param.keyword == '키워드'){
    alert('키워드를 선택해주세요');
  }
  // 제목
  else if(param.media_title == ''){
    alert('제목을 입력해주세요');
  }
  // 내용
  else if(param.media_content == ''){
    alert('내용을 입력해주세요');
  }
  // 언론사
  else if(param.media_name == ''){
    alert('언론사를 입력해주세요');
  }
  // url
  else if(param.url == ''){
    alert('URL을 입력해주세요');
  }
  else{
    var reporter_name = $('#m_reporter_name').val();
    var thumbnail = $('#m_thumbnail').val();
    var news_type = $('#m_news_type option:selected').val();
    var news_detail = $('#m_news_detail').val();
    if(reporter_name != ''){
      param['reporter_name'] = reporter_name;
    }
    if(thumbnail != ''){
      param['thumbnail'] = thumbnail;
    }
    if(news_type != ''){
      param['news_type'] = news_type;
    }
    if(news_detail != ''){
      param['news_detail'] = news_detail;
    }

    swal({
      title: "등록 하시겠습니까?",
      icon: "warning",
      buttons: ["취소", true],
      dangerMode: true,
    }).then(function(value) {
      if (value != null) {
        $.ajax({
          type: "POST",
          url: "/marketing/list/insert",
          data: param,
          error:function(request,status,error){
            console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
            swal("ERROR!", '새로고침 후 다시 시도해주세요.', "error");
          },
          success:function(data){
            if(data.status){
              swal("SUCCESS!", '기사가 등록되었습니다.', "success")
              .then(function(value) {
                reloadPage();
                $("#news-Modal").modal('hide');
              });
            }else{
              swal("ERROR!", '새로고침 후 다시 시도해주세요.', "error");
            }
          }
        });
      }
    });
  }
});
// 키워드 선택시
$('#selectKeyword').on('change',function(){
  var param = {
    page : 1
  };
  var optionVal = $("#selectKeyword option:selected").val();
  if(optionVal != '키워드'){
    param.keyword=optionVal;
    $('#keyword').val(optionVal);
  }
  else{
    $('#keyword').val('');
  }
  // data input hidden values
  var sDateValue = $('#sDate').val();
  var eDateValue = $('#eDate').val();
  if(sDateValue != '' && eDateValue != ''){
    param.sDate = sDateValue;
    param.eDate = eDateValue;
  }
  var searchValue = $('#searchInput').val();
  if(searchValue != ''){
    param.search = searchValue;
  }
  ajaxGetPageList(param,0);
});
// 삭제 클릭시
$(document).on('click','.btn-delete',function(){
  var trEle = $(this).parents('tr');
  swal({
    title: "삭제 하시겠습니까?",
    icon: "warning",
    buttons: ["취소", true],
    dangerMode: true,
  }).then(function(value) {
    if (value != null) {
      console.log(trEle.find('#idx').val())
      $.ajax({
        type: "POST",
        url: "/marketing/list/delete",
        data: {
          'table' : 'marketing_'+trEle.find('#type').val()+'_mail',
          'idx' : trEle.find('#idx').val()
        },
        error:function(request,status,error){
          console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
          swal("ERROR!", '새로고침 후 다시 시도해주세요.', "error");
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
  });
});
// 수정 클릭시
$(document).on('click','.btn-edit',function(){
  var trEle = $(this).parents('tr');
  swal({
    title: "수정 하시겠습니까?",
    text: "썸네일과 기자분류가 입력하신 정보로 수정됩니다.",
    icon: "warning",
    buttons: ["취소", true],
    dangerMode: true,
  }).then(function(value) {
    if (value != null) {
      $.ajax({
        type: "POST",
        url: "/marketing/list/update",
        data: {
          'table' : 'marketing_'+trEle.find('#type').val()+'_mail',
          'date':trEle.find('input[name="datefilter"]').val(),
          'title' : trEle.find('#title').val(),
          'idx' : trEle.find('#idx').val()
        },
        error:function(request,status,error){
          console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
          swal("ERROR!", '새로고침 후 다시 시도해주세요.', "error");
        },
        success:function(data){
          if(data.status){
            swal("SUCCESS!", '수정 되었습니다.', "success")
            .then(function(value) {
              reloadPage();
            });
          }else{
            swal("ERROR!", '새로고침 후 다시 시도해주세요.', "error");
          }
        }
      });
    }
  });
});
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
  var searchValue = $('#searchInput').val();
  if(searchValue != ''){
    param.search = searchValue;
  }
  ajaxGetPageList(param,num);
});
function ajaxGetPageList(param){
  console.log('ajaxGetPageList:',param);
  $.ajax({
    url: '/marketing/list/getNextPage',
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
        renewURL = renewURL.replace(/\?page=([0-9]+)/ig,'?page='+data.result.page);//현재 주소 중 page 부분이 있다면 새로 부여될 페이지 번호를 할당한다.
        if(renewURL.indexOf("?page=") == -1){
          renewURL += '?page='+data.result.page;
        }
        //페이지 갱신 실행!
        history.pushState(null, null,renewURL);
      }
      $('#listTable tbody').eq(0).empty();

      console.log(data);
      $("#page").val(data.result.page);
      $("#sDate").val(param.sDate);
      $("#eDate").val(param.eDate);

      data.result.list.forEach(function(item,idx){
        var numIdx = Math.ceil(data.result.listCount-(data.result.offset+idx)).toString();
        var html = '<tr>\
        <input type="hidden" id="idx" value="'+item.n_idx+'" />\
        <input type="hidden" id="type" value="'+item.m_type+'" />\
        <th>'+numIdx+'</th>\
        <td>'+item.writeDate+'</td>\
        <td><input type="text" name="datefilter" class="datepicker form-control"  value="'+((item.reportDate != null && item.reportDate != '') ? item.reportDate : '')+'"/></td>\
        <td><div class="nobr" title ="'+item.ps_writer+'">'+item.ps_writer+'</div></td>\
        <td><span id="cnt">'+item.total_cnt+'</span>건</td>\
        <td>'+item.view_cnt+'회</td>\
        <td>'+item.reply_cnt+'회</td>\
        <td>'+item.like_cnt+'회</td>\
        <td>\
          <a href="'+item.url+'" target="_blank" title="'+item.ps_content+'">\
            <div class="title_nobr">'+item.ps_content+'</div>\
          </a>\
        </td>\
        <td><input type="text" placeholder="제목" id="title" value="'+item.ps_title+'" class="form-control  title_input"/></td>';
        html+='<td><button class="btn btn-sm btn-danger btn-delete"><i class="far fa-trash-alt"></i></button>&nbsp;\
        <button class="btn btn-sm btn-primary btn-edit"><i class="far fa-edit"></i></button></td>';
        $('#listTable tbody').eq(0).append(html);
      });
      settingTableInputDate();
      var limit = 10;
      var pageCount = Math.ceil(data.result.listCount/limit);
      $('#listTable tfoot').eq(0).empty();
      if(pageCount > 1) {
        var html = '<tr>';
        html += '<td colspan="11"><ul class="pagination float-right">';
        var pageSize = 5;
        var pRCnt = parseInt(data.result.page / pageSize);
        if(data.result.page % pageSize == 0){
          pRCnt = parseInt(data.result.page / pageSize) - 1;
        }
        if(data.result.page > 5) {
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
          var active = (data.result.page == index) ? "active" : "";
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
        html += '</tr>';
      }
      $('#listTable tfoot').eq(0).append(html);
    }
  });
}
function reloadPage(){
  console.log('reloadPage');
  var pageValue = ($("#page").val() == '') ? 1 : parseInt($("#page").val());
  var param = {
    page : pageValue
  };
  var sDateValue = $('#sDate').val();
  var eDateValue = $('#eDate').val();
  var keywordValue = $('#keyword').val();
  if(sDateValue != '' && eDateValue != '' ){
    param.sDate = moment(sDateValue).format('YYYY-MM-DD');
    param.eDate = moment(eDateValue).format('YYYY-MM-DD');
  }
  if(keywordValue != ''){
    param.keyword = keywordValue;
  }
  var searchValue = $('#searchInput').val();
  if(searchValue != ''){
    param.search = searchValue;
  }
  ajaxGetPageList(param);
}
// 모달 달력
$('#m_writeDate').daterangepicker({
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

  // data input hidden values
  var keywordValue = $('#keyword').val();
  if(keywordValue != ''){
    param.keyword = keywordValue;
  }
  var searchValue = $('#searchInput').val();
  if(searchValue != ''){
    param.search = searchValue;
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
