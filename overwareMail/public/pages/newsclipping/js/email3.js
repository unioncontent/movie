$(document).ready(function() {
  // contextMenu
  $.contextMenu({
    selector: '.context-menu-one',
    callback: function(key, options) {
        contextMenu(key);
    },
    items: {
      "delete": {name: "기사삭제", icon: "delete"},
      "quit": {name: "선택취소", icon: function(){
          return 'context-menu-icon context-menu-icon-quit';
      }}
    }
  });
  // ie label css
  $('.modal label').css('line-height','16px');
  $('.select2-search__field').css('line-height','16px');

  getNewsClippingData();
  boxoffice();
  var dateStr = $('#datepicker2').val().replace(/[-]/gi,'.');
  $('#date-span a').text(dateStr+' ('+getInputDayLabel($('#datepicker2').val())+')');
  $('#date-span a').attr('href', "http://showbox.email/preview/newsclipping?date="+$('#datepicker2').val());
  $('#body-header a').attr('href', "http://showbox.email/preview/newsclipping?date="+$('#datepicker2').val());
});
// 대표기사 선택 삭제
$('.delBtn').on('click',function(){
  swal({
    title: "선택한 대표 기사를 삭제하시겠습니까?",
    icon: "warning",
    buttons: ["취소", true],
    dangerMode: true,
  }).then(function(value) {
    if (value != null) {
      $('.checkboxs input[type="checkbox"]:checked').each(function(idx,ele){
        if(ele.className == 'main-news'){
          var midx = $(ele).val();
          $.ajax({
            url: '/newsclipping/delete',
            type: 'post',
            data : {idx : midx,table : 'news_mail',idxStr : 'media_idx'},
            datatype : 'json',
            error:function(request,status,error){
              console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
              swal("ERROR!", request.responseText, "error");
            },
            success:function(data){
              console.log(data.status);
              getNewsClippingData();
            }
          });
        }
      });
    }
  });
});
// grouping
$('.groupBtn').on('click',function(){
  if($('input.main-news:checked').length > 1){
    alert('대표기사는 하나만 선택 가능합니다.');
    return false;
  }
  swal({
    title: "해당 기사를 그룹핑하시겠습니까?",
    icon: "warning",
    buttons: ["취소", true],
    dangerMode: true,
  }).then(function(value) {
    if (value != null) {
      var param = {midx:'',idxs:[]};
      $('.checkboxs input[type="checkbox"]:checked').each(function(idx,ele){
        console.log(idx,ele);
        if(ele.className == 'main-news'){
          param.midx = $(ele).val();
        }
        else{
          param.idxs.push($(ele).val());
        }
      });
      $.ajax({
        url: '/newsclipping/grouping',
        type: 'post',
        data : param,
        datatype : 'json',
        error:function(request,status,error){
          console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
          swal("ERROR!", request.responseText, "error");
        },
        success:function(data){
          if(data.status){
            getNewsClippingData();
          }
        }
      });
    }
  });
});
// checkbox event
$(document).on('click','.checkboxs input[type="checkbox"]',function(){
  console.log('click',this);
  if(this.className == 'sub-news'){
    var midx = $(this).prevAll("input[type=checkbox]").val();
    if($('ul.relation_list[data-midx='+midx+']').length > 0){
      $(this).prop('checked',false);
      return false;
    }
    $(this).prevAll("input[type=checkbox]").prop('checked',false);
  }
  else{
    $(this).nextAll("input[type=checkbox]").prop('checked',false);
  }
});
$(document).on('change','.checkboxs input[type="checkbox"]',function(){
  if($('input.main-news:checked').length == 0){
    $('input.sub-news:checked').prop('checked',false)
    return false;
  }
});
$(document).on('click','.news-delete',function(){
  var delIdx = $(this).data('idx');
  var type = $(this).data('type');
  var str = $(this).data('str');
  // console.log({idx : delIdx,table : type});
  if($('.relation_list[data-midx='+delIdx+']').length > 0){
    swal({
      title: "대표 기사를 취소하시겠습니까?",
      icon: "warning",
      buttons: ["취소", true],
      dangerMode: true,
    }).then(function(value) {
      if (value != null) {
        $.ajax({
          url: '/newsclipping/cancel',
          type: 'post',
          data : {idx : delIdx,table : type},
          datatype : 'json',
          error:function(request,status,error){
            console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
            swal("ERROR!", request.responseText, "error");
          },
          success:function(data){
            if(data.status){
              swal("SUCCESS!", '삭제했습니다.', "success")
              .then(function(){
                getNewsClippingData();
              });
            }
          }
        });
      }
    });
    return false;
  }
  swal({
    title: "기사를 삭제하시겠습니까?",
    icon: "warning",
    buttons: ["취소", true],
    dangerMode: true,
  }).then(function(value) {
    if (value != null) {
      $.ajax({
        url: '/newsclipping/delete',
        type: 'post',
        data : {idx : delIdx,table : type,idxStr : str},
        datatype : 'json',
        error:function(request,status,error){
          console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
          swal("ERROR!", request.responseText, "error");
        },
        success:function(data){
          if(data.status){
            swal("SUCCESS!", '삭제했습니다.', "success")
            .then(function(){
              getNewsClippingData();
            });
          }
        }
      });
    }
  });
});
$('#datepicker2').on('change',function(){
  getNewsClippingData();
  boxoffice();
  var dateStr = $('#datepicker2').val().replace(/[-]/gi,'.');
  $('#date-span a').text(dateStr+' ('+getInputDayLabel($('#datepicker2').val())+')');
  $('#date-span a').attr('href', "http://showbox.email/preview/newsclipping?date="+$('#datepicker2').val());
  $('#body-header a').attr('href', "http://showbox.email/preview/newsclipping?date="+$('#datepicker2').val());
});

