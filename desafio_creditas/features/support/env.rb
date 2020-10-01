require 'selenium/webdriver'
require 'httparty'
require 'capybara'
require 'rspec'
require 'site_prism'
require 'pry'
require 'json'
require 'yaml'
require 'capybara/cucumber'
require 'pry'
require 'faker'

require_relative "../../fixtures/factories_post.rb"

# enables https calls
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
HTTParty::Basement.default_options.update(verify: false)

# Environment definitions
DEBUG = ENV['DEBUG'] || false
ENV['ENV'] = 'prd' unless ENV.has_key?'ENV'
ENVIRONMENT = YAML.load_file('./config/environment.yml')[ENV['ENV']]

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
Capybara.default_driver = :selenium_chrome
Capybara.default_max_wait_time = 15
window = Capybara.current_session.driver.browser.manage.window
window.resize_to(1260, 800)
