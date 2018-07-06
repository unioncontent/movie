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
// 페이스북 선택 페이지
router.get('/facebook/:id',isAuthenticated,async function(req, res) {
  var data = await getFacebookListPageData(req.params.id,req.query);
  // data.klist = await marketing.selectMovieKwdAll(req.user.user_admin,req.user.n_idx) || [];
  data.sDate = '';
  data.eDate = '';
  data.writer = req.params.id;
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
    sDate: '',
    eDate: '',
    writer: ''
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
      console.log(item);
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

async function asyncForEach(array, callback) {
  for (var index = 0; index < array.length; index++) {
   var done = await callback(array[index], index, array);
    if(done == false){
     break;
    }
  }
}

// 선택 마케팅 리스트 페이지
router.get('/list',isAuthenticated,async function(req, res) {
  var data = await getListPageData2(req.user.user_admin,req.query);
  data.klist = await keyword.selectMovieKwdAll(req.user.user_admin,req.user.n_idx) || [];
  data.sDate = '';
  data.eDate = '';
  data.keyword = '';
  res.render('newsList',data);
});

router.post('/list/getNextPage',isAuthenticated,async function(req, res, next) {
  try{
    var data = await getListPageData2(req.user.user_admin,req.body);
    res.send({status:true,result:data});
  } catch(e){
    res.status(500).send(e);
  }
});

router.post('/list/insert',isAuthenticated,async function(req, res, next) {
  try{
    await newsclipping.insert2(req.body);
    res.send({status:true});
  } catch(e){
    res.status(500).send(e);
  }
});

router.post('/list/delete',isAuthenticated,async function(req, res, next) {
  try{
    await newsclipping.delete(req.body.idx);
    res.send({status:true});
  } catch(e){
    res.status(500).send(e);
  }
});

router.post('/list/update',isAuthenticated,async function(req, res, next) {
  try{
    await newsclipping.update(req.body.news_detail,[req.body.thumbnail,req.body.news_type,req.body.idx]);
    res.send({status:true});
  } catch(e){
    res.status(500).send(e);
  }
});

async function getListPageData2(idx,param){
  var data = {
    list:[],
    listCount:{total:0},
    sDate: '',
    eDate: '',
    keyword: '',
    page: 1
  };
  var limit = 10;
  var searchParam = [idx,0,limit];
  var currentPage = 1;
  var searchBody = {};
  if (typeof param.page !== 'undefined') {
    currentPage = param.page;
    data['page'] = currentPage;
  }
  if (parseInt(currentPage) > 0) {
    searchParam[1] = (currentPage - 1) * limit
    data['offset'] = searchParam[1];
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
  try{
    data['list'] = await newsclipping.selectNewsMailTable(searchBody,searchParam);
    data['listCount'] = await newsclipping.selectNewsMailTableCount(searchBody,searchParam);
    data['currentPage'] = currentPage;
  }
  catch(e){
    console.log('e');
  }
  return data;
}


module.exports = router;
