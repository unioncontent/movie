var express = require('express');
var router = express.Router();
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
    M_type: req.body['M_type'],
    M_body: req.body['M_body'],
    M_subject: '[날짜] 일일 주요 뉴스',
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

      await nMailAll.delete(mailAllParam['n_idx']);
      await nMailDetailB.delete(mailAllParam['n_idx']);
    }
  }
  // 메일발송 리스트 insert
  var resultInsert = await nMailAll.insert(mailAllParam);
  m_idx_a = resultInsert.insertId;
  // 메일발송 리스트 table에 inser되었는지 체크문
  var insertCheck = false;
  // 메일발송 상세정보 insert
  if(m_idx_a){
    /* 추가 */
    if(typeof req.body.end_reserve_time !='undefined'){
      try{
        var result = await maillinkInsert({idx:m_idx_a,time:req.body.end_reserve_time,user:req.user});
        console.log(result);
        if(result){
          throw new Error('maillink insert 실패');
        }
      }
      catch(e){
        console.log(e);
        insertCheck = true;
        await maillink.deleteMlAMSG(m_idx_a);
        await maillink.deleteMlAT(m_idx_a);
        var resultTName = await maillink.selectMailTableName();
        await asyncForEach(resultTName, async (item, index, array) => {
          await maillink.deleteMlABackUp(item.TABLE_NAME,m_idx_a);
        });
      }
    }
    /* 추가 */
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
            P_name : recipiInfo[0].M_name
          };
          try{
            if(typeof req.body.end_reserve_time !='undefined'){
              mailDetailParam['M_send'] = req.body.end_reserve_time;
            }
            var resultInsert = await nMailDetailB.insert(mailDetailParam);
            console.log(resultInsert);
          }
          catch(e){
            if(typeof req.body.end_reserve_time !='undefined'){
              await maillink.deleteMlAMSG(m_idx_a);
              await maillink.deleteMlAT(m_idx_a);
              var resultTName = await maillink.selectMailTableName();
              await asyncForEach(resultTName, async (item, index, array) => {
                await maillink.deleteMlABackUp(item.TABLE_NAME,m_idx_a);
              });
            }
            await nMailAll.delete(m_idx_a);
            insertCheck = true;
          }
        }
        else {
          await nMailAll.delete(m_idx_a);
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
      await nMailDetailB.updateSendDateResult(req.body.idx);
      res.send({status:true});
    }
    else{
      res.status(500).send('메일 발송에 실패했습니다.');
    }
  },5000);
});

async function settingMailBody(bodyHtml,keyword,idx,num){
  // 메일이 안보이면 텍스트 추가
  var htmlMsg = '<table width="750" align="center" cellpadding="0" cellspacing="0" style="padding: 20px;"><tbody><tr><td align="center" style="font-size: 15px; font-weight: bold;" class="fix">[ 메일 본문이 깨져 보이면 <a href=\"http://showbox.email/preview?keyword='+keyword+'&idx='+idx+'\" target=\"_blank\" style=\"font-family: 맑은고딕,malgungothic,돋움,dotum;\">여기</a>를 눌러 주세요 ]</td></tr></tbody></table>';
  return htmlMsg+bodyHtml+htmlMsg;
}

async function maillinkInsert(req){
  console.log('maillinkInsert');
  var dt = datetime.create();
  var now = dt.format('Y-m-d H:M:S');
  // 보낼 메일 data 가져오기
  var result = await nMailAll.getEmailData(req.idx);
  if(result.length == 0){
    return true;
  }
  var mailData = result[0];

  if('type' in req){
    if(req.type == 'resend'){
      // 0. 재발송 하기전 데이터 삭제
      await maillink.deleteMlAMSG(mailData.n_idx);
      await maillink.deleteMlAT(mailData.n_idx);
      var resultTName = await maillink.selectMailTableName();
      await asyncForEach(resultTName, async (item, index, array) => {
        await maillink.deleteMlABackUp(item.TABLE_NAME,mailData.n_idx);
      });
    }
  }

  // 'body': await settingMailBody(mailData.M_body,mailData.M_keyword,mailData.n_idx),
  var queryParams = {
    'MSGID':mailData.n_idx,
    'CONTENT':await settingMailBody(mailData.M_body,mailData.M_keyword,mailData.n_idx),
    'STATUS':'1',
    'GENDATE':now
  };
  await maillink.insert('ML_AUTOMAIL_MESSAGE',queryParams);
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
    console.log('groupArr:',groupArr);
    var groupArr2 = groupArr.concat(recipiArr);
    console.log('groupArr2:',groupArr2);
    var uniqArray = Array.from(new Set(groupArr2));
    console.log('uniqArray:',uniqArray);
    recipients = await mailListA.getOneEmail2(uniqArray);
  }
  else{
    recipients = await mailListA.getOneEmail2(recipiArr);
  }
  console.log('recipient:',recipients);
  await asyncForEach(recipients, async (item, index, array) => {
    var param = {
      'AUTOMAILID':'AU-4126512',
      'CHANNEL':'1',
      'EMSUBJECT':mailData.M_subject,
      'EMFROMNAME':sender[0],
      'EMFROMADDRESS':sender[1],
      'EMTONAME':item[0],
      'EMTOADDRESS':item[1],
      'SENDTIME':('time' in req) ? req.time : now,
      'GENDATE':now,
      // 'MODDATE':now,
      'MSGID':mailData.n_idx
    };
    console.log(index+'번');
    await maillink.insert('ml_automail_tran',param);
  });
}

async function asyncForEach(array, callback) {
  for (var index = 0; index < array.length; index++) {
   var done = await callback(array[index], index, array);
    if(done == false){
     break;
    }
  }
}

router.get('/period',isAuthenticated,async function(req, res) {
  res.render('newsclipping_period');
});

router.get('/list',isAuthenticated,async function(req, res) {
  res.render('newsclippin_list');
});

module.exports = router;
