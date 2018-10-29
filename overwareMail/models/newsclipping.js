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
  call_newsclipping_period: async function(param){
    var sql = 'call union_mail.newsclipping_period(?,?,?,?)';
    return await getResult(sql,param);
  },
  call_newsclipping_period_result: async function(param){
    var sql = 'call union_mail.newsclipping_period_result(?, ?)';
    // call union_mail.newsclipping_period_result('success', '225');
    var result = await getResult(sql,param);
    return (result.length > 0)?result[0]:result;
  },
  insert: async function(detail,param){
    var sql = 'insert into news_mail(me_rank,media_idx, media_name, media_title, media_content, reporter_name, reporter_ID, reporter_email, writeDate, last_WriteDate, last_media_title, \
    last_media_content, title_key, keyword, keyword_type, url, reportDate, news_type, textType, media_state, createDate, replynum, media_subname, updateDate';
    if(detail != ''){
      sql += ',news_detail';
    }
    sql += ')SELECT ME_rank,media_idx, ?, media_title, media_content, ?, reporter_ID, reporter_email, writeDate, last_WriteDate, last_media_title, last_media_content, \
    title_key, keyword, keyword_type, url, ?, ?, textType, media_state, now(), replynum, media_subname, now() ';
    if(detail != ''){
      sql += ',\''+detail+'\' ';
    }
    sql += 'FROM `union`.media_data where media_idx = ?';
    // 값이 있으면 insert 안되도록
    sql += ' and NOT EXISTS (SELECT * FROM news_mail WHERE media_idx = ?);'
    return await getResult(sql,param);
  },
  insertReporter: async function(param){
    var sql = 'INSERT INTO `union`.reporter_data (reporter_media_name,reporter_name) SELECT ?,? FROM DUAL WHERE NOT EXISTS (SELECT * FROM `union`.reporter_data WHERE reporter_media_name=? and reporter_name=?); ';
    return await getResult(sql,param);
  },
  insert2: async function(param){
    var pValue = Object.values(param);
    var sql = insertSqlSetting(Object.keys(param));
    return await getResult(sql,pValue);
  },
  deleteList: async function(param){
    var sql = "delete from "+param.table+" where "+param.idxStr+"=?";
    if(param.table == "news_mail"){
      sql += " or news_detail="+param.idx;
    }
    return await getResult(sql,param.idx);
  },
  cancelUpdate: async function(param){
    var sql = "update "+param.table+" set news_detail = null where news_detail=?";
    return await getResult(sql,param.idx);
  },
  delete: async function(param){
    var sql = "delete from news_mail where media_idx=?";
    return await getResult(sql,param);
  },
  updateGroup: async function(param){
    var sql = "update news_mail set news_detail=? where ";
    var arr = [].map.call(param.idxs, function(obj) { return 'media_idx=?'; });
    sql += arr.join(' or ');
    param.idxs.unshift(param.midx);
    return await getResult(sql,param.idxs);
  },
  update: async function(detail,param){
    var sql = "update news_mail set reportDate=?,news_type=?";
    if(detail != ''){
      sql += ',news_detail=\''+detail+'\'';
    }
    else{
      sql += ',news_detail=NULL';
    }
    sql+= " where media_idx=?";
    return await getResult(sql,param);
  },
  selectKeywordMailTable: async function(param){
    var sql = 'select * FROM keyword_mail ';
    if(param != ''){
      sql += ' where k_type=? ';
    }
    sql += 'order by k_type,k_main';
    return await getResult(sql,param);
  },
  selectMediaTable2: async function(body,k_list){
    var sql = "SELECT * FROM news_view where title_key in (select distinct keyword_main from keyword_data where user_idx=1 or user_idx=21)";
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and writeDate between \''+body.sDate+'  00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    if('search' in body){
      sql +=' and (media_title like \'%'+body.search.replace(/'/gi,"''").replace(/[?]/gi,"")+'%\' or media_content like \'%'+body.search.replace(/'/gi,"''").replace(/[?]/gi,"")+'%\')';
    }
    if('search_b' in body){
      sql +=' and media_title like \'%'+body.search_b+'%\'';
    }
    sql += ' order by media_idx';

    var result = await getResult(sql);
    var regExp = /[\{\}\[\]\/?.,;:|\‘’“”…)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
    return [].map.call(result, function(obj) {
      obj.count = 0;
      k_list.forEach( function( v, i ){
        var title = obj.media_title.replace(regExp, "");
        if(title.indexOf(v) != -1){
          obj.count += 1;
        }
      });
      if(obj.count != 0){
        return obj;
      }
    }).filter(function(n){ return n != undefined });
  },
  selectMediaTable: async function(body,param,keyword){
    var sql = "SELECT * FROM news_view where title_key in (select distinct keyword_main from keyword_data where user_idx=? or user_idx=21) ";
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and writeDate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\' ';
      // sql+=' and writeDate between \''+body.sDate+'\' and \''+body.eDate+'\'';
    }
    if('keyword' in body){
      sql +=' and title_key = \''+body.keyword+'\'';
    }
    if('site' in body){
      // if(body.site == 'other') sql +=' and (substring_index(url,\'/\',3) not like \'%.naver.%\' and substring_index(url,\'/\',3) not like \'%.daum.%\') ';
      // else sql +=' and substring_index(url,\'/\',3) like \'%.'+body.site+'.%\' ';
      sql +=' and media_subname = \''+body.site+'\' ';
    }
    if('search' in body){
      sql +=' and (media_title like \'%'+body.search.replace(/'/gi,"''").replace(/[?]/gi,"")+'%\' or media_content like \'%'+body.search.replace(/'/gi,"''").replace(/[?]/gi,"")+'%\')';
      // sql +=' and media_title like \'%'+body.search+'%\'';
    }
    if('search_b' in body){
      sql +=' and media_title like \'%'+body.search_b+'%\'';
    }
    if('del' in body){
      sql +=' and (media_title not like \'%영상%\' and media_title not like \'%포토%\')';
    }
    if('video' in body){
      sql +=' and v_state=2';
    }
    // 영상 있는지 체크
    if('type' in body){
      var typeStr = '';
      if(body.type == '1'){
        typeStr = '쇼박스영화';
      }
      else if(body.type == '2'){
        typeStr = '경쟁영화';
      }
      else if(body.type == '3'){
        typeStr = '캐스팅';
      }
      else if(body.type == '4'){
        typeStr = '쇼박스기업뉴스\' or title_key = \'오리온';
      }
      else if(body.type == '5'){
        typeStr = '영화일반';
      }
      else if(body.type == '6'){
        typeStr = '보도국';
      }
      else if(body.type == '7'){
        typeStr = '박스오피스';
      }
      sql +=' and (news_type = \''+body.type+'\' or title_key = \''+typeStr+'\')';
    }
    sql += ' order by '+(('rank' in body)?'-ME_rank desc,':'')+' media_idx desc';
    sql += ' limit ?,?';

    var result = await getResult(sql,param);
    return result;
    // return [].map.call(result, function(obj) {
    //   obj.type = '0';
    //   try{
    //     keyword.forEach( function( v, i ){
    //       if(v.k_main != ''){
    //         if(obj.media_title.indexOf(v.k_main) != -1 && obj.media_title.indexOf(v.k_sub) != -1){
    //           // console.log(v);
    //           obj.type = v.k_type;
    //           throw arr;
    //         }
    //       }
    //       else {
    //         if(obj.media_title.indexOf(v.k_sub) != -1){
    //           // console.log(v);
    //           obj.type = v.k_type;
    //           throw arr;
    //         }
    //       }
    //     });
    //   }
    //   catch(e){
    //     console.log(obj.type);
    //   }
    //   return obj;
    // });
  },
  selectMediaTableCount: async function(body,param){
    var sql = 'SELECT count(*) as total FROM news_view where title_key in (select distinct keyword_main from keyword_data where user_idx=? or user_idx=21)';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and writeDate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\' ';
      // sql+=' and writeDate between \''+body.sDate+'\' and \''+body.eDate+'\'';
    }
    if('keyword' in body){
      sql +=' and title_key = \''+body.keyword+'\'';
    }
    if('site' in body){
      // if(body.site == 'other') sql +=' and (substring_index(url,\'/\',3) not like \'%.naver.%\' and substring_index(url,\'/\',3) not like \'%.daum.%\') ';
      // else sql +=' and substring_index(url,\'/\',3) like \'%.'+body.site+'.%\' ';
      sql +=' and media_subname = \''+body.site+'\' ';
    }
    if('search' in body){
      sql +=' and (media_title like \'%'+body.search.replace(/'/gi,"''").replace(/[?]/gi,"")+'%\' or media_content like \'%'+body.search.replace(/'/gi,"''").replace(/[?]/gi,"")+'%\')';
      // sql +=' and media_title like \'%'+body.search+'%\'';
    }
    if('search_b' in body){
      sql +=' and media_title like \'%'+body.search_b+'%\'';
    }
    if('del' in body){
      sql +=' and (media_title not like \'%영상%\' and media_title not like \'%포토%\')';
    }
    if('video' in body){
      sql +=' and v_state=2';
    }
    // 영상 있는지 체크
    if('type' in body){
      var typeStr = '';
      if(body.type == '1'){
        typeStr = '쇼박스영화';
      }
      else if(body.type == '2'){
        typeStr = '경쟁영화';
      }
      else if(body.type == '3'){
        typeStr = '캐스팅';
      }
      else if(body.type == '4'){
        typeStr = '쇼박스기업뉴스\' or title_key = \'오리온';
      }
      else if(body.type == '5'){
        typeStr = '영화일반';
      }
      else if(body.type == '6'){
        typeStr = '보도국';
      }
      else if(body.type == '7'){
        typeStr = '박스오피스';
      }
      sql +=' and (news_type = \''+body.type+'\' or title_key = \''+typeStr+'\')';
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
    var sql = "SELECT me_rank,url,media_idx,DATE_FORMAT(writeDate, '%Y-%m-%d') AS writeDate,DATE_FORMAT(reportDate, '%Y-%m-%d %H:%i:%s') AS reportDate,media_title,media_name,reporter_name,\
    keyword,textType,thumbnail,news_type,news_detail,media_subname FROM news_mail where title_key in (select distinct keyword_main from keyword_data where user_idx=? or user_idx=21)";
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and writeDate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    if('keyword' in body){
      sql +=' and title_key = \''+body.keyword+'\'';
    }
    if('site' in body){
      // if(body.site == 'other') sql +=' and (substring_index(url,\'/\',3) not like \'%.naver.%\' and substring_index(url,\'/\',3) not like \'%.daum.%\') ';
      // else sql +=' and substring_index(url,\'/\',3) like \'%.'+body.site+'.%\' ';
      sql +=' and media_subname = \''+body.site+'\' ';
    }
    if('type' in body){
      sql +=' and news_type = \''+body.type+'\'';
    }
    if('search' in body){
      sql +=' and (media_title like \'%'+body.search.replace(/'/gi,"''").replace(/[?]/gi,"")+'%\' or media_content like \'%'+body.search.replace(/'/gi,"''").replace(/[?]/gi,"")+'%\')';
      // sql +=' and media_title like \'%'+body.search+'%\'';
    }
    sql += ' order by media_idx desc limit ?,?';
    return await getResult(sql,param);
  },
  selectNewsMailTableCount: async function(body,param){
    var sql = 'SELECT count(*) as total FROM news_mail where title_key in (select distinct keyword_main from keyword_data where user_idx=? or user_idx=21)';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and writeDate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    if('keyword' in body){
      sql +=' and title_key = \''+body.keyword+'\'';
    }
    if('site' in body){
      // if(body.site == 'other') sql +=' and (substring_index(url,\'/\',3) not like \'%.naver.%\' and substring_index(url,\'/\',3) not like \'%.daum.%\') ';
      // else sql +=' and substring_index(url,\'/\',3) like \'%.'+body.site+'.%\' ';
      sql +=' and media_subname = \''+body.site+'\' ';
    }
    if('type' in body){
      sql +=' and news_type = \''+body.type+'\'';
    }
    if('search' in body){
      sql +=' and (media_title like \'%'+body.search.replace(/'/gi,"''").replace(/[?]/gi,"")+'%\' or media_content like \'%'+body.search.replace(/'/gi,"''").replace(/[?]/gi,"")+'%\')';
      // sql +=' and media_title like \'%'+body.search+'%\'';
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
    var sql = "SELECT url,media_content,thumbnail,media_idx,DATE_FORMAT(createDate, '%Y-%m-%d %H:%i:%s') AS createDate,\
    DATE_FORMAT(writeDate, '%Y.%m.%d') AS writeDate,media_subname,DATE_FORMAT(writeDate, '%Y-%m-%d %H:%i:%s') AS writeDateStr,media_title,media_name,reporter_name,keyword,textType,thumbnail,news_type,replynum,news_detail \
    FROM news_mail where title_key in (select distinct keyword_main from keyword_data where user_idx=? or user_idx=21)";
    sql+=' and Date(reportDate) = \''+body.eDate+'\'';
    return await getResult(sql,param);
  },
  selectIssueTable: async function(param){
    var sql = 'SELECT * FROM issue_data where (company_name = \'쇼박스\' or title_key in (select distinct keyword_main from keyword_data where user_idx=1 or user_idx=21)) and  Date(writeDate) = \''+param.eDate+'\'';
    return await getResult(sql);
  },
  selectOneMailBodyDate: async function(param){
    // var sql = "SELECT DATE_FORMAT(SENDTIME, '%Y-%m-%d') AS SENDTIME,M_body,MSGID as n_idx FROM newsclipping_view where MSGID=? group by M_body order by SENDTIME desc,MSGID desc";
    // var sql = "SELECT DATE_FORMAT(b.SENDTIME, '%Y-%m-%d') AS SENDTIME,a.M_body,a.n_idx FROM `union`.n_mail_all as a\
    // left join `union`.mail_send_backup as b\
    // on a.n_idx = b.MSGID\
    // where a.n_idx=? group by a.M_body order by b.SENDTIME desc,a.n_idx desc;"
    var sql = "SELECT DATE_FORMAT(M_senddate, '%Y-%m-%d') AS SENDTIME,M_body,n_idx FROM `union`.n_mail_all where n_idx=? group by M_body order by M_senddate desc,n_idx desc;"
    return await getResult(sql,param);
  },
  selectOneMailBodyDate2: async function(param){
    // var sql = "SELECT DATE_FORMAT(SENDTIME, '%Y-%m-%d') AS SENDTIME,M_body,MSGID as n_idx FROM newsclipping_view where M_subject like '%"+param+"%' group by M_body order by SENDTIME desc,MSGID desc";
    // var sql = "SELECT a.M_subject,DATE_FORMAT(b.SENDTIME, '%Y-%m-%d') AS SENDTIME,a.M_body,a.n_idx FROM `union`.n_mail_all as a\
    // left join `union`.mail_send_backup as b\
    // on a.n_idx = b.MSGID\
    // where a.M_subject like '%"+param+"%' group by a.M_body order by b.SENDTIME desc,a.n_idx desc;"
    var sql = "SELECT M_subject,DATE_FORMAT(M_senddate, '%Y-%m-%d') AS SENDTIME,M_body,n_idx FROM `union`.n_mail_all as a where M_subject like '%"+param+"%' group by M_body order by M_senddate desc,n_idx desc;"
    return await getResult(sql);
  },
  selectListView: async function(body,param){
    var sql = 'SELECT * FROM newsclipping_list_view where n_idx is not null ';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and M_regdate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    sql += ' and (  M_id = ? or M_id in (select n_idx from m_mail_user where user_admin=?)) ';
    sql += ' order by n_idx desc limit ?,?';
    return await getResult(sql,param);
  },
  selectListViewCount: async function(body,param){
    var sql = 'SELECT count(*) as total FROM  newsclipping_list_view where n_idx is not null ';
    if(('sDate' in body) && ('eDate' in body)){
      sql+=' and M_regdate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
    }
    sql += ' and (  M_id = ? or M_id in (select n_idx from m_mail_user where user_admin=?))';
    var count = await getResult(sql,param);
    if(count.length == 0){
      return 0;
    }
    else{
      return count[0]['total'];
    }
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


/*
selectView: async function(body,param){
  var sql = 'SELECT * FROM newsclipping_view where M_idx_A is not null ';
  if(('sDate' in body) && ('eDate' in body)){
    sql+=' and M_regdate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
  }
  sql += ' and (  M_id = ? or M_id in (select n_idx from m_mail_user where user_admin=?)) ';
  sql += ' group by M_idx_A order by M_idx_A desc limit ?,?';
  return await getResult(sql,param);
},
selectViewCount: async function(body,param){
  var sql = 'SELECT count(*) as total FROM (SELECT * from newsclipping_view where M_idx_A is not null ';
  if(('sDate' in body) && ('eDate' in body)){
    sql+=' and M_regdate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
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
    sql+=' and M_regdate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
  }
  sql += ' and (  M_id = ? or M_id in (select n_idx from m_mail_user where user_admin=?)) ';
  sql += ' order by n_idx desc limit ?,?';
  return await getResult(sql,param);
},
selectListViewCount: async function(body,param){
  var sql = 'SELECT count(*) as total FROM  newsclipping_list_view where n_idx is not null ';
  if(('sDate' in body) && ('eDate' in body)){
    sql+=' and M_regdate between \''+body.sDate+' 00:00:00\' and \''+body.eDate+' 23:59:59\'';
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
  // sql+=' group by E_mail';
  return await getResult(sql,param.arr);
},
*/
