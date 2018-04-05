const DBpromise = require('../db/db_info.js');

/*
 메일 타입 테이블 - m_mail_type
*/

var mailType = {
  selectTable: async function(){
    var sql = 'SELECT * FROM m_mail_type where M_id=?';
    return await getResult(sql,['1']);
  }
}

async function getResult(sql,param) {
  var db = new DBpromise();
  try{
    return await db.query(sql,param);
  } catch(e){
    console.log(e);
    return [];
  } finally{
    db.close();
  }
}

module.exports = mailType;
