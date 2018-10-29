$(document).ready(function() {
  var $datepicker = $('#datepicker');
  $datepicker.datepicker({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    yearSuffix: '년',
    showMonthAfterYear: true,
    minDate: 0
  });
  // ie label css
  $('.modal label').css('line-height','16px');
  $('.select2-search__field').css('line-height','16px')

  if($('#mailType').val()!=''){
    var senderArr = $('#mailSender').val().split('|');
    var param = {
      id:senderArr[0],
      text:senderArr[1]
    };
    pushEle($('.sender-select'),param);
    var mailData = JSON.parse($("#mailData").val());
    $("#M_keyword option[value='"+mailData.M_keyword+"']").attr('selected','selected');
    $("input[name='M_type'][value='"+mailData.M_type+"']").attr('checked','checked');
    if(mailData.M_type == '1'){
      $datepicker.datepicker('setDate', new Date(moment(mailData.M_senddate).format('YYYY-MM-DD')));
      $("#time_h option[value='"+moment(mailData.M_senddate).format('HH')+"']").attr('selected','selected');
      $("#time_m option[value='"+moment(mailData.M_senddate).format('mm')+"']").attr('selected','selected');
    }
    else{
      $('.reserveTime').toggle();
    }

    $("input[name='M_template'][value='"+mailData.M_template+"']").attr('checked','checked');
    if(mailData.M_template == '1'){
      $('.seqNumber').toggle();
    }
    var mailRecipi = JSON.parse($("#mailRecipi").val());
    var mailGroup = JSON.parse($("#mailGroup").val());
    mailRecipi.forEach(function(item,idx){
      var param = {
        id:item[0],
        text:item[1]
      };
      pushEle($('.recipi-select'),param);
    });
    mailGroup.forEach(function(item,idx){
      var param = {
        id:item[0],
        text:item[1]
      };
      pushEle($('.group-select'),param);
    });

    $("#mail_t option[value='"+mailData.M_module+"']").attr('selected','selected');
    $("#M_mail_type option[value='"+mailData.M_mail_type+"']").attr('selected','selected');
    if(mailData.M_invitation == '1'){
      $('#invitation').prop("checked", true);
      $('#invitation').trigger("change");
    }
    $("#M_subject").val(mailData.M_subject);
    $("#mail_t_div").data('mid',mailData.M_a_id);
    $("#mail_t_div").data('origin',mailData.M_module);
    $("#M_seq_number").val(mailData.M_seq_number);
  }
});
// 세션만료 - 로그인
$("input[type=password]").on('keyup',function(event){
  if(event.keyCode == 13){
    $('#loginBtn').trigger('click');
  }
});
$("#loginBtn").on('click',function(){
  if($("input[name=username]").val() == ""){
    alert("아이디를 입력해주세요.");
  }
  else if($("input[name=password]").val() == ""){
    alert("비밀번호를 입력해주세요.");
  }
  else{
    var data = {
      username:$("input[name=username]").val(),
      password:$("input[name=password]").val()
    };
    sendLogin(data);
  }
});
// 세션모달 열리기 전에
$("#login-Modal").on("show.bs.modal",function(){
  $('.select2-container').removeClass('select2-container--open');
});
function sendLogin(param){
  $.ajax({
    type: "POST",
    url: "/login",
    data: param,
    datatype : 'json',
    success: function(data) {
      $("#login-msg").text('');
      $('#login-Modal input').val('');
      if(data){
        $('#login-Modal').modal('hide');
      }
      else{
        $("#login-msg").text('아이디나 패스워드를 확인해주세요.');
      }
    }
  });
}
// 예약기능 클릭시
$('input[name=M_type]').on('change',function(){
  $('.reserveTime').toggle();
});
// 메일타입 변경시
$('input[name=M_template]').on('change',function(){
  $('.seqNumber').toggle();
});
// 메일 테스트 발송 버튼 클릭시
$(".btn-test").on("click",function(){
  var sender = $(".sender-select").select2("val");
  if(sender == null){
    alert("보내는 사람를 선택해주세요.");
    return false;
  }
  if($("#email1").val() == "" || $("#email2").val() == ""){
    alert("받는 사람의 이메일 주소를 정확히 입력해주세요.");
    return false;
  }

  var num = '';
  if($("#M_seq_number").val() != ""){
    num = Number($("#M_seq_number").val());
  }
  var param = {
    'M_keyword': $("#M_keyword option:selected").val() || '',
    'M_seq_number': num,
    'M_module':$("#mail_t option:selected").val(),
    'M_template':$("input:radio[name=M_template]:checked").val(),
    'M_invitation': $("#invitation").is(":checked") ? '1' : '0',
    'M_body': get_tinymce_html_content(),
    'M_subject': $("#M_subject").val(),
    'M_email': $("#email1").val()+'@'+$("#email2").val(),
    'M_sender': sender
  };
  $.ajax({
    url: '/email/test',
    type: 'post',
    data : param,
    datatype : 'json',
    error:function(request,status,error){
      console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
      alert('테스트메일 발송에 실패했습니다.');
    },
    success:function(data){
      if(data){
        console.log(data);
        alert('테스트메일 발송에 성공했습니다.');
      }
    }
  });
});

