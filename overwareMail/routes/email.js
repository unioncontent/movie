var express = require('express');
var request = require('request');
var urlencode = require('urlencode');
var Iconv = require('iconv').Iconv;
var mailListA = require('../models/mailListA.js');
var mailListC = require('../models/mailListC.js');
var router = express.Router();
const DBpromise = require('../db/db_info.js');

router.get('/', async function(req, res) {
  var db = new DBpromise();
  try{
    var sql = 'select * from mail_list_all_view';
    var result1 = await db.query(sql);
    sql = 'select count(*) as total from mail_list_all_view';
    var resultCount1 = await db.query(sql);

    sql = 'SELECT M_ID,M_group_title,count(*) as groupCount FROM mail_list_group_view group by M_group_title';
    var result2 = await db.query(sql);
    sql = 'SELECT count(*) as total FROM mail_list_group_view group by M_group_title';
    var resultCount2 = await db.query(sql);

    res.render('email',{
      mailList : result1,
      mailListCount : resultCount1[0].total,
      groupList : result2,
      groupListCount : resultCount2[0].total
    });
  } catch(exception) {
    console.log('email 에러발생:',exception);
    res.render('email',{
      mailList : [],
      mailListCount : '0',
      groupList : [],
      groupListCount : '0'
    });
  } finally{
    db.close();
  }
});

router.post('/searchGroup', function(req, res) {
  console.log('Group Select');
  mailListC.selectAll(req.body.search,function(err,result){
    res.send(result);
  });
});

router.get('/searchAll', async function(req, res) {
  // console.log('All select');
  var db = new DBpromise();
  try{
    var param = [0,20];
    if('page' in req.query){
      param[0] = (req.query.page - 1) * param[1];
    }
    var sql = 'select * from mail_list_all_view where search like \'%'+req.query.search+'%\' order by search limit ?,?';
    var resultList = await db.query(sql,param);

    sql = 'select count(*) as total from mail_list_all_view where search like \'%'+req.query.search+'%\' order by search';
    var resultCount = await db.query(sql);

    res.send({
      items : resultList,
      total_count : resultCount[0].total
    });
  } catch(exception) {
    console.log('에러발생:',exception);
    res.send({
      items : null,
      total_count : 0
    });
  } finally{
    db.close();
  }
  // mailListA.selectAll(req.body,function(err,result){
  //   res.send(result);
  // });
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

router.post('/send', function(req, res) {
  console.log('mail send : ',req.body);
  var euckr2utf8 = new Iconv('EUC-KR', 'UTF-8');
  var utf82euckr = new Iconv('UTF-8', 'EUC-KR');
  var param = {
    'subject': urlencode(new Buffer(utf82euckr.convert(req.body.M_subject)).toString('base64')),
    'body': urlencode(new Buffer(utf82euckr.convert(req.body.M_body)).toString('base64')),
    'sender': urlencode(req.body.sender),
    'recipients': urlencode(req.body.recipients),
    'username': urlencode('unionc'),
    'key': urlencode('w4EzdnbOY3oypxO')
  };
  var paramStr = 'subject='+param['subject']+'&body='+param['body']+'&sender='+param['sender']+'&username='+param['username']+'&recipients='+param['recipients']+'&key='+param['key'];

  // 요청 세부 내용
  var options = {
    url: 'https://directsend.co.kr/index.php/api/v2/mail',
    method:'POST',
    headers: {'Content-Type': 'application/x-www-form-urlencoded;'},
    body: paramStr
  }
  request(options,function (error, response, body) {
    console.log(body);
    res.send(true);
  });
});
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
