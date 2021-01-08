require 'capybara'
require 'capybara/cucumber'
require 'byebug'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
require 'faker'
require_relative 'helper.rb'
require_relative 'page_helper.rb'

World(Pages)
World(Helper)

ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE']
HEADLESS = ENV['HEADLESS']

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT_TYPE}.yml")

## register driver according with browser chosen
Capybara.register_driver :selenium do |app|
  if HEADLESS.eql?('headless')
    option = ::Selenium::WebDriver::Chrome::Options.new(args: ['--headless', '--disable-gpu', '--window-size=1600,1024'])
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: option)

  elsif HEADLESS.eql?('no_headless')
    option = ::Selenium::WebDriver::Chrome::Options.new(args: ['--disable-infobars', 'window-size=1600,1024'])
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: option)
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = CONFIG['url_default']
  config.default_max_wait_time = 30
end
