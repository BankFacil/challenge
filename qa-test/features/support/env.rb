require "capybara/cucumber"
require "selenium-webdriver"
require "site_prism"
require "httparty"
require "rspec"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 10