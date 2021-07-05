class CheckboxPage
  attr_accessor :driver

  # Onde e realizado o Page object da pagina para melhor manutencao
  def initialize
    @driver = $driver
    @action_button = '//*[@id="checkbox-example"]/button'
    @alet_message = 'message'
  end
  
  def open_checkbox_page
    @driver.get 'https://the-internet.herokuapp.com/dynamic_controls'
  end

  def click_on_button
    @driver.find_element(xpath: @action_button).click
  end

  def check_feedback_message
    @driver.find_element(id: @alet_message).text
  end
end
