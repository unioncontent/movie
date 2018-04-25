var express = require('express');
var fs = require('fs-extra');
var request = require('request');
var datetime = require('node-datetime');
var urlencode = require('urlencode');
var Iconv = require('iconv').Iconv;
var router = express.Router();
// DB module
var mailAllA = require('../models/mailAllA.js');
var mailDetailB = require('../models/mailDetailB.js');
var mailListA = require('../models/mailListA.js');
var mailListC = require('../models/mailListC.js');
var keyword = require('../models/keyword.js');
var mailType = require('../models/mailType.js');

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
  var data = {
    keywordList : await keyword.selectMovieKwd(),
    typeList : await mailType.selectTable([req.user.user_idx]),
    mailList : await mailListA.selectView({},[req.user.user_idx,0,10]),
    mailListCount : await mailListA.selectViewCount({},[req.user.user_idx,0,10]),
    mailListPageNum : 1,
    groupList : await mailListC.selectView({},[req.user.user_idx,0,10]),
    groupListCount : await mailListC.selectViewCount({},[req.user.user_idx,0,10]),
    groupListPageNum : 1
  };
  res.render('email',data);
});

router.get('/test',isAuthenticated, async function(req, res) {
  var data = {
    keywordList : await keyword.selectMovieKwd(),
    typeList : await mailType.selectTable([req.user.user_idx]),
    mailList : await mailListA.selectView({},[req.user.user_idx,0,10]),
    mailListCount : await mailListA.selectViewCount({},[req.user.user_idx,0,10]),
    mailListPageNum : 1,
    groupList : await mailListC.selectView({},[req.user.user_idx,0,10]),
    groupListCount : await mailListC.selectViewCount({},[req.user.user_idx,0,10]),
    groupListPageNum : 1
  };
  res.render('email_test',data);
});

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
  var emailParam = [req.user.user_idx,0,10];
  var groupParam = [req.user.user_idx,0,10];

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
  var param = [req.user.user_idx,0,10];
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

router.get('/searchAll',isAuthenticated, async function(req, res) {
  if(req.query.session == false){
    return res.send({status:false});
  }
  var param = [req.user.user_idx,0,10];
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
 * option_return_url : 위의 측정 결과를 받고 싶은 URL 을 넣어줍니다. ex) http://domain?type=[click | open | reject]&mail_id=[MailID]&email=[Email]
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
    await mailDetailB.updateResult2([item.SmtpCode,item.SmtpMsg,req.body.ID],item.Email);
  });

  res.send('true');
});

