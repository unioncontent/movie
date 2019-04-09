const logger = require('../winston/config_f.js');
const mysql = require('mysql');
const DBpromise = require('../db/db_info.js');
/*
 메일발송상세 테이블 - n_mail_detail
*/

var nMailDetailB = {
  insert: async function(param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(Object.keys(param));
    return await getResult(sql,pValue);
  },
  delete: async function(n_idx){
    var sql = 'delete from n_mail_detail where M_idx_A=?';
    return await getResult(sql,[n_idx]);
  }
}

function insertSqlSetting(keys){
  var arr = [].map.call(keys, function(obj) { return '?'; });
  columns = keys.join(', ');
  placeholders = arr.join(', ');
  var sql = "INSERT INTO n_mail_detail ( "+columns+" ) VALUES ( "+placeholders+" );";

  return sql;
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
module.exports = nMailDetailB;
