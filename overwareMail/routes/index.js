var express = require('express');
var passport = require('passport');
var bcrypt = require('bcrypt-nodejs');
var LocalStrategy = require('passport-local').Strategy;
var router = express.Router();
// DB module
var maillink = require('../models/maillink.js');
var newsclipping = require('../models/newsclipping.js');
var nMailAll = require('../models/nMailAll.js');
var period = require('../models/period.js');
var user = require('../models/user.js');
var mailAllA = require('../models/mailAllA.js');

var isAuthenticated = function (req, res, next) {
  if (req.isAuthenticated())
    return next();
  res.redirect('/login');
};

// 대시보드
router.get('/', isAuthenticated, async function(req, res, next) {
  var data = {
    list:await period.call_dashbord2([-1,req.user.n_idx]),
    list2:await period.call_dashbord([-1,req.user.n_idx]),
    wlist:await period.selectReservationView([2,req.user.n_idx,req.user.n_idx,req.user.n_idx])
  };
  console.log('data:',data);
  res.render('index',data);
});

router.post('/statistics',isAuthenticated, async function(req, res, next) {
  var result = await period.call_dashbord2([0,req.user.n_idx]);
  console.log('statistics1:',result);
  var data = {
    todaySendCount : result[0].sendCount,
    successNfailCount : {success:result[0].success,fail:result[0].fail},
    todayCount : result[0].nCount || 0,
    reservationCount : result[0].wtCount || 0,
    waitingCount : result[0].wCount || 0,
    successP : 0,
    failP : 0
  };
  result = await period.call_dashbord([0,req.user.n_idx]);
  console.log('statistics2:',result);
  data.todaySendCount += result[0].sendCount;
  data.todayCount += result[0].nCount;
  data.successNfailCount.success += result[0].success;
  data.successNfailCount.fail += result[0].fail;
  data.reservationCount += result[0].wtCount;
  data.waitingCount += await period.selectReservationCount([2,req.user.n_idx,req.user.n_idx,req.user.n_idx]);;

  var tNum = parseInt(data.todaySendCount);
  if(tNum > 0){
    var sNum = parseInt(data.successNfailCount.success);
    var fNum = parseInt(data.successNfailCount.fail);
    if(sNum > 0 )
      data.successP = ((sNum / tNum) * 100).toFixed(2);
    if(fNum > 0 )
      data.failP = ((fNum / tNum) * 100).toFixed(2);
  }
  res.send(data);
});

// 대시보드 최근 발송 현황 그래프
router.post('/7DayGraph',isAuthenticated, async function(req, res, next) {
  var data = await period.call_dashbord([-7,req.user.n_idx]);
  var data2 = await period.call_dashbord2([-7,req.user.n_idx]);

  res.send({mymailer : data2, maillink: data});
});

// 뉴스클리핑
router.get('/preview/newsclipping',async function(req, res, next) {
  var data = {layout: false};
  var queryResult = [];
  if('idx' in req.query){
    queryResult = await newsclipping.selectOneMailBodyDate(req.query.idx);
  }
  else{
    queryResult = await newsclipping.selectOneMailBodyDate2(req.query.date);
  }
  if(queryResult.length > 0){
    var lastDic = await nMailAll.selectSendMailDate();
    data.last = lastDic.M_subject;
    data.lastIdx = lastDic.n_idx;
    data.idx = queryResult[0].n_idx;
    data.date = queryResult[0].SENDTIME;
    data.view = queryResult[0].M_body;
    data.status = 'true';
  }
  else{
    data.last = [];
    data.lastIdx = [];
    data.idx = '';
    data.date = '';
    data.view = '';
    data.status = 'false';
  }
  res.render('newsclipping_preview',data);
});

router.get('/preview/newsclipping/html',async function(req, res, next) {
  var data = {layout: false};
  var queryResult = [];
  if('idx' in req.query){
    queryResult = await newsclipping.selectOneMailBodyDate(req.query.idx);
  }
  else{
    queryResult = await newsclipping.selectOneMailBodyDate2(req.query.date);
  }
  if(queryResult.length > 0){
    data.view = queryResult[0].M_body;
  }
  else{
    data.view = '';
  }
  res.render('newsclipping_html',data);
});

