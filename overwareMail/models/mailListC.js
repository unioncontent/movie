const DBpromise = require('../db/db_info.js');

/*
 메일 그룹 리스트 테이블 - m_mail_list_c
 View 테이블 - mail_list_group_view
*/

var mailListC = {
  selectView: async function(body,param,callback){
    var sql = 'select user_name,search,M_group_title,count(*) as groupCount,M_ID';
    if (typeof body.as !== 'undefined') {
      sql += body.as+' ,CONCAT(M_group_title, \'&lt;\', count(*), \'명&gt;\') as text ';
    }
    sql += ' FROM mail_list_group_view where ';
    if (typeof body.search !== 'undefined') {
      sql += ' search like \'%'+body.search+'%\'and ';
    }
    sql += ' M_ID = ?';
    sql += ' group by search order by search limit ?,?';
    return await getResult(sql,param);
  },
  selectViewCount: async function(body,param){
    var sql = 'select count(*) as total from (SELECT * FROM mail_list_group_view where';
    if (typeof body.search !== 'undefined') {
      sql += ' search like \'%'+body.search+'%\'and ';
    }
    sql += ' M_ID = ?';
    sql += ' group by M_group_title) a';
    var count = await getResult(sql,param);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
  }
}

async function getResult(sql,param) {
  console.log(sql,param);
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
module.exports = mailListC;
