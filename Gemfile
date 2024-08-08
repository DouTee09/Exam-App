source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.4"

gem "rails", "~> 6.1.7", ">= 6.1.7.7"
gem "mysql2"
gem "puma", "~> 5.0"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 5.0"
gem "jbuilder", "~> 2.7"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.4.4", require: false
gem "dotenv"
gem "faker"
gem "bootstrap", "~> 5.3"
gem "kaminari"
gem "bootstrap5-kaminari-views"
gem "devise", "~> 4.1"
gem "letter_opener", :group => :development
gem "letter_opener_web", "~> 3.0"
gem "roo"
gem "roo-xls"
gem "cancancan"
gem "sidekiq"
gem 'rails-i18n'

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling "console" anywhere in the code.
  gem "web-console", ">= 4.1.0"
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem "rack-mini-profiler", "~> 2.0"
  gem "listen", "~> 3.3"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver", ">= 4.0.0.rc1"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "tailwindcss-rails", "~> 2.5"
