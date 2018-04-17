const DBpromise = require('../db/db_info.js');

/*
  리포터 테이블 - reporter_data
  user 테이블 - user_data
*/

var user = {
  checkId: async function(param) {
    var sql = 'select * from user_data where user_ID=?';
    return await getResult(sql,param);
  },
  deleteReporter: async function(email,param){
    var sql = 'delete from reporter_data where reporter_email like \'%'+email+'%\' and reporter_name=?';
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
  selectReporter: async function(search,param){
    var sql = 'select distinct(reporter_media_name) from reporter_data ';
    if(search != ''){
      sql += ' where reporter_media_name like \'%'+search+'%\' ';
    }
    sql += ' order by reporter_media_name limit ?,?;';
    return await getResult(sql,param);
  },
  selectReporterCount: async function(search,param){
    var sql = 'select count(*) as total from (select distinct(reporter_media_name) from reporter_data ';
    if(search != ''){
      sql += ' where reporter_media_name like \'%'+search+'%\' ';
    }
    sql += ' ) a;';
    return await getResult(sql,param);
  }
}

async function getResult(sql,param) {
  var db = new DBpromise();
  try{
    console.log(sql,param);
    return await db.query(sql,param);
  } catch(e){
    console.log('DB Error:',e);
    return [];
  } finally{
    db.close();
  }
}

module.exports = user;
