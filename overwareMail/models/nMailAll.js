const DBpromise = require('../db/db_info.js');

/*
 메일발송리스트 테이블 - n_mail_all
*/

var nMailAll = {
  insert: async function(param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(Object.keys(param));
    return await getResult(sql,pValue);
  },
  delete: async function(n_idx){
    var sql = 'delete from n_mail_all where n_idx=?';
    return await getResult(sql,[n_idx]);
  },
  selectSendMailDate:async function(n_idx){
    var sql = 'SELECT distinct M_subject,n_idx FROM n_mail_all order by M_subject desc,n_idx desc';
    var result = await getResult(sql);
    if(result.length == 0){
      return [];
    }
    else{
      return {
        M_subject: [].map.call(result, function(obj) {
          var arr = obj.M_subject.split(']');
          return arr[0].replace('[','');
        }),
        n_idx:[].map.call(result, function(obj) {return obj.n_idx;})
      };

    }
    return ;
  }
}

function insertSqlSetting(keys){
  var arr = [].map.call(keys, function(obj) { return '?'; });
  columns = keys.join(', ');
  placeholders = arr.join(', ');
  var sql = "INSERT INTO n_mail_all ( "+columns+" ) VALUES ( "+placeholders+" );";

  return sql;
}

async function getResult(sql,param) {
  var db = new DBpromise();
  console.log(sql,param);
  try{
    return await db.query(sql,param);
  } catch(e){
    console.log(sql,'DB Error');
    // console.log('DB Error:',e);
    return [];
  } finally{
    db.close();
  }
}

module.exports = nMailAll;
