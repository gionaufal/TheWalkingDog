class AddFieldsToProposal < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :days, :string
    add_column :proposals, :hours, :string
  end
end
