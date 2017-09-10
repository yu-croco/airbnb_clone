require 'rails_helper'

describe 'listings can be created (test expect for stripe input form).' do
	let(:user) { create(:user) }

	it 'can reserve listing with correct date' do
		login_with_user(user)
		create_listing
		# wait 5 sec for load
		sleep 5
		visit listing_path(1)
		fill_in "reservation[start_date]", with: "2017/01/01"
		fill_in "reservation[end_date]", with: "2017/01/12"
		click_button "この日程で予約する"
		expect(page).to have_http_status :success
		expect(current_path).to eq "/listings/1/reservations/new"
		click_button *"円を支払って予約を完了する"
		expect(page).to have_http_status :success
	end
end

