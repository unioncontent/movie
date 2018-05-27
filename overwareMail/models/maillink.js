const DBpromise = require('../db/db_info.js');
/*
  maillink send - ml_automail_tran
  maillink result - ml_automail_message
  maillink backup - ml_automail_tran_201805
  메일 발송 상세 결과 view - mail_send_result
*/
var mail = {
  insert: async function(table,param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(table,Object.keys(param));
    return await getResult(sql,pValue);
  },
  deleteMlAMSG: async function(param){
    var sql = 'delete from ml_automail_message where MSGID=?;';
    return await getResult(sql,param);
  },
  deleteMlAT: async function(param){
    var sql = 'delete from ml_automail_tran where MSGID=?;';
    await getResult(sql,param)
    sql = 'delete from ml_automail_tran_201805 where MSGID=?;';
    return await getResult(sql,param);
  },
  selectResultDetail:async function(param){
    var sql = 'SELECT * FROM mail_send_result where n_idx=? ';
    if('M_result' in param){
      sql+='and FINALRESULT';
      if(param.M_result == 'success'){
        sql += '=?'
      }else{
        sql += '!=?'
      }
    }
    sql+=' group by EMTOADDRESS';
    return await getResult(sql,param.arr);
  },
  selectResult: async function(param){
    var sql = 'select distinct RSLTMSG from ml_automail_tran where MSGID = ?';
    var result = await getResult(sql,param);
    var returnVal = false;
    console.log(result);
    console.log(result.length);
    if(result.length == 1){
      returnVal = true;
    }
    return returnVal;
  },
  selectResult2: async function(param){
    var sql = 'select * from ml_automail_tran where MSGID = ?';
    return await getResult(sql,param);
  },
  selectResult3: async function(param){
    var sql = 'select * from ml_automail_tran where MSGID = ? and EMTOADDRESS = ?';
    return await getResult(sql,param);
  }
}

function insertSqlSetting(table,keys){
  // INSERT INTO ML_AUTOMAIL_MESSAGE (MSGID, CONTENT,STATUS,GENDATE)VALUES('4','','1',now());
  // INSERT INTO ML_AUTOMAIL_TRAN (AUTOMAILID, CHANNEL, MSGGENTYPE, EMSUBJECT, EMFROMNAME, EMFROMADDRESS, EMTONAME, EMTOADDRESS,EMMSGURL, SENDTIME, GENDATE)
  // VALUES ('AU-4126512', '1','U', '테스트중입니다.','변수연', 'smb1457@naver.com', '변수연','smb1457@daum.net' ,'http://showbox.email/preview?keyword=656&idx=367',GETDATE(),GETDATE());
  var arr = [].map.call(keys, function(obj) { return '?'; });
  columns = keys.join(', ');
  placeholders = arr.join(', ');
  var sql = "INSERT INTO "+table+" ( "+columns+" ) VALUES ( "+placeholders+" );";
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

module.exports = mail;
