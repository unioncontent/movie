var express = require('express');
var router = express.Router();
var datetime = require('node-datetime');
// DB module
var newsclipping = require('../models/newsclipping.js');
var mailListA = require('../models/mailListA.js');
var mailListC = require('../models/mailListC.js');
var maillink = require('../models/maillink.js');
var nMailAll = require('../models/nMailAll.js');
var nMailDetailB = require('../models/nMailDetailB.js');

var isAuthenticated = function (req, res, next) {
  if (req.isAuthenticated()){
    if(req.user.n_idx == 30){
      return next();
    }
  }
  res.redirect('/login');
};

router.get('/send',isAuthenticated,async function(req, res) {
  var searchParam = [req.user.user_admin,0,10];
  var data = {
    mailList : await mailListA.selectView({},searchParam),
    mailListCount : await mailListA.selectViewCount({},searchParam),
    mailListPageNum : 1,
    groupList : await mailListC.selectView({},searchParam),
    groupListCount : await mailListC.selectViewCount({},searchParam),
    groupListPageNum : 1
  };
  res.render('newsclipping_email',data);
});

router.post('/getData',async function(req, res) {
  if(!('user' in req)){
    req.user = {user_admin:'1'};
  }
  var data = {
    issue:await newsclipping.selectIssueTable(req.body),
    news:await newsclipping.selectNewsMailAllTable(req.body, req.user.user_admin)
  };
  res.send({status:true,result:data});
});

// 메일 발송
router.post('/send',isAuthenticated, async function(req, res) {
  // 받는 사람, 수신자 그룹 세팅
  var recipiList = req.body['M_recipi'];
  var groupList = req.body['M_group'];
  if('M_recipi[]' in req.body){
    recipiList = req.body['M_recipi'];
  }
  if('M_group[]' in req.body){
    groupList = req.body['M_group[]'];
  }

  var mid = req.user.n_idx;
  if(req.user.user_admin != null){
    mid = req.user.user_admin;
  }

  var groupsIdx = [];
  var groups2allIdx = [];
  if(typeof groupList != 'undefined'){
    if(groupList.length != 0){
      groups2allIdx = await mailListC.getIdx(groupList,mid);
      groupsIdx = await mailListC.getIdx2(groupList,mid);
    }
  }

  // 메일 info 세팅
  var mailAllParam = {
    M_sender: req.body['M_sender'],
    M_type: req.body['M_type'],
    M_body: req.body['M_body'],
    M_subject: req.body['M_subject'],
    M_id: req.user.n_idx
  };

  // 메일 받는 사람
  if(typeof recipiList == 'object'){
    mailAllParam['M_recipi'] = recipiList.join(',');
  }
  else if(typeof recipiList == 'string'){
    mailAllParam['M_recipi'] = recipiList;
  }
  if(groups2allIdx != []){
    if(groupsIdx.length != 0){
      mailAllParam['M_group'] = groupsIdx.join(',');
    }
  }

  var m_idx_a = null;
  // 메일발송 리스트 insert
  var resultInsert = await nMailAll.insert(mailAllParam);
  m_idx_a = resultInsert.insertId;
  // 메일발송 리스트 table에 inser되었는지 체크
  var insertCheck = false;
  // 메일발송 상세정보 insert
  if(m_idx_a){
    var dt = datetime.create();
    var now = dt.format('Y-m-d H:M:S');
    var queryParam = {
      'MSGID':m_idx_a,
      'CONTENT':mailAllParam.M_body,
      'STATUS':'1',
      'GENDATE':now
    };
    await maillink.insert('ML_AUTOMAIL_MESSAGE',queryParam);

    var senderInfo = await mailListA.getOneInfo(mailAllParam.M_sender);
    var sender = (senderInfo.length > 0) ? senderInfo[0]: [];
    var recipiArr = JSON.parse('['+mailAllParam.M_recipi+']');
    var recipiNgroup = recipiArr.concat(groups2allIdx);
    await asyncForEach(recipiNgroup, async (item, index, array) => {
      if(insertCheck == false){
        // 보내는 사람 email 확인
        var recipiInfo = await mailListA.getOneInfo(item);
        if(recipiInfo.length != 0){
          var mailDetailParam = {
            M_idx_A : m_idx_a,
            E_mail : recipiInfo[0].M_email,
            P_title : recipiInfo[0].M_ptitle,
            P_name : recipiInfo[0].M_name
          };
          try{
            if('end_reserve_time' in req.body){
              mailDetailParam['M_send'] = req.body.end_reserve_time;
            }
            await nMailDetailB.insert(mailDetailParam);

            // 메일 보내기
            var param = {
              'AUTOMAILID':'AU-4126512',
              'CHANNEL':'1',
              'EMSUBJECT':mailAllParam.M_subject,
              'EMFROMNAME':sender.M_email,
              'EMFROMADDRESS':sender.M_name,
              'EMTONAME': mailDetailParam.P_name,
              'EMTOADDRESS':mailDetailParam.E_mail,
              'SENDTIME':('end_reserve_time' in req.body) ? mailDetailParam['M_send'] : now,
              'GENDATE':now,
              'MSGID':m_idx_a
            };
            console.log(param);
            await maillink.insert('ml_automail_tran',param);

          }
          catch(e){
            await maillink.deleteMlAMSG(m_idx_a);
            await maillink.deleteMlAT(m_idx_a);
            var resultTName = await maillink.selectMailTableName();
            await asyncForEach(resultTName, async (item, index, array) => {
              await maillink.deleteMlABackUp(item.TABLE_NAME,m_idx_a);
            });
            await nMailAll.delete(m_idx_a);
            insertCheck = true;
          }
        }
      }
    });
  }
  else{
    insertCheck = true;
  }

  if(insertCheck){
    res.status(500).send('메일 발송에 실패했습니다.');
    return false;
  }

  // 메일 결과
  setTimeout(async () =>{
    console.log('메일 send result');
    var result = await maillink.selectResult([m_idx_a]);
    if(result){
      res.send({status:true});
    }
    else{
      res.status(500).send('메일 발송에 실패했습니다.');
    }
  },5000);
});

