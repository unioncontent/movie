/* 주소록 modal js */
// 주소록 열기
$(".btn-modal").on("click",function(){
  var recipiIdxValueArr = $('.recipi-select').val();
  var recipiIdxTextArr = [];//$.trim($('.recipi-select').text()).split('&gt;');
  $.each($('.select2-selection__rendered').eq(1).find('li'),function(idx,ele){
    // console.log($(ele).attr('title'));
    recipiIdxTextArr.push($(ele).attr('title'));
  });
  modalboxSetting('recipi',recipiIdxValueArr,recipiIdxTextArr);
  console.log(recipiIdxValueArr,recipiIdxTextArr);

  var groupIdxValueArr = $('.group-select').val();
  var groupIdxTextArr = [];//$.trim($('.group-select').text()).split('&gt;');
  $.each($('.select2-selection__rendered').eq(2).find('li'),function(idx,ele){
    // console.log($(ele).attr('title'));
    groupIdxTextArr.push($(ele).attr('title'));
  });
  console.log(groupIdxValueArr,groupIdxTextArr);
  modalboxSetting('group',groupIdxValueArr,groupIdxTextArr);

  // 열기 전 페이징 체크 후 버튼 제거
  // $('.paging .count').each(function() {
  //   if($(this).text() == '1'){
  //     $(this).next('.bottomBtn').hide();
  //   }
  // });
  $("#mailList-Modal").modal('show');
});
// 주소록 li setting
function modalboxSetting(name,arr,textArr){
  textArr.pop();
  $("#"+name+"Ul").empty();
  $('#'+name+'Ul').parents('.selectedBox').find('.text-info').text('0');
  if(arr.length == 0){
    return false;
  }
  var groupT = (name == 'group') ? '_g' : '';
  arr.forEach(function(ele,idx){
    var nidx = ele;
    var text = $.trim(textArr[idx]).replace('\n','');
    var html = '<li><input type="checkbox" id="selected_chk'+idx+groupT+'" value="'+nidx+'" title="'+text+'">\
    <label for="selected_chk'+idx+groupT+'" title="'+text+'">'+text+'</label></li>';
    $("#"+name+"Ul").append(html);
  });
  $('#'+name+'Ul').parents('.selectedBox').find('.text-info').text(arr.length);
}
// 주소록 적용버튼 클릭시
$('#saveBtn').on('click',function(){
  var selectGroup = $("#groupUl input").get();
  var selectRecipi = $("#recipiUl input").get();
  $('.group-select').empty();
  $('.recipi-select').empty();
  $('#M_recipi').val(null).trigger("change");
  $('#M_group').val(null).trigger("change");
  selectGroup.forEach(function(ele,idx){
    var param = {
      id:$(ele).val(),
      text:$(ele).prop('title')
    };
    pushEle($('.group-select'),param);
  });
  selectRecipi.forEach(function(ele,idx){
    var param = {
      id:$(ele).val(),
      text:$(ele).prop('title')
    };
    pushEle($('.recipi-select'),param);
  });
  $("#mailList-Modal").modal('hide');
});
function pushEle(tag,data){
  data.text = data.text.replace('<','&lt;').replace('>','\n&gt;');
  var newOption = new Option($.trim(data.text), data.id, true, true);
  tag.append(newOption).trigger('change');
}

