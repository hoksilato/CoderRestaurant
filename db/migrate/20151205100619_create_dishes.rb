class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :image_url
      t.integer :views, :default => 0
      t.references :menu, index: true

      t.timestamps
    end
    add_index :dishes, :name, unique: true
  end
end
