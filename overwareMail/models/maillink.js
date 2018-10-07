const DBpromise = require('../db/db_info.js');
/*
  maillink send - ml_automail_tran
  maillink result - ml_automail_message
  maillink backup - ml_automail_tran_201805
  메일 발송 상세 결과 view - mail_send_result
*/
var mail = {
  selectMailTableName: async function(){
    sql = 'SELECT TABLE_NAME FROM Information_schema.tables \
    WHERE table_schema = \'union_mail\' \
    AND table_name LIKE \'ml_automail_tran_%\';';
    return await getResult(sql);
  },
  insert: async function(values){
    var sql = 'INSERT INTO union_mail.ml_automail_tran ( AUTOMAILID, CHANNEL, MSGGENTYPE, EMSUBJECT, EMFROMNAME, EMFROMADDRESS, EMTONAME, EMTOADDRESS, EMMSGURL, SENDTIME, GENDATE, ETC1 ) VALUES ?';
    Promise.all(values).then(async function(v) {
      return await getResult(sql,[v]);
    }).catch(function(err){
      console.error('Promise.all error', err);
      return;
    });
  },
  insertTest: async function(values){
    var sql = 'INSERT INTO union_mail.ml_automail_tran ( AUTOMAILID, CHANNEL, MSGGENTYPE, EMSUBJECT, EMFROMNAME, EMFROMADDRESS, EMTONAME, EMTOADDRESS, EMMSGURL, SENDTIME, GENDATE, ETC1 ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
    return await getResult(sql,values);
  },
  insert2: async function(table,param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(table,Object.keys(param));
    return await getResult(sql,pValue);
  },
  update: async function(param){
    var sql = 'update n_mail_all set M_body = ? where n_idx = ?';
    return await getResult(sql,param);
  },
  updateURL: async function(){
    var sql = 'update union_mail.ml_automail_tran set EMMSGURL = concat(EMMSGURL,\'&num=\',SEQ) where EMMSGURL not like \'%&num=%\'';
    return await getResult(sql);
  },
  deleteTest: async function(param){
    var sql = 'delete from union_mail.ml_mail_test where n_idx=?;';
    return await getResult(sql,param);
  },
  deleteMlAMSG: async function(param){
    var sql = 'delete from union_mail.ml_automail_message where MSGID=?;';
    return await getResult(sql,param);
  },
  deleteMlATI: async function(param){
    var sql = 'delete from union_mail.ml_automail_tran where SEQ=?;';
    return await getResult(sql,param)
  },
  deleteMlAT: async function(param){
    var sql = 'delete from union_mail.ml_automail_tran where ETC1=?;';
    return await getResult(sql,param)
    // sql = 'delete from ml_automail_tran_201805 where MSGID=?;';
    // return await getResult(sql,param);
  },
  deleteMlABackUp: async function(table,param){
    sql = 'delete from union_mail.'+table+' where ETC1=?;';
    return await getResult(sql,param);
  },
  deleteMlABackUpTest: async function(table,param){
    sql = 'delete from union_mail.'+table+' where SEQ=?';
    return await getResult(sql,param);
  },
  selectResultDetail:async function(param){
    // var sql = 'SELECT * FROM mail_send_result where n_idx=? ';
    // if('M_result' in param){
    //   if(param.M_result == 'success'){
    //     sql += 'and (FINALRESULT=? or (SENDRESULT = \'OK\' and FINALRESULT is null))';
    //   }else{
    //     sql += 'and ((FINALRESULT is not null and FINALRESULT != ?) or (SENDRESULT is not null and SENDRESULT = \'ER\'))';
    //   }
    // }
    var sql = 'select * from (select STRAIGHT_JOIN b.SEQ,b.MSGID,b.EMSUBJECT,l.M_ptitle, b.EMTONAME, b.EMTOADDRESS, b.PROCESSYN, b.SENDRESULT, b.FINALRESULT, b.RSLTMSG,\
    DATE_FORMAT(b.SENDTIME, \'%Y-%m-%d %H:%i:%s\') as SENDTIME, DATE_FORMAT(b.GENDATE, \'%Y-%m-%d %H:%i:%s\') as GENDATE, DATE_FORMAT(b.OPENTIME, \'%Y-%m-%d %H:%i:%s\') as OPENTIME\
    from (select * from `union`.mail_send_backup where MSGID=?';
    if('M_result' in param){
      if(param.M_result == 'success'){
        sql += ' and (FINALRESULT = 13 or (FINALRESULT is null and SENDRESULT =\'OK\'))';
      }else{
        sql += ' and (FINALRESULT != 13 or (SENDRESULT is not null and SENDRESULT =\'ER\'))';
      }
    }
    sql += ') as b left join m_mail_list_all as l\
    on b.EMTONAME = l.M_name\
    group by b.SEQ order by null) as j order by j.EMTONAME asc'
    return await getResult(sql,param.arr[0]);
  },
  selectResult: async function(param){
    var sql = 'select distinct RSLTMSG from mail_send_backup where MSGID = ?';
    var result = await getResult(sql,param);
    var returnVal = false;
    if(result.length == 1){
      returnVal = true;
    }
    return returnVal;
  },
  selectResultDetail2: async function(param){
    // ,l.M_ptitle
    // left join m_mail_list_all as l on a.EMTOADDRESS = l.M_email
    var sql = 'select a.MSGID,l.M_ptitle,m.M_type,k.keyword_main as M_keyword_str,m.M_mail_type,m.M_invitation,m.M_seq_number,m.M_subject,a.EMTONAME,a.EMTOADDRESS,a.SENDTIME,a.FINALRESULT,m.M_regdate as GENDATE,a.OPENTIME\
    from (SELECT * FROM `union`.mail_send_backup where MSGID=? and ';
    if(param[1] == 13){
      sql +='((FINALRESULT=13) or (FINALRESULT is null and PROCESSYN = \'Y\'))';
    }
    else{
      sql +='(FINALRESULT!=13)';
    }
    sql +=') as a left join m_mail_all_a as m\
    on a.MSGID = m.n_idx\
    left join m_mail_list_all as l on a.EMTOADDRESS = l.M_email\
    left join m_keyword_data as k\
    on m.M_keyword = k.keyword_idx';
    return await getResult(sql,param[0]);
  },
  selectEmailOneView:async function(idx){
    var sql = 'SELECT * FROM union_mail.ml_mail_test where n_idx=?';
    return await getResult(sql,idx);
  }
}

function insertSqlSetting(table,keys){
  // INSERT INTO ML_AUTOMAIL_MESSAGE (MSGID, CONTENT,STATUS,GENDATE)VALUES('4','','1',now());
  // INSERT INTO ML_AUTOMAIL_TRAN (AUTOMAILID, CHANNEL, MSGGENTYPE, EMSUBJECT, EMFROMNAME, EMFROMADDRESS, EMTONAME, EMTOADDRESS,EMMSGURL, SENDTIME, GENDATE)
  // VALUES ('AU-4126512', '1','U', '테스트중입니다.','변수연', 'smb1457@naver.com', '변수연','smb1457@daum.net' ,'http://showbox.email/preview?keyword=656&idx=367',GETDATE(),GETDATE());
  var arr = [].map.call(keys, function(obj) { return '?'; });
  columns = keys.join(', ');
  placeholders = arr.join(', ');
  var sql = "INSERT INTO union_mail."+table+" ( "+columns+" ) VALUES ( "+placeholders+" );";
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
