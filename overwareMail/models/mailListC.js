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
  deleteFun: async function(param){
    var pValue = Object.values(param);
    var sql = 'delete from m_mail_list_c where';
    if('title' in param){
      sql += ' M_group_title=?';
    }
    else if('idx' in param){
      sql += ' n_idx=?';
    }
    else if('M_idx_a' in param){
      sql += ' M_idx_a=?';
    }
    sql += 'and M_id=?;'
    return await getResult(sql,pValue);
  },
  getEmail : async function(param,idx){
    var sql = 'select M_email from m_mail_list_c where M_ID=? ';
    if(typeof param == 'object'){
      sql += 'and M_group_title =\''+param[0]+'\'';
      for(var i = 1; i < param.length; i++){
        sql += ' or';
        sql += ' M_group_title =\''+param[i]+'\'';
      }
    }
    else if(typeof param == 'string'){
      sql += 'and M_group_title =\''+param+'\'';
    }
    var result = await getResult(sql,[idx]);
    return [].map.call(result, function(obj) { return obj.M_email; });
  },
  getOneEmail:async function(param){
    var sql = 'select distinct M_email from m_mail_list_c where M_group_title in (select M_group_title from m_mail_list_c ';
    if(typeof param == 'object'){
      sql += 'where n_idx ='+param[0];
      for(var i = 1; i < param.length; i++){
        sql += ' or';
        sql += ' n_idx ='+param[i];
      }
    }
    else if(typeof param == 'string'){
      sql += 'where n_idx ='+param;
    }
    sql += ')';
    var result = await getResult(sql);
    return [].map.call(result, function(obj) { return obj.M_email; });
  },
  getIdx : async function(param,idx){
    var sql = 'select M_idx_a from m_mail_list_c where M_ID=? ';
    if(typeof param == 'object'){
      sql += 'and M_group_title =\''+param[0]+'\'';
      for(var i = 1; i < param.length; i++){
        sql += ' or';
        sql += ' M_group_title =\''+param[i]+'\'';
      }
    }
    else if(typeof param == 'string'){
      sql += 'and M_group_title =\''+param+'\'';
    }
    var result = await getResult(sql,[idx]);
    return [].map.call(result, function(obj) { return obj.M_idx_a; });
  },
  getIdx2 : async function(param,idx){
    var sql = 'select distinct n_idx from m_mail_list_c where M_ID=? ';
    if(typeof param == 'object'){
      sql += 'and M_group_title =\''+param[0]+'\'';
      for(var i = 1; i < param.length; i++){
        sql += ' or';
        sql += ' M_group_title =\''+param[i]+'\'';
      }
    }
    else if(typeof param == 'string'){
      sql += 'and M_group_title =\''+param+'\'';
    }
    sql += '  group by M_group_title';
    var result = await getResult(sql,[idx]);
    return [].map.call(result, function(obj) { return obj.n_idx; });
  },
  titleCheck: async function(param){
    var sql = 'select * from m_mail_list_c where M_group_title=? and M_id=?;';
    return await getResult(sql,param);
  },
  titleEmailCheck: async function(email,param){
    var sql = 'select * from m_mail_list_c where M_group_title=? and M_id=? and M_email like \'%'+email+'%\';';
    return await getResult(sql,param);
  },
  getOneInfo : async function(m_idx){
    var sql = 'select * from m_mail_list_c where M_idx_a=?';
    return await getResult(sql,[m_idx]);
  },
  getOneData : async function(idx){
    var sql = 'select * from m_mail_list_c where n_idx=?';
    return await getResult(sql,[idx]);
  },
  selectView: async function(body,param){
    var sql = 'select M_ID,date_format(M_regdate, \'%Y-%m-%d %H:%i:%s\') as M_regdate,user_name,search,count(*) as groupCount,M_group_title,M_group_title';
    if (typeof body.as !== 'undefined') {
      sql += body.as+' ,CONCAT(M_group_title, \'&lt;\', count(*), \'명&gt;\') as text ';
    }
    sql += ' FROM mail_list_group_view where ';
    if (typeof body.search !== 'undefined') {
      sql += ' search like \'%'+body.search+'%\'and ';
    }
    sql += ' M_ID = ?';
    sql += ' group by search';
    if (typeof body.order !== 'undefined') {
      sql += ' order by M_regdate desc limit ?,?';
    }
    else{
      sql += ' order by search limit ?,?';
    }
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
  },
  selectView2: async function(body,param){
    var sql = 'select n_idx, search, M_id, M_group_title, M_idx_a, user_name, M_email, M_name, M_ptitle, M_tel,date_format(M_regdate, \'%Y-%m-%d %H:%i:%s\') as M_regdate FROM mail_list_group_view where M_id = ?';
    if (typeof body.group !== 'undefined') {
      sql += ' and M_group_title=?';
    }
    if (typeof body.order !== 'undefined') {
      sql += ' order by M_regdate desc limit ?,?';
    }
    return await getResult(sql,param);
  },
  selectViewCount2: async function(body,param){
    var sql = 'select count(*) as total FROM mail_list_group_view where M_id = ?';
    if (typeof body.group !== 'undefined') {
      sql += ' and M_group_title=?';
    }
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
