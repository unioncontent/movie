var express = require('express');
var fs = require('fs-extra');
var request = require('request');
var datetime = require('node-datetime');
var urlencode = require('urlencode');
var Iconv = require('iconv').Iconv;
var router = express.Router();
// DB module
var content = require('../models/content.js');
var mailAllA = require('../models/mailAllA.js');
var mailDetailB = require('../models/mailDetailB.js');
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
    // mailRecipi:[],
    // mailGroup:[]
  };
  if('type' in req.query){
    data.type = req.query.type;
    var result = await mailAllA.getEmailData(req.query.idx);
    if(result.length > 0){
      data.mailData = result[0];
      data.mailSender = await mailListA.getOneInfo(data.mailData.M_sender);
      data.mailSender = (data.mailSender.length > 0) ? data.mailSender[0]: [];
      // data.mailRecipi = await mailListA.getOneInfo(data.mailData.M_recipi);
      // data.mailRecipi = (data.mailRecipi.length > 0) ? data.mailRecipi[0]: [];
      // data.mailGroup = await mailListC.getOneData(data.mailData.M_group);
      // data.mailGroup = (data.mailGroup.length > 0) ? data.mailGroup[0]: [];
    }
  }
  res.render('email',data);
});

router.get('/test', async function(req, res) {
  res.locals.user ={
    user_id: 'test'
  };
  var n_idx = 25;
  var user_admin = null;
  var searchParam = [n_idx,0,10];
  if(user_admin != null){
    searchParam[0] = user_admin;
  }
  var data = {
    keywordList : await keyword.selectMovieKwd(user_admin,searchParam[0]),
    typeList : await mailType.selectTable(user_admin,searchParam[0]),
    mailList : await mailListA.selectView({},searchParam),
    mailListCount : await mailListA.selectViewCount({},searchParam),
    mailListPageNum : 1,
    groupList : await mailListC.selectView({},searchParam),
    groupListCount : await mailListC.selectViewCount({},searchParam),
    groupListPageNum : 1,
    type: '',
    mailData: [],
    mailSender:[],
    // mailRecipi:[],
    // mailGroup:[]
  };
  if('type' in req.query){
    data.type = req.query.type;
    var result = await mailAllA.getEmailData(req.query.idx);
    if(result.length > 0){
      data.mailData = result[0];
      data.mailSender = await mailListA.getOneInfo(data.mailData.M_sender);
      data.mailSender = (data.mailSender.length > 0) ? data.mailSender[0]: [];
      // data.mailRecipi = await mailListA.getOneInfo(data.mailData.M_recipi);
      // data.mailRecipi = (data.mailRecipi.length > 0) ? data.mailRecipi[0]: [];
      // data.mailGroup = await mailListC.getOneData(data.mailData.M_group);
      // data.mailGroup = (data.mailGroup.length > 0) ? data.mailGroup[0]: [];
    }
  }
  res.render('email_input',data);
});

router.get('/manage',isAuthenticated, async function(req, res) {
  var data = await getListPageData(req.user.n_idx,req.query);
  data.klist = await keyword.selectMovieKwdAll(req.user.user_admin,req.user.n_idx) || [];
  data.keyword = '';
  res.render('manage',data);
});

router.post('/manage/updateMtype',isAuthenticated, async function(req, res) {
  console.log('/manage/updateMtype',req.body);
  var result = await mailAllA.updateMtype([req.body.type,req.body.idx]);
  if(!('protocol41' in result)){
    res.status(500).send('mailAllA delete query 실패');
    return false;
  }
  if(req.body.type == '0'){
    result = await mailDetailB.resetMSend([req.body.idx]);
    if(!('protocol41' in result)){
      res.status(500).send('mailDetailB delete query 실패');
      return false;
    }
  }
  res.send({status:true});
});