// 오늘 날짜
function getTimeStamp() {
  var d = new Date();
  var date = leadingZeros(d.getFullYear(), 4) + '-' +
      leadingZeros(d.getMonth() + 1, 2) + '-' +
      leadingZeros(d.getDate(), 2);
  return date;
}
function leadingZeros(n, digits) {
  var zero = '';
  n = n.toString();

  if (n.length < digits) {
      for (i = 0; i < digits - n.length; i++)
          zero += '0';
  }
  return zero + n;
}
// 어제 날짜
function yesterday(d,str){
  var dateStr = new Date(d);
  var yesterday = new Date(dateStr.valueOf() - (24*60*60*1000));

	var yyyy = yesterday.getFullYear().toString();
	var mm = (yesterday.getMonth()+1).toString(); // getMonth() is zero-based
	var dd  = yesterday.getDate().toString();

	var resultDate = yyyy + str + (mm[1]?mm:"0"+mm[0]) + str + (dd[1]?dd:"0"+dd[0]);
  return resultDate;
}
// 콤마
function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
// 요일
function getInputDayLabel(d) {
  var week = new Array('일', '월', '화', '수', '목', '금', '토');

  var today = new Date(d).getDay();
  var todayLabel = week[today];

  return todayLabel;
}

// 뉴스클리핑 세팅
function getNewsClippingData(){
  var newsEDate = $('#datepicker2').val();
  var newsSDate = yesterday($('#datepicker2').val(),'-');

  $.ajax({
    url: '/newsclipping/getData',
    type: 'post',
    data : {
      sDate : newsSDate,
      eDate : newsEDate
    },
    datatype : 'json',
    error:function(request,status,error){
      console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
      swal("ERROR!", request.responseText, "error");
    },
    success:function(data){
      if(data.status){
        console.log(data.result);
        // 초기화
        $('.section:not(div[data-type=4],div[data-type=issue],div[data-type=marketing],div[data-type=movie]) .section-body').empty();
        $('div[data-type=issue] .section-body tbody tr:not(.head)').remove();
        $('div[data-type=marketing] .section-body tbody tr:not(.head)').remove();
        $('div[data-type=4] .section-body tbody tr:not(.head)').remove();
        $('div[data-type=7]').empty();
        $('.section').css('display','block');
        // 생성
        $.each(data.result.issue, function(index, value) {
          var html = '<tr><td style="text-align:center;color:#ed1252;padding:17px 0;border:1px solid #f4f4f4;border-left:0px;border-top:0px;text-align:center;">#'+value.keyword+'</td><td style="border-bottom: 1px solid #f4f4f4;text-align: left;color: #666;"><div class="text" style="width:500px;display:inline-block;padding:10px;padding-right:0px;white-space:pre-line;word-break:break-all;top:4px;">'+value.issue_content+'</div></td></tr>';
          $('div[data-type=issue] .section-body tbody').append(html);
        });
        $.each(data.result.marketing, function(index, value) {
          var html = '<tr><td style="padding:9px 7px 5px 11px;border-bottom:1px solid #f4f4f4;"><img alt="'+value.ps_name+'" src="http://showbox.email/images/newsclipping/'+value.ps_name+'_logo.png" style="width:13px;height: 13px;margin-bottom:3px;margin-right: 5px;vertical-align:text-bottom;"><div class="text" style="width:450px;display:inline-block;text-overflow:ellipsis;overflow:hidden;vertical-align:baseline;white-space:nowrap;top: 4px;"><a href="'+value.url+'" target="_blank" style="text-decoration:none!important;color:black;font-weight:bold;">'+value.ps_title+'</a><i class="fas fa-times news-delete" data-idx="'+value.n_idx+'" data-type="marketing_'+value.m_type+'_mail" data-str="n_idx"></i></div><div class="info" style="color: #666;font-size: 11px;"><span class="date">총검출수 '+value.total_cnt+'</span><span class="bar" style="display:inline-block;overflow:hidden;width:0;height:11px;margin:-1px 5px 1px 4px;border-left:1px solid #eaeaea;vertical-align:middle;"></span><span class="date">조회수 '+value.view_cnt+'</span><span class="bar" style="display: inline-block;overflow:hidden;width:0;height:11px;margin:-1px 5px 1px 4px;border-left:1px solid #eaeaea;vertical-align: middle;"></span><span class="date">좋아요 '+value.like_cnt+'</span><span class="bar" style="display:inline-block;overflow:hidden;width:0;height:11px;margin:-1px 5px 1px 4px;border-left:1px solid #eaeaea;vertical-align:middle;"></span><span class="date">댓글 '+value.reply_cnt+'</span></div></td><td style="border-bottom:1px solid #f4f4f4;border-left:1px solid #f4f4f4;text-align: center;color: #666;">'+value.ps_writer+'</td><td style="padding:13px 0;border-bottom: 1px solid #f4f4f4;border-left: 1px solid #f4f4f4;text-align: center;color: #666;">'+value.writeDate+'</td></tr><tr><td colspan="3" style="border-bottom: 1px solid #d0cdcd;"><div class="text" style="width:700px;display: inline-block;padding:10px;white-space:pre-line;word-break:break-all;top:4px;">'+((value.ps_content == null) ? '내용없음' :value.ps_content)+'</div></td></tr>';
          $('div[data-type=marketing] .section-body tbody').append(html);
        });
        var obj = new Object();
        $.each(data.result.news, function(index, value) {
          var siteLogoHtml = '';
          if($.isNumeric(value.me_rank)){
            if (value.media_subname != 'out' && value.media_subname != null){
              siteLogoHtml ='<img alt="'+value.media_subname+'" style="width: 15px;height: 15px;margin-right: 2px;vertical-align:text-bottom;" src="http://showbox.email/images/newsclipping/'+value.media_subname+'_logo.png" class="site-logo">';
            }
          }
          // if (value.media_subname != 'out' && value.media_subname != null){
          //   siteLogoHtml ='<img alt="'+value.media_subname+'" style="width: 15px;height: 15px;margin-right: 2px;vertical-align:text-bottom;" src="http://showbox.email/images/newsclipping/'+value.media_subname+'_logo.png" class="site-logo">';
          // }
          // var replyHtml = '<label class="replyLabel" style="display: inline-block;border-radius: 10px;padding: 2px 6px;font-size: 84%;font-weight: 700;line-height: 1;color: #fff;text-align: center;white-space: nowrap;vertical-align: baseline;background-color: #bdc3c7;margin-left: .5rem;margin-bottom: 0;">'+(($.isNumeric(value.replynum) == false)? '0':value.replynum)+'</label>';
          var rankHtml = '<label class="rankLabel" style="display: inline-block;border-radius: 10px;padding: 2px 6px;font-size: 84%;font-weight: 700;line-height: 1;color: #fff;text-align: center;white-space: nowrap;vertical-align: baseline;background-color: #bdc3c7;margin-left: .5rem;margin-bottom: 0;">'+(($.isNumeric(value.me_rank) == false)? '0':value.me_rank)+'</label>';
          var pageHtml = '';
          if(value.media_page != null && value.media_page != ''){
            // pageHtml = '<div clacss="info" style="color:#666;font-weight: normal;float:right;"><span class="bar" style="display:inline-block;overflow:hidden;width:0;height:11px;margin:-1px 5px 1px 4px;border-left:1px solid #eaeaea;vertical-align: middle;"></span><span class="page">'+value.media_page+'</span></div>';
            pageHtml = '<span class="bar" style="display:inline-block;overflow:hidden;width:0;height:11px;margin:-1px 5px 1px 4px;border-left:1px solid #eaeaea;vertical-align: middle;"></span><span class="page">'+value.media_page+'</span>';
          }
          // 4.쇼박스기업뉴스
          if(value.news_type == "4"){
            //  title="'+value.media_title+'"
            // var html = '<tr><td style="padding: 10px 0px 5px 7px;border-bottom: 1px solid #f4f4f4;"><div style="max-width: 538px;display: inline-block;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;"><a style="text-decoration:none !important;color:black;font-weight:bold;" href="'+value.url+'" target="_blank">'+siteLogoHtml+value.media_title+replyHtml+'</a><i class="fas fa-times news-delete" data-idx="'+value.media_idx+'" data-type="news_mail" data-str="media_idx"></i></div></td><td style="padding:10px 0;border:1px solid #f4f4f4;border-top:0;text-align:center;color:#666;">'+value.media_name+'</td><td style="padding: 10px 0;border-bottom:1px solid #f4f4f4;text-align:center;color:#666;">'+value.writeDate+'</td></tr>'
            var pageHtml = '';
            if(value.media_page != null && value.media_page != ''){
              pageHtml = '<div clacss="info" style="color:#666;font-weight: normal;float:right;margin: 0 0 0 5px;"><span class="bar" style="display:inline-block;overflow:hidden;width:0;height:11px;margin:-1px 5px 1px 4px;border-left:1px solid #eaeaea;vertical-align: middle;"></span><span class="page">'+value.media_page+'</span></div>';
            }
            var html = '<tr><td style="padding: 10px 0px 5px 7px;border-bottom: 1px solid #f4f4f4;"><div style="max-width: 538px;display: inline-block;text-overflow:ellipsis;white-space: initial;"><a style="text-decoration:none !important;color:black;font-weight:bold;" href="'+value.url+'" target="_blank">'+siteLogoHtml+value.media_title;
            // if($.isNumeric(value.me_rank)){
            //   // console.log(value.me_rank);
            //   html += rankHtml;
            // }
            // html += replyHtml;
            html += '</a><i class="fas fa-times news-delete" data-idx="'+value.media_idx+'" data-type="news_mail" data-str="media_idx"></i></div></td><td style="padding: 10px 5px;border:1px solid #f4f4f4;border-top:0;text-align:center;color:#666;">'+value.media_name+pageHtml+'</td><td style="padding: 10px 0;border-bottom:1px solid #f4f4f4;text-align:center;color:#666;">'+value.writeDate+'</td></tr>'
            $('div[data-type='+value.news_type+'] .section-body tbody').append(html);
          }
          else{
            var html = '<div class="news" style="padding:12px 5px 0px 5px"><div class="checkboxs f-left"><input type="checkbox" id="cb'+index+'" class="main-news" value="'+value.media_idx+'"><label for="cb'+index+'"></label><input type="checkbox" id="cb_s'+index+'" class="sub-news" value="'+value.media_idx+'"><label for="cb_s'+index+'"></label><br></div>';
            // var html = '<div class="news" style="padding:12px 5px 0px 5px"><div class="checkboxs f-left"><input type="checkbox" id="cb'+index+'" class="main-news" value="'+value.media_idx+'"><label for="cb'+index+'"></label><input type="checkbox" id="cb_s'+index+'" class="sub-news" value="'+value.media_idx+'"><label for="cb_s'+index+'"></label><br></div>';
            // if(value.thumbnail != null && value.thumbnail != ''){
            //   html += '<img src="'+value.thumbnail+'" style="display: inherit; float:left;width:80px;height:80px;padding-right: 13px;">';
            // }
            // html += '<div class="news-content" data-idx="'+value.media_idx+'" data-type="media" style="font-size:12px;width:743px;height:12px;"><div class="title" style="float:left;max-width:533px;display:inline-block;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;"><a style="text-decoration:none !important;color:black;font-weight:bold;" href="'+value.url+'" target="_blank">'+siteLogoHtml+value.media_title+replyHtml+'</a></div><div clacss="info" style="color:#666;float:right;"><span class="media-name">'+value.media_name+'</span><span class="bar" style="display:inline-block;overflow:hidden;width:0;height:11px;margin:-1px 5px 1px 4px;border-left:1px solid #eaeaea;vertical-align: middle;"></span><span class="date">'+value.writeDate+'</span><i class="fas fa-times news-delete" data-idx="'+value.media_idx+'" data-type="news_mail" data-str="media_idx"></i></div>';
            html += '<div class="news-content" data-idx="'+value.media_idx+'" data-type="media" style="font-size:12px;width: 700px;display: inline-block;"><div class="title" style="float:left;max-width:533px;display:inline-block;white-space: inherit;"><a style="text-decoration:none !important;color:black;font-weight:bold;" href="'+value.url+'" target="_blank">'+siteLogoHtml+value.media_title;
            // if($.isNumeric(value.me_rank)){
            //   // console.log(value.me_rank);
            //   html += rankHtml;
            // }
            // replyHtml;
            html += '</a></div><div clacss="info" style="color:#666;float:right;"><span class="media-name">'+value.media_name+'</span>'+pageHtml+'<span class="bar" style="display:inline-block;overflow:hidden;width:0;height:11px;margin:-1px 5px 1px 4px;border-left:1px solid #eaeaea;vertical-align: middle;"></span><span class="date">'+value.writeDate+'</span><i class="fas fa-times news-delete" data-idx="'+value.media_idx+'" data-type="news_mail" data-str="media_idx"></i></div>';
            html +='</div></div>';
            if(value.news_detail != null && value.news_detail != ''){
              if(value.news_detail in obj){
                obj[value.news_detail].push(value);
              }
              else{
                obj[value.news_detail] = new Array();
                obj[value.news_detail].push(value);
              }
            }
            else{
              if(value.news_type != '7'){
                $('div[data-type='+value.news_type+'] .section-body').append(html);
              }
              else{
                // console.log(value);
                // console.log(html);
                // console.log($('div[data-type='+value.news_type+']'));
                $('div[data-type='+value.news_type+']').append(html);
              }
            }
          }
        });
        // $.each(obj, function(index, value) {
        //   var html ='<ul class="relation_list" style="list-style:none;padding:0;margin:13px;margin-bottom:0px;margin-left:10px;line-height:18px;position:relative;font-size:12px;"></ul>';
        //   $('div[data-idx='+index+']').after(html);
        //   html ='<li><img src="https://ssl.pstatic.net/sstatic/search/pc/img/bu_news_sublst.gif" style="vertical-align:  text-top;">';
        //   $.each(value, function(i, v) {
        //     html +='<span style="margin-left:5px;"><a href="'+v.url+'" target="_blank"><div style="display:inline-block;overflow:hidden;max-width:492px;text-decoration:none !important;color:black;margin-right:5px;text-overflow:ellipsis;white-space:nowrap;word-wrap:normal;word-break:normal;vertical-align:top;">'+v.media_name+'</div></a><i class="fas fa-times news-delete" data-idx="'+v.media_idx+'"  data-type="news_mail" data-str="media_idx"></i></span>';
        //   });
        //   html += '</li>';
        //   $('div[data-idx='+index+']').siblings('.relation_list').append(html);
        // });
        var s_obj = new Object();
        $.each(obj, function(index, value) {
          // var html ='<ul class="relation_list" data-midx="'+index+'" style="list-style: none;padding:0;margin: 13px;margin-bottom:  0px;margin-left: 10px;line-height: 18px;position: relative;font-size: 12px;"></ul>';
          var html ='<ul class="relation_list selectable context-menu-one" id="selectable'+index+'" data-midx="'+index+'" style="list-style: none;padding:0;margin: 0;margin-bottom:  0px;margin-left: 10px;line-height: 18px;position: relative;font-size: 12px;"></ul>';
          $('div[data-idx='+index+']').after(html);
          var sortList = value.sort(function(a,b){
            var c = new Date(a.writeDateStr);
            var d = new Date(b.writeDateStr);
            return d-c;
          });

          $.each(sortList, function(i, v) {
            var siteLogoHtml_s = '';
            // if (v.media_subname != 'out' && v.media_subname != null){
            //   siteLogoHtml_s ='<img alt="'+v.media_subname+'" style="width: 15px;height: 15px;margin-right: 2px;vertical-align:text-bottom;" src="http://showbox.email/images/newsclipping/'+v.media_subname+'_logo.png" class="site-logo">';
            // }
            // var replyHtml = '<label class="replyLabel" style="display: inline-block;border-radius: 10px;padding: 2px 6px;font-size: 84%;font-weight: 700;line-height: 1;color: #fff;text-align: center;white-space: nowrap;vertical-align: baseline;background-color: #bdc3c7;margin-left: .5rem;margin-bottom: 0;">'+(($.isNumeric(value.replynum) == false)?'0':v.replynum)+'</label>';
            var rankHtml = '<label class="rankLabel" style="display: inline-block;border-radius: 10px;padding: 2px 6px;font-size: 84%;font-weight: 700;line-height: 1;color: #fff;text-align: center;white-space: nowrap;vertical-align: baseline;background-color: #bdc3c7;margin-left: .5rem;margin-bottom: 0;">'+(($.isNumeric(v.me_rank) == false)?'0':v.me_rank)+'</label>';
            var pageHtml = '';
            if(v.media_page != null && v.media_page != ''){
              // pageHtml = '<div clacss="info" style="color:#666;font-weight: normal;float:right;"><span class="bar" style="display:inline-block;overflow:hidden;width:0;height:11px;margin:-1px 5px 1px 4px;border-left:1px solid #eaeaea;vertical-align: middle;"></span><span class="page">'+v.media_page+'</span><span class="bar" style="display:inline-block;overflow:hidden;width:0;height:11px;margin:-1px 5px 1px 4px;border-left:1px solid #eaeaea;vertical-align: middle;"></span></div>'
              pageHtml = '<span class="bar" style="display:inline-block;overflow:hidden;width:0;height:11px;margin:-1px 5px 1px 4px;border-left:1px solid #eaeaea;vertical-align: middle;"></span><span class="page">'+v.media_page+'</span>';
            }

            if($.isNumeric(v.me_rank)){
              if (v.media_subname != 'out' && v.media_subname != null){
                siteLogoHtml_s ='<img alt="'+v.media_subname+'" style="width: 15px;height: 15px;margin-right: 2px;vertical-align:text-bottom;" src="http://showbox.email/images/newsclipping/'+v.media_subname+'_logo.png" class="site-logo">';
              }
            }

            html ='<li> <img src="https://ssl.pstatic.net/sstatic/search/pc/img/bu_news_sublst.gif" style="vertical-align:  text-top;"><a href="'+v.url+'" target="_blank"><div style="display: inline-block;max-width: 492px;text-decoration: none !important;color: black;margin-right: 5px;margin-left: 5px;white-space: inherit;vertical-align: top;">'+siteLogoHtml_s+v.media_title;
            // if($.isNumeric(v.me_rank)){
            //   // html += replyHtml;
            //   html += rankHtml;
            // }
            html +='</div></a><span class="txt_sinfo" style="display: inline-block;overflow: hidden;max-width: 260px;white-space: nowrap;text-overflow: ellipsis;vertical-align: top;color: #666;"><span class="press">'+v.media_name+'</span>'+pageHtml+'<span class="bar" style="display: inline-block;overflow: hidden;width: 0;height: 11px;margin: -1px 5px 1px 4px;border-left: 1px solid #eaeaea;vertical-align: middle;"></span> '+v.writeDate+' <i class="fas fa-times news-delete" data-idx="'+v.media_idx+'"  data-type="news_mail" data-str="media_idx"></i></span> </li>';
            // html ='<li> <img src="https://ssl.pstatic.net/sstatic/search/pc/img/bu_news_sublst.gif" style="vertical-align:  text-top;"><a href="'+v.url+'" target="_blank"><div style="display: inline-block;overflow: hidden;max-width: 492px;text-decoration: none !important;color: black;margin-right: 5px;margin-left: 5px;text-overflow: ellipsis;white-space: nowrap;word-wrap: normal;word-break: normal;vertical-align: top;">'+siteLogoHtml_s+v.media_title+replyHtml+'</div></a><span class="txt_sinfo" style="display: inline-block;overflow: hidden;max-width: 260px;white-space: nowrap;text-overflow: ellipsis;vertical-align: top;color: #666;"><span class="press">'+v.media_name+'</span>'+pageHtml+'<span class="bar" style="display: inline-block;overflow: hidden;width: 0;height: 11px;margin: -1px 5px 1px 4px;border-left: 1px solid #eaeaea;vertical-align: middle;"></span> '+v.writeDate+' <i class="fas fa-times news-delete" data-idx="'+v.media_idx+'"  data-type="news_mail" data-str="media_idx"></i></span> </li>';
            if($('div[data-idx='+index+']').parents('.section').data('type') != undefined){
              if($('div[data-idx='+index+']').parents('.section').data('type').toString().indexOf('5') != -1 || $('div[data-idx='+index+']').parents('.section').data('type') == '2'){
                // console.log('index : ',index,'/ length :',$('div[data-idx='+index+']').siblings('.relation_list').find('li').length);
                if($('div[data-idx='+index+']').siblings('.relation_list').find('li').length > 4){
                  if(s_obj[index] == undefined){
                    s_obj[index] = 1;
                  }
                  else{
                    s_obj[index] += 1;
                  }
                  // console.log('index : ',index,'/ s_obj :',s_obj[index]);
                }
                else{
                  $('div[data-idx='+index+']').siblings('.relation_list').append(html);
                }
              }else{
                $('div[data-idx='+index+']').siblings('.relation_list').append(html);
              }
            }
          });

          // selectable
          $( "#selectable"+index ).selectable({
            filter : "li",
            cancel : 'a,.news-delete'
          });
        });
        // 영화일반처리
        $.each($('.section .section-body'),function(i,v){
          if($(v).find('div').length == 0){
            if($(v).parents('.section').data('type').toString().indexOf('5') != -1){
            	console.log($(v),$(v).find('div').length,$(v).parents('.section').data('type'));
              $(v).parents('.section').css('display','none');
            }
          }
        });
        // console.log(s_obj);
        $.each(s_obj, function(i, v) {
            html ='<li><img src="https://ssl.pstatic.net/sstatic/search/pc/img/bu_news_sublst.gif" style="vertical-align:  text-top;"> 외 '+v+' 건</li>';
            $('div[data-idx='+i+']').siblings('.relation_list').append(html);
        });
        // 데이터 없을 시
        $.each([ 1,2,3,6 ], function( index, value ) {
          dataNoneSetting(value,'');
        });
        dataNoneSetting('issue','other');
        dataNoneSetting('marketing','other');
        dataNoneSetting('4','showbox');
      }
    }
  });
}

