require 'rspec'
require 'site_prism'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara'
require 'watir'
require 'httparty'
require 'openssl'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

#Configurando o driver Capybara
Capybara.configure do |config|
    config.default_driver = :selenium_chrome
end

Capybara.default_max_wait_time = 5


