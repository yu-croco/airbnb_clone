require 'rails_helper'

describe 'login / logout with devise' do
	let(:user) { create(:user) }

	it 'login with correct user' do
		visit new_user_session_path
		login_user user
		expect(page).to have_http_status :success
	end

end
