const DBpromise = require('../db/db_info.js');

/*
 전체 메일 리스트 테이블 - m_mail_list_all
 View 테이블 - mail_list_all_view
*/

var mailListAll = {
  insert: async function(table,param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(table,Object.keys(param));
    return await getResult(sql,pValue);
  },
  update: async function(param){
    var pValue = Object.values(param);
    var sql = 'update m_mail_list_all set M_ptitle=?,M_reporter=?,M_name=?,M_email=?,M_tel=? where n_idx=?;';
    return await getResult(sql,pValue);
  },
  updateReporter: async function(param){
    var pValue = Object.values(param);
    var sql = 'update reporter_data set\
    reporter_media_name=?, reporter_name=?, reporter_email=?, reporter_phoneNum=?, updateDate=?\
    where reporter_idx=?;';
    return await getResult(sql,pValue);
  },
  deleteFun: async function(param){
    var sql = 'delete from m_mail_list_all where n_idx=?;';
    return await getResult(sql,param);
  },
  getOneEmail : async function(param){
    var sql = 'select M_email from m_mail_list_all ';
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
    var result = await getResult(sql,[]);
    return [].map.call(result, function(obj) { return obj.M_email.replace('\r',''); });
  },
  getOneInfo : async function(n_idx){
    var sql = 'select * from m_mail_list_all where n_idx=?';
    return await getResult(sql,[n_idx]);
  },
  getViewOneInfo : async function(n_idx){
    var sql = 'select * from mail_list_all_view where n_idx=?';
    return await getResult(sql,[n_idx]);
  },
  selectView: async function(body,param){
    var sql = 'select search, user_name,M_reporter, M_id, M_email, M_name, M_ptitle, M_tel, M_regdate,n_idx';
    if (typeof body.as !== 'undefined') {
      sql += body.as+' ,CONCAT(M_name, \'&lt;\', M_email, \'&gt;\') as text ';
    }
    sql += ' from mail_list_all_view where search is not null ';
    if('userType' in body){
      switch (body.userType) {
        case '0': sql+=' and M_reporter =\'0\''; break;
        case '1': sql+=' and M_reporter =\'1\''; break;
        case '2': sql+=' and M_reporter =\'2\''; break;
      }
    }
    if('searchType' in body){
      switch (body.searchType) {
        case 'c': sql+=' and M_ptitle =\''+body.search+'\''; break;
        case 'e': sql+=' and M_email like \'%'+body.search+'%\''; break;
        case 'n': sql+=' and M_name like \'%'+body.search+'%\''; break;
        case 't': sql+=' and M_tel =\''+body.search.replace( /(\s*)/g, "")+'\''; break;
      }
    }
    else{
      if (typeof body.search !== 'undefined') {
        sql += ' and search like \'%'+body.search+'%\'';
      }
    }
    sql += ' and M_ID = ?';
    if (typeof body.order !== 'undefined') {
      sql += ' order by n_idx desc limit ?,?';
    }
    else{
      sql += ' order by search limit ?,?';
    }
    return await getResult(sql,param);
  },
  selectViewCount: async function(body,param){
    var sql = 'select count(*) as total from mail_list_all_view where search is not null ';
    if('userType' in body){
      switch (body.userType) {
        case '0': sql+=' and M_reporter =\'0\''; break;
        case '1': sql+=' and M_reporter =\'1\''; break;
        case '2': sql+=' and M_reporter =\'2\''; break;
      }
    }
    if('searchType' in body){
      switch (body.searchType) {
        case 'c': sql+=' and M_ptitle =\''+body.search+'\''; break;
        case 'e': sql+=' and M_email like \'%'+body.search+'%\''; break;
        case 'n': sql+=' and M_name like \'%'+body.search+'%\''; break;
        case 't': sql+=' and M_tel =\''+body.search.replace( /(\s*)/g, "")+'\''; break;
      }
    }
    else{
      if (typeof body.search !== 'undefined') {
        sql += ' and search like \'%'+body.search+'%\'';
      }
    }
    sql += ' and M_ID = ?';
    var count = await getResult(sql,param);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
  },
  emailCheck: async function(email,param){
    var sql = 'select * from m_mail_list_all where M_email like \'%'+email+'%\' ';
    if(param.length == 2){
      sql += ' and M_name=? ';
    }
    sql += ' and M_ID= ?;';
    return await getResult(sql,param);
  }
}

function insertSqlSetting(table,keys){
  var arr = [].map.call(keys, function(obj) { return '?'; });
  columns = keys.join(', ');
  placeholders = arr.join(', ');
  var sql = "INSERT INTO "+table+" ( "+columns+" ) VALUES ( "+placeholders+" );";
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

module.exports = mailListAll;
