const logger = require('../winston/config_f.js');
﻿var express = require('express');
var fs = require('fs-extra');
var request = require('request');
var datetime = require('node-datetime');
var urlencode = require('urlencode');
var router = express.Router();
// DB module
var maillink = require('../models/maillink.js');
var mymailer = require('../models/mymailer.js');
var content = require('../models/content.js');
var mailAllA = require('../models/mailAllA.js');
var mailListA = require('../models/mailListA.js');
var mailListC = require('../models/mailListC.js');
var keyword = require('../models/keyword.js');
var mailType = require('../models/mailType.js');
var period = require('../models/period.js');

var isAuthenticated = function (req, res, next) {
  var url = req.originalUrl;
  if (req.isAuthenticated()){
    return next();
  }

  else if(req.method == "GET" && ( url.indexOf('searchAll') != -1 || url.indexOf('searchGroup') != -1)){
    req.query.session=false;
    return next();
  }
  else if(req.method == "POST"){
    return res.send({status:'sessionTimeOut'});
  }
  res.redirect('/login');
};

// 메일 작성 페이지
router.get('/',isAuthenticated, async function(req, res) {
  var searchParam = [req.user.n_idx,0,10];
  if(req.user.user_admin != null){
    searchParam[0] = req.user.user_admin;
  }
  var data = {
    keywordList : await keyword.selectMovieKwd(req.user.user_admin,searchParam[0]),
    typeList : await mailType.selectTable(req.user.user_admin,searchParam[0]),
    mailList : await mailListA.selectView({},searchParam),
    mailListCount : await mailListA.selectViewCount({},searchParam),
    mailListPageNum : 1,
    groupList : await mailListC.selectView({},searchParam),
    groupListCount : await mailListC.selectViewCount({},searchParam),
    groupListPageNum : 1,
    type: '',
    mailData: [],
    mailSender:[],
    mailRecipi:[],
    mailGroup:[]
  };
  if('type' in req.query){
    data.type = req.query.type;
    var result = await mailAllA.selectEmailOneView(req.query.idx);
    if(result.length > 0){
      data.mailData = result[0];
      data.mailSender = await mailListA.getOneInfo(data.mailData.M_sender);
      data.mailSender = (data.mailSender.length > 0) ? data.mailSender[0]: [];
      data.mailRecipi = await mailListA.getOneEmail3(data.mailData.M_recipi.split(','));
      data.mailRecipi = (data.mailRecipi.length > 0) ? data.mailRecipi: [];
      if(data.mailData.M_group != null){
        data.mailGroup = await mailListC.getOneEmail3(data.mailData.M_group.split(','));
        data.mailGroup = (data.mailGroup.length > 0) ? data.mailGroup: [];
      }
    }
  }

  var ejsName = 'email';
  if('m' in req.query){
    ejsName += '2';
  }
  res.render(ejsName,data);
});

// 메일 관리 페이지
router.get('/manage',isAuthenticated, async function(req, res) {
  var data = await getListPageData(req.user,req.query);
  data.klist = await keyword.selectMovieKwdAll(req.user.user_admin,req.user.n_idx) || [];
  res.render('manage',data);
});

router.get('/manageHis',isAuthenticated, async function(req, res) {
  var data = await getListPageData(req.user,req.query);
  data.klist = await keyword.selectMovieKwdAll(req.user.user_admin,req.user.n_idx) || [];
  res.render('manage_his',data);
});
router.post('/manage/checkMail',isAuthenticated, async function(req, res) {
  var data = {status:'true'};
  var result = await mymailer.selectSendCheckMail(req.body.mid);
  if(result.length == 0){
    data.status = 112;
  }
  res.send(data);
});
router.post('/manage/updateMtype',isAuthenticated, async function(req, res) {
  logger.info('/manage/updateMtype : ',req.body);
  var result,check;
  if(req.body.module == '1'){
    result = await maillink.deleteMlAT(req.body.idx);
    if(!('protocol41' in result)){
      res.status(500).send('ml_automail_tran delete query 실패');
      return false;
    }
    var resultTName = await maillink.selectMailTableName();
    await asyncForEach(resultTName, async (item, index, array) => {
      var result2 = await maillink.deleteMlABackUp(item.TABLE_NAME,req.body.idx);
      if(!('protocol41' in result2)){
        res.status(500).send('ml_automail_tran backup delete query 실패');
        return false;
      }
    });
    check = true;
  }
  else if(req.body.module == '2'){
    if(req.body.mid == ''){
      logger.info('- updateMtype id 없어서 가져옴 -');
      req.body.mid = await mymailer.selectMailId(req.body.idx);
    }
    result = await mymailer.selectSendCheckMail(req.body.mid);
    if(result.length != 0){
      result = await mymailer.deleteSendTable(req.body.mid);
      if(!('protocol41' in result)){
        res.status(500).send('deleteSendTable delete query 실패');
        return false;
      }
      result = await mymailer.deleteInfoTable(req.body.mid);
      if(!('protocol41' in result)){
        res.status(500).send('deleteInfoTable delete query 실패');
        return false;
      }
      result = await mymailer.deleteBackupTable(req.body.mid);
      if(!('protocol41' in result)){
        res.status(500).send('ml_automail_tran delete query 실패');
        return false;
      }
    }
    check = true;
  }

  if(check){
    result = await mailAllA.updateMtype([req.body.type,req.body.idx]);
    if(!('protocol41' in result)){
      res.status(500).send('mailAllA delete query 실패');
      return false;
    }
  }
  res.send({status:true});
});

