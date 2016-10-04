class CreateDogs < ActiveRecord::Migration[5.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :age
      t.string :size
      t.string :race
      t.string :personality

      t.timestamps
    end
  end
end
