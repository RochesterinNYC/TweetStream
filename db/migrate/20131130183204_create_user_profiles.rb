class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.integer :twitter_id
      t.string :id_str
      t.string :name
      t.string :screen_name
      t.string :location
      t.string :description
      t.string :url
      t.boolean :protected
      t.integer :followers_count
      t.integer :friends_count
      t.integer :listed_count
      t.datetime :user_created_at
      t.integer :favourites_count
      t.string :time_zone
      t.boolean :geo_enabled
      t.integer :statuses_count
      t.string :profile_image_url

      t.timestamps
    end
  end
end
