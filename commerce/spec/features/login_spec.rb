require 'rails_helper'

RSpec.feature 'user login' do

  let!(:user)  { create(:user) }
  let!(:admin) { create(:admin) }

  def login(email, password = 'password')
    visit login_path
    fill_in 'session[email]', with: email
    fill_in 'session[password]', with: password
    click_button 'Login'
  end

  scenario 'a default user logs in' do
    login(user.email)
    expect(page).to have_content('Welcome default user')
    expect(user.role).to eq('default')
  end

  scenario 'an admin user logs in' do
    login(admin.email)
    expect(page).to have_content('Welcome admin user')
    expect(admin.role).to eq('admin')
  end

  scenario 'a user tries to login with bad email' do
    login('bad@user.com')
    expect(page).to have_content('Invalid login')
  end

  scenario 'a user tries to login with no email' do
    login(nil)
    expect(page).to have_content('Invalid login')
  end

  scenario 'a user tries to login with bad password' do
    login(user.email, 'bad_password')
    expect(page).to have_content('Invalid login')
  end

  scenario 'a user tries to login with no password' do
    login(user.email, nil)
    expect(page).to have_content('Invalid login')
  end

  scenario 'a user tries to login with bad email and bad password' do
    login('bad@user.com', 'bad_password')
    expect(page).to have_content('Invalid login')
  end

  scenario 'a user tries to login with no email and no password' do
    login(nil, nil)
    expect(page).to have_content('Invalid login')
  end

end

