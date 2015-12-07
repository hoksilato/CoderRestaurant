class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.references :order, index: true
      t.references :dish, index: true

      t.timestamps
    end
  end
end