// 메일 발송 후 메일 내용 확인 페이지
router.get('/preview',async function(req, res, next) {
  console.log('req.query:',req.query);
  // console.log(!('keyword' in req.query) && !('idx' in req.query));
  var data = {
    layout: false,
    view: '',
    type: '0',
    pastView: [{keyword:''}],
    pastCount: 0,
    msg: '',
    currentPage:'',
    keyword:'',
    idx:req.query.idx
  };
  var pageName = 'preview';
  if('type' in req.query){
    pageName = 'preview_html';
  }
  if(!('page' in req.query)){
    req.query.page = 1;
  }
  if(!('keyword' in req.query) && !('idx' in req.query)){
    data.msg = '주소에 조건이 없습니다.\n주소를 다시 작성해주세요.';
    res.render(pageName,data);
    return false;
  }
  var viewCode = null;
  viewCode = await mailAllA.selectEmailOneView(req.query.idx);

  if('type' in req.query){
    viewCode = await mailAllA.selectEmailHtmlView(req.query.idx);
  }
  else{
    viewCode = await mailAllA.selectEmailOneView(req.query.idx);
  }
  if(viewCode.length == 0){
    data.msg = '해당 메일이 없습니다.';
    res.render(pageName,data);
    return false;
  }

  if(pageName == 'preview'){
    if(!('M_seq_number' in viewCode[0])){
      data.msg = '해당 메일이 없습니다..';
      res.render('preview',data);
      return false;
    }
    var sideHtmlStart = '<table width="750" align="center" cellpadding="0" cellspacing="0" style="border: solid 1px #cacaca; padding: 20px;"><tbody><tr><td>';
    // showbox logo , new number
    console.log(viewCode[0].M_invitation);
    var topObj = settingTophtml(viewCode[0].M_template,viewCode[0].M_seq_number,viewCode[0].M_invitation);
    sideHtmlStart += topObj.html;
    sideHtmlStart += '<table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td>';
    var sideHtmlEnd = '</td></tr></tbody></table></td></tr></tbody></table>';
    // last mail list
    var pastParam = {keyword:req.query.keyword,page:req.query.page,ivt:topObj.ivt};
    var pastVal = await settingPastList(viewCode[0].M_template,pastParam);
    data = {
      layout: false,
      view: (viewCode.length == 0) ? '' : sideHtmlStart+viewCode[0].M_body+sideHtmlEnd,
      type: viewCode[0].M_template,
      pastView: pastVal.pastNews,
      pastCount: (pastVal.pastNewsCount.length == 0) ? '':pastVal.pastNewsCount[0].total,
      msg: '',
      currentPage: 1,
      keyword: req.query.keyword,
      idx: req.query.idx
    };
    if('page' in req.query){
      data.currentPage = req.query.page;
    }
  }
  else{
    data.view = viewCode[0].M_body_his;
  }
  res.render(pageName,data);
});

// 메일 미리보기
var preview_data = {};
router.post('/preview_mail', isAuthenticated ,async function(req, res, next) {
  var sideHtmlStart = '<table width="750" align="center" cellpadding="0" cellspacing="0" style="border: solid 1px #cacaca; padding: 20px;"><tbody><tr><td>';
  // showbox logo , new number
  var topObj = settingTophtml(req.body.M_template,req.body.num,req.body.ivt);
  sideHtmlStart += topObj.html;
  // mail content
  sideHtmlStart += '<table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td>';
  var sideHtmlEnd = '</td></tr></tbody></table></td></tr></tbody></table>';
  // last mail list
  var pastParam = {keyword:req.body.M_keyword,page:1,ivt:topObj.ivt};
  var pastVal = await settingPastList(req.body.M_template,pastParam);

  preview_data = {
    layout: false,
    type: req.body.M_template,
    view:sideHtmlStart+req.body.M_body+sideHtmlEnd,
    pastView:pastVal.pastNews,
    pastCount: (pastVal.pastNewsCount.length == 0) ? '':pastVal.pastNewsCount[0].total,
    msg: '',
    currentPage: 1,
    keyword:req.body.M_keyword
  };
  res.send(true);
});