// 전체선택 js
$(".allCheck").on('change',function(e){
  var checkBool = null;
  if($(this).is(":checked")){
    checkBool = true;
  }else{
    checkBool = false;
  }
  if($(this).val() == "All"){
    $('#chk_1').prop('checked', checkBool);
    $('#chk_2').prop('checked', checkBool);
    $('#chk_3').prop('checked', checkBool);
    $(".submenu").eq(1).find('input[type=checkbox]').prop('checked', checkBool);
    $(".submenu").eq(2).find('input[type=checkbox]').prop('checked', checkBool);
  }
  else if($(this).val() == "emailAll"){
    $('#chk_2').prop('checked', checkBool);
    $(".submenu").eq(2).find('input[type=checkbox]').prop('checked', checkBool);
  }
  else{
    $('#chk_3').prop('checked', checkBool);
    $(".submenu").eq(1).find('input[type=checkbox]').prop('checked', checkBool);
  }
  e.stopPropagation();
});
$('.emailLi input[type=checkbox]').on('change',function(){
  $('#chk_1').prop('checked', false);
  $('#chk_2').prop('checked', false);
});
$('.groupLi input[type=checkbox]').on('change',function(){
  $('#chk_1').prop('checked', false);
  $('#chk_3').prop('checked', false);
});
// 전체선택 toggle
$(document).on("click",".menubar",function(){
  $(this).next('.submenu').toggle();
});
// 주소록 요소 옮기기
$(document).on("click",".rightLeftBtn button",function(){
  var boxType = $(this).data('value');
  var boxAction = $(this).data('type');
  if(boxAction == "right"){
    var groupBool = false;
    $(".listBox input[type='checkbox']:checked").each(function() {
      if($(this).val().indexOf('All') != -1)  return;
      var id = $(this).prop('id');
      var checkText = $.trim($(this).prop('title').replace('&gt;','\n&gt;'));
      var html = '<li>'+$(this).parents('li').html()+'</li>';
      html = html.replace(/chk/g,'selected_chk');
      groupBool = false;
      if(boxType == "group"){
        if(id.indexOf("_g") != -1 && $("#groupUl").find('input[title=\''+checkText+'\']').length == 0){
          $("#groupUl").append(html);
        }
        else if(id.indexOf("_g") == -1){
          groupBool = true;
        }
      }
      else if(boxType == "recipi"){
        if(id.indexOf("_g") != -1){
          groupBool = true;
        }
        else if(id.indexOf("_g") == -1 && $("#recipiUl").find('input[title=\''+checkText+'\']').length == 0){
          $("#recipiUl").append(html);
        }
      }
      $(this).prop('checked', groupBool);
    });

    $('#chk_1').prop('checked', false);
    $('#chk_3').prop('checked', false);
    if($('#chk_2').prop('checked') && groupBool)
      $('#chk_2').prop('checked', groupBool);
    else
      $('#chk_2').prop('checked', false);
  }
  else if(boxAction == "left"){
    if(boxType == "group"){
      $("#groupUl input[type='checkbox']:checked").each(function() {
        $(this).parents('li').remove();
      });
    }
    else{
      $("#recipiUl input[type='checkbox']:checked").each(function() {
        $(this).parents('li').remove();
      });
    }
  }
  else{
    if(boxType == "group"){
      $("#groupUl input[type='checkbox']").each(function() {
        $(this).parents('li').remove();
      });
    }
    else{
      $("#recipiUl input[type='checkbox']").each(function() {
        $(this).parents('li').remove();
      });
    }
  }
  $('ul#groupUl').parents('.selectedBox').find('.text-info').text($('#groupUl').find('li').length);
  $('ul#recipiUl').parents('.selectedBox').find('.text-info').text($('#recipiUl').find('li').length);
});
// 주소록 메일 검색
$('#searchMail').on('change',function(){
  var param = {
    type: 'search',
    search: $('#searchMail').val().replace(/ /gi, "")
  };
  modalListGetPage(param);
});
// 주소록 페이징 - input page tag 처리
$('.paging input').on('change',function(){
  if($(this).val() <= 0 || $(this).val() > ($(this).next('.count').text())){
    alert('페이지 수를 다시 작성해주세요.');
    $(this).val($(this).prev('input[type=hidden]').val());
  }
  else{
    var param = {
      type: $(this).data('type'),
      page: ($(this).val() -1)*10
    };
    var search = $('#searchMail').val().replace(/ /gi, "");
    if(search != ''){
      param.search = search;
    }
    modalListGetPage(param);
  }
});
// 주소록 페이징 버튼처리
$('.bottomBtn button').on('click',function(){
  if($(this).data('value') == 'next' || $(this).data('value') == 'end'){
    if($(this).parents('.paging').find('input[type=hidden]').val() == $(this).parents('.paging').find('.count').text()){
      alert('마지막 페이지입니다.');
      return false;
    }
  }
  var param = {
    type: $(this).data('type'),
    page: $(this).data('num')
  };

  if(param.type == 'mail'){
    $(".allCheck").eq(0).prop('checked', false);
    $(".allCheck").eq(1).prop('checked', false);
  }
  else if(param.type == 'group'){
    $(".allCheck").eq(0).prop('checked', false);
    $(".allCheck").eq(2).prop('checked', false);
  }
  else{
    $(".allCheck").prop('checked', false);
  }

  var search = $('#searchMail').val().replace(/ /gi, "");
  if(search != ''){
    param.search = search;
  }
  modalListGetPage(param);
});
// 주소록 리스트 페이징 ajax
function modalListGetPage(param){
  $.ajax({
    url: '../email/getModalListPage',
    type: 'post',
    data : param,
    datatype : 'json',
    error:function(request,status,error){
      console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
      alert('문제가 생겼습니다. 다시 시도해주세요.');
    },
    success:function(data){
      if(data.status == 'sessionTimeOut'){
        alert('세션이 만료되었습니다. 로그인 후 다시 시도해주세요.');
        $('#mailList-Modal').modal('hide');
        $('#login-Modal').modal('show');
        return false;
      }
      if(data.status){
        if(data.result.email.length != 0){
          $(".emailLi").empty();
          data.result.email.forEach(function(ele,idx){
            var html = '<li>\
            <input type="checkbox" id=\"chk'+(idx+1)+'\" value=\"'+ele.n_idx+'\" title=\"'+ele.M_name+'&lt;'+ele.M_email+'&gt;\"/>\
            <label for=\"chk'+(idx+1)+'\" title=\"'+ele.M_name+'&lt;'+ele.M_email+'&gt;\">'+ele.M_name+'&lt;'+ele.M_email+'&gt;</label>\
            </li>';
            $(".emailLi").append(html);
          });
          bottomPagingSetting(1,data.result.emailPage,data.result.emailTotal);
        }
        if(data.result.group.length != 0){
          $(".groupLi").empty();
          data.result.group.forEach(function(ele,idx){
            var html = '<li>\
            <input type="checkbox" id=\"chk'+(idx+1)+'_g\" value=\"'+ele.M_id+'\" title=\"'+ele.M_group_title+'&lt;'+ele.groupCount+'명&gt;\"/>\
            <label for=\"chk'+(idx+1)+'_g\" title=\"'+ele.M_group_title+'&lt;'+ele.groupCount+'명&gt;\">'+ele.M_group_title+'&lt;'+ele.groupCount+'명&gt;</label>\
            </li>'
            $(".groupLi").append(html);
          });
          bottomPagingSetting(0,data.result.groupPage,data.result.groupTotal);
        }
      }
    }
  });
}
// 주소록 리스트 페이징
function bottomPagingSetting(tagEq,page,total){
  var pagingTag = $('.paging').eq(tagEq);
  var btnTag = $('.bottomBtn').eq(tagEq);
  var mathTotalPage = Math.ceil(total/10);
  pagingTag.find('.count').text((mathTotalPage < 1)? 1 : mathTotalPage);
  pagingTag.find('input').val(page);

  if(total > 2){
    var prevStartNum = (page == 1) ? 0 : (page-2)*10 ;
    var endStartNum = Math.floor(total/10)*10;
    var nextStartNum = (page == mathTotalPage) ? endStartNum : page*10;

    btnTag.find('button').eq(1).data('num',prevStartNum);
    btnTag.find('button').eq(2).data('num',nextStartNum);
    btnTag.find('button').eq(3).data('num',endStartNum);
    btnTag.show();
  }
  // else{
  //   btnTag.hide();
  // }
}
// 주소록 shift키 범위선택
// $(document).on('click','#groupUl input, #recipiUl input',function(e) {
//   var lastChecked = null;
//   if (!lastChecked) {
//     lastChecked = this;
//     return;
//   }
//   if (e.shiftKey) {
//     var start = $('#'+$(this).parents('ul').prop('id')+' input').index(this);
//     var end = $('#'+$(this).parents('ul').prop('id')+' input').index(lastChecked);
//     $('#'+$(this).parents('ul').prop('id')+' input').slice(Math.min(start, end), Math.max(start, end) + 1).prop('checked', lastChecked.checked);
//   }
//   lastChecked = this;
// });
