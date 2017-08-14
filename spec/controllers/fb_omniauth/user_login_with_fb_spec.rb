require 'rails_helper'

describe 'can log in with fb omniauth' do
	let(:user) { User.create(name: 'hoge', email: 'hoge@hoge.com') }

	before do
		OmniAuth.config.mock_auth[:facebook] = nil
		Rails.application.env_config['omniauth.auth'] =
				facebook_mock(user.name, user.email)
		visit new_user_session_path
		click_link 'facebook_login'
	end

	it 'log in with fs omniauth' do
		expect(page.status_code).to eq 200
	end
end
