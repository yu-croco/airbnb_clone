require'rails_helper'

describe "can visit welcome page" do
	it "has a valid factory" do
		visit root_path
		expect(page).to have_content 'Hello, world!'
	end
end

