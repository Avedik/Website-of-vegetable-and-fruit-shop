class CreateOrderLines < ActiveRecord::Migration[7.0]
  def change
    create_table :order_lines do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
