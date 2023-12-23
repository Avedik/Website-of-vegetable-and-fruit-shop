class Order_line < ApplicationRecord
  belongs_to :order
  belongs_to :product
end