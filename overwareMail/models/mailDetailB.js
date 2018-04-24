const DBpromise = require('../db/db_info.js');

/*
 메일발송상세 테이블 - m_mail_detail_b
*/

var mailDetailB = {
  insert: async function(param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(Object.keys(param));
    return await getResult(sql,pValue);
  },
  updateResult:async function(param){
    var sql = 'update m_mail_detail_b set M_result=? where M_idx_A=?';
    return await getResult(sql,param);
  },
  updateResult2:async function(param,email){
    var sql = 'update m_mail_detail_b set M_result=? where E_mail like \'%'+email+'%\' and M_idx_A=?';
    return await getResult(sql,param);
  },
  getMediaNReporterCount:async function(column,param){
    var sql = 'select count(DISTINCT '+column+') as c from m_mail_detail_b where M_idx_A=?';
    var result = await getResult(sql,param);
    if(result.length == 0){
      return 0;
    }
    return result[0].c || 0;
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

module.exports = mailDetailB;
