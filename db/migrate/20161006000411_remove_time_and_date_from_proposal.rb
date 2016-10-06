class RemoveTimeAndDateFromProposal < ActiveRecord::Migration[5.0]
  def change
    remove_column :proposals, :time, :string
    remove_column :proposals, :date, :string
  end
end
