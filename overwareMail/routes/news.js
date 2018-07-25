var express = require('express');
var router = express.Router();
// DB module
var newsclipping = require('../models/newsclipping.js');
var keyword = require('../models/keyword.js');

var isAuthenticated = function (req, res, next) {
  if (req.isAuthenticated()){
    if(req.user.n_idx == 30){
      return next();
    }
  }
  res.redirect('/login');
};

function is_number(v) {
  var reg = /^(\s|\d)+$/;
  return reg.test(v);
}

async function getKeyDic(type){
  var dic = {};
  var keyArr = await newsclipping.selectKeywordMailTable(type);
  keyArr.forEach(function(ele) {
    if(ele.k_main!= ''){
      ele.k_main = ele.k_main;
      if(!(ele.k_main in dic)){
        dic[ele.k_main] = [ele.k_sub];
      }
      else{
        dic[ele.k_main].push(ele.k_sub);
      }
    }
    else{
      if(!('none' in dic)){
        dic['none'] = [ele.k_sub];
      }
      else{
        dic['none'].push(ele.k_sub);
      }
    }
  });
  return dic;
}

// 기사 선택 페이지
router.get('/',isAuthenticated,async function(req, res) {
  var data = await getListPageData(req.user.user_admin,req.query);
  data.klist = await keyword.selectMovieKwdAll(req.user.user_admin,req.user.n_idx) || [];
  res.render('news',data);
});

router.post('/getNextPage',isAuthenticated,async function(req, res, next) {
  try{
    var data = await getListPageData(req.user.user_admin,req.body);
    res.send({status:true,result:data});
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

async function getListPageData(idx,param){
  var data = {
    list:[],
    listCount:{total:0},
    sDate: formatDate(new Date(Date.now() - 1 * 24 * 3600 * 1000)),
    eDate: formatDate(new Date()),
    limit: 30,
    keyword: '',
    search: '',
    search2: '',
    type: '',
    page: ''
  };
  var currentPage = 1;
  var searchBody = {};
  if (typeof param.limit !== 'undefined') {
    searchBody['limit'] = Number(param.limit);
    data['limit'] = Number(param.limit);
  }
  var searchParam = [idx,0,data.limit];
  if (typeof param.page !== 'undefined') {
    currentPage = param.page;
  }
  if (parseInt(currentPage) > 0) {
    searchParam[1] = (currentPage - 1) * data['limit']
    data['offset'] = searchParam[1];
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
  if (typeof param.keyword !== 'undefined') {
    searchBody['keyword'] = param.keyword;
    data['keyword'] = param.keyword;
  }
  if (typeof param.search !== 'undefined') {
    searchBody['search'] = param.search;
    data['search'] = param.search;
  }
  if(typeof param.search_b !== 'undefined') {
    searchBody['search_b'] = param.search_b;
    data['search2'] = param.search_b;
  }
  if (typeof param.type !== 'undefined') {
    searchBody['type'] = param.type;
    data['type'] = param.type;
  }
  data['page'] = currentPage;
  try{
    data['list'] = await newsclipping.selectMediaTable(searchBody,searchParam);
    data['listCount'] = await newsclipping.selectMediaTableCount(searchBody,searchParam);
    // if(data['type'] == ''){
    //    data['list'] = await newsclipping.selectMediaTable(searchBody,searchParam,await newsclipping.selectKeywordMailTable(''));
    //    data['listCount'] = await newsclipping.selectMediaTableCount(searchBody,searchParam);
    // }
    // else{
    //   const keySetting = async () => {
    //     var keywordSql = 'and (';
    //     var resultDic = await getKeyDic('1');
    //     var length = Object.keys( resultDic ).length;
    //     await asyncForEach(Object.keys( resultDic ), async (key, idx, arr) => {
    //       if(key != 'none'){
    //         keywordSql += "(media_title like '%"+key+"%' or (media_title regexp '"+resultDic[key].join('|')+"'))";
    //       }
    //       else{
    //         keywordSql += "(media_title regexp '"+resultDic[key].join('|')+"')";
    //       }
    //       if(idx != (length-1)){
    //         keywordSql += " or ";
    //       }
    //     });
    //     keywordSql += ")";
    //     data['list'] = await newsclipping.selectMediaTable2(searchBody,searchParam,keywordSql);
    //     data['listCount'] = await newsclipping.selectMediaTableCount2(searchBody,searchParam,keywordSql);
    //   }
    //   await keySetting();
    // }
    data['currentPage'] = currentPage;
  }
  catch(e){
    console.log('e');
  }
  return data;
}

router.post('/addNews',isAuthenticated,async function(req, res, next) {
  try{
    var list = JSON.parse(req.body.list);
    await asyncForEach(list, async (item, index, array) => {
      var param = item;
      console.log(item);
      try{
        await newsclipping.insert(param.detail,[param.date,param.code,param.idx,param.idx]);
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

router.post('/grouping',isAuthenticated,async function(req, res, next) {
  try{
    var list = JSON.parse(req.body.list);
    var result = await newsclipping.selectMediaTable2(req.body,list);
    // console.log(result);
    res.send({status:true,result:result});
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

// 선택 기사 리스트 페이지
router.get('/list',isAuthenticated,async function(req, res) {
  var data = await getListPageData2(req.user.user_admin,req.query);
  data.klist = await keyword.selectMovieKwdAll(req.user.user_admin,req.user.n_idx) || [];
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
    await newsclipping.update(req.body.news_detail,[req.body.date,req.body.news_type,req.body.idx]);
    res.send({status:true});
  } catch(e){
    res.status(500).send(e);
  }
});

async function getListPageData2(idx,param){
  var data = {
    list:[],
    listCount:{total:0},
    sDate: formatDate(new Date(Date.now() - 1 * 24 * 3600 * 1000)),
    eDate: formatDate(new Date()),
    search: '',
    keyword: '',
    type: '',
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
  if (typeof param.type !== 'undefined') {
    searchBody['type'] = param.type;
    data['type'] = param.type;
  }
  if (typeof param.sDate !== 'undefined' && typeof param.eDate !== 'undefined') {
    searchBody['sDate'] = param.sDate;
    searchBody['eDate'] = param.eDate;
    data['sDate'] = param.sDate;
    data['eDate'] = param.eDate;
  } else{
    searchBody['sDate'] = data.sDate;
    searchBody['eDate'] = data.eDate;
  }
  if (typeof param.keyword !== 'undefined') {
    searchBody['keyword'] = param.keyword;
    data['keyword'] = param.keyword;
  }
  if (typeof param.search !== 'undefined') {
    searchBody['search'] = param.search;
    data['search'] = param.search;
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
