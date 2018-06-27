const DBpromise = require('../db/db_info.js');

/*
 메일발송리스트 테이블 - n_mail_all
 메일관리 뷰 - mail_write_view
*/

var nMailAll = {
  selectEmailView:async function(body,param){
    var sql = 'SELECT * FROM mail_write_view where n_idx is not null ';
    if('keyword' in body){
      sql +=' and M_keyword_idx = '+body.keyword;
    }
    if('searchType' in body){
      switch (body.searchType) {
        case 'n': sql+=' and M_seq_number ='+body.search; break;
        case 't': sql+=' and M_subject like \'%'+body.search+'%\''; break;
      }
    }
    sql += ' and (  M_id = ? or M_id in (select n_idx from m_mail_user where user_admin=?)) ';
    sql += ' order by n_idx desc limit ?,?';
    return await getResult(sql,param);
  },
  selectEmailViewCount:async function(body,param){
    var sql = 'SELECT count(*) as total FROM mail_write_view where n_idx is not null ';
    if('keyword' in body){
      sql +=' and M_keyword_idx = '+body.keyword;
    }
    if('searchType' in body){
      switch (body.searchType) {
        case 'n': sql+=' and M_seq_number ='+body.search; break;
        case 't': sql+=' and M_subject like \'%'+body.search+'%\''; break;
      }
    }
    sql += ' and (  M_id = ? or M_id in (select n_idx from m_mail_user where user_admin=?))';
    var count = await getResult(sql,param);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
  },
  selectEmailOneView:async function(idx){
    var sql = 'SELECT * FROM mail_write_view where n_idx=?';
    return await getResult(sql,idx);
  },
  insert: async function(param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(Object.keys(param));
    return await getResult(sql,pValue);
  },
  delete: async function(n_idx){
    var sql = 'delete from n_mail_all where n_idx=?';
    return await getResult(sql,[n_idx]);
  }
}

function insertSqlSetting(keys){
  var arr = [].map.call(keys, function(obj) { return '?'; });
  columns = keys.join(', ');
  placeholders = arr.join(', ');
  var sql = "INSERT INTO n_mail_all ( "+columns+" ) VALUES ( "+placeholders+" );";

  return sql;
}

async function getResult(sql,param) {
  var db = new DBpromise();
  console.log(sql,param);
  try{
    return await db.query(sql,param);
  } catch(e){
    console.log(sql,'DB Error');
    // console.log('DB Error:',e);
    return [];
  } finally{
    db.close();
  }
}

module.exports = nMailAll;
