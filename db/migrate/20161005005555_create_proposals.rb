class CreateProposals < ActiveRecord::Migration[5.0]
  def change
    create_table :proposals do |t|
      t.references :user, foreign_key: true
      t.references :walker, foreign_key: true
      t.string :date
      t.string :time
      t.string :dogs
      t.string :gang
      t.text :observation

      t.timestamps
    end
  end
end
