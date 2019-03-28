var express = require('express');
var router = express.Router();
var datetime = require('node-datetime');
// DB module
var newsclipping = require('../models/newsclipping.js');
var marketing = require('../models/marketing.js');
var mailListA = require('../models/mailListA.js');
var mailListC = require('../models/mailListC.js');
var maillink = require('../models/maillink.js');
var mymailer = require('../models/mymailer.js');
var nMailAll = require('../models/nMailAll.js');
var period = require('../models/period.js');

var isAuthenticated = function (req, res, next) {
  if (req.isAuthenticated()){
    if(req.user.n_idx == 30){
      return next();
    }
  }
  res.redirect('/login');
};

router.post('/grouping',isAuthenticated, async function(req, res) {
  logger.info(req.body);
  var result = await newsclipping.updateGroup(req.body);
  if(!('protocol41' in result)){
    res.status(500).send('그룹핑 실패! 개발자에게 문의해주세요.');
    return false;
  }
  res.send({status:true});
});

router.post('/delete',isAuthenticated, async function(req, res) {
  var result = await newsclipping.deleteList(req.body);
  if(!('protocol41' in result)){
    res.status(500).send('newsclipping delete query 실패');
    return false;
  }
  res.send({status:true});
});

router.post('/cancel',isAuthenticated, async function(req, res) {
  var result = await newsclipping.cancelUpdate(req.body);
  if(!('protocol41' in result)){
    res.status(500).send('newsclipping cancel query 실패');
    return false;
  }
  res.send({status:true});
});

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

router.get('/send2',isAuthenticated,async function(req, res) {
  var searchParam = [req.user.user_admin,0,10];
  var data = {
    mailList : await mailListA.selectView({},searchParam),
    mailListCount : await mailListA.selectViewCount({},searchParam),
    mailListPageNum : 1,
    groupList : await mailListC.selectView({},searchParam),
    groupListCount : await mailListC.selectViewCount({},searchParam),
    groupListPageNum : 1
  };
  res.render('newsclipping_email2',data);
});

router.post('/getData',async function(req, res) {
  if(!('user' in req)){
    req.user = {user_admin:'1'};
  }
  var data = {
    issue:await newsclipping.selectIssueTable(req.body),
    news:await newsclipping.selectNewsMailAllTable(req.body, req.user.user_admin),
    marketing:await marketing.selectMarketingMailTable(req.body)
  };
  res.send({status:true,result:data});
});

