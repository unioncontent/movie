// 메일 editor
tinymce.init({
  selector: 'textarea',
  theme: 'modern',
  height: 600,
  language:'ko_KR',
  mobile: {
    theme: 'mobile',
    plugins: [ 'autosave', 'lists', 'autolink'],
    toolbar: [ 'undo', 'bold', 'italic', 'styleselect', 'image' ]
  },
  plugins: 'print fullpage searchreplace autolink directionality visualblocks visualchars fullscreen image link media code table charmap hr insertdatetime advlist lists textcolor wordcount imagetools contextmenu colorpicker',
  toolbar: 'undo redo | fontselect fontsizeselect spaceline | bold italic forecolor backcolor |  image media fileUpload | alignleft aligncenter alignright alignjustify |  numlist bullist outdent indent | removeformat | help',
  font_formats : '굴림=Gulim;돋움=Dotum;바탕=Batang;궁서=Gungsuh;나눔고딕=nanumgothic;나눔바른고딕=nanumbarungothic;',
  fontsize_formats: "8px 10px 12px 14px 18px 24px 36px",
  image_advtab: true,
  image_title: true,
  relative_urls : false,
  remove_script_host : false,
  convert_urls : true,
  images_upload_url: '/email/send/img',
  // images_upload_base_path: 'http://mail.overware.co.kr/',
  media_live_embeds: true,
  media_poster: false,
  media_alt_source: false,
  media_url_resolver: function (data, resolve) {
    var aTagHref = data.url;
    if(data.url.indexOf('/watch?v=') != -1 && data.url.indexOf('www.youtube.com') != -1){
      data.url = data.url.replace('/watch?v=','/v/');
      // data.url = data.url.replace('/watch?v=','/embed/');
    }
    else if(data.url.indexOf('https://youtu.be/') != -1 && data.url.indexOf('/watch?v=') == -1 && data.url.indexOf('/embed/') == -1){
      data.url = data.url.replace('https://youtu.be/','https://www.youtube.com/v/');
      // data.url = data.url.replace('https://youtu.be/','https://www.youtube.com/embed/');
    }
    var embedHtml = '<div style="position: relative; text-align: center;">\
    <iframe  src="'+ data.url +'" width="640" height="360"></iframe>\
    <p style="text-align: center;">영상이 안 보이는 경우 <a target="_blank" href="'+ aTagHref +'">여기</a>를 눌러 주세요</p></div>';
    resolve({html: embedHtml});
    // if (data.url.indexOf('YOUR_SPECIAL_VIDEO_URL') !== -1) {
    // } else {
    //   resolve({html: ''});s
    // }
  },
  // file_picker_types: 'file media',
  // file_picker_callback: function(cb, value, meta) {
  //   var input = document.createElement('input');
  //   input.setAttribute('type', 'file');
  //
  //   if (meta.filetype == 'media') {
  //     input.setAttribute('accept', 'video/*');
  //   }
  //
  //   input.onchange = function() {
  //     var file = this.files[0];
  //     console.log(file);
  //     var reader = new FileReader();
  //     reader.readAsDataURL(file);
  //     reader.onload = function () {
  //       var xhr, formData;
  //       xhr = new XMLHttpRequest();
  //       console.log('XMLHttpRequest');
  //       console.log(reader);
  //       xhr.withCredentials = false;
  //       xhr.open('POST', '/email/send/file');
  //       // console.log(reader.result);
  //       // console.log(file);
  //       //
  //       xhr.onload = function() {
  //         var json;
  //
  //         if (xhr.status != 200) {
  //           alert('HTTP Error: ' + xhr.status);
  //           return;
  //         }
  //
  //         json = JSON.parse(xhr.responseText);
  //
  //         if (!json || typeof json.location != 'string') {
  //           alert('Invalid JSON: ' + xhr.responseText);
  //           return;
  //         }
  //         console.log(meta.filetype);
  //         if (meta.filetype == 'file') {
  //           // console.log({ title: file.name});
  //           cb(json.location, { title: file.name.split('.')[0] });
  //         }
  //         else if (meta.filetype == 'media') {
  //           cb(json.location);
  //         }
  //       };
  //       console.log(file, file.name);
  //       formData = new FormData();
  //       formData.append('file', file, file.name);
  //       xhr.send(formData);
  //
  //       // $.ajax({
  //       //   url: "/email/send/file",
  //       //   type: "POST",
  //       //   data: {file:reader.result},
  //       //   dataType: 'json',
  //       //   processData: false,
  //       //   contentType: false,
  //       //   success: function (data) {
  //       //     console.log("File available at: ", data);
  //       //     // var name = file.name.split('.')[0];
  //       //     // var id = 'blobid' + (new Date()).getTime();
  //       //     // var base64 = reader.result.split(',')[1];
  //       //     // var blobCache =  tinymce.activeEditor.editorUpload.blobCache;
  //       //     // var blobInfo = blobCache.create(name, file, reader.result);
  //       //     // blobCache.add(blobInfo);
  //       //
  //       //     if (meta.filetype == 'file') {
  //       //       // cb(blobInfo.blobUri(), { title: file.name });
  //       //       cb(data.location, { title: file.name });
  //       //     }
  //       //
  //       //     if (meta.filetype == 'media') {
  //       //       input.setAttribute('accept', 'video/*');
  //       //       // cb(blobInfo.blobUri(), {source2: 'alt.ogg', poster: 'image.jpg'});
  //       //       // cb(blobInfo.blobUri());
  //       //       cb(data.location);
  //       //     }
  //       //   },
  //       //   error: function (data) {
  //       //     var obj = jQuery.parseJSON(data);
  //       //     alert(obj.error);
  //       //   }
  //       // });
  //     };
  //   };
  //   input.click();
  // },
  content_css: [
    '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
    '//www.tinymce.com/css/codepen.min.css',
    '//use.fontawesome.com/releases/v5.0.13/css/all.css'
  ],
  content_style: [
    // 'body{padding:30px; margin:auto;font-size:14px;font-family:Gulim,"Helvetica Neue",Helvetica,Arial,sans-serif;color:#222} h1,h2,h3,h4,h5,h6 {font-weight:400;margin-top:1.2em} h1 {} h2{} table {width:100%; border-collapse: collapse;} table td, th {border: 1px solid; padding:10px; text-align:left;font-size:14px;font-family:Gulim,"Helvetica Neue",Helvetica,Arial,sans-serif;} table th {background-color:#E2E4E7}'
    '.mce-content-body {padding:30px; margin:auto; padding-top:25px; font-size: 12px; font-family: 돋움!important;color: #333333;}.mce-content-body p{margin: 0;padding: 0;}'
  ],
  setup: function(editor) {
    editor.on('init', function(){
        this.getDoc().body.style.fontSize = '12';
        this.getDoc().body.style.fontFamily = 'dotum';
    });

    editor.addButton('fileUpload', {
      icon:'fa fa-folder-open',
      tooltip: '파일 삽입/수정',
      onclick:function(){
        $("#fileUpload-Modal").modal('show');
      }
    });

    editor.addButton('spaceline', {
      // type: 'listbox',
      type: 'menubutton',
      icon: false,//'fa fa-arrows-v'
      text: '줄간격',
      menu: [{
        text:'50%',
        onclick: function() {
          var blocks = tinymce.activeEditor.selection.getSelectedBlocks();
          tinymce.each( blocks ,function(block){
            if( block.nodeName === 'P'){
              $(block).css('line-height', '50%');
            }
          });
        }
      },{
        text:'80%',
        onclick: function() {
          var blocks = tinymce.activeEditor.selection.getSelectedBlocks();
          tinymce.each( blocks ,function(block){
            if( block.nodeName === 'P'){
              $(block).css('line-height', '80%');
            }
          });
        }
      },{
        text:'100%',
        onclick: function() {
          var blocks = tinymce.activeEditor.selection.getSelectedBlocks();
          tinymce.each( blocks ,function(block){
            if( block.nodeName === 'P'){
              $(block).css('line-height', '100%');
            }
          });
        }
      },{
        text:'120%',
        onclick: function() {
          var blocks = tinymce.activeEditor.selection.getSelectedBlocks();
          tinymce.each( blocks ,function(block){
            if( block.nodeName === 'P'){
              $(block).css('line-height', '120%');
            }
          });
        }
      },{
        text:'150%',
        onclick: function() {
          var blocks = tinymce.activeEditor.selection.getSelectedBlocks();
          tinymce.each( blocks ,function(block){
            if( block.nodeName === 'P'){
              $(block).css('line-height', '150%');
            }
          });
        }
      },{
        text:'180%',
        onclick: function() {
          var blocks = tinymce.activeEditor.selection.getSelectedBlocks();
          tinymce.each( blocks ,function(block){
            if( block.nodeName === 'P'){
              $(block).css('line-height', '180%');
            }
          });
        }
      },{
        text:'200%',
        onclick: function() {
          var blocks = tinymce.activeEditor.selection.getSelectedBlocks();
          tinymce.each( blocks ,function(block){
            if( block.nodeName === 'P'){
              $(block).css('line-height', '200%');
            }
          });
        }
      }]
      // onselect: function (e) {
      //   var lineValue = this.value();
      //   var blocks = tinymce.activeEditor.selection.getSelectedBlocks();
      //   tinymce.each( blocks ,function(block){
      //     if( block.nodeName === 'P'){
      //       $(block).css('line-height', lineValue);
      //     }
      //   });
      // },
      // values: [
      //   { text: '50%', value: '50%' },
      //   { text: '80%', value: '80%' },
      //   { text: '100%', value: '100%' },
      //   { text: '120%', value: '120%' },
      //   { text: '150%', value: '150%' },
      //   { text: '180%', value: '180%' },
      //   { text: '200%', value: '200%' }
      // ]
    });
  },
  init_instance_callback: function(editor){
    // var defaultHtml= '<table width="750" align="center" cellpadding="0" cellspacing="0" style="border: solid 1px #cacaca; padding: 20px;"><tbody><tr><td><table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="642"><img src="http://showbox.email/templates/images/logo/show_logo.png" width="135" height="36" alt="로고"></td><td width="92">NEWS No.</td></tr></tbody></table><table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td><p><br></p><div style="text-align: center; margin-top: 100px; padding: 10px; background-color: #eeeeee"></div><br><div style="padding: 40px 20px;"><p style="font-size: 13px; font-weight:bold; color: #000; padding: 0 0 5px 3px"> 영화 관련 데이타 다운로드</p><hr><br></div><p><br></p></td></tr></tbody></table></td></tr></tbody></table>';
    var defaultHtml = '<p><br></p><div style="text-align: center; margin-top: 100px; padding: 10px; background-color: #eeeeee"></div><br><div style="padding: 40px 20px;"><p style="font-size: 13px; font-weight:bold; color: #000; padding: 0 0 5px 3px"> 영화 관련 데이타 다운로드</p><hr><br></div><p><br></p>'
    if($('#mailType').val()!=''){
      var mailData = JSON.parse($("#mailData").val());
      defaultHtml = mailData.M_body;
    }
    editor.setContent(defaultHtml);
  }
});

