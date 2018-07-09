const DBpromise = require('../db/db_info.js');

/*
 페이스북 테이블 - facebook_videos
 네이버 테이블 - naver_videos
*/

var marketing = {
  insertSNS: async function(param){
    var sql = 'insert into marketing_mail(sns_idx, ps_name, ps_title, ps_content, ps_writer, url, uid,\
    total_cnt,view_cnt, like_cnt, reply_cnt, share_cnt, writeDate, title_key, keyword, keyword_type, textType, thumbnail, createDate, updateDate)\
    SELECT  sns_idx, sns_name, ';
    if(param.title == ''){
      sql += '\'\',';
    }
    else{
      sql += '\''+param.title+'\',';
    }
    sql+=' sns_content, sns_writer, url, uid, ?, view_cnt, like_cnt, reply_cnt, share_cnt,\
    writeDate, title_key, keyword, keyword_type, textType, thumbnail, now(), now()\
    FROM facebook_videos where sns_idx = ?';
    // 값이 있으면 insert 안되도록
    sql += ' and NOT EXISTS (SELECT * FROM marketing_mail WHERE sns_idx = ?);'
    return await getResult(sql,[param.cnt,param.idx,param.idx]);
  },
  insertPortal: async function(param){
    var sql = 'insert into marketing_mail(portal_idx, ps_name, ps_content,ps_title, ps_writer, url, uid,\
    total_cnt,view_cnt, like_cnt, reply_cnt, share_cnt, writeDate,board_number, title_key, keyword, keyword_type, textType, thumbnail, createDate, updateDate)\
    SELECT  portal_idx, portal_name, portal_title,';
    if(param.title == ''){
      sql += '\'\',';
    }
    else{
      sql += '\''+param.title+'\',';
    }
    sql +=' portal_writer, url, uid,\
    ?, view_cnt, like_cnt, reply_cnt, share_cnt, writeDate, board_number, title_key, keyword, keyword_type, textType, thumbnail, now(), now()\
    FROM naver_videos where portal_idx = ?  and NOT EXISTS (SELECT * FROM marketing_mail WHERE portal_idx = ?);';
    return await getResult(sql,[param.cnt,param.idx,param.idx]);
  },
  insert: async function(table,param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(table,Object.keys(param));
    return await getResult(sql,pValue);
  },
  delete: async function(param){
    var sql = "delete from marketing_mail where sns_idx=? or portal_idx = ?";
    return await getResult(sql,param);
  },
  update: async function(param){
    var sql = "update marketing_mail set ps_title=?";
    sql+= " where sns_idx=? or portal_idx = ?";
    return await getResult(sql,param);
  },
  selectMarketingTable: async function(body,param){
    var sql = 'SELECT portal_idx, sns_idx, ps_name, ps_title, ps_content, ps_writer, url, \
    FORMAT(view_cnt,0) as view_cnt, FORMAT(like_cnt,0) as like_cnt, FORMAT(reply_cnt,0) as reply_cnt, FORMAT(total_cnt,0) as total_cnt, DATE_FORMAT(createDate, \'%Y-%m-%d %H:%i:%s\') AS createDate\
    FROM marketing_mail where url is not null';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and createDate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    sql += ' order by createDate desc limit ?,?';
    return await getResult(sql,param);
  },
  selectMarketingTableCount: async function(body,param){
    var sql = 'SELECT count(*) as total FROM marketing_mail where url is not null';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and createDate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
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
    var sql = "SELECT sns_idx, sns_content, sns_writer, url, FORMAT(count(*),0) as total_cnt,\
    FORMAT(max(view_cnt),0) as view_cnt, FORMAT(max(like_cnt),0) as like_cnt, FORMAT(max(reply_cnt),0) as reply_cnt,FORMAT(max(share_cnt),0) as share_cnt,\
    uid, title_key, keyword, keyword_type, textType, thumbnail,DATE_FORMAT(writeDate, '%Y-%m-%d') AS writeDate FROM facebook_videos where url is not null ";
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and writeDate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    if('writer' in body){
      sql +=' and sns_writer = \''+body.writer+'\'';
    }
    sql += ' group by url order by writeDate desc limit ?,?';
    return await getResult(sql,param);
  },
  selectFacebookTableCount: async function(body,param){
    var sql = "SELECT count(*) as total FROM (SELECT  * from facebook_videos where url is not null ";
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and writeDate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    if('writer' in body){
      sql +=' and sns_writer = \''+body.writer+'\'';
    }
    sql += ' group by url) as a';
    var count = await getResult(sql,param[0]);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
  },
  selectNaverTable: async function(body,param){
    var sql = "SELECT portal_idx, portal_name, portal_title, portal_writer, url, board_number, uid,\
    FORMAT(count(*),0) as total_cnt,FORMAT(max(view_cnt),0) as view_cnt, FORMAT(max(like_cnt),0) as like_cnt, FORMAT(max(reply_cnt),0) as reply_cnt,FORMAT(max(share_cnt),0) as share_cnt,\
    DATE_FORMAT(writeDate, '%Y-%m-%d') AS writeDate, title_key, keyword, keyword_type, textType, thumbnail\
    FROM naver_videos where portal_name = \'naver\'";
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and writeDate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    sql += ' group by url order by writeDate desc limit ?,?';
    return await getResult(sql,param);
  },
  selectNaverTableCount: async function(body,param){
    var sql = "SELECT count(*) as total FROM (SELECT  * from naver_videos where portal_name = \'naver\'";
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and writeDate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    sql += ' group by url) as a';
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
