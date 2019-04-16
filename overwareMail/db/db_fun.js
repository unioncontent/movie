const mysql = require('mysql');
const DBpromise = require('../db/db_info.js');
const logger = require('../winston/config_f.js');

module.exports.getResult = async function(type,sql,param) {
  var db = new DBpromise(type);
  try{
    if(param == undefined){
      logger.info(sql+';');
      return await db.query(sql);
    }
    logger.info(mysql.format(sql, param)+';');
    return await db.query(sql,param);
  } catch(e){
    logger.error('DB Error : ',e);
    return [];
  } finally{
    await db.close();
  }
};
