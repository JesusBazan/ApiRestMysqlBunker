const mysql = require('mysql');

const mysqlConnection = mysql.createConnection({
  host: 'aws-bunker.ccdpmlubqpbk.us-east-2.rds.amazonaws.com',
  user: 'admin',
  password: 'password12345*',
  database: 'company',
  multipleStatements: true
});

mysqlConnection.connect(function (err) {
  if (err) {
    console.error(err);
    return;
  } else {
    console.log('db is connected');
  }
});

module.exports = mysqlConnection;
