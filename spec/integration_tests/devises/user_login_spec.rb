require 'rails_helper'

describe 'login with devise' do
	let(:user) { create(:user) }

	it 'can login with correct user' do
		visit new_user_session_path
		fill_in 'eメール', with: user.email
		fill_in 'パスワード', with: user.password
		click_on "login"
		expect(page).to have_http_status :success
		expect(page).to have_content 'Signed in successfully.'
	end

end
