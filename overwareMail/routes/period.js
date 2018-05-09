var express = require('express');
var urlencode = require('urlencode');
var request = require('request');
var router = express.Router();
// DB module
var period = require('../models/period.js');
var keyword = require('../models/keyword.js');
var mailType = require('../models/mailType.js');
var mailDetailB = require('../models/mailDetailB.js');

var isAuthenticated = function (req, res, next) {
  if (req.isAuthenticated()){
    if(req.user.user_admin == null){
      return next();
    }
  }
  res.redirect('/login');
};

router.get('/',isAuthenticated,async function(req, res) {
  var data = await getListPageData(req.user.n_idx,req.query);
  data.klist = await keyword.selectMovieKwdAll(req.user.user_admin,req.user.n_idx) || [];
  data.tlist = await mailType.selectTable(req.user.user_admin,req.user.n_idx) || [];

  data.sDate = '';
  data.eDate = '';
  data.keyword = '';
  data.type = '';
  data.mType = '';
  res.render('period',data);
});

router.get('/download/:date/:fileName',isAuthenticated,async function(req, res) {
  console.log('/download/:date/:fileName = ',req.params);
  var filePath = '/public/uploads/files/'+req.params.date+'/'+req.params.fileName;
  // var fs = require('fs');
  // var file = fs.readFileSync(filePath);

  res.download(filePath); // Set disposition and send it.
});

router.post('/result',isAuthenticated,async function(req, res, next) {
  var data = await mailDetailB.selectTable(req.body);
  res.send({status:true,result:data});
});

router.post('/getPeriod',isAuthenticated,async function(req, res, next) {
  try{
    var data = {
      media:await mailDetailB.getMediaNReporterCount('P_title',req.body.M_idx_A),
      reporter:await mailDetailB.getMediaNReporterCount('P_name',req.body.M_idx_A),
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
    eDate: ''
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
