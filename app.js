
// __base global
global.__base = __dirname + '/';

var twitterConfig = require('./config/twitter.js');
var Twit = require('twit');
var db = require('./lib/db.js');

var T = new Twit(twitterConfig);

// filter the public stream by english tweets containing `#apple`
//var stream = T.stream('statuses/filter', { track: '#MachineLearning', language: 'en' });
var stream = T.stream('statuses/filter', { track: '#MachineLearning,#DataScience,#BigData', language:'en' });

stream.on('tweet', function (tweet) {
  	db.newTweet(tweet);
});