require 'rails_helper'

describe 'login with devise' do
	let(:user) { create(:user) }

	it 'can login with correct user' do
		visit new_user_session_path
		fill_in 'user[email]', with: user.email
		fill_in 'user[password]', with: user.password
		click_button "login"
		expect(page).to have_http_status :success
		expect(page).to have_content 'Signed in successfully.'
	end

end
