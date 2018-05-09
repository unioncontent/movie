var express = require('express');
var router = express.Router();
// DB module
var user = require('../models/user.js');
var mailListA = require('../models/mailListA.js');
var mailListC = require('../models/mailListC.js');


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
  res.render('user',data);
});

router.get('/add',isAuthenticated,function(req, res, next) {
  res.render('userAdd');
});

async function getListPageData(idx,param){
  var data = {
    list:[],
    listCount:{total:0},
    page:1
  };
  var limit = 20;
  var searchParam = [idx,idx,0,limit];
  var currentPage = 1;
  var searchBody = {
    'order': 'n_idx'
  };
  if (typeof param.page !== 'undefined') {
    currentPage = param.page;
    data['page'] = currentPage;
  }
  if (parseInt(currentPage) > 0) {
    searchParam[2] = (currentPage - 1) * limit
    data['offset'] = searchParam[2];
  }

  try{
    data['list'] = await user.selectTable(searchBody,searchParam);
    data['listCount'] = await user.selectTableCount(searchBody,searchParam);
    data['currentPage'] = currentPage;
  }
  catch(e){
    console.log('e');
  }
  return data;
}

router.post('/update',isAuthenticated,async function(req, res) {
  try{
    var updateMail = await user.update(req.body);
    res.send({status:true});
  }
  catch(e){
    res.status(500).send(e);
  }
});

router.post('/delete',isAuthenticated,async function(req, res) {
  try{
    await user.delete(req.body.idx);
    res.send({status:true});
  }
  catch(e){
    res.status(500).send(e);
  }
});

router.post('/add',isAuthenticated,async function(req, res) {
  try{
    var param = {
      user_type:2,
      user_admin:req.user.n_idx,
      user_id:req.body.id,
      user_pw:req.body.pw,
      user_name:req.body.name,
      company_name:req.body.company
    };
    await user.insert('m_mail_user',param);
    res.send({status:true});
  }
  catch(e){
    res.status(500).send(e);
  }
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

router.post('/add/idCheck',isAuthenticated,async function(req, res){
  try{
    var idCheck = await user.addIdCheck([req.body.id,req.user.n_idx,req.user.n_idx]);
    var result = {msg: (idCheck.length == 0) ? 'success':'fail'};
    res.send(result);
  }
  catch(e){
    res.status(500).send(e);
  }
});

module.exports = router;
