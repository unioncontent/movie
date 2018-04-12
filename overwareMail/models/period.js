const DBpromise = require('../db/db_info.js');

/*
 통계 뷰 - period_view
 통계 댓글수 뷰 - period_news_view
 통계 기사수 뷰 - period_reply_view
*/

var period = {
  selectView: async function(body,param){
    var sql = 'SELECT * FROM period_view where n_idx is not null ';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and M_regdate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    sql += ' and M_id = ?';
    sql += ' order by n_idx desc limit ?,?';
    return await getResult(sql,param);
  },
  selectViewCount: async function(body,param){
    var sql = 'SELECT count(*) as total FROM period_view where n_idx is not null ';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and M_regdate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    sql += ' and M_id = ?';
    var count = await getResult(sql,param);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
  },
  getNewsCount: async function(param){
    var pValue = Object.values(param);
    var sql = 'SELECT count(*) as c FROM period_news_view';
    sql += ' where substring_index(reporter_email,\'.\',2) in (SELECT substring_index(E_mail,\'.\',2) from m_mail_detail_b where M_idx_A=?)';
    sql += ' and keyword = ? and writeDate BETWEEN ? AND date_add(?, INTERVAL 48 HOUR);';
    var result = await getResult(sql,pValue);
    if(result.length == 0){
      return 0;
    }
    return result[0].c || 0;
  },
  getReplyCount: async function(param){
    var pValue = Object.values(param);
    var sql = 'SELECT sum(reply_count) as c FROM period_reply_view';
    sql += ' where substring_index(reporter_email,\'.\',2) in (SELECT substring_index(E_mail,\'.\',2) from m_mail_detail_b where M_idx_A=?)';
    sql += ' and title_key = ? and createDate BETWEEN ? AND date_add(?, INTERVAL 48 HOUR);';
    var result = await getResult(sql,pValue);
    if(result.length == 0){
      return 0;
    }
    return result[0].c || 0;
  }
}

async function getResult(sql,param) {
  var db = new DBpromise();
  console.log(sql,param);
  try{
    return await db.query(sql,param);
  } catch(e){
    return [];
  } finally{
    db.close();
  }
}

module.exports = period;
