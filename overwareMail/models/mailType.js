const mysql = require('mysql');
const DBpromise = require('../db/db_info.js');
const logger = require('../winston/config_f.js');

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
    return await getResult(sql,param);
  }
}

async function getResult(sql,param) {
  var db = new DBpromise();
  logger.info(mysql.format(sql, param)+';');
  try{
    return await db.query(sql,param);
  } catch(e){
    logger.error('DB Error:',e);
    return [];
  } finally{
    db.close();
  }
}

module.exports = mailType;
