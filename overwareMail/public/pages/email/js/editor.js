// 메일 editor
tinymce.init({
  selector: 'textarea',
  theme: 'modern',
  height: 400,
  language:'ko_KR',
  mobile: {
    theme: 'mobile',
    plugins: [ 'autosave' ]
  },
  plugins: 'print preview fullpage searchreplace autolink directionality visualblocks visualchars fullscreen image link media template code table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists textcolor wordcount imagetools contextmenu colorpicker textpattern',
  toolbar1: 'undo redo |  formatselect | bold italic forecolor backcolor | alignleft aligncenter alignright alignjustify | numlist bullist outdent indent | removeformat | code | help',
  image_advtab: true,
  image_title: true,
  images_upload_url: '/email/send/img',
  images_upload_credentials: true,
  images_upload_base_path: 'http://mail.overware.co.kr/',
  file_picker_types: 'file media',
  media_live_embeds: true,
  media_poster: false,
  media_alt_source: false,
  file_picker_callback: function(cb, value, meta) {
    console.log(cb, value, meta);
    console.log(meta.filetype);
    var input = document.createElement('input');
    input.setAttribute('type', 'file');



    // Note: In modern browsers input[type="file"] is functional without
    // even adding it to the DOM, but that might not be the case in some older
    // or quirky browsers like IE, so you might want to add it to the DOM
    // just in case, and visually hide it. And do not forget do remove it
    // once you do not need it anymore.

    input.onchange = function() {
      var file = this.files[0];

      var reader = new FileReader();
      reader.onload = function () {
        // Note: Now we need to register the blob in TinyMCEs image blob
        // registry. In the next release this part hopefully won't be
        // necessary, as we are looking to handle it internally.
        var id = 'blobid' + (new Date()).getTime();
        var blobCache =  tinymce.activeEditor.editorUpload.blobCache;
        var base64 = reader.result.split(',')[1];
        console.log(id, file, base64);
        var blobInfo = blobCache.create(id, file, base64);
        blobCache.add(blobInfo);

        // call the callback and populate the Title field with the file name
        console.log(blobInfo.blobUri());
        console.log(blobInfo.base64());
        console.log(blobInfo.blob());
        console.log(blobInfo.blobUri());
        console.log(blobInfo.id());
        console.log(blobInfo.name());
        console.log(blobInfo.uri());
        if (meta.filetype == 'file') {
          cb(blobInfo.blobUri(), { title: file.name });
        }

        if (meta.filetype == 'media') {
          input.setAttribute('accept', 'video/*');
          // cb(blobInfo.blobUri(), {source2: 'alt.ogg', poster: 'image.jpg'});
          cb(blobInfo.blobUri());
        }
      };
      reader.readAsDataURL(file);
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