// // 메일 발송
// router.post('/send',isAuthenticated, async function(req, res) {
//   // 받는 사람, 수신자 그룹 세팅
//   var recipiList = req.body['M_recipi'];
//   var groupList = req.body['M_group'];
//   if('M_recipi[]' in req.body){
//     recipiList = req.body['M_recipi'];
//   }
//   if('M_group[]' in req.body){
//     groupList = req.body['M_group[]'];
//   }
//
//   var mid = req.user.n_idx;
//   if(req.user.user_admin != null){
//     mid = req.user.user_admin;
//   }
//
//   var groupsIdx = [];
//   var groups2allIdx = [];
//   if(typeof groupList != 'undefined'){
//     if(groupList.length != 0){
//       groups2allIdx = await mailListC.getIdx(groupList,mid);
//       groupsIdx = await mailListC.getIdx2(groupList,mid);
//     }
//   }
//   logger.info(req.body);
//   // 메일 info 세팅
//   var mailAllParam = {
//     M_sender: req.body['M_sender'],
//     M_module: req.body['M_module'],
//     M_type: req.body['M_type'],
//     M_body: req.body['M_body'].replace(/(^\s*)|(\s*$)/, ''),
//     M_subject: req.body['M_subject'],
//     M_id: req.user.n_idx
//   };
//
//   // 메일 받는 사람
//   if(typeof recipiList == 'object'){
//     mailAllParam['M_recipi'] = recipiList.join(',');
//   }
//   else if(typeof recipiList == 'string'){
//     mailAllParam['M_recipi'] = recipiList;
//   }
//   if(groups2allIdx != []){
//     if(groupsIdx.length != 0){
//       mailAllParam['M_group'] = groupsIdx.join(',');
//     }
//   }
//   var dt = datetime.create();
//   var now = dt.format('Y-m-d H:M:S');
//   // 발송시각
//   if(typeof req.body.end_reserve_time !='undefined'){
//     mailAllParam['M_senddate'] = req.body['end_reserve_time'];
//   } else{
//     mailAllParam['M_senddate'] = now;
//   }
//   var m_idx_a = null;
//   // update code
//   // await maillink.update([mailAllParam.M_body,'104']);
//   // res.status(500).send(result);
//   // return false;
//   // 메일발송 리스트 insert
//   var resultInsert = await nMailAll.insert(mailAllParam);
//   m_idx_a = resultInsert.insertId;
//
//   // 메일발송 리스트 table에 inser되었는지 체크
//   var insertCheck = false;
//   // 메일발송 상세정보 insert
//   if(m_idx_a){
//     var senderInfo = await mailListA.getOneInfo(mailAllParam.M_sender);
//     var sender = (senderInfo.length > 0) ? senderInfo[0]: [];
//     var recipiArr = JSON.parse('['+mailAllParam.M_recipi+']');
//     var recipiNgroup = recipiArr.concat(groups2allIdx);
//     recipiNgroup = recipiNgroup.slice().sort(function(a,b){return a - b}).reduce(function(a,b){if (a.slice(-1)[0] != b) a.push(b);return a;},[]);
//
//     await asyncForEach(recipiNgroup, async (item, index, array) => {
//       if(insertCheck == false){
//         // 보내는 사람 email 확인
//         var recipiInfo = await mailListA.getOneInfo(item);
//         if(recipiInfo.length != 0){
//           try{
//             var mailDetailParam = {
//               M_idx_A : m_idx_a,
//               E_mail : recipiInfo[0].M_email,
//               P_title : recipiInfo[0].M_ptitle,
//               P_name : recipiInfo[0].M_name
//             };
//             if('end_reserve_time' in req.body){
//               mailDetailParam['M_send'] = req.body.end_reserve_time;
//             }
//             // 메일 보내기
//             var param = {
//               'AUTOMAILID':'AU-4126512',
//               'CHANNEL':'1',
//               'MSGGENTYPE':'U',
//               'EMSUBJECT':mailAllParam.M_subject,
//               'EMFROMNAME':sender.M_name,
//               'EMFROMADDRESS':sender.M_email,
//               'EMTONAME': mailDetailParam.P_name,
//               'EMTOADDRESS':mailDetailParam.E_mail,
//               'EMMSGURL':'http://showbox.email/preview/newsclipping/html?idx='+m_idx_a,
//               'SENDTIME':('end_reserve_time' in req.body) ? mailDetailParam['M_send'] : now,
//               'GENDATE':('end_reserve_time' in req.body) ? mailDetailParam['M_send'] : now,
//               'ETC1':m_idx_a
//             };
//             // logger.info(param);
//             await maillink.insert2('ml_automail_tran',param);
//           }
//           catch(e){
//             await maillink.deleteMlAMSG(m_idx_a);
//             await maillink.deleteMlAT(m_idx_a);
//             var resultTName = await maillink.selectMailTableName();
//             await asyncForEach(resultTName, async (item, index, array) => {
//               await maillink.deleteMlABackUp(item.TABLE_NAME,m_idx_a);
//             });
//             // await nMailAll.delete(m_idx_a);
//             insertCheck = true;
//           }
//         }
//       }
//     });
//   }
//   else{
//     insertCheck = true;
//   }
//
//   if(insertCheck){
//     res.status(500).send('메일 발송에 실패했습니다.');
//     return false;
//   }
//
//   res.send({status:true});
// });

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
  logger.info(req.body);
  // 메일 info 세팅
  var mailAllParam = {
    M_sender: req.body['M_sender'],
    M_module: req.body['M_module'],
    M_type: req.body['M_type'],
    M_body: req.body['M_body'].replace(/(^\s*)|(\s*$)/, ''),
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
  var dt = datetime.create();
  var now = dt.format('Y-m-d H:M:S');
  // 발송시각
  if(typeof req.body.end_reserve_time !='undefined'){
    mailAllParam['M_senddate'] = req.body['end_reserve_time'];
  } else{
    mailAllParam['M_senddate'] = now;
  }
  var m_idx_a = null;
  // 메일발송 리스트 insert
  var resultInsert = await nMailAll.insert(mailAllParam);
  m_idx_a = resultInsert.insertId;

  // 메일발송 리스트 table에 inser되었는지 체크
  var insertCheck = false;
  // 메일발송 상세정보 insert
  if(m_idx_a){
    // 보낸는사람
    var senderInfo = await mailListA.getOneInfo(mailAllParam.M_sender);
    var sender = (senderInfo.length > 0) ? senderInfo[0]: [];
    // 받는사람
    var recipiArr = JSON.parse('['+mailAllParam.M_recipi+']');
    var recipiNgroup = recipiArr.concat(groups2allIdx);
    recipiNgroup = recipiNgroup.slice().sort(function(a,b){return a - b}).reduce(function(a,b){if (a.slice(-1)[0] != b) a.push(b);return a;},[]);
    var recipiList = await mailListA.getOneEmail2(recipiNgroup);

    var moment = require('moment');
    var am = 1;
    var time = ('end_reserve_time' in req.body) ? mailAllParam['M_senddate'] : now;
    var sendDate = time;
    await nMailAll.updateSendDate([sendDate,m_idx_a]);

    if(mailAllParam.M_module == 1){
      var values = [].map.call(recipiList,async function(item,index) {
        if( index > 1 && ( index % 1000 ) == 0 ){
          sendDate = moment(time).add(am, 'minutes').format("YYYY-MM-DD HH:mm:ss");
          am += 1;
        }
        return [
          'AU-4126512',
          '1',
          'U',
          mailAllParam.M_subject,
          sender.M_name,
          sender.M_email,
          item[0],
          item[1],
          'http://showbox.email/preview/newsclipping/html?idx='+m_idx_a,
          sendDate,
          sendDate,
          m_idx_a];
      });

      await maillink.insert(values);
      await maillink.updateURL();
    }
    else if(mailAllParam.M_module == 2){
      var param_i = {
        user_id:'newsc',
        title:mailAllParam.M_subject,
        content:mailAllParam.M_body,
        sender:sender.M_email,
        sender_alias:sender.M_name,
        receiver_alias:'[$name]',send_time:sendDate,
        file_name:'',file_contents:'',
        wasRead:'O',wasSend:'X',wasComplete:'X',needRetry:'X',retryCount:'0',
        regist_date:now,linkYN:'Y',total_count:'0'};
      var result = await mymailer.insert('customer_info',param_i);
      if(!('insertId' in result)){
        throw new Error('insertMailInfoError');
      }
      var mailId = result.insertId;
      result = await nMailAll.updateId([mailId,m_idx_a]);
      if(!('insertId' in result)){
        await mymailer.deleteInfoTable(mailId);
        throw new Error('updateResultError');
      }
      var values = [].map.call(recipiList,async function(item,index) {
        return [mailId,
          m_idx_a,
          item[1],
          item[0],
          req.user.n_idx,
          req.user.user_admin,
          '',
          '',
          '',
          '',
          mailAllParam.M_type,
          sender.M_ptitle,
          '',
          mailAllParam.M_group,
          mailAllParam.M_recipi,
          item[2],
          now];
      });
      result = await mymailer.insertMailSendUser(values);
      logger.info('insert결과:',result);
      if(result != undefined){
        await mymailer.deleteInfoTable(mailId);
        insertCheck = true;
      }
      else{
        if(mailAllParam.M_type == '0'){
          result = await mymailer.updateSendInfo(['X','X','X',mailId]);
          if(!('changedRows' in result)){
            await mymailer.deleteInfoTable(mailId);
            await mymailer.deleteSendTable(mailId);
            insertCheck = true;
          }
        }
      }
    }
  }
  else{
    insertCheck = true;
  }

  if(insertCheck){
    res.status(500).send('메일 발송에 실패했습니다.');
    return false;
  }

  res.send({status:true});
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
  res.render('newsclipping_period',data);
});

