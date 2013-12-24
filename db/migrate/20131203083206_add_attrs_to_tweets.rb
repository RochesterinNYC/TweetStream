class AddAttrsToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :attrs, :text
  end
end
