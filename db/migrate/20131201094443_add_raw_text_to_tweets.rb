class AddRawTextToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :raw_text, :text
  end
end