router.post('/manage/delete',isAuthenticated, async function(req, res) {
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
  result = await mailAllA.delete(req.body.idx);
  if(!('protocol41' in result)){
    res.status(500).send('mailAllA delete query 실패');
    return false;
  }
  res.send({status:true});
});

router.post('/manage/getNextPage',isAuthenticated,async function(req, res, next) {
  try{
    var data = await getListPageData(req.user,req.body);
    res.send({status:true,result:data});
  } catch(e){
    res.status(500).send(e);
  }
});

async function getListPageData(user,param){
  logger.info('getListPageData:',param);
  var dt = datetime.create();
  var end = dt.format('Y-m-d');
  dt.offsetInDays(-7);
  var start = dt.format('Y-m-d');

  var data = {
    list:[],
    listCount:{total:0},
    page: 1,
    keyword: '',
    ivt:'',
    sDate:start,
    eDate:end
  };
  var limit = 20;
  var searchParam = [user.n_idx,user.n_idx,0,limit];
  var currentPage = 1;
  var searchBody = {sDate:start,eDate:end};
  if (user.user_admin != null && user.user_keyword != null){
    searchBody.user_keyword = user.user_keyword;
  }
  if (typeof param.page !== 'undefined') {
    currentPage = param.page;
    data['page'] = currentPage;
  }
  if (parseInt(currentPage) > 0) {
    searchParam[2] = (currentPage - 1) * limit
    data['offset'] = searchParam[2];
  }
  if (typeof param.sDate !== 'undefined') {
    if (typeof param.eDate !== 'undefined') {
      searchBody['sDate'] = param.sDate;
      searchBody['eDate'] = param.eDate;
      data['sDate'] = param.sDate;
      data['eDate'] = param.eDate;
    }
  }
  if (typeof param.keyword !== 'undefined') {
    searchBody['keyword'] = param.keyword;
    data['keyword'] = param.keyword;
  }
  if (typeof param.ivt !== 'undefined') {
    searchBody['ivt'] = param.ivt;
    data['ivt'] = param.ivt;
  }
  if (typeof param.searchType !== 'undefined' && typeof param.search !== 'undefined') {
    searchBody['searchType'] = param.searchType;
    searchBody['search'] = param.search;
  }
  try{
    data['list'] = await mailAllA.selectEmailView(searchBody,searchParam);
    data['listCount'] = await mailAllA.selectEmailViewCount(searchBody,searchParam);
    data['currentPage'] = currentPage;
  }
  catch(e){
    logger.error(e);
  }
  return data;
}

