json.array!(@tweets) do |tweet|
  json.extract! tweet, :tweet_created_at, :id_str, :text, :source, :user_id_str, :user_screen_name, :user_location, :user_description, :user_url, :user_followers_count, :user_friends_count, :user_profile_image_url, :geo, :coordinates, :place
  json.url tweet_url(tweet, format: :json)
end
