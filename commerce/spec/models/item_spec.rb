require 'rails_helper'

RSpec.describe 'an item' do

  let!(:item) { create(:item) }

  it 'returns true if an item is available' do
    item_id = item.id 
    expect(Item.available?(item_id)).to eq(true)
  end

  it 'returns false if an item is not available' do
    item_id = Item.last.id+1
    expect(Item.available?(item_id)).to eq(false)
  end

  it 'returns false if the item is discontinued' do
    expect(Item.available?(item.id)).to eq(true)
    item.discontinue = true
    item.save
    expect(Item.available?(item.id)).to eq(false)
  end

end