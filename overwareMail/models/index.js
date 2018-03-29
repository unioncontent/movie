const promise = require('../db/db_info.js');

var DashBoard = {
  get24DataList: function(callback){
    var sql = "call 24Data();"
    var DBpromise = new promise(global.osp);
    DBpromise.query(sql)
    .then(rows => {
      return callback(null,rows);
    })
    .then(rows => {
      DBpromise.close();
    })
    .catch(function (err) {
      return callback(err,null);
    });
  }
}

module.exports = DashBoard;
