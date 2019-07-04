const logger = require('../winston/config_f.js');
var express = require('express');
var urlencode = require('urlencode');
var request = require('request');
var router = express.Router();
// DB module
var maillink = require('../models/maillink.js');
var period = require('../models/period.js');
var keyword = require('../models/keyword.js');
var mailType = require('../models/mailType.js');

var isAuthenticated = function (req, res, next) {
  var url = req.originalUrl;
  logger.info('page = '+url);
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
    logger.info('getPeriod:',req.body);
    // var mediaNReporterCount = await period.getPeriodMediaNReporterCount(req.body);
    // var data = {
    //   media:mediaNReporterCount.media_c,
    //   reporter:mediaNReporterCount.reporter_c,
    //   newsCount:await period.getNewsCount(req.body),
    //   replyCount:await period.getReplyCount(req.body)
    // };
    var mediaNReporterCount = await period.call_mail_detail(req.body.M_module,[1,req.body.M_idx_A,req.body.keyword,req.body.sDate]);
    var data = {
      media:mediaNReporterCount.media_c,
      reporter:mediaNReporterCount.reporter_c,
      newsCount:await period.call_mail_detail(req.body.M_module,[2,req.body.M_idx_A,req.body.keyword,req.body.sDate]),
      replyCount:await period.call_mail_detail(req.body.M_module,[3,req.body.M_idx_A,req.body.keyword,req.body.sDate])
    };
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
  logger.info('period-getListPageData');
  var datetime = require('node-datetime');
  var dt = datetime.create();
  var end = dt.format('Y-m-d');
  dt.offsetInDays(-7);
  var start = dt.format('Y-m-d');

  var data = {
    list:[],
    listCount:{total:0},
    sDate: '',
    eDate: '',
    keyword: '',
    type: '',
    mType: '',
    ivt:'',
    module:'2',
    sDate:start,
    eDate:end
  };
  var limit = 20;
  var searchParam = ['','','','','','',idx,0,limit];
  // var searchParam = [idx,idx,0,limit];
  var currentPage = 1;
  var searchBody = {};
  if (typeof param.page !== 'undefined') {
    currentPage = param.page;
  }
  if (parseInt(currentPage) > 0) {
    searchParam[7] = (currentPage - 1) * limit
    data['offset'] = searchParam[7];
    // searchParam[2] = (currentPage - 1) * limit
    // data['offset'] = searchParam[2];
  }
  if (typeof param.sDate !== 'undefined' && typeof param.eDate !== 'undefined') {
    // searchBody['sDate'] = param.sDate;
    // searchBody['eDate'] = param.eDate;
    searchParam[0] = param.sDate;
    searchParam[1] = param.eDate;
    data['sDate'] = param.sDate;
    data['eDate'] = param.eDate;
  } else{
    searchParam[0] = data.sDate;
    searchParam[1] = data.eDate;
  }
  if (typeof param.keyword !== 'undefined') {
    // searchBody['keyword'] = param.keyword;
    searchParam[2] = param.keyword;
    searchParam[7] = 0;
    searchParam[8] = 0;
    data['keyword'] = param.keyword;
  }
  if (typeof param.ivt !== 'undefined') {
    // searchBody['ivt'] = param.ivt;
    searchParam[3] = param.ivt;
    data['ivt'] = param.ivt;
  }
  if (typeof param.type !== 'undefined') {
    // searchBody['type'] = param.type;
    searchParam[4] = param.type;
    data['type'] = param.type;
  }
  if (typeof param.mType !== 'undefined') {
    // searchBody['mType'] = param.mType;
    searchParam[5] = param.mType;
    data['mType'] = param.mType;
  }
  if (typeof param.module !== 'undefined') {
    data['module'] = param.module;
  }
  try{
    // data['list'] = await period.selectView(searchBody,searchParam);
    // data['listCount'] = await period.selectViewCount(searchBody,searchParam);
    var result = [];
    if(data.module == '1'){
      result = await period.call_stats(searchParam);
    } else if(data.module == '2'){
      result = await period.call_stats2(searchParam);
    }
    data['list'] = (result.length > 0)? result[0]:[];
    data['listCount'] = (result.length > 0)? result[1][0].total:0;
    data['currentPage'] = currentPage;
  }
  catch(e){
    logger.error('통계에러 : ',e);
  }
  return data;
}

// 메일 관련 기능
// 첨부파일 삭제
router.get('/removeDir/:date',isAuthenticated,async function(req, res) {
  var fs = require('fs-extra');
  var filePath = __dirname +'/home/overwareMail/public/uploads/files/'+req.params.date;
  try {
    fs.removeSync(filePath);
    res.send('success!');
  } catch (err) {
    console.error(err)
  }
});
// 첨부파일 다운로드
router.get('/download/:date/:fileName',async function(req, res) {
  logger.info('fileName = '+req.params.fileName);
  logger.info('date = '+req.params.date);

  var filePath = __dirname.replace('/routes','') +'/public/uploads/files/'+req.params.date;
  logger.info('filePath = '+filePath);
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

module.exports = router;
