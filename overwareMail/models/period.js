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
    sql += ' and (  M_id = ? or M_id in (select n_idx from m_mail_user where user_admin=?)) ';
    sql += ' order by n_idx desc limit ?,?';
    return await getResult(sql,param);
  },
  selectViewCount: async function(body,param){
    var sql = 'SELECT count(*) as total FROM period_view where n_idx is not null ';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and M_regdate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
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
  selectSendCount: async function(param){
    var sql = 'SELECT sendCount FROM period_view where n_idx=?';
    var result = await getResult(sql,param);
    if(result.length == 0){
      return 0;
    }
    else{
      return result[0]['sendCount'];
    }
  },
  getNewsCount: async function(param){
    var pValue = Object.values(param);
    var sql = 'SELECT FORMAT(count(*),0) as c FROM period_news_view';
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
    var sql = 'SELECT FORMAT(sum(reply_count),0) as c FROM period_reply_view';
    sql += ' where substring_index(reporter_email,\'.\',2) in (SELECT substring_index(E_mail,\'.\',2) from m_mail_detail_b where M_idx_A=?)';
    sql += ' and title_key = ? and createDate BETWEEN ? AND date_add(?, INTERVAL 48 HOUR);';
    var result = await getResult(sql,pValue);
    if(result.length == 0){
      return 0;
    }
    return result[0].c || 0;
  },
  get7DayGraph: async function(user){
    var sql = 'SELECT date_format(M_regdate,\'%Y-%m-%d\') as date,sum(success) as success,sum(fail) as fail\
    FROM period_view\
    where M_regdate BETWEEN date_sub(now(), INTERVAL 7 day) and now()';
    var param = [user.n_idx];
    if(user.user_admin == null){
      sql += ' and (  M_id=? or M_id in (select n_idx from m_mail_user where user_admin=?)) ';
      param.push(user.n_idx);
    }
    else{
      sql += ' and M_id=? ';
    }
    sql +='group by date(M_regdate)';
    return await getResult(sql,param);
  },
  getYesterday: async function(user){
    var sql = 'SELECT * FROM period_view where (M_regdate BETWEEN date_sub(now(), INTERVAL 1 day) and now() or Date(M_send) = CURRENT_DATE()) ';
    var param = [user.n_idx];
    if(user.user_admin == null){
      sql += ' and (  M_id=? or M_id in (select n_idx from m_mail_user where user_admin=?)) ';
      param.push(user.n_idx);
    }
    else{
      sql += ' and M_id=? ';
    }
    sql +='order by n_idx desc';
    return await getResult(sql,param);
  },
  getTodaySendCount: async function(user){
    var sql ='SELECT FORMAT(if(sum(success+fail) is null,0,sum(success+fail)), 0) as total FROM period_view where (M_regdate > CURRENT_DATE() or Date(M_send) = CURRENT_DATE())';
    var param = [user.n_idx];
    if(user.user_admin == null){
      sql += ' and (  M_id=? or M_id in (select n_idx from m_mail_user where user_admin=?)) ';
      param.push(user.n_idx);
    }
    else{
      sql += ' and M_id=? ';
    }
    var result = await getResult(sql,param);
    return (result.length == 0) ? '' : parseInt(result[0]['total']);
  },
  getSuccessNfailCount: async function(user){
    sql = 'SELECT FORMAT(sum(if(success is null,0,success)), 0) as success,\
    FORMAT(sum(if(fail is null,0,fail)), 0) as fail \
    FROM period_view where (M_send > CURRENT_DATE() or Date(M_send) = CURRENT_DATE())';
    var param = [user.n_idx];
    if(user.user_admin == null){
      sql += ' and (  M_id=? or M_id in (select n_idx from m_mail_user where user_admin=?)) ';
      param.push(user.n_idx);
    }
    else{
      sql += ' and M_id=? ';
    }
    var result = await getResult(sql,param);
    if(result[0]['success'] == null && result[0]['fail'] == null){
      result = [{'success':0,'fail':0}];
    }
    return result[0];
  },
  getTodayNReservationCount: async function(user,M_type){
    sql = 'SELECT FORMAT(if(sum(sendCount) is null,0,sum(sendCount)), 0) as total FROM period_view where Date(M_send) = CURRENT_DATE() and M_type=?';
    var param = [M_type,user.n_idx];
    if(user.user_admin == null){
      sql += '(and M_id=? or M_id in (select n_idx from m_mail_user where user_admin=?))';
      param.push(user.n_idx);
    }
    else{
      sql += ' and M_id=? ';
    }
    var result = await getResult(sql,param);
    return (result.length == 0) ? '' : result[0]['total'];
  },
  getWaitingCount: async function(user){
    var sql = 'SELECT FORMAT(if(sum(sendCount) is null,0,sum(sendCount)), 0) as total\
    FROM period_view where M_send > now() and M_type=1';
    var param = [user.n_idx];
    if(user.user_admin == null){
      sql += '(and M_id=? or M_id in (select n_idx from m_mail_user where user_admin=?))';
      param.push(user.n_idx);
    }
    else{
      sql += ' and M_id=? ';
    }
    var result = await getResult(sql,param);
    return (result.length == 0) ? '' : result[0]['total'];
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
