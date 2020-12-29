require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'webdrivers'
require 'httparty'

Capybara.configure do |config|
config.default_driver = :selenium_chrome
config.app_host = "https://www.ze.delivery/"
config.default_max_wait_time = 30
end   