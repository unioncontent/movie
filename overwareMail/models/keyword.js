const DBpromise = require('../db/db_info.js');

/*
 키워드 테이블 - keyword_data
 메일 키워드 테이블 - m_keyword_data
*/

var keyword = {
  selectMovieKwd: async function(admin,param){
    var sql = 'SELECT * FROM m_keyword_data where user_idx=? and keyword_property=1';
    return await getResult(sql,param);
  },
  selectKwdList: async function(body,param){
    var sql = 'SELECT keyword_idx, user_idx, keyword_property, keyword_main,  DATE_FORMAT(createDate, \'%Y-%m-%d %H:%i:%s\') AS createDate, DATE_FORMAT(updateDate, \'%Y-%m-%d %H:%i:%s\') AS updateDate FROM m_keyword_data where user_idx=?';
    if('keyword' in body){
      sql +=' and keyword_main like \'%'+body.keyword+'%\'';
    }
    sql += ' order by keyword_idx desc limit ?,?';
    return await getResult(sql,param);
  },
  selectKwdListCount: async function(body,param){
    var sql = 'SELECT count(*) as total FROM m_keyword_data where user_idx=?';
    if('keyword' in body){
      sql +=' and keyword_main like \'%'+body.keyword+'%\'';
    }
    sql += ' order by keyword_idx desc';
    var count = await getResult(sql,param);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
  },
  insert: async function(table,param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(table,Object.keys(param));
    return await getResult(sql,pValue);
  },
  addKwdCheck: async function(param) {
    var sql = 'select * from m_keyword_data where keyword_main=?';
    return await getResult(sql,param);
  },
  update: async function(param){
    var pValue = Object.values(param);
    var sql = 'update m_keyword_data set keyword_main=? where keyword_idx=?';
    return await getResult(sql,pValue);
  },
  updateState: async function(param){
    var pValue = Object.values(param);
    var sql = 'update m_keyword_data set keyword_property=? where keyword_idx=?';
    return await getResult(sql,pValue);
  },
  delete: async function(param){
    var sql = 'delete from m_keyword_data where keyword_idx=?';
    return await getResult(sql,param);
  },
  selectMovieKwdAll: async function(admin,param){
    if(admin != null){
      param = admin;
    }
    var sql = 'select * from m_keyword_data where user_idx=?';
    return await getResult(sql,param);
  },
  selectKwd_o: async function(){
    var sql = 'select * from keyword_data where user_idx=1 and keyword_property = \'포함\' group by keyword_main';
    return await getResult(sql);
  }
}

function insertSqlSetting(table,keys){
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

module.exports = keyword;
