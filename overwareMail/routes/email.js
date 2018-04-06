var express = require('express');
var request = require('request');
var datetime = require('node-datetime');
var urlencode = require('urlencode');
var Iconv = require('iconv').Iconv;
var mailAllA = require('../models/mailAllA.js');
var mailDetailB = require('../models/mailDetailB.js');
var mailListA = require('../models/mailListA.js');
var mailListC = require('../models/mailListC.js');
var keyword = require('../models/keyword.js');
var mailType = require('../models/mailType.js');
var router = express.Router();
const DBpromise = require('../db/db_info.js');

router.get('/', async function(req, res) {
  var data = {
    keywordList : await keyword.selectMovieKwd(),
    typeList : await mailType.selectTable(),
    mailList : await mailListA.selectView({},['1',0,10]),
    mailListCount : await mailListA.selectViewCount({},['1',0,10]),
    mailListPageNum : 1,
    groupList : await mailListC.selectView({},['1',0,10]),
    groupListCount : await mailListC.selectViewCount({},['1',0,10]),
    groupListPageNum : 1
  };
  res.render('email',data);
});

router.post('/getModalListPage', async function(req, res) {
  console.log('getModalListPage');
  var data = {
    group : [],
    groupTotal : [],
    groupPage : 1,
    email : [],
    emialTotal : [],
    emailPage : 1
  };
  // cpID = 현재 로그인된 사람 아이디, start, end
  var emailParam = ['1',0,10];
  var groupParam = ['1',0,10];

  if (typeof req.body.page !== 'undefined') {
    if (typeof req.body.type !== 'undefined') {
      if(req.body.type == 'group'){
        groupParam[1] = parseInt(req.body.page);
        data.groupPage = Math.ceil(parseInt(req.body.page) / 10)+1;
      }
      else if(req.body.type == 'mail'){
        emailParam[1] = parseInt(req.body.page);
        data.emailPage = Math.ceil(parseInt(req.body.page) / 10)+1;
      }
    }
  }
  data['group'] = await mailListC.selectView(req.body,groupParam);
  data['groupTotal'] = await mailListC.selectViewCount(req.body,groupParam);
  data['email'] = await mailListA.selectView(req.body,emailParam);
  data['emailTotal'] = await mailListA.selectViewCount(req.body,emailParam);
  res.send(data);
});

router.get('/searchGroup', async function(req, res) {
  // cpID = 현재 로그인된 사람 아이디, start, end
  var param = ['1',0,10];
  if (typeof req.query.page !== 'undefined') {
    param[1] = (req.query.page - 1) * param[2];
  }
  req.query.as = ' as id ';
  var data = {
    items : await mailListC.selectView(req.query,param),
    total_count :  await mailListC.selectViewCount(req.query,param)
  };
  res.send(data);
});

router.get('/searchAll', async function(req, res) {
  // cpID = 현재 로그인된 사람 아이디, start, end
  var param = ['1',0,10];
  if (typeof req.query.page !== 'undefined') {
    param[1] = (req.query.page - 1) * param[2];
  }
  req.query.as = ' as id ';
  var data = {
    items : await mailListA.selectView(req.query,param),
    total_count :  await mailListA.selectViewCount(req.query,param)
  };
  res.send(data);
});

