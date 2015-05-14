class Item < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :price, numericality: { greater_than: 0 }

  has_attached_file :image, default_url: "default_image.jpg"
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]

  def self.available?(item_id)
    Item.exists?(item_id) && !Item.find(item_id).discontinue
  end

  def subtotal(quantity)
    self.price * quantity
  end

end