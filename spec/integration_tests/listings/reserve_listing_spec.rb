require 'rails_helper'

describe 'listings can be created.' do
	let(:user) { create(:user) }

	def login_with_user
		visit new_user_session_path
		fill_in 'user[email]', with: user.email
		fill_in 'user[password]', with: user.password
		click_button "login"
		expect(page).to have_content 'Signed in successfully.'
	end

	def create_listing
		visit root_path
		click_on "ホストになる"
		find("option[value='mansion']").select_option
		fill_in "listing[house_years]", with: "5"
		find("option[value='single']").select_option
		click_button "保存"

		# add listing address
		visit manage_listing_description_path(user)
		fill_in "listing[listing_title]", with: "hoge hoge Title."
		fill_in "listing[listing_content]", with: "hoge hoge Content."
		click_button "更新"

		# add listing price per night
		visit manage_listing_price_path(user)
		fill_in "listing[price_pernight]", with: "2500"
		click_button "更新"

		# add listing address
		visit manage_listing_address_path(user)
		fill_in "listing[address]", with: "東京都港区六本木6丁目11-1"
		click_button "更新"
	end

	it 'can reserve listing with correct date' do
		login_with_user
		create_listing
		sleep 1 # wait 1 sec for load
		visit listing_path(1)
		fill_in "reservation[start_date]", with: "2017/01/01"
		fill_in "reservation[end_date]", with: "2017/01/12"
		click_button "この日程で予約する"
		expect(page).to have_http_status :success
		expect(current_path).to eq listing_path(1)
		expect(page).to have_content '予約が完了しました。'
	end

	it 'can not reserve listing with incorrect date' do
		login_with_user
		create_listing
		sleep 1 # wait 1 sec for load
		visit listing_path(1)
		fill_in "reservation[start_date]", with: "2017/01/51"
		fill_in "reservation[end_date]", with: "2017/14/62"
		click_button "この日程で予約する"
		expect(current_path).to eq listing_path(1)
		expect(page).to have_content '予約に失敗しました。もう一度予約してください。'
	end
end

