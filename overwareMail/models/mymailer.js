let funDB = require('../db/db_fun.js');



var mymailer = {
  selectMailList:async function(qeury){
    var sql = 'SELECT M_recipi,M_group,M_subject,M_send,M_regdate FROM `union`.manage_view where '+qeury+' order by M_send asc';
    return await funDB.getResult('d',sql);
  },
  selectMailidx:async function(param){
    var sql = 'SELECT concat(replace(GROUP_CONCAT( CAST(i.id AS char(100)) SEPARATOR \'|\'),\',\',\'\')) as id,concat(replace(GROUP_CONCAT( DATE_FORMAT(i.send_time, \'%Y-%m-%d %H:%i:%s\') SEPARATOR \'|\'),\',\',\'\')) as strtime,concat(\'n_idx = \',replace(GROUP_CONCAT( d.second SEPARATOR \' or n_idx =\'),\',\',\'\')) as whereQuery \
    FROM (select id,send_time from tm001.customer_info where send_time > now() and wasRead = \'O\' and wasSend = \'X\' and wasComplete = \'X\' and real_id is null order by send_time asc) as i \
    left join (select count(*) as total,a.* from tm001.customer_data as a group by id) as d on i.id = d.id';
    if(param=='1'){
      sql += ' and d.sixth != 25';
    }
    sql += ' order by i.send_time asc';
    return await funDB.getResult('m',sql);
  },
  countSelectMailList:async function(param){
    var sql = 'select count(*) as total from (SELECT i.* FROM tm001.customer_info as i\
    left join (select count(*) as total,a.* from tm001.customer_data as a group by id) as d on i.id = d.id\
    where i.send_time > now() and i.wasRead = \'O\' and i.wasSend = \'X\' and i.wasComplete = \'X\' and i.real_id is null';
    if(param=='1'){
      sql += ' and d.sixth != 25';
    }
    sql += ' ) as t';
    var total = await funDB.getResult('m',sql);
    var result = 0;
    if(total.length > 0){
      result = total[0]['total'];
    }
    return result;
  },
  selectSendCheckMail:async function(param){
    var sql = 'SELECT * FROM tm001.customer_info where id = ? and wasRead = \'O\' and wasSend = \'X\' and wasComplete = \'X\' and real_id is null';
    return await funDB.getResult('m',sql,param);
  },
  selectMailId:async function(param){
    var sql = 'SELECT * FROM customer_data where second = ? group by second';
    var result = await funDB.getResult('m',sql,param);
    var id = '';
    if(result.length > 0){
      id = result[0].id;
    }
    return id;
  },
  selectResultDetail:async function(param){
    var sql = 'SELECT d.id,a.send_success,a.status,a.email as EMTOADDRESS,d.first as EMTONAME,d.thirteenth as M_ptitle,d.real_id,d.title as M_subject,\
    a.read_time as OPENTIME,a.send_time as SENDTIME,d.regist_date as GENDATE,d.eighth as M_keyword_str,f.error_code, f.contents\
    FROM tm.campaign_result'+param[0]+' as a\
    left join (select i.id,b.eighth,b.email,b.regist_date,b.first,b.thirteenth, i.real_id,i.title from customer_data as b left join tm001.customer_info as i on b.id = i.id where i.real_id = \''+param[0]+'\') as d on a.email = d.email\
    left join tm.fail_cause as f on d.real_id = f.campaign_id and a.email = f.email';
    if(param[1] != 'OX'){
      sql += 'where a.send_success = ?';
    }
    return await funDB.getResult('m',sql,param[1]);
  },
  insertMailSendUser: async function(values){
    var sql = "INSERT INTO customer_data (id,second, email, first, sixth, seventh, eighth, ninth, tenth, eleventh, twelfth, thirteenth, fifteenth,seventeenth,eighteenth,nineteenth,regist_date) VALUES ?";
    Promise.all(values).then(async function(v) {
      return await funDB.getResult('m',sql,[v]);
    }).catch(function(err){
      console.log("Promise.all error : ", err);
      return;
    });
  },
  insert: async function(table,param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(table,Object.keys(param));
    return await funDB.getResult('m',sql,pValue);
  },
  updateType: async function(param){
    var sql = "update customer_data set twelfth=? where second=?";
    return await funDB.getResult('m',sql,param);
  },
  updateSendNow: async function(id,check){
    var sql = "update tm001.customer_info set send_time=now(),wasRead='"+check+"',wasSend='"+check+"',wasComplete='"+check+"',real_id=null where id=?";
    return await funDB.getResult('m',sql,id);
  },
  updateSendInfo: async function(param){
    var sql = "update tm001.customer_info set wasRead=?,wasSend=?,wasComplete=?,real_id=null where id=?";
    return await funDB.getResult('m',sql,param);
  },
  deleteSendTable: async function(param){
    var sql = "delete from tm001.customer_data where id=?";
    return await funDB.getResult('m',sql,param);
  },
  deleteInfoTable: async function(param){
    var sql = "delete from tm001.customer_info where id=?";
    return await funDB.getResult('m',sql,param);
  },
  deleteBackupTable: async function(param){
    var sql = "delete from union_mail.customer_info_back where id=?";
    var result = await funDB.getResult('d',sql,param);
    result = await funDB.getResult('o',sql,param);
    sql = "delete from union_mail.customer_data_back where id=?";
    result = await funDB.getResult('d',sql,param);
    result = await funDB.getResult('o',sql,param);
    sql = "delete from union_mail.mymailer_statistics where id=?";
    result = await funDB.getResult('d',sql,param);
    return result;
  },
  getCampaignId: async function(id){
    var sql = "select real_id as id from tm001.customer_info where id=?";
    var result = await funDB.getResult('m',sql,param);
    return (result.length == 0) ? '' : result[0];
  }
}

function insertSqlSetting(table,keys){
  var arr = [].map.call(keys, function(obj) { return "?"; });
  columns = keys.join(", ");
  placeholders = arr.join(", ");
  var sql = "INSERT INTO "+table+" ( "+columns+" ) VALUES ( "+placeholders+" );";

  return sql;
}
//
// async function getResult(sql,param,dbName) {
//   var db;
//   if(dbName) db = new DBpromise();
//   else db = new DBpromise("mymailer");
//   try{
//     logger.info(mysql.format(sql, param)+';');
//     return await db.query(sql,param);
//   } catch(e){
//     logger.error('DB Error:',e);
//     return [];
//   } finally{
//     db.close();
//   }
// }
module.exports = mymailer;
