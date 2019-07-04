const logger = require('../winston/config_f.js');
var express = require('express');
var router = express.Router();
// DB module
var keyword = require('../models/keyword.js');

var isAuthenticated = function (req, res, next) {
  var url = req.originalUrl;
  logger.info('page = '+url);
  if (req.isAuthenticated()){
    return next();
  }
  res.redirect('/login');
};

router.get('/',isAuthenticated,async function(req, res) {
  var data = await getListPageData(req.user.n_idx,req.query);
  res.render('keyword',data);
});

router.post('/getNextPage',isAuthenticated,async function(req, res) {
  try{
    var data = await getListPageData(req.user.n_idx,req.body);
    res.send({status:true,list:data});
  }
  catch(e){
    res.status(500).send(e);
  }
});

async function getListPageData(idx,param){
  var data = {
    list:[],
    listCount:0,
    page:1,
    keyword:''
  };
  var limit = 20;
  var searchParam = [idx,0,limit];
  var currentPage = 1;
  var searchBody = {};
  if (typeof param.keyword !== 'undefined') {
    searchBody['keyword'] = param.keyword;
    data['keyword'] = searchBody['keyword'];
  }
  if (typeof param.page !== 'undefined') {
    currentPage = param.page;
    data['page'] = currentPage;
  }
  if (parseInt(currentPage) > 0) {
    searchParam[1] = (currentPage - 1) * limit
    data['offset'] = searchParam[1];
  }

  try{
    data['list'] = await keyword.selectKwdList(searchBody,searchParam);
    data['listCount'] = await keyword.selectKwdListCount(searchBody,searchParam);
    data['currentPage'] = currentPage;
  }
  catch(e){
    logger.error(e);
  }
  return data;
}

router.post('/add/kwdCheck',isAuthenticated,async function(req, res){
  try{
    var kwdCheck = await keyword.addKwdCheck([req.body.kwd]);
    var result = {msg: (kwdCheck.length == 0) ? 'success':'fail'};
    res.send(result);
  }
  catch(e){
    res.status(500).send(e);
  }
});

router.post('/update',isAuthenticated,async function(req, res) {
  try{
    var result;
    if('state' in req.body){
      result = await keyword.updateState(req.body);
    }
    else{
      result = await keyword.update(req.body);
    }
    if('changedRow' in result){
      res.status(500).send(e);
      return false;
    }
    res.send({status:true});
  }
  catch(e){
    res.status(500).send(e);
  }
});

router.post('/delete',isAuthenticated,async function(req, res) {
  try{
    var result = await keyword.delete(req.body.idx);
    if('changedRow' in result){
      res.status(500).send(e);
      return false;
    }
    res.send({status:true});
  }
  catch(e){
    res.status(500).send(e);
  }
});

router.post('/add',isAuthenticated,async function(req, res) {
  try{
    var param = {
      user_idx:req.user.n_idx,
      keyword_property:req.body.property,
      keyword_main:req.body.keyword
    };
    await keyword.insert('m_keyword_data',param);
    res.send({status:true});
  }
  catch(e){
    res.status(500).send(e);
  }
});

module.exports = router;
