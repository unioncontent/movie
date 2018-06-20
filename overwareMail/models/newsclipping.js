const DBpromise = require('../db/db_info.js');

/*
 뉴스 테이블 - media_data
 뉴스 등록 테이블 - news_mail
 키워드 이슈 테이블 - issue_data
 키워드 테이블 - keyword_data
기업 뉴스 테이블 - companynews_data
지난 뉴스 클리핑 테이블 - n_mail_all , n_mail_detail
*/

var newsclipping = {
  insert: async function(param){
    var sql = 'insert into news_mail(media_idx, media_name, media_title, media_content, reporter_name, reporter_ID, reporter_email, writeDate, last_WriteDate, last_media_title, \
    last_media_content, title_key, keyword, keyword_type, url, thumbnail, thumbnail_code, textType, media_state, createDate, replynum, updateDate)\
    SELECT media_idx, media_name, media_title, media_content, reporter_name, reporter_ID, reporter_email, writeDate, last_WriteDate, last_media_title, last_media_content, \
    title_key, keyword, keyword_type, url, ?, ?, textType, media_state, createDate, replynum, updateDate FROM `union`.media_data where media_idx = ?';
    // 값이 있으면 insert 안되도록
    sql += ' and NOT EXISTS (SELECT * FROM news_mail WHERE media_idx = ?);'
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

module.exports = newsclipping;
