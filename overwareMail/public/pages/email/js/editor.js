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
  media_live_embeds: false,
  media_poster: false,
  media_alt_source: false,
  media_filter_html: false,
  video_template_callback: function(data) {
   return '<video width="' + data.width + '" height="' + data.height + '"' + (data.poster ? ' poster="' + data.poster + '"' : '') + ' controls="controls">\n' + '<source src="' + data.source1 + '"' + (data.source1mime ? ' type="' + data.source1mime + '"' : '') + ' />\n' + (data.source2 ? '<source src="' + data.source2 + '"' + (data.source2mime ? ' type="' + data.source2mime + '"' : '') + ' />\n' : '') + '</video>';
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
            console.log({ title: file.name });
            cb(json.location, { title: file.name });
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
  templates: [
    { title: 'Test template 1', content: 'Test 1' },
    { title: 'Test template 2', content: 'Test 2' }
  ],
  content_css: [
    '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
    '//www.tinymce.com/css/codepen.min.css'
  ],
  content_style: [
    'body{padding:30px; margin:auto;font-size:16px;font-family:Lato,"Helvetica Neue",Helvetica,Arial,sans-serif; line-height:1.3; letter-spacing: -0.03em;color:#222} h1,h2,h3,h4,h5,h6 {font-weight:400;margin-top:1.2em} h1 {} h2{} table {width:100%; border-collapse: collapse;} table td, th {border: 1px solid; padding:10px; text-align:left;font-size:16px;font-family:Lato,"Helvetica Neue",Helvetica,Arial,sans-serif; line-height:1.6;} table th {background-color:#E2E4E7}'
  ]
});

function get_tinymce_html_content(){
  return tinyMCE.activeEditor.getBody().innerHTML
}
