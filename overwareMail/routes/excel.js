var express = require('express');
var fs = require('fs');
var moment = require('moment');
var xl = require('excel4node');
var datetime = require('node-datetime');
var router = express.Router();
// DB module
var maillink = require('../models/maillink.js');

const aDir = 'C:/overware/overwareMail/';

router.get('/',async function(req, res) {
  var sucess = await maillink.selectResultDetail2([req.query.idx,13]);
  var fail = await maillink.selectResultDetail2([req.query.idx,0]);
  var wb = new xl.Workbook({
    defaultFont: {
      size: 12,
      color: '#000000'
    },
    fill: {
      type: 'pattern',
      patternType: 'solid',
      fgColor: '#FFFFFF'
    },
    alignment: {
      horizontal: 'left'
    },
    numberFormat: '$#,##0;-'
  });
  var ws = wb.addWorksheet('성공');
  var tStyle = wb.createStyle({
    font: {
      bold: true
    },
    fill: {
      type: 'pattern',
      patternType: 'solid',
      fgColor: '#ffeb3b',
    },
    alignment: {
      horizontal: 'center'
    }
  });
  ws.column(3).setWidth(60);
  ws.column(6).setWidth(30);
  ws.column(7).setWidth(20);
  ws.column(8).setWidth(20);
  ws.column(9).setWidth(20);
  ws.cell(1,1).string('NO').style(tStyle);
  // ws.cell(1,2).string('발송타입').style(tStyle);
  ws.cell(1,2).string('키워드').style(tStyle);
  // ws.cell(1,4).string('메일타입').style(tStyle);
  // ws.cell(1,5).string('차수').style(tStyle);
  ws.cell(1,3).string('제목').style(tStyle);
  ws.cell(1,4).string('회사').style(tStyle);
  ws.cell(1,5).string('성명').style(tStyle);
  ws.cell(1,6).string('이메일').style(tStyle);
  ws.cell(1,7).string('발송날짜').style(tStyle);
  ws.cell(1,8).string('작성날짜').style(tStyle);
  ws.cell(1,9).string('개봉날짜').style(tStyle);
  ws.cell(1,10).string('발송결과').style(tStyle);
  var row = 0;
  var MSGIDStr;
  await asyncForEach(sucess, async (item, index, array) => {
    row = index+2;
    if(index == 0){
      MSGIDStr = item.MSGID;
    }
    var openDate = (item.OPENTIME != null)?moment(item.OPENTIME).format('YYYY-MM-DD HH:mm:ss'):'';
    ws.cell(row,1).string((index+1).toString());
    // ws.cell(row,2).string(((item.M_type == '0') ? '즉시' : '예약'));
    ws.cell(row,2).string(item.M_keyword_str);
    // ws.cell(row,4).string(item.M_mail_type);
    // ws.cell(row,5).string(((item.M_invitation == '0')?(item.M_seq_number+'차'):'인비테이션'));
    ws.cell(row,3).string(item.M_subject);
    ws.cell(row,4).string(item.M_ptitle);
    ws.cell(row,5).string(item.EMTONAME);
    ws.cell(row,6).string(item.EMTOADDRESS);
    ws.cell(row,7).string(moment(item.SENDTIME).format('YYYY-MM-DD HH:mm:ss'));
    ws.cell(row,8).string(moment(item.GENDATE).format('YYYY-MM-DD HH:mm:ss'));
    ws.cell(row,9).string(openDate);
    ws.cell(row,10).string('성공');
  });

  var ws2 = wb.addWorksheet('실패');
  ws2.column(3).setWidth(60);
  ws2.column(6).setWidth(30);
  ws2.column(7).setWidth(20);
  ws2.column(8).setWidth(20);
  ws2.column(10).setWidth(30);
  ws2.cell(1,1).string('NO').style(tStyle);
  // ws2.cell(1,2).string('발송타입').style(tStyle);
  ws2.cell(1,2).string('키워드').style(tStyle);
  // ws2.cell(1,4).string('메일타입').style(tStyle);
  // ws2.cell(1,5).string('차수').style(tStyle);
  ws2.cell(1,3).string('제목').style(tStyle);
  ws2.cell(1,4).string('회사').style(tStyle);
  ws2.cell(1,5).string('성명').style(tStyle);
  ws2.cell(1,6).string('이메일').style(tStyle);
  ws2.cell(1,7).string('발송날짜').style(tStyle);
  ws2.cell(1,8).string('작성날짜').style(tStyle);
  ws2.cell(1,9).string('발송결과').style(tStyle);
  ws2.cell(1,10).string('오류내용').style(tStyle);
  row = 0;
  await asyncForEach(fail, async (item, index, array) => {
    row = index+2;
    ws2.cell(row,1).string((index+1).toString());
    // ws2.cell(row,2).string(((item.M_type == '0') ? '즉시' : '예약'));
    ws2.cell(row,2).string(item.M_keyword_str);
    // ws2.cell(row,4).string(item.M_mail_type);
    // ws2.cell(row,5).string(((item.M_invitation == '0')?(item.M_seq_number+'차'):'인비테이션'));
    ws2.cell(row,3).string(item.M_subject);
    ws2.cell(row,4).string(item.M_ptitle);
    ws2.cell(row,5).string(item.EMTONAME);
    ws2.cell(row,6).string(item.EMTOADDRESS);
    ws2.cell(row,7).string(moment(item.SENDTIME).format('YYYY-MM-DD HH:mm:ss'));
    ws2.cell(row,8).string(moment(item.GENDATE).format('YYYY-MM-DD HH:mm:ss'));
    ws2.cell(row,9).string('실패');
    ws2.cell(row,10).string(settingErrorMsg(item.FINALRESULT));
  });
  var date = datetime.create();
  var today = date.format('YmdHM');
  var filename = 'showboxEmail_result_'+today+'.xlsx';
  var filepath = aDir+filename;
  wb.write(filepath,function(err,stats){
    if(err){
      console.log(err);
    }
    else{
      res.setHeader("Content-Type", "application/x-msdownload");
      res.setHeader("Content-Disposition", "attachment; filename=" + filename);

      var filestream = fs.createReadStream(filepath);
      fs.unlink(filepath,function(err){
        if(err) return console.log(err);
        console.log('file deleted successfully');
      });
      filestream.pipe(res);
    }
  });
});

