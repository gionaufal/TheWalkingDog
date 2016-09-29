class CreateWalkers < ActiveRecord::Migration[5.0]
  def change
    create_table :walkers do |t|
      t.string :name
      t.string :age
      t.string :adress
      t.string :cpf
      t.text :bio
      t.text :experience
      t.string :price
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
