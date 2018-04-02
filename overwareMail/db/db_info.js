const mysql = require('mysql');

class Database {
  constructor() {
    this.db = {
      host     : '192.168.0.16',
      user     : 'soas',
      password : 'qwer1234',
      port     : '3306',
      database : 'union'
    };
    this.connection = mysql.createConnection(this.db);
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
