const DBpromise = require('../db/db_info.js');

/*
 메일발송상세 테이블 - m_mail_detail_b
*/

var mailDetailB = {
  insert: async function(param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(Object.keys(param));
    return await getResult(sql,pValue);
  },
  delete: async function(n_idx){
    var sql = 'delete from m_mail_detail_b where M_idx_A=?';
    return await getResult(sql,[n_idx]);
  },
  selectTable:async function(param){
    var sql = 'SELECT * FROM m_mail_detail_b where M_idx_A=? ';
    if('M_result' in param){
      sql+='and M_result';
      if(param.M_result == 'success'){
        sql += '=?'
      }else{
        sql += '!=?'
      }
    }
    sql+=' group by E_mail';
    return await getResult(sql,param.arr);
  },
  selectCounResult: async function(param){
    var sql = 'SELECT count(if(M_result=250,1,null)) as s,count(if(M_result!=250,1,null)) as f  from (SELECT * FROM m_mail_detail_b where M_idx_A=? group by E_mail) a';
    return await getResult(sql,param);
  },
  resetMSend:async function(param){
    var sql = 'update m_mail_detail_b set M_send=null where M_idx_A=?';
    return await getResult(sql,param);
  },
  updateSendDateResult:async function(param){
    var sql = 'update m_mail_detail_b set M_send=now() where M_idx_A=?';
    return await getResult(sql,param);
  },
  updateResult:async function(param){
    var sql = 'update m_mail_detail_b set M_result=?,M_result_msg=? where M_idx_A=?';
    return await getResult(sql,param);
  },
  updateResult2:async function(param,email){
    var sql = 'update m_mail_detail_b set M_result=?,M_result_msg=? where E_mail like \'%'+email+'%\' and M_idx_A=?';
    // var sql = 'insert into m_mail_detail_b (M_idx_A,M_result,P_title,P_name,M_result_msg,E_mail) values(?,?,?,?,?,?) on duplicate key update M_idx_A=?,M_result=?,M_result_msg=?';
    // var value = [param[2],param[0],'','',param[1],email,param[2],param[0],param[1]];
    // return await getResult(sql,value);
    return await getResult(sql,param);
  }
}

function insertSqlSetting(keys){
  var arr = [].map.call(keys, function(obj) { return '?'; });
  columns = keys.join(', ');
  placeholders = arr.join(', ');
  var sql = "INSERT INTO m_mail_detail_b ( "+columns+" ) VALUES ( "+placeholders+" );";

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

module.exports = mailDetailB;
