Before do
    visit "https://the-internet.herokuapp.com/windows" 
    Capybara.page.driver.browser.manage.window.maximize
end

After do  
    Capybara.current_session.driver.quit
 
  end