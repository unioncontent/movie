const DBpromise = require('../db/db_info.js');

/*
  리포터 테이블 - reporter_data
  user 테이블 - user_data
*/

var user = {
  selectReporter: async function(param){
    var sql = 'select distinct(reporter_media_name) from reporter_data'
    if(param.length == 3){
      sql += ' where reporter_media_name like \'%?%\''
    }
    sql += 'order by reporter_media_name limit ?,?;';
    return await getResult(sql,param);
  },
  emailCheck: async function(param){
    var sql = 'select * from reporter_data where email=?;';
    return await getResult(sql,param);
  }
}

async function getResult(sql,param) {
  var db = new DBpromise();
  try{
    return await db.query(sql,param);
  } catch(e){
    console.log(e);
    return [];
  } finally{
    db.close();
  }
}

module.exports = user;