router.get('/preview_mail', isAuthenticated,async function(req, res, next) {
  res.render('preview_mail',preview_data);
});

// 메일 test
router.get('/preview_test',async function(req, res, next) {
  console.log('req.query:',req.query);
  console.log(!('keyword' in req.query) && !('idx' in req.query));
  if(!('keyword' in req.query) && !('idx' in req.query)){
    res.render('preview',{layout: false,view: '',pastView: [{keyword:''}],pastCount: 0,msg: '주소에 조건이 없습니다.\n주소를 다시 작성해주세요.',currentPage: 1,keyword: '',idx: ''});
    return false;
  }
  if(!('page' in req.query)){
    req.query.page = 1;
  }
  var viewCode = await maillink.selectEmailOneView(req.query.idx);
  var htmlMsg = '<table width="750" align="center" cellpadding="0" cellspacing="0" style="padding: 20px;"><tbody><tr><td align="center" style="font-size: 15px; font-weight: bold;" class="fix">[ 메일 본문이 깨져 보이면 <a href=\"http://showbox.email/preview?keyword='+req.query.keyword+'&idx='+req.query.idx+'\" target=\"_blank\" style=\"font-family: 맑은고딕,malgungothic,돋움,dotum;\">여기</a>를 눌러 주세요 ]</td></tr></tbody></table>';
  var sideHtmlStart = '<table width="750" align="center" cellpadding="0" cellspacing="0" style="border: solid 1px #cacaca; padding: 20px;"><tbody><tr><td>';
  // showbox logo , new number
  var topObj = settingTophtml(viewCode[0].M_template,viewCode[0].M_seq_number,viewCode[0].M_invitation);
  sideHtmlStart += topObj.html;
  sideHtmlStart += '<table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td>';
  var sideHtmlEnd = '</td></tr></tbody></table></td></tr></tbody></table>';
  // last mail list
  var pastParam = {keyword:req.query.keyword,page:req.query.page,ivt:topObj.ivt};
  var pastVal = await settingPastList(viewCode[0].M_template,pastParam);

  var data = {
    layout: false,
    view:(viewCode.length == 0) ? '' : htmlMsg+sideHtmlStart+viewCode[0].M_body+sideHtmlEnd+htmlMsg,
    type: viewCode[0].M_template,
    pastView:pastVal.pastNews,
    pastCount: (pastVal.pastNewsCount.length == 0) ? '':pastVal.pastNewsCount[0].total,
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
      if('n_idx' in user){
        if(user.n_idx == 30){
          return res.redirect('/news');
        }
        else{
          return res.redirect('/');
        }
      }
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

function settingTophtml(M_template,num,ivtVal){
  console.log(M_template,num,ivtVal);
  var Obj = {
    html : '',
    ivt : '0'
  };
  if(M_template == '0'){
    Obj.html = '<table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="642"><img src="http://showbox.email/templates/images/logo/show_logo.png" width="135" height="36" alt="로고"></td><td width="92"><p style="font-size:  12px;">NEWS ';
    if(num != '' && ivtVal == 0){
      Obj.html += 'No.'+num;
    }
    else{
      Obj.html += 'Invitation';
      Obj.ivt = '1';
    }
    Obj.html += '</p></td></tr></tbody></table>';
  }
  return Obj;
}

async function settingPastList(template,pastParam){
  console.log(template,pastParam);
  var Obj = {
    pastNews : [],
    pastNewsCount : []
  };
  if(template == '0'){
    var content = require('../models/content.js');
    Obj.pastNews = await content.selectView(pastParam);
    Obj.pastNewsCount = await content.selectViewCount(pastParam);
  }
  return Obj;
}

module.exports = router;