function setContent(){
  tinyMCE.activeEditor.setContent('<p><br></p><div style="text-align: center; margin-top: 100px; padding: 10px; background-color: #eeeeee"></div><br><div style="padding: 40px 20px;"><p style="font-size: 13px; font-weight:bold; color: #000; padding: 0 0 5px 3px"> 영화 관련 데이타 다운로드</p><hr><br></div><p><br></p>', {format : 'raw'});
}

function get_tinymce_html_content(){
  var html = tinyMCE.activeEditor.getBody().innerHTML;
  html = html.replace(/<iframe/g,'<embed').replace(/iframe>/g,'embed>');
  return html;
}

// 파일 업로드 js
$(':radio[name="btnType"]').on('change',function(){
  if($(this).val() != 'cBtn-c'){
    $('#urlInput').hide();
    $('#fileUpload').show();
  }
  else{
    $('#urlInput').show();
    $('#fileUpload').hide();
  }
});
$("#btn-file-upload").on('click',function(){
  var btnTypeVal = $(':radio[name="btnType"]:checked').val();
  if(btnTypeVal == ""){
    alert("버튼형식을 선택해주세요.");
    return false;
  }
  var btnNameVal = $('#btnName').val();
  if(btnNameVal == ""){
    alert("버튼이름을 입력해주세요.");
    return false;
  }
  if(btnTypeVal != 'cBtn-c'){
    var fileVal = $('#fileUpload').val();
    if(fileVal == ""){
      alert("파일을 입력해주세요.");
      return false;
    }
    $('.file-upload-loader').show();
    fileUpload({file:$('#fileUpload')[0].files[0],type:btnTypeVal,name:btnNameVal})
  }
  else{
    var urlVal = $('#urlInput').val();
    if(urlVal == ""){
      alert("URL을 입력해주세요.");
      return false;
    }

    var aTagHtml = '<a style="color: #ffffff; font-weight: bold; font-size: 12px; text-decoration: none; " href="'+urlVal+'" target="_blank">'+btnNameVal+'</a>'
    var html = '<p><span style="width: 100px; background:#3d94f6; margin-top:10px; padding: 5px 30px; text-align: center;">'+aTagHtml+'</span>&nbsp; &nbsp; &nbsp;</p><p>﻿﻿<br></p>'
    tinymce.activeEditor.execCommand('mceInsertContent', false, html);
    $("#fileUpload-Modal").modal('hide');
  }
});

