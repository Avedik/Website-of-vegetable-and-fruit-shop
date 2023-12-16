class AddDetailsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :price, :decimal
    add_column :products, :quantity, :integer
  end
end
