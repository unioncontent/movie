const DBpromise = require('../db/db_info.js');

/*
 메일발송상세 테이블 - m_mail_detail_b
*/

var mailDetailB = {
  insert: async function(param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(Object.keys(param));
    return await getResult(sql,pValue);
  }
}
function insertSqlSetting(keys){
  var arr = [].map.call(keys, function(obj) { return '?'; });
  columns = keys.join(', ');
  placeholders = arr.join(', ');
  var sql = "INSERT INTO m_mail_detail_b ( "+columns+" ) VALUES ( "+placeholders+" );";

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

module.exports = mailDetailB;
