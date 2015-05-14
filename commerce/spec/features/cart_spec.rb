require 'rails_helper'

RSpec.feature 'commerce cart' do

  let!(:item) { create(:item) }
  let(:user) { create(:user) }

  def add_item_to_cart
    visit home_path
    click_link('Items')
    click_on('Add to cart')
  end

  scenario 'nav bar has cart button' do
    visit home_path
    expect(page).to have_button('Cart (0)')
  end

  scenario 'the cart is empty with no items in it' do
    visit home_path
    click_on('Cart (0)')
    expect(page).to have_content('no items')
  end

  scenario 'items can be added to the cart' do
    add_item_to_cart
    click_on('Cart (1)')
    expect(page).to have_content('sample item')
    expect(page).to have_content('1')
  end

  scenario 'multiple items can be added to the cart' do
    add_item_to_cart
    click_on('Add to cart')
    click_on('Cart (2)')
    expect(page).to have_content('sample item')
    expect(page).to have_content('2')
  end  

  scenario 'user can increase items in cart' do
    add_item_to_cart
    click_on('Cart (1)')
    click_on('+')
    expect(page).to have_content('sample item')
    expect(page).to have_content('2')    
  end

  scenario 'user can decrease items in cart' do
    add_item_to_cart
    click_on('Add to cart')
    click_on('Cart (2)')
    click_on('-')
    expect(page).to have_content('sample item')
    expect(page).to have_content('1')    
  end

  scenario 'user gets detailed information in cart' do
    add_item_to_cart
    click_on('Add to cart')
    click_on('Cart (2)')
    expect(page).to have_content('sample item')
    expect(page).to have_content('quantity: 2')
    expect(page).to have_content('price: $1.50')
    expect(page).to have_content('subtotal: $3.00')
    # expect(page).to have_content('total: $3.00')
  end

  scenario 'user can remove items in cart if decreased to zero' do
    add_item_to_cart
    click_on('Cart (1)')
    click_on('-')
    expect(page).to have_content('no items')
  end

  scenario 'user can remove items in cart' do
    add_item_to_cart
    click_on('Cart (1)')
    click_on('remove')
    expect(page).to have_content('no items')
  end

  scenario 'a guest user cannot checkout' do
    user
    add_item_to_cart
    click_on('Cart (1)')
    expect(page).to have_link('Login to complete order')
    click_link('Login to complete order')
    fill_in 'session[email]', with: 'default@user.com'
    fill_in 'session[password]', with: 'password'
    click_button 'Login'
    click_on('Cart (1)')
    expect(page).to have_button('Complete Order')
  end

end