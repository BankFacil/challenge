require 'capybara/cucumber'
require 'site_prism'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'rspec'

$env = ENV['BROWSER']

Capybara.configure do |config|

  if $env == 'chrome'
    config.default_driver = :selenium_chrome
  else
    config.default_driver = :selenium
  end

  config.default_max_wait_time = 10
  config.app_host = 'https://the-internet.herokuapp.com'
end
