require 'rails_helper'

RSpec.feature 'home page' do

  let!(:user)  { create(:user) }
  let!(:admin) { create(:admin) }

  def login(email, password = 'password')
    visit login_path
    fill_in 'session[email]', with: email
    fill_in 'session[password]', with: password
    click_button 'Login'
  end 

  scenario 'signed in default user visits home page' do
    login(user.email)
    expect(page).to have_content('Welcome default user')
  end

  scenario 'signed in admin user visits home page' do
    login(admin.email)
    expect(page).to have_content('Welcome admin user')
  end

  scenario 'unsigned in guest user visits home page' do
    visit home_path
    expect(page).to have_content('Welcome guest user')
  end

  scenario 'while not signed in the nav bar has a login button' do
    visit home_path
    expect(page).to_not have_link('Logout')
    expect(page).to have_link('Login')
  end

  scenario 'while signed in the nav bar has a logout link' do
    login(user.email)
    expect(page).to_not have_link('Login')
    expect(page).to have_button('Logout')
  end
end