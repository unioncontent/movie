var express = require('express');
var fs = require('fs-extra');
var request = require('request');
var datetime = require('node-datetime');
var urlencode = require('urlencode');
// var Iconv = require('iconv').Iconv;
var router = express.Router();
// DB module
var maillink = require('../models/maillink.js');
var content = require('../models/content.js');
var mailAllA = require('../models/mailAllA.js');
// var mailDetailB = require('../models/mailDetailB.js');
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
    var result = await mailAllA.getEmailData(req.query.idx);
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
  res.render('email',data);
});

// 메일 관리 페이지
router.get('/manage',isAuthenticated, async function(req, res) {
  var data = await getListPageData(req.user.n_idx,req.query);
  data.klist = await keyword.selectMovieKwdAll(req.user.user_admin,req.user.n_idx) || [];
  res.render('manage',data);
});

router.get('/manageHis',isAuthenticated, async function(req, res) {
  var data = await getListPageData(req.user.n_idx,req.query);
  data.klist = await keyword.selectMovieKwdAll(req.user.user_admin,req.user.n_idx) || [];
  res.render('manage_his',data);
});

router.post('/manage/updateMtype',isAuthenticated, async function(req, res) {
  console.log('/manage/updateMtype',req.body);
  // var result = await maillink.deleteMlAMSG(req.body.idx);
  // if(!('protocol41' in result)){
  //   res.status(500).send('ml_automail_message delete query 실패');
  //   return false;
  // }
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
  result = await mailAllA.updateMtype([req.body.type,req.body.idx]);
  if(!('protocol41' in result)){
    res.status(500).send('mailAllA delete query 실패');
    return false;
  }
  // if(req.body.type == '0'){
  //   result = await mailDetailB.resetMSend([req.body.idx]);
  //   if(!('protocol41' in result)){
  //     res.status(500).send('mailDetailB delete query 실패');
  //     return false;
  //   }
  // }
  res.send({status:true});
});

