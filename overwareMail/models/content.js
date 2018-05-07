const DBpromise = require('../db/db_info.js');
/*
  지난기사보기 - content_view
*/
var content = {
  selectView: async function(param){
    var sql = 'SELECT * FROM content_view where keyword_idx = ? ';
    var values = [param.keyword];
    if('idx' in param){
      sql += 'and n_idx=? ';
      values.push(param.idx);
    }
    sql += 'order by n_idx ';
    if('page' in param){
      if(parseInt(param.page) > -1){
        sql +='limit ?,10';
        values.push(param.page);
      }
    }
    return await getResult(sql,values);
  },
  selectViewCount: async function(param){
    var sql = 'SELECT count(*) FROM content_view where keyword_idx = ? ';
    var values = [param.keyword];
    if('idx' in param){
      sql += 'and n_idx=? ';
      values.push(param.idx);
    }
    sql += 'order by n_idx';
    return await getResult(sql,values);
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

module.exports = content;
