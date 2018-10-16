const mysql = require('mysql');

class Database {
  constructor(type) {
    this.db = {
      host     : '61.82.113.197',
      user     : 'soas',
      password : 'qwer1234',
      database : 'union'
    };
    if(type){
      this.db = {
        host     : '183.111.125.240',
        user     : 'unionc',
        password : 'unionc!@#',
        database : 'tm001'
      };
    }
    this.connection = mysql.createConnection(this.db);
  }
  test_open(){
    this.connection.connect(function (err) {
      if (err) {
        console.error('mysql connection error :' + err);
      } else {
        console.info('mysql is connected successfully.');
      }
    });
  }
  query(sql, args) {
    return new Promise((resolve, reject) => {
      this.connection.query(sql, args, (err, rows) => {
        if (err || rows.length == 0)
          return reject(err);
        resolve(rows);
      });
    });
  }
  close() {
    return new Promise((resolve, reject) => {
      this.connection.end(err => {
        if (err)
          return reject(err);
        resolve();
      });
    });
  }
  getState() {
    return this.connection.state;
  }
}

module.exports = Database;
