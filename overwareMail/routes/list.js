var express = require('express');
// DB module
var user = require('../models/user.js');
var mailListA = require('../models/mailListA.js');

var router = express.Router();

router.get('/', function(req, res) {
  res.render('list');
});

router.get('/group', function(req, res) {
  res.render('listGroup');
});

router.get('/add', function(req, res) {
  res.render('listAdd');
});

router.post('/add',async function(req, res) {
  try{
    req.body.M_id = '1';
    var insertMail = await mailListA.insert(req.body);
    res.send('메일등록 되었습니다.');
  }
  catch(e){
    res.send('다시 시도해주세요.');
  }
});

router.post('/add/search',async function(req,res){
  var userParam = [0,10];
  if (typeof req.body.start !== 'undefined') {
    userParam[0] = parseInt(req.body.start);
  }
  if (typeof req.body.search !== 'undefined') {
    userParam.unshift(req.body.search);
  }
  try{
    var userList = await user.selectReporter(userParam);
    var userListCount = await user.selectReporterCount(userParam);
    res.send({list:userList,count:userListCount[0]});
  }
  catch(e){
    console.log(e);
    res.send({list:[],count:{total:0}});
  }
});

router.post('/add/emailCheck',async function(req,res){
  var emailParam = [req.body.email];
  try{
    var emailCheck = await user.emailCheck(emailParam);
    res.send((emailCheck.length == 0)?'success':'fail');
  }
  catch(e){
    console.log('err:',e);
    res.send('fail');
  }
});

module.exports = router;
