const DBpromise = require('../db/db_info.js');

/*
 뉴스 테이블 - media_data
 뉴스 등록 테이블 - news_mail
 키워드 이슈 테이블 - issue_data
 키워드 테이블 - keyword_data
 기업 뉴스 테이블 - companynews_data
 지난 뉴스 클리핑 테이블 - n_mail_all , n_mail_detail
 뷰 - newsclipping_view
*/

var newsclipping = {
  insert: async function(detail,param){
    var sql = 'insert into news_mail(media_idx, media_name, media_title, media_content, reporter_name, reporter_ID, reporter_email, writeDate, last_WriteDate, last_media_title, \
    last_media_content, title_key, keyword, keyword_type, url, thumbnail, news_type, textType, media_state, createDate, replynum, updateDate';
    if(detail != ''){
      sql += ',news_detail';
    }
    sql += ')SELECT media_idx, media_name, media_title, media_content, reporter_name, reporter_ID, reporter_email, writeDate, last_WriteDate, last_media_title, last_media_content, \
    title_key, keyword, keyword_type, url, ?, ?, textType, media_state, now(), replynum, now() ';
    if(detail != ''){
      sql += ',\''+detail+'\' ';
    }
    sql += 'FROM `union`.media_data where media_idx = ?';
    // 값이 있으면 insert 안되도록
    sql += ' and NOT EXISTS (SELECT * FROM news_mail WHERE media_idx = ?);'
    return await getResult(sql,param);
  },
  insert2: async function(param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(Object.keys(param));
    return await getResult(sql,pValue);
  },
  delete: async function(param){
    var sql = "delete from news_mail where media_idx=?";
    return await getResult(sql,param);
  },
  update: async function(detail,param){
    var sql = "update news_mail set thumbnail=?,news_type=?";
    if(detail != ''){
      sql += ',news_detail=\''+detail+'\'';
    }
    else{
      sql += ',news_detail=NULL';
    }
    sql+= " where media_idx=?";
    return await getResult(sql,param);
  },
  selectMediaTable: async function(body,param){
    var sql = "SELECT url,media_idx,DATE_FORMAT(createDate, '%Y-%m-%d %H:%i:%s') AS `createDate`,media_title,media_name,reporter_name,keyword,textType FROM `union`.media_data where title_key in (select distinct keyword_main from keyword_data where user_idx=?)";
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and createDate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    if('keyword' in body){
      sql +=' and title_key = \''+body.keyword+'\'';
    }
    sql += ' order by media_idx desc limit ?,?';
    return await getResult(sql,param);
  },
  selectMediaTableCount: async function(body,param){
    var sql = 'SELECT count(*) as total FROM `union`.media_data where title_key in (select distinct keyword_main from keyword_data where user_idx=?)';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and createDate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    if('keyword' in body){
      sql +=' and title_key = \''+body.keyword+'\'';
    }
    var count = await getResult(sql,param[0]);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
  },
  selectNewsMailTable: async function(body,param){
    var sql = "SELECT url,media_idx,DATE_FORMAT(createDate, '%Y-%m-%d %H:%i:%s') AS `createDate`,media_title,media_name,reporter_name,keyword,textType,thumbnail,news_type,news_detail FROM news_mail where title_key in (select distinct keyword_main from keyword_data where user_idx=?)";
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and createDate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    if('keyword' in body){
      sql +=' and title_key = \''+body.keyword+'\'';
    }
    sql += ' order by createDate desc limit ?,?';
    return await getResult(sql,param);
  },
  selectNewsMailTableCount: async function(body,param){
    var sql = 'SELECT count(*) as total FROM news_mail where title_key in (select distinct keyword_main from keyword_data where user_idx=?)';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and createDate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    if('keyword' in body){
      sql +=' and title_key = \''+body.keyword+'\'';
    }
    var count = await getResult(sql,param[0]);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
  },
  selectNewsMailAllTable: async function(body,param){
    var sql = "SELECT url,media_content,thumbnail,media_idx,DATE_FORMAT(createDate, '%Y-%m-%d %H:%i:%s') AS `createDate`,DATE_FORMAT(writeDate, '%Y.%m.%d') AS `writeDate`,media_title,media_name,reporter_name,keyword,textType,thumbnail,news_type,news_detail FROM news_mail where title_key in (select distinct keyword_main from keyword_data where user_idx=?)";
    sql+=' and createDate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    return await getResult(sql,param);
  },
  selectIssueTable: async function(param){
    var sql = 'SELECT * FROM issue_data where company_name = \'쇼박스\' and  writeDate between \''+param.sDate+' 00:00:00\' and \''+param.eDate+' 23:59:59\'';
    return await getResult(sql);
  },
  selectView: async function(body,param){
    var sql = 'SELECT * FROM newsclipping_view where n_idx is not null ';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and GENDATE between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    sql += ' and (  M_id = ? or M_id in (select n_idx from m_mail_user where user_admin=?)) ';
    sql += ' group by M_idx_A order by n_idx desc limit ?,?';
    return await getResult(sql,param);
  },
  selectViewCount: async function(body,param){
    var sql = 'SELECT count(*) as total FROM (SELECT * from newsclipping_view where n_idx is not null ';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and GENDATE between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    sql += ' and (  M_id = ? or M_id in (select n_idx from m_mail_user where user_admin=?)) group by M_idx_A) a';
    var count = await getResult(sql,param);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
  },
  selectListView: async function(body,param){
    var sql = 'SELECT * FROM newsclipping_list_view where n_idx is not null ';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and GENDATE between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    sql += ' and (  M_id = ? or M_id in (select n_idx from m_mail_user where user_admin=?)) ';
    sql += ' order by n_idx desc limit ?,?';
    return await getResult(sql,param);
  },
  selectListViewCount: async function(body,param){
    var sql = 'SELECT count(*) as total FROM  newsclipping_list_view where n_idx is not null ';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and GENDATE between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    sql += ' and (  M_id = ? or M_id in (select n_idx from m_mail_user where user_admin=?))';
    var count = await getResult(sql,param);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
  },
  selectResultDetail:async function(param){
    var sql = 'SELECT * FROM newsclipping_view where MSGID=? ';
    if('M_result' in param){
      if(param.M_result == 'success'){
        sql += 'and (FINALRESULT=? or (SENDRESULT = \'OK\' and FINALRESULT is null))';
      }else{
        sql += 'and ((FINALRESULT is not null and FINALRESULT != ?) or (SENDRESULT is not null and SENDRESULT = \'ER\'))';
      }
    }
    sql+=' group by E_mail';
    return await getResult(sql,param.arr);
  },
  selectOneMailBodyDate: async function(param){
    var sql = "SELECT DATE_FORMAT(SENDTIME, '%Y-%m-%d') AS SENDTIME,M_body,MSGID as n_idx FROM newsclipping_view where MSGID=? group by M_body";
    return await getResult(sql,param);
  },
  selectOneMailBodyDate2: async function(param){
    var sql = "SELECT DATE_FORMAT(SENDTIME, '%Y-%m-%d') AS SENDTIME,M_body,n_idx FROM newsclipping_view where M_subject like '%"+param+"%' group by M_body";
    return await getResult(sql);
  }
}

function insertSqlSetting(keys){
  var arr = [].map.call(keys, function(obj) { return '?'; });
  columns = keys.join(', ');
  placeholders = arr.join(', ');
  var sql = "INSERT INTO news_mail ( "+columns+" ) VALUES ( "+placeholders+" );";

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

module.exports = newsclipping;
