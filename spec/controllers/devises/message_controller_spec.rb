require 'rails_helper'

describe 'login / logout with devise' do
	let(:user) { create(:user) }
	let(:no_account_user) { create(:no_account_user) }

	it 'login with correct user' do
		visit new_user_session_path
		fill_in 'eメール', with: 'hoge@example.com'
		fill_in 'パスワード', with: 'hogehogehoge'
		expect(page).to have_http_status :success
	end

	it 'can not login with no account user' do
		visit new_user_session_path
		fill_in 'eメール', with: 'hoge@example.com'
		fill_in 'パスワード', with: 'piyohogefuga'
	end

end
