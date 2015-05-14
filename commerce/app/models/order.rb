class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  has_many :order_items
  has_many :items, through: :order_items

  validates :user_id, presence: true
  validates :status_id, presence: true

  def report
    OpenStruct.new(user: User.find(self.user_id),
                   status: Status.find(self.status_id),
                   created: self.created_at,
                   items_data: self.items_data,
                   total: self.total
                  )
  end

  def items_data
    items_data = {}
    self.order_items.each do |order_item|
      item = Item.find(order_item.item_id)
      items_data[item.title] = {quantity: order_item.quantity,
                               price: item.price,
                               subtotal: item.subtotal(order_item.quantity)
                              }
    end
    items_data
  end

  def total
    self.order_items.reduce(0) do |sum, order_item|
      item = Item.find(order_item.item_id)
      sum += (item.price * order_item.quantity)
    end
  end

  def add_items(cart_contents)
    cart_contents.each do |item_id, quantity|
      OrderItem.create!(order_id: self.id, item_id: item_id, quantity: quantity)
    end
  end

  def self.generate(user)
    status = Status.find_by(name: 'ordered') 
    order  = Order.new(user_id: user.id, status_id: status.id)
  end

end