var express = require('express');
var urlencode = require('urlencode');
var request = require('request');
var router = express.Router();
// DB module
var maillink = require('../models/maillink.js');
var period = require('../models/period.js');
var keyword = require('../models/keyword.js');
var mailType = require('../models/mailType.js');
var mailDetailB = require('../models/mailDetailB.js');

var isAuthenticated = function (req, res, next) {
  if (req.isAuthenticated()){
    return next();
  }
  res.redirect('/login');
};

// 통계 페이지
router.get('/',isAuthenticated,async function(req, res) {
  var data = await getListPageData(req.user.n_idx,req.query);
  data.klist = await keyword.selectMovieKwdAll(req.user.user_admin,req.user.n_idx) || [];
  data.tlist = await mailType.selectTable(req.user.user_admin,req.user.n_idx) || [];
  res.render('period',data);
});

router.post('/getPeriod',isAuthenticated,async function(req, res, next) {
  try{
    console.log('getPeriod:',req.body);
    var mediaNReporterCount = await period.getPeriodMediaNReporterCount(req.body);
    var data = {
      media:mediaNReporterCount.media_c,
      reporter:mediaNReporterCount.reporter_c,
      newsCount:await period.getNewsCount(req.body),
      replyCount:await period.getReplyCount(req.body)
    };
    console.log(data);
    res.send({status:true,result:data});
  } catch(e){
    res.status(500).send(e);
  }
});

router.post('/getNextPage',isAuthenticated,async function(req, res, next) {
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
    sDate: '',
    eDate: '',
    keyword: '',
    type: '',
    mType: '',
    ivt:''
  };
  var limit = 20;
  var searchParam = [idx,idx,0,limit];
  var currentPage = 1;
  var searchBody = {};
  if (typeof param.page !== 'undefined') {
    currentPage = param.page;
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
  }
  if (typeof param.keyword !== 'undefined') {
    searchBody['keyword'] = param.keyword;
    data['keyword'] = param.keyword;
  }
  if (typeof param.ivt !== 'undefined') {
    searchBody['ivt'] = param.ivt;
    data['ivt'] = param.ivt;
  }
  if (typeof param.type !== 'undefined') {
    searchBody['type'] = param.type;
    data['type'] = param.type;
  }
  if (typeof param.mType !== 'undefined') {
    searchBody['mType'] = param.mType;
    data['mType'] = param.mType;
  }
  try{
    data['list'] = await period.selectView(searchBody,searchParam);
    data['listCount'] = await period.selectViewCount(searchBody,searchParam);
    data['currentPage'] = currentPage;
  }
  catch(e){
    console.log(e);
  }
  return data;
}

// 메일 관련 기능
// 첨부파일 삭제
router.get('/removeDir/:date',isAuthenticated,async function(req, res) {
  var fs = require('fs-extra');
  var filePath = __dirname +'/public/uploads/files/'+req.params.date;
  try {
    fs.removeSync(filePath);
    res.send('success!');
  } catch (err) {
    console.error(err)
  }
});
// 첨부파일 다운로드
router.get('/download/:date/:fileName',async function(req, res) {
  // console.log('/download/:date/:fileName = ',req.params);
  var filePath = __dirname.replace('\\routes','') +'/public/uploads/files/'+req.params.date;
  var fs = require('fs');
  var fileListLength = fs.readdirSync(filePath).length;
  var count = 1;
  if(fileListLength == 0){
    res.send('해당 날짜의 파일이 없습니다.');
    return false;
  }
  if(req.params.fileName.indexOf('.') == -1){
    var walk    = require('walk');
    var files   = [];

    // Walker options
    var walker  = walk.walk(filePath, { followLinks: false });

    walker.on('file', function(root, stat, next) {
        // Add this file to the list of files
        var sFileArr = stat.name.split('.');
        if(req.params.fileName == sFileArr[0]){
          filePath +='/'+stat.name;
          res.download(filePath); // Set disposition and send it.
          return false;
        }
        if(fileListLength == count){
          res.send('해당 파일이 삭제되었습니다.');
          return false;
        }
        count += 1;
        next();
    });
  }
  else{
    filePath +='/'+req.params.fileName;
    res.download(filePath); // Set disposition and send it.
  }
  // var file = fs.readFileSync(filePath);

});

router.post('/result',isAuthenticated,async function(req, res, next) {
  var data = await maillink.selectResultDetail(req.body);
  res.send({status:true,result:data});
});

// 메일 나라 로직
// 발송결과 측정 항목을 사용할 경우
// router.get('/result',function(req,res){
//   var pStr = '&username='+urlencode('unionc')+'&key='+urlencode('w4EzdnbOY3oypxO')+'&mail_id='+urlencode(212880);
//   var options = {
//     url: 'https://directsend.co.kr/index.php/api/mail_report_api',
//     method:'POST',
//     headers: {'Content-Type': 'application/x-www-form-urlencoded;'},
//     body: pStr
//   };
//   request(options, (error, response, body) => {
//     console.log(JSON.parse(response.body));
//     var html = JSON.parse(response.body).html;
//     res.send(html);
//   });
// });

module.exports = router;
