const DBpromise = require("../db/db_info.js");

var mymailer = {
  selectSendCheckMail:async function(param){
    var sql = 'SELECT * FROM customer_info where id = ? and wasRead = \'O\' and wasSend = \'X\' and wasComplete = \'X\' and real_id is null';
    return await getResult(sql,param);
  },
  selectResultDetail:async function(param){
    var sql = 'SELECT d.id,a.send_success,a.status,a.email as EMTOADDRESS,d.first as EMTONAME,d.thirteenth as M_ptitle,d.real_id,d.title as M_subject,\
    a.read_time as OPENTIME,a.send_time as SENDTIME,d.regist_date as GENDATE,d.eighth as M_keyword_str,f.error_code, f.contents\
    FROM tm.campaign_result'+param[0]+' as a\
    left join (select i.id,b.eighth,b.email,b.regist_date,b.first,b.thirteenth, i.real_id,i.title from tm001.customer_data as b left join tm001.customer_info as i on b.id = i.id where i.real_id = \''+param[0]+'\') as d on a.email = d.email\
    left join tm.fail_cause as f on d.real_id = f.campaign_id and a.email = f.email';
    if(param[1] != 'OX'){
      sql += 'where a.send_success = ?';
    }
    return await getResult(sql,param[1]);
  },
  insertMailSendUser: async function(values){
    var sql = "INSERT INTO customer_data (id,second, email, first, sixth, seventh, eighth, ninth, tenth, eleventh, twelfth, thirteenth, fourteenth,fifteenth,sixteenth,seventeenth,eighteenth,nineteenth,regist_date) VALUES ?";
    Promise.all(values).then(async function(v) {
      return await getResult(sql,[v]);
    }).catch(function(err){
      console.error("Promise.all error", err);
      return;
    });
  },
  insert: async function(table,param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(table,Object.keys(param));
    return await getResult(sql,pValue);
  },
  updateType: async function(param){
    var sql = "update customer_data set twelfth=? where second=?";
    return await getResult(sql,param);
  },
  updateSendNow: async function(id,check){
    var sql = "update customer_info set send_time=now(),wasRead='"+check+"',wasSend='"+check+"',wasComplete='"+check+"',real_id=null where id=?";
    return await getResult(sql,id);
  },
  updateSendInfo: async function(param){
    var sql = "update customer_info set wasRead=?,wasSend=?,wasComplete=?,real_id=null where id=?";
    return await getResult(sql,param);
  },
  deleteSendTable: async function(param){
    var sql = "delete from customer_data where id=?";
    return await getResult(sql,param);
  },
  deleteInfoTable: async function(param){
    var sql = "delete from customer_info where id=?";
    return await getResult(sql,param);
  },
  deleteBackupTable: async function(param){
    var sql = "delete from union_mail.customer_info_back where id=?";
    var result = await getResult(sql,param,'maillink');
    sql = "delete from union_mail.customer_data_back where id=?";
    result = await getResult(sql,param,'maillink');
    sql = "delete from union_mail.mymailer_statistics where id=?";
    result = await getResult(sql,param,'maillink');
    return result;
  },
  getCampaignId: async function(id){
    var sql = "select real_id as id from customer_info where id=?";
    var result = await getResult(sql,param);
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

async function getResult(sql,param,dbName) {
  var db;
  if(dbName) db = new DBpromise();
  else db = new DBpromise("mymailer");
  try{
    console.log(sql);
    console.log(param);
    return await db.query(sql,param);
  } catch(e){
    console.log("DB Error:",e);
    return [];
  } finally{
    db.close();
  }
}

module.exports = mymailer;
