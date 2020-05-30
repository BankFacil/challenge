require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'report_builder'
require 'rspec'
require 'yaml'
require_relative 'page_helper.rb'

World(Pages)

BROWSER = ENV['BROWSER']
ENVIRONMENT = ENV['ENVIRONMENT']

ReportBuilder.configure do |config|
  config.color            = 'purple'
  config.input_path       = 'results/cucumber_json'
  config.report_path      = 'results/report_builder/report_builder'
  config.report_types     = %i[retry html]
  config.report_title     = 'Creditas - Test Results'
  config.additional_info  = { browser: 'Browser', environment: 'Environment' }
end

ReportBuilder.build_report

Capybara.register_driver :selenium do |app|
  if BROWSER.eql?('chrome')
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--disable-infobars')
    Capybara::Selenium::Driver.new(
      app,
      :browser  => :chrome,
      options: options
    )
  elsif BROWSER.eql?('firefox')
    Capybara::Selenium::Driver.new(
      app,
      :browser => :firefox,
      :marionette => true
    )
  end
end
