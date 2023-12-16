class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :product
      t.decimal :count

      t.timestamps
    end
  end
end