router.post('/manage/delete',isAuthenticated, async function(req, res) {
  var result = await mailAllA.delete(req.body.idx);
  if(!('protocol41' in result)){
    res.status(500).send('mailAllA delete query 실패');
    return false;
  }
  // result = await mailDetailB.delete(req.body.idx);
  // if(!('protocol41' in result)){
  //   res.status(500).send('mailDetailB delete query 실패');
  //   return false;
  // }
  // result = await maillink.deleteMlAMSG(req.body.idx);
  // if(!('protocol41' in result)){
  //   res.status(500).send('ml_automail_message delete query 실패');
  //   return false;
  // }
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

router.post('/manage/getNextPage',isAuthenticated,async function(req, res, next) {
  try{
    var data = await getListPageData(req.user.n_idx,req.body);
    res.send({status:true,result:data});
  } catch(e){
    res.status(500).send(e);
  }
});

async function getListPageData(idx,param){
  console.log('getListPageData:',param);
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
  var searchParam = [idx,idx,0,limit];
  var currentPage = 1;
  var searchBody = {sDate:start,eDate:end};
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
    console.log(e);
  }
  return data;
}

router.post('/getModalListPage',isAuthenticated, async function(req, res) {
  console.log('getModalListPage');
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
  console.log(req.body);
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
  // req.user = {
  //   n_idx: 1,
  //   user_admin: null
  // };
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
  var param = [req.body.M_keyword,req.body.M_invitation,req.body.M_template,req.user.n_idx];
  var result = await mailAllA.selectPastMailBody(param);
  if(result == ''){
    res.status(500).send('불러오기 실패');
    return false;
  }

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
  console.log('asyncFileRemove');
  await asyncForEach(fileArr, async (item, index, array) => {
    var removePath = ___dirname.replace('\\routes','') +"/public/uploads/files/"+dateF+"/"+item;
    fs.removeSync(removePath.replace(/ /gi, ""));
    console.log('remove file:',removePath.replace(/ /gi, ""));
    console.log(getFiles(removePath));
    console.log('--------------------');
  });
}

// 메일 링크 로직
router.post('/send2',isAuthenticated, async function(req, res) {
  // 메일 보내기
  var result = await maillinkInsert({idx:req.body.idx,user:req.user});
  if(result){
    res.status(500).send('메일 발송에 실패했습니다.');
    return false;
  }
  // 메일 결과
  setTimeout(async () =>{
    console.log('메일 send result');
    var result = await maillink.selectResult([req.body.idx]);
    if(result){
      // await mailDetailB.updateSendDateResult(req.body.idx);
      res.send({status:true});
    }
    else{
      res.status(500).send('메일 발송에 실패했습니다.');
    }
  },5000);
});

// 메일 작성 중 테스트 발송
router.post('/test',isAuthenticated, async function(req, res) {
  try{
    var mailAllParam = {
      M_email:req.body['M_email'],
      M_seq_number:req.body['M_seq_number'],
      M_invitation:req.body['M_invitation'],
      M_body: req.body['M_body'],
      M_subject: req.body['M_subject'],
      M_keyword: req.body['M_keyword']
    };
    var resultInsert = await maillink.insert2('ml_mail_test',mailAllParam);
    var idx = resultInsert.insertId;
    if(idx == undefined){
      throw new Error('ml_mail_test insert 실패');
    }
    var mailSender = await mailListA.getOneEmail2(req.body.M_sender);
    var sender = (mailSender.length > 0) ? mailSender[0]: [];

    var dt = datetime.create();
    var now = dt.format('Y-m-d H:M:S');
    var values = ['AU-4126512','1','U','[테스트 발송]  '+mailAllParam.M_subject,sender[0],sender[1],'테스트 메일 수신자',
    mailAllParam.M_email,'http://showbox.email/preview_test?keyword='+mailAllParam.M_keyword+'&idx='+idx,now,now,idx];
    var result = await maillink.insertTest(values);
    if(!('insertId' in result)){
      throw new Error('maillink insert 실패');
    }
  }
  catch(e){
    console.log(e);
    res.status(500).send('메일 저장에 실패했습니다. 다시 시도해주세요.');
    return false;
  }
  res.send({status:true});
});

// 메일 작성 완료 로직
router.post('/save',isAuthenticated, async function(req, res) {
  console.log('mail save req.body: ',req.body);
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
      // await mailDetailB.delete(mailAllParam['n_idx']);
    }
  }
  // 메일발송 리스트 insert

  var resultInsert = await mailAllA.insert(mailAllParam);
  m_idx_a = resultInsert.insertId;
  var m_body_his= await settingMailBody(mailAllParam.M_body,mailAllParam.M_keyword,mailAllParam.M_template,m_idx_a,mailAllParam.M_seq_number,mailAllParam.M_invitation),
  resultInsert = await mailAllA.updateMailBodyHis([m_body_his,m_idx_a]);
  console.log(resultInsert);
  // 메일발송 리스트 table에 inser되었는지 체크문
  var insertCheck = false;
  // 메일발송 상세정보 insert
  if(m_idx_a){
    if('M_senddate' in mailAllParam){
      try{
        var result = await maillinkInsert({idx:m_idx_a,time:mailAllParam.M_senddate,user:req.user});
        // console.log(result);
        if(result){
          throw new Error('maillink insert 실패');
        }
      }
      catch(e){
        console.log(e);
        insertCheck = true;
        // await maillink.deleteMlAMSG(m_idx_a);
        await maillink.deleteMlAT(m_idx_a);
        var resultTName = await maillink.selectMailTableName();
        await asyncForEach(resultTName, async (item, index, array) => {
          await maillink.deleteMlABackUp(item.TABLE_NAME,m_idx_a);
        });
      }
    }
    /* 추가 */
    // var recipiArr = JSON.parse('['+mailAllParam.M_recipi+']');
    // var recipiNgroup = recipiArr.concat(groups2allIdx);
    // await asyncForEach(recipiNgroup, async (item, index, array) => {
    //   if(insertCheck == false){
    //     var recipiInfo = await mailListA.getOneInfo(item);
    //     if(recipiInfo.length != 0){
    //       var mailDetailParam = {
    //         M_idx_A : m_idx_a,
    //         E_mail : recipiInfo[0].M_email,
    //         P_title : recipiInfo[0].M_ptitle,
    //         P_name : recipiInfo[0].M_name,
    //         M_result : '9'
    //       };
    //       try{
    //         if(typeof req.body.end_reserve_time !='undefined'){
    //           mailDetailParam['M_send'] = req.body.end_reserve_time;
    //         }
    //         var resultInsert = await mailDetailB.insert(mailDetailParam);
    //       }
    //       catch(e){
    //         if(typeof req.body.end_reserve_time !='undefined'){
    //           // await maillink.deleteMlAMSG(m_idx_a);
    //           await maillink.deleteMlAT(m_idx_a);
    //           var resultTName = await maillink.selectMailTableName();
    //           await asyncForEach(resultTName, async (item, index, array) => {
    //             await maillink.deleteMlABackUp(item.TABLE_NAME,m_idx_a);
    //           });
    //         }
    //         // await mailAllA.delete(m_idx_a);
    //         insertCheck = true;
    //       }
    //     }
    //   }
    // });
  }
  else{
    insertCheck = true;
  }

  // 메일 발송(insert Error시)
  if(insertCheck){
    res.status(500).send('메일 저장에 실패했습니다. 다시 시도해주세요.');
    return false;
  }

  res.send({status:true});
});

