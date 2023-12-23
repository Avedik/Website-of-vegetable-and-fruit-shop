class Order < ApplicationRecord
  has_many :order_lines, dependent: :destroy
  belongs_to :user
end
