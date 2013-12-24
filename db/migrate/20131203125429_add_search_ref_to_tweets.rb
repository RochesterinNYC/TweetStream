class AddSearchRefToTweets < ActiveRecord::Migration
  def change
    add_reference :tweets, :search, index: true
  end
end
