require 'capybara/cucumber'
require 'pry'
require 'rspec'
require 'page-object'
require 'site_prism'

Capybara.default_driver = :selenium

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome
  )
end
