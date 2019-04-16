// data input hidden values
var sDateValue = $('#sDate').val();
var eDateValue = $('#eDate').val();
$(document).ready(function(){
  settingTableInputDate();
  var keywordValue = $('#keyword').val();
  var limitValue = $('#limit').val();
  var typeValue = $('#type').val();
  var siteValue = $('#site').val();
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
// 그룹핑 클릭시
$(document).on("click",".group",function(){
  $('.preloader2').show();
  var g_idx = $(this).parents('tr').find('#idx').val();
  var title = calByte.cutByteLength($.trim($(this).prev().prev().find('div').text()), 60 );
  var titleArr_s = title.split(' ');
  var titleArr = [];
  var regExp = /[\{\}\[\]\/?.,;:|\‘’“”…)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
  $.each(titleArr_s, function(index, value) {
    var val = value.replace(regExp, "");
    if(val.length > 1){
      titleArr.push(val);
    }
  });
  var param = {
    'list' : JSON.stringify(titleArr)
  };
  if(sDateValue != '' && eDateValue != ''){
    param.sDate = sDateValue;
    param.eDate = eDateValue;
  }
  var searchValue = $('#searchInput').val();
  if(searchValue != ''){
    param.search = searchValue;
  }
  var search2Value = $('#search2').val();
  if(search2Value != ''){
    param.search_b = search2Value;
  }
  $.ajax({
    type: "POST",
    url: "/news/grouping",
    data: param,
    error:function(request,status,error){
      console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
      swal("ERROR!", '새로고침 후 다시 시도해주세요.', "error");
    },
    success:function(data){
      console.log(param);
      console.log(data);
      data.result.sort(function (a, b) {
        return b.count < a.count ? -1 : b.count > a.count ? 1 : 0;
      });
      $('#modalTable tbody').eq(0).empty();
      data.result.forEach(function(item,idx){
        var numIdx = Math.ceil(data.result.length-idx).toString();
        var percent = Math.floor(item.count / titleArr.length * 100);
        var html = '<tr>\
        <input type="hidden" id="idx" value="'+item.media_idx+'" />\
        <td>\
          <div class="border-checkbox-section">\
            <div class="border-checkbox-group border-checkbox-group-default style="max-height: 25px;">\
              <input class="border-checkbox news-checkbox2" type="checkbox" id="checkbox_modal_'+idx+'" '+((item.news_idx != null) ? 'checked' : '')+'>\
              <label class="border-checkbox-label" for="checkbox_modal_'+idx+'"></label>\
            </div>\
          </div>\
        </td>\
        <th>'+numIdx+'</th>\
        <th>'+percent+'%</th>\
        <td><div class="date_nobr">'+item.writeDate+'</div></td>\
        <td><input type="text" name="datefilter" class="datepicker form-control"  value="'+((item.reportDate != null && item.reportDate != '') ? item.reportDate : '')+'"/></td>\
        <td><a onclick="window.open(\''+item.url+'\',\'new\',\'width=#,height=#\')" title="'+item.media_title+'"><div class="title_nobr">';
        if (item.media_subname != 'out'){
          html +='<img alt="'+item.media_subname+'" src="http://showbox.email/images/newsclipping/'+item.media_subname+'_logo.png" class="site-logo">';
        }
        html +=item.media_title+'</div></a></td>\
        <td><input type="text" placeholder="'+item.media_name+'" id="media_name" value="'+item.media_name+'" class="form-control selectText"></td>\
        <td><input type="text" placeholder="'+((item.reporter_name == null)?'':item.reporter_name)+'" id="reporter_name" value="'+((item.reporter_name == null)?'':item.reporter_name)+'" class="form-control selectText"></td>\
        <td><input type="text" id="media_page" class="form-control selectText"  placeholder="'+((item.media_page == null||item.media_page == '')?'':item.media_page)+'" value="'+((item.media_page == null||item.media_page == '')?'':item.media_page)+'"></td>\
        <td><div class="rank_nobr">'+((item.ME_rank == null) ? '<i class="fas fa-minus"></i>' : item.ME_rank+'위')+'</div></td>\
        <td><div class="key_nobr" title="'+item.keyword+'">'+item.keyword+'</div></td>\
        <td><div class="nobr" title="'+item.textType+'">'+((item.textType == null) ? '<i class="fas fa-minus"></i>' : item.textType)+'</div></td>\
        <td>\
          <select class="form-control form-control-default p-l-5 select-news" id="newsType">\
            <option value="0" '+((item.news_type == '0') ? 'selected' : '')+'>-</option>\
            <option value="1" '+((item.news_type == '1') ? 'selected' : (item.title_key == '쇼박스영화') ? 'selected' : '')+'>쇼박스영화</option>\
            <option value="2" '+((item.news_type == '2') ? 'selected' : (item.title_key == '경쟁영화') ? 'selected' : '')+'>경쟁영화</option>\
            <option value="3" '+((item.news_type == '3') ? 'selected' : (item.title_key == '캐스팅') ? 'selected' : '')+'>캐스팅</option>\
            <option value="4" '+((item.news_type == '4') ? 'selected' : (item.title_key == '쇼박스기업뉴스' || item.title_key == '오리온') ? 'selected' : '')+'>쇼박스기업뉴스</option>\
            <option value="5" '+((item.news_type == '5') ? 'selected' : (item.title_key.indexOf('영화일반') != -1) ? 'selected' : '')+'>영화일반-기타</option>\
            <option value="51" '+((item.news_type == '51') ? 'selected' : '')+'>영화일반-인터뷰</option>\
            <option value="52" '+((item.news_type == '52') ? 'selected' : '')+'>영화일반-리뷰</option>\
            <option value="53" '+((item.news_type == '53') ? 'selected' : '')+'>영화일반-예고편</option>\
            <option value="54" '+((item.news_type == '54') ? 'selected' : '')+'>영화일반-포스터</option>\
            <option value="54" '+((item.news_type == '55') ? 'selected' : '')+'>영화일반-화보</option>\
            <option value="6" '+((item.news_type == '6') ? 'selected' : (item.title_key == '보도국') ? 'selected' : '')+'>보도국</option>\
            <option value="7" '+((item.news_type == '7') ? 'selected' : (item.title_key == '박스오피스') ? 'selected' : '')+'>박스오피스</option>\
          </select>\
        </td>\
        <td>\
          <input type="text" placeholder="대표기사" id="news_title" value="'+item.media_idx+'" class="form-control selectText">\
        </td>\
        <td>\
          <input type="text" placeholder="세부기사" id="news_detail" class="form-control selectText" value="'+((g_idx != item.media_idx) ? g_idx : '')+'">\
        </td>';
        $('#modalTable tbody').eq(0).append(html);
      });
      $('.preloader2').fadeOut(500);
      settingTableInputDate();
      $("#group-Modal").modal('show');
    }
  });
});
var calByte = {
  cutByteLength : function(s, len) {
    if (s == null || s.length == 0) {
      return 0;
    }
    var size = 0;
    var rIndex = s.length;
    for ( var i = 0; i < s.length; i++) {
      size += this.charByteSize(s.charAt(i));
      if( size == len ) {
        rIndex = i + 1;
        break;
      } else if( size > len ) {
        rIndex = i;
        break;
      }
    }
    return s.substring(0, rIndex);
  },
  charByteSize : function(ch) {
    if (ch == null || ch.length == 0) {
      return 0;
    }
    var charCode = ch.charCodeAt(0);
    if (charCode <= 0x00007F) {
      return 1;
    } else if (charCode <= 0x0007FF) {
      return 2;
    } else if (charCode <= 0x00FFFF) {
      return 3;
    } else {
      return 4;
    }
  }
};
// 대표기사,썸네일,세부기사 클릭시 텍스트 전체 선택
$(document).on("click",".selectText", function(){
  $(this).select();
});
// 라디오버튼처럼 checkvox name값 설정
$('input[type="checkbox"][name="search"]').on('click',function(){
  //click 이벤트가 발생했는지 체크
  if($(this).prop('checked')){
    // checkbox전체를 checked 해제후 click한 요소만 true지정
    $('input[type="checkbox"][name="search"]').prop('checked',false);
    $(this).prop('checked',true);
    $('#search2').val($(this).val());
    searchStrBtn($(this).val());
  }
  else{
    $('#search2').val('');
    searchStrBtn('');
  }
});
$('input[type="checkbox"][name="rank"]').on('click',function(){
  if($(this).prop('checked')){
    $('#rank').val($(this).val());
    searchNaverVideoBtn($(this).val());
  }
  else{
    $('#rank').val('false');
    searchNaverVideoBtn('false');
  }
});
$('input[type="checkbox"][name="video"]').on('click',function(){
  if($(this).prop('checked')){
    $('#video').val($(this).val());
    searchNaverVideoBtn($(this).val());
  }
  else{
    $('#video').val('false');
    searchNaverVideoBtn('false');
  }
});
$('input[type="checkbox"][name="del"]').on('click',function(){
  if($(this).prop('checked')){
    $('#del').val($(this).val());
    searchNaverVideoBtn($(this).val());
  }
  else{
    $('#del').val('false');
    searchNaverVideoBtn('false');
  }
});
// 단독, 공식 버튼 클릭시
function searchStrBtn(search){
  $('#search2').val(search);
  var param = settingParams(1);
  ajaxGetPageList(param);
}
// 랭킹,비디오,제외 버튼 클릭시
function searchNaverVideoBtn(rank){
  var param = settingParams(1);
  ajaxGetPageList(param);
}
// 검색시
$('#searchInput').on('keyup',function(event){
  if(event.keyCode == 13){
    $('#searchBtn').trigger('click');
  };
});
$('#searchBtn').on('click',function(){
  var inputVal = $("#searchInput").val();
  if(inputVal != ''){
    // param.search=inputVal;
    $('#search').val(inputVal);
  }
  else{
    $('#search').val('');
  }
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
// 페이지 행 선택시
$('#selectNum').on('change',function(){
  var optionVal = $("#selectNum option:selected").val();
  $('#limit').val(optionVal);
  var param = settingParams(1);
  ajaxGetPageList(param);
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
  ajaxGetPageList(param);
});
// 뉴스 전체 선택시
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
// 보고날짜 변경시
$(document).on('change','input[name=datefilter]',function(){
  $('input[name=datefilter]').val($(this).val());
});
//페이지 이동
$(document).on('click','.page-link',function(){
  // var num = Number($(this).text()) || Number($(this).data().num);
  var param = settingParams(Number($(this).data().value));
  ajaxGetPageList(param);
});
function ajaxGetPageList(param){
  console.log('ajaxGetPageList:',param);
  $('.preloader3').show();
  $.ajax({
    url: '/news/getNextPage',
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
          $('#page').val(data.result.currentPage);
        }
        renewURL = renewURL.replace(/\&limit=([0-9]+)/ig,'&limit='+data.result.limit);//현재 주소 중 page 부분이 있다면 새로 부여될 페이지 번호를 할당한다.
        if(renewURL.indexOf("&limit=") == -1){
          renewURL += '&limit='+data.result.limit;
        }
        //페이지 갱신 실행!
        history.pushState(null, null,renewURL);
      }
      $('#listTable tbody').eq(0).empty();

      console.log('data:',data);
      data.result.list.forEach(function(item,idx){
        var numIdx = Math.ceil(data.result.listCount-(data.result.offset+idx)).toString();
        var html = '<tr>\
          <input type="hidden" id="idx" value="'+item.media_idx+'" />\
          <td>\
            <div class="border-checkbox-section">\
              <div class="border-checkbox-group border-checkbox-group-default"  style="max-height: 25px;">\
                <input class="border-checkbox news-checkbox" type="checkbox" id="checkbox'+idx+'" '+((item.news_idx != null) ? 'checked' : '')+'>\
                <label class="border-checkbox-label" for="checkbox'+idx+'"></label>\
              </div>\
            </div>\
          </td>\
          <th>'+numIdx+'</th>\
          <td><div class="date_nobr">'+item.writeDate+'</div></td>\
          <td><input type="text" name="datefilter" class="datepicker form-control"  value="'+((item.reportDate != null && item.reportDate != '') ? item.reportDate : '')+'"/></td>\
          <td><a onclick="window.open(\''+item.url+'\',\'new\',\'width=#,height=#\')" title="'+item.media_title+'"><div class="title_nobr">';
          if (item.media_subname != 'out' && item.media_subname != null){
            html +='<img alt="'+item.media_subname+'" src="http://showbox.email/images/newsclipping/'+item.media_subname+'_logo.png" class="site-logo">';
          }
          html += item.media_title+'</div></a><i class="fas fa-video text-muted" style="'+((item.v_state != 2) ? 'visibility: hidden;' : '')+'"></i>\
            <div class="label-main group" style="margin-right:  0px;display: inline;">\
              <label class="label label-md label-default" style="margin-right:  0px;">그룹핑</label>\
            </div>\
          </td>\
          <td><input type="text" placeholder="'+item.media_name+'" id="media_name" value="'+item.media_name+'" class="form-control selectText"></td>\
          <td><input type="text" placeholder="'+((item.reporter_name == null)?'':item.reporter_name)+'" id="reporter_name" value="'+((item.reporter_name == null)?'':item.reporter_name)+'" class="form-control selectText"></td>\
          <td><input type="text" id="media_page" class="form-control selectText"  placeholder="'+((item.media_page == null||item.media_page == '')?'':item.media_page)+'" value="'+((item.media_page == null||item.media_page == '')?'':item.media_page)+'"></td>\
          <td><div class="rank_nobr">'+((item.ME_rank == null) ? '<i class="fas fa-minus"></i>' : item.ME_rank+'위')+'</div></td>\
          <td><div class="key_nobr" title="'+item.keyword+'">'+item.keyword+'</div></td>\
          <td><div class="nobr" title="'+item.textType+'">'+((item.textType == null) ? '<i class="fas fa-minus"></i>' : item.textType)+'</div></td>\
          <td>\
            <select class="form-control form-control-default p-l-5 select-news" id="newsType">\
              <option value="0" '+((item.news_type == '0') ? 'selected' : '')+'>-</option>\
              <option value="1" '+((item.news_type == '1') ? 'selected' : (item.title_key == '쇼박스영화') ? 'selected' : '')+'>쇼박스영화</option>\
              <option value="2" '+((item.news_type == '2') ? 'selected' : (item.title_key == '경쟁영화') ? 'selected' : '')+'>경쟁영화</option>\
              <option value="3" '+((item.news_type == '3') ? 'selected' : (item.title_key == '캐스팅') ? 'selected' : '')+'>캐스팅</option>\
              <option value="4" '+((item.news_type == '4') ? 'selected' : (item.title_key == '쇼박스기업뉴스' || item.title_key == '오리온') ? 'selected' : '')+'>쇼박스기업뉴스</option>\
              <option value="5" '+((item.news_type == '5') ? 'selected' : (item.title_key.indexOf('영화일반') != -1) ? 'selected' : '')+'>영화일반-기타</option>\
              <option value="51" '+((item.news_type == '51') ? 'selected' : '')+'>영화일반-인터뷰</option>\
              <option value="52" '+((item.news_type == '52') ? 'selected' : '')+'>영화일반-리뷰</option>\
              <option value="53" '+((item.news_type == '53') ? 'selected' : '')+'>영화일반-예고편</option>\
              <option value="54" '+((item.news_type == '54') ? 'selected' : '')+'>영화일반-포스터</option>\
              <option value="54" '+((item.news_type == '55') ? 'selected' : '')+'>영화일반-화보</option>\
              <option value="6" '+((item.news_type == '6') ? 'selected' : (item.title_key == '보도국') ? 'selected' : '')+'>보도국</option>\
              <option value="7" '+((item.news_type == '7') ? 'selected' : (item.title_key == '박스오피스') ? 'selected' : '')+'>박스오피스</option>\
            </select>\
          </td>\
          <td>\
            <input type="text" placeholder="대표기사" id="news_title" value="'+item.media_idx+'" class="form-control selectText">\
          </td>\
          <td>\
            <input type="text" placeholder="세부기사" id="news_detail" class="form-control selectText">\
          </td>';
          $('#listTable tbody').eq(0).append(html);
      });

      var limit = $('#limit').val();
      var pageCount = Math.ceil(data.result.listCount/limit);
      $('#listTable tfoot').eq(0).empty();
      var html = '<tr>';
      if(pageCount > 1) {
        html += '<td colspan="6"><button id="addBtn" class="btn btn-list alert-check p-r-5 p-l-5 m-l-15 m-b-5  f-left m-t-5"><i class="fas fa-angle-down"></i>선택저장</button></td>';
        html += '<td colspan="8"><ul class="pagination float-right">';
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
          html += '<li class=\"'+active+' page-item"><a class="page-link" data-value=\"'+index+'"\ >'+index+'</a></li>'
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
          html += '<td colspan="14"><button id="addBtn" class="btn btn-list alert-check p-r-5 p-l-5 m-l-15 m-b-5  f-left m-t-5"><i class="fas fa-angle-down"></i>선택저장</button></td>';
        }
        html += '</tr>';
        $('#listTable tfoot').eq(0).append(html);
        settingTableInputDate();
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
          // thumbnail:trEle.find('#thumbnail').val(),
          mName:trEle.find('#media_name').val(),
          mPage:trEle.find('#media_page').val(),
          rName:trEle.find('#reporter_name').val(),
          date:trEle.find('input[name="datefilter"]').val(),
          code:trEle.find('#newsType option:selected').val(),
          detail:trEle.find('#news_detail').val()});
        });
        addNews(list);
      }
    });
  });
  function addNews(arr){
    $('input[type=checkbox]:checked').prop('checked',false);
    $.ajax({
      type: "POST",
      url: "/news/addNews",
      data: {'list' : JSON.stringify(arr)},
      error:function(request,status,error){
        console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
        swal("ERROR!", '새로고침 후 다시 시도해주세요.', "error");
      },
      success:function(data){
        if(data.status){
          swal("SUCCESS!", '선택저장 완료했습니다.', "success")
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
    var param = settingParams(pageValue);
    ajaxGetPageList(param);
  }
// 모달부분처리
$('#checkboxAll2').on('click',function(){
  var checkBool = null;
  if($(this).is(":checked")){
    checkBool = true;
  }else{
    checkBool = false;
  }
  $('.news-checkbox2').prop('checked', checkBool);
});
$(document).on('click','.news-checkbox2',function(){
  $('#checkboxAll2').prop('checked', false);
});
$(document).on('click','#addBtn2',function(){
  if($('input.news-checkbox2[type=checkbox]:checked').length < 1){
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
      $('input.news-checkbox2[type=checkbox]:checked').each(function(idx,ele){
        var trEle = $(ele).parents('tr');

        list.push({
          idx:trEle.find('#idx').val(),
          mName:trEle.find('#media_name').val(),
          mPage:trEle.find('#media_page').val(),
          rName:trEle.find('#reporter_name').val(),
          date:trEle.find('input[name="datefilter"]').val(),
          code:trEle.find('#newsType option:selected').val(),
          detail:trEle.find('#news_detail').val()});
      });
      $('#group-Modal').modal('hide');
      addNews(list);
    }
  });
});
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
var sDateValue = $('#sDate').val();
var eDateValue = $('#eDate').val();
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
  //사이트
  var siteValue = $('#site').val();
  if(siteValue != ''){
    param.site = siteValue;
  }
  //페이징
  var limitValue = $('#limit').val();
  if(limitValue != ''){
    param.limit = limitValue;
  }
  // 단독, 공식
  var search2Value = $('#search2').val();
  if(search2Value != ''){
    param.search_b = search2Value;
  }
  // 영상
  var videoValue = $('#video').val();
  if(videoValue != ''){
    param.video = videoValue;
  }
  //순위
  var rankValue = $('#rank').val();
  if(rankValue != '' && rankValue != 'false'){
    param.rank = rankValue;
  }
  //제외
  var delValue = $('#del').val();
  if(delValue != '' && delValue != 'false'){
    param.del = delValue;
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
