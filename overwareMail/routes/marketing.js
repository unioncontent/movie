var express = require('express');
var router = express.Router();
// DB module
var marketing = require('../models/marketing.js');
var keyword = require('../models/keyword.js');

var isAuthenticated = function (req, res, next) {
  if (req.isAuthenticated()){
    if(req.user.n_idx == 30){
      return next();
    }
  }
  res.redirect('/login');
};

async function asyncForEach(array, callback) {
  for (var index = 0; index < array.length; index++) {
    var done = await callback(array[index], index, array);
    if(done == false){
      break;
    }
  }
}

// 페이스북 선택 페이지
router.get('/facebook/:id',isAuthenticated,async function(req, res) {
  var data = await getFacebookListPageData(req.params.id,req.query);
  res.render('marketing_facebook',data);
});

router.post('/facebook/getNextPage',isAuthenticated,async function(req, res, next) {
  try{
    var data = await getFacebookListPageData(req.body.writer,req.body);
    res.send({status:true,result:data});
  } catch(e){
    res.status(500).send(e);
  }
});

async function getFacebookListPageData(writer,param){
  var data = {
    list:[],
    listCount:{total:0},
    sDate: formatDate(new Date(Date.now() - 1 * 24 * 3600 * 1000)),
    eDate: formatDate(new Date()),
    writer: writer,
    search: ''
  };
  var limit = 10;
  var searchParam = [0,limit];
  var currentPage = 1;
  var searchBody = {};
  if (typeof param.page !== 'undefined') {
    currentPage = param.page;
  }
  if (parseInt(currentPage) > 0) {
    searchParam[0] = (currentPage - 1) * limit
    data['offset'] = searchParam[0];
  }
  if (typeof param.sDate !== 'undefined' && typeof param.eDate !== 'undefined') {
    searchBody['sDate'] = param.sDate;
    searchBody['eDate'] = param.eDate;
    data['sDate'] = param.sDate;
    data['eDate'] = param.eDate;
  }else{
    searchBody['sDate'] = data.sDate;
    searchBody['eDate'] = data.eDate;
  }
  if (typeof param.search !== 'undefined') {
    searchBody['search'] = param.search.replace(/'/gi,"''").replace(/[?]/gi,"");
    data['search'] = param.search;
  }
  if (typeof writer !== '') {
    if(writer == 'LOTTE'){
      searchBody['writer'] = '롯데시네마';
    }
    else if(writer == 'MEGABOX'){
      searchBody['writer'] = '메가박스';
    }
    else if(writer == 'BANGWOOL'){
      searchBody['writer'] = '방울방울';
    }
    else{
      searchBody['writer'] = 'CGV';
    }
    data['writer'] = writer;
  }
  try{
    data['list'] = await marketing.selectFacebookTable(searchBody,searchParam);
    data['listCount'] = await marketing.selectFacebookTableCount(searchBody,searchParam);
    data['currentPage'] = currentPage;
  }
  catch(e){
    console.log('e');
  }
  return data;
}

router.post('/add',isAuthenticated,async function(req, res, next) {
  try{
    var list = JSON.parse(req.body.list);
    await asyncForEach(list, async (item, index, array) => {
      var param = item;
      try{
        await marketing.insertSNS(param);
      }
      catch(err){
        console.log(err);
      }
    });
    res.send({status:true});
  } catch(e){
    res.status(500).send(e);
  }
});

// 네이버 무비 선택 페이지
router.get('/naver',isAuthenticated,async function(req, res) {
  var data = await getNaverListPageData(req.query);
  res.render('marketing_naver',data);
});

router.post('/naver/getNextPage',isAuthenticated,async function(req, res, next) {
  try{
    var data = await getNaverListPageData(req.body);
    res.send({status:true,result:data});
  } catch(e){
    res.status(500).send(e);
  }
});

async function getNaverListPageData(param){
  var data = {
    list:[],
    listCount:{total:0},
    sDate: formatDate(new Date(Date.now() - 1 * 24 * 3600 * 1000)),
    eDate: formatDate(new Date()),
    search: ''
  };
  var limit = 10;
  var searchParam = [0,limit];
  var currentPage = 1;
  var searchBody = {};
  if (typeof param.page !== 'undefined') {
    currentPage = param.page;
  }
  if (parseInt(currentPage) > 0) {
    searchParam[0] = (currentPage - 1) * limit
    data['offset'] = searchParam[0];
  }
  if (typeof param.sDate !== 'undefined' && typeof param.eDate !== 'undefined') {
    searchBody['sDate'] = param.sDate;
    searchBody['eDate'] = param.eDate;
    data['sDate'] = param.sDate;
    data['eDate'] = param.eDate;
  }else{
    searchBody['sDate'] = data.sDate;
    searchBody['eDate'] = data.eDate;
  }
  if (typeof param.search !== 'undefined') {
    searchBody['search'] = param.search.replace(/'/gi,"''").replace(/[?]/gi,"");
    data['search'] = param.search;
  }
  try{
    data['list'] = await marketing.selectNaverTable(searchBody,searchParam);
    data['listCount'] = await marketing.selectNaverTableCount(searchBody,searchParam);
    data['currentPage'] = currentPage;
  }
  catch(e){
    console.log('e');
  }
  return data;
}

router.post('/naver/add',isAuthenticated,async function(req, res, next) {
  try{
    var list = JSON.parse(req.body.list);
    await asyncForEach(list, async (item, index, array) => {
      var param = item;
      try{
        await marketing.insertPortal(param);
      }
      catch(err){
        console.log(err);
      }
    });
    res.send({status:true});
  } catch(e){
    res.status(500).send(e);
  }
});

// 선택 마케팅 리스트 페이지
router.get('/list',isAuthenticated,async function(req, res) {
  var data = await getListPageData(req.query);
  res.render('marketing_list',data);
});

router.post('/list/getNextPage',isAuthenticated,async function(req, res, next) {
  try{
    var data = await getListPageData(req.body);
    res.send({status:true,result:data});
  } catch(e){
    res.status(500).send(e);
  }
});

router.post('/list/insert',isAuthenticated,async function(req, res, next) {
  try{
    await marketing.insert(req.body.table,req.body);
    res.send({status:true});
  } catch(e){
    res.status(500).send(e);
  }
});

router.post('/list/delete',isAuthenticated,async function(req, res, next) {
  try{
    await marketing.delete(req.body.table,req.body.idx);
    res.send({status:true});
  } catch(e){
    res.status(500).send(e);
  }
});

router.post('/list/update',isAuthenticated,async function(req, res, next) {
  try{
    await marketing.update(req.body.table,[req.body.title,req.body.date,req.body.idx]);
    res.send({status:true});
  } catch(e){
    res.status(500).send(e);
  }
});

function formatDate(d) {
  var month = '' + (d.getMonth() + 1),
  day = '' + d.getDate(),
  year = d.getFullYear();
  if (month.length < 2)
    month = '0' + month;
  if (day.length < 2)
    day = '0' + day;
  return [year, month, day].join('-');
}

async function getListPageData(param){
  var data = {
    list:[],
    listCount:{total:0},
    sDate: formatDate(new Date(Date.now() - 1 * 24 * 3600 * 1000)),
    eDate: formatDate(new Date()),
    search : '',
    page: 1
  };
  var limit = 10;
  var searchParam = [0,limit];
  var currentPage = 1;
  var searchBody = {};
  if (typeof param.page !== 'undefined') {
    currentPage = param.page;
    data['page'] = currentPage;
  }
  if (parseInt(currentPage) > 0) {
    searchParam[0] = (currentPage - 1) * limit
    data['offset'] = searchParam[0];
  }
  if (typeof param.search !== 'undefined') {
    searchBody['search'] = param.search.replace(/'/gi,"''").replace(/[?]/gi,"");
    data['search'] = param.search;
  }
  if (typeof param.sDate !== 'undefined' && typeof param.eDate !== 'undefined') {
    searchBody['sDate'] = param.sDate;
    searchBody['eDate'] = param.eDate;
    data['sDate'] = param.sDate;
    data['eDate'] = param.eDate;
  }else{
    searchBody['sDate'] = data.sDate;
    searchBody['eDate'] = data.eDate;
  }
  try{
    data['list'] = await marketing.selectMarketingTable(searchBody,searchParam);
    data['listCount'] = await marketing.selectMarketingTableCount(searchBody,searchParam);
  }
  catch(e){
    console.log('e');
  }
  return data;
}


module.exports = router;
