class TwitterService
  US_WOEID = 23424977           # 32-bit unique identifier for the U.S.
  LANG = "en"
	attr_accessor :client, :rate_limit
  def initialize()
    @client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
		  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
		  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
		  config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
		end
  end

  def search(keywords)
    @client.search("##{keywords}", lang: LANG, include_entities: true)
  end

  def get_tweets_from keywords, excluded, language, latitude, longitude, radius, distance

  end

end
