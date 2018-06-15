var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
// 추가
var compression = require('compression');
var expressLayouts = require('express-ejs-layouts');
var session = require('express-session');
var passport = require('passport');
var  flash = require('connect-flash');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
// ejs-layouts setup
app.set('layout', 'layout/layout');
app.set('layout extractScripts', true);
app.set('layout extractStyles', true);
// middlewares setup
app.use(compression());
app.use(expressLayouts);
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.json({limit: '500mb'}));
app.use(bodyParser.urlencoded({limit: '500mb', extended: true}));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
// login/logout setup
app.use(session({
  secret: '1@%24^%$3^*&98&^%$', // 쿠키에 저장할 connect.sid값을 암호화할 키값 입력
  resave: false, //세션 아이디를 접속할때마다 새롭게 발급하지 않음
  saveUninitialized: true, //세션 아이디를 실제 사용하기전에는 발급하지 않음
  cookie: {
    maxAge: 1000 * 60 * (60*3) // 쿠키 유효기간 3시간
  }
}));
app.use(flash()); // flash message
app.use(passport.initialize());
app.use(passport.session());
// routes setup
app.use(function(req, res, next) {
  // console.log(req.user);
  res.locals.user = {
    n_idx: '',
    user_type: '',
    user_admin: '',
    user_id: '',
    user_pw: '',
    user_name: '',
    company_name: '',
    createDate: '',
    updateDate: ''
  };
  if('user' in req){
    res.locals.user = req.user;
    // console.log(res.locals.user);
  }
  next();
});

var index = require('./routes/index');
app.use('/', index);
var period = require('./routes/period');
app.use('/period', period);
var newsclipping = require('./routes/newsclipping');
app.use('/newsclipping', newsclipping);
var email = require('./routes/email');
app.use('/email', email);
var list = require('./routes/list');
app.use('/list', list);
var user = require('./routes/user');
app.use('/user', user);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
