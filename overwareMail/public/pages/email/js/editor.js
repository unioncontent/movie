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
  plugins: 'print preview fullpage searchreplace autolink directionality visualblocks visualchars fullscreen image link media template code table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists textcolor wordcount imagetools contextmenu colorpicker textpattern',
  toolbar: 'undo redo | fileStyle | fontselect fontsizeselect | bold italic forecolor backcolor | alignleft aligncenter alignright alignjustify | numlist bullist outdent indent | removeformat | help',
  font_formats : '굴림=Gulim;돋움=Dotum;바탕=Batang;궁서=Gungsuh;나눔고딕=nanumgothic;나눔바른고딕=nanumbarungothic;',
  fontsize_formats: "8px 10px 12px 14px 18px 24px 36px",
  image_advtab: true,
  image_title: true,
  images_upload_url: '/email/send/img',
  // images_upload_base_path: 'http://mail.overware.co.kr/',
  file_picker_types: 'file media',
  media_live_embeds: true,
  media_poster: false,
  media_alt_source: false,
  extended_valid_elements : "iframe[src|title|width|height|allowfullscreen|frameborder|class|id],embed[type|width|height|src|*],video[controls|preload|width|height|data-setup],source[src|type]",
  video_template_callback: function(data) {
   return '<embed src="'+data.src+'" width="' + data.width + '" height="' + data.height + '"' + (data.poster ? ' poster="' + data.poster + '"' : '') + ' type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true">\n' + '<p style="text-align: center;">영상이 안 보이는 경우 <a target="_blank" href="'+data.src+'">여기</a>를 눌러 주세요</p>' + '</embed>';
  },
  file_picker_callback: function(cb, value, meta) {
    var input = document.createElement('input');
    input.setAttribute('type', 'file');

    if (meta.filetype == 'media') {
      input.setAttribute('accept', 'video/*');
    }

    input.onchange = function() {
      var file = this.files[0];
      console.log(file);
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function () {
        var xhr, formData;
        xhr = new XMLHttpRequest();
        console.log('XMLHttpRequest');
        console.log(reader);
        xhr.withCredentials = false;
        xhr.open('POST', '/email/send/file');
        // console.log(reader.result);
        // console.log(file);
        //
        xhr.onload = function() {
          var json;

          if (xhr.status != 200) {
            alert('HTTP Error: ' + xhr.status);
            return;
          }

          json = JSON.parse(xhr.responseText);

          if (!json || typeof json.location != 'string') {
            alert('Invalid JSON: ' + xhr.responseText);
            return;
          }
          console.log(meta.filetype);
          if (meta.filetype == 'file') {
            // console.log({ title: file.name});
            cb(json.location, { title: file.name.split('.')[0] });
          }
          else if (meta.filetype == 'media') {
            cb(json.location);
          }
        };
        console.log(file, file.name);
        formData = new FormData();
        formData.append('file', file, file.name);
        xhr.send(formData);

        // $.ajax({
        //   url: "/email/send/file",
        //   type: "POST",
        //   data: {file:reader.result},
        //   dataType: 'json',
        //   processData: false,
        //   contentType: false,
        //   success: function (data) {
        //     console.log("File available at: ", data);
        //     // var name = file.name.split('.')[0];
        //     // var id = 'blobid' + (new Date()).getTime();
        //     // var base64 = reader.result.split(',')[1];
        //     // var blobCache =  tinymce.activeEditor.editorUpload.blobCache;
        //     // var blobInfo = blobCache.create(name, file, reader.result);
        //     // blobCache.add(blobInfo);
        //
        //     if (meta.filetype == 'file') {
        //       // cb(blobInfo.blobUri(), { title: file.name });
        //       cb(data.location, { title: file.name });
        //     }
        //
        //     if (meta.filetype == 'media') {
        //       input.setAttribute('accept', 'video/*');
        //       // cb(blobInfo.blobUri(), {source2: 'alt.ogg', poster: 'image.jpg'});
        //       // cb(blobInfo.blobUri());
        //       cb(data.location);
        //     }
        //   },
        //   error: function (data) {
        //     var obj = jQuery.parseJSON(data);
        //     alert(obj.error);
        //   }
        // });
      };
    };
    input.click();
  },
  setup: function(editor) {
    editor.addButton('fileStyle', {
      type: 'menubutton',
      text: 'fileStyle',
      icon: false,
      menu: [{
        text: '본문자료',
        onclick: function() {
          var activeTag = $(tinymce.activeEditor.selection.getNode());
          var tagClone = activeTag.clone();
          console.lolg(tagClone);
          console.lolg(tagClone.html());
          activeTag.before('<p><span style="width: 100px; background:#4E4E4E; margin-top:20px; padding: 5px 30px; text-align: center;">'+tagClone.html()+'</span>&nbsp; &nbsp; &nbsp;</p><p>﻿﻿<br></p>');
          activeTag.prev('a').css({
            'color': '#ffffff',
            'font-weight': 'bold',
            'font-size': '12px',
            'text-decoration': 'none'
          });
          tagClone.remove();
        }
      },{
        text: '관련데이터',
        onclick: function() {
          var activeTag = $(tinymce.activeEditor.selection.getNode());
          var tagClone = activeTag.clone();
          activeTag.before('<p><span style="background:#f9f9f9; border: 1px solid #000000; width: 130px; margin-top:5px; padding: 5px 15px; font-weight: bold; ; font-size: 12px;"">'+tagClone.html()+'</span>&nbsp; &nbsp; &nbsp;</p><p>﻿﻿<br></p>');
          activeTag.prev('a').css({
            'color': '#000000',
            'font-size': '12px',
            'text-decoration': 'none'
          });
          tagClone.remove();
        }
      },{
          text: '바로가기',
          onclick: function() {
            var activeTag = $(tinymce.activeEditor.selection.getNode());
            var tagClone = activeTag.clone();
            activeTag.before('<p><span style="width: 100px; background:#3d94f6; margin-top:10px; padding: 5px 30px; text-align: center;">'+tagClone.html()+'</span>&nbsp; &nbsp; &nbsp;</p><p>﻿﻿<br></p>');
            activeTag.prev('a').css({
              'color': '#ffffff',
              'font-weight': 'bold',
              'font-size': '12px',
              'text-decoration': 'none'
            });
            tagClone.remove();
          }
      }]
    });
  },
  content_css: [
    '//www.tinymce.com/css/codepen.min.css'
  ],
  content_style: [
    'body{padding:30px; margin:auto;font-size:14px;font-family:Gulim,"Helvetica Neue",Helvetica,Arial,sans-serif;color:#222} h1,h2,h3,h4,h5,h6 {font-weight:400;margin-top:1.2em} h1 {} h2{} table {width:100%; border-collapse: collapse;} table td, th {border: 1px solid; padding:10px; text-align:left;font-size:14px;font-family:Gulim,"Helvetica Neue",Helvetica,Arial,sans-serif;} table th {background-color:#E2E4E7}'
  ],
  init_instance_callback: function(editor){
    var defaultHtml= '<table width="750" align="center" cellpadding="0" cellspacing="0" style="border: solid 1px #cacaca; padding: 20px;"><tbody><tr><td><table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="642"><img src="http://overmail.iptime.org:8080/templates/images/logo/show_logo.png" width="135" height="36" alt="로고"></td><td width="92">NEWS No.</td></tr></tbody></table><table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td><p><br></p><div style="text-align: center; margin-top: 100px; padding: 10px; background-color: #eeeeee"></div><br><div style="padding: 40px 20px;"><p style="font-size: 13px; font-weight:bold; color: #000; padding: 0 0 5px 3px"> 영화 관련 데이타 다운로드</p><hr><br></div><p><br></p></td></tr></tbody></table></td></tr></tbody></table>';
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
  return tinyMCE.activeEditor.getBody().innerHTML
}
