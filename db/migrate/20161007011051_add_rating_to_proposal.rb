class AddRatingToProposal < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :rating, :integer
  end
end
