require 'rails_helper'

describe 'listings can be created.' do
	let(:user) { create(:user) }

	def login_with_user
		visit new_user_session_path
		fill_in "eメール", with: user.email
		fill_in "パスワード", with: user.password
		click_on "login"
		expect(page).to have_http_status :success
		expect(page).to have_content 'Signed in successfully.'
	end

	it 'can create listing' do
		login_with_user
		# create listing basic
		visit root_path
		click_on "ホストになる"
		select "マンション", from: "listing[house_type]"
		select "2年", from: "listing[house_years]"
		select "3人用", from: "listing[house_size]"
		click_button "保存"
		expect(page).to have_http_status :success
		# add listing description
		visit manage_listing_description_path(user)
		expect(page).to have_http_status :success
		fill_in "listing[listing_title]", with: "hoge hoge Title."
		fill_in "listing[listing_content]", with: "hoge hoge Content."
		click_button "更新"
		expect(page).to have_http_status :success
		# add listing price per night
		visit manage_listing_price_path(user)
		expect(page).to have_http_status :success
		fill_in "listing[price_pernight]", with: "2500"
		click_button "更新"
		expect(page).to have_http_status :success
		# add listing address
		visit manage_listing_address_path(user)
		expect(page).to have_http_status :success
		fill_in "listing[address]", with: "東京都港区六本木6丁目11-1"
		click_button "更新"
		expect(page).to have_http_status :success
	end

	it 'can not see unexistence listing edit page' do
		login_with_user
		# try to visit unexistence listing edit page
		visit manage_listing_basics_path(1000)
		expect(current_path).to eq root_path
		visit manage_listing_description_path(1000)
		expect(current_path).to eq root_path
		visit manage_listing_address_path(1000)
		expect(current_path).to eq root_path
		visit manage_listing_price_path(1000)
		expect(current_path).to eq root_path
	end

	it 'can not see another user\'s listing edit page' do
		login_with_user
		# create listing basic
		visit root_path
		click_on "ホストになる"
		select "アパート", from: "listing[house_type]"
		select "3年", from: "listing[house_years]"
		select "1人用", from: "listing[house_size]"
		click_button "保存"
		expect(page).to have_http_status :success
		# add listing description
		visit manage_listing_description_path(user)
		# expect(page).to have_http_status :success
		fill_in "listing[listing_title]", with: "fuga fuga Title."
		fill_in "listing[listing_content]", with: "fuga fuga Content."
		click_button "更新"
		# add listing price per night
		visit manage_listing_price_path(user)
		fill_in "listing[price_pernight]", with: "3000"
		click_button "更新"
		# add listing address
		visit manage_listing_address_path(user)
		fill_in "listing[address]", with: "東京都港区六本木6丁目11-1"
		click_button "更新"
		# another user can not check user's listing edit page
		unless user
			visit manage_listing_basics_path(user)
			expect(current_path).to eq root_path
			visit manage_listing_description_path(user)
			expect(current_path).to eq root_path
			visit manage_listing_address_path(user)
			expect(current_path).to eq root_path
			visit manage_listing_price_path(user)
			expect(current_path).to eq root_path
		end
	end
end

