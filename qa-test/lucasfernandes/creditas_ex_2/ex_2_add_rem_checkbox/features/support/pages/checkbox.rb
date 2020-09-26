class Checkbox < SitePrism::Page
  set_url 'https://the-internet.herokuapp.com/dynamic_controls'
  element :checkbox, :xpath, "//input[@type='checkbox']" 
  element :button, '#btn'
  element :message, '#message'
end
