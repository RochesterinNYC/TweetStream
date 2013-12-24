class AddCoordinatesToTweets < ActiveRecord::Migration
  def change
  	rename_column :tweets, :geo, :longitude
  	rename_column :tweets, :coordinates, :latitude
  end
end
