var express = require('express');
var router = express.Router();

var isAuthenticated = function (req, res, next) {
  if (req.isAuthenticated()){
    if(req.user.user_admin == null){
      return next();
    }
  }
  res.redirect('/login');
};

router.get('/send',async function(req, res) {
  res.render('newsclipping_email',data);
});

router.get('/period',isAuthenticated,async function(req, res) {
  var data = await getListPageData(req.user.n_idx,req.query);
  res.render('newsclipping_period',data);
});

router.get('/list',isAuthenticated,async function(req, res) {
  var data = await getListPageData(req.user.n_idx,req.query);
  res.render('newsclippin_list',data);
});

module.exports = router;
