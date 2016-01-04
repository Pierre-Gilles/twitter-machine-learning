module.exports.newTweet = newTweet;

// NPM dependencies
var mysql = require('mysql');
var squel = require('squel');
var mysqlInfos = require(__base + 'config/mysql.js');

function insertTweet(connection, tweet) {
	var sqlQuery = squel.insert()
			         .into('tweet')
			         .set('twitter_id', tweet.id_str)
			         .set('user', tweet.user.screen_name)
			         .set('text', tweet.text.replace(/'/g, "\\'"))
			         .set('created_at', new Date(tweet.created_at).toISOString().slice(0, 19).replace('T', ' '))
			         .toString();

	return new Promise(function(resolve, reject){
		connection.query(sqlQuery, function(err, rows, fields) {
		  if (err) return reject(err);

		  return resolve(rows.insertId);
		});
	});	        
}

function insertHashtag(connection, tweetId, hashtags) {

	if(hashtags.length === 0){
		return Promise.resolve([]);
	}

	var rows = [];
	for(var i = 0; i < hashtags.length; i++){
		rows.push({
			tweet: tweetId,
			text: hashtags[i].text,
			indice_start: hashtags[i].indices[0],
			indice_end: hashtags[i].indices[1]
		});
	}

	var sqlQuery = squel.insert()
			         .into('hashtag')
			         .setFieldsRows(rows)
			         .toString();

	return new Promise(function(resolve, reject){
		connection.query(sqlQuery, function(err, rows, fields) {
		  if (err) return reject(err);

		  return resolve();
		});
	});	      
}


function newTweet(tweet) {
  
  // creating database connection	
  var connection = mysql.createConnection(mysqlInfos);
  connection.connect();
  insertTweet(connection, tweet)
  	.then(function(tweetId){
  		return insertHashtag(connection, tweetId, tweet.entities.hashtags);
  	})
  	.then(function(){
  		connection.end();
  		console.log('Inserted new tweet !');
  	})
  	.catch(function(err){
  		console.log(err);
  	});
}