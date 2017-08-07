ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

# Prevent database truncation if the environment is production
if Rails.env.production?
	abort('The Rails environment is running in production mode!')
end

require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each do |file|
	require file
end

# Checks for pending migration and applies them before tests are run
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
	config.infer_spec_type_from_file_location!
	config.include Rails.application.routes.url_helpers
	config.include Capybara::DSL
end
