class RemoveAcceptedFromProposal < ActiveRecord::Migration[5.0]
  def change
    remove_column :proposals, :accepted, :string
  end
end