router.post('/manage/delete',isAuthenticated, async function(req, res) {
  var result = await mailAllA.delete(req.body.idx);
  if(!('protocol41' in result)){
    res.status(500).send('mailAllA delete query 실패');
    return false;
  }
  result = await mailDetailB.delete(req.body.idx);
  if(!('protocol41' in result)){
    res.status(500).send('mailDetailB delete query 실패');
    return false;
  }
  res.send({status:true});
});

router.post('/menage/getNextPage',isAuthenticated,async function(req, res, next) {
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
    page: 1
  };
  var limit = 20;
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
  if (typeof param.keyword !== 'undefined') {
    searchBody['keyword'] = param.keyword;
    data['keyword'] = param.keyword;
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

/* 메일나라 'https://directsend.co.kr/index.php/api/v2/mail' / 'https://directsend.co.kr/index.php/api/result_v2/mail'
 * 필수 파라미터
 * subject  : 받을 mail 제목. "utf-8" => "euc-kr"
 * body  : 받을 mail 본문. "utf-8" => "euc-kr"
 * sender : 발송자 메일주소
 * sender_name : 발송자 이름
 * username : directsend 발급 ID
 * recipients : 발송 할 고객 이메일 , 로 구분함. ex) aaa@naver.com,bbb@nate.com (공백제거해서 입력)
 * key : directsend 발급 api key
 *
 * 메일 발송결과를 받고 싶은 URL
 * return_url : 실제 발송결과를 return 받을 URL
 * unique_id :지정한 고유한 값으로 결과를 받고 싶은 경우 사용
 *
 * 발송결과 측정 항목을 사용할 경우
 * open : 발송측정결과 open값
 * click : 발송측정결과 click값
 * check_period : 트래킹 기간을 지정하며 3 / 7 / 15 / 30 일을 기준으로 지정하여 발송
 * option_return_url : 위의 측정 결과를 받고 싶은 URL을 넣어줍니다. ex) http://domain?type=[click | open | reject]&mail_id=[MailID]&email=[Email]
 *
 * 예약 관련 파라미터 사용할 경우
 * mail_type : 즉시발송 / 예약 발송을 구분합니다. NORMAL - 즉시발송 / ONETIME - 1회예약 / WEEKLY - 매주정기예약 / MONTHLY - 매월정기예약 / YEARLY - 매년정기예약
 * start_reserve_time : 예약시작시간('Y-m-d H:i:s')을 넣어줍니다.
 * end_reserve_time : 예약종료시간('Y-m-d H:i:s')을 넣어줍니다. 1회 예약일경우 start_reserve_time=end_reserve_time
 * remained_count : 예약 기간동안 발송 횟수를 넣어줍니다
 WEEKLY | MONTHLY | YEARLY 일 경우에 시작 시간부터 끝나는 시간까지 발송되는 횟수 Ex) type = WEEKLY, start_reserve_time = '2017-05-17 13:00:00', end_reserve_time = '2017-05-24 13:00:00' 이면 remained_count = 2
 *
 * 필수 안내문구를 추가할 경우
 * agreement_text : 수신동의 문구를 넣어줍니다.
 * deny_text : 수신거부 문구를 넣어줍니다.
 * sender_info_text : 발신자 정보 문구를 넣어줍니다.
 * logo_state : Logo 를 사용할 때 1 / 사용하지 않을 때 0
 * logo_path : 로고 이미지 경로 ( Logo_state 는 1 일 때 path 가 없으면 DirectSend 에
  등록된 이미지 사용)
 *
 * 첨부파일이 있는 경우
 * file_url : 파일을 download 받아 발송처리를 진행합니다. 파일은 개당5MB 이하로 발송을 해야 하며, 파일의 구분자는 '|(shift+\)'로 사용하며 5개까지만 첨부가 가능 ex) 'http://domain/test.png|http://domain/test1.png'
 * file_path : 첨부파일을 보내고 싶을 때 파일의 경로 (접근이 가능 해야합니다.)
 * 순차적(http://domain/test.png - image.png, http://domain/test1.png - image2.png) 와 같이 적용
 *
 * 메일 내용 텍스트로 보내실 경우
 * bodytag = 1
 */

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
    var removePath = "/home/hosting_users/unioncmail/apps/unioncmail_unioncmail/public/uploads/files/"+dateF+"/"+item;
    fs.removeSync(removePath.replace(/ /gi, ""));
    console.log('remove file:',removePath.replace(/ /gi, ""));
    console.log(getFiles(removePath));
    console.log('--------------------');
  });
}

