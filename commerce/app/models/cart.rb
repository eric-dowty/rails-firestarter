class Cart

  attr_accessor :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def count_items
    @contents.values.sum
  end

  def empty?
    contents == {}
  end

  def add_to_cart(item_data)
    @contents[item_data['item_id']] ||= 0
    @contents[item_data['item_id']] += item_data['quantity'].to_i
  end

  def contents_with_object
    contents_with_object = {}
    @contents.map do |item_id, quantity|
      item = Item.find(item_id)
      contents_with_object[item] = quantity
    end
    contents_with_object
  end

  def total
    contents_with_object.reduce(0) do |sum, (item, quantity)|
      sum += (item.price * quantity)
    end 
  end

  def adjust(adjust_data)
    @contents[adjust_data[:id]] += 1 if adjust_data[:adjust] == 'increase'
    @contents[adjust_data[:id]] -= 1 if adjust_data[:adjust] == 'decrease'
    @contents[adjust_data[:id]]  = 0 if adjust_data[:adjust] == 'remove'
  end

  def sanitize
    @contents.reject! { |item_id, quantity| quantity <= 0 }
    Cart.new(@contents)
  end

end