async function asyncForEach(array, callback) {
  for (var index = 0; index < array.length; index++) {
   var done = await callback(array[index], index, array);
    if(done == false){
     break;
    }
  }
}

function settingErrorMsg(code){
  var returnMsg = '';
  if (code == '31'){
    returnMsg = '호스트에 연결 경로가 없음 (라우팅 경로상의 특정 라우터에 이상이 있는 경우 발생)';
  }
  else if (code == '35'){
    returnMsg = '메일박스 용량 초과 (수신측 서버의 디스크 용량 초과)';
  }
  else if (code == '36'){
    returnMsg = '서버에 접속할 수 없음(스팸 블로킹 등의 이유로 서버에서 접속을 차단하는 경우)';
  }
  else if (code == '37'){
    returnMsg = 'Transaction Failed (구체적인 에러 사유 없이 수신측 서버에서 이메일 수신이 실패하였음을 통보)';
  }
  else if (code == '38'){
    returnMsg = '소켓 대기 시간 초과 (Timeout 시간(1분)동안 수신측 서버에서 응답이 없는 경우)';
  }
  else if (code == '3A'){
    returnMsg = '네트워크 연결이 끊어짐 (수신측 서버와 통신 연결이 성공하였으나 통신과정에서 스팸체킹 룰 등의 이유로 통신 중간에 연결을 끊어버리는 경우)';
  }
  else if (code == '3C'){
    returnMsg = '스풀 파일을 생성할 수 없음.(임시 파일 생성시 디스크 에러)';
  }
  else if (code == '3D'){
    returnMsg = '호스트를 찾을 수 없음(이메일 주소의 도메인 명이 유효한 도메인이 아닌 경우)';
  }
  else if (code == '3E'){
    returnMsg = '수신서버가 일시적으로 응답불가(메일 수신 서버 과부하 등의 이유로 일시적으로 메일 수신 처리가 불가한 경우)';
  }
  else if (code == '3F'){
    returnMsg = '치환값 없음(이메일 제목이나 본문 내에 치환할 변수(예:성명)가 있으나 변수를 치환할 값이 존재하지 않는 경우)';
  }
  else if (code == '3H' || code == '3L'){
    returnMsg = 'DNS Timeout (DNS 서버의 다운 등의 이유로 DNS 질의 응답을 수신하지 못하는 경우)';
  }
  else if (code == '3J'){
    returnMsg = '메시지가 금칙어를 포함하고 있음 (수신 서버에서 제한하는 금칙어를 메일 본문에 포함한 경우)';
  }
  else if (code == '3M'){
    returnMsg = 'Sender Denied (보내는 이 메일 주소가 스패머 리스트에 등록되어 차단되는 경우)';
  }
  else if (code == '3N' || code == '3P'){
    returnMsg = '서버 연결 거부 (송신 서버의 IP가 스팸 블랙리스트 등에 등록되어 수신서버가 연결을 차단하는 경우)';
  }
  else if (code == '3Q'){
    returnMsg = 'Too Many Session (수신서버 측이 허용한 세션보다 많은 연결을 시도하는 경우 또는 수신서버의 동시 최대 연결 세션이 초과된 경우)';
  }
  else if (code == '3T'){
    returnMsg = '수신 서버의 스팸 탐지 로직에 양성 반응을 하여 스팸으로 처리됨';
  }
  else if (code == '3U'){
    returnMsg = '메일링크 캐시(포인트) 부족';
  }
  else if (code == '39'){
    returnMsg = '기타 시스템 에러';
  }
  else if (code == '42'){
    returnMsg = '존재하지 않는 사용자';
  }
  else if (code == '43'){
    returnMsg = '부적절한 메일 주소 (이메일 주소의 문법 오류)';
  }
  else if (code == '44'){
    returnMsg = '휴면 계정 (대형 포탈의 경우 대부분 2개월 이상 로그인 기록이 없는 경우)';
  }
  else if (code == '45'){
    returnMsg = 'Unserviceable Domain(intizen.com, sayclub.com등 과거에는 이메일 서비스를 제공하였으나 사업정리 등의 이유로 더 이상 메일 서비스를 제공하지 않는 도메인인 경우)';
  }
  return returnMsg;
}

module.exports = router;
