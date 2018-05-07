const DBpromise = require('../db/db_info.js');

/*
 키워드 테이블 - keyword_data
*/

var keyword = {
  selectMovieKwd: async function(admin,param){
    if(admin != null){
      param = admin;
    }
    var sql = 'SELECT * FROM keyword_data where user_idx=? and keyword_property=\'포함\' group by keyword_main';
    return await getResult(sql,param);
  },
  selectMovieKwdAll: async function(admin,param){
    if(admin != null){
      param = admin;
    }
    var value = [param,param];
    var sql = '(SELECT keyword_main as M_keyword,keyword_idx as M_keyword_idx FROM keyword_data where user_idx=? and keyword_property=\'포함\' group by keyword_main) union\
              (SELECT M_keyword,M_keyword_idx FROM period_view where ';
    if(admin == null){
      sql += ' M_id=? or M_id in (select n_idx from m_mail_user where user_admin=?) ';
      value.push(param);
    }
    else{
      sql += ' M_id=? ';
    }
    sql += 'group by M_keyword)';
    return await getResult(sql,value);
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
