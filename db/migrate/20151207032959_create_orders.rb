class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.string :phone
      t.string :address
      t.string :coupon_code
      t.float :price

      t.timestamps
    end
  end
end
