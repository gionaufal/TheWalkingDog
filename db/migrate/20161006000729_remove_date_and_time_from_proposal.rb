class RemoveDateAndTimeFromProposal < ActiveRecord::Migration[5.0]
  def change
    remove_column :proposals, :date, :string
    remove_column :proposals, :time, :string
  end
end
