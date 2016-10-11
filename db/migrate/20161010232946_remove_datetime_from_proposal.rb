class RemoveDatetimeFromProposal < ActiveRecord::Migration[5.0]
  def change
    remove_column :proposals, :datetime, :string
  end
end
