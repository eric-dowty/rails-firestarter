class OrderItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates :order_id, :item_id, :quantity, presence: true
end