const DBpromise = require('../db/db_info.js');

/*
  리포터 테이블 - reporter_data
  user 테이블 - user_data
*/

var user = {
  checkId: async function(param,callback) {
    var sql = 'select * from user_data where user_ID=?';
    return await getResult(sql,param);
  },
  getNextReporterID: async function(){
    var sql = 'select replace(reporter_ID,\'P\',\'\') as reporter_ID from reporter_data where reporter_ID is not null ORDER BY reporter_idx DESC LIMIT 1;';
    var result = await getResult(sql,[]);
    return parseInt(result[0].reporter_ID)+1;
  },
  reporterCheck: async function(param){
    var sql = 'select * from reporter_data where reporter_email=? and reporter_name=? and reporter_media_name=?';
    return await getResult(sql,param);
  },
  selectReporter: async function(param){
    var sql = 'select distinct(reporter_media_name) from reporter_data ';
    if(param.length == 3){
      param[0] = '%'+param[0]+'%';
      sql += ' where reporter_media_name like ? ';
    }
    sql += ' order by reporter_media_name limit ?,?;';
    return await getResult(sql,param);
  },
  selectReporterCount: async function(param){
    var sql = 'select count(*) as total from (select distinct(reporter_media_name) from reporter_data ';
    if(param.length == 3){
      param[0] = '%'+param[0]+'%';
      sql += ' where reporter_media_name like ? ';
    }
    sql += ' ) a;';
    return await getResult(sql,param);
  }
}

async function getResult(sql,param) {
  var db = new DBpromise();
  try{
    return await db.query(sql,param);
  } catch(e){
    return [];
  } finally{
    db.close();
  }
}

module.exports = user;
