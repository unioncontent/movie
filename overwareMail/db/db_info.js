const mysql = require('mysql');

class Database {
  constructor() {
    this.db = {
      host     : '221.148.120.33',
      user     : 'soas',
      password : 'qwer1234',
      database : 'union'
    };
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
