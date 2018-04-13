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
  var data = [];
  try{
    data = await period.getYesterday();
  }
  catch(err){
    console.log(err);
  }
  res.render('index',{
    list:data
  });
});

router.post('/7DayGraph',isAuthenticated,  async function(req, res, next) {
  try{
    var data = await period.get7DayGraph();
    res.send(data);
  }
  catch(err){
    res.status(500).send('다시 시도해주세요.');
  }
});


// 로그인 & 로그아웃 구현
router.get('/login', function(req, res, next) {
  res.render('login', {layout: false, message : req.flash('loginMessage')});
});

router.post('/login', passport.authenticate('local', {
  successRedirect: '/',
  failureRedirect: '/login',
  failureFlash: true
}));

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
  // console.log('serializeUser:',user);
  done(null, user);
});

passport.deserializeUser(function (user, done) {
  // console.log('deserializeUser:',user);
  done(null, user);
});

router.get('/logout', function (req, res){
  req.logout();
  res.redirect('/');
});

module.exports = router;
