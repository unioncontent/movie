const DBpromise = require('../db/db_info.js');

/*
 메일발송리스트 테이블 - m_mail_all_a
*/

var mailAllA = {
  selectMailList:async function(param){
    var sql = 'SELECT M_subject,M_keyword,n_idx FROM `union`.m_mail_all_a where M_keyword = ? and M_invitation = ? and M_template = ?\
    and M_senddate is not null and M_id in (SELECT n_idx FROM `union`.m_mail_user where user_admin = ?  or n_idx = ? or n_idx = ?) order by M_regdate desc limit ?,?';
    return await getResult(sql,param);
  },
  selectMailListCount:async function(param){
    var sql = 'SELECT count(*) as total FROM `union`.m_mail_all_a where M_keyword = ? and M_invitation = ? and M_template = ?\
    and M_senddate is not null and M_id in (SELECT n_idx FROM `union`.m_mail_user where user_admin = ?  or n_idx = ? or n_idx = ?)';
    var count = await getResult(sql,param);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
  },
  selectEmailView:async function(body,param){
    var sql = 'SELECT * FROM manage_view where n_idx is not null ';
    if('keyword' in body){
      sql +=' and M_keyword_idx = '+body.keyword;
    }
    if('searchType' in body){
      switch (body.searchType) {
        case 'n': sql+=' and M_seq_number ='+body.search; break;
        case 't': sql+=' and M_subject like \'%'+body.search+'%\''; break;
      }
    }
    if('ivt' in body){
      sql +=' and M_invitation= '+body.ivt;
    }
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and M_regdate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    sql += ' and (  M_id = ? or M_id in (select n_idx from m_mail_user where user_admin=?) ';
    if('user_keyword' in body){
      sql += 'or M_keyword_idx = '+body.user_keyword;
    }
    sql += ' ) order by M_regdate desc limit ?,?';
    return await getResult(sql,param);
  },
  selectEmailViewCount:async function(body,param){
    var sql = 'SELECT count(*) as total FROM manage_view where n_idx is not null ';
    if('keyword' in body){
      sql +=' and M_keyword_idx = '+body.keyword;
    }
    if('ivt' in body){
      sql +=' and M_invitation= '+body.ivt;
    }
    if('searchType' in body){
      switch (body.searchType) {
        case 'n': sql+=' and M_seq_number ='+body.search; break;
        case 't': sql+=' and M_subject like \'%'+body.search+'%\''; break;
      }
    }
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and M_regdate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    sql += ' and (  M_id = ? or M_id in (select n_idx from m_mail_user where user_admin=?) ';
    if('user_keyword' in body){
      sql += 'or M_keyword_idx = '+body.user_keyword;
    }
    sql += ' ) ';
    var count = await getResult(sql,param);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
  },
  selectEmailOneView:async function(idx){
    var sql = 'SELECT * FROM m_mail_all_a where n_idx=?';
    return await getResult(sql,idx);
  },
  selectEmailHtmlView:async function(idx){
    var sql = 'SELECT M_body_his FROM m_mail_all_a where n_idx=?';
    return await getResult(sql,idx);
  },
  selectPastMailBody:async function(param){
    var sql = 'SELECT M_body FROM m_mail_all_a where M_keyword = ? and M_invitation = ? and M_template = ?\
    and M_senddate is not null and (M_id in (SELECT n_idx FROM m_mail_user where user_admin = 1) or M_id = ?) order by n_idx desc limit 1;';
    var result = await getResult(sql,param);

    return (result.length != 0)?result[0].M_body:'';
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
  updateMailBodyHis:async function(param){
    var sql = 'update m_mail_all_a set M_body_his=? where n_idx=?';
    return await getResult(sql,param);
  },
  updateMtype:async function(param){
    var sql = 'update m_mail_all_a set M_type=?';
    if(param[0] == '0'){
      sql += ', M_senddate=null ';
    }
    sql += 'where n_idx=?';
    return await getResult(sql,param);
  },
  updateSendDate: async function(param){
    var sql = 'update m_mail_all_a set M_senddate = ? where n_idx = ?';
    return await getResult(sql,param);
  },
  updateId: async function(param){
    var sql = 'update m_mail_all_a set M_a_id=? where n_idx=?';
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
  console.log(sql);
  console.log(param);
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
