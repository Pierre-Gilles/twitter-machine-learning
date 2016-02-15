
module.exports = {
  host     : process.env.MYSQL_HOST || 'mysql',
  user     : process.env.MYSQL_USER || 'root',
  password : process.env.MYSQL_PASS || 'root',
  database : process.env.MYSQL_DB || 'twitter-machine-learning',
  port : process.env.MYSQL_PORT || 3306
};