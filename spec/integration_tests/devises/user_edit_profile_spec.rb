require 'rails_helper'

describe 'edit user profile' do
	let(:user) { create(:user) }

	it 'can edit user profile if edit correctly' do
		# login
		visit new_user_session_path
		fill_in 'eメール', with: user.email
		fill_in 'パスワード', with: user.password
		click_on "login"
		expect(page).to have_content 'Signed in successfully.'
		# edit profile
		visit edit_user_registration_path
		fill_in "email", with: 'fugafuga@example.com'
		fill_in "phone_number", with: '080-1111-2222'
		fill_in 'description', with: 'I am hoge fuga.'
		fill_in "new_password", with: '12345678'
		fill_in 'password_confirmation', with: '12345678'
		click_button 'submit'
		expect(page).to have_http_status :success
	end

end

