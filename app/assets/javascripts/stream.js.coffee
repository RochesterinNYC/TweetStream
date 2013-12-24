# Use local alias
# $ = jQuery

# Namespacing
window.TweetStreamUI ||= {}
window.TweetArray = []
window.TweetStorage = []

TweetStreamUI.refresh = () ->
  TweetStreamUI.refreshTweetArray()
  TweetStreamUI.renderTweets()
  TweetStreamUI.renderBorders()

TweetStreamUI.refreshTweetArray = () ->
  #Remove the two last tweets (oldest) of array
  if(TweetArray.length == 10)
    TweetArray.pop()
    TweetArray.pop()
    #Add two tweets from storage to front of array
  TweetArray.unshift(TweetStorage.shift())
  TweetArray.unshift(TweetStorage.shift())
  #Initial TweetArray Fill
  #else
  #  for tweet, x in TweetStorage
  #    TweetArray[x] = TweetStorage[x]
  #  TweetStreamUI.getTweets()

TweetStreamUI.renderBorders = () ->
  if $('.border-active').length is 0
    current1 = 0
    current2 = 1
  else
    current1 = parseInt($('.border-active')[0].id.replace('tweet', '')) + 2
    current2 = parseInt($('.border-active')[1].id.replace('tweet', '')) + 2
    if current1 > 9 || current2 > 10
      current1 = 0
      current2 = 1
  for el in $('.tweet')
    el = $(el)
    el.css({border: '2px solid black'})
    el.removeClass('border-active')
  $('#tweet' + current1).css({border: '2px solid #55ACEE'})
  $('#tweet' + current1).addClass('border-active')
  $('#tweet' + current2).css({border: '2px solid #55ACEE'})
  $('#tweet' + current2).addClass('border-active')

TweetStreamUI.renderTweets = () ->
  for tweet, x in TweetArray
    TweetStreamUI.renderTweet(x)

TweetStreamUI.renderTweet = (index) ->
  $('#tweet' + index + 'image').attr("src", TweetArray[index]["image"])
  $('#tweet' + index + 'name').html(TweetArray[index]["name"])
  $('#tweet' + index + 'handle').html("@" + TweetArray[index]["handle"])
  $('#tweet' + index + 'text').html(TweetStreamUI.markTerm(TweetArray[index]["text"]))
  $('#tweet' + index + 'time').html(TweetStreamUI.getTime(TweetArray[index]["time"]) + " seconds ago")
  $('#tweet' + index).attr("href", TweetArray[index]["url"])
  if $('#tweet' + index).hasClass("tweet-inactive") and $('#tweet' + index + 'handle').text().length != 0
    $('#tweet' + index).toggleClass("tweet-inactive tweet-active")

TweetStreamUI.markTerm = (text) ->
  split_terms = $('#tweet_keywords').val().split(' ')
  marked_text = text
  for term in split_terms
    if term != ""
      marked_text = marked_text.replace(term, "<mark>" + term + "</mark>")
      marked_text = marked_text.replace(term.toUpperCase(), "<mark>" + term.toUpperCase() + "</mark>")
      capitalized = term.charAt(0).toUpperCase() + term.slice(1)
      marked_text = marked_text.replace(capitalized, "<mark>" + capitalized + "</mark>")
  marked_text

TweetStreamUI.getTime = (time) ->
  return Math.ceil((new Date().getTime()/1000)) - time

TweetStreamUI.getTweets = () ->
  #window.TweetArray = []
  formData = {
    'keywords': $('#tweet_keywords').val(),
    'exclude': $('#tweet_exclude').val(),
    'language': $('#tweet_language').val(),
    'latitude': $('#tweet_latitude').val(),
    'longitude': $('#tweet_longitude').val(),
    'radius': $('#tweet_radius').val(),
    'distance': $('#tweet_distance').val(),
    'numTweets': $('#tweet_numTweets').val()
  }
  url = document.location.protocol + "//" + document.location.host + "/stream_search"
  params = { url: url, data: formData, type: 'GET', timeout: 5000, error: TweetStreamUI.validateError, statusCode: { 401: TweetStreamUI.validateError, 406: TweetStreamUI.validateError, 200: TweetStreamUI.validateSuccess }}
  # params.dataType = 'jsonp' if JSONP # use JSONP for development
  $.ajax(params)

TweetStreamUI.validateError = (data) ->
  #TweetStreamUI.showError()

TweetStreamUI.validateSuccess = (data) ->
  for tweet, x in data.tweets
    TweetStorage[x] = data.tweets[x]
  new_total = parseInt($('#tweet_numTweets').val()) + data.num_tweets
  $('#tweet_numTweets').val(new_total)
  $('#number-tweets').html(new_total)
