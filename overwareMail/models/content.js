const DBpromise = require('../db/db_info.js');
/*
  지난기사보기 - content_view
*/
var content = {
  selectView: async function(param){
    var sql = 'SELECT M_invitation,keyword_idx, keyword,M_seq_number, n_idx, M_subject, m_body,date_format(M_send, \'%Y-%m-%d %H:%i:%s\') as M_send FROM content_view where keyword_idx = ? and M_invitation = ? ';
    var values = [param.keyword,param.ivt];
    if('idx' in param){
      sql += 'and n_idx=? ';
      values.push(param.idx);
    }
    if(values[1] == '0'){
      sql += 'order by M_seq_number desc,n_idx desc ';
    }
    else{
      sql += 'order by n_idx desc ';
    }
    if('page' in param){
      if(parseInt(param.page) > -1){
        param.page = (param.page-1) * 5;
        sql +='limit ?,5';
        values.push(param.page);
      }
    }
    return await getResult(sql,values);
  },
  selectViewCount: async function(param){
    var sql = 'SELECT count(*) as total FROM content_view where keyword_idx = ? and M_invitation = ? ';
    var values = [param.keyword,param.ivt];
    if('idx' in param){
      sql += 'and n_idx=? ';
      values.push(param.idx);
    }
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
