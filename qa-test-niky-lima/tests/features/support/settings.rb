# ---
require 'yaml'

class Settings
  # ---
  def self.get_environment_path
    yaml_file_path   = "/config/#{ENVIRONMENT}.yaml"
    environment_path = YAML.load_file(File.dirname(__FILE__) + yaml_file_path)
    return environment_path
  end

  def self.get_configurations
    config = get_environment_path
    
    Capybara.configure do |config|
      config.default_driver = :selenium
    end
    
    Capybara.default_max_wait_time = 60
    Capybara.current_session.driver.browser.manage.window.maximize

    return config
  end

  def self.get_url(path)
    return "#{get_configurations['url']}/#{path}"
  end

  def self.get_uri(path)
    return "#{get_environment_path['uri']}/#{path}"
  end
end
