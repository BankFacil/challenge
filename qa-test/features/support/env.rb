require 'selenium-webdriver'
require 'cucumber'

Before do
    $driver = Selenium::WebDriver.for :chrome
    $driver.manage.timeouts.implicit_wait = 10
end

After do
    $driver.quit
end
