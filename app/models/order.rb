class Order < ApplicationRecord
  has_many :order_lines
  belongs_to :user
end
