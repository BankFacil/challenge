class NewTabPage
  attr_accessor :driver

  # Onde e realizado o Page object da pagina para melhor manutencao
  def initialize
    @driver = $driver
    @click_link = '//*[@id="content"]/div/a'
    @new_tab_text = '/html/body/div/h3' 
  end
  
  def open_page
    @driver.get 'https://the-internet.herokuapp.com/windows'
  end

  def click_on_link
    @driver.find_element(xpath: @click_link).click
  end

  def new_tab_message
    @driver.switch_to.window( driver.window_handles.last )
    @driver.find_element(xpath: @new_tab_text).text
  end
end
