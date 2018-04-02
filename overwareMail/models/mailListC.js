const DBpromise = require('../db/db_info.js');

/*
 메일 그룹 리스트 테이블 - m_mail_list_c
 View 테이블 - mail_list_group_view
*/

var mailListC = {
  selectAll: function(search,callback){
    var sql = 'SELECT M_ID,M_group_title,count(*) as groupCount FROM mail_list_group_view where search like \'%'+search+'%\' group by M_group_title';
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

module.exports = mailListC;
