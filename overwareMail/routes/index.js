var express = require('express');
var router = express.Router();
// DB module
var period = require('../models/period.js');

router.get('/', async function(req, res, next) {
  var data = [];
  try{
    data = await period.getYesterday();
  }
  catch(err){
    console.log(err);
  }
  res.render('index',{
    list:data
  });
});

router.post('/7DayGraph', async function(req, res, next) {
  try{
    var data = await period.get7DayGraph();
    res.send(data);
  }
  catch(err){
    res.status(500).send('다시 시도해주세요.');
  }
});

router.get('/login', function(req, res, next) {
  // , message : req.flash('loginMessage')
  res.render('login', {layout: false, message : ''});
});

module.exports = router;
