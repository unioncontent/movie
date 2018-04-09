var express = require('express');
// DB module
var user = require('../models/user.js');

var router = express.Router();

router.get('/', function(req, res, next) {
  res.render('list');
});

router.get('/group', function(req, res, next) {
  res.render('listGroup');
});

router.get('/add', function(req, res, next) {
  res.render('listAdd');
});

router.post('/add/list',async function(req,res,next){
  var userParam = [0,10];
  var userList = await user.selectReporter(userParam);
  res.send('add');
});

router.post('/add/emailCheck',async function(req,res,next){
  var emailParam = [req.body.search];
  var emailCheck = await user.emailCheck(emailParam);
  res.send(emailCheck);
});

module.exports = router;
