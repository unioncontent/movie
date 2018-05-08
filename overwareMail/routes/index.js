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

router.get('/preview',async function(req, res, next) {
  console.log('req.query:',req.query);
  if(!('page' in req.query)){
    req.query.page = 1;
  }
  var viewCode = await content.selectView({keyword:req.query.keyword,idx:req.query.idx});
  var pastParam = {keyword:req.query.keyword,page:req.query.page};
  var pastNews = await content.selectView(pastParam);
  var pastNewsCount = await content.selectViewCount(pastParam);
  var data = {
    layout: false,
    veiw:(viewCode.length == 0) ? '' : viewCode[0].m_body,
    pastView:pastNews,
    pastCount: (pastNewsCount.length == 0) ? '':pastNewsCount[0].total,
    msg: '',
    currentPage: 1
  };
  if(viewCode.length == 0){
    data.msg = '해당 메일이 없습니다.';
  }
  if('page' in req.query){
    data.currentPage = req.query.page;
  }
  console.log(data);
  res.render('preview',data);
});

router.post('/7DayGraph',isAuthenticated, async function(req, res, next) {
  var data = await period.get7DayGraph(req.user);
  if(data.length == 0){
    res.status(500).send('다시 시도해주세요.');
  }
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

router.get('/logout', function (req, res){
  req.logout();
  res.redirect('/');
});

module.exports = router;