router.post('/send/result',async function(req, res) {
  console.log('POST /send/result값 : ',req.body);
  await mailAllA.updateResult([req.body.Success,req.body.Failed,req.body.ID]);

  // 파일 삭제
  // var result = await mailAllA.selectfile([req.body.ID]);
  // console.log(result)
  // if(result.length > 0){
  //   if(result[0].M_file != null){
  //     var removeFileArr = result[0].M_file.split("|");
  //     console.log('before file list');
  //     console.log(getFiles('/home/hosting_users/unioncmail/apps/unioncmail_unioncmail/public/uploads/files/'+result[0].dateFile));
  //     console.log('--------------------');
  //     asyncFileRemove(result[0].dateFile,removeFileArr);
  //   }
  // }

  await asyncForEach(req.body.Recipients, async (item, index, array) => {
    var result = await mailDetailB.updateResult2([item.SmtpCode,item.SmtpMsg,req.body.ID],item.Email);
    console.log('updateResult2:',result);
  });
  var result = await mailDetailB.selectCounResult(req.body.ID);
  console.log('selectCounResult:',result);
  if(result.length > 0){
    if(parseInt(result[0].s) != parseInt(req.body.Success) || parseInt(result[0].f) != parseInt(req.body.Failed)){
      await mailAllA.updateResult([result[0].s,result[0].f,req.body.ID]);
    }
  }
  res.send('true');
});

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
  console.log('groupsIdx:',groupsIdx.join(','));
  if( 'M_file_d' in req.body ){
    if(req.body['M_file_d'] != ""){
      mailAllParam['M_file'] = req.body['M_file_d'];
      mailAllParam['M_file_name'] = req.body['M_fileName'];
    }
  }
  var m_idx_a = null;
  if('type' in req.body){
    if(req.body.type == 'edit'){
      mailAllParam['n_idx'] = req.body['idx'];
      mailAllParam['M_id'] = req.body['Mid'];

      await mailAllA.delete(mailAllParam['n_idx']);
      await mailDetailB.delete(mailAllParam['n_idx']);
    }
  }
  // 메일발송 리스트 insert
  var resultInsert = await mailAllA.insert(mailAllParam);
  m_idx_a = resultInsert.insertId;
  // 메일발송 리스트 table에 inser되었는지 체크문
  var insertCheck = false;
  // 메일발송 상세정보 insert
  if(m_idx_a){
    var recipiArr = JSON.parse('['+mailAllParam.M_recipi+']');
    var recipiNgroup = recipiArr.concat(groups2allIdx);
    await asyncForEach(recipiNgroup, async (item, index, array) => {
      if(insertCheck == false){
        var recipiInfo = await mailListA.getOneInfo(item);
        if(recipiInfo.length != 0){
          var mailDetailParam = {
            M_idx_A : m_idx_a,
            E_mail : recipiInfo[0].M_email,
            P_title : recipiInfo[0].M_ptitle,
            P_name : recipiInfo[0].M_name,
            M_result : '9'
          }
          try{
            if(typeof req.body.end_reserve_time !='undefined'){
              mailDetailParam['M_send'] = req.body.end_reserve_time;
            }
            var resultInsert = await mailDetailB.insert(mailDetailParam);
            console.log(resultInsert);
          }
          catch(e){
            await mailAllA.delete(m_idx_a);
            insertCheck = true;
          }
        } else {
          await mailAllA.delete(m_idx_a);
        }
      }
    });
  }
  else{
    insertCheck = true;
  }

  // 메일 발송(insert Error시)
  if(insertCheck){
    res.status(500).send('발송에 실패했습니다. 다시 시도해주세요.');
    console.log('M_recipi:',M_recipi);
    return false;
  }

  res.send({status:true});
});