// 메일 다시보내기 로직
router.post('/resend',isAuthenticated, async function(req, res) {
  var result = await maillinkInsert({idx:req.body.idx,type:'resend',user:req.user});
  if(result){
    res.status(500).send('메일 발송에 실패했습니다.');
    return false;
  }
  // 메일 결과
  setTimeout(async () =>{
    console.log('메일 send result');
    result = await maillink.selectResult([req.body.idx]);
    if(result){
      // await mailDetailB.updateSendDateResult(req.body.idx);
      res.send({status:true});
    }
    else{
      res.status(500).send('메일 발송에 실패했습니다.');
    }
  },5000);
});

// 메일 나라 로직
// router.post('/send',isAuthenticated, async function(req, res) {
//   console.log('mail send req.body: ',req.body);
//   // 보낼 메일 data 가져오기
//   var result = await mailAllA.getEmailData(req.body.idx);
//   if(result.length == 0){
//     res.status(500).send('메일 정보 없음');
//   }
//   var mailData = result[0];
//
//   var euckr2utf8 = new Iconv('EUC-KR', 'UTF-8//translit//ignore');
//   var utf82euckr1 = new Iconv('UTF-8', 'EUC-KR//translit//ignore');
//   var utf82euckr2 = new Iconv('UTF-8', 'EUC-KR//translit//ignore');
//
//   var bodyBuf = new Buffer(await settingMailBody(mailData.M_body,mailData.M_keyword,mailData.n_idx,mailData.M_seq_number));
//   var subjectBuf = new Buffer(mailData.M_subject);
//
//   var subjectConvert = utf82euckr1.convert(subjectBuf.toString('utf-8'));
//   var bodyConvert = utf82euckr2.convert(bodyBuf.toString('utf-8'));
//
//   // 메일 보내는 사람 가져오기
//   var mailSender = await mailListA.getOneEmail(mailData.M_sender);
//   var sender = (mailSender.length > 0) ? mailSender[0]: [];
//   // 메일 받는 사람 가져오기
//   console.log('mailData.M_recipi:',mailData.M_recipi);
//   console.log('mailData.M_group:',mailData.M_group);
//   var recipiArr = mailData.M_recipi.split(',');
//   var mailRecipi = await mailListA.getOneEmail(recipiArr);
//   var recipi = (mailRecipi.length > 0) ? mailRecipi: [];
//   // 메일 받는 그룹 가져오기
//   var groups = [];
//   if(mailData.M_group != null){
//     var groupArr = mailData.M_group.split(',');
//     var mailGroup = await mailListC.getOneEmail(groupArr);
//     groups = mailGroup;
//   }
//
//   var recipients = recipi.concat(groups);
//
//   var param = {
//     'subject': urlencode(new Buffer(subjectConvert).toString('base64')),//.toString('base64')
//     'body': urlencode(new Buffer(bodyConvert).toString('base64')),
//     'sender': urlencode(sender),
//     'recipients': urlencode(recipients.join(',')),
//     'username': urlencode('unionc'),
//     'key': urlencode('w4EzdnbOY3oypxO'),
//     'mail_type': (mailData.M_type == '1') ? urlencode('ONETIME'):urlencode('NORMAL'),
//     'time' : (mailData.M_send == null || mailData.M_send == '') ? '' : urlencode(mailData.M_send),
//     'unique_id':mailData.n_idx
//   };
//
//   var paramStr = 'subject='+param['subject']+'&body='+param['body']+'&sender='+param['sender']+'&username='+param['username']+'&recipients='+param['recipients']+'&key='+param['key'];
//   // returnURL이 있는 경우
//   paramStr += '&return_url='+urlencode('http://showbox.email/email/send/result');
//   paramStr += '&unique_id='+urlencode(parseInt(param['unique_id']));
//   if(param['mail_type'] == urlencode('ONETIME')){
//     paramStr +='&mail_type='+param['mail_type']+'&start_reserve_time='+param['time']+'&end_reserve_time='+param['time'];
//   }
//   // if('file_url' in param && 'file_name' in param){
//   //   if(param['file_url'] != "" && param['file_name'] != ""){
//   //     paramStr += '&file_url='+param['file_url']+'&file_name='+param['file_name'];
//   //   }
//   // }
//   var resultEmail = await emailSendFun(paramStr);
//   console.log('이메일 발송 파라미터 : ',paramStr);
//   console.log('이메일 발송 dic : ',param);
//   console.log('이메일 발송 결과 : ',resultEmail);
//   await mailDetailB.updateSendDateResult(param['unique_id']);
//   if(resultEmail[0]){
//     res.send({status:true});
//   }
//   else{
//     res.status(500).send(resultEmail[2]);
//   }
//   // 메일 발송후 결과 update
//   var mailApiRsult = resultEmail[resultEmail.length-1];
//   if(typeof mailApiRsult == 'object'){
//     await mailAllA.updateId([mailApiRsult.id,param['unique_id']]);
//   }
//   var errorMsg = '';
//   if(resultEmail[1] != 250){
//     var sendCount = await period.selectSendCount(param['unique_id'])
//     await mailAllA.updateResult2([sendCount,param['unique_id']]);
//     errorMsg = resultEmail[2];
//   }
//   await mailDetailB.updateResult([resultEmail[1],errorMsg,param['unique_id']]);
// });

