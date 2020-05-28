Capybara.default_driver = :selenium
Capybara.run_server = false

After do
  page.driver.browser.window_handles.each do |handle|
  page.driver.browser.switch_to.window(handle)
  page.execute_script "window.close()"
  end
end
