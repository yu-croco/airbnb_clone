require 'rails_helper'

describe 'sign up with devise' do
  it 'can login with correct user' do
    visit new_user_registration_path
    fill_in 'user[email]', with: 'fugera@example.com'
    fill_in 'user[password]', with: 'piyohogefuga'
    fill_in 'user[password_confirmation]', with: 'piyohogefuga'
    click_button "アカウント作成"
    expect(page).to have_http_status :success
  end
end
