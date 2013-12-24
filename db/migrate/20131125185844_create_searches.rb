class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :latitude
      t.string :longitude
      t.string :radius
      t.string :results_summary

      t.timestamps
    end
  end
end
