require 'rails_helper'

RSpec.feature 'user logs out' do

  let!(:user)  { create(:user) }
  let!(:admin) { create(:admin) }

  def login(email, password = 'password')
    visit login_path
    fill_in 'session[email]', with: email
    fill_in 'session[password]', with: password
    click_button 'Login'
  end

  scenario 'default user logs out' do
    login(user.email)
    expect(page).to have_content('Welcome default user')
    click_button 'Logout'
    expect(page).to have_content('Welcome guest user')
  end

  scenario 'admin user logs out' do
    login(admin.email)
    expect(page).to have_content('Welcome admin user')
    click_button 'Logout'
    expect(page).to have_content('Welcome guest user')
  end

end