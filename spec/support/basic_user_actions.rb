module BasicUserActions
	def login_with_user(user)
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

end