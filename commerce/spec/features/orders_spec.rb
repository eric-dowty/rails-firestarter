require 'rails_helper'

RSpec.feature 'user orders' do

  let!(:user)     { create(:user) }
  let!(:item)     { create(:item) }
  let!(:ordered)  { create(:ordered) }

  def user_login
    visit login_path
    fill_in 'session[email]', with: 'default@user.com'
    fill_in 'session[password]', with: 'password'
    click_button 'Login' 
  end

  def add_item_to_cart
    visit items_path
    click_on('Add to cart')
    click_on('Cart (1)')
  end

  scenario 'a user can place an order' do
    user_login  
    add_item_to_cart
    click_on('Complete Order')
    expect(page).to have_content('default@user.com')
    expect(page).to have_content('ordered')
    expect(page).to have_content('sample item')
    expect(page).to have_content('quantity: 1')
    expect(page).to have_content('price: $1.50')
    expect(page).to have_content('subtotal: $1.50')
    expect(page).to have_content('total: $1.50')
  end

  scenario 'a user can place an order with multiple items' do
    user_login 
    add_item_to_cart
    click_on('+')
    click_on('Complete Order')
    expect(page).to have_content('default@user.com')
    expect(page).to have_content('ordered')
    expect(page).to have_content('sample item')
    expect(page).to have_content('quantity: 2')
    expect(page).to have_content('price: $1.50')
    expect(page).to have_content('subtotal: $3.00')
    expect(page).to have_content('total: $3.00')
  end

end