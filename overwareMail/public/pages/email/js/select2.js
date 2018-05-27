/* select test js */
// 보내는사람
var page = 1;
var totalMax = 0;

$(".searchSelect").scroll( function() {
  if ( $(this).prop('scrollHeight') - $(this).prop('scrollTop') == $(this).innerHeight()) {
    console.log(page);
    console.log(totalMax);
    page += 1;
    if((page * 10) < totalMax){
      var searchStr = $('#M_sender_test').val();
      if(searchStr != ''){
        setTimeout(searchEmail({search:searchStr,page: page}), 250);
      }else{
        setTimeout(searchEmail({page: page}), 250);
      }
    }
    else{
      page -= 1;
    }
  }
});
$('#M_sender_test').on('click',function(){
  if($('.searchSelect').css('display') == 'none'){
    var searchStr = $('#M_sender_test').val();
    if(page == 1){
      $('.searchSelect ul').empty();
      if(searchStr != ''){
        $(this).select();
        searchStr = searchStr.replace(/</g,'').replace(/>/g,'');
        setTimeout(searchEmail({search:searchStr,page: page}), 250);
      }else{
        setTimeout(searchEmail({page: page}), 250);
      }
    }
  }
});
$('#M_sender_test').on('keyup keypress keydown',function(e){
  // a-Z && 0-9
  console.log(e.keyCode);
  if(e.keyCode == 8 && e.keyCode == 13 && !(e.keyCode >= 48 && e.keyCode <= 90) &&
    !(e.keyCode >= 96 && e.keyCode <= 105)){
      return true;
  }
  var searchStr = $('#M_sender_test').val();
  if(is_hangul_char(searchStr)){
    var strLen = getTextLength(searchStr);
    if(strLen >= 2){
      page = 1;
      setTimeout(searchEmail({search:searchStr,page: 1}), 250);
    }
  }
  else{
    if(searchStr.length > 0){
      $('.searchSelect ul').empty();
      page = 1;
      setTimeout(searchEmail({search:searchStr,page: 1}), 250);
    }
    else{
      setTimeout(searchEmail({page: 1}), 250);
    }
  }
});
$(document).on('click','.searchSelect li',function(){
  $('#M_sender_test').data("value",$(this).data("value"));
  $('#M_sender_test').val($(this).text());
});
$(document).on('click',function(e){
  if(e.target.id != "M_sender_test"){
    page = 1;
    totalMax = 0;
    $('.searchSelect').hide();
  }
});
function is_hangul_char(ch) {
  c = ch.charCodeAt(0);
  if( 0x1100<=c && c<=0x11FF ) return true;
  if( 0x3130<=c && c<=0x318F ) return true;
  if( 0xAC00<=c && c<=0xD7A3 ) return true;
  return false;
}
function getTextLength(str) {
    var len = 0;
    for (var i = 0; i < str.length; i++) {
        if (escape(str.charAt(i)).length == 6) {
            len++;
        }
        len++;
    }
    return len;
}
function searchEmail(params){
  console.log('searchEmail:',params);
  $.ajax({
    type: "POST",
    url: "/email/searchAll",
    data: params,
    dataType:'json',
    error:function(request,status,error){
      console.log('mail search error code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
    },
    success: function(data) {
      if(data.result.items.length > 0){
        if((params.page * 10) < data.result.total_count){
          totalMax = data.result.total_count;
        }
        $.each(data.result.items,function(idx, ele){
          var html = '<li data-value="'+ele.id+'">'+ele.M_name+'&lt;'+ele.M_email+'&gt;</li>'
          $('.searchSelect ul').append(html);
        });
      }
      else{
        var html = '<li>검색 결과 없습니다.</li>'
        $('.searchSelect ul').append(html);
      }
      $('.searchSelect').show();
    }
  });
}
/* select2 js */
// 보내는사람
$(".sender-select").select2({
  ajax: {
    url: "/email/searchAll",
    dataType: 'json',
    delay: 250,
    data: function (params) {
      if(params.term != undefined){
        params.term = params.term.replace(/ /gi, "")
      }
      return {
        search: params.term, // search term
        page: params.page
      };
    },
    processResults: function (data, params) {
      if(data.status){
        params.page = params.page || 1;
        return {
          results: data.result.items,
          pagination: {
            more: (params.page * 10) < data.result.total_count
          }
        };
      }
      $('#login-Modal').modal('show');
      return { results: [],pagination: {
          more: false
        }
      };
    },
    cache: true
  },
  multiple: false,
  placeholder: '보내는 사람(이름/이메일/회사)',
  language: 'ko',
  allowClear: true,
  escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
  minimumInputLength: 0,
  templateResult: function (repo) {
    if (repo.loading) {
      return repo.text;
    }
    var markup = repo['M_name']+" &lt;"+repo['M_email']+"&gt;";
    return markup;
  },
  templateSelection: function (repo) {
    if(typeof repo['M_name'] == 'undefined'){
      return repo.text;
    }
    return repo['M_name']+" &lt;"+repo['M_email']+"&gt;";
  }
});
// 받는사람
$(".recipi-select").select2({
  ajax: {
    url: "/email/searchAll",
    dataType: 'json',
    delay: 250,
    data: function (params) {
      if(params.term != undefined){
        params.term = params.term.replace(/ /gi, "")
      }
      return {
        search: params.term, // search term
        page: params.page
      };
    },
    processResults: function (data, params) {
      if(data.status){
        params.page = params.page || 1;
        return {
          results: data.result.items,
          pagination: {
            more: (params.page * 10) < data.result.total_count
          }
        };
      }
      $('#login-Modal').modal('show');
      return {
        results: [],
        pagination: {
          more: false
        }
      };
    },
    cache: true
  },
  multiple: true,
  placeholder: '받는 사람',
  allowClear: true,
  language: 'ko',
  minimumInputLength: 0,
  escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
  templateResult: function (repo) {
    if (repo.loading) {
      return repo.text;
    }
    var markup = repo['M_name']+" &lt;"+repo['M_email']+"&gt;";
    return markup.replace('\n','');
  },
  templateSelection: function (repo) {
    if(typeof repo['M_name'] == 'undefined'){
      return repo.text;
    }
    var result = repo['M_name']+" &lt;"+repo['M_email']+"&gt;";
    return result.replace('\n','');
  }
});
// $('.recipi-select').on('select2:opening select2:closing', function( event ) {
//   var $searchfield = $(this).parent().find('.select2-search__field');
//   $searchfield.prop('disabled', true);
// });
// 수신자 그룹
$(".group-select").select2({
  ajax: {
    url: "/email/searchGroup",
    dataType: 'json',
    delay: 250,
    data: function (params) {
      if(params.term != undefined){
        params.term = params.term.replace(/ /gi, "")
      }
      return {
        search: params.term, // search term
        page: params.page
      };
    },
    processResults: function (data, params) {
      if(data.status){
        params.page = params.page || 1;
        return {
          results: data.result.items,
          pagination: {
            more: (params.page * 10) < data.result.total_count
          }
        };
      }
      $('#login-Modal').modal('show');
      return {
        results: [],
        pagination: {
          more: false
        }
      };
    },
    cache: true
  },
  multiple: true,
  placeholder: '수신자 그룹',
  allowClear: true,
  language: 'ko',
  minimumInputLength: 0,
  escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
  templateResult: function (repo) {
    if (repo.loading) {
      return repo.text;
    }
    var markup = repo['M_group_title']+" &lt; "+repo['groupCount']+"명 &gt;";
    return markup;
  },
  templateSelection: function (repo) {
    if(typeof repo['M_group_title'] == 'undefined'){
      return repo.text;
    }
    return repo['M_group_title']+" &lt; "+repo['groupCount']+"명 &gt;";
  }
});
// $('.group-select').on('select2:opening select2:closing', function( event ) {
//   var $searchfield = $(this).parent().find('.select2-search__field');
//   $searchfield.prop('disabled', true);
// });
