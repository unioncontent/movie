let funDB = require('../db/db_fun.js');
/*
 메일 타입 테이블 - m_mail_type
*/

var mailType = {
  selectTable: async function(admin,param){
    if(admin != null){
      param = admin;
    }
    // showbox = 1
    param = 1;
    var sql = 'SELECT * FROM m_mail_type where M_id=?';
    return await funDB.getResult('d',sql,param);
  }
}

module.exports = mailType;