// 메일 주소록 페이징
router.post('/getModalListPage',isAuthenticated, async function(req, res) {
  logger.info('getModalListPage');
  var data = {
    group : [],
    groupTotal : [],
    groupPage : 1,
    email : [],
    emialTotal : [],
    emailPage : 1
  };
  var emailParam = [req.user.n_idx,0,10];
  var groupParam = [req.user.n_idx,0,10];
  if(req.user.user_admin != null){
    emailParam[0] = req.user.user_admin;
    groupParam[0] = req.user.user_admin;
  }
  if (typeof req.body.page === 'undefined' && typeof req.body.type === 'undefined') {
    req.body.type = '';
  }
  logger.info(req.body);
  if(req.body.type == 'group'){
    groupParam[1] = parseInt(req.body.page);
    data.groupPage = Math.ceil(parseInt(req.body.page) / 10)+1;
    data['group'] = await mailListC.selectView(req.body,groupParam);
    data['groupTotal'] = await mailListC.selectViewCount(req.body,groupParam);
  }
  else if(req.body.type == 'mail'){
    emailParam[1] = parseInt(req.body.page);
    data.emailPage = Math.ceil(parseInt(req.body.page) / 10)+1;
    data['email'] = await mailListA.selectView(req.body,emailParam);
    data['emailTotal'] = await mailListA.selectViewCount(req.body,emailParam);
  }
  else{
    data['group'] = await mailListC.selectView(req.body,groupParam);
    data['groupTotal'] = await mailListC.selectViewCount(req.body,groupParam);
    data['email'] = await mailListA.selectView(req.body,emailParam);
    data['emailTotal'] = await mailListA.selectViewCount(req.body,emailParam);
  }
  res.send({status:true,result:data});
});

// 메일 그룹 주소록 검색
router.get('/searchGroup',isAuthenticated, async function(req, res) {
  if(req.query.session == false){
    return res.send({status:false});
  }
  var param = [req.user.n_idx,0,10];
  if(req.user.user_admin != null){
    param[0] = req.user.user_admin;
  }
  if (typeof req.query.page !== 'undefined') {
    param[1] = (req.query.page - 1) * param[2];
  }
  req.query.as = ' as id ';
  var data = {
    items : await mailListC.selectView(req.query,param),
    total_count :  await mailListC.selectViewCount(req.query,param)
  };
  res.send({status:true,result:data});
});
router.post('/searchAll',isAuthenticated, async function(req, res) {
  var param = [req.user.n_idx,0,10];
  if(req.user.user_admin != null){
    param[0] = req.user.user_admin;
  }
  if (typeof req.body.page !== 'undefined') {
    param[1] = (req.body.page - 1) * param[2];
  }
  req.body.as = ' as id ';
  var data = {
    items : await mailListA.selectView(req.body,param),
    total_count :  await mailListA.selectViewCount(req.body,param)
  };
  res.send({status:true,result:data});
});
router.get('/searchAll',isAuthenticated, async function(req, res) {
  if(req.query.session == false){
    return res.send({status:false});
  }
  var param = [req.user.n_idx,0,10];
  if(req.user.user_admin != null){
    param[0] = req.user.user_admin;
  }
  if (typeof req.query.page !== 'undefined') {
    param[1] = (req.query.page - 1) * param[2];
  }
  req.query.as = ' as id ';
  var data = {
    items : await mailListA.selectView(req.query,param),
    total_count :  await mailListA.selectViewCount(req.query,param)
  };
  res.send({status:true,result:data});
});

// 메일 내용 불러오기
router.post('/getEmailContent',isAuthenticated, async function(req, res) {
  var result = await mailAllA.selectEmailOneView([req.body.idx]);
  if(result.length == 0){
    res.status(500).send('불러오기 실패');
    return false;
  }
  res.send(result[0].M_body);
});

// 메일 리스트 불러오기
router.post('/getEmailContentList',isAuthenticated, async function(req, res) {
  var result = {
    list:[],
    listCount:0,
    currentPage: 1
  };
  var limit = 10;
  var userAdminId = (req.user.user_admin == null)?req.user.n_idx:req.user.user_admin;
  var userId = req.user.n_idx;
  var searchParam = [
    req.body.M_keyword,
    req.body.M_invitation,
    req.body.M_template,
    userAdminId,
    userAdminId,
    userId,
    parseInt(req.body.page),
    limit
  ];
  var currentPage = 1;
  if (typeof req.body.page !== 'undefined') {
    currentPage = req.body.page;
    result['currentPage'] = currentPage;
  }
  if (parseInt(currentPage) > 0) {
    searchParam[6] = (currentPage - 1) * limit
    result['offset'] = searchParam[6];
  }
  result['list']=await mailAllA.selectMailList(searchParam);
  result['listCount']=await mailAllA.selectMailListCount(searchParam);
  res.send(result);
});

async function asyncForEach(array, callback) {
  for (var index = 0; index < array.length; index++) {
   var done = await callback(array[index], index, array);
    if(done == false){
     break;
    }
  }
}

