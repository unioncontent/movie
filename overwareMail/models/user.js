let funDB = require('../db/db_fun.js');
/*
  리포터 테이블 - reporter_data
  user 테이블 - m_mail_user
*/

var user = {
  insert: async function(table,param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(table,Object.keys(param));
    return await funDB.getResult('d',sql,pValue);
  },
  update: async function(param){
    var sql = 'update m_mail_user set user_name=?,user_pw=?,company_name=?';
    if(param.keyword == "0"){
      sql += ',user_keyword = null';
      delete param.keyword;
    } else {
      sql += ',user_keyword = ?';
    }
    var pValue = Object.values(param);
    sql +=' where n_idx=?';
    return await funDB.getResult('d',sql,pValue);
  },
  delete: async function(param){
    var sql = 'delete from m_mail_user where n_idx=?;';
    return await funDB.getResult('d',sql,param);
  },
  addIdCheck: async function(param) {
    var sql = 'select * from m_mail_user where user_id=?';
    return await funDB.getResult('d',sql,param);
  },
  selectTable: async function(body,param){
    var sql = 'select n_idx, user_keyword, user_type, user_admin, user_id, user_pw, user_name, company_name, date_format(createDate, \'%Y-%m-%d %H:%i:%s\') as createDate ';
    sql += ' from m_mail_user';
    sql += ' where n_idx = ? or user_admin= ?';
    sql += ' order by n_idx desc limit ?,?';
    return await funDB.getResult('d',sql,param);
  },
  selectTableCount: async function(body,param){
    var sql = 'select count(*) as total from m_mail_user';
    sql += ' where n_idx = ? or user_admin= ?';
    var count = await funDB.getResult('d',sql,param);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
  },
  checkId: async function(param) {
    var sql = 'select * from m_mail_user where user_id=?';
    return await funDB.getResult('d',sql,param);
  },
  deleteReporter: async function(email,param){
    var sql = 'delete from reporter_data where reporter_email like \'%'+email+'%\' and reporter_name=?';
    return await funDB.getResult('d',sql,param);
  },
  getNextReporterID: async function(){
    var sql = 'select replace(reporter_ID,\'P\',\'\') as reporter_ID from reporter_data where reporter_ID is not null ORDER BY reporter_idx DESC LIMIT 1;';
    var result = await funDB.getResult('d',sql,[]);
    return parseInt(result[0].reporter_ID)+1;
  },
  reporterCheck: async function(param){
    var sql = 'select * from reporter_data where reporter_email=? and reporter_name=? and reporter_media_name=?';
    return await funDB.getResult('d',sql,param);
  },
  selectReporter: async function(search,param){
    var sql = 'select distinct(reporter_media_name) from reporter_data ';
    if(search != ''){
      sql += ' where reporter_media_name like \'%'+search+'%\' ';
    }
    sql += ' order by reporter_media_name limit ?,?;';
    return await funDB.getResult('d',sql,param);
  },
  selectReporterCount: async function(search,param){
    var sql = 'select count(*) as total from (select distinct(reporter_media_name) from reporter_data ';
    if(search != ''){
      sql += ' where reporter_media_name like \'%'+search+'%\' ';
    }
    sql += ' ) a;';
    return await funDB.getResult('d',sql,param);
  }
}

function insertSqlSetting(table,keys){
  var arr = [].map.call(keys, function(obj) { return '?'; });
  columns = keys.join(', ');
  placeholders = arr.join(', ');
  var sql = "INSERT INTO "+table+" ( "+columns+" ) VALUES ( "+placeholders+" );";
  return sql;
}

module.exports = user;