router.post('/send',isAuthenticated, async function(req, res) {
  console.log('mail send req.body: ',req.body);
  // 이메일 발송
  var euckr2utf8 = new Iconv('EUC-KR', 'UTF-8');
  var utf82euckr = new Iconv('UTF-8', 'EUC-KR');

  var sender = await mailListA.getOneEmail(req.body.M_sender);
  var recipi = await mailListA.getOneEmail(req.body['M_recipi[]']);
  var groups = [];
  var groups2allIdx = [];
  if(typeof req.body['M_group[]'] != 'undefined'){
    if(req.body['M_group[]'].length != 0){
      groups = await mailListC.getEmail(req.body['M_group[]'],req.user.user_idx);
      groups2allIdx = await mailListC.getIdx(req.body['M_group[]'],req.user.user_idx);
    }
  }

  var recipients = recipi.concat(groups);
  var param = {
    'subject': urlencode(new Buffer(utf82euckr.convert(req.body.M_subject)).toString('base64')),
    'body': urlencode(new Buffer(utf82euckr.convert(req.body.M_body)).toString('base64')),
    'sender': urlencode(sender.join(',')),
    'recipients': urlencode(recipients.join(',')),
    'username': urlencode('unionc'),
    'key': urlencode('w4EzdnbOY3oypxO'),
    'mail_type': (req.body.M_type == '1') ? urlencode('ONETIME'):urlencode('NORMAL'),
    'time' : (typeof req.body.end_reserve_time =='undefined') ? '' : urlencode(req.body.end_reserve_time),
    'file_url': urlencode(req.body.M_file),
    'file_name': urlencode(req.body.M_fileName)
  };

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
    M_id: req.user.user_idx
  };
  if(typeof req.body['M_recipi[]'] == 'object'){
    mailAllParam['M_recipi'] = req.body['M_recipi[]'].join(',');
  }
  else if(typeof req.body['M_recipi[]'] == 'string'){
    mailAllParam['M_recipi'] = req.body['M_recipi[]'];
  }
  if(req.body['M_file_d'] != ""){
    mailAllParam['M_file'] = req.body['M_file_d'];
    mailAllParam['M_file_name'] = req.body['M_fileName'];
  }
  if(groups2allIdx != []){
    if(groups2allIdx.length != 0){
      mailAllParam['M_group'] = groups2allIdx[0];
    }
  }
  var m_idx_a = null;
  // 메일발송 리스트 insert
  var resultInsert = await mailAllA.insert(mailAllParam);
  m_idx_a = resultInsert.insertId;
  param['unique_id'] = m_idx_a;
  // 메일발송 상세정보 insert
  console.log('inseret idx:',m_idx_a);
  var insertCheck = false;
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
            M_send :  (typeof req.body.end_reserve_time =='undefined') ? now : req.body.end_reserve_time,
            M_result : '9'
          }
          try{
            var resultInsert = await mailDetailB.insert(mailDetailParam);
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

  // 메일 발송(insert Error시)
  if(insertCheck){
    res.status(500).send('발송에 실패했습니다. 다시 시도해주세요.');
    return false;
  }

  // 예약발송은 파이썬으로
  if(req.body.M_type == '1'){
    res.send({status:true});
    return false;
  }

  var paramStr = 'subject='+param['subject']+'&body='+param['body']+'&sender='+param['sender']+'&username='+param['username']+'&recipients='+param['recipients']+'&key='+param['key'];
  // returnURL이 있는 경우
  paramStr += '&return_url='+urlencode('http://mail.overware.co.kr/email/send/result');
  paramStr += '&unique_id='+urlencode(parseInt(param['unique_id']));
  if(param['mail_type'] == urlencode('ONETIME')){
    paramStr +='&mail_type='+param['mail_type']+'&start_reserve_time='+param['time']+'&end_reserve_time='+param['time'];
  }
  if(param['file_url'] != "" && param['file_name'] != ""){
    paramStr += '&file_url='+param['file_url']+'&file_name='+param['file_name'];
  }
  // 이메일 발송 - 테스트중
  var resultEmail = await emailSendFun(paramStr);
  console.log('이메일 발송 파라미터 : ',paramStr);
  console.log('이메일 발송 결과 : ',resultEmail);
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

  // 메일나라에 전송후 첨부파일 삭제(보류)
  // console.log('메일나라에 전송후 첨부파일 삭제')
  // if(req.body['M_file_d'] != ""){
  //   var dateFile = dt.format('Ymd');
  //   var removeFileArray = mailAllParam['M_file'].split("|");

    // asyncFileRemove(dateFile,removeFileArray);
    // await asyncForEach(removeFileArray, async (item, index, array) => {
    //   var removePath = "/home/hosting_users/unioncmail/apps/unioncmail_unioncmail/public/uploads/files/"+item;
    //   console.log('remove file:',removePath.replace(/ /gi, ""));
    //   fs.removeSync(removePath.replace(/ /gi, ""));
    // });
  // }
});

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

/*
m_mail_detail_B table에 저장될 M_result 값 종류
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
var date = datetime.create();
var today = date.format('Ymd');
var absolutePath = '/home/hosting_users/unioncmail/apps/unioncmail_unioncmail/';

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
    var file = "/home/hosting_users/unioncmail/apps/unioncmail_unioncmail/public/uploads/files/"+today+"/"+req.body.file;
    var result = fs.removeSync(file.replace(/ /gi, ""));
    return res.send({status:true});
  } catch (err) {
    res.status(500).send(err);
  }
});

// 메일작성시 이미지 upload 및 path get
var storageImage = multer.diskStorage({
  destination: async function (req, file, cb) {
    var path = await mkdirsFun(absolutePath+'public/uploads/image/'+today);
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
  res.send({
    result : req.file.destination.replace(absolutePath+'public/','')+'/'+req.file.originalname
  });
});

// 첨부파일 upload 및 path get
var storageFiles = multer.diskStorage({
  destination: async function (req, file, cb) {
    var path = await mkdirsFun(absolutePath+'public/uploads/files/'+today);
    await cb(null, path);
  },
  filename: function (req, file, cb) {
    var fileNameArr = file.originalname.split('.');
    cb(null, new Buffer(fileNameArr[0],'ascii').toString('hex')+"."+fileNameArr[fileNameArr.length-1])
  }
});
var uploadFiles = multer({ storage: storageFiles });
router.post('/send/files',uploadFiles.single('files[]'),function(req, res) {
  console.log('/send/files:',req.file);
  if (!req.file) {
    console.log("No file passed");
    return res.status(500).send("No file passed");
  }
  if(req.file.originalname.indexOf('.exe') != -1){
    console.log('exe Error:',req.file.path);
    fs.removeSync(req.file.path);
    return res.status(500).send("exe는 업로드 불가합니다.");
  }
  var data = [req.file.filename,req.file.destination.replace(absolutePath+'public/uploads/files/','')+'/'+req.file.originalname];
  res.send({result:data});
});

module.exports = router;
