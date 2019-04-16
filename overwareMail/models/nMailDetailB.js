let funDB = require('../db/db_fun.js');
/*
 메일발송상세 테이블 - n_mail_detail
*/

var nMailDetailB = {
  insert: async function(param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(Object.keys(param));
    return await funDB.getResult('d',sql,pValue);
  },
  delete: async function(n_idx){
    var sql = 'delete from n_mail_detail where M_idx_A=?';
    return await funDB.getResult('d',sql,[n_idx]);
  }
}

function insertSqlSetting(keys){
  var arr = [].map.call(keys, function(obj) { return '?'; });
  columns = keys.join(', ');
  placeholders = arr.join(', ');
  var sql = "INSERT INTO n_mail_detail ( "+columns+" ) VALUES ( "+placeholders+" );";

  return sql;
}

module.exports = nMailDetailB;