function fileUpload(param){
  var formData = new FormData();
  formData.append('file', param.file);
  $.ajax({
    url: "/email/send/file",
    type: "POST",
    data: formData,
    dataType: 'json',
    processData: false,
    contentType: false,
    success: function (data) {
      console.log("File available at: ", data);
      if(data.location != undefined){
        var aTagHtml = '<a style="color: #ffffff; font-weight: bold; font-size: 12px; text-decoration: none; " href="'+data.location+'">'+param.name+'</a>'
        var html = '<p><span style="width: 100px; background:#4E4E4E; margin-top:20px; padding: 5px 30px; text-align: center;">'+aTagHtml+'</span>&nbsp; &nbsp; &nbsp;</p><p>﻿﻿<br></p>';
        if(param.type== 'cBtn-b'){
          aTagHtml = '<a style="color: #000000; font-weight: bold; font-size: 12px; text-decoration: none; " href="'+data.location+'">'+param.name+'</a>'
          html = '<p><span style="background:#f9f9f9; border: 1px solid #000000; width: 130px; margin-top:5px; padding: 5px 15px; font-weight: bold; ; font-size: 12px;"">'+aTagHtml+'</span>&nbsp; &nbsp; &nbsp;</p><p>﻿﻿<br></p>';
        }

        $('.file-upload-loader').fadeOut(500);
        tinymce.activeEditor.execCommand('mceInsertContent', false, html);
        $("#fileUpload-Modal").modal('hide');
      }
      else{
        $('.file-upload-loader').fadeOut(500);
        alert('파일첨부에 실패했습니다.\n다시 시도해주세요.');
      }
    },
    error: function (data) {
      var obj = jQuery.parseJSON(data);
      console.log(obj.error);
      alert('파일첨부에 실패했습니다.\n다시 시도해주세요.');
    }
  });
}

// 파일첨부 닫힐때 초기;
$('#fileUpload-Modal').on('hidden.bs.modal', function () {
  $('#fileUpload-Modal input[type=text]').val("");
  $(':radio[name="btnType"]:checked').prop('checked', false);
  $("#fileUpload").val("");
});
