TweetStream
------

###Functionality
The TweetStream application allows a user to create a live stream of tweets from all Twitter public users that match an inputted set of keywords and parameters.
The complete parameters include:
* keywords - the set of terms that must all be present in a matched tweet
* exclude - the set of terms that must be absent from a matched tweet
* language - the language that screened tweets must be in
* latitude, longitude, radius - geolocal data for screening by location

![TweetStream Search](http://jameswen.herokuapp.com/projects/tweetstream/tweetstreamsearch_original.png?1389497352 "TweetStream Nets vs. Heat Search")

Our service then counts the number of tweets that match the user inputted criteria and streams up to 10 of the latest matched tweets.

The Stream is designed to show the latest tweets that were tweeted before a certain time span. The search keywords are highlighted in the tweets and each tweet can be clicked to open the Twitter page for that tweet in a separate window.

---
###Implementation
The TweetStream streaming service is actually implemented with our stream_search API endpoint that utilizes the Twitter Search API.

Extensive experimentation with the Twitter Streaming API revealed that it is designed to provide a consistently streaming, uninterruptible search of incoming tweets for a set selection of keywords/parameters. This causes the Rails application thread to lock up and no other functionality is available. If an application that wanted to implement the kind of short or long term streaming service using **any** keywords the user might want to search with the Twitter streaming API, either complex thread interruption or multiple rails applications (each consistently streaming on a single set of keywords) would be required.

The application is designed with these features in mind:
* No repeated tweets
* User cannot input improper parameters
* Ease of use
* Simple UX

---
###Demo
For best results, streams should be created using keywords that are popular or pertain to some recent event or Twitter trend. 


For example, on January 10th, 2014, during the end of the Nets vs. Heat basketball game, Norris Cole of the Heat tied the game up with 3.3s left to ensure double overtime. Twitter was flooded with tweets about overtime:
<br/><br/>
![TweetStream Demo](http://jameswen.herokuapp.com/projects/tweetstream/tweetstreamnets_original.png?1389497352 "TweetStream Nets vs. Heat Demo")