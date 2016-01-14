class CreateBrains < ActiveRecord::Migration
  def change
    create_table :brains do |t|
      t.integer :zombie_id
      t.string :status
      t.string :flavor

      t.timestamps null: false
    end
    add_index :brains, :zombie_id #加上foreign_key index
  end
end
