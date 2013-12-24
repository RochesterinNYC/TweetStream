class RenameAttrsColumnForTweets < ActiveRecord::Migration
  def change
  	rename_column :tweets, :attrs, :tweet_hash
  end
end
