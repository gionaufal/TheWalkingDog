class AddDatetimeToProposal < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :datetime, :datetime
  end
end