async function asyncFileRemove(dateF,fileArr){
  logger.info('asyncFileRemove');
  await asyncForEach(fileArr, async (item, index, array) => {
    var removePath = ___dirname.replace('\\routes','') +"/public/uploads/files/"+dateF+"/"+item;
    fs.removeSync(removePath.replace(/ /gi, ""));
    logger.info('remove file:',removePath.replace(/ /gi, ""));
    logger.info(getFiles(removePath));
    logger.info('--------------------');
  });
}

// 메일 링크 로직
// router.post('/send',isAuthenticated, async function(req, res) {
//   // 메일 보내기
//   var result = await mailInsert({idx:req.body.idx,user:req.user});
//   if(result){
//     res.status(500).send('메일 발송에 실패했습니다.');
//     return false;
//   }
//   // 메일 결과
//   res.send({status:true});
// });

// 메일 다시보내기 로직
router.post('/send',isAuthenticated, async function(req, res) {
  try {
    var iparam = {idx:req.body.idx,user:req.user};
    if('sType' in req.body){
      iparam.type = 'resend';
    }
    var result = await mailInsert(iparam);
    if(result){
      throw new Error('mailInsert Error');
    }
  } catch (e) {
    res.status(500).send('메일 발송에 실패했습니다.');
    await mailAllA.updateMtype(['0',req.body.idx]);
    if(req.body.M_module == '1'){
      await maillink.deleteMlAT(req.body.idx);
      var resultTName = await maillink.selectMailTableName();
      await asyncForEach(resultTName, async (item, index, array) => {
        await maillink.deleteMlABackUp(item.TABLE_NAME,req.body.idx);
      });
    }
    return false;
  }
  // 메일 결과
  res.send({status:true});
});

// 메일 작성 중 테스트 발송
router.post('/test',isAuthenticated, async function(req, res) {
  try{
    logger.info('/test req :',{M_email:req.body['M_email'],M_template:req.body['M_template'],M_seq_number:req.body['M_seq_number'],M_invitation:req.body['M_invitation'],M_subject: req.body['M_subject'],M_keyword: req.body['M_keyword']});
    var mailAllParam = {
      M_email:req.body['M_email'],
      M_template:req.body['M_template'],
      M_seq_number:req.body['M_seq_number'],
      M_invitation:req.body['M_invitation'],
      M_body: req.body['M_body'],
      M_subject: req.body['M_subject'],
      M_keyword: req.body['M_keyword']
    };
    var mailSender = await mailListA.getOneEmail2(req.body.M_sender);
    var sender = (mailSender.length > 0) ? mailSender[0]: [];

    var dt = datetime.create();
    var now = dt.format('Y-m-d H:M:S');
    if(req.body.M_module == '1'){
      var resultInsert = await maillink.insert2('ml_mail_test',mailAllParam);
      var idx = resultInsert.insertId;
      if(idx == undefined){
        throw new Error('ml_mail_test insert 실패');
      }
      var values = ['AU-4126512','1','U','[테스트 발송]  '+mailAllParam.M_subject,sender[0],sender[1],'테스트 메일 수신자',
      mailAllParam.M_email,'http://showbox.email/preview_test?keyword='+mailAllParam.M_keyword+'&idx='+idx,now,now,idx];
      var result = await maillink.insertTest(values);
      if(!('insertId' in result)){
        throw new Error('maillink insert 실패');
      }
    }
    else if(req.body.M_module == '2'){
      var param_i = {
      user_id:'test',
      title:'[테스트 발송]  '+mailAllParam.M_subject,
      content: await settingMailBody(mailAllParam.M_body,mailAllParam.M_keyword,mailAllParam.M_template,'0',mailAllParam.M_seq_number,mailAllParam.M_invitation),
      sender:sender[1],
      sender_alias:sender[0],
      receiver_alias:'[$name]',
      send_time:now,
      file_name:'',
      file_contents:'',
      wasRead:'O',
      wasSend:'X',
      wasComplete:'X',
      needRetry:'X',
      retryCount:'0',
      regist_date:now,
      linkYN:'Y',
      total_count:'0'
      };
      var result1 = await mymailer.insert('customer_info',param_i);
      if(!('insertId' in result1)){
        throw new Error('mail insert 실패');
      }
      var param_d = {
        id:result1.insertId,
        email:req.body['M_email'],
        first:'테스트 메일 수신자',
        regist_date:now
      };
      var result = await mymailer.insert('customer_data',param_d);
      if(!('insertId' in result)){
        throw new Error('mail insert 실패');
      }
      result = await mymailer.updateSendInfo(['X','X','X',result1.insertId]);
      if(result==[]){
        throw new Error('mail insert 실패');
      }
    }
  }
  catch(e){
    logger.error(e);
    res.status(500).send('메일 저장에 실패했습니다.');
    return false;
  }
  res.send({status:true});
});

