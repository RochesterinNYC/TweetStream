class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.datetime :tweet_created_at
      t.string :id_str
      t.string :text
      t.string :source
      t.string :user_id_str
      t.string :user_screen_name
      t.string :user_location
      t.string :user_description
      t.string :user_url
      t.integer :user_followers_count
      t.string :user_friends_count
      t.string :user_profile_image_url
      t.string :geo
      t.string :coordinates
      t.string :place

      t.timestamps
    end
  end
end
