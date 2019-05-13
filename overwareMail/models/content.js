let funDB = require('../db/db_fun.js');

/*
  지난기사보기 - manage_view
*/
var content = {
  selectView: async function(param){
    var sql = 'SELECT * FROM manage_view WHERE M_delete != 1 and M_keyword_idx = ? and M_invitation = ? and M_template =\'0\' and ((M_type=0 and M_send is not null) or (M_type=1 and M_send < now())) ';
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
    return await funDB.getResult('d',sql,values);
  },
  selectViewCount: async function(param){
    var sql = 'SELECT count(*) as total FROM manage_view WHERE M_delete != 1 and M_keyword_idx = ? and M_invitation = ? and M_template =\'0\' and ((M_type=0 and M_send is not null) or (M_type=1 and M_send < now())) ';
    var values = [param.keyword,param.ivt];
    if('idx' in param){
      sql += 'and n_idx=? ';
      values.push(param.idx);
    }
    return await funDB.getResult('d',sql,values);
  }
}

module.exports = content;