async function asyncForEach(array, callback) {
  for (var index = 0; index < array.length; index++) {
   var done = await callback(array[index], index, array);
    if(done == false){
     break;
    }
  }
}

// 발송현황
router.get('/period',isAuthenticated,async function(req, res) {
  var data = await getListPageData(req.user.n_idx,req.query);
  data.sDate = '';
  data.eDate = '';
  res.render('newsclipping_period',data);
});

router.post('/period/result',isAuthenticated,async function(req, res, next) {
  var data = await newsclipping.selectResultDetail(req.body);
  res.send({status:true,result:data});
});

router.post('/period/getNextPage',isAuthenticated,async function(req, res, next) {
  try{
    var data = await getListPageData(req.user.n_idx,req.body);
    res.send({status:true,result:data});
  } catch(e){
    res.status(500).send(e);
  }
});

async function getListPageData(idx,param){
  console.log('getListPageData:',param);
  var data = {
    list:[],
    listCount:{total:0},
    sDate: '',
    eDate: ''
  };
  var limit = 10;
  var searchParam = [idx,idx,0,limit];
  var currentPage = 1;
  var searchBody = {};
  if (typeof param.page !== 'undefined') {
    currentPage = param.page;
  }
  if (parseInt(currentPage) > 0) {
    searchParam[2] = (currentPage - 1) * limit
    data['offset'] = searchParam[2];
  }
  if (typeof param.sDate !== 'undefined' && typeof param.eDate !== 'undefined') {
    searchBody['sDate'] = param.sDate;
    searchBody['eDate'] = param.eDate;
    data['sDate'] = param.sDate;
    data['eDate'] = param.eDate;
  }
  try{
    data['list'] = await newsclipping.selectView(searchBody,searchParam);
    data['listCount'] = await newsclipping.selectViewCount(searchBody,searchParam);
    data['currentPage'] = currentPage;
  }
  catch(e){
    console.log(e);
  }
  return data;
}

// 지난리스트
router.get('/list',isAuthenticated,async function(req, res) {
  var data = await getListPageData2(req.user.n_idx,req.query);
  data.page = '';
  data.sDate = '';
  data.eDate = '';
  res.render('newsclipping_list',data);
});

router.post('/list/getNextPage',isAuthenticated,async function(req, res, next) {
  try{
    var data = await getListPageData2(req.user.n_idx,req.body);
    res.send({status:true,result:data});
  } catch(e){
    res.status(500).send(e);
  }
});

router.post('/list/delete',isAuthenticated, async function(req, res) {
  var result = await nMailAll.delete(req.body.idx);
  if(!('protocol41' in result)){
    res.status(500).send('nMailAll delete query 실패');
    return false;
  }
  result = await nMailDetailB.delete(req.body.idx);
  if(!('protocol41' in result)){
    res.status(500).send('nMailDetailB delete query 실패');
    return false;
  }
  result = await maillink.deleteMlAMSG(req.body.idx);
  if(!('protocol41' in result)){
    res.status(500).send('ml_automail_message delete query 실패');
    return false;
  }
  result = await maillink.deleteMlAT(req.body.idx);
  if(!('protocol41' in result)){
    res.status(500).send('ml_automail_tran delete query 실패');
    return false;
  }
  result = await maillink.selectMailTableName();
  await asyncForEach(result, async (item, index, array) => {
    var result2 = await maillink.deleteMlABackUp(item.TABLE_NAME,req.body.idx);
    if(!('protocol41' in result2)){
      res.status(500).send('ml_automail_tran backup delete query 실패');
      return false;
    }
  });
  res.send({status:true});
});

async function getListPageData2(idx,param){
  console.log('getListPageData:',param);
  var data = {
    list:[],
    listCount:{total:0},
    sDate: '',
    eDate: ''
  };
  var limit = 10;
  var searchParam = [idx,idx,0,limit];
  var currentPage = 1;
  var searchBody = {};
  if (typeof param.page !== 'undefined') {
    currentPage = param.page;
    data['page'] = currentPage;
  }
  if (parseInt(currentPage) > 0) {
    searchParam[2] = (currentPage - 1) * limit
    data['offset'] = searchParam[2];
  }
  if (typeof param.sDate !== 'undefined' && typeof param.eDate !== 'undefined') {
    searchBody['sDate'] = param.sDate;
    searchBody['eDate'] = param.eDate;
    data['sDate'] = param.sDate;
    data['eDate'] = param.eDate;
  }
  try{
    data['list'] = await newsclipping.selectListView(searchBody,searchParam);
    data['listCount'] = await newsclipping.selectListViewCount(searchBody,searchParam);
    data['currentPage'] = currentPage;
  }
  catch(e){
    console.log(e);
  }
  return data;
}

module.exports = router;
