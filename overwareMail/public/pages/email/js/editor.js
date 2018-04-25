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
  plugins: 'print preview fullpage searchreplace autolink directionality visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists textcolor wordcount imagetools contextmenu colorpicker textpattern help',
  toolbar1: 'formatselect | bold italic strikethrough forecolor backcolor | link | alignleft aligncenter alignright alignjustify  | numlist bullist outdent indent  | removeformat',
  image_advtab: true,
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
