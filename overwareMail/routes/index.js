var express = require('express');
var passport = require('passport');
var bcrypt = require('bcrypt-nodejs');
var LocalStrategy = require('passport-local').Strategy;
var router = express.Router();

// DB module
var period = require('../models/period.js');
var user = require('../models/user.js');

var isAuthenticated = function (req, res, next) {
  if (req.isAuthenticated())
    return next();
  res.redirect('/login');
};

router.get('/', isAuthenticated, async function(req, res, next) {
  var data = {
    list:await period.getYesterday([req.user.user_idx]),
    period:await period.getTodayPeriod([req.user.user_idx])
  };
  res.render('index',data);
});

router.post('/7DayGraph',isAuthenticated, async function(req, res, next) {
  var data = await period.get7DayGraph([req.user.user_idx]);
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
},async function(req, username, password, done) {
  try{
    var result = await user.checkId([username]);
    if (result.length == 0) {
      return done(null, false, req.flash('loginMessage', '아이디가 존재하지 않습니다.'));
    }
    if (result[0].user_PW !== password) {
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
