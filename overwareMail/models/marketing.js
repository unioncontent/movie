const DBpromise = require('../db/db_info.js');

/*
 페이스북 테이블 - facebook_videos
 네이버 테이블 - naver_videos
*/

var marketing = {
  insertSNS: async function(param){
    var sql = 'insert into marketing_sns_mail(n_idx, ps_name, ps_title, ps_content, ps_writer, url, uid,\
    total_cnt,view_cnt, like_cnt, reply_cnt, share_cnt, writeDate, title_key, keyword, keyword_type, textType, thumbnail, createDate, updateDate, reportDate)\
    SELECT  sns_idx, sns_name, ';
    if(param.title == ''){
      sql += '\'\',';
    }
    else{
      sql += '\''+param.title+'\',';
    }
    sql+=' sns_content, sns_writer, url, uid, ?, ?, ?, ?, ?,\
    writeDate, title_key, keyword, keyword_type, textType, thumbnail, now(), now(),?\
    FROM facebook_videos where sns_idx = ?';
    // 값이 있으면 insert 안되도록
    sql += ' and NOT EXISTS (SELECT * FROM marketing_sns_mail WHERE n_idx = ?);'
    return await getResult(sql,[param.cnt,param.v_cnt,param.l_cnt,param.r_cnt,param.s_cnt,param.date,param.idx,param.idx]);
  },
  insertPortal: async function(param){
    var sql = 'insert into marketing_portal_mail(n_idx, ps_name, ps_content,ps_title, ps_writer, url, uid,\
    total_cnt,view_cnt, like_cnt, reply_cnt, share_cnt, writeDate,board_number, title_key, keyword, keyword_type, textType, thumbnail, createDate, updateDate, reportDate)\
    SELECT  portal_idx, portal_name, portal_title,';
    if(param.title == ''){
      sql += '\'\',';
    }
    else{
      sql += '\''+param.title+'\',';
    }
    sql +=' portal_writer, url, uid,\
    ?, ?, ?, ?, ?, writeDate, board_number, title_key, keyword, keyword_type, textType, thumbnail, now(), now(),?\
    FROM naver_videos where portal_idx = ?  and NOT EXISTS (SELECT * FROM marketing_portal_mail WHERE n_idx = ?);';
    return await getResult(sql,[param.cnt,param.v_cnt,param.l_cnt,param.r_cnt,param.s_cnt,param.date,param.idx,param.idx]);
  },
  insert: async function(table,param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(table,Object.keys(param));
    return await getResult(sql,pValue);
  },
  delete: async function(table,param){
    var sql = "delete from "+table+" where n_idx= ?";
    return await getResult(sql,param);
  },
  update: async function(table,param){
    var sql = "update "+table+"  set ps_title=?, reportDate=?";
    sql+= " where n_idx = ?";
    return await getResult(sql,param);
  },
  selectMarketingMailTable: async function(param){
    var sql = 'SELECT  * FROM marketing_mail where date(reportDate) = \''+param.eDate+'\' order by createDate desc';
    return await getResult(sql);
  },
  selectMarketingTable: async function(body,param){
    var sql = 'SELECT * FROM marketing_mail where url is not null';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and writeDate between \''+body.sDate+'\' and \''+body.eDate+'\'';
    }
    if('search' in body){
      sql +=' and (ps_title like \'%'+body.search+'%\' or ps_content like \'%'+body.search+'%\')';
    }
    sql += ' order by writeDate desc limit ?,?';
    return await getResult(sql,param);
  },
  selectMarketingTableCount: async function(body,param){
    var sql = 'SELECT count(*) as total FROM marketing_mail where url is not null';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and writeDate between \''+body.sDate+'\' and \''+body.eDate+'\'';
    }
    if('search' in body){
      sql +=' and (ps_title like \'%'+body.search+'%\' or ps_content like \'%'+body.search+'%\')';
    }
    var count = await getResult(sql,param[0]);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
  },
  selectFacebookTable: async function(body,param){
    var sql = "SELECT * FROM sns_view where url is not null ";
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and writeDate between \''+body.sDate+'\' and \''+body.eDate+'\'';
    }
    if('search' in body){
      sql +=' and sns_content like \'%'+body.search+'%\'';
    }
    if('writer' in body){
      sql +=' and sns_writer = \''+body.writer+'\'';
    }
    sql += ' order by writeDate desc limit ?,?';
    return await getResult(sql,param);
  },
  selectFacebookTableCount: async function(body,param){
    var sql = "SELECT count(*) as total FROM sns_view where url is not null ";
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and writeDate between \''+body.sDate+'\' and \''+body.eDate+'\'';
    }
    if('search' in body){
      sql +=' and sns_content like \'%'+body.search+'%\'';
    }
    if('writer' in body){
      sql +=' and sns_writer = \''+body.writer+'\'';
    }
    var count = await getResult(sql,param[0]);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
  },
  selectNaverTable: async function(body,param){
    var sql = "SELECT * FROM portal_view where portal_name like \'naver\'";
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and writeDate between \''+body.sDate+'\' and \''+body.eDate+'\'';
    }
    if('search' in body){
      sql +=' and portal_title like \'%'+body.search+'%\'';
    }
    sql += ' order by writeDate desc limit ?,?';
    return await getResult(sql,param);
  },
  selectNaverTableCount: async function(body,param){
    var sql = "SELECT count(*) as total FROM portal_view where portal_name = \'naver\'";
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and writeDate between \''+body.sDate+'\' and \''+body.eDate+'\'';
    }
    if('search' in body){
      sql +=' and portal_title like \'%'+body.search+'%\'';
    }
    var count = await getResult(sql);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
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
  console.log('sql : ',sql);
  console.log('param : ',param);
  try{
    return await db.query(sql,param);
  } catch(e){
    console.log('DB Error:',e);
    return [];
  } finally{
    db.close();
  }
}

module.exports = marketing;
