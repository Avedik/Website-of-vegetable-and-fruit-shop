class User < ApplicationRecord
  has_one :order, dependent: :destroy

  before_create do
    self.id = [1, (self.class.maximum(:id) || 0) + 1].max if self.id.nil?
  end
end