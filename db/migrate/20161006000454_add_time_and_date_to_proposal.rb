class AddTimeAndDateToProposal < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :date, :date
    add_column :proposals, :time, :time
  end
end
