var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  var iconv = require('iconv-lite');
  iconv.extendNodeEncodings();
  var request = require('request');
  var param = {
    'subject': iconv.encode('메일테스트중', 'euc-kr'),
    'body':iconv.encode('메일테스트중', 'euc-kr'),
    'sender':'smb1457@naver.com',
    'recipients':'smb1457@naver.com,smb1457@daum.net', //공백제거필수
    'username':'unionc',
    'key':'w4EzdnbOY3oypxO'
  };
  // var url = 'https://directsend.co.kr/index.php/api/v2/mail?subject=메일테스트중&body=메일테스트중&sender=smb1457@naver.com&recipients=smb1457@naver.com,smb1457@daum.net&username=unionc&key=w4EzdnbOY3oypxO';

  // 요청 세부 내용
  var options = {
    url: 'https://directsend.co.kr/index.php/api/v2/mail',
    method:'POST',
    headers: {'Content-Type': 'application/x-www-form-urlencoded;'},
    from: param,
    encoding: null
  }
  request(options,
    function (error, response, body) {
      console.log(response)
      // console.log(error, response, body);
      var strContents = new Buffer(body);
      console.log(iconv.decode(strContents, 'EUC-KR').toString());
    }
  );
  iconv.undoExtendNodeEncodings();
  res.render('email');
});

module.exports = router;
