class AddLocationAndAcceptedToProposal < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :location, :string
    add_column :proposals, :accepted, :boolean
  end
end
