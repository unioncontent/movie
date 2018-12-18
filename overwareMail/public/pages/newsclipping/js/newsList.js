// data input hidden values
var sDateValue = $('#sDate').val();
var eDateValue = $('#eDate').val();
$(document).ready(function(){
  var keywordValue = $('#keyword').val();
  var limitValue = $('#limit').val();
  var typeValue = $('#type').val();
  var siteValue = $('#site').val();
  settingTableInputDate();
  if(keywordValue != ''){
    $("#selectKeyword option[value='"+keywordValue+"']").attr('selected','selected');
  }
  if(typeValue != ''){
    $("#selectNewsType option[value='"+typeValue+"']").attr('selected','selected');
  }
  if(siteValue != ''){
    $("#selectSite option[value='"+siteValue+"']").attr('selected','selected');
  }
  if(limitValue != ''){
    $("#selectNum option[value='"+limitValue+"']").attr('selected','selected');
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
  var param = settingParams(1);
  ajaxGetPageList(param);
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
  $('#m_writeDateTime').val('00:00:00');

  $("#news-Modal").modal('show');
});
// 사이트 선택시
$('#selectSite').on('change',function(){
  var optionVal = $("#selectSite option:selected").val();
  if(optionVal != 'all'){
    $('#site').val(optionVal);
  }
  else{
    $('#site').val('');
  }
  var param = settingParams(1);
  ajaxGetPageList(param);
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
  // 제목
  else if(param.media_title == ''){
    alert('제목을 입력해주세요');
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
    var media_page = $('#m_media_page').val();
    var thumbnail = $('#m_thumbnail').val();
    var news_type = $('#m_news_type option:selected').val();
    var news_detail = $('#m_news_detail').val();
    if(reporter_name != ''){
      param['reporter_name'] = reporter_name;
    }
    if(media_page != ''){
      param['media_page'] = media_page;
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
          url: "/news/list/insert",
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
// 페이지 행 선택시
$('#selectNum').on('change',function(){
  var optionVal = $("#selectNum option:selected").val();
  $('#limit').val(optionVal);
  var param = settingParams(1);
  ajaxGetPageList(param);
});
// 뉴스 대분류 선택시
$('#selectNewsType').on('change',function(){
  var optionVal = $("#selectNewsType option:selected").val();
  if(optionVal != '0'){
    $('#type').val(optionVal);
  }
  else{
    $('#type').val('');
  }
  var param = settingParams(1);
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
        url: "/news/list/delete",
        data: {'idx' : trEle.find('#idx').val()},
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
        url: "/news/list/update",
        data: {
          // 'thumbnail' : trEle.find('#thumbnail').val(),
          'date':trEle.find('input[name="datefilter"]').val(),
          'page':trEle.find('#media_page').val(),
          'news_type' : trEle.find('#newsType option:selected').val(),
          'news_detail' : trEle.find('#news_detail').val(),
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
  var param = settingParams(Number($(this).data().value));
  ajaxGetPageList(param);
});
function ajaxGetPageList(param){
  console.log('ajaxGetPageList:',param);
  $.ajax({
    url: '/news/list/getNextPage',
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
        renewURL = renewURL.replace(/\&limit=([0-9]+)/ig,'&limit='+data.result.limit);//현재 주소 중 page 부분이 있다면 새로 부여될 페이지 번호를 할당한다.
        if(renewURL.indexOf("&limit=") == -1){
          renewURL += '&limit='+data.result.limit;
        }
        //페이지 갱신 실행!
        history.pushState(null, null,renewURL);
      }
      $('#listTable tbody').eq(0).empty();

      console.log(data);
      $("#page").val(data.result.currentPage);
      $("#sDate").val(param.sDate);
      $("#eDate").val(param.eDate);
      $("#keyword").val(param.keyword);
      $("#limit").val(param.limit);

      data.result.list.forEach(function(item,idx){
        var numIdx = Math.ceil(data.result.listCount-(data.result.offset+idx)).toString();
        var html = '<tr>\
        <input type="hidden" id="idx" value="'+item.media_idx+'" />\
        <th>'+numIdx+'</th>\
        <td><a onclick="window.open(\''+item.url+'\',\'new\',\'width=#,height=#\')" title="'+item.media_title+'"><div class="title_nobr">';
        if (item.media_subname != 'out' && item.media_subname != null){
          html +='<img alt="'+item.media_subname+'" src="http://showbox.email/images/newsclipping/'+item.media_subname+'_logo.png" class="site-logo">';
        }
        html +=item.media_title+'</div></a></td><td><div class="nobr" title="'+item.media_name+'">'+item.media_name+'</div></td>';
        html+='<td><div class="nobr" title="'+item.reporter_name+'">'+((item.reporter_name == null||item.reporter_name == '') ? '<i class="fas fa-minus"></i>' : item.reporter_name)+'</div></td>\
        <td><input type="text" id="media_page" class="form-control selectText" placeholder="'+((item.media_page == null||item.media_page == '')?'':item.media_page)+'" value="'+((item.media_page == null||item.media_page == '')?'':item.media_page)+'"></td>\
        <td>'+item.writeDate+'</td>\
        <td><input type="text" name="datefilter" class="datepicker form-control"  value="'+((item.reportDate != null && item.reportDate != '') ? item.reportDate : '')+'"/></td>\
        <td><div class="rank_nobr">'+((item.me_rank == null||item.me_rank == '') ? '<i class="fas fa-minus"></i>' : item.me_rank+'위')+'</div></td>\
        <td><div class="key_nobr" title="'+item.keyword+'">'+((item.keyword == null||item.keyword == '') ? '<i class="fas fa-minus"></i>' : item.keyword)+'</div></td>\
        <td><div class="nobr">'+((item.textType == null) ? '<i class="fas fa-minus"></i>' : item.textType)+'</div></td>';
        html+='<td><select class="form-control form-control-default p-l-5 select-news" id="newsType">\
          <option value="1" '+((item.news_type == '1') ? 'selected' : '')+'>쇼박스영화</option>\
          <option value="2" '+((item.news_type == '2') ? 'selected' : '')+'>경쟁영화</option>\
          <option value="3" '+((item.news_type == '3') ? 'selected' : '')+'>캐스팅</option>\
          <option value="4" '+((item.news_type == '4') ? 'selected' : '')+'>쇼박스기업뉴스</option>\
          <option value="5" '+((item.news_type == '5') ? 'selected' : '')+'>영화일반</option>\
          <option value="6" '+((item.news_type == '6') ? 'selected' : '')+'>보도국</option>\
          <option value="7" '+((item.news_type == '7') ? 'selected' : '')+'>박스오피스</option>\
        </select></td>';
        html+='<td><input type="text" placeholder="대표기사" id="news_title" value="'+item.media_idx+'" class="form-control selectText"></td><td><input type="text" placeholder="세부기사" id="news_detail" value="'+((item.news_detail == null) ? '' : item.news_detail)+'" class="form-control selectText"></td>\
        <td><button class="btn btn-sm btn-danger btn-delete"><i class="far fa-trash-alt"></i></button>&nbsp;<button class="btn btn-sm btn-primary btn-edit"><i class="far fa-edit"></i></button></td>';
        $('#listTable tbody').eq(0).append(html);
      });
      settingTableInputDate();
      var limit = data.result.limit;
      var pageCount = Math.ceil(data.result.listCount/limit);
      $('#listTable tfoot').eq(0).empty();
      var html ='<tr>';
      if(pageCount > 1) {
        html += '<td colspan="5"><button id="newsAddBtn" class="btn btn-warning alert-check p-r-5 p-l-5 m-l-15 m-b-5  f-left m-t-5"><i class="fas fa-file-alt"></i>기사입력</button></td>'
        html += '<td colspan="9"><ul class="pagination float-right">';
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
      else {
        html += '<td colspan="14"><button id="newsAddBtn" class="btn btn-warning alert-check p-r-5 p-l-5 m-l-15 m-b-5  f-left m-t-5"><i class="fas fa-file-alt"></i>기사입력</button></td>'
      }
      html += '</tr>';
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
  var typeValue = $('#type').val();
  if(typeValue != ''){
    param.type = typeValue;
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
// 리스트 조건 세팅
function settingParams(num){
  var param = {
    page : num
  };
  //키워드
  var keywordValue = $('#keyword').val();
  if(keywordValue != ''){
    param.keyword = keywordValue;
  }
  //대분류
  var typeValue = $('#type').val();
  if(typeValue != ''){
    param.type = typeValue;
  }
  //페이징
  var limitValue = $('#limit').val();
  if(limitValue != ''){
    param.limit = limitValue;
  }
  //사이트
  var siteValue = $('#site').val();
  if(siteValue != ''){
    param.site = siteValue;
  }
  //날짜
  var sDateValue = $('#sDate').val();
  var eDateValue = $('#eDate').val();
  if(sDateValue != '' && eDateValue != ''){
  param.sDate = sDateValue;
  param.eDate = eDateValue;
  }
  //검색
  var searchValue = $('#searchInput').val();
  if(searchValue != ''){
    param.search = searchValue;
  }
  return param;
}