router.post('/period/result',isAuthenticated,async function(req, res, next) {
  var data = [];
  logger.info('/period/result : ',req.body);
  if(req.body.module == '1'){
    delete req.body.module;
    data = await newsclipping.call_newsclipping_period_result(Object.values(req.body));
  }
  else if(req.body.module == '2'){
    data = await period.call_mymailer_detail_result([parseInt(req.body.idx),((req.body.type === 'success')?'':'1')]);
  }
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
function formatDate(d) {
  var month = '' + (d.getMonth() + 1),
  day = '' + d.getDate(),
  year = d.getFullYear();
  if (month.length < 2)
    month = '0' + month;
  if (day.length < 2)
    day = '0' + day;
  return [year, month, day].join('-');
}
async function getListPageData(idx,param){
  logger.info('getListPageData:',param);
  var data = {
    list:[],
    listCount:{total:0},
    sDate: formatDate(new Date(Date.now() - 7 * 24 * 3600 * 1000)),
    eDate: formatDate(new Date()),
    module: '2'
  };
  var limit = 10;
  // var searchParam = [idx,idx,0,limit];
  var currentPage = 1;
  var searchBody = {};
  if (typeof param.page !== 'undefined') {
    currentPage = param.page;
  }
  if (typeof param.module !== 'undefined') {
    data['module'] = param.module;
  }
  if (typeof param.sDate !== 'undefined' && typeof param.eDate !== 'undefined') {
    searchBody['sDate'] = param.sDate;
    searchBody['eDate'] = param.eDate;
    data['sDate'] = param.sDate;
    data['eDate'] = param.eDate;
  }else{
    searchBody['sDate'] = data.sDate;
    searchBody['eDate'] = data.eDate;
  }
  var searchParam = [data.sDate,data.eDate,0,limit];
  if (parseInt(currentPage) > 0) {
    searchParam[2] = (currentPage - 1) * limit
    data['offset'] = searchParam[2];
  }
  try{
    var result = result = await newsclipping.call_newsclipping_period(data.module,searchParam);
    data['list'] = (result.length > 0)? result[0]:[];
    data['listCount'] = (result.length > 0)? result[1][0].total:0;
    data['currentPage'] = currentPage;
  }
  catch(e){
    logger.error(e);
  }
  return data;
}

// 지난리스트
router.get('/list',isAuthenticated,async function(req, res) {
  var data = await getListPageData2(req.user.n_idx,req.query);
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

router.post('/list/checkMail',isAuthenticated, async function(req, res) {
  var data = {status:'true'};
  var result = await mymailer.selectSendCheckMail(req.body.mid);
  if(result.length == 0){
    data.status = 112;
  }
  res.send(data);
});

router.post('/list/delete',isAuthenticated, async function(req, res) {
  var result;
  if(req.body.module == '1'){
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
  }
  else if(req.body.module == '2'){
    result = await mymailer.deleteSendTable(req.body.mid);
    if(!('protocol41' in result)){
      res.status(500).send('customer_data delete query 실패');
      return false;
    }
    result = await mymailer.deleteInfoTable(req.body.mid);
    if(!('protocol41' in result)){
      res.status(500).send('customer_info delete query 실패');
      return false;
    }
    result = await mymailer.deleteBackupTable(req.body.mid);
    if(!('protocol41' in result)){
      res.status(500).send('customer_info delete query 실패');
      return false;
    }
  }
  result = await nMailAll.delete(req.body.idx);
  if(!('protocol41' in result)){
    res.status(500).send('nMailAll delete query 실패');
    return false;
  }
  res.send({status:true});
});

async function getListPageData2(idx,param){
  logger.info('getListPageData:',param);
  var data = {
    list:[],
    listCount:{total:0},
    sDate: formatDate(new Date(Date.now() - 7 * 24 * 3600 * 1000)),
    eDate: formatDate(new Date()),
    page: 1
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
  }else{
    searchBody['sDate'] = data.sDate;
    searchBody['eDate'] = data.eDate;
  }
  try{
    data['list'] = await newsclipping.selectListView(searchBody,searchParam);
    data['listCount'] = await newsclipping.selectListViewCount(searchBody,searchParam);
    data['currentPage'] = currentPage;
  }
  catch(e){
    logger.info(e);
  }
  return data;
}

module.exports = router;
