var express = require('express');
// DB module
var content = require('../models/content.js');
var router = express.Router();

router.get('/preview',async function(req, res) {
  var viewCode = await content.selectView(req.query);
  delete req.query.idx;
  var lastNews = await content.selectView(req.query);
  var lastNewsCount = await content.selectViewCount(req.query);
  // res.render('preview',{
  //   layout: false,
  //   veiw:viewCode,
  //   lastView:lastNews,
  //   lastCount:lastNewsCount
  // });
  res.render('preview',{layout: false});
});

router.get('/', function(req, res, next) {
  console.log(preview);
  res.render('preview', {layout: false});
});

router.post('/', function(req, res, next) {
  console.log(preview);
  res.render('preview', {layout: false});
});

module.exports = router;
