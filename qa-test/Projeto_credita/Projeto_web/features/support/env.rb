require 'rspec'
require 'cucumber'
require 'selenium-webdriver'
require 'pry'
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'rspec/expectations'

BROWSER = ENV['BROWSER']

def poltergeist_options
    {
      :js_errors => false,
      :debug => true, 
      :phantomjs_options => [
        '--ignore-ssl-errors=true',
        '--ssl-protocol=any',
        '--web-security=false'],
      :window_size => [1440, 2000],
      :screen_size => [1440, 2000]
    }
  end

#Variavel de configuração de BASE_URL de ambiente homologação ou Produção.
$ambiente = 'homo'
$base_url = YAML.load_file('./features/config/environment.yml')[$ambiente]
$base_url['base_url'] = $base_url['base_url'] + ENV['versao'] if ENV['versao'] != nil

Capybara.register_driver :selenium do |app|
    ENV['HTTP_PROXY'] = ENV['http_proxy'] = nil
    if BROWSER.eql?('chrome')
    Capybara::Selenium::Driver.new(app, 
    :browser => :chrome,
    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions' => {
            'args' => [ "--start-maximized", "--disable-infobars"]}
        )
    )
    elsif BROWSER.eql?('firefox')
        Capybara::Selenium::Driver.new(app, 
        :browser => :firefox,
        marionette: true
        ) 
    elsif BROWSER.eql?('headless')
        capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
        chromeOptions: { args: %w[headless no-sandbox disable-gpu ignore-certificate-errors start-maximized screenshot] })
        Capybara::Selenium::Driver.new app,
        browser: :chrome,
        desired_capabilities: capabilities
    elsif BROWSER.eql?('poltergeist')
        Capybara::Poltergeist::Driver.new(app, poltergeist_options)
    end
end

Capybara.configure do |config|
    config.default_driver = :selenium
    config.javascript_driver = :selenium
end

Capybara.default_max_wait_time = 15