// context-menu
function contextMenu(type){
  if(type == 'quit'){
    console.log('clicked : ', this);
    $(".ui-selected").removeClass("ui-selected");
  }
  else if(type == 'delete'){
    swal({
      title: "해당 기사를 삭제하시겠습니까?",
      icon: "warning",
      buttons: ["취소", true],
      dangerMode: true,
    }).then(function(value) {
      console.log(value);
      if (value != null) {
        $.each( $('.ui-selected'), function( key, ele ) {
          var delIdx = $(ele).find('.news-delete').data('idx');
          var type = $(ele).find('.news-delete').data('type');
          var str = $(ele).find('.news-delete').data('str');
          console.log({idx : delIdx,table : type,idxStr : str});
          $.ajax({
            url: '/newsclipping/delete',
            type: 'post',
            data : {idx : delIdx,table : type,idxStr : str},
            datatype : 'json',
            error:function(request,status,error){
              console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
              swal("ERROR!", request.responseText, "error");
            },
            success:function(data){
              console.log(data.status);
              getNewsClippingData();
            }
          });
        });
      }
    });
  }
}
// 데이터 없을 시 1
function dataNoneSetting(num,type){
  if(type == ''){
    if($('div[data-type='+num+'] .section-body div').length == 0){
      var html = '<p style="text-align:center;margin:0px;margin-top:15px;font-size:12px;font-weight:bold;color: #666;">해당 데이터 없습니다.</p>';
      $('div[data-type='+num+'] .section-body').append(html);
    }
  }
  // else if(type=='showbox'){
  //   if($('div[data-type='+num+'] .section-body tbody tr').length < 2){
  //     var html = '<tr><td colspan="3"><p style="text-align:center;margin:0px;margin-top:15px;font-size:12px;font-weight:bold;color:#666;">해당 데이터 없습니다.</p></td></tr>';
  //     $('div[data-type='+num+'] .section-body tbody').append(html);
  //   }
  // }
  else{
    if($('div[data-type='+num+'] .section-body tbody tr').length < 1){
      var issueStr = (num == 'issue') ? 'colspan=2' : '';
      var html = '<tr><td '+issueStr+'><p style="text-align:center;margin:0px;margin-top:15px;font-size:12px;font-weight:bold;color:#666;">해당 데이터 없습니다.</p></td></tr>';
      $('div[data-type='+num+'] .section-body tbody').append(html);
    }
  }
}
// 박스오피스
function boxoffice(){
  var movieDate = $('#datepicker2').val().replace(/[-]/gi,'');
  if(getTimeStamp() == $('#datepicker2').val()){
    movieDate = yesterday($('#datepicker2').val(),'');
  }

  var movieAPI = new KobisOpenAPIRestService('0c4c68be2ac6da9c6283754c7fdac877');
  var result = movieAPI.getDailyBoxOffice(true,{targetDt:movieDate});
  $('#movieList').empty();
  $.each(result.boxOfficeResult.dailyBoxOfficeList, function(index, value) {
    // console.log(value.rank + ': '+ value.movieNm +" " + value.rankInten +'='+value.audiAcc);
    var html= '<tr><td style="padding-top:10px;padding-left:5px;padding-bottom:10px;border-bottom:1px solid #f4f4f4;"><span style="background:#707070;color:white;width:18px;height:10px;display:inherit;text-align:center;border-radius:2px;padding:2px;">'+value.rank+'</span></td><td style="border-bottom: 1px solid #f4f4f4;">'+value.movieNm+'</td><td style="border-bottom:1px solid #f4f4f4;color: #666;">'+numberWithCommas(value.audiAcc)+' 명</td><td style="border-bottom:1px solid #f4f4f4;">';
    var rankIntenVal = Math.abs(value.rankInten);
    if(Number(value.rankInten) > 0){
      html +='<img src="http://showbox.email/images/newsclipping/up_icon.jpg" style="display:inherit;float:left;">';
    }
    else if(Number(value.rankInten) < 0){
      html +='<img src="http://showbox.email/images/newsclipping/down_icon.jpg" style="display:inherit;float:left;">';
    }
    else{
      rankIntenVal = '-';
    }
    html +='<span style="padding-left:12px;vertical-align:-webkit-baseline-middle;">'+rankIntenVal+'</span></td></tr>';
    $('#movieList').append(html);
  });
}
function getByteLength(s,b,i,c){
  for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
  return b;
}
function settingMailBody(){
  // 최대 65535
  $("#M_body").clone().prependTo( "#clone" );
  $("#clone").find('.news-delete').remove();
  $("#clone").find('.groupBtn').remove();
  $("#clone").find('.delBtn').remove();
  $("#clone").find('.checkboxs').remove();
  // 댓글수,사이트이미지 메일 발송시 안보이도록
  $("#clone").find('.site-logo').remove();
  $("#clone").find('.replyLabel').remove();
  // var o_body = $("#clone").html();
  // var bodyStr = o_body;
  // var dateStr = $.datepicker.formatDate('yy-mm-dd', new Date($('#datepicker2').val()));
  // var msg = '<div style="padding:34px 0;text-align:center;"><a href="http://showbox.email/preview/newsclipping?date='+dateStr+'" target="_blank" style="text-align:center;font-size:16px;font-family:helvetica;color:#ffffff;border-radius:100px;padding:8px 20px;border: 1px solid #ff8b00;display:inline-block;background:  #ff8b00;font-weight:bold;text-decoration: none;">뉴스클리핑 전체보기</div>';
  // if(getByteLength(bodyStr+msg) > 65535){
  //   jQuery.fn.reverse = [].reverse;
  //   $("#clone").find('.section').reverse().each(function (i) {
  //     console.log(getByteLength($("#clone").html()+msg));
  //     $(this).remove();
  //     if(getByteLength($("#clone").html()+msg) < 65535){
  //       return false;
  //     }
  //   });
  // }
  // $("#clone").find('.section').last().after(msg);
  bodyStr = $("#clone").html();
  $("#clone").empty();
  return bodyStr;//{str:bodyStr,o_str:o_body}
}
// 메일 발송 버튼 클릭시
$(".sendBtn").on("click",function(){
  var param = {
    'M_sender': $(".sender-select").select2("val"),
    'M_recipi': $(".recipi-select").select2("val"),
    'M_module':$("#mail_t option:selected").val(),
    'M_group': $('.group-select').val() || [],
    'M_body': settingMailBody(),
    'M_type': $("input:radio[name=M_type]:checked").val()
  };
  var check=true;
  if(param["M_sender"] == null){
    check = requiredMessage("M_sender","보내는 사람를 선택해주세요.");
  }
  if(param["M_recipi"] == ""){
    check = requiredMessage("M_recipi","받는사람을 선택해주세요.");
  }
  if($('#datepicker2').val() == ""){
    check = requiredMessage("datepicker2","보고날짜를 선택해주세요.");
  }
  if(param["M_type"] == "1"){
    var time = $('#timepicker').val();
    var date = $('#datepicker').val();
    if(time == "" || date == ""){
      check = requiredMessage("date","예약시간을 설정해주세요.");
    }
    else if(time.split(' : ')[1] % 10 != 0){
      check = requiredMessage("date","예약시간은 10분단위로 설정해주세요.");
    }
    else{
      var endDate = date+" "+time.replace(' : ',':')+":00";
      var startDateCompare = new Date();
      var endDateCompare = new Date(endDate);
      if(startDateCompare.getTime() >= endDateCompare.getTime()){
        check = requiredMessage("date","현재시간보다 작습니다.");
      }
      else{
        param['end_reserve_time'] = date+" "+time.replace(' : ',':')+":00";
      }
    }
  }
  if(check == false){
    return false;
  }
  swal({
    title: "본문의 내용이 확실합니까?",
    icon: "warning",
    // buttons: ["취소", true],
    dangerMode: true,
    button: {
      text: "보내기",
      closeModal: false,
    }
  })
  .then(function(value) {
    if (value != null) {
      $('span.messages').find('.error').text('');
      var dateStr = $.datepicker.formatDate('yy-mm-dd', new Date($('#datepicker2').val()));
      // var bodyDic = settingMailBody();
      // param['M_body'] = bodyDic.str;
      // param['o_body'] = bodyDic.o_str;
      // param['M_body'] = '<div id="msg" style="width:801px;text-align:center;margin-bottom:10px;"><p style="font-size: 13px; font-weight: bold;">[ 메일 전체내용을 보시려면 <a href="http://showbox.email/preview/newsclipping?date='+dateStr+'" target="_blank" style="font-family:맑은고딕,malgungothic,돋움,dotum;">여기</a>를 눌러 주세요 ]</p></div>'+param['M_body'];
      param['M_subject'] = '[베타버전]['+dateStr+'] 일일 주요 뉴스';
      SendEmails(param);
    }
  });
});
// 메일 insert ajax
function SendEmails(param){
  $.ajax({
    url: '/newsclipping/send',
    type: 'post',
    data : param,
    datatype : 'json',
    error:function(request,status,error){
      console.log('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
      swal("ERROR!", request.responseText, "error")
      .then(function(){
        location.reload();
      });
    },
    success:function(data){
      if(data.status){
        swal("SUCCESS!", '메일발송 완료했습니다.', "success")
        .then(function(){
          location.reload();
        });
      }else{
        swal("ERROR!", '새로고침 후 다시 시도해주세요.', "error")
        .then(function(){
          location.reload();
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

// 예약기능 클릭시
$('input[name=M_type]').on('change',function(){
  $('.reserveTime').toggle();
});
// 예약시간
var dt = new Date();
var options = {
  now: dt.getHours()+":"+String(Math.ceil(dt.getMinutes() / 10) * 10),
  twentyFour: true, //Display 24 hour format, defaults to false
  upArrow: 'wickedpicker__controls__control-up', //The up arrow class selector to use, for custom CSS
  downArrow: 'wickedpicker__controls__control-down', //The down arrow class selector to use, for custom CSS
  close: 'wickedpicker__close', //The close class selector to use, for custom CSS
  hoverState: 'hover-state', //The hover state class to use, for custom CSS
  title: '10분단위로 설정해주세요.', //The Wickedpicker's title,
  showSeconds: false, //Whether or not to show seconds, secondsInterval: 1, //Change interval for seconds, defaults to 1  ,
  minutesInterval: 10, //Change interval for minutes, defaults to 1
  beforeShow: null, //A function to be called before the Wickedpicker is shown
  show: null, //A function to be called when the Wickedpicker is shown
  clearable: false, //Make the picker's input clearable (has clickable "x")
};
$('#timepicker').wickedpicker(options);
// 예약날짜
$('#datepicker').datepicker({
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
  minDate: 0,
  maxDate: "+7D"
});
// 일일보고날짜
$('#datepicker2').daterangepicker({
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
