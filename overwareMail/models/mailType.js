const DBpromise = require('../db/db_info.js');

/*
 메일 타입 테이블 - m_mail_type
*/

var mailType = {
  selectTable: async function(param){
    var sql = 'SELECT * FROM m_mail_type where M_id=?';
    return await getResult(sql,param);
  }
}

async function getResult(sql,param) {
  var db = new DBpromise();
  console.log(sql,param);
  try{
    return await db.query(sql,param);
  } catch(e){
    console.log('DB Error:',e);
    return [];
  } finally{
    db.close();
  }
}

module.exports = mailType;
