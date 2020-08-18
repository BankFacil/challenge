require 'rspec'
require 'site_prism'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara'
require 'watir'
require 'httparty'

#configurando o driver Capybara
Capybara.register_driver :chrome do |app|
	Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

#Setando a configuração do driver como padrão
Capybara.configure do |config|
	config.default_driver = :chrome
end
