const logger = require('../winston/config_f.js');
const mysql = require('mysql');
const DBpromise = require('../db/db_info.js');

/*
 통계 뷰 - period_view
 통계 댓글수 뷰 - period_news_view
 통계 기사수 뷰 - period_reply_view
*/

const userWhere = "and ( a.M_id=? or a.M_id in (select n_idx from `union`.m_mail_user where user_admin=?) or a.M_keyword in (select user_keyword from `union`.m_mail_user where n_idx=?))";

var period = {
  call_dashbord: async function(param){
    var sql = 'call union_mail.dashboard3(?,?)';
    var result = await getResult(sql,param);
    return (result.length > 0)? result[0]:[];
    // call dashboard(-1,25);
    // call dashboard(-7,25);
  },
  call_dashbord2: async function(param){
    var sql = 'call union_mail.dashboard2(?,?)';
    var result = await getResult(sql,param);
    return (result.length > 0)? result[0]:[];
  },
  call_stats: async function(param){
    var sql = 'call union_mail.stats(?,?,?,?,?,?,?,?,?,0)';
    logger.info(mysql.format(sql, param)+';');
    return await getResult(sql,param);
  },
  call_stats2: async function(param){
    var sql = 'call union_mail.stats_m(?,?,?,?,?,?,?,?,?,0)';
    logger.info(mysql.format(sql, param)+';');
    return await getResult(sql,param);
  },
  call_mail_detail: async function(type,param){
    var sql = 'call mail_detail(?, ?, ?, ?)';
    if(type == '2'){
      sql = 'call mymailer_detail(?, ?, ?, ?)';
    }
    var result = await getResult(sql,param);
    if(param[0] == 1){
      return (result.length > 0)? result[0][0]:{media_c:0,reporter_c:0};
    }
    else{
      return (result.length > 0)? ((result[0][0].c == null) ? 0:result[0][0].c) :0;
    }
    // call mail_detail(2, 755, '암수살인', '2018-10-06');
  },
  call_mymailer_detail: async function(param){
    var sql = 'call mymailer_detail(?, ?, ?, ?)';
    var result = await getResult(sql,param);
    if(param[0] == 1){
      return (result.length > 0)? result[0][0]:{media_c:0,reporter_c:0};
    }
    else{
      return (result.length > 0)? ((result[0][0].c == null) ? 0:result[0][0].c) :0;
    }
    // call mail_detail(2, 755, '암수살인', '2018-10-06');
  },
  call_mymailer_detail_result: async function(param){
    var sql = 'call union_mail.mymailer_detail_result(?,?)';
    // call union_mail.mymailer_detail_result(85, '1');
    var result = await getResult(sql,param);
    return (result.length > 0)? result[0]:[];
  },
  selectReservationView: async function(param){
    var sql = "select a.M_type, a.n_idx, a.M_subject, a.M_keyword as M_keyword_idx, k.keyword_main AS M_keyword,a.M_seq_number, a.M_invitation, a.M_template,date_format(a.M_senddate,'%Y-%m-%d  %H:%i:%s') as M_send, '0' as sendCount, '0' as success, '0' as fail from `union`.m_mail_all_a as a left join `union`.m_keyword_data as k ON a.M_keyword = k.keyword_idx\
    where a.M_type = \'1\' and (DATE(a.M_senddate) > current_date() and a.M_senddate > now()) and a.M_module = ? "+userWhere;
    return await getResult(sql,param);
  },
  selectReservationCount: async function(admin,n_idx){
    var sql = "select concat('d.sixth=''',GROUP_CONCAT(distinct n_idx SEPARATOR ''' or d.sixth='''),'''') as userStr from `union`.m_mail_user where user_admin=? or n_idx=?";
    var userResult = await getResult(sql,[((admin==null)?n_idx:admin),n_idx]);
    sql = "select concat('d.eighth=''',GROUP_CONCAT(distinct user_keyword SEPARATOR ''' or d.eighth='''),'''') as keywordStr from `union`.m_mail_user where n_idx=?";
    var keywordResult  = await getResult(sql,n_idx);
    sql = "SELECT count(*) as total FROM tm001.customer_data as d left join tm001.customer_info as i on d.id = i.id where d.twelfth = '1' and (i.send_time > now() and DATE(i.regist_date) = current_date()) ";
    // sql = "SELECT count(*) as total FROM tm001.customer_data as d left join tm001.customer_info as i on d.id = i.id where d.twelfth = '1' and (i.send_time > now() and DATE(i.regist_date) > current_date()) ";
    console.log('result : ',userResult,keywordResult);
    if(userResult.length > 0){
      sql += ' and (('+userResult[0].userStr+') ';
      if(keywordResult.length > 0){
        if(keywordResult[0].keywordStr != '' && keywordResult[0].keywordStr != null){
          sql += ' or ('+keywordResult[0].keywordStr+') ';
        }
      }
      sql +=' )'
    }
    var count = await getResult(sql,[],'mymailer');
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
  },
  selectView: async function(body,param){
    var sql = 'SELECT * FROM period_view where n_idx is not null ';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and M_regdate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    if('keyword' in body){
      sql +=' and M_keyword_idx = '+body.keyword;
    }
    if('ivt' in body){
      sql +=' and M_invitation = '+body.ivt;
    }
    if('type' in body){
      sql +=' and M_mail_type = \''+body.type+'\'';
    }
    if('mType' in body){
      sql +=' and M_type = '+body.mType;
    }
    sql += ' and (  M_id = ? or M_id in (select n_idx from m_mail_user where user_admin=?)) ';
    sql += ' order by M_regdate desc limit ?,?';
    return await getResult(sql,param);
  },
  selectViewCount: async function(body,param){
    var sql = 'SELECT count(*) as total FROM period_view where n_idx is not null ';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and M_regdate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    if('keyword' in body){
      sql +=' and M_keyword_idx = '+body.keyword;
    }
    if('ivt' in body){
      sql +=' and M_invitation = '+body.ivt;
    }
    if('type' in body){
      sql +=' and M_mail_type = \''+body.type+'\'';
    }
    if('mType' in body){
      sql +=' and M_type = '+body.mType;
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
    sql += ' where concat(media_name,\' \',reporter_name) in (SELECT distinct concat(M_ptitle,\' \',SUBSTRING_INDEX(EMTONAME, \' \', 1)) from mail_send_result where MSGID=? and (ISNULL(FINALRESULT) AND (SENDRESULT = \'OK\')) OR FINALRESULT = 13) ';
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
    sql += ' where concat(media_name,\' \',reporter_name) in (SELECT distinct concat(M_ptitle,\' \',SUBSTRING_INDEX(EMTONAME, \' \', 1)) from mail_send_result where MSGID=?  and (ISNULL(FINALRESULT) AND (SENDRESULT = \'OK\')) OR FINALRESULT = 13) ';
    sql += ' and title_key = ? and createDate BETWEEN ? AND date_add(?, INTERVAL 48 HOUR);';
    var result = await getResult(sql,pValue);
    if(result.length == 0){
      return 0;
    }
    return result[0].c || 0;
  },
  getPeriodMediaNReporterCount: async function(param){
    var pValue = Object.values(param);
    var pValue2 = Object.values(param);
    var value = pValue.concat(pValue2);
    var checkReporterQuery ='where concat(media_name,\' \',reporter_name) in (SELECT distinct concat(M_ptitle,\' \',SUBSTRING_INDEX(EMTONAME, \' \', 1)) from mail_send_result where MSGID=?  and (ISNULL(FINALRESULT) AND (SENDRESULT = \'OK\')) OR FINALRESULT = 13)'
    var sql ='select FORMAT(count(distinct media_name),0) as media_c,FORMAT(count(distinct concat(media_name,\' \',reporter_name)),0) as reporter_c  from';
    sql +='((select media_name,reporter_name from period_news_view ';
    sql += checkReporterQuery;
    sql +='and keyword = ?';
    sql +='and writeDate BETWEEN ? AND date_add(?, INTERVAL 48 HOUR))'
    sql +='union all  (select media_name,reporter_name from period_reply_view ';
    sql +=checkReporterQuery;
    sql +='and title_key = ?';
    sql +='and createDate BETWEEN ? AND date_add(?, INTERVAL 48 HOUR))) a';
    console.log(sql);
    var result = await getResult(sql,value);
    if(result.length == 0){
      return {media_c:0,reporter_c:0};
    }
    return result[0];
  },
  get7DayGraph: async function(user){
    var sql = 'SELECT date_format(M_send,\'%Y-%m-%d\') as date,sum(successNum) as success,sum(failNum) as fail\
    FROM period_view\
    where M_send BETWEEN date_sub(now(), INTERVAL 7 day) and now()';
    var param = [user.n_idx];
    if(user.user_admin == null){
      sql += ' and (  M_id=? or M_id in (select n_idx from m_mail_user where user_admin=?)) ';
      param.push(user.n_idx);
    }
    else{
      sql += ' and M_id=? ';
    }
    sql +='group by date(M_send)';
    return await getResult(sql,param);
  },
  getYesterday: async function(user){
    var sql = 'SELECT * FROM period_view where (M_send BETWEEN date_sub(now(), INTERVAL 1 day) and now() or Date(M_send) = CURRENT_DATE()) ';
    var param = [user.n_idx];
    if(user.user_admin == null){
      sql += ' and (  M_id=? or M_id in (select n_idx from m_mail_user where user_admin=?)) ';
      param.push(user.n_idx);
    }
    else{
      sql += ' and M_id=? ';
    }
    sql +='order by M_send desc';
    return await getResult(sql,param);
  },
  getTodaySendCount: async function(user){
    var sql ='SELECT FORMAT(if(sum(successNum+failNum) is null,0,sum(successNum+failNum)), 0) as total FROM period_view where (M_regdate > CURRENT_DATE() or Date(M_send) = CURRENT_DATE())';
    var param = [user.n_idx];
    if(user.user_admin == null){
      sql += ' and (  M_id=? or M_id in (select n_idx from m_mail_user where user_admin=?)) ';
      param.push(user.n_idx);
    }
    else{
      sql += ' and M_id=? ';
    }
    var result = await getResult(sql,param);
    return (result.length == 0) ? '' : result[0]['total'];
  },
  getSuccessNfailCount: async function(user){
    sql = 'SELECT FORMAT(sum(if(successNum is null,0,successNum)), 0) as success,\
    FORMAT(sum(if(failNum is null,0,failNum)), 0) as fail \
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
    sql = 'SELECT FORMAT(if(sum(sendCountNum) is null,0,sum(sendCountNum)), 0) as total FROM period_view where Date(M_send) = CURRENT_DATE() and M_type=?';
    var param = [M_type,user.n_idx];
    if(user.user_admin == null){
      sql += 'and (M_id=? or M_id in (select n_idx from m_mail_user where user_admin=?))';
      param.push(user.n_idx);
    }
    else{
      sql += ' and M_id=? ';
    }
    var result = await getResult(sql,param);
    return (result.length == 0) ? '' : result[0]['total'];
  },
  getWaitingCount: async function(user){
    var sql = 'SELECT FORMAT(count(*),0) as total FROM union_mail.ml_automail_tran where SENDTIME > now() and ETC1 in (SELECT n_idx FROM m_mail_all_a where M_type=1 ';
    var param = [user.n_idx];
    if(user.user_admin == null){
      sql += 'and (M_id=? or M_id in (select n_idx from m_mail_user where user_admin=?))';
      param.push(user.n_idx);
    }
    else{
      sql += ' and M_id=? ';
    }
    sql += ')';
    var result = await getResult(sql,param);
    return (result.length == 0) ? '' : result[0]['total'];
  }
}

async function getResult(sql,param,dbName) {
  var db;
  if(dbName) db = new DBpromise(dbName);
  else db = new DBpromise();
  try{
    logger.info(mysql.format(sql, param)+';');
    return await db.query(sql,param);
  } catch(e){
    logger.error('DB Error:',e);
    return [];
  } finally{
    db.close();
  }
}

module.exports = period;
