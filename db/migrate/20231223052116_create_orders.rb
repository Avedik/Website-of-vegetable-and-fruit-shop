class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :total_amount
      t.boolean :order_status

      t.timestamps
    end
  end
end
