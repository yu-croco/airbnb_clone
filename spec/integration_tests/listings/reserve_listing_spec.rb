require 'rails_helper'

describe 'listings can be created.' do
	let(:user) { create(:user) }

	it 'can reserve listing with correct date' do
		login_with_user(user)
		create_listing
		sleep 5 # wait 1 sec for load
		visit listing_path(1)
		fill_in "reservation[start_date]", with: "2017/01/01"
		fill_in "reservation[end_date]", with: "2017/01/12"
		click_button "この日程で予約する"
		expect(page).to have_http_status :success
		expect(current_path).to eq listing_path(1)
		expect(page).to have_content '予約が完了しました。'
	end

	it 'can not reserve listing with incorrect date' do
		login_with_user(user)
		create_listing
		sleep 5 # wait 1 sec for load
		visit listing_path(1)
		fill_in "reservation[start_date]", with: "2017/01/51"
		fill_in "reservation[end_date]", with: "2017/14/62"
		click_button "この日程で予約する"
		expect(current_path).to eq listing_path(1)
		expect(page).to have_content '予約に失敗しました。もう一度予約してください。'
	end
end

