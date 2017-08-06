source 'https://rubygems.org'

git_source(:github) do |repo_name|
	repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
	"https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.3'
gem 'bootstrap-sass', '3.3.7'
gem 'puma', '3.9.1'
gem 'sass-rails', '5.0.6'
gem 'uglifier', '3.2.0'
gem 'coffee-rails', '4.2.2'
gem 'jquery-rails', '4.3.1'
gem 'turbolinks', '5.0.1'
gem 'jbuilder', '2.6.4'

group :development, :test do
	gem 'sqlite3', '1.3.13'
	gem 'byebug', platform: :mri
end

group :development do
	gem 'web-console', '>= 3.3.0'
	gem 'listen', '~> 3.0.5'
	gem 'spring'
	gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
	gem 'pg', '0.20.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
