const DBpromise = require('../db/db_info.js');

/*
 메일발송리스트 테이블 - m_mail_all_a
 메일관리 뷰 - mail_write_view
*/

var mailAllA = {
  selectEmailView:async function(body,param){
    var sql = 'SELECT * FROM mail_write_view where n_idx is not null ';
    if('keyword' in body){
      sql +=' and M_keyword_idx = '+body.keyword;
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
    sql += ' and (  M_id = ? or M_id in (select n_idx from m_mail_user where user_admin=?))';
    var count = await getResult(sql,param);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
  },
  insert: async function(param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(Object.keys(param));
    return await getResult(sql,pValue);
  },
  delete: async function(n_idx){
    var sql = 'delete from m_mail_all_a where n_idx=?';
    return await getResult(sql,[n_idx]);
  },
  updateMtype:async function(param){
    var sql = 'update m_mail_all_a set M_type=? where n_idx=?';
    return await getResult(sql,param);
  },
  updateId: async function(param){
    var sql = 'update m_mail_all_a set M_a_id=? where n_idx=?';
    return await getResult(sql,param);
  },
  updateResult:async function(param){
    var sql = 'update m_mail_all_a set M_success=? ,M_failed=? where n_idx=?';
    return await getResult(sql,param);
  },
  updateResult2: async function(param){
    var sql = 'update m_mail_all_a set M_success=0,M_failed=? where n_idx=?';
    return await getResult(sql,param);
  },
  selectfile: async function(param){
    var sql = 'SELECT M_file,DATE_FORMAT(M_regdate, \'%Y%m%d\') as dateFile FROM m_mail_all_a where n_idx=?';
    return await getResult(sql,param);
  },
  getEmailData: async function(param){
    var sql = 'SELECT * FROM m_mail_all_a where n_idx=?';
    return await getResult(sql,param);
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

module.exports = mailAllA;
