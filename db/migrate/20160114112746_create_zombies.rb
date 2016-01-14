class CreateZombies < ActiveRecord::Migration
  def change
    create_table :zombies do |t|
      t.string :name
      t.text :bio
      t.integer :age
      t.boolean :rotting
      t.string :email

      t.timestamps null: false
    end
  end
end
