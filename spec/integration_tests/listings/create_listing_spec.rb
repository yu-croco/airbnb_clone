require 'rails_helper'

describe 'listings can be created.' do
  let(:user) { create(:user) }

  it 'can create listing' do
    login_with_user(user)

    # create listing basic
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
    expect(page).to have_http_status :success
  end

  it 'can not see unexistence listing edit page' do
    login_with_user(user)
    # try to visit unexistence listing edit page
    visit edit_listing_path(1000)
  end

  it 'can not see another user\'s listing edit page' do
    login_with_user(user)
    create_listing

    # another user can not check user's listing edit page
    unless user
      visit edit_listing_path(1)
      expect(current_path).to eq root_path
    end
  end
end