/* 메일나라 'https://directsend.co.kr/index.php/api/v2/mail'
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
router.post('/send', async function(req, res) {
  console.log('mail send : ',req.body);
  // 이메일 발송
  var euckr2utf8 = new Iconv('EUC-KR', 'UTF-8');
  var utf82euckr = new Iconv('UTF-8', 'EUC-KR');

  var sender = await mailListA.getOneEmail(req.body.M_sender);
  var recipi = await mailListA.getOneEmail(req.body['M_recipi[]']);
  var groups = await mailListC.getEmail(req.body['M_group[]']);
  var groups2allIdx = await mailListC.getIdx(req.body['M_group[]']);

  var recipients = recipi.concat(groups);

  var param = {
    'subject': urlencode(new Buffer(utf82euckr.convert(req.body.M_subject)).toString('base64')),
    'body': urlencode(new Buffer(utf82euckr.convert(req.body.M_body)).toString('base64')),
    'sender': urlencode(sender.join(',')),
    'recipients': urlencode(recipients.join(',')),
    'username': urlencode('unionc'),
    'key': urlencode('w4EzdnbOY3oypxO'),
    'mail_type': (req.body.M_type == '1') ? urlencode('ONETIME'):urlencode('NORMAL'),
    'time' : (typeof req.body.end_reserve_time =='undefined') ? '' : urlencode(req.body.end_reserve_time)
  };
  var paramStr = 'subject='+param['subject']+'&body='+param['body']+'&sender='+param['sender']+'&username='+param['username']+'&recipients='+param['recipients']+'&key='+param['key'];
  if(param['mail_type'] == urlencode('ONETIME')){
    paramStr +='&mail_type='+param['mail_type']+'&start_reserve_time='+param['time']+'&end_reserve_time='+param['time'];
  }
  var dt = datetime.create();
  var now = dt.format('Y-m-d H:M:S');
  var resultEmail = await emailSendFun(paramStr);
  console.log('이메일 발송 결과 : ',resultEmail);

  if(resultEmail[0]){
    res.send('메일발송 성공했습니다.');
  }
  else{
    res.status(500).send(resultEmail[2]);
  }

  // 이메일발송 결과 DB 저장
  var mailAllParam = req.body;
  if(typeof req.body['M_recipi[]'] == 'object'){
    mailAllParam['M_recipi'] = req.body['M_recipi[]'].join(',');
  }
  else if(typeof req.body['M_recipi[]'] == 'string'){
    mailAllParam['M_recipi'] = req.body['M_recipi[]'];
  }
  mailAllParam['M_group'] = groups2allIdx[0];
  delete mailAllParam['M_group[]']; // 수신그룹 key 이름 변경
  delete mailAllParam['M_recipi[]']; // 받는사람 key 이름 변경
  delete mailAllParam['M_type']; // 예약 key  삭제
  mailAllParam['M_id'] = '1';
  var m_idx_a = null;
  // 메일발송 리스트 insert
  try{
    console.log(mailAllParam);
    var resultInsert = await mailAllA.insert(mailAllParam);
    m_idx_a = resultInsert.insertId;
    console.log('inseret idx:',m_idx_a);
  }
  catch(e){
    console.log('insert 오류:',e);
  }
  // 메일발송 상세정보 insert
  if(m_idx_a){
    try{
      var recipiArr = JSON.parse('['+mailAllParam.M_recipi+']');
      var recipiNgroup = recipiArr.concat(groups2allIdx);
      console.log(recipiArr,recipiNgroup);
      await asyncForEach(recipiNgroup, async (item, index, array) => {
        var recipiInfo = await mailListA.getOneInfo(item);
        console.log(index,':',recipiInfo);
        if(recipiInfo.length != 0){
          var mailDetailParam = {
            M_idx_A : m_idx_a,
            E_mail : recipiInfo[0].M_email,
            P_title : recipiInfo[0].M_ptitle,
            P_name : recipiInfo[0].M_name,
            M_send :  (typeof req.body.end_reserve_time =='undefined') ? now : req.body.end_reserve_time,
            M_result : 0//resultEmail[1]
          }
          console.log('mailDetailParam:',mailDetailParam);
          var resultInsert = await mailDetailB.insert(mailDetailParam);
          console.log('resultInsert:',resultInsert);
        } else {
          await mailAllA.delete(m_idx_a);
        }
      });

    }
    catch(e){
      console.log('insert 오류:',e);
      await mailAllA.delete(m_idx_a);
    }
  }
});

function emailSendFun(pStr){
  var options = {
    url: 'https://directsend.co.kr/index.php/api/v2/mail',
    method:'POST',
    headers: {'Content-Type': 'application/x-www-form-urlencoded;'},
    body: pStr
  }
  /*
  m_mail_detail_B table에 저장될 M_result 값 종류
  0 : 정상발송 => 0 : 메일발송에 성공하였습니다.
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
  return new Promise((resolve, reject) => {
    request(options, (error, response, body) => {
      var resultArr = null;
      var requestResult = JSON.parse(body).status;
      if(requestResult == '0'){
        resultArr = [true,requestResult];
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
        resultArr = [false,9,'메일발송에 문제가 생겼습니다. 다시 시도해주세요.'];
      }
      return resolve(resultArr);
    });
  });
}

var multer = require('multer');
var storageImage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'public/uploads/image') // cb 콜백함수를 통해 전송된 파일 저장 디렉토리 설정
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname) // cb 콜백함수를 통해 전송된 파일 이름 설정
  }
});
var uploadImage = multer({ storage: storageImage });
router.post('/send/img',uploadImage.single('file'),function(req, res) {
  console.log('/send/img');
  console.log(req.file);
  if (!req.file) {
    console.log("No file passed");
    return res.status(500).send("No file passed");
  }
  res.send(req.file.filename);
});

var storageFiles = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'public/uploads/files')
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname)
  }
});
var uploadFiles = multer({ storage: storageFiles });
router.post('/send/files',uploadFiles.single('files[]'),function(req, res) {
  console.log('/send/files');
  console.log(req.file);
  if (!req.file) {
    console.log("No file passed");
    return res.status(500).send("No file passed");
  }
  res.send(req.file.filename);
});

module.exports = router;
