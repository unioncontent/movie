const DBpromise = require('../db/db_info.js');

/*
 메일 그룹 리스트 테이블 - m_mail_list_c
 View 테이블 - mail_list_group_view
*/

var mailListC = {
  insert: async function(param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(Object.keys(param));
    return await getResult(sql,pValue);
  },
  getEmail : async function(param){
    // 로그인 -> M_ID!!!
    var sql = 'select M_email from m_mail_list_c where M_ID=\'1\' ';
    if(typeof param == 'object'){
      sql += 'and M_group_title =\''+param[0]+'\' or';
      for(var i = 1; i < param.length; i++){
        sql += ' M_group_title =\''+param[i]+'\'';
        if(i != (param.length-1)){
          sql += ' or';
        }
      }
    }
    else if(typeof param == 'string'){
      sql += 'and M_group_title =\''+param+'\'';
    }
    var result = await getResult(sql,[]);
    return [].map.call(result, function(obj) { return obj.M_email; });
  },
  getIdx : async function(param){
    // 로그인 -> M_ID!!!
    var sql = 'select M_idx_a from m_mail_list_c where M_ID=\'1\' ';
    if(typeof param == 'object'){
      sql += 'and M_group_title =\''+param[0]+'\' or';
      for(var i = 1; i < param.length; i++){
        sql += ' M_group_title =\''+param[i]+'\'';
        if(i != (param.length-1)){
          sql += ' or';
        }
      }
    }
    else if(typeof param == 'string'){
      sql += 'and M_group_title =\''+param+'\'';
    }
    var result = await getResult(sql,[]);
    return [].map.call(result, function(obj) { return obj.M_idx_a; });
  },
  titleCheck: async function(param){
    var sql = 'select * from m_mail_list_c where M_group_title=? and M_id=?;';
    console.log(sql,param);
    return await getResult(sql,param);
  },
  getOneInfo : async function(m_idx){
    var sql = 'select * from m_mail_list_c where M_idx_a=?';
    return await getResult(sql,[m_idx]);
  },
  selectView: async function(body,param,callback){
    var sql = 'select M_ID,user_name,search,count(*) as groupCount,M_group_title,M_group_title';
    if (typeof body.as !== 'undefined') {
      sql += body.as+' ,CONCAT(M_group_title, \'&lt;\', count(*), \'명&gt;\') as text ';
    }
    sql += ' FROM mail_list_group_view where ';
    if (typeof body.search !== 'undefined') {
      sql += ' search like \'%'+body.search+'%\'and ';
    }
    sql += ' M_ID = ?';
    sql += ' group by search order by search limit ?,?';
    return await getResult(sql,param);
  },
  selectViewCount: async function(body,param){
    var sql = 'select count(*) as total from (SELECT * FROM mail_list_group_view where';
    if (typeof body.search !== 'undefined') {
      sql += ' search like \'%'+body.search+'%\'and ';
    }
    sql += ' M_ID = ?';
    sql += ' group by M_group_title) a';
    var count = await getResult(sql,param);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
  }
}
function insertSqlSetting(keys){
  var arr = [].map.call(keys, function(obj) { return '?'; });
  columns = keys.join(', ');
  placeholders = arr.join(', ');
  var sql = "INSERT INTO m_mail_list_c ( "+columns+" ) VALUES ( "+placeholders+" );";

  return sql;
}

async function getResult(sql,param) {
  console.log(sql,param);
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
module.exports = mailListC;
