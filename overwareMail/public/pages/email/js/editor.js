// 메일 editor
tinymce.init({
  selector: 'textarea',
  theme: 'modern',
  height: 400,
  language:'ko_KR',
  mobile: {
    theme: 'mobile',
    plugins: [ 'autosave', 'lists', 'autolink'],
    toolbar: [ 'undo', 'bold', 'italic', 'styleselect', 'image' ]
  },
  plugins: 'print preview fullpage searchreplace autolink directionality visualblocks visualchars fullscreen image link media template code table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists textcolor wordcount imagetools contextmenu colorpicker textpattern',
  toolbar1: 'undo redo |  formatselect | bold italic forecolor backcolor | alignleft aligncenter alignright alignjustify | numlist bullist outdent indent | removeformat | code | help',
  image_advtab: true,
  image_title: true,
  images_upload_url: '/email/send/img',
  images_upload_credentials: true,
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
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function () {
        var xhr, formData;
        xhr = new XMLHttpRequest();
        xhr.withCredentials = false;
        xhr.open('POST', '/email/send/file');
        console.log(reader.result);
        console.log(file);

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
            console.log({ title: file.name});
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
  // templates: [
  //   { title: 'Test template 1', content: 'Test 1' },
  //   { title: 'Test template 2', content: 'Test 2' }
  // ],
  setup: function(editor) {
    console.log(editor);
    // z-index: 1000000;
    // $(ElementsArr[0]).css('z-index');
  },
  content_css: [
    '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
    '//www.tinymce.com/css/codepen.min.css'
  ],
  content_style: [
    'body{padding:30px; margin:auto;font-size:16px;font-family:Lato,"Helvetica Neue",Helvetica,Arial,sans-serif; line-height:1.3; letter-spacing: -0.03em;color:#222} h1,h2,h3,h4,h5,h6 {font-weight:400;margin-top:1.2em} h1 {} h2{} table {width:100%; border-collapse: collapse;} table td, th {border: 1px solid; padding:10px; text-align:left;font-size:16px;font-family:Lato,"Helvetica Neue",Helvetica,Arial,sans-serif; line-height:1.6;} table th {background-color:#E2E4E7}'
  ],
  // init_instance_callback: function(editor){
  //   editor.on('SetContent',function(e){
  //     e.content
  // '<p><br></p><div style="text-align: center; margin-top: 100px; padding: 10px; background-color: #eeeeee"></div><br><div style="padding: 40px 20px;"><p style="font-size: 13px; font-weight:bold; color: #000; padding: 0 0 5px 3px"> 영화 관련 데이타 다운로드</p><hr><br></div><p><br></p>'
  //   });
  // }
});

function setContent(){
  tinyMCE.activeEditor.setContent('<p><br></p><div style="text-align: center; margin-top: 100px; padding: 10px; background-color: #eeeeee"></div><br><div style="padding: 40px 20px;"><p style="font-size: 13px; font-weight:bold; color: #000; padding: 0 0 5px 3px"> 영화 관련 데이타 다운로드</p><hr><br></div><p><br></p>', {format : 'raw'});
}

function get_tinymce_html_content(){
  return tinyMCE.activeEditor.getBody().innerHTML
}
