const DBpromise = require('../db/db_info.js');

/*
 전체 메일 리스트 테이블 - m_mail_list_all
 View 테이블 - mail_list_all_view
*/

var mailListAll = {
  selectView: async function(body,param){
    var sql = 'select search, user_name, M_id, M_email, M_name, M_ptitle, M_tel, M_regdate,n_idx';
    if (typeof body.as !== 'undefined') {
      sql += body.as+' ,CONCAT(M_name, \'&lt;\', M_email, \'&gt;\') as text ';
    }
    sql += ' from mail_list_all_view where ';
    if (typeof body.search !== 'undefined') {
      sql += ' search like \'%'+body.search+'%\' and';
    }
    sql += ' M_ID = ?';
    sql += ' order by search limit ?,?';
    return await getResult(sql,param);
  },
  selectViewCount: async function(body,param){
    var sql = 'select count(*) as total from mail_list_all_view where ';
    if (typeof body.search !== 'undefined') {
      sql += ' search like \'%'+body.search+'%\' and ';
    }
    sql += ' M_ID = ?';
    sql += ' order by search';
    var count = await getResult(sql,param);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
  }
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

module.exports = mailListAll;
