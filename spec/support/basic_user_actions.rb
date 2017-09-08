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

		# fill in house info
		find("option[value='mansion']").select_option
		fill_in "listing[house_years]", with: "5"
		find("option[value='single']").select_option

		# fill in address info
		fill_in "listing[address]", with: "東京都港区六本木6丁目11-1"

		# fill in listing info
		fill_in "listing[listing_title]", with: "hoge hoge Title."
		fill_in "listing[listing_content]", with: "hoge hoge Content."

		# fill in price info
		fill_in "listing[price_pernight]", with: "2500"

		# fill in publish info
		find("option[value='true']").select_option

		click_button "保存"
	end

end