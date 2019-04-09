const mysql = require('mysql');
const DBpromise = require('../db/db_info.js');
const logger = require('../winston/config_f.js');

/*
  지난기사보기 - content_view
*/
var content = {
  selectView: async function(param){
    var sql = 'SELECT * FROM manage_view where M_keyword_idx = ? and M_invitation = ? and M_template =\'0\' and ((M_type=0 and M_send is not null) or (M_type=1 and M_send < now())) ';
    var values = [param.keyword,param.ivt];
    if('idx' in param){
      sql += 'and n_idx=? ';
      values.push(param.idx);
    }
    if(values[1] == '0'){
      sql += 'order by M_seq_number*1 desc,n_idx desc ';
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
    var sql = 'SELECT count(*) as total FROM manage_view where M_keyword_idx = ? and M_invitation = ? and M_template =\'0\' and ((M_type=0 and M_send is not null) or (M_type=1 and M_send < now())) ';
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
  logger.info(mysql.format(sql, param)+';');
  try{
    return await db.query(sql,param);
  } catch(e){
    logger.error('DB Error:',e);
    return [];
  } finally{
    db.close();
  }
}

module.exports = content;