// 메일 미리보기 버튼 클릭시
$(".perivewBtn").on("click",function(){
  var num = '';
  if($("#M_seq_number").val() != ""){
    num = Number($("#M_seq_number").val());
  }
  var param = {
    'M_keyword': $("#M_keyword option:selected").val() || '',
    'num': num,
    'M_template':$("input:radio[name=M_template]:checked").val(),
    'ivt': $("#invitation").is(":checked") ? 'Invitation' : '',
    'M_body': get_tinymce_html_content(),
  };
  previewAjax(param);
});
function previewAjax(param) {
  var win = window.open('about:blank', '_blank');
  $.ajax({
    url: '/preview_mail',
    type: 'post',
    data : param,
    datatype : 'json',
    error:function(request,status,error){
      console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
      swal("ERROR!", request.responseText, "error");
    },
    success:function(data){
      if(data){
        win.location.href = 'http://showbox.email/preview_mail';
      }
    }
  });
}
// 인비테이션 클릭시
$('#invitation').on('change',function(){
  if($(this).is(":checked")){
    $("#M_seq_number").val('');
    $("#M_seq_number").attr("disabled",true);
  }
  else{
    $("#M_seq_number").attr("disabled",false);
  }
});
// 메일불러오기
$('.templateBtn').on('click',function(){
  CallMailList(1,'btn');
});
// 지난 메일 선택시
$(document).on('click','.btn-selected',function(){
  $('#mailLoad-Modal').modal('hide');
  var idxVal = $(this).data('idx');
  swal({
    title: "해당 메일의 내용을 불러올까요?",
    icon: "warning",
    buttons: ["취소", true],
    dangerMode: true
  })
  .then(function(value) {
    if (value != null) {
      $.ajax({
        url: '/email/getEmailContent',
        type: 'post',
        data : {idx:idxVal},
        datatype : 'json',
        error:function(request,status,error){
          console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
          swal("ERROR!", '메일 불러오기를 실패했습니다.', "error");
        },
        success:function(data){
          tinyMCE.activeEditor.setContent(data, {format : 'raw'});
        }
      });
    }
  });
});
$(document).on('click','#mailLoad-Modal .page-link',function(){
  CallMailList(Number($(this).data().value));
});
function CallMailList(num,type){
  var param = {
    M_template : $("input:radio[name=M_template]:checked").val(),
    M_invitation : $("#invitation").is(":checked") ? '1' : '0',
    M_keyword : [$("#M_keyword option:selected").val(),$("#M_keyword option:selected").text()],
    page : num
  };
  if(param.M_keyword[1] == '선택'){
    alert('키워드를 선택해주세요.');
    return false;
  }
  if(type == 'btn'){
    $('#mailLoad-Modal').modal('show');
  }
  param.M_keyword = param.M_keyword[0];
  ajaxGetMailPageList(param);
}
// 메일 검색 모달 리스트 ajax
function ajaxGetMailPageList(param){
  console.log('ajaxGetMailPageList:',param);
  $.ajax({
    url: '/email/getEmailContentList',
    type: 'post',
    data: param,
    error: function(request,status,error){
      console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
      alert('메일 불러오기에 실패했습니다.');
    },
    success: function(data){
      $('#mailLoad-Modal tbody').empty();
      $('#mailLoad-Modal tfoot').empty();
      if(data.listCount == 0){
        alert('해당 키워드의 발송된 메일이 없습니다.');
        return false;
      }
      var limit = 10;
      var pageCount = Math.ceil(data.listCount/limit);
      data.list.forEach(function(item,idx){
        var numIdx = Math.ceil(data.listCount-(data.offset+idx)).toString();
        var html = '<tr>\
          <th>'+numIdx+'</th>\
          <td><div class="m-subject"><a target="_blank" href="http://showbox.email/preview?keyword='+item.M_keyword+'&idx='+item.n_idx+'">'+item.M_subject+'</a></div></td>\
          <td><button type="submit" data-idx="'+item.n_idx+'" class="btn-selected btn btn-primary m-b-0">선택</button></td>\
        </tr>'
        $('#mailLoad-Modal tbody').append(html);
      });
      if(pageCount > 1) {
        var html = '<tr><td colspan="8"><ul class="pagination float-right">';
        var pageSize = 5;
        var pRCnt = parseInt(data.currentPage / pageSize);
        if(data.currentPage % pageSize == 0){
          pRCnt = parseInt(data.currentPage / pageSize) - 1;
        }
        if(data.currentPage > 5) {
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
          var active = (data.currentPage == index) ? "active" : "";
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
        $('#mailLoad-Modal tfoot').append(html);
      }
    }
  });
}
// 메일 저장 버튼 클릭시
$(".sendBtn").on("click",function(){
  var num = '';
  if($("#M_seq_number").val() != "" && $("input:radio[name=M_template]:checked").val() == '0'){
    num = Number($("#M_seq_number").val());
  }
  var param = {
    'M_seq_number': num,
    'M_module':$("#mail_t option:selected").val(),
    'M_template':$("input:radio[name=M_template]:checked").val(),
    'M_invitation': $("#invitation").is(":checked") ? '1' : '0',
    'M_sender': $(".sender-select").select2("val"),
    'M_recipi': $(".recipi-select").select2("val"),
    'M_group': $('.group-select').val() || [],
    'M_keyword': $("#M_keyword option:selected").val(),
    'M_mail_type': $("#M_mail_type option:selected").val(),
    'M_body': get_tinymce_html_content(),
    'M_subject': $("#M_subject").val(),
    'M_type': $("input:radio[name=M_type]:checked").val(),
    'o_module': $("#mail_t_div").data('origin')
  };
  var check=true;
  if(param["M_sender"] == null){
    check = requiredMessage("M_sender","보내는 사람를 선택해주세요.");
  }
  if(param["M_recipi"] == ""){
    check = requiredMessage("M_recipi","받는사람을 선택해주세요.");
  }
  if(param["M_invitation"] == '0' && param["M_template"] == "0"){
    if(!($.isNumeric(param["M_seq_number"])) ){
      check = requiredMessage("M_seq_number","발송차수는 숫자만 입력가능합니다.");
    }
    if(param["M_seq_number"] == ""){
      check = requiredMessage("M_seq_number","발송차수를 입력해주세요.");
    }
  }
  if(param["M_keyword"] == 0){
    check = requiredMessage("M_keyword","키워드를 선택해주세요.");
  }
  if(param["M_mail_type"] == 0){
    check = requiredMessage("M_mail_type","메일타입을 선택해주세요.");
  }
  if(param["M_subject"] == ""){
    check = requiredMessage("M_subject","메일제목을 입력해주세요.");
  }
  if(param["M_body"] == "" || param["M_body"] == "<p><br></p>"){
    check = requiredMessage("M_body","메일내용 입력해주세요.");
  }
  if(param["M_type"] == "1"){
    var time = $('#time_h').val()+":"+$('#time_m').val();
    var date = $('#datepicker').val();
    if($('#time_h').val() != "" && $('#time_m').val() != "" && date != ""){
      var endDate = date+" "+time+":00";
      var startDateCompare = new Date();
      var endDateCompare = new Date(endDate);
      if(startDateCompare.getTime() >= endDateCompare.getTime()){
        check = requiredMessage("date","현재시간보다 작습니다.");
      }
      else{
        param['end_reserve_time'] = date+" "+time+":00";
      }
    }
  }
  if(check == false){
    return false;
  }
  swal({
    title: "본문의 내용이 확실합니까?",
    icon: "warning",
    buttons: ["취소", true],
    dangerMode: true
  })
  .then(function(value) {
    if (value != null) {
      var now = $.datepicker.formatDate('yymmdd', new Date());
      $('span.messages').find('.error').text('');
      if($('#mailType').val()!=''){
        param.type = $('#mailType').val();
        if(param.type == 'edit'){
          if($("#mail_t_div").data('mid') != '') param["M_a_id"] = $("#mail_t_div").data('mid');
        }
        var mailData = JSON.parse($("#mailData").val());
        param.idx = mailData.n_idx;
        param.Mid = mailData.M_id;
      }
      console.log('param:',param);
      SendEmails(param);
    }
  });
});
// 메일 insert ajax
function SendEmails(param){
  $('.preloader3').show();
  $.ajax({
    url: '/email/save',
    type: 'post',
    data : param,
    datatype : 'json',
    error:function(request,status,error){
      console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
      swal("ERROR!", ((request.responseText == undefined)?'메일 저장에 실패했습니다.':request.responseText), "error");
      $('.preloader3').fadeOut(500);
    },
    success:function(data){
      if(data.status == 'sessionTimeOut'){
        $('.preloader3').fadeOut(500);
        alert('세션이 만료되었습니다. 로그인 후 다시 시도해주세요.');
        $('#login-Modal').modal('show');
        return false;
      }
      if(data.status){
        swal("SUCCESS!", '저장완료되었습니다.', "success")
        .then(function(){
          location.href= '../email/manage';
        });
      }
    }
  });
}
// input box 경고문
function requiredMessage(target,msg){
  $("#"+target).siblings('.messages').children('.error').text(msg);
  return false;
}
