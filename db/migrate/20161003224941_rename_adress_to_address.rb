class RenameAdressToAddress < ActiveRecord::Migration[5.0]
  def change
    change_table :walkers do |t|
      t.rename :adress, :address
    end
  end
end
