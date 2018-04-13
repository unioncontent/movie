var express = require('express');
var router = express.Router();
// DB module
var user = require('../models/user.js');
var mailListA = require('../models/mailListA.js');
var mailListC = require('../models/mailListC.js');


var isAuthenticated = function (req, res, next) {
  if (req.isAuthenticated())
    return next();
  res.redirect('/login');
};

router.get('/',isAuthenticated,async function(req, res) {
  var data = await getListPageData(req.query);
  res.render('list',data);
});

async function getListPageData(param){
  var data = {
    mailList:[],
    mailListCount:{total:0}
  };
  var limit = 20;
  var searchParam = ['1',0,limit];
  var currentPage = 1;
  var searchBody = {
    'order': 'n_idx'
  };
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

router.post('/update',isAuthenticated,async function(req, res) {
  try{
    var updateMail = await mailListA.update(req.body);
    res.send('메일 업데이트 되었습니다.');
  }
  catch(e){
    res.send('다시 시도해주세요.');
  }
});

router.post('/delete',isAuthenticated,async function(req, res) {
  try{
    var deleteMail = await mailListA.deleteFun(req.body);
    res.send('메일 삭제 되었습니다.');
  }
  catch(e){
    res.send('다시 시도해주세요.');
  }
});

router.post('/addGroup',isAuthenticated,async function(req, res) {
  try{
    var list = JSON.parse(req.body.list);
    await asyncForEach(list, async (item, index, array) => {
      console.log(item);
      var param = {
        M_id:'1',
        M_group_title:item.title,
        M_idx_a:item.idx,
        M_email:item.email
      };
      try{
        var result = await mailListC.titleEmailCheck([param.M_group_title,param.M_id,param.M_email]);
        if(result.length == 0){
          await mailListC.insert(param);
        }
      }
      catch(err){
        console.log(err);
      }
    });
    res.send('그룹등록 되었습니다.');
  }
  catch(e){
    res.send('다시 시도해주세요.');
  }
});

router.post('/groupTitleCheck',isAuthenticated,async function(req,res){
  try{
    var titleCheck = await mailListC.titleCheck([req.body.title.replace( /(\s*)/g, ""),'1']);
    res.send((titleCheck.length == 0)?'success':'fail');
  }
  catch(e){
    console.log('err:',e);
    res.send('fail');
  }
});

router.post('/getNextPage',isAuthenticated,async function(req, res, next) {
  // if (!req.user) {
  //   return res.redirect('/login');
  // }
  var data = await getListPageData(req.body);
  res.send(data);
});

async function asyncForEach(array, callback) {
  for (var index = 0; index < array.length; index++) {
   var done = await callback(array[index], index, array);
    if(done == false){
     break;
    }
  }
}

router.get('/group',isAuthenticated,async function(req, res) {
  var data = await getGroupListPageData(req.query,'list');
  res.render('listGroup',data);
});

router.post('/group/delete',isAuthenticated,async function(req, res) {
  try{
    // 로그인계정
    req.body['M_id'] = '1';
    var deleteMail = await mailListC.deleteFun(req.body);
    res.send('그룹에서 삭제되었습니다.');
  }
  catch(e){
    res.send('다시 시도해주세요.');
  }
});

router.post('/getNextGroupModalPage',isAuthenticated,async function(req, res, next) {
  // if (!req.user) {
  //   return res.redirect('/login');
  // }
  var data = await getGroupListPageData(req.body,'group');
  res.send(data);
});

router.post('/getNextGroupPage',isAuthenticated,async function(req, res, next) {
  // if (!req.user) {
  //   return res.redirect('/login');
  // }
  var data = await getGroupListPageData(req.body,'list');
  res.send(data);
});

async function getGroupListPageData(param,type){
  var data = {
    groupList:[],
    groupListCount:{total:0}
  };
  var limit = 20;
  if(type == 'group'){
    limit = 6;
  }
  var searchParam = ['1',0,limit];
  var currentPage = 1;
  var searchBody = {
    'order': 'M_regdate'
  };
  if (typeof param.page !== 'undefined') {
    currentPage = param.page;
  }
  if (parseInt(currentPage) > 0) {
    searchParam[1] = (currentPage - 1) * limit
    data['offset'] = searchParam[1];
  }
  if (typeof param.search !== 'undefined') {
    searchBody['search'] = param.search;
  }
  try{
    if(type == 'list'){
      data['groupList'] = await mailListC.selectView(searchBody,searchParam);
      data['groupListCount'] = await mailListC.selectViewCount(searchBody,searchParam);
      data['currentPage'] = currentPage;
    }
    else{
      searchBody['group'] = param.group;
      searchParam = [searchParam[0],param.group,searchParam[1],searchParam[2]];
      data['groupList'] = await mailListC.selectView2(searchBody,searchParam);
      data['groupListCount'] = await mailListC.selectViewCount2(searchBody,searchParam);
      data['currentPage'] = currentPage;
    }
  }
  catch(e){
    console.log('e');
  }
  return data;
}

router.get('/add',isAuthenticated,function(req, res) {
  res.render('listAdd');
});

router.post('/add',isAuthenticated,async function(req, res) {
  try{
    req.body.M_id = '1';
    var insertMail = await mailListA.insert("m_mail_list_all",req.body);
    // console.log('insertMail:',insertMail);
    var mail = await mailListA.getViewOneInfo(insertMail.insertId);
    // console.log('mail:',mail);
    if(mail.length == 0){
      res.status(500).send('다시 시도해주세요.');
      return false;
    }
    var reporterCheck = await user.reporterCheck([mail.M_email,mail.M_name,mail.M_ptitle]);
    if(reporterCheck.length == 0){
      var dateFormat = require('dateformat');
      var now = dateFormat(new Date(), "yyyy-mm-dd h:MM:ss");
      var reporterParam = {
        reporter_media_name:mail[0].M_ptitle,
        reporter_name:mail[0].M_name,
        reporter_email:mail[0].M_email,
        reporter_phoneNum:mail[0].M_tel,
        createDate:now,
        updateDate:now
      };
      // console.log('reporterParam:',reporterParam);
      if(mail[0].M_reporter == '0'){
        reporterParam['reporter_memo']=mail[0].user_id;
      }
      else if(mail[0].M_reporter == '1'){
        var reporterID = await user.getNextReporterID();
        reporterParam['reporter_ID']='P'+reporterID;
      }

      await mailListA.insert("reporter_data",reporterParam);
    }
    res.send('메일등록 되었습니다.');
  }
  catch(e){
    console.log(e);
    res.status(500).send('다시 시도해주세요.');
  }

});

router.post('/add/search',isAuthenticated,async function(req,res){
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

router.post('/add/emailCheck',isAuthenticated,async function(req,res){
  // 로그인 계정 연결하기!!!
  var emailParam = [req.body.email,'1'];
  if('name' in req.body){
    emailParam = [req.body.email,req.body.name,'1'];
  }

  try{
    var emailCheck = await mailListA.emailCheck(emailParam);
    var result = (emailCheck.length == 0) ? 'success':'fail';
    if(emailParam.length == 3){
      result = (emailCheck.length == 0) ? {msg:'fail'} : {msg:'success',idx:emailCheck[0].n_idx};
    }
    res.send(result);
  }
  catch(e){
    console.log('err:',e);
    res.send({msg:'fail'});
  }
});

module.exports = router;
