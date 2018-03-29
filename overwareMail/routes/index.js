var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index');
});

router.get('/login', function(req, res, next) {
  // , message : req.flash('loginMessage')
  res.render('login', {layout: false, message : ''});
});

module.exports = router;
