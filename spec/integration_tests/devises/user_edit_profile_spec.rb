require 'rails_helper'

describe 'edit user profile' do
  let(:user) { create(:user) }

  it 'can edit user profile if edit correctly' do
    # login
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button "login"
    expect(page).to have_http_status :success
    # edit profile
    visit edit_user_registration_path
    fill_in "user[email]", with: 'fugafuga@example.com'
    fill_in "user[phone_number]", with: '080-1111-2222'
    fill_in 'user[description]', with: 'I am hoge fuga.'
    fill_in "user[new_password]", with: '12345678'
    fill_in 'user[password_confirmation]', with: '12345678'
    click_button 'プロフィールを更新'
    expect(page).to have_http_status :success
  end

end

