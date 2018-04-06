const DBpromise = require('../db/db_info.js');

/*
 메일발송리스트 테이블 - m_mail_all_a
*/

var mailAllA = {
  insert: async function(param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(Object.keys(param));
    // console.log(param);
    // console.log(sql,pValue);
    return await getResult(sql,pValue);
  },
  delete: async function(n_idx){
    var sql = 'delete from m_mail_all_a where n_idx=?';
    return await getResult(sql,[n_idx]);
  }
}

function insertSqlSetting(keys){
  var arr = [].map.call(keys, function(obj) { return '?'; });
  columns = keys.join(', ');
  placeholders = arr.join(', ');
  var sql = "INSERT INTO m_mail_all_a ( "+columns+" ) VALUES ( "+placeholders+" );";

  return sql;
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

module.exports = mailAllA;
