# require "open-uri"
class Tweet < ActiveRecord::Base
	serialize :tweet_hash, Hash
	belongs_to :user
	belongs_to :search

	def self.save_tweet(tweet, user_id, search_id)
		long = tweet.attrs[:coordinates][:coordinates][0] if tweet.attrs[:coordinates]
		lat = tweet.attrs[:coordinates][:coordinates][1] if tweet.attrs[:coordinates]
		create!(
			user_id: user_id,
			search_id: search_id,
			tweet_created_at: tweet.created_at,
			id_str: tweet.id,
			text: tweet.full_text,
			source: tweet.source,
			user_id_str: tweet.attrs[:user][:id_str],
			user_screen_name: tweet.user.screen_name,
			user_location: tweet.user.location,
			user_description: tweet.user.description,
			user_url: tweet.user.url.to_s,
			user_followers_count: tweet.user.followers_count,
			user_friends_count: tweet.user.friends_count,
			user_profile_image_url: tweet.user.profile_image_url.to_s,
			longitude: long,
			latitude: lat,
			# place: tweet.attrs[:place],
			raw_text: tweet.full_text,
			tweet_hash: tweet.attrs
		)
		# tw.tweet_hash = tweet.attrs
		# tw.save!
	end

	def self.save_tweets(tweets, user_id, search_id)
		tweets.each do |tweet|
			self.save_tweet(tweet, user_id, search_id)
		end
	end
end
