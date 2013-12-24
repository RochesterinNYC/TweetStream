class AddApprovalMatrixToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :x_score, :decimal
    add_column :searches, :y_score, :decimal
  end
end
