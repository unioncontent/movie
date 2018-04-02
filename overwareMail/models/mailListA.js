const DBpromise = require('../db/db_info.js');

/*
 전체 메일 리스트 테이블 - m_mail_list_all
 View 테이블 - mail_list_all_view
*/

var mailListAll = {
  selectAll: function(search,callback){
    var sql = 'select * from mail_list_all_view where search like \'%'+search+'%\'';
    var db = new DBpromise();
    db.query(sql)
    .then(rows => {
      return callback(null,rows);
    })
    .then(rows => {
      console.log('db.close');
      db.close();
    })
    .catch(function (err) {
      console.log('Error : ',err);
      db.close();
      return callback(err,null);
    });
  }
}

module.exports = mailListAll;