// router.post('/send/result',async function(req, res) {
//   console.log('POST /send/result값 : ',req.body);
//   await mailAllA.updateResult([req.body.Success,req.body.Failed,req.body.ID]);
//
//   // 파일 삭제
//   // var result = await mailAllA.selectfile([req.body.ID]);
//   // console.log(result)
//   // if(result.length > 0){
//   //   if(result[0].M_file != null){
//   //     var removeFileArr = result[0].M_file.split("|");
//   //     console.log('before file list');
//   //     console.log(getFiles('/home/hosting_users/unioncmail/apps/unioncmail_unioncmail/public/uploads/files/'+result[0].dateFile));
//   //     console.log('--------------------');
//   //     asyncFileRemove(result[0].dateFile,removeFileArr);
//   //   }
//   // }
//
//   await asyncForEach(req.body.Recipients, async (item, index, array) => {
//     var result = await mailDetailB.updateResult2([item.SmtpCode,item.SmtpMsg,req.body.ID],item.Email);
//     console.log('updateResult2:',result);
//   });
//   var result = await mailDetailB.selectCounResult(req.body.ID);
//   console.log('selectCounResult:',result);
//   if(result.length > 0){
//     if(parseInt(result[0].s) != parseInt(req.body.Success) || parseInt(result[0].f) != parseInt(req.body.Failed)){
//       await mailAllA.updateResult([result[0].s,result[0].f,req.body.ID]);
//     }
//   }
//   res.send('true');
// });

