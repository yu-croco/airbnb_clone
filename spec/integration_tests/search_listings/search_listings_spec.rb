require 'rails_helper'

describe 'listings can be searched on welcome page.' do
  let(:user) { create(:user) }

  it 'can search listing on map' do
    login_with_user(user)
    create_listing
    # wait 5 sec for load
    sleep 5
    visit root_path
    fill_in "search", with: "東京都港区六本木6丁目11-1"
    fill_in "start_date", with: Date.tomorrow
    fill_in "end_date", with: Date.tomorrow.since(10.days)
    click_button "検索"
    expect(page).to have_http_status :success
    expect(current_path).to eq listing_search_path
  end
end

