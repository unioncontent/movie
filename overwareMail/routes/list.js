var express = require('express');
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

module.exports = router;
