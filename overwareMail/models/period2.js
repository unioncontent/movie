const DBpromise = require('../db/db_info.js');

var customerViewQuery = "select STRAIGHT_JOIN i.title,i.wasRead,i.wasSend,i.wasComplete,i.real_id,d.id,d.second,d.sixth,d.seventh,i.send_time,i.regist_date,d.eighth,d.ninth, d.tenth, d.eleventh, d.twelfth, d.thirteenth, d.fourteenth, d.fifteenth, d.eighteenth, d.sixteenth, d.seventeenth from customer_info as i left join (SELECT id, email, first, second, third, sixth, seventh, eighth, ninth, tenth, eleventh, twelfth, thirteenth, fourteenth, fifteenth, sixteenth, seventeenth, eighteenth, nineteenth, regist_date FROM tm001.customer_data group by id order by null) as d on i.id = d.id where user_id != 'test' order by null";
var userWhereQuery = "and (a.sixth = ? or a.seventh = ?)";
var periodQuery = "SELECT STRAIGHT_JOIN \
a.id,\
a.real_id,\
a.wasRead,\
a.wasSend,\
a.wasComplete,\
a.second as n_idx,\
a.eighth as M_keyword, \
a.sixteenth as M_keyword_idx,\
a.title as M_subject,\
a.ninth as M_seq_number, \
a.tenth as M_invitation, \
a.eleventh as M_template, \
a.twelfth as M_type,\
a.thirteenth,\
a.eighteenth as M_group_idx,\
a.fourteenth as M_group,\
a.fifteenth as M_mail_type,\
IF(a.wasComplete = 'O', FORMAT(IFNULL(s.send_total,0),0), '0') as sendCount,\
IF(a.wasComplete = 'O', FORMAT(IFNULL(s.success_total,0),0), '0') as success,\
IF(a.wasComplete = 'O', FORMAT(IFNULL(s.fail_total,0),0), '0') as fail,\
DATE_FORMAT(a.send_time,'%Y-%m-%d %H:%i:%s') as M_send,\
date_format(a.regist_date,'%Y-%m-%d %H:%i:%s') as M_regdate FROM ("+customerViewQuery+") as a left join tm.statistics as s on a.real_id = s.id ";
var period = {
  selectView: async function(body,param){
    var sql = periodQuery+userWhereQuery.replace('and ','where ')+' and a.wasComplete = \'O\' ';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and a.regist_date between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    if('keyword' in body){
      sql +=' and a.sixteenth = '+body.keyword;
    }
    if('ivt' in body){
      sql +=' and a.tenth = '+body.ivt;
    }
    if('type' in body){
      sql +=' and a.fifteenth = \''+body.type+'\'';
    }
    if('mType' in body){
      sql +=' and a.twelfth = '+body.mType;
    }
    sql += ' order by a.regist_date desc limit ?,?';
    return await getResult(sql,param);
  },
  selectViewCount: async function(body,param){
    var sql = 'select count(*) as total from ('+periodQuery+userWhereQuery.replace('and ','where ')+' and a.wasComplete = \'O\' ';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and a.regist_date between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    if('keyword' in body){
      sql +=' and a.sixteenth = '+body.keyword;
    }
    if('ivt' in body){
      sql +=' and a.tenth = '+body.ivt;
    }
    if('type' in body){
      sql +=' and a.fifteenth = \''+body.type+'\'';
    }
    if('mType' in body){
      sql +=' and a.twelfth = '+body.mType;
    }
    sql +=') as t';
    var count = await getResult(sql,param);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
  },
  getSendCount: async function(param){
    var sql = "SELECT STRAIGHT_JOIN FORMAT(IFNULL(sum(s.send_total),0),0) as send, FORMAT(IFNULL(sum(s.success_total),0),0) as success, FORMAT(IFNULL(sum(s.fail_total),0),0) as fail FROM (";
    sql += customerViewQuery;
    sql += ") as a left join tm.statistics as s on a.real_id = s.id where a.wasComplete = 'O' and date(a.send_time) = date(now()) and s.id is not null ";
    sql += userWhereQuery;
    var result = await getResult(sql,param);
    return (result.length == 0) ? '' : result[0];
  },
  getTodayNReservationCount: async function(param,type){
    var sql = "SELECT STRAIGHT_JOIN FORMAT(IFNULL(sum(st.send_total),0),0) AS total FROM (";
    sql += customerViewQuery;
    sql += ") as a left join tm.campaign_summary as s on a.real_id = s.id left join tm.statistics as st on a.real_id = st.id  where (s.state = 7 or s.state = 10) ";
    if(type == '0'){
      sql += "and Date(a.send_time) = CURRENT_DATE() and a.twelfth = \'0\'";
    }
    else{
      sql += "and date(a.send_time) = date(now()) and a.twelfth = \'1\'"
    }
    sql += userWhereQuery;
    var result = await getResult(sql,param);
    return (result.length == 0) ? '' : result[0]['total'];
  },
  getWaitingCount: async function(param){
    var sql = "SELECT FORMAT(IFNULL(sum(a.send_total),0),0) AS total FROM (";
    sql += customerViewQuery.replace(', eighth',', eighth,count(*) as send_total').replace(',d.eighth',',d.eighth ,d.send_total');
    sql += ") as a left join tm.statistics as st on a.real_id = st.id where send_time > now() and a.twelfth = 1 ";
    sql += userWhereQuery;
    var result = await getResult(sql,param);
    return (result.length == 0) ? '' : result[0]['total'];
  },
  get7DayGraph: async function(param){
    var sql = "SELECT date_format(a.send_time,'%Y-%m-%d') as date, FORMAT(sum(s.success_total),0) as success, FORMAT(sum(s.fail_total),0) as fail FROM (";
    sql += customerViewQuery;
    sql += ") as a left join tm.statistics as s on a.real_id = s.id where a.wasComplete = 'O' and a.send_time BETWEEN date_sub(now(), INTERVAL 7 day) and now() ";
    sql += userWhereQuery;
    sql += "group by date(a.send_time)";
    return await getResult(sql,param);
  },
  getYesterday: async function(param){
    var sql = periodQuery+" where (a.send_time BETWEEN date_sub(now(), INTERVAL 1 day) and now() or Date(a.send_time) = CURRENT_DATE()) ";
    sql += userWhereQuery;
    sql += "order by a.send_time desc";
    return await getResult(sql,param);
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
    var result = await getResult2(sql,value,mail);
    if(result.length == 0){
      return {media_c:0,reporter_c:0};
    }
    return result[0];
  }
}

async function getResult(sql,param,dbName) {
  var db;
  if (dbName) db = new DBpromise();
  else db = new DBpromise("mail");
  console.log(sql);
  console.log(param);
  try{
    return await db.query(sql,param);
  } catch(e){
    console.log("DB Error:",e);
    return [];
  } finally{
    db.close();
  }
}
module.exports = period;
