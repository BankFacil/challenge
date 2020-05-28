class CheckboxPage < SitePrism::Page
  set_url 'https://the-internet.herokuapp.com/dynamic_controls'

  element :remove_button, :xpath, '//button[text()="Remove"]'
  element :add_button, :xpath, '//button[text()="Add"]'
  element :checkbox, 'input[type="checkbox"]'
  element :its_gone_message, :xpath, '//p[text()="It\'s gone!"]'
  element :its_back_message, :xpath, '//p[text()="It\'s back!"]'
end