router.post('/send',isAuthenticated, async function(req, res) {
  console.log('mail send req.body: ',req.body);
  // 보낼 메일 data 가져오기
  var result = await mailAllA.getEmailData(req.body.idx);
  if(result.length == 0){
    res.status(500).send('메일 정보 없음');
  }
  var mailData = result[0];

  var euckr2utf8 = new Iconv('EUC-KR', 'UTF-8//translit//ignore');
  var utf82euckr1 = new Iconv('UTF-8', 'EUC-KR//translit//ignore');
  var utf82euckr2 = new Iconv('UTF-8', 'EUC-KR//translit//ignore');

  var bodyBuf = new Buffer(await settingMailBody(mailData.M_body,mailData.M_keyword,mailData.n_idx));
  var subjectBuf = new Buffer(mailData.M_subject);

  var subjectConvert = utf82euckr1.convert(subjectBuf.toString('utf-8'));
  var bodyConvert = utf82euckr2.convert(bodyBuf.toString('utf-8'));

  // 메일 보내는 사람 가져오기
  var mailSender = await mailListA.getOneEmail(mailData.M_sender);
  var sender = (mailSender.length > 0) ? mailSender[0]: [];
  // 메일 받는 사람 가져오기
  console.log('mailData.M_recipi:',mailData.M_recipi);
  console.log('mailData.M_group:',mailData.M_group);
  var recipiArr = mailData.M_recipi.split(',');
  var mailRecipi = await mailListA.getOneEmail(recipiArr);
  var recipi = (mailRecipi.length > 0) ? mailRecipi: [];
  // 메일 받는 그룹 가져오기
  var groups = [];
  if(mailData.M_group != null){
    var groupArr = mailData.M_group.split(',');
    var mailGroup = await mailListC.getOneEmail(groupArr);
    groups = mailGroup;
  }

  var recipients = recipi.concat(groups);

  var param = {
    'subject': urlencode(new Buffer(subjectConvert).toString('base64')),//.toString('base64')
    'body': urlencode(new Buffer(bodyConvert).toString('base64')),
    'sender': urlencode(sender),
    'recipients': urlencode(recipients.join(',')),
    'username': urlencode('unionc'),
    'key': urlencode('w4EzdnbOY3oypxO'),
    'mail_type': (mailData.M_type == '1') ? urlencode('ONETIME'):urlencode('NORMAL'),
    'time' : (mailData.M_send == null || mailData.M_send == '') ? '' : urlencode(mailData.M_send),
    'unique_id':mailData.n_idx
  };

  var paramStr = 'subject='+param['subject']+'&body='+param['body']+'&sender='+param['sender']+'&username='+param['username']+'&recipients='+param['recipients']+'&key='+param['key'];
  // returnURL이 있는 경우
  paramStr += '&return_url='+urlencode('http://overmail.iptime.org:8080/email/send/result');
  paramStr += '&unique_id='+urlencode(parseInt(param['unique_id']));
  if(param['mail_type'] == urlencode('ONETIME')){
    paramStr +='&mail_type='+param['mail_type']+'&start_reserve_time='+param['time']+'&end_reserve_time='+param['time'];
  }
  // if('file_url' in param && 'file_name' in param){
  //   if(param['file_url'] != "" && param['file_name'] != ""){
  //     paramStr += '&file_url='+param['file_url']+'&file_name='+param['file_name'];
  //   }
  // }
  var resultEmail = await emailSendFun(paramStr);
  console.log('이메일 발송 파라미터 : ',paramStr);
  console.log('이메일 발송 dic : ',param);
  console.log('이메일 발송 결과 : ',resultEmail);
  await mailDetailB.updateSendDateResult(param['unique_id']);
  if(resultEmail[0]){
    res.send({status:true});
  }
  else{
    res.status(500).send(resultEmail[2]);
  }
  // 메일 발송후 결과 update
  var mailApiRsult = resultEmail[resultEmail.length-1];
  if(typeof mailApiRsult == 'object'){
    await mailAllA.updateId([mailApiRsult.id,param['unique_id']]);
  }
  var errorMsg = '';
  if(resultEmail[1] != 250){
    var sendCount = await period.selectSendCount(param['unique_id'])
    await mailAllA.updateResult2([sendCount,param['unique_id']]);
    errorMsg = resultEmail[2];
  }
  await mailDetailB.updateResult([resultEmail[1],errorMsg,param['unique_id']]);
});

