var express = require('express');
var passport = require('passport');
var bcrypt = require('bcrypt-nodejs');
var LocalStrategy = require('passport-local').Strategy;
var router = express.Router();
// DB module
var content = require('../models/content.js');
var period = require('../models/period.js');
var user = require('../models/user.js');

var isAuthenticated = function (req, res, next) {
  if (req.isAuthenticated())
    return next();
  res.redirect('/login');
};

// 대시보드
router.get('/', isAuthenticated, async function(req, res, next) {
  var data = {
    list:await period.getYesterday(req.user),
    period:{
      'todaySendCount' : await period.getTodaySendCount(req.user),
      'successNfailCount' : await period.getSuccessNfailCount(req.user),
      'todayCount' : await period.getTodayNReservationCount(req.user,'0') || 0,
      'reservationCount' : await period.getTodayNReservationCount(req.user,'1') || 0,
      'waitingCount' : await period.getWaitingCount(req.user) || 0,
    }
  };
  if(data.period.todaySendCount > 0){
    if(parseInt(data.period.successNfailCount.success) > 0 )
      data.period.successP = Math.round((parseInt(data.period.successNfailCount.success) / data.period.todaySendCount) * 100);
    if(parseInt(data.period.successNfailCount.fail) > 0 )
      data.period.failP = Math.round((parseInt(data.period.successNfailCount.fail) / data.period.todaySendCount) * 100);
  }
  res.render('index',data);
});

// 메일 발송 후 메일 내용 확인 페이지
router.get('/preview',async function(req, res, next) {
  console.log('req.query:',req.query);
  console.log(!('keyword' in req.query) && !('idx' in req.query));
  if(!('keyword' in req.query) && !('idx' in req.query)){
    res.render('preview',{layout: false,veiw: '',pastView: [{keyword:''}],pastCount: 0,msg: '주소에 조건이 없습니다.\n주소를 다시 작성해주세요.',currentPage: 1,keyword: '',idx: ''});
    return false;
  }
  if(!('page' in req.query)){
    req.query.page = 1;
  }
  var viewCode = await content.selectView({keyword:req.query.keyword,idx:req.query.idx});
  var sideHtmlStart = '<table width="750" align="center" cellpadding="0" cellspacing="0" style="border: solid 1px #cacaca; padding: 20px;"><tbody><tr><td><table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="642"><img src="http://showbox.email/templates/images/logo/show_logo.png" width="135" height="36" alt="로고"></td><td width="92">NEWS No.';
  sideHtmlStart+= ((viewCode.length == 0) ? '' : viewCode[0].M_seq_number)+'</td></tr></tbody></table><table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td>';
  var sideHtmlEnd = '</td></tr></tbody></table></td></tr></tbody></table>';
  var pastParam = {keyword:req.query.keyword,page:req.query.page};
  var pastNews = await content.selectView(pastParam);
  var pastNewsCount = await content.selectViewCount(pastParam);
  var data = {
    layout: false,
    veiw:(viewCode.length == 0) ? '' : sideHtmlStart+viewCode[0].m_body+sideHtmlEnd,
    pastView:pastNews,
    pastCount: (pastNewsCount.length == 0) ? '':pastNewsCount[0].total,
    msg: '',
    currentPage: 1,
    keyword:req.query.keyword,
    idx:req.query.idx
  };
  if(viewCode.length == 0){
    data.msg = '해당 메일이 없습니다.';
  }
  if('page' in req.query){
    data.currentPage = req.query.page;
  }
  res.render('preview',data);
});

// 메일 발송 후 메일 내용 확인 페이지
var preview_data = {};
router.post('/preview_mail',async function(req, res, next) {
  console.log('/preview_mail:',req.body);
  var sideHtmlStart = '<table width="750" align="center" cellpadding="0" cellspacing="0" style="border: solid 1px #cacaca; padding: 20px;"><tbody><tr><td><table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="642"><img src="http://showbox.email/templates/images/logo/show_logo.png" width="135" height="36" alt="로고"></td><td width="92">NEWS No.';
  sideHtmlStart+= req.body.num+'</td></tr></tbody></table><table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td>';
  var sideHtmlEnd = '</td></tr></tbody></table></td></tr></tbody></table>';
  var pastNews = [];
  var pastNewsCount = [];
  if(req.body.M_keyword != ''){
    var pastParam = {keyword:req.body.M_keyword,page:1};
    pastNews = await content.selectView(pastParam);
    pastNewsCount = await content.selectViewCount(pastParam);
  }
  preview_data = {
    layout: false,
    veiw:sideHtmlStart+req.body.M_body+sideHtmlEnd,
    pastView:pastNews,
    pastCount: (pastNewsCount.length == 0) ? '':pastNewsCount[0].total,
    msg: '',
    currentPage: 1,
    keyword:req.body.M_keyword
  };
  res.send(true);
});
router.get('/preview_mail',async function(req, res, next) {
  res.render('preview_mail',preview_data);
});

// 대시보드 최근 발송 현황 그래프
router.post('/7DayGraph',isAuthenticated, async function(req, res, next) {
  var data = await period.get7DayGraph(req.user);
  res.send(data);
});

// 로그인 & 로그아웃 구현
router.get('/login', function(req, res, next) {
  res.render('login', {layout: false, message : req.flash('loginMessage')[0]});
});

router.post('/login', function (req, res, next) {
  //  패스포트 모듈로 인증 시도
  passport.authenticate('local', function (err, user, info) {
    if (err) { return next(err); }
    if (!user) {
      if(req.get('referer').indexOf('/email') != -1){
        return res.send(false);
      }
      return res.redirect('/login');
    }
    req.logIn(user, function(err) {
      if (err) { return next(err); }
      if(req.get('referer').indexOf('/email') != -1){
        return res.send(true);
      }
      return res.redirect('/');
    });
  })(req, res, next);

});

router.get('/logout', function (req, res){
  req.logout();
  res.redirect('/');
});

passport.use(new LocalStrategy({
  usernameField: 'username',
  passwordField: 'password',
  passReqToCallback: true
},
async function(req, username, password, done) {
  try{
    var result = await user.checkId([username]);
    if (result.length == 0) {
      return done(null, false, req.flash('loginMessage', '아이디가 존재하지 않습니다.'));
    }
    if (result[0].user_pw !== password) {
      return done(null, false, req.flash('loginMessage', '비밀번호가 맞지 않습니다.'));
    }
    return done(null, result[0]);
  }
  catch(err){
    return done(err);
  }
}));

passport.serializeUser(function (user, done) {
  done(null, user);
});

passport.deserializeUser(function (user, done) {
  // 페이지 이동 시마다 세션 로그인 값 호출
  done(null, user);
});

module.exports = router;