async function settingMailBody(bodyHtml,keyword,template,idx,num,ivt){
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
      var url = 'http://showbox.email/preview?keyword='+pastView[i].keyword_idx+'&idx='+pastView[i].n_idx;
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

async function maillinkInsert(req){
  console.log('maillinkInsert');
  var dt = datetime.create();
  var now = dt.format('Y-m-d H:M:S');
  // 보낼 메일 data 가져오기
  var result = await mailAllA.getEmailData(req.idx);
  if(result.length == 0){
    return true;
  }
  var mailData = result[0];

  if('type' in req){
    if(req.type == 'resend'){
      // 0. 재발송 하기전 데이터 삭제
      // await maillink.deleteMlAMSG(mailData.n_idx);
      await maillink.deleteMlAT(mailData.n_idx);
      var resultTName = await maillink.selectMailTableName();
      await asyncForEach(resultTName, async (item, index, array) => {
        await maillink.deleteMlABackUp(item.TABLE_NAME,mailData.n_idx);
      });
    }
  }

  // 'body': await settingMailBody(mailData.M_body,mailData.M_keyword,mailData.n_idx,mailData.M_seq_number),
  // var queryParams = {
  //   'MSGID':mailData.n_idx,
  //   'CONTENT':await settingMailBody(mailData.M_body,mailData.M_keyword,mailData.n_idx,mailData.M_seq_number),
  //   'STATUS':'1',
  //   'GENDATE':now
  // };
  // await maillink.insert('ML_AUTOMAIL_MESSAGE',queryParams);
  // 2. 메일 send insert
  // 메일 보내는 사람 가져오기
  var mailSender = await mailListA.getOneEmail2(mailData.M_sender);
  var sender = (mailSender.length > 0) ? mailSender[0]: [];
  // 메일 받는 사람 가져오기
  console.log('mailSender:',mailSender);
  var recipiArr = mailData.M_recipi.split(',');
  var recipients = [];
  // 메일 받는 그룹 가져오기
  var groups = [];
  console.log('check:',mailData.M_group != null);
  if(mailData.M_group != null){
    if(mailData.M_group.indexOf(',') != -1){
      mailData.M_group = mailData.M_group.split(',');
    }
    console.log(req.user);
    var groupArr = await mailListC.getOneEmail2(req.user.n_idx,mailData.M_group);
    // console.log('groupArr:',groupArr);
    var groupArr2 = groupArr.concat(recipiArr);
    // console.log('groupArr2:',groupArr2);
    var uniqArray = Array.from(new Set(groupArr2));
    // console.log('uniqArray:',uniqArray);
    recipients = await mailListA.getOneEmail2(uniqArray);
  }
  else{
    recipients = await mailListA.getOneEmail2(recipiArr);
  }
  // console.log('recipient = ',recipients.length);
  var moment = require('moment');
  var am = 1;
  var time = (('time' in req) ? req.time : now);
  var sendDate = time;
  await mailAllA.updateSendDate([sendDate,mailData.n_idx]);
  var values = [].map.call(recipients,async function(item,index) {
    // console.log('index = ',index+1);
    // if( index > 1 && ( index % 2 ) == 0 ){
    if( index > 1 && ( index % 1000 ) == 0 ){
      sendDate = moment(time).add(am, 'minutes').format("YYYY-MM-DD HH:mm:ss");
      am += 1;
      // console.log(sendDate);
    }
    return ['AU-4126512','1','U',mailData.M_subject,sender[0],sender[1],item[0],
    item[1],'http://showbox.email/preview?type=html&keyword='+mailData.M_keyword+'&idx='+mailData.n_idx,sendDate,(('time' in req) ? req.time : now),mailData.n_idx];
  });

  await maillink.insert(values);
  await maillink.updateURL();

  // await asyncForEach(recipients, async (item, index, array) => {
  //   var param = {
  //     'AUTOMAILID':'AU-4126512',
  //     'CHANNEL':'1',
  //     'MSGGENTYPE':'U',
  //     'EMSUBJECT':mailData.M_subject,
  //     'EMFROMNAME':sender[0],
  //     'EMFROMADDRESS':sender[1],
  //     'EMTONAME':item[0],
  //     'EMTOADDRESS':item[1],
  //     'EMMSGURL':'http://showbox.email/preview?type=html&keyword='+mailData.M_keyword+'&idx='+mailData.n_idx,
  //     'SENDTIME':('time' in req) ? req.time : now,
  //     'GENDATE':now,
  //     'ETC1':mailData.n_idx
  //   };
  //   console.log(index+'번');
  //   await maillink.insert('ml_automail_tran',param);
  // });
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

function emailSendFun(pStr){
  /*m_mail_detail_B table에 저장될 M_result 값 종류
  0 : 정상발송 => 0 : 메일발송에 성공하였습니다.
  9 : 미발송
  103 : 보내는 사람 이메일이 유효하지 않음 => 3 : 보내는 사람 이메일이 유효하지 않습니다.
  104 : 받는 사람 이메일이 유효하지 않음 => 4 : 받는 사람 이메일이 유효하지 않습니다.
  105 : 본문에 포함되면 안되는 확장자가 있음(.exe or 문자열) => 5 : 본문에 포함되면 안되는 확장자가 있습니다.
  113 : 첨부파일이 다운로드 되지 않을 경우(파일 경로가 없음) => 13 : 첨부파일의 경로나 파일이 없습니다.
  ----------------------------
  이외 에외들의 값은 9
  에러 메시지 : 메일발송에 문제가 생겼습니다. 다시 시도해주세요.
  100 : Post Validation 실패(파라미터 없음)
  101 : 회원정보가 일치하지 않음
  102 : 제목 내용 없음
  106 : body Validation 실패(euc-kr 에서 utf8로 변환하는 과정에서 에러)
  107 : 받는 사람이 없음
  109 : return_url이 없음
  110 : 첨부파일이 없음(정상적인 url이 아닌경우)
  111 : 첨부파일 개수가 5개를 초과
  112 : 첨부파일 Size가 5MB를 초과
  205 : 잔액 부족
  */
  var options = {
    url: 'https://directsend.co.kr/index.php/api/result_v2/mail',
    method:'POST',
    headers: {'Content-Type': 'application/x-www-form-urlencoded;'},
    body: pStr
  };
  return new Promise((resolve, reject) => {
    request(options, (error, response, body) => {
      var resultArr = null;
      console.log(JSON.parse(body));
      var returnBody = JSON.parse(body);
      var requestResult = returnBody.status;
      if(requestResult == '0'){
        resultArr = [true,250,requestResult];
      }
      else if(requestResult == '103'){
        resultArr = [false,3,'보내는 사람 이메일이 유효하지 않습니다.'];
      }
      else if(requestResult == '104'){
        resultArr = [false,4,'받는 사람 이메일이 유효하지 않습니다.'];
      }
      else if(requestResult == '105'){
        resultArr = [false,5,'본문에 포함되면 안되는 확장자가 있습니다.'];
      }
      else if(requestResult == '113'){
        resultArr = [false,13,'첨부파일의 경로나 파일이 없습니다.'];
      }
      else{
        resultArr = [false,1,'메일발송에 문제가 생겼습니다. 다시 시도해주세요.'];
      }
      resultArr.push(returnBody);
      return resolve(resultArr);
    });
  });
}

var multer = require('multer');

async function mkdirsFun (directory) {
  try {
    await fs.ensureDir(directory)
    return directory;
    console.log('success!')
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
  console.log('/send/img:',req.file.path);
  if (!req.file) {
    console.log("No file passed");
    return res.status(500).send("No file passed");
  }
  console.log('filelist:',getFiles(req.file.destination));
  console.log(req.file);

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
  console.log('/send/file:',req.file);
  if (!req.file) {
    console.log("No file passed");
    return res.status(500).send("No file passed");
  }
  if(req.file.originalname.indexOf('.exe') != -1){
    console.log('exe Error:',req.file.path);
    fs.removeSync(req.file.path);
    return res.status(500).send("exe는 업로드 불가합니다.");
  }
  var result = req.file.destination.replace('public/uploads/files/','')+'/'+req.file.filename.split('.')[0];
  res.send({location:'http://showbox.email/period/download/'+result});
});

module.exports = router;

// 첨부파일 upload 및 path get(사용안하고 있음)
// var storageFiles = multer.diskStorage({
//   destination: async function (req, file, cb) {
//     var date = datetime.create();
//     var today = date.format('Ymd');
//     var path = await mkdirsFun('public/uploads/files/'+today);
//     await cb(null, path);
//   },
//   filename: function (req, file, cb) {
//     var fileNameArr = file.originalname.split('.');
//     cb(null, new Buffer(fileNameArr[0],'ascii').toString('hex')+"."+fileNameArr[fileNameArr.length-1])
//   }
// });
// var uploadFiles = multer({ storage: storageFiles });
// router.post('/send/files',uploadFiles.single('files[]'),function(req, res) {
//   console.log('/send/files:',req.file);
//   if (!req.file) {
//     console.log("No file passed");
//     return res.status(500).send("No file passed");
//   }
//   if(req.file.originalname.indexOf('.exe') != -1){
//     console.log('exe Error:',req.file.path);
//     fs.removeSync(req.file.path);
//     return res.status(500).send("exe는 업로드 불가합니다.");
//   }
//   var data = [req.file.filename,req.file.destination.replace('public/uploads/files/','')+'/'+req.file.originalname];
//   res.send({result:data});
// });
//
// router.get('/test', async function(req, res) {
//   res.locals.user ={
//     user_id: 'test'
//   };
//   var n_idx = 25;
//   var user_admin = null;
//   var searchParam = [n_idx,0,10];
//   if(user_admin != null){
//     searchParam[0] = user_admin;
//   }
//   var data = {
//     keywordList : await keyword.selectMovieKwd(user_admin,searchParam[0]),
//     typeList : await mailType.selectTable(user_admin,searchParam[0]),
//     mailList : await mailListA.selectView({},searchParam),
//     mailListCount : await mailListA.selectViewCount({},searchParam),
//     mailListPageNum : 1,
//     groupList : await mailListC.selectView({},searchParam),
//     groupListCount : await mailListC.selectViewCount({},searchParam),
//     groupListPageNum : 1,
//     type: '',
//     mailData: [],
//     mailSender:[],
//     // mailRecipi:[],
//     // mailGroup:[]
//   };
//   if('type' in req.query){
//     data.type = req.query.type;
//     var result = await mailAllA.getEmailData(req.query.idx);
//     if(result.length > 0){f
//       data.mailData = result[0];
//       data.mailSender = await mailListA.getOneInfo(data.mailData.M_sender);
//       data.mailSender = (data.mailSender.length > 0) ? data.mailSender[0]: [];
//       // data.mailRecipi = await mailListA.getOneInfo(data.mailData.M_recipi);
//       // data.mailRecipi = (data.mailRecipi.length > 0) ? data.mailRecipi[0]: [];
//       // data.mailGroup = await mailListC.getOneData(data.mailData.M_group);
//       // data.mailGroup = (data.mailGroup.length > 0) ? data.mailGroup[0]: [];
//     }
//   }
//   res.render('email_input',data);
// });