async function settingMailBody(bodyHtml,keyword,idx){
  // 메일이 안보이면 텍스트 추가
  var pastParam = {'keyword':keyword,'page':1};
  var pastView = await content.selectView(pastParam);
  var pastCount = await content.selectViewCount(pastParam);
  pastCount = (pastCount.length == 0) ? '':pastCount[0].total;
  var htmlMsg = '<table width="750" align="center" cellpadding="0" cellspacing="0" style="padding: 20px;"><tbody><tr><td align="center" style="font-size: 15px; font-weight: bold;" class="fix">[ 메일 본문이 깨져 보이면 <a href=\"http://overmail.iptime.org:8080/preview?keyword='+keyword+'&idx='+idx+'\" target=\"_blank\" style=\"font-family: 맑은고딕,malgungothic,돋움,dotum; font-size:12px;color:#ff6300\">여기</a>를 눌러 주세요 ]</td></tr></tbody></table>';
  var html = '<table width="750" align="center" cellpadding="0" cellspacing="0" border="0" style="margin-top: 30px;"><tbody><tr><td>[지난 기사보기]<hr><table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin-top: 10px;"><colgroup><col width="78%"><col width="22%"></colgroup><tbody>';

  for(var i=0; i < pastView.length; i++) {
    var url = 'http://overmail.iptime.org:8080/preview?keyword='+pastView[i].keyword_idx+'&idx='+pastView[i].n_idx;
    var numIdx = Math.ceil(pastCount-i).toString();
    html +='<tr><td style=\"font-size: small;padding:5px 0 5px;border-bottom:1px dotted #d9d9d9;color:#444;\">[No.'+numIdx+'차]<a style=\"text-decoration:none; color:black;\" href=\"'+url+'\" target=\"_blank\">'+pastView[i].M_subject+'</a>';
    html +='</td><td style=\"font-size: small;padding:5px 0 5px;border-bottom:1px dotted #d9d9d9;color:#444;\">'+pastView[i].M_regdate+'</td></tr>'
  }
  html +='<tr><td colspan="2" style="text-align: center; font-size: small;padding:10px 0 5px;">';
  var limit = 5;
  var pages = Math.ceil(pastCount / limit);
  var index=1;
  for(index;index<=pages;index++){
    //http://showbox.email
    if(1 == index){
      html +='<strong><span class="current">'+index+'</span></strong>';
    } else{
      html +='<a href=\"http://overmail.iptime.org:8080/preview?keyword='+keyword+'&idx='+idx+'&page='+index+'\">'+index+'</a>';
    }
  }
  html += '</td></tr></tbody></table></td></tr></tbody></table><table cellpadding="0" cellspacing="0" border="0" width="750" align="center" style="margin-top: 30px;"><tbody><tr><td align="center">Copyright ⓒ unioncontents All rights reserved.</td></tr></tbody></table><p>&nbsp;</p>'
  return htmlMsg+bodyHtml+htmlMsg+html;
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

function emailSendFun(pStr){
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
  res.send({location:'http://overmail.iptime.org:8080/'+result});
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
    var fileNameArr = file.originalname.split('.');
    // cb(null, new Buffer(fileNameArr[0],'ascii').toString('hex')+"."+fileNameArr[fileNameArr.length-1])
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
  res.send({location:'http://overmail.iptime.org:8080/period/download/'+result});
});
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

module.exports = router;
