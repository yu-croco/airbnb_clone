source 'http://rubygems.org'

git_source(:github) do |repo_name|
	repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
	"https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.3'
gem 'toastr-rails'
gem 'devise'
gem 'bootstrap-sass', '3.3.7'
gem 'puma', '3.9.1'
gem 'sass-rails', '5.0.6'
gem 'uglifier', '3.2.0'
gem 'coffee-rails', '4.2.2'
gem 'jquery-rails', '4.3.1'
gem 'turbolinks', '5.0.1'
gem 'jbuilder', '2.6.4'
gem 'railties', '5.0.5'
gem 'omniauth'
gem 'omniauth-facebook'
gem "paperclip", "~> 5.0.0"
gem 'dropzonejs-rails'
gem 'geocoder'
gem 'jquery-ui-rails'
gem 'simple_form'
gem 'enumerize'
gem 'rails-i18n'

group :development, :test do
	gem 'sqlite3', '1.3.13'
	gem 'byebug', platform: :mri
	gem 'spring-commands-rspec', '1.0.4'
	gem 'pry', '0.10.4'
	gem 'pry-doc', '0.11.1'
	gem 'bullet'
end

group :development do
	gem 'web-console', '>= 3.3.0'
	gem 'listen', '~> 3.0.5'
	gem 'spring'
	gem 'spring-watcher-listen'
end

group :test do
	gem 'capybara'
	gem 'capybara-email'
	gem 'database_cleaner'
	gem 'factory_girl_rails'
	gem 'poltergeist'
	gem 'rspec-rails'
	gem 'shoulda-matchers'
	gem 'faker'
	gem 'rails-controller-testing'
end

group :production do
	gem 'pg', '0.20.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
