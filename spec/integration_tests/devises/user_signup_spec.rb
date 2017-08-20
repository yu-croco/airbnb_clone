require 'rails_helper'

describe 'sign up with devise' do
	it 'can login with correct user' do
		visit new_user_registration_path
		fill_in 'email', with: 'fugera@example.com'
		fill_in 'password', with: 'piyohogefuga'
		fill_in 'password_confirmation', with: 'piyohogefuga'
		click_on "submit"
		expect(page).to have_http_status :success
		expect(page).to have_content 'You have signed up successfully.'
	end
end