// 메일 작성 완료 로직
router.post('/save',isAuthenticated, async function(req, res) {
  logger.info('mail save req.body: ',{M_recipi:req.body['M_recipi'],M_group:req.body['M_group'],M_module:req.body['M_module'],M_seq_number:req.body['M_seq_number'],M_invitation:req.body['M_invitation'],M_template:req.body['M_template'],M_sender: req.body['M_sender'],M_keyword: req.body['M_keyword'],M_type: req.body['M_type'],M_mail_type: req.body['M_mail_type'],M_subject: req.body['M_subject']});
  // 이메일 발송
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

  var dt = datetime.create();
  var now = dt.format('Y-m-d H:M:S');
  // 이메일발송 결과 DB 저장
  var mailAllParam = {
    M_module:req.body['M_module'],
    M_seq_number:req.body['M_seq_number'],
    M_invitation:req.body['M_invitation'],
    M_template:req.body['M_template'],
    M_sender: req.body['M_sender'],
    M_keyword: req.body['M_keyword'],
    M_type: req.body['M_type'],
    M_mail_type: req.body['M_mail_type'],
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
  if(typeof req.body.end_reserve_time !='undefined'){
    mailAllParam['M_senddate'] = req.body['end_reserve_time'];
  }
  var m_idx_a = null;
  if('type' in req.body){
    if(req.body.type == 'edit'){
      mailAllParam['n_idx'] = req.body['idx'];
      mailAllParam['M_id'] = req.body['Mid'];

      await mailAllA.delete(mailAllParam['n_idx']);
    }
  }
  // 메일발송 리스트 insert

  var resultInsert = await mailAllA.insert(mailAllParam);
  m_idx_a = resultInsert.insertId;
  var m_body_his= await settingMailBody(mailAllParam.M_body,mailAllParam.M_keyword,mailAllParam.M_template,m_idx_a,mailAllParam.M_seq_number,mailAllParam.M_invitation),
  resultInsert = await mailAllA.updateMailBodyHis([m_body_his,m_idx_a]);
  // logger.info('resultInsert:',resultInsert);
  // 메일발송 리스트 table에 inser되었는지 체크문
  var insertCheck = false;
  // 메일발송 상세정보 insert
  if(m_idx_a){
    if('M_senddate' in mailAllParam){
      try{
        var mParam = {idx:m_idx_a,time:mailAllParam.M_senddate,user:req.user,origin:req.body.o_module};
        if('type' in req.body){
          mParam.type = req.body.type;
        }
        if('M_a_id' in req.body){
          mParam.M_a_id = req.body.M_a_id;
        }
        var result = await mailInsert(mParam);
        // logger.info(result);
        if(result){
          throw new Error('maillink insert 실패');
        }
      }
      catch(e){
        logger.error('mailInsert ERROR:',e);
        insertCheck = true;
        await mailAllA.updateMtype(['0',m_idx_a]);
        if(mailAllParam.M_module == '1'){
          await maillink.deleteMlAT(m_idx_a);
          var resultTName = await maillink.selectMailTableName();
          await asyncForEach(resultTName, async (item, index, array) => {
            await maillink.deleteMlABackUp(item.TABLE_NAME,m_idx_a);
          });
        }
      }
    }
  }
  else{
    insertCheck = true;
  }

  // 메일 발송(insert Error시)
  if(insertCheck){
    res.status(500).send('메일 저장에 실패했습니다.');
    return false;
  }

  res.send({status:true});
});

async function settingMailBody(bodyHtml,keyword,template,idx,num,ivt){
  // logger.info('settingMailBody('+bodyHtml+','+keyword+','+template+','+idx+','+num+','+ivt+')');
  var sideHtmlStart = '<table width="750" align="center" cellpadding="0" cellspacing="0" style="border: solid 1px #cacaca; padding: 20px;"><tbody><tr><td>';
  if(template == '0'){
    sideHtmlStart += '<table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="642"><img src="http://showbox.email/templates/images/logo/show_logo.png" width="135" height="36" alt="로고"></td><td width="92"><p style="font-size:  12px;">NEWS ';
    if(num != '0' && ivt  == '0'){
      sideHtmlStart+= 'No.'+num;
    }
    else{
      sideHtmlStart+= 'Invitation';
    }
    sideHtmlStart += '</p></td></tr></tbody></table>';
  }
  sideHtmlStart += '<table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td>';
  var sideHtmlEnd = '</td></tr></tbody></table></td></tr></tbody></table>';
  var htmlMsg = '<table width="750" align="center" cellpadding="0" cellspacing="0" style="padding: 20px;"><tbody><tr><td align="center" style="font-size: 15px; font-weight: bold;" class="fix">[ 메일 본문이 깨져 보이면 <a href=\"http://showbox.email/preview?keyword='+keyword+'&idx='+idx+'\" target=\"_blank\" style=\"font-family: 맑은고딕,malgungothic,돋움,dotum;\">여기</a>를 눌러 주세요 ]</td></tr></tbody></table>';
  var resultHtml = htmlMsg+sideHtmlStart+bodyHtml+sideHtmlEnd+htmlMsg;
  // last mail list
  var pastView = [];
  var pastCount = [];
  if(template == '0'){
    var pastParam = {keyword:keyword,page:1,ivt:ivt};
    pastView = await content.selectView(pastParam);
    pastCount = await content.selectViewCount(pastParam);
    pastCount = (pastCount.length == 0) ? '':pastCount[0].total;
    resultHtml += '<table width="750" align="center" cellpadding="0" cellspacing="0" border="0" style="margin-top: 30px;"><tbody><tr><td>[지난 기사보기]<hr><table cellpadding="0" cellspacing="0" border="0" width="100%"><colgroup><col width="80%"><col width="20%"></colgroup><tbody>';
    for(var i=0; i < pastView.length; i++) {
      var url = 'http://showbox.email/preview?keyword='+pastView[i].M_keyword_idx+'&idx='+pastView[i].n_idx;
      resultHtml +='<tr><td style=\"font-size: small;padding:5px 5px 5px 0px;border-bottom:1px dotted #d9d9d9;color:#444;\">['+((ivt == '0')?('No.'+pastView[i].M_seq_number+'차'):'Invitation')+']<a style=\"text-decoration:none; color:black;\" href=\"'+url+'\" target=\"_blank\"> '+pastView[i].M_subject+'</a>';
      resultHtml +='</td><td style=\"font-size: small;padding:5px 0 5px;border-bottom:1px dotted #d9d9d9;color:#444;\">'+pastView[i].M_send+'</td></tr>'
    }
    resultHtml +='<tr><td colspan="2" style="text-align: center; font-size: small;padding:10px 0 5px;">';
    var limit = 5;
    var pages = Math.ceil(pastCount / limit);
    var index=1;
    for(index;index<=pages;index++){
      //http://showbox.email
      if(1 == index){
        resultHtml +='<strong><span class="current">'+index+'</span></strong>';
      } else{
        resultHtml +='<a href=\"http://showbox.email/preview?keyword='+keyword+'&idx='+idx+'&page='+index+'\">'+index+'</a>';
      }
    }
    resultHtml += '</td></tr></tbody></table></td></tr></tbody></table><table cellpadding="0" cellspacing="0" border="0" width="750" align="center" style="margin-top: 30px;"><tbody><tr><td align="center">Copyright ⓒ unioncontents All rights reserved.</td></tr></tbody></table><p>&nbsp;</p>'
  }
  return resultHtml;
}

async function mailInsert(req){
  logger.info('-mailInsert-');
  var dt = datetime.create();
  var now = dt.format('Y-m-d H:M:S');
  // 보내는 메일이 예약된 메일인지 다시 홗인
  // 보낼 메일 data 가져오기
  var result = await mailAllA.selectEmailOneView(req.idx);
  if(result.length == 0) return true;
  var mailData = result[0];

  logger.info('req : ',req);
  // 재발송 하기 전 메일 모듈 데이터 삭제
  if(mailData.M_module == 1 || req.origin == 1){
    await maillink.deleteMlAT(mailData.n_idx);
    var resultTName = await maillink.selectMailTableName();
    await asyncForEach(resultTName, async (item, index, array) => {
      await maillink.deleteMlABackUp(item.TABLE_NAME,mailData.n_idx);
    });
  }

  if('type' in req){
    if(req.type == 'resend' || req.type == 'edit'){
      // 재발송 하기 전 메일 모듈 데이터 삭제
      if(mailData.M_module == 1 || req.origin == 1){
        await maillink.deleteMlAT(mailData.n_idx);
        var resultTName = await maillink.selectMailTableName();
        await asyncForEach(resultTName, async (item, index, array) => {
          await maillink.deleteMlABackUp(item.TABLE_NAME,mailData.n_idx);
        });
      }
      if((mailData.M_module == 2 || req.origin == 2) && ('M_a_id' in req)){
        await mymailer.deleteSendTable(req.M_a_id);
        await mymailer.deleteInfoTable(req.M_a_id);
        await mymailer.deleteBackupTable(req.M_a_id);
      }
    }
  }

  // 메일 보내는 사람 가져오기
  var mailSender = await mailListA.getOneEmail2(mailData.M_sender);
  var sender = (mailSender.length > 0) ? mailSender[0]: [];
  // 메일 받는 사람 가져오기
  logger.info('mailSender:',mailSender);
  var recipiArr = mailData.M_recipi.split(',');
  var recipients = [];
  // 메일 받는 그룹 가져오기
  var groups = [];
  // logger.info('check:',mailData.M_group != null);
  if(mailData.M_group != null){
    if(mailData.M_group.indexOf(',') != -1){
      mailData.M_group = mailData.M_group.split(',');
    }
    var groupArr = await mailListC.getOneEmail2(req.user.n_idx,mailData.M_group);
    var groupArr2 = groupArr.concat(recipiArr);
    var uniqArray = Array.from(new Set(groupArr2));
    // logger.info('groupArr:',groupArr);
    // logger.info('groupArr2:',groupArr2);
    // logger.info('uniqArray:',uniqArray);
    recipients = await mailListA.getOneEmail2(uniqArray);
  }
  else{
    recipients = await mailListA.getOneEmail2(recipiArr);
  }
  // logger.info('recipient = ',recipients);
  // logger.info('recipient.length = ',recipients.length);
  var moment = require('moment');
  var am = 1;
  var time = (('time' in req) ? req.time : now);
  var sendDate = time;
  await mailAllA.updateSendDate([sendDate,mailData.n_idx]);

  if(mailData.M_module == 1){
    var values = [].map.call(recipients,async function(item,index) {
      if( index > 1 && ( index % 1000 ) == 0 ){
        sendDate = moment(time).add(am, 'minutes').format("YYYY-MM-DD HH:mm:ss");
        am += 1;
      }
      return ['AU-4126512','1','U',mailData.M_subject,sender[0],sender[1],item[0],
      item[1],'http://showbox.email/preview?type=html&keyword='+mailData.M_keyword+'&idx='+mailData.n_idx,sendDate,(('time' in req) ? req.time : now),mailData.n_idx];
    });

    await maillink.insert(values);
    await maillink.updateURL();
  }
  else if(mailData.M_module == 2){
    var mailId;
    try {
      sender[1] = (sender[0] != '(주)쇼박스')?sender[1]:'press@showbox.email';
      var param_i = {user_id:'show',title:mailData.M_subject,content:mailData.M_body_his,sender:sender[1],sender_alias:sender[0],receiver_alias:'[$name]',send_time:(('time' in req) ? req.time : now),file_name:'',file_contents:'',wasRead:'O',wasSend:'X',wasComplete:'X',needRetry:'X',retryCount:'0',regist_date:now,linkYN:'Y',total_count:'0'};
      result = await mymailer.insert('customer_info',param_i);
      mailId = result.insertId;
      if(!('insertId' in result)){
        throw new Error('insertMailInfoError');
      }
      result = await mailAllA.updateId([mailId,mailData.n_idx]);
      if(!('insertId' in result)){
        throw new Error('updateResultError');
      }
      if(typeof mailData.M_group == 'object' && mailData.M_group != null){
        mailData.M_group = mailData.M_group.join();
      }
      var values = [].map.call(recipients,async function(item,index) {
        return [mailId,
          mailData.n_idx,
          item[1],
          item[0],
          req.user.n_idx,
          req.user.user_admin,
          mailData.M_keyword,
          mailData.M_seq_number,
          mailData.M_invitation,
          mailData.M_template,
          mailData.M_type,
          sender[2],
          mailData.M_mail_type,
          mailData.M_group,
          mailData.M_recipi,
          item[2],
          now];
        });
        result = await mymailer.insertMailSendUser(values);
        if(result != undefined){
          throw new Error('insertMailSendUserError');
        }
        if(mailData.M_type == '0'){
          result = await mymailer.updateSendInfo(['X','X','X',mailId]);
          if(!('changedRows' in result)){
            throw new Error('updateSendInfoError');
          }
        }
    } catch (e) {
      await mymailer.deleteInfoTable(mailId);
      await mymailer.deleteSendTable(mailId);
      throw new Error('module2');
    }
  }
}

function getFiles (dir, files_){
  var fs = require('fs');
  files_ = files_ || [];
  var files = fs.readdirSync(dir);
  for (var i in files){
      var name = dir + '/' + files[i];
      if (fs.statSync(name).isDirectory()){
        getFiles(name, files_);
      } else {
        files_.push(name);
      }
  }
  return files_;
}

var multer = require('multer');
async function mkdirsFun (directory) {
  try {
    await fs.ensureDir(directory)
    return directory;
    logger.info('success!')
  } catch (err) {
    console.error(err)
  }
}

// 메일 첨부파일 삭제시
router.post('/remove/file',function (req, res) {
  try {
    var date = datetime.create();
    var today = date.format('Ymd');
    var file = ___dirname.replace('\\routes','') +"/public/uploads/files/"+today+"/"+req.body.file;
    var result = fs.removeSync(file.replace(/ /gi, ""));
    return res.send({status:true});
  } catch (err) {
    res.status(500).send(err);
  }
});

// 메일작성시 이미지 upload 및 path get
var storageImage = multer.diskStorage({
  destination: async function (req, file, cb) {
    var date = datetime.create();
    var today = date.format('Ymd');
    var path = await mkdirsFun('public/uploads/image/'+today);
    await cb(null, path); // cb 콜백함수를 통해 전송된 파일 저장 디렉토리 설정
  },
  filename: function (req, file, cb) {
    var date = datetime.create();
    var today = date.format('Ymd');
    var time = date.format('HMS');
    if (fs.existsSync('public/uploads/image/'+today+'/'+file.originalname)) {
      file.originalname = time+'_'+file.originalname;
    }
    cb(null, file.originalname); // cb 콜백함수를 통해 전송된 파일 이름 설정
  }
});
var uploadImage = multer({ storage: storageImage });
router.post('/send/img',uploadImage.single('file'),function(req, res) {
  logger.info('/send/img:',req.file.path);
  if (!req.file) {
    logger.info("No file passed");
    return res.status(500).send("No file passed");
  }
  logger.info('filelist:',getFiles(req.file.destination));
  logger.info(req.file);

  var result = req.file.destination.replace('public/','')+'/'+req.file.originalname;
  res.send({location:'http://showbox.email/'+result});
});

// 첨부파일 upload 및 path get
var storageFile = multer.diskStorage({
  destination: async function (req, file, cb) {
    var date = datetime.create();
    var today = date.format('Ymd');
    var path = await mkdirsFun('public/uploads/files/'+today);
    await cb(null, path);
  },
  filename: function (req, file, cb) {
    // cb(null, new Buffer(file.originalname,'ascii').toString('hex'))
    // var fileNameArr = file.originalname.split('.');
    // cb(null, new Buffer(fileNameArr[0],'ascii').toString('hex')+"."+fileNameArr[fileNameArr.length-1])
    var date = datetime.create();
    var today = date.format('Ymd');
    var time = date.format('HMS');
    if (fs.existsSync('public/uploads/files/'+today+'/'+file.originalname)) {
      file.originalname = time+'_'+file.originalname;
    }
    cb(null, file.originalname)
  }
});
var uploadFile = multer({ storage: storageFile });
router.post('/send/file',uploadFile.single('file'),function(req, res) {
  logger.info('/send/file:',req.file);
  if (!req.file) {
    logger.info("No file passed");
    return res.status(500).send("No file passed");
  }
  if(req.file.originalname.indexOf('.exe') != -1){
    logger.info('exe Error:',req.file.path);
    fs.removeSync(req.file.path);
    return res.status(500).send("exe는 업로드 불가합니다.");
  }
  var result = req.file.destination.replace('public/uploads/files/','')+'/'+req.file.filename.split('.')[0];
  res.send({location:'http://showbox.email/period/download/'+result});
});

module.exports = router;
