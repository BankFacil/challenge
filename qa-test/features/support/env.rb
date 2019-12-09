require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'faker' 
require 'json'
require 'pry'
require 'httparty'

Capybara.default_max_wait_time = 10

Capybara.configure do |config|
    config.default_driver = :selenium
end