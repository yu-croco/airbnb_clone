require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

require 'devise'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
	config.fixture_path = "#{::Rails.root}/spec/fixtures"
	config.use_transactional_fixtures = true
	config.infer_spec_type_from_file_location!
	config.filter_rails_from_backtrace!
	config.include FacebookMock, type: :controller
	config.include Devise::Test::ControllerHelpers, type: :controller
end

# force ORM to use the same transaction for all threads (for fb omniauth)
class ActiveRecord::Base
	mattr_accessor :shared_connection
	@@shared_connection = nil

	def self.connection
		@@shared_connection || retrieve_connection
	end
end
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
