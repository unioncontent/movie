const DBpromise = require('../db/db_info.js');

/*
 키워드 테이블 - keyword_data
*/

var keyword = {
  selectMovieKwd: async function(){
    var sql = 'SELECT * FROM keyword_data where user_idx!=9 and keyword_property=\'포함\' group by keyword_main';
    return await getResult(sql,[]);
  }
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

module.exports = keyword;
