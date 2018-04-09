var express = require('express');
// DB module
var user = require('../models/user.js');
var mailListA = require('../models/mailListA.js');

var router = express.Router();

router.get('/',async function(req, res) {
  var data = await getListPageData(req.query);
  res.render('list',data);
});
router.post('/getNextPage',async function(req, res, next) {
  // if (!req.user) {
  //   return res.redirect('/login');
  // }
  var data = await getListPageData(req.body);
  res.send(data);
});
async function getListPageData(param){
  var data = {
    mailList:[],
    mailListCount:{total:0}
  };
  var limit = 20;
  var searchParam = ['1',0,limit];
  var currentPage = 1;
  var searchBody = {};
  if (typeof param.page !== 'undefined') {
    currentPage = param.page;
  }
  if (parseInt(currentPage) > 0) {
    searchParam[1] = (currentPage - 1) * limit
    data['offset'] = searchParam[1];
  }
  if (typeof param.searchType !== 'undefined' && typeof param.search !== 'undefined') {
    searchBody['searchType'] = param.searchType;
    searchBody['search'] = param.search;
  }
  try{
    data['mailList'] = await mailListA.selectView(searchBody,searchParam);
    data['mailListCount'] = await mailListA.selectViewCount(searchBody,searchParam);
    data['currentPage'] = currentPage;
  }
  catch(e){
    console.log('e');
  }
  return data;
}

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
