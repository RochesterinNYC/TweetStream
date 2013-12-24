class AddRawTextToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :raw_text, :text
  end
